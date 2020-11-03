# CS510-Midterm
## Upated Version
#### Ryan Kassab

---

The algorithmn might take a little longer to run because it is training on thousands of images. I had it as having 50 epochs at first, but each epoch was taking a minute, so I shortened it to 10. This should keep the idea of accuracy without losing too much of it. 

This algorithm is a CNN, or Convolutional Neural Network. CNN's are used specifically for picture recogniton and training on pcitures, or any 2D data type. The main reason for this is because computers can only take and process 1 dimensional objects when doing complex math, such as machine learning. 
CNN's having the special characteristic of reading in and processing images because it too splits up the image into matrices. Think of it as a matrix sliding through an image and processing whatever lies in that image. The result is still an image, but one with less infomation than the original. 
But since this matrix produced is also 2 dimensional, in order to use basic neural networks, the images need to be flattened which compresses all the image data into a 1 dimensional array that can then be trained through a dense network, the most basic neural networks. 

This program is a brief introduction into CNN's by training and testing it on the CIFAR10 dataset. The CIFAR10 dataset is comprised of thousands of images that consist of 10 categories. It is one of the benchmark datasets in order to test a neural network made for images. 

The model is trained to use accuracy the basis of the testing benchmark. Essentially it takes an image, analyzes and makes a predicition, the prediction is then used against the testing data to either validate or invalidate the prediction. It is very rare that a neural network is 100% accurate, but being higher than 85% accuracy is indicative of an accurate model. The greater amount of epochs, which is amount of times the algorithm can train itself, the greater the accuracy of the model. However, as the epochs increase at some point there is diminishing returns and the change is accuracy is almost negiglbe. Depending on the model usually 10-50 epochs is the sweet spot. 

### Running This Code

The running of this code is pretty straightforward. The code is based mainly off two libraries: keras and tensorflow. The data used, CIFAR10, comes installed with the keras package so no extra data needs to be used. 
In order to run this code, all you need to do it highlight all the code and hit run. No special instructions. 

By the end of the code, there should be two graphs that are produce each with two separate lines with tracked points. This is mainly just to demonstrate how the accuracy of the model improves overtime and how the loss decreases overtime. 

If code does not work, it could be because the basis of the packages used are python related so if you do not have python or anaconda installed it might call a few errors. The error messages that RStudio produces will most likely be the most helpful solutions. For me, the problems I ran into consisted mainly of not having miniconda installed in the right place, but once I solved that the code worked fine. If that error message doesn't come up for you, great! If it does, that would be how to solve it. 

### Testing 

The testing of this code was unable to be done using R. I ran into some problems regarding the connection between tensorflow and anaconda because tensorflow's basis is built on python. In order to demonstrate that I did infact tested the code, I attached an html file whete the exact same code, modified for python, was run in a python environment. 

The testing that was conducted was simply sending an image that would be included within the classes, but not necessarily in the dataset and having the model predict the class that the image belongs to. For this example I used an image of a deer because deers are included within the CIFAR dataset. The model then reads the image data and then predicts the image to be a deer. 
