#monthly earning in million $ per quarter
q1 <- c(100,110,120)
q2 <- c(120,130,140)
q3 <- c(120,140,150)
q4 <- c(100,120,150)


yr_return <- matrix( c(q1,q2,q3,q4), byrow = TRUE, nrow = 4)

rownames(yr_return) <- c("Q1","Q2","Q3","Q4")
colnames(yr_return) <- c("m1","m2","m3")

yr_return

########
#D Series Earnings in Crores
d1 <- c(100, 90)
d2 <- c(150, 100)
d3 <- c(200, 120)

region_names <- c("India", "Äbroad")
d_movie_names <- c("Dhoom1", "Dhoom2", "Dhoom3")

d_movie_earnings <- matrix(c(d1, d2, d3), nrow = 3, byrow = TRUE, dimnames = list(d_movie_names,region_names))
d_movie_earnings

#sum by row i.e movie 
movie_total_earnings <- rowSums(d_movie_earnings)
movie_total_earnings

#create combined matrix
d_final_movie_earnings <- cbind(d_movie_earnings, movie_total_earnings)
d_final_movie_earnings

###
# K series earnings

k1 <- c(80,50)
k2 <- c(100,70)
k3 <- c(150,100)

k_movie_names <- c("Krish-1","Krish-2","Krish-3")
k_movie_earnings <- matrix(c(k1,k2,k3), nrow = 3, byrow = TRUE, dimnames = list(k_movie_names, region_names))
k_movie_earnings
k_all_movie_earnings <- rowSums(k_movie_earnings)
k_all_movie_earnings
k_final_movie_earnings <- cbind(k_movie_earnings, k_all_movie_earnings)
k_final_movie_earnings

#Combine both K and D series movies
Bollywood_HitSeries_movies_earnings <- rbind(d_final_movie_earnings , k_final_movie_earnings)
Bollywood_HitSeries_movies_earnings

total_region_earnings <- colSums(Bollywood_HitSeries_movies_earnings)
total_region_earnings

#average earnings in India
avg_Ind_earnings <- mean(Bollywood_HitSeries_movies_earnings[,1])
avg_Ind_earnings


#average earnings Abroad
avg_Abroad_earnings <- mean(Bollywood_HitSeries_movies_earnings[,2])
avg_Abroad_earnings

#Average earning by D series in India and abroad
avg_D_series_Ind_earnings <- mean(Bollywood_HitSeries_movies_earnings[1:3,1])
avg_D_series_Ind_earnings
