#!/usr/bin/env bash

# Color files 
PFILE="$HOME/.config/polybar/colorblocks/colors.ini"
RFILE="$HOME/.config/polybar/colorblocks/scripts/rofi/colors.rasi"
textwhite="#FFFFFF"

# Change colors
change_color() {
	# polybar
	sed -i -e 's/background = #.*/background = #141C21/g' $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e 's/foreground-alt = #.*/foreground-alt = #FFFFFF/g' $PFILE
	sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    #141C21FF;
	  bg1:   ${SH8}FF;
	  bg2:   ${SH7}FF;
	  bg3:   ${SH6}FF;
	  fg:    #FFFFFFFF;
	}
	EOF
	
	polybar-msg cmd restart
}

if  [[ $1 = "--black" ]]; then
	FG="#FFFFFF"
	SH1="#FFFFFF"	SH2=textwhite	SH3="#141414"	SH4="#000000"
	SH5="#1F1F1F"	SH6="#1C1C1C"	SH7="#242424"	SH8="#000000"
	change_color
elif  [[ $1 = "--nord" ]]; then
	FG="#FFFFFF"
	SH1="#FFFFFF"	SH2=textwhite	SH3="#1C1E24"	SH4="#3B4252"
	SH5="#393e4f"	SH6="#292c36"	SH7="#3B4252"	SH8="#292c36"
	change_color
else
	cat <<- _EOF_
	No option specified, Available options:
	--amber	--blue		--blue-gray	--brown
	--cyan	--deep-orange	--deep-purple	--green
	--gray	--indigo	--light-blue	--light-green
	--lime	--orange	--pink		--purple
	--red	--teal		--yellow
	_EOF_
fi
