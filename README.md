# Viper4Linux-GUI-PPA
PPA repository for the Viper4Linux GUI

## Setup
```
curl -s --compressed "https://thepbone.github.io/Viper4Linux-GUI-PPA/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/vipergui.list "https://thepbone.github.io/Viper4Linux-GUI-PPA/vipergui.list"
sudo apt update
```
## Installation
```
sudo apt install viper4linux-gui
```
