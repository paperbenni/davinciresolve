c2r(){
if [ -e "$1" ]
then
  if ffprobe ./"$1"
  then
    echo "file is video"
  else
    exit
  fi
ffmpeg -y -i "$1" -c:v mpeg4 -r ntsc-film -b:v 250000k -c:a pcm_s16le "${1%.*}.mov"
else
echo "file does not exist!"
fi
}

batchc2r(){
for $file in ./*
do
  c2r $file
done
}
