#!/usr/bin/bash
printf "Program Installasi Awal Termux\n\n"

printf "Jika Ada Tampilan Meminta Perizinan, Klik 'Ok'\n\n"
sleep 2
termux-setup-storage && clear

printf "Menginstall Program Program yang Sering digunakan\n\n"
# Hanya Agar Tampilan Saat Installasi Terlihat Rapih
apt update && apt upgrade -y && clear
apt install python3 -y && clear
apt install python2 -y && clear
apt install php -y && clear
apt install ruby -y && clear
apt install figlet -y && clear
apt install nano -y && clear

python3 -m pip install mechanize bs4 requests && clear
python2 -m pip install mechanize bs4 requests && clear

gem install lolcat && clear

clear
printf "\nMenambahkan Bar Tombol\n" 
[[ ! -d ~/.termux ]] && mkdir ~/.termux

if [[ ! -f ~/.termux/termux.properties ]]; then
    echo "echo "extra-keys = [ \
    ['ESC','|','/','HOME','UP','END','PGUP','DEL'], \
    ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP'] \
    ]" > termux.properties && termux-reload-settings" > ~/.termux/termux.properties && termux-reload-settings 
else
    printf "Tombol gagal Terinstall Karena File Sudah Ada\n"
fi

printf "\nSilahkan Mulai Ulang Termux Anda\n"