data("Fibulae")
spony<-data.frame(Fibulae)
head(spony)

p<-ggplot(spony, aes(x=Length))
p+ geom_histogram(bins = 15)

p+geom_density(fill="lightblue", alpha = 0.5, color="lightblue")


data("Handaxes")
sekery<-data.frame(Handaxes)
head(sekery)

p<-ggplot(sekery, aes(x=L))
p+ geom_histogram(bins = 40)

p<-ggplot(sekery)
p+ boxplot(aes(y=L))

data(Michelsberg)

data(Snodgrass)
pits<-data.frame(Snodgrass)
head(pits)

p<-ggplot(pits, aes(x=Length, fill=Inside))
p+geom_histogram(alpha=0.3)
p<-ggplot(pits, aes(x=Length, fill=Inside, color=Inside))
p+geom_density(alpha=0.3)

p<-ggplot(pits, aes(x=Inside, y=Length))
p+geom_boxplot()
