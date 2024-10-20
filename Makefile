all:
	ls -d */ | grep -vE '^platforms' | xargs -I{} stow --verbose --target=$$HOME --restow {}

delete:
	ls -d */ | grep -vE '^platforms' | xargs -I{} stow --verbose --target=$$HOME --delete {}

linux: all
	@echo "Setting up Linux defaults..."
	@./platforms/linux/stow.sh restow

macos: all
	@echo "Setting up macOS defaults..."
	@./platforms/macos/stow.sh restow

