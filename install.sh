#Base settings
echo "Symlinking your settings.json to this repos settings.json"
targetPath="$HOME/.config/Code/User/settings.json"

if [[ $OSTYPE == 'darwin'* ]]; then
  targetPath="$HOME/Library/Application Support/Code/User/settings.json"
fi

if [ -e "$targetPath" ]; then
  backupPath="$targetPath.backup"
  if [ -e "$backupPath" ]; then
    rm "$backupPath"
  fi
  cp "$targetPath" "$backupPath"
  rm "$targetPath"
fi
ln -s "$(pwd)/settings.json" "$targetPath"

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