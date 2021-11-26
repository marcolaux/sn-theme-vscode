#!/bin/sh
rm sn-vscode-theme.zip
zip -r sn-vscode-theme.zip . -x build -x .\* -x \*.zip -x node_modules/\*

if [ -z $1 ]; then
   exit 0
fi

if [ $1 = "debug" ]; then
  unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)     machine=Linux;;
      Darwin*)    machine=Mac;;
      CYGWIN*)    machine=Cygwin;;
      MINGW*)     machine=MinGw;;
      *)          machine="UNKNOWN:${unameOut}"
  esac

  if [ $machine == "Linux" ];
  then
    if [ -d "$HOME/.config/Standard Notes/Extensions/vscode-theme" ];
    then
      rm -fr "$HOME/.config/Standard Notes/Extensions/vscode-theme/"*
    else
      mkdir -p "$HOME/.config/Standard Notes/Extensions/vscode-theme"
    fi
  fi

  unzip sn-vscode-theme.zip -d "$HOME/.config/Standard Notes/Extensions/vscode-theme"
fi

exit 0