#!/bin/bash
#
function cift() {
	cd /home/maybetree/DATA/me/etec/stargazing/raimad/cift
	source venv/bin/activate
	cd pcprox
	alacritty -e bash -c "nvim -S Session.vim; bash"
}

function raimad() {
	cd /home/maybetree/DATA/me/etec/stargazing/raimad
	source venv/bin/activate
	cd pcprox
	alacritty -e bash -c "nvim -S Session.vim; bash"
}

function raidoc() {
	cd /home/maybetree/DATA/me/etec/stargazing/raimad/raidoc
	source venv/bin/activate
	alacritty -e bash -c "nvim -S Session.vim; bash"
}

function lettuceleaves() {
	cd /home/maybetree/DATA/me/Programs/_food_reviews/food_reviews_py;
	source venv/bin/activate
	alacritty -e bash -c "nvim -S Session.vim; bash"

}

function lettuceleaves_worker() {
	cd /home/maybetree/DATA/me/Programs/_food_reviews/food-reviews-worker;
	source venv/bin/activate
	alacritty -e bash -c "nvim -S Session.vim; bash"

}

function ezikiel() {
	cd /home/maybetree/DATA/me/Programs/_RS/ezikiel-rs;
	alacritty -e bash -c "nvim -S Session.vim; bash"
}

function ezikiel_py() {
	cd /home/maybetree/DATA/me/Programs/ezikiel_py;
	source venv/bin/activate
	alacritty -e bash -c "nvim -S Session.vim; bash"
}

if [ -z "$1" ]; then
	echo 'raimad'
	echo 'lettuceleaves'
	echo 'lettuceleaves_worker'
	echo 'ezikiel'
	echo 'ezikiel_py'
	echo 'raidoc'
	echo 'cift'
else
	case $1 in
		raimad)
			coproc ( raimad > /dev/null 2>&1 )
			;;
		lettuceleaves)
			coproc ( lettuceleaves > /dev/null 2>&1 )
			;;
		lettuceleaves_worker)
			coproc ( lettuceleaves_worker > /dev/null 2>&1 )
			;;
		ezikiel)
			coproc ( ezikiel > /dev/null 2>&1 )
			;;
		ezikiel_py)
			coproc ( ezikiel_py > /dev/null 2>&1 )
			;;
		raidoc)
			coproc ( raidoc > /dev/null 2>&1 )
			;;
		cift)
			coproc ( cift > /dev/null 2>&1 )
			;;
	esac
fi


#flatpak run de.klayout.KLayout  & disown

