let PLUGIN_INFO =
<KeySnailPlugin>
    <name>Encoding switcher</name>
    <description>Switch current page encoding</description>
    <description lang="ja">表示中のページのエンコードを切り替えます</description>
    <updateURL>https://gist.github.com/958/1031072/raw/encoding-switcher.js</updateURL>
    <version>0.0.3</version>
    <license>MIT</license>
    <minVersion>1.8.0</minVersion>
    <include>main</include>
    <detail lang="ja"><![CDATA[
=== これは何 ? ===
ページのエンコードを切り替えます

=== 流用元 ====
mooz's gist: 308874 — Gist
https://gist.github.com/308874
]]></detail>
</KeySnailPlugin>;

let encodings = [];

CreateMenu('browser');
CreateMenu('more-menu');

let RDF = Cc['@mozilla.org/rdf/rdf-service;1'].getService(Ci.nsIRDFService);
let RDFCU = Cc['@mozilla.org/rdf/container-utils;1'].getService(Ci.nsIRDFContainerUtils);

let cm = RDF.GetDataSource('rdf:charset-menu');
let sbService = Cc['@mozilla.org/intl/stringbundle;1'].getService(Ci.nsIStringBundleService);
let sbCharTitle = sbService.createBundle('chrome://global/locale/charsetTitles.properties');

let allEnum = cm.GetAllResources();
while (allEnum.hasMoreElements()) {
    let res = allEnum.getNext().QueryInterface(Ci.nsIRDFResource);
    let value = res.Value;
    if (RDFCU.IsContainer(cm, res) || value.indexOf('charset.') === 0 || value.indexOf('chardet.') === 0 || value.indexOf('----') === 0)
        continue;

    let label = sbCharTitle.GetStringFromName(value.toLowerCase() + '.title');
    encodings.push([value, label]);
}

encodings = encodings.sort(function ([, a], [, b]) (a === b) ? 0 : (a > b) ? 1 : -1);

plugins.withProvides(function (provide) {
     provide("set-encoding", function (ev, arg) {
        let collection;
        if (!arg) {
            let charsetMenu = document.getElementById("charsetMenu");
            charsetMenu.setAttribute('open', 'true');

            let popup = Array.slice(charsetMenu.childNodes).filter(function (i) (i.tagName.toLowerCase() == 'menupopup'))[0];
            collection = Array.slice(popup.childNodes).filter(function (item) (item.id && item.id.indexOf('charset.') == 0))
                .map(function(item) [item.id.replace('charset.', ''), item.label]);
            charsetMenu.setAttribute('open', 'false');
        } else
            collection = encodings;

        let index = 0;
        let (current = getBrowser().docShell.QueryInterface(Ci.nsIDocCharset).charset.toLowerCase())
            collection.some(function ([v, l], i) (v.toLowerCase() === current) ? (index = i, true) : false);

        prompt.selector({
            message     : M({ja: "文字エンコーディングの選択:", en: "Select charset:"}),
            collection  : collection,
            initialIndex: index,
            header      : ['Name', 'Description'],
            actions     : function(index) ((window.BrowserSetForcedCharacterSet) ? window.BrowserSetForcedCharacterSet : window.SetForcedCharset)(collection[index][0])
        });
    }, 'Set encoding');
}, PLUGIN_INFO);
