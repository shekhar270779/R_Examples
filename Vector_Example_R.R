#Example of Vector in R

#lets say marks of following 3 subjects are considered for merit list 
sub_names <- c("Phy", "Chem", "Math")

#marks obtained in sem1 in above 3 subjects
sub_marks_sem1 <- c(50, 75, 65)

#marks obtained in sem2 in above 3 subjects
sub_marks_sem2 <- c(60, 70, 80)

#name sem1 and sem2 marks for subjects
names(sub_marks_sem1) <- sub_names
names(sub_marks_sem2) <- sub_names

#calculate total marks obtained in sem1, sem2, year
tot_marks_sem1 <- sum(sub_marks_sem1)
tot_marks_sem2 <- sum(sub_marks_sem2)
tot_marks_yr <- tot_marks_sem1 + tot_marks_sem2

#show sem1 marks
sub_marks_sem1
#show total marks obtained in sem1
tot_marks_sem1

#show sem2 marks
sub_marks_sem2
#show total marks obtained in sem2
tot_marks_sem2

#show total marks obtained in a year
tot_marks_yr

#find avg marks obtained in Phy in both sem
avg_marks_Phy <- mean(sub_marks_sem1["Phy"], sub_marks_sem2["Phy"])
avg_marks_Phy

#show marks of Phy and Chem of sem1
sub_marks_sem1[c(1,2)]
sub_marks_sem1[c("Phy","Chem")]

#show marks of first three subjects of sem1
sub_marks_sem1[1:3]

#find sub in which distinction got in sem1
distinction_sem1_sub <- sub_marks_sem1 >=75
distinction_sem1_sub

#for subjects which got distinction, find their marks
distinction_sem1_sub_marks <- sub_marks_sem1[distinction_sem1_sub]
distinction_sem1_sub_marks

#average marks in Chem
avg_marks_Chem <- mean(sub_marks_sem1["Chem"],sub_marks_sem2["Chem"])
avg_marks_Chem

#which sub got distinction in sem2
distinction_sem2_sub <- sub_marks_sem2 >=75
distinction_sem2_sub_marks <- sub_marks_sem2[distinction_sem2_sub]
distinction_sem2_sub_marks

#average marks in maths
avg_marks_Math <- mean(sub_marks_sem1["Math"], sub_marks_sem2["Math"])
avg_marks_Math

avg_marks <- c(avg_marks_Phy,avg_marks_Chem, avg_marks_Math)
names(avg_marks) <- sub_names
avg_marks

#find which sub has max avg marks
max(avg_marks)

#find which sub has min avg marks
min(avg_marks)