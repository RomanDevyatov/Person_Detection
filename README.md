# Person Detection 👶👩🧍

Using TensorFlow 2 Detection Model Zoo, we can easily use it for person detection task.
It provides a collection of pre-trained models on the COCO 2017 dataset, which can be downloaded from [here](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/tf2_detection_zoo.md).

## 1. What is Object Detection?
Object detection is a computer vision approach for identifying and locating things in images and videos. Object detection, in particular, creates bounding boxes around identified items, allowing us to see where they are in (and how they move through) a scene.

## 2. Importance of Object Detection
Detecting objects is a critical task in computer vision. It's used in a variety of settings, including:
- Crowd counting
- Self-driving cars
- Video surveillance
- Face detection
- Person detection
- Anomaly detection

Of course, this isn't a comprehensive list, but it does include some of the most important ways that object detection is influencing our future.
## 3. Installation
### DOCKER
#### How to build docker image from root folder of the project (you can pass it)
```cmd
# Build
docker build -f docker/Dockerfile -t romandevyatov/people_detection:latest .

# Push it to image repository
docker push romandevyatov/people_detection:latest
```
#### How to run the docker container
```cmd
# Pull the image
docker pull romandevyatov/people_detection:latest

# Run container
# 1 way (recommended)
docker run -it --rm -d romandevyatov/people_detection:latest

# 2 way with volume (you can use it to transfer some files into docker container from main system)
## For windows user
docker run -it --rm -d -v /mnt/c/Users/<your_username>/<some_created_folder_on_your_computer>:/shared_folder romandevyatov/people_detection:latest
## For Linux user
docker run -it --rm -d -v /home/<your_username>/<some_created_folder_on_your_computer>:/shared_folder romandevyatov/people_detection:latest


# Show running docker containers
docker ps

# Go inside the container
docker exec -it <container_id> bash
```

### Inside the container
#### Run the run script (it will do it all automatically)
```cmd
sh run.sh
```

This  [script](https://github.com/RomanDevyatov/Person_Detection/blob/main/run.sh)
1) Clones repository
2) Runs python main.py
3) Compares [prepared image](https://github.com/RomanDevyatov/Person_Detection/blob/main/results/expected_image/expected_img1.jpg) by SSIM

#### Exit the container
```cmd
exit
```

### Shut down the container
```cmd
docker stop -t 60 <container_id>
```

### Remove container
```cmd
docker rm <container_id>
```

### Remove image 
```cmd
# Get image id
docker images -a
docker rmi <image_id>
```

### How to run it without Docker and script file?
1. Create a new virtual environment using conda:
```cmd
conda create env -f environment.yml
```
2. Run following code line by line
```cmd
git clone https://github.com/RomanDevyatov/Person_Detection.git

cd Person_Detection

python3 main.py -i ./test_images/img1.jpg

# Comparing
python3 compare.py ./results/expected_image/expected_img1.jpg ./results/prepared_img1.jpg

python3 compare.py ./results/prepared_img1.jpg ./test_images/img2.jpg
```

## 3. DEMO?
#### Model output from an image:

<p align="center"> 
    <img src='https://github.com/RomanDevyatov/Person_Detection/blob/main/assets/img_demo.png'>
</p>

#### Model output from a video:

<p align="center"> 
    <img src="https://github.com/RomanDevyatov/Person_Detection/blob/main/assets/vid_demo.png">
</p>

#### Simply pass 0 for the video argument to run the person detection model using your webcam.
