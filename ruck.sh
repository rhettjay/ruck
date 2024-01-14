repo_dirs=(dev sandbox learn)
npm_pks=()
configs=(nvim gh bat iterm tmux)
wdg=(.zshrc .zprofile)

echo "WARNING: this will overwrite your config"
echo "Would you like to proceed? (y/N)

# read in answer
rm -rf ~/.zshrc && cp ./zshrc ~/.zshrc
source ~/.zshrc

# build file structure
# if brew is setup run full otherwise evspecify
# check which things have changed local manfest


# copy nvim config
# npm install globals
# build all local dev projects under dev

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
