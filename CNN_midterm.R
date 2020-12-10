library(tensorflow)
library(keras)

#input the dataset
cifar <- dataset_cifar10()

#creating the labels used for the pictures
class_names <- c('airplane', 'automobile', 'bird', 'cat', 'deer',
                 'dog', 'frog', 'horse', 'ship', 'truck')


# creating the training and testing sets for the CNN model
cnn_x_train <- cifar$train$x/255 #size is 50000,32,32,3
cnn_x_test <- cifar$test$x/255 #size is 10000, 32, 32, 3
cnn_y_train <- to_categorical(cifar$train$y, num_classes = 10) #50000, 10
cnn_y_test <- to_categorical(cifar$test$y, num_classes = 10) #10000, 10

# Reshaping the training sets into a 1 dimensional array so that a dense model
# can be used
d_x_train <- matrix(d_x_train, 60000, 784)
d_x_test <- matrix(d_x_test, 10000, 784)


#create the model using specific layers for a CNN
cnn_model <- keras_model_sequential() %>%
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
summary(cnn_model)

#create the model
cnn_model %>% compile(
  # each optimizer gives different results, but adam tends to be the best
  optimizer = 'adam',
  loss = 'categorical_crossentropy',
  # The metrics used determine what information will be saved after each epoch
  metrics = "accuracy"
)


#run the model using epochs and then put into a history where more
#statistics will be available
cnn_history_1 <- cnn_model %>% fit(
    x = cnn_x_train,
    y = cnn_y_train,
    epochs = 1,
    validation_data = list(cnn_x_test, cnn_y_test),
    shuffle = TRUE
  )

cnn_history_5 <- cnn_model %>% fit(
  x = cnn_x_train,
  y = cnn_y_train,
  epochs = 5,
  validation_data = list(cnn_x_test, cnn_y_test),
  shuffle = TRUE
)

cnn_history_10 <- cnn_model %>% fit(
  x = cnn_x_train,
  y = cnn_y_train,
  epochs = 10,
  validation_data = list(cnn_x_test, cnn_y_test),
  shuffle = TRUE
)

#plot the accuracy models
plot(cnn_history_1)
plot(cnn_history_5)
plot(cnn_history_10)



#Dense Section
# -----------------------------
# Importing the MNIST Dataset which will be used for the Dense Network
mnist <- dataset_mnist()

# creating the training and testing sets for the Dense Model
d_x_train <- mnist$train$x/255
d_x_test <- mnist$test$x/255
d_y_train <- to_categorical(mnist$train$y, num_classes = 10)
d_y_test <- to_categorical(mnist$test$y, num_classes = 10)

# Creating the model that will be trained on
dense_model <- keras_model_sequential() %>%
  # Dense layer will be used actually run the code with 2 layers each with
  # 256 nodes
  layer_dense(256, activation='relu') %>%
  layer_dense(256, activation='relu') %>%
  
  # The last dense layer will be used to categorize the output into one of the
  # 10 categories the data falls into
  layer_dense(10, activation='softmax')

# Compiling the model in order to be able to actually the run the model
dense_model %>% compile(
  
  optimizer = 'adadelta',
  loss = 'categorical_crossentropy',
  metrics = "accuracy"
)

# Fits the model based on the training and testing data with 10 epochs as a 
# standard
dense_history_10 <- dense_model %>% fit(
  x = d_x_train,
  y = d_y_train,
  epochs = 10,
  validation_data = list(d_x_test, d_y_test),
  shuffle = TRUE
)

#Plot the model results for a better idea of the results
plot(dense_history_10)