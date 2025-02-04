#!/bin/sh
echo "stopping node.js if running"
killall -9 node
echo ""

cd UI
cd qortal-ui
echo "Removing previous package links..."
yarn unlink qortal-ui-core
yarn unlink qortal-ui-crypto
yarn unlink qortal-ui-plugins
echo ""

echo "Removing previous individual links..."
cd ../qortal-ui-core
# Break any previous links
yarn unlink

cd ../qortal-ui-crypto
# Break any previous links
yarn unlink

cd ../qortal-ui-plugins
# Break any previous links
yarn unlink
echo ""
#cd ../qortal-ui
#echo "Removing qortal-ui-core package..."
#yarn remove qortal-ui-core
#echo ""

#echo "Removing qortal-ui-crypto package..."
#yarn remove qortal-ui-crypto
#echo ""

#echo "Removing qortal-ui-plugins package..."
#yarn remove qortal-ui-plugins
#echo ""

echo "Removing Yarn..."
npm uninstall -g yarn
echo ""

echo "Removing any cached nodeJS versions..."
n prune
echo ""

echo "Removing Node's version manager 'n' and nodeJS..."
npm uninstall -g n
echo ""

echo "Removing Node's package manager 'NPM'..."
apt remove npm -y
echo ""

echo "Removing NodeJS..."
apt remove nodejs -y
echo ""

echo "Cleaning up nodeJS remnants..."
sudo rm -rf /usr/local/bin/npm
sudo rm -rf /usr/local/share/man/man1/node*
sudo rm -rf /usr/local/lib/dtrace/node.d
rm -rf ~/.npm
rm -rf ~/.node-gyp
sudo rm -rf /opt/local/bin/node
sudo rm -rf /opt/local/include/node
sudo rm -rf /opt/local/lib/node_modules
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/include/node*
sudo rm -rf /usr/local/bin/node*
echo ""

echo "Removing Curl..."
apt remove curl -y
echo ""

echo "Cleaning up APT..."
apt autoremove -y
apt clean
echo ""

cd ../..
echo "Removing UI folder..."
rm -R UI
echo ""

echo "UI has now been uninstalled, Goodbye!"
