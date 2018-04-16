echo "******************************************"
echo "Installing Variety Apt Repo"
echo "******************************************"
echo ""

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:peterlevi/ppa

echo "******************************************"
echo "Installing Sublime Text"
echo "******************************************"
echo ""

sudo apt-get install -y apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt-get install -y sublime-text

echo "******************************************"
echo "Installing Lightdm, Openbox, and Xserver etc"
echo "******************************************"
echo ""

sudo apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings openbox obconf obmenu wicd ubuntu-drivers-common mesa-utils mesa-utils-extra compton xorg xserver-xorg nemo sakura lxappearance lxappearance-obconf feh tint2 variety variety-slideshow nitrogen plank chromium-browser firefox filezilla wget git

echo "******************************************"
echo "Installing Intel Microcode"
echo "******************************************"
echo ""

sudo apt install -y intel-microcode

echo "******************************************"
echo "Creating Autostart"
echo "******************************************"
echo ""

mkdir ~/.config/openbox
echo "compton &" >> ~/.config/openbox/autostart
echo "nitrogen --restore &" >> ~/.config/openbox/autostart
echo "tint2 &" >> ~/.config/openbox/autostart
echo "plank &" >> ~/.config/openbox/autostart


echo "******************************************"
echo "Flipping Tint2 To the Top"
echo "******************************************"
echo ""

sed -i 's/bottom/top/g' ~/.config/tint2/tint2rc

echo "******************************************"
echo "Installing Obmenu-Generator"
echo "******************************************"
echo ""

wget -o ~/obmenu-generator_0.66-1_all.deb https://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_8.0/all/obmenu-generator_0.66-1_all.deb
sudo apt install -y ./obmenu-generator_0.66-1_all.deb

echo "******************************************"
echo "Setting up Right Click Menu"
echo "******************************************"
echo ""

sudo obmenu-generator -s -c
sudo sed -i 's/geany/subl/g' schema.pl
sudo sed -i 's/geany/subl/g' config.pl
sudo sed -i 's/xterm/sukara/g' schema.pl
sudo sed -i 's/xterm/sukara/g' config.pl
sudo sed -i 's|xdg-open http://|chromium-browser|g' schema.pl
sudo obmenu-generator -s -c

echo "******************************************"
echo "Installing Tint2 Themes"
echo "******************************************"
echo ""

cd ~
git clone https://github.com/arcolinux/arcolinux-tint2-themes.git
sudo cp -a ~/arcolinux-tint2-themes/*rc ~/.config/tint2/

echo "******************************************"
echo "Installing Plank Themes"
echo "******************************************"
echo ""

cd ~
git clone https://github.com/LinxGem33/Plank-Themes
sudo cp -a ~/Plank-Themes/Plank\ Themes/* /usr/share/plank/themes/

echo "******************************************"
echo "Installing Arc Icons"
echo "******************************************"
echo ""

cd ~
git clone https://github.com/horst3180/arc-icon-theme.git
sudo mv ./arc-icon-theme/Arc/ /usr/share/icons/

echo "******************************************"
echo "Cleaning up"
echo "******************************************"
echo ""

sudo rm -r ~/arcolinux-tint2-themes
sudo rm -r ~/obmenu-generator_0.66-1_all.deb
sudo rm -r ~/Plank-Themes/
sudo rm -r ~/arc-icon-theme/
