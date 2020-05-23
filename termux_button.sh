#!/usr/bin/bash
printf "Program Installasi Awal Termux\n\n"

printf "Jika Ada Tampilan Meminta Perizinan, Klik 'Ok'\n\n"
sleep 2
termux-setup-storage && clear

printf "Menginstall Program Program yang Sering digunakan\n\n"
# Hanya Agar Tampilan Saat Installasi Terlihat Rapih
apt update && apt upgrade -y && clear
[[ -z $(command -v python3) ]] && apt install python3 -y && clear && py3=1
[[ -z $(command -v python2) ]] && apt install python2 -y && clear && py2=1
[[ -z $(command -v php) ]] && apt install php -y && clear
[[ -z $(command -v ruby) ]] && apt install ruby -y && clear && rby=1
[[ -z $(command -v figlet) ]] && apt install figlet -y && clear
[[ -z $(command -v nano) ]] && apt install nano -y && clear

[[ $py3 == 1 ]] && python3 -m pip install mechanize bs4 requests && clear
[[ $py2 == 1 ]] && python2 -m pip install mechanize bs4 requests && clear

[[ $rby == 1 ]] && gem install lolcat && clear

clear
printf "\nMenambahkan Bar Tombol\n" 
[[ ! -d ~/.termux ]] && mkdir ~/.termux

if [[ ! -f ~/.termux/termux.properties ]]; then
    echo "extra-keys = [ \
    ['ESC','|','/','HOME','UP','END','PGUP','DEL'], \
    ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP'] \
    ]" > ~/.termux/termux.properties && termux-reload-settings 
else
    printf "Tombol gagal Terinstall Karena File Sudah Ada\n"
fi

printf "\nSilahkan Masuk lagi Setelah ini"
exit
