#Reads the files with a specific format on a folder, creates a folder with the same name and moves the file to that folder

set -o errexit -o nounset
cd /media/Elements/Peliculas
for file in *.mp4
do
    dir="${file%.mp4}"
    mkdir -- "$dir"
    mv -- "$file" "$dir"
done

for file in *.mkv
do
    dir="${file%.mkv}"
    mkdir -- "$dir"
    mv -- "$file" "$dir"
done

for file in *.avi
do
    dir="${file%.avi}"
    mkdir -- "$dir"
    mv -- "$file" "$dir"
done

