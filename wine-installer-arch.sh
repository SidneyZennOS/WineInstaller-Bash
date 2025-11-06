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
  echo "🎙️ Wine Installer – Fedora Version"
  echo "1) Wine"
  echo "2) Bottles (Flatpak)"
  echo "3) WineASIO"
  echo "4) mono-complete"
  echo "5) DosBox"
  echo "6) q4wine"
  echo "7) PlayOnLinux"
  echo "8) wine-mono"
  echo "9) Update System"
  echo "10) Install Flatpak"
  echo "11) Winetricks Stuff"

  read -p "Choose a number (1–11): " choice
  case $choice in
    1) sudo dnf install -y wine ;;
    2) flatpak install flathub com.usebottles.bottles ;;
    3)
      sudo dnf install -y git wine-devel libtool autoconf make
      git clone https://github.com/timoschwarzer/wineasio.git
      cd wineasio
      ./bootstrap.sh
      ./configure --with-asiosdk=~/src/asiosdk
      make
      sudo make install
      ;;
    4) sudo dnf install -y mono-complete ;;
    5) sudo dnf install -y dosbox ;;
    6) sudo dnf install -y q4wine ;;
    7) sudo dnf install -y playonlinux ;;
    8)
      wget https://dl.winehq.org/wine/wine-mono/8.1.0/wine-mono-8.1.0-x86.msi
      wine msiexec /i wine-mono-8.1.0-x86.msi
      ;;
    9) sudo dnf upgrade --refresh ;;
    10)
      sudo dnf install -y flatpak
      sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      ;;
    11) winetricks_menu ;;
    *) echo "Invalid Number." ;;
  esac
}

main_menu
