#Base settings
$targetPath = "$HOME/.config/Code/User/settings.json"
if [[ $OSTYPE == 'darwin'* ]]; then
  $targetPath = "$HOME/Library/Application Support/Code/User/settings.json"
fi
if [ -f $targetPath ]; then
  $backupPath = $targetPath + ".backup"
  if [ -f $backupPath]; then
    rm $backupPath
  fi
  cp $targetPath $backupPath
  rm $targetPath
fi
ln -s "$pwd/settings.json" $targetPath

#extensions
while read p; do
  code --install-extension $extension
done <extensions.txt
