# CS510-Midterm
## Upated Version

#### Ryan Kassab

The algorithmn might take a little longer to run because it is training on thousands of images. I had it as having 50 epochs at first, but each epoch was taking a minute, so I shortened it to 10. This should keep the idea of accuracy without losing too much of it. 

This algorithm is a CNN, or Convolutional Neural Network. CNN's are used specifically for picture recogniton and training on pcitures, or any 2D data type. The main reason for this is because computers can only take and process 1 dimensional objects when doing complex math, such as machine learning. 
CNN's having the special characteristic of reading in and processing images because it too splits up the image into matrices. Think of it as a matrix sliding through an image and processing whatever lies in that image. The result is still an image, but one with less infomation than the original. 
But since this matrix produced is also 2 dimensional, in order to use basic neural networks, the images need to be flattened which compresses all the image data into a 1 dimensional array that can then be trained through a dense network, the most basic neural networks. 

This program is a brief introduction into CNN's by training and testing it on the CIFAR10 dataset. The CIFAR10 dataset is comprised of thousands of images that consist of 10 categories. It is one of the benchmark datasets in order to test a neural network made for images. 

The model is trained to use accuracy the basis of the testing benchmark. Essentially it takes an image, analyzes and makes a predicition, the prediction is then used against the testing data to either validate or invalidate the prediction. It is very rare that a neural network is 100% accurate, but being higher than 85% accuracy is indicative of an accurate model. 
