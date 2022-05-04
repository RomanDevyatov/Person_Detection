#!/bin/bash

rm -rf Person_Detection
echo "Cloning repository..."
git clone https://github.com/RomanDevyatov/Person_Detection.git

cd Person_Detection

NAME_FILE='img1.jpg'

echo "running  python3 main.py -i ./test_images/${NAME_FILE}"
python3 main.py -i ./test_images/${NAME_FILE}
echo "Program has been finished."

printf "\nComparing with expected image:"
python3 compare.py ./results/expected_image/expected_img1.jpg ./results/prepared_${NAME_FILE}

printf "\nComparing with img2.jpg (the same dimensions):"
python3 compare.py ./results/prepared_${NAME_FILE} ./test_images/img2.jpg

printf "\nFinished!\n"
