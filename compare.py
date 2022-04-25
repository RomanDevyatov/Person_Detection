import sys

from skimage.metrics import structural_similarity as compare_ssim
import cv2


# load the two input images
imageA = cv2.imread(sys.argv[1])
imageB = cv2.imread(sys.argv[2])
# convert the images to grayscale
grayA = cv2.cvtColor(imageA, cv2.COLOR_BGR2GRAY)
grayB = cv2.cvtColor(imageB, cv2.COLOR_BGR2GRAY)

# compute the Structural Similarity Index (SSIM) between the two
# images, ensuring that the difference image is returned
(score, diff) = compare_ssim(grayA, grayB, full=True)
diff = (diff * 255).astype("uint8")

if int(score) == 1.0:
    print("images are equal")
else:
    print("images are not equal")

print("SSIM: {}".format(score))