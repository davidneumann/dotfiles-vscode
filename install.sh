#Base settings
echo "Symlinking all .json files for VS Code"
targetDir="$HOME/.config/Code/User/"

if [[ $OSTYPE == 'darwin'* ]]; then
  targetDir="$HOME/Library/Application Support/Code/User/"
fi

find . -name "*.json" -print0 | while read -d $'\0' file
do
  if [ -e "$targetDir/$file" ]; then
    rm "$targetDir/$file"
  fi
  ln -s "$(pwd)/$file" "$targetDir$file"
done

#extensions
echo "Installing all extensions from extensions.txt"
while read extension; do
  echo "Installing $extension"
  code --install-extension "$extension" > /dev/null
done <extensions.txt

#macos settings
if [[ $OSTYPE == 'darwin'* ]]; then
  echo "Enabling key repeat for macos"
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi