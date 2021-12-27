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
