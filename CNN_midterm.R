library(purrr)
library(tensorflow)
library(keras)

#input the dataset
cifar <- dataset_cifar10()

#creating the labels used for the pictures
class_names <- c('airplane', 'automobile', 'bird', 'cat', 'deer',
                 'dog', 'frog', 'horse', 'ship', 'truck')
index <- 1:30

#using the index to create the x train and y train sets
cifar$train$x[index,,,] %>% 
  purrr::array_tree(1) %>%
  purrr::set_names(class_names[cifar$train$y[index] + 1])


#create the model using specific layers for a CNN
model <- keras_model_sequential() %>% 
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = "relu", 
                input_shape = c(32,32,3)) %>% 
  layer_max_pooling_2d(pool_size = c(2,2)) %>% 
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = "relu") %>% 
  layer_max_pooling_2d(pool_size = c(2,2)) %>% 
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = "relu")

#prints out the layout of the model 
summary(model)

#flattens the model so the pictures can be correctly analyzed
model %>% 
  layer_flatten() %>% 
  layer_dense(units = 64, activation = "relu") %>% 
  layer_dense(units = 10, activation = "softmax")

#create the model
model %>% compile(
  optimizer = 'adam', 
  loss = 'categorical_crossentropy',
  metrics = c('accuracy')
)

#run the model using epochs and then put into a history where more
#statistics will be available
history <- model
  fit(
    x = cifar$train$x, 
    y = cifar$train$y,
    epochs = 50,
    validation_data = unname(cifar$test),
    verbose = 2
  )

#plot the accuracy models
plot(history)

