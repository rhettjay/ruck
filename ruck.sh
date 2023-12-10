repo_dirs=(dev sandbox learn)
npm_pks=()
configs=(nvim gh bat iterm tmux)
wdg=(.zshrc .zprofile)
for i in ${!repo_dirs[@]}; do
	dir=${repo_drs[$i]}
	echo "checking repos under ${dir}"
	# gh repo list ${org} --json name,latestRelease,visibility,lastUpdated | npx json | > ${file}.json
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
