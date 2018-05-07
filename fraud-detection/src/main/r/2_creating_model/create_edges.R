################################## KOPRULERI OLUSTURMA ######################################
#temiz veriden surucuVatandaslikNo ve sasiNo degiskenlerinin alt kumelerini al.
e1.df <- subset(T.df, 
                select = c(
                  "surucuVatandaslikNo",
                  "sasiNo"
                )
)

#e1.df ozgun olsun.
e1.df <- unique(e1.df)

#temiz veriden sasiNo ve kazaSiraNo degiskenlerinin alt kumelerini al.
e2.df <- subset(T.df, 
                select = c(
                  "sasiNo",
                  "kazaSiraNo"
                )
)

#e2.df ozgun olsun.
e2.df <- unique(e2.df)

#Degiskenler arasindaki kopru baglantilarini olustur.
colnames(e1.df) <- c("from","to")
colnames(e2.df) <- c("from","to")


#e1.df ve e2.df'yi bir araya getir.
e.df <- rbind(e1.df, e2.df)

e.df <- dplyr::distinct(e.df)

e.df <- na.omit(e.df)

row.names(e.df) <- (1:nrow(e.df))

