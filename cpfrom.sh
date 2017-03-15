cpfrom() {

    local src=~/Desktop/packages/$1

    local blue='\033[0;34m'
    local green='\033[0;32m'
    local red='\033[0;31m'
    local nc='\033[0m'

    local cross='\xE2\x9D\x8C'
    local check='\xF0\x9F\x91\x8C'

    if [ ! -d $src ]; then
        echo -e "${red}Failed${nc}: The [${src}] directory does not exist."
        return 0
    fi

    local dest=$(pwd)
    local can_process=1
    local src_contents=$(find $src -type f -not -path '*/\.*')
    local response=""

    echo ""
    echo -e "${nc}Src: ${blue}${src}${nc}"
    echo -e "${nc}Destination: ${blue}${dest}${nc}"

    for i in $src_contents; do
        
        local corrected_path=$(echo "$i" | sed "s/${src//\//\\/}//")

        if [ -f "${dest}${corrected_path}" ]; then
            local can_copy=$(cmp --silent "${src}${corrected_path}" "${dest}${corrected_path}" && echo 'Y' || echo 'N')
        else
            local can_copy='Y'
        fi

        if [ 'N' == $can_copy ]; then
            local can_process=0
        fi

        local response="${response}\nFound: $corrected_path ("$([[ 'Y' = $can_copy ]] && echo -e "${green}OK${nc}" || echo -e "${red}NO${nc}")")"

    done

    if [ 1 == $can_process ]; then
        
        echo ""

        for i in $src_contents; do

            local corrected_path=$(echo "$i" | sed "s/${src//\//\\/}//")

            ditto "${src}${corrected_path}" "${dest}${corrected_path}" > /dev/null 2>&1

            if [ $? -ne 0 ]; then
                echo -e "${red}Failed${nc}: $i ${cross}"
            else
                echo -e "${green}Copied${nc}: $i ${check}"
            fi

        done

        echo ""

    else
        echo -e $response
        echo ""
        echo "The were problems preparing your files. Problematic files are listed above."
        echo ""
    fi

}
