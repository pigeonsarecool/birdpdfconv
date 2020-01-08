
#Pre-Requisities -> Java Runtime Environment x64 (Backend), tabulizer,rJava,JavaGD(From CRAN) dplyr (For Filtering and Subsetting)

library(tabulizerjars)
library(tabulizer)
library(rJava)
library(JavaGD)
library(dplyr)

# I- Case where row/column parity is maintained
sc42<-extract_tables("C:/Users/gfwlg/Desktop/Chapter_2_Annex_1_Tariff_Schedule_GCC.pdf", method = "lattice")
sc42final<-do.call(rbind,sc42[-length(sc42)])
sc42final2<-merge(sc42final[,])
write.csv(sc42final, file='gats.csv', row.names=FALSE) #Output in csv
 

# II- Case where there is row/column mismatch in a specific entry AND the list can be isolated
ch90f<-extract_tables("C:/Chapter 90.pdf")#File Path
ch90g<-ch90f[2:22] #Subsetting out entry[[1]] which had an extra column vis-a-vis other entries#
ch90final <- do.call(rbind, ch90g[-length(ch90g)]) #Calling entries in columns to be dumped in a row form according to the length of the total matrix
write.csv(ch90final, file='Ch90.csv', row.names=FALSE) #Output in csv


# III- Case where there is mismatch in columns/rows in a specific list entry AND the list cannot be isolated
ch94<-extract_tables("C:/Chapter 94.pdf") 
ch94g<-ch94[1] #Extracting Mismatched List Entry to be pruned seperately
x4<-as.data.frame(ch94g) #Coercion to convert mismatched entry into a data frame for easy subsetting
ch94a<-x4[,c(1:5)] #Subsetting
ch94b<-ch94[2:5] #Creating second part of the table that has no issues
ch94c <- as.data.frame(do.call(rbind, ch94b[-length(ch94b)])) #Coercing into data frame for easy reconstitution later while Calling entries in columns to be dumped in a row form according to the length of the data frame
names(ch94a)<-c("X1","X2","X3","X4","X5") #Alloting column labels so that both parts can be combined into one frame
names(ch94c) <- c("X1","X2","X3","X4","X5")
ch94final<-rbind(ch94a,ch94c) #Reconstitution into a single data frame to be interpretable as a CSV
write.csv(ch94final, file='Ch94.csv', row.names=FALSE) #Writing output into a CSV


#IJPECA Failed

162
okf<-extract_tables("C:/okfile.pdf")
okff<-okf[-162]
okfff <- do.call(rbind, okff[-length(okff)])
write.csv(okfff, file='output.csv', row.names=FALSE)

 

