titanic <- read.csv(file="/Users/adrian/Documents/DataCamp/R/Graphics/titanic.csv")
head(titanic)
str(titanic)

titanic$Survived <- as.factor(titanic$Survived)
levels(titanic$Survived) <- c("Dead", "Survived")
levels(titanic$Embarked) <- c("Unknown", "Cherbough", "Queenstown", "Southampton")
str(titanic[ ,c("Embarked", "Survived")])
str(titanic)


survivedTable <- table(titanic$Survived)
par(mar=c(0,0,0,0))
pie(survivedTable, labels = c("Died", "Survived"))

male <- titanic[titanic$Sex=="male",]
female <- titanic[titanic$Sex=="female",]
par(mfrow = c(1,2))
pie(table(male$Survived), labels = c("Dead", "Survived"))
pie(table(female$Survived), labels = c("Dead", "Survived"))

summary(titanic$Age)
summary(titanic[titanic$Survived=="Dead", ]$Age)
summary(titanic[titanic$Survived=="Survived", ]$Age)


boxplot(Age ~ Sex, data = titanic,
        main="Age Distribution by Gender", 
        col = c("red", "green"), notch = T)


boxplot(Age ~ Survived, data = titanic,
        main="Age Distribution by Survival", 
        col = c("red", "green"), notch = T, ylab = "Age")