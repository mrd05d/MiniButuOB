sudo apt install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings openbox obconf obmenu wicd ubuntu-drivers-common mesa-utils mesa-utils-extra compton xorg xserver-xorg nemo sakura lxappearance lxappearance-obconf feh tint2 variety nitrogen plank chromium-browser firefox filezilla git


mkdir ~/.config/openbox
echo "compton &" >> autostart
echo "nitrogen --restore &" >> autostart
echo "tint2 &" >> autostart
echo "plank &" >> autostart

sed -i 's/bottom/top/g' ~/.config/tint2/tint2rc

sudo apt-get install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt-get install sublime-text

wget https://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_8.0/all/obmenu-generator_0.66-1_all.deb
sudo apt install ./obmenu-generator_0.66-1_all.deb

sudo obmenu-generator -s -c
sudo sed -i 's/geany/subl/g' schema.pl
sudo sed -i 's/geany/subl/g' config.pl
sudo sed -i 's/xterm/sukara/g' schema.pl
sudo sed -i 's/xterm/sukara/g' config.pl
sudo sed -i 's|xdg-open http://|chromium-browser|g' schema.pl
sudo obmenu-generator -s -c

cd ~
git clone https://github.com/arcolinux/arcolinux-tint2-themes.git
sudo cp -a ~/arcolinux-tint2-themes/*rc ~/.config/tint2/

git clone https://github.com/LinxGem33/Plank-Themes
sudo cp -a ~/Plank-Themes/Plank\ Themes/* /usr/share/plank/themes/

git clone https://github.com/horst3180/arc-icon-theme.git
sudo mv ./arc-icon-theme/Arc/ /usr/share/icons/





sudo rm -r ~/arcolinux-tint2-themes
sudo rm -r ~/obmenu-generator_0.66-1_all.deb
sudo rm -r ~/Plank-Themes/
sudo rm -r ~/arc-icon-theme/Arc/
