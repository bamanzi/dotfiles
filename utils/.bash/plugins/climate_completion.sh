        if [[ ! -z "$ZSH_VERSION" ]]
        then
            autoload compinit
            autoload bashcompinit
            compinit
            bashcompinit
        fi

        _climate() 
        {
            local cur prev opts
            COMPREPLY=()
            cur="${COMP_WORDS[COMP_CWORD]}"
            prev="${COMP_WORDS[COMP_CWORD-1]}"
            opts=$(cat /usr/local/bin/climate 2>/dev/null |                grep -P 'shelp\s"[^"]+"\s*"[^"]+"' |                cut -d"\"" -f2 |                cut -d" " -f1)

            if [[ ! -z "$opts" ]] && [[ "$prev" = "climate" ]]
            then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            fi
        }
        complete -F _climate climate
