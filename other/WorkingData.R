#comments
install.packages("tidyverse")
library(tidyverse)

#how to move something from materials to portfolio (on git)
#cp ~/Documents/MICB245_materials/filename ~/Documents/MICB425_portfolio

#git reset --hard origin/master

#Load Data

read.table(file="Saanich.metadata.txt")
metadata = read.table(file="Saanich.metadata.txt", header=TRUE, row.names=1, sep="\t", na.strings=("NAN"))

read.table(file="Saanich.OTU.txt")
OTU = read.table(file="Saanich.OTU.txt", header=TRUE, row.names=1, sep="\t", na.strings=("NAN"))

#DAY 2
library(tidyverse)
#Data %>% function
#Takes data and puts it in function, like function(data) 
#Nicer because it allows you to do multiple functions and is more readable and easy to follow

#Instead of printing whole table, we just get our oxygen column
#Select is for SELECTING COLUMNS (variables)
metadata %>% 
  select(O2_uM)

#If we want to save this:
oxygen = metadata %>% 
  select(O2_uM)

#"|" means or --> selects columns with either of those terms in the name
metadata %>% 
  select(matches("O2|oxygen"))

#Filter rows (samples) where oxygen = 0
#Filter is for FILTERING ROWS (samples)
metadata %>% 
  filter(O2_uM == 0)

#Which depths have no oxygen
metadata %>% 
  filter(O2_uM == 0) %>% 
  select(Depth_m)

#Using dplyr, find at what depth(s) methane (CH4) is above 100 nM while temperature is below 10 °C. Print out a table showing only the depth, methane, and temperature data.
metadata %>% 
  select(matches("CH4|methane"))

metadata %>% 
  select(matches("temperature"))

#Variables are CH4_nM and Temperature_C

metadata %>% 
  filter(CH4_nM > 100) %>% 
  filter(Temperature_C < 10) %>% 
  select(Depth_m, CH4_nM, Temperature_C)

#OR:

metadata %>% 
  filter(CH4_nM > 100, Temperature_C < 10) %>%
  select(Depth_m, CH4_nM, Temperature_C)
  
#Variable columns are usually named Variable_unit
#Never put units in the same cell as values because you can't do math on them

#Mutate variables and convert it into a new variable (you can do any math function here)
#The last column is the new one we mutated
#Useful for plots when you want to plot mean, SD, etc.
#DON'T USE THE SAME NAME - IT WILL OVERWRITE ORIGINAL COLUMN (in the console, not in your environment)

metadata %>% 
  mutate(N2O_uM = N2O_nM/1000)
select(N2O_uM, N2O_nM)

#Exercise 3: Convert all variables that are in nM to μμM. Output a table showing only the original nM and converted μμM variables
#uses all of the functions we've used so far