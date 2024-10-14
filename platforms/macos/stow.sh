BASEDIR=$(dirname "$0")

cd $BASEDIR

# If delete is provided as an argument, delete the symlinks
if [ "$1" == "delete" ]; then
    for folder in $(ls -d */); do
        stow --verbose --delete --target $HOME ${folder%%/}
    done
fi

if [ "$1" == "restow" ]; then
    for folder in $(ls -d */); do
        stow --verbose --restow --target $HOME ${folder%%/}
    done
fi

