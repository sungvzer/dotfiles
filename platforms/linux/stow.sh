BASEDIR=$(dirname "$0")

cd $BASEDIR

# If delete is provided as an argument, delete the symlinks
if [ "$1" == "delete" ]; then
    for folder in $(ls -d */); do
        echo "Deleting $folder"
        stow --delete --target $HOME ${folder%%/}
    done
fi

if [ "$1" == "restow" ]; then
    for folder in $(ls -d */); do
        echo "Restowing $folder"
        stow --restow --target $HOME ${folder%%/}
    done
fi

