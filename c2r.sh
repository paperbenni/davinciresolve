c2r(){
  
  if [ -e "$1" ]
  then
  
    if ffprobe ./"$1"
    then
      echo "file is video"
    else
      exit
  fi

    if [ -e "${1%.*}.mov" ] || [ -e ./resolve/"${1%.*}.mov" ]
    then
      echo "skipping $1"
    else
      ffmpeg -y -i "$1" -c:v mpeg4 -r ntsc-film -b:v 250000k -c:a pcm_s16le "${1%.*}.mov"
      if [ -e ./resolve ]
      then
        mv "${1%.*}.mov" resolve/"${1%.*}.mov"
      fi 
    fi
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
