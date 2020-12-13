# Midterm Notes

## Categories

#### 1. Library Management
#### 2. Model/Data Understanding

# Changes Made

### 1. Library Management

With R, the packages I used, Keras and Tensorflow, have a lot of strange requirements
built into them. One of those being a python prerequisite. However, as one of my
reviewers noted, they had python installed on their computer, but "apparently it
wasn't enough". Keras and Tensorflow require not necessarily python, but conda.
In addition, they both require a specific kind of conda which is mini-conda. In
order to fix these connections, I added a section of code before calling the
libraries, which should fix the issues that individuals were having with it by
installing Keras, with Tensorflow, with the correct requirements attached. Along with that I added the install.packages code for both packages that are being used in my code. There was a note to do that in one of my reviews, so I added that along with the special installation of keras.

### 2. Model/Data Understanding

I understand I did not go in depth about the data I used or the model that it
was trained on. Given that I added a new model and data for the final, I
decided that in the markdown document that overviews my project I would add a
more comprehensive background on the models used and the data that they were
trained with (that included pictures). With this addition, I hope that it would
satisfy the main confusion regarding the project as a whole. 
