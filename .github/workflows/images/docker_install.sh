#
echo "update"
sudo apt-get update

# echo "install freetype"
# sudo apt-get install freetype=2.10.1-2
wget "http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype-dev_2.10.1-2_amd64.deb"
wget "http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.10.1-2_amd64.deb"
wget "http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6-dev_2.10.1-2_amd64.deb"
sudo dpkg -i libfreetype-dev_2.10.1-2_amd64.deb libfreetype6_2.10.1-2_amd64.deb libfreetype6-dev_2.10.1-2_amd64.deb

echo "remove libtiff5"
sudo apt-get purge nginx-*
sudo apt-get purge libtiff-dev libtiff5

# sudo apt-get install libtiff5=4.1.0.*
echo "wget"
wget http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff5-dev_4.1.0+git191117-2build1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff5_4.1.0+git191117-2build1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/libtiffxx5_4.1.0+git191117-2build1_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/main/libw/libwebp/libwebp6_0.6.1-2_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff-dev_4.1.0+git191117-2build1_amd64.deb
echo "install"
sudo dpkg -i ./libwebp6_0.6.1-2_amd64.deb ./libtiff5_4.1.0+git191117-2build1_amd64.deb ./libtiffxx5_4.1.0+git191117-2build1_amd64.deb ./libtiff-dev_4.1.0+git191117-2build1_amd64.deb ./libtiff5-dev_4.1.0+git191117-2build1_amd64.deb
#
