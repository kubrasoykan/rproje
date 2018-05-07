################# DUGUMLERI OLUSTURMA ############################################################

##temiz veriden surucuVatandaslikNo  degisken alt kumesini al.
c1.df <- subset(T.df, 
                select = c(
                  "surucuVatandaslikNo"
                )
)

#c1.df'de satir tekrar etmesin 
c1.df <- unique(c1.df)

#surucuVatandaslikNo'ya drv ozniteligi ata ve c1.df'nin oznitelikli altkumelerini olustur. 
c1.df$att <- c("drv")
c1.df$type <- "TRUE"
colnames(c1.df) <- c("name","att","type" )



c2.df <- subset(T.df,
                select = c(
                  "kazaSiraNo",
                  "kazaIlceKodu"
                )
)

c2.df <- unique(c2.df)
c2.df$type <- "FALSE"

colnames(c2.df) <- c("name","att","type" )

c3.df <- subset(T.df,
                select = c(
                  "sasiNo"
                )
)

c3.df <- unique(c3.df)
c3.df$att <- c("chs")
c3.df$type <- "TRUE"

colnames(c3.df) <- c("name","att","type" )

n_df <- rbind(c1.df, c2.df, c3.df)

n_df <- n_df[!duplicated(n_df[,c("name","att","type")]),]
anyDuplicated(n_df)

n_df <- na.omit(n_df)