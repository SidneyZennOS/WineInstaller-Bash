#!/bin/bash

function winetricks_menu() {
  echo "🍷 Winetricks:"
  echo "1) Winetricks Itself"
  echo "2) dotnet40"
  echo "3) dotnet48"
  echo "4) vcrun2019"
  echo "5) directx11"
  echo "6) d3dx11"
  echo "7) xact"
  echo "8) xinput"
  echo "9) dsound"
  echo "10) gdiplus"
  echo "11) msxml3"
  echo "12) msxml6"
  echo "13) settings win7"
  echo "14) settings win10"
  echo "15) sandbox"
  echo "16) sound=alsa"
  echo "17) fontsmooth=rgb"
  echo "18) nocrashdialog"
  echo "19) physx"
  echo "20) dinput8"
  echo "21) Winetricks GUI"
  echo "22) Back to mainmenu"

  read -p "Type a number between 1–22: " wt

  case $wt in
    1) sudo apt install -y winetricks ;;
    2) winetricks dotnet40 ;;
    3) winetricks dotnet48 ;;
    4) winetricks vcrun2019 ;;
    5) winetricks directx11 ;;
    6) winetricks d3dx11 ;;
    7) winetricks xact ;;
    8) winetricks xinput ;;
    9) winetricks dsound ;;
    10) winetricks gdiplus ;;
    11) winetricks msxml3 ;;
    12) winetricks msxml6 ;;
    13) winetricks settings win7 ;;
    14) winetricks settings win10 ;;
    15) winetricks sandbox ;;
    16) winetricks sound=alsa ;;
    17) winetricks fontsmooth=rgb ;;
    18) winetricks nocrashdialog ;;
    19) winetricks physx ;;
    20) winetricks dinput8 ;;
    21) winetricks --gui ;;
    22) main_menu ;;
    *) echo "invalid number." ;;
  esac
}

function main_menu() {
  echo "🎙️ Welcome to Wine-installer – Debian Version"
  echo "1) Wine"
  echo "2) Bottles (Flatpak)"
  echo "3) WineASIO"
  echo "4) Wine64 and Wine32"
  echo "5) mono-complete"
  echo "6) DosBox"
  echo "7) q4wine"
  echo "8) wine-staging"
  echo "9) winehq-stable"
  echo "10) PlayOnLinux"
  echo "11) wine-mono"
  echo "12) Update Wine"
  echo "13) Install Flatpak"
  echo "14) Winetricks Stuff"

  read -p "Type a number between 1–14: " choice

  case $choice in
    1) sudo apt install -y wine ;;
    2) flatpak install flathub com.usebottles.bottles ;;
    3)
      sudo apt install -y build-essential autoconf libtool git wine-development
      git clone https://github.com/timoschwarzer/wineasio.git
      cd wineasio
      ./bootstrap.sh
      ./configure --with-asiosdk=~/src/asiosdk
      make
      sudo make install
      ;;
    4)
      sudo dpkg --add-architecture i386
      sudo apt update
      sudo apt install -y wine wine64 wine32 wine32-preloader wine32-tools
      ;;
    5) sudo apt install -y mono-complete ;;
    6) sudo apt install -y dosbox ;;
    7) sudo apt install -y q4wine ;;
    8)
      sudo dpkg --add-architecture i386
      sudo apt update
      sudo mkdir -pm755 /etc/apt/keyrings
      sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
      sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources
      sudo apt update
      sudo apt install --install-recommends winehq-staging
      ;;
    9)
      sudo dpkg --add-architecture i386
      sudo apt update
      sudo mkdir -pm755 /etc/apt/keyrings
      sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
      sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources
      sudo apt update
      sudo apt install --install-recommends winehq-stable
      ;;
    10) sudo apt install -y playonlinux ;;
    11)
      wget https://dl.winehq.org/wine/wine-mono/8.1.0/wine-mono-8.1.0-x86.msi
      wine msiexec /i wine-mono-8.1.0-x86.msi
      ;;
    12)
      sudo apt update
      sudo apt upgrade wine
      ;;
    13)
      sudo apt update
      sudo apt install -y flatpak
      sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      ;;
    14) winetricks_menu ;;
    *) echo "Invalid number." ;;
  esac
}

# Startpunkt
main_menu
