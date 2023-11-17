configs=(nvim gh bat)
wdg=(.zshrc .zprofile)
for i in ${!configs[@]}; do
	config=${configs[$i]}
	echo "throwing ${config} into your rucksack..."
	cp -f -r ~/.config/${config} .
done
for i in ${!wdg[@]}; do
	item=${wdg[$i]}
	echo "copying ${item} into your rucksack..."
	cp -f -r ~/${item} .
done
