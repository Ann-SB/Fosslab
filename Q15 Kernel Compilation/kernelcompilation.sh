
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.16.tar.xz
tar xvJf linux-4.16.tar.xz
sudo apt-get install libncurses5-dev libncursesw5-dev
cd linux-4.16/
sudo make menuconfig
