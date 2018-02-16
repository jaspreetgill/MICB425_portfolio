#DS Assignment 4

#Exercise 1
#Specify geom to add data, customized as purple triangles
ggplot(metadata, aes(x=PO4_uM, y=Depth_m)) +
  geom_point(color="purple", shape=17)

#Exercise 2
#Convert temperature column from Celcius to Fahrenheit using mutate function
#Plot temperature in F vs depth
metadata %>%
  mutate(Temperature_F = 1.8*Temperature_C + 32) %>%
  ggplot() + geom_point(aes(x=Temperature_F, y=Depth_m))

#Exercise 3
#Plotting class level communities by depth by specifying the fill
#Getting rid of black lines with specifying stat as "Identity"
#Add title and axis labels with ggtitle, xlab, and ylab
plot_bar(physeq_percent, fill="Class") + 
  geom_bar(aes(fill=Phylum), stat="identity") +  
  ggtitle("Classes from 10-200m in Saanich Inlet") +
  xlab("Sample depth") + ylab("Percent relative abundance")

#Exercise 4
#Gather(new variable, variable values, column names)
#Geom_line to connect data points
#Use facet_wrap function to separate data into different graohs
#Let R scale y-axis idependently for each panel 
metadata %>% 
  gather(Nutrients_uM, uM, NH4_uM, NO2_uM, NO3_uM, O2_uM, PO4_uM, SiO2_uM, na.rm = FALSE, convert = FALSE) %>%
  ggplot() +geom_point(aes(x=Depth_m, y=uM)) + geom_line(aes(x=Depth_m, y=uM)) +
  facet_wrap(~Nutrients_uM, scales="free_y") 
