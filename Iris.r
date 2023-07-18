install.packages("stats")
install.packages("dplyr")
library(stats)
library(dplyr)
mydata = iris
str(mydata)
#str will give the string type of the parameters in the dataset
# Factor is R's way of saying category
sl = mydata$Sepal.Length
# sepal length now stored in object sl
mean(sl)
median(sl)
sd(sl)
# calculates standard deviation of sepal length
var(sl)
# calculates the variance of sepal length
quantile(sl)
# calculates interquartile range of sepal length
# the code above is an introduction to the basics of summarisation
#Data Visualisation
# histograms for numeric variables, and bar charts for categories
str(mydata)
Species = mydata$Species
hist(sl)
# creates histogram for sepal length
# before creating bar chart for species category, we need to make a table
table(Species)
barplot(table(Species))
#normalisation
str(mydata)
mydata_numeric = select(mydata,c(1,2,3,4))
#the first four columns are numeric, and they have been stored in a new object, specified above
Zscore_mydata = scale(mydata_numeric)
#Scatter plot of Sepal Length vs. Sepal Width using the ggplot2 package
library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(x = "Sepal Length", y = "Sepal Width", color = "Species")
# geom_point adds a layer of points to the plot, creating the scatter plot
# ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)): This sets up the initial ggplot object and specifies the data frame (iris) and the aesthetic mappings (aes) for the x-axis (Sepal.Length), y-axis (Sepal.Width), and color (Species).
# labs(x = "Sepal Length", y = "Sepal Width", color = "Species"): This sets the labels for the x-axis, y-axis, and the color legend.
View(Zscore_mydata)
# Example: Histogram of Petal Length by Species
ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.2, alpha = 0.7) +
  labs(x = "Petal Length", fill = "Species")
# ggplot(iris, aes(x = Petal.Length, fill = Species)): This sets up the ggplot object and specifies the data frame (iris) and the aesthetic mappings (aes) for the x-axis (Petal.Length) and the fill color (Species).
# geom_histogram(binwidth = 0.2, alpha = 0.7): This adds a layer of bars to the plot, creating a histogram. The binwidth parameter determines the width of the histogram bins, and the alpha parameter sets the transparency level of the bars.
# labs(x = "Petal Length", fill = "Species"): This sets the label for the x-axis as "Petal Length" and the legend label for the fill color as "Species".
ggplot(iris, aes(x = Species, y = Petal.Width, fill = Species)) +
  geom_boxplot() +
  labs(x = "Species", y = "Petal Width", fill = "Species")
# Boxplot of Petal Width by Species
iris_summary <- iris %>%
  group_by(Species) %>%
  summarize(Mean_Sepal_Length = mean(Sepal.Length))
# iris_summary: This creates a new object called iris_summary to store the summary dataframe.
# iris %>%: This uses the pipe operator (%>%) from the magrittr package to pipe the iris dataset into the subsequent operations.
# group_by(Species): This groups the data by the "Species" variable, so subsequent calculations will be performed separately for each species.
# summarize(Mean_Sepal_Length = mean(Sepal.Length)): This calculates the mean sepal length (mean(Sepal.Length)) for each species and creates a new variable called "Mean_Sepal_Length" in the resulting summary dataframe.