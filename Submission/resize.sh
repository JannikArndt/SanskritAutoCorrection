#! /bin/sh

# Define a function to display the help message
display_help() {
    echo "Usage: $0 <filename>"
    echo "Resize the input image to different sizes and generate corresponding output images."
}

# Check if the script is run without any arguments and display help
if [ -z "$1" ]; then
    display_help
    exit 1
fi

# Assign the filename from the first argument
filename="$1"

# Resize the image and generate output files
convert "$filename" -resize 1242x2208 -background white -flatten -gravity center -extent 1242x2208 iphone_small.png
convert "$filename" -resize 1242x2688 -background white -flatten -gravity center -extent 1242x2688 iphone_mid.png
convert "$filename" -resize 1290x2796 -background white -flatten -gravity center -extent 1290x2796 iphone_max.png