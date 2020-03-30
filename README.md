# getting-and-cleaning-data-course-project
Coursera getting and cleaning data course project

library(dplyr)


#Define la URL de descarga y nombre de archivo 
# realiza la descarga y descomprime el archivo
download.file(URL, destfile = destFile, mode='wb')
unzip(destFile)

#define el directorio de trabajo un nivel mas adentro, en la carpeta descomprimida

# lee los archivos de entretamiento
# Lee los archivos de test
# Lee los nombres de las variables
# Lee los nombres de las actividades
#unifica los datos de test y entranamiento
#seleccional las mediciones referentes a media o std y asigna los nombres de las variables
# asigna  nombres descriptivos a las  actividades

# agrupa por cada individuo y genera un dataset tipo tydy con la media de cada variable


#Define the download URL and file name
# download and unzip the file
download.file (URL, destfile = destFile, mode = 'wb')
unzip (destFile)

#define the working directory one level deeper, in the unzipped folder

# read the training files
# Read test files
# Read the variable names
# Read the names of the activities
#unify test and training data
#select the measurements referring to mean or std and assign the names of the variables
# assign descriptive names to activities

# groups for each individual and generates a dataset type t and d with the mean of each variable
