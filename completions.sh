_cpfrom_completions() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(compgen -W "$(ls ~/Desktop/packages)" -- $cur))
}

complete -o nospace -F _cpfrom_completions cpfrom