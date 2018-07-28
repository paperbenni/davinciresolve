c2r(){
if [ -e "$1" ]
then
ffmpeg -y -i "$1" -c:v mpeg4 -r ntsc-film -b:v 250000k -c:a pcm_s16le "${1%.*}.mov"
else
echo "file does not exist!"
fi
}
