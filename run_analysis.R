library(dplyr)


#Define la URL de descarga y nombre de archivo 
#Define the download URL and file name


URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "CourseDataset.zip"

# realiza la descarga y descomprime el archivo
# Download and unzip the file

download.file(URL, destfile = destFile, mode='wb')
unzip(destFile)

#define el directorio de trabajo un nivel mas adentro, en la carpeta descomprimida
#Define the working directory one level deeper, in the unzipped folder

setwd("./UCI HAR Dataset")


# lee los archivos de entretamiento
# Read the training files

X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/Y_train.txt")
Sub_train <- read.table("./train/subject_train.txt")

# Lee los archivos de test
# Read test files


X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/Y_test.txt")
Sub_test <- read.table("./test/subject_test.txt")

# Lee los nombres de las variables
# Read the variable names


variable_names <- read.table("features.txt")

# Lee los nombres de las actividades
# Read the names of the activities


activity_labels <- read.table("activity_labels.txt")

#unifica los datos de test y entranamiento
#Unify test and training data

X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

#seleccional las mediciones referentes a media o std y asigna los nombres de las variables
# Select the measurements referring to mean or std and assign the names of the variables


selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total <- X_total[,selected_var[,1]]
colnames(X_total) <- variable_names[selected_var[,1],2]

# asigna  nombres descriptivos a las  actividades
# Assign descriptive names to activities

colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# agrupa por cada individuo y genera un dataset tipo tydy con la media de cada variable
# Groups for each individual and generates a dataset type t and d with the mean of each variable

colnames(Sub_total) <- "subject"
total <- cbind(X_total, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "tidydata.txt", row.names = FALSE, col.names = TRUE)
