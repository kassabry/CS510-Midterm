library(purrr)
library(tensorflow)
library(keras)
library(magick)
library(spatstat)
library(imager)



#input the dataset
cifar <- dataset_cifar10()

#creating the labels used for the pictures
class_names <- c('airplane', 'automobile', 'bird', 'cat', 'deer',
                 'dog', 'frog', 'horse', 'ship', 'truck')


# creating the training and testing sets
x_train <- cifar$train$x/255 #size is 50000,32,32,3
x_test <- cifar$test$x/255 #size is 10000, 32, 32, 3
y_train <- to_categorical(cifar$train$y, num_classes = 10) #50000, 10
y_test <- to_categorical(cifar$test$y, num_classes = 10) #10000, 10


#create the model using specific layers for a CNN
model <- keras_model_sequential() %>% 
  #convolution layer is used to analyze pictures
  layer_conv_2d(filter = 32, kernel_size = c(3,3), activation = "relu", 
                input_shape = c(32,32,3)) %>% 
  layer_conv_2d(filter = 32, kernel_size = c(3,3), activation = "relu") %>%
  #the pooling layer is used to lessen the data for each "picture" without losing too much data
  layer_max_pooling_2d(pool_size = c(2,2)) %>% 
  # the dropout layer is used to get rid of a certain amount of data randomly 
  layer_dropout(0.25) %>%
  #more dropout layers to analyze the data more
  layer_conv_2d(filter = 32, kernel_size = c(3,3), activation = "relu") %>% 
  layer_conv_2d(filter = 32, kernel_size = c(3,3), activation = "relu") %>%
  # another pooling to limit the data again
  layer_max_pooling_2d(pool_size = c(2,2)) %>% 
  
  # now the data needs to get flattened in order to get processed because the computer
  # cannot process 2 dimensional data
  layer_flatten() %>%
  # A dense layer is a basic neural network layer and since the data is now flattened it can
  # process it 
  layer_dense(512, activation = "relu") %>%
  # One more dropout layer
  layer_dropout(0.5) %>%
  
  # A final dense layer, but now the activation function of "softmax" is used for 
  # categorical problems like images 
  layer_dense(10, activation = "softmax")

#prints out the layout of the model 
summary(model)

#create the model
model %>% compile(
  # each optimizer gives different results, but adam tends to be the best
  optimizer = 'adam', 
  loss = 'categorical_crossentropy',
  # The metrics used determine what information will be saved after each epoch
  metrics = "accuracy"
)

model %>% save("cifar_cnn")
#run the model using epochs and then put into a history where more
#statistics will be available
history <- model %>% fit(
    x = x_train,
    y = y_train,
    epochs = 10,
    validation_data = list(x_test, y_test),
    suffle = TRUE
  )

#plot the accuracy models
plot(history)

#loading practice file
im <- load.image("deer_sample_img.png")
im <- im/255

# supposed to run the image above through the model to predict one of the classes
# from the class_list 
#result <- predict_classes(model, im, batch_size = NULL) - There are a lot of errors with this line
#Prints the class name the model predicts
#print(class_names[result[0]]) - Because of the code before it, this line is alos broken

