#!/bin/bash
shopt -s extglob
rm -r !("tuananh.sh"|"idol.txt")
randomimg=$(shuf -i 1-20 -n 1)
get_link_download(){
	getkeyword=$(sed -n $i'p' < idol.txt)
	getimagelink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com/search?q=$getkeyword\&tbm=isch" | sed 's/</\n</g' | grep '<img' | tail -"$randomimg"| head -1 | sed 's/.*src="\([^"]*\)".*/\1/')
	wget "$getimagelink" -O "$getday/$getkeyword.jpg"
}
create_directory(){
	gettoday=$(date +'%u')
	for ((i=1;i<=7;i++)){
		distance=`expr "$i" - "$gettoday"`
		getday=$(date -d "$distance day" +"%d-%m-%Y")
		mkdir $getday
		get_link_download
		}
}
create_directory
