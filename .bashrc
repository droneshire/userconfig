PATH=$PATH:~/bin
export PATH="/usr/local/bin":$PATH
export PATH=$PATH:"/Applications/microchip/xc16/v1.23/bin"

export PATH="/Applications/microchip/xc32/v1.20/bin":$PATH

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

force_color_prompt=yes

gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}


export PATH=$PATH:"/Applications/microchip/xc16/v1.25/bin"
