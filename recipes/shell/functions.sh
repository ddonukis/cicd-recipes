strjoin () {
    local joined=$(printf "%s," "$@") # print all args separated by commas
    printf "%s\n" "${joined/%,/}"     # remove trailing comma (%, matches commma at the end of the string)
}
