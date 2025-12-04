import cv2
import matplotlib.pyplot as plt


image1 = plt.imread("/workdir/output/testA_1.jpg")
image2 = plt.imread("/workdir/output_test/overlay/testA_1.jpg")

eps = 1e-7
difference = cv2.subtract(image1, image2)

print("-----------")

if difference.min() < eps and difference.max() < eps:
    print("Test passed")
else:
    print("Test failed")

print("-----------")