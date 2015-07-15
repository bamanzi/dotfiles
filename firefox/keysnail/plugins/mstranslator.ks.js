// Info

let PLUGIN_INFO =
<KeySnailPlugin>
    <name>MSTranslator</name>
    <description>Microsoft Translator with KeySnail</description>
    <updateURL>https://gist.github.com/958/1450594/raw/mstranslator.ks.js</updateURL>
    <author>958</author>
    <version>0.0.2</version>
    <license>MIT</license>
    <include>main</include>
    <detail lang="ja"><![CDATA[
=== 使い方 ===
Microsoft Translator API を使って翻訳します

エクステ 'mstranslator-open-prompt' を実行し、プロンプトに文字列を入力すると、翻訳結果を表示します
また、ページ上のテキストを選択後同エクステを実行すると、選択されているテキストの翻訳結果を表示します
このとき、プロンプト上で Enter すると、翻訳結果をクリップボードにコピーします

翻訳元が日本語の場合は英語に翻訳し、翻訳元が日本語以外の場合は日本語に翻訳します

=== 参考 ===
以下のスクリプトを参考にしました
http://d.hatena.ne.jp/sr10/20110129/1296290450
]]></detail>
</KeySnailPlugin>;

// Option
let pOptions = plugins.setupOptions("mstranslate", {
    'panel_style': {
        preset: 'padding: 4px; border: 1px solid gray; max-width: 500px;',
        description: M({
            ja: "パネルのスタイル",
            en: "Panel style",
        })
    },
    "panel_position": {
        preset: {
            offsetX: 20,
            offsetY: -20,
            position: 'before_start',
        },
        description: M({
            ja: "パネルの位置",
            en: "Panel position",
        })
    },
}, PLUGIN_INFO);

let panel = (function() {
    const PANEL = 'ks_mstranslate_panel';

    let owner = document.getElementById("browser-bottombox");
    if (!owner) return null;

    let panel = document.getElementById(PANEL);
    let resultLabel, srcLabel, slangLabel, tlangLabel, tlangLabel, sepLabel;

    if (panel)
        panel.parentNode.removeChild(panel)

    panel = document.createElement('panel');
    panel.setAttribute('id', PANEL);
    panel.setAttribute('noautohide', 'true');
    panel.setAttribute('noautofocus', 'true');
    panel.setAttribute('style', pOptions['panel_style']);

    slangLabel = document.createElement('label');
    slangLabel.setAttribute('flex', '1');
    srcLabel = document.createElement('label');
    srcLabel.setAttribute('flex', '1');
    srcLabel.setAttribute('style', 'padding-left: 10px');
    tlangLabel = document.createElement('label');
    tlangLabel.setAttribute('flex', '1');
    resultLabel = document.createElement('label');
    resultLabel.setAttribute('flex', '1');
    resultLabel.setAttribute('style', 'padding-left: 10px');

    panel.appendChild(slangLabel);
    panel.appendChild(srcLabel);
    panel.appendChild(tlangLabel);
    panel.appendChild(resultLabel);
    owner.appendChild(panel);

    hide();

    function hide()
        panel.hidePopup();

    function show(slang, src, tlang, result) {
        hide();
        if (result.length > 0) {
            slangLabel.textContent = slang + ' :';
            srcLabel.textContent = src;
            tlangLabel.textContent = tlang + ' :';
            resultLabel.textContent = result;
            panel.openPopup(owner,
                pOptions['panel_position'].position || 'before_start',
                pOptions['panel_position'].offsetX || 20,
                pOptions['panel_position'].offsetY || -20,
                false, false);
        }
    }

    let self = {
        hide: hide,
        show: show,
    };
    return self;
})();

let translator = (function() {
    const detectURL = "http://api.microsofttranslator.com/V2/Ajax.svc/Detect?appId=%id&text=%s";
    const transURL = "http://api.microsofttranslator.com/V2/Ajax.svc/Translate?appId=%id&text=%s&to=%to";
    const apikey = "3C9778666C5BA4B406FFCBEE64EF478963039C51";

    return {
        LANG_JA: 'ja',
        LANG_EN: 'en',

        detect: function(word, next) {
            let ep = detectURL.replace('%id', apikey).replace('%s', encodeURIComponent(word));
            util.httpGet(ep, false, function (res) {
                if (res.status === 200)
                    next(JSON.parse(res.responseText));
                else
                    next();
            });
        },

        translate: function(word, target, next) {
            let ep = transURL.replace('%id', apikey).replace('%s', encodeURIComponent(word)).replace('%to', target);
            util.httpGet(ep, false, function (res) {
                if (res.status === 200)
                    next(JSON.parse(res.responseText));
                else
                    next();
            });
        }
    };
})();

plugins.mstranslator = translator;

// Add ext
plugins.withProvides(function(provide){
    provide('mstranslator-open-prompt', function(ev, arg){
        let prevText = "";
        let lastTranslated = "";

        let requestTimer;

        let initialInput = (document.commandDispatcher.focusedWindow || gBrowser.contentWindow).getSelection().toString();
        prompt.reader({
            message         : "Input word or sentence :",
            initialinput    : initialInput,
            onChange        : function (arg) {
                if (requestTimer) {
                    clearTimeout(requestTimer);
                    requestTimer = null;
                }
                let word = arg.textbox.value.trim();
                if (word.length == 0) {
                    panel.hide();
                    prevText = word;
                    return;
                }
                if (word !== prevText)
                    requestTimer = setTimeout(function() {
                        lookupword(prevText = word);
                    }, 500);
            },
            onFinish        : function ()
                panel.hide(),
            callback: function (s)
                command.setClipboardText(lastTranslated),
        });
        if (initialInput.length > 0) 
            lookupword(prevText = initialInput);

        function echo(slang, src, tlang, result) {
            display.echoStatusBar("");
            panel.show(slang, src, tlang, result);
        }

        function lookupword(word) {
            display.echoStatusBar("getting...");
            translator.detect(word, function(slang) {
                if (!slang)
                    display.echoStatusBar("Error !");
                else if (slang == translator.LANG_JA)
                    target = translator.LANG_EN;
                else
                    target = translator.LANG_JA;
                translator.translate(word, target, function (translated) {
                    if (translated)
                        echo(slang, word, target, lastTranslated = translated)
                    else {
                        display.echoStatusBar("Error !");
                        panel.hide();
                    }
                });
            });
        }
    }, M({en:'MSTranslator - Open prompt', ja:'MSTranslator - プロンプトを表示'}));
}, PLUGIN_INFO);
