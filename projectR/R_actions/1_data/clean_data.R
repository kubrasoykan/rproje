library(plyr)
library(dplyr)


clean.data <- function(raw.data=NULL, type = 'local'){
  
  ###############surucuVatandaslikNo 11 haneli olmalidir:
  raw.data <- dplyr::filter(raw.data, nchar(raw.data[,"surucuVatandaslikNo"]) == 11)
  
  
  ##############surucuVatandaslikNo ve kazaSiraNo yalnizca nümerik gözlemlerden olusmalidir:
  raw.data <- raw.data %>% filter(!is.na(as.numeric(raw.data[,"surucuVatandaslikNo"])))
  raw.data <- raw.data %>% filter(!is.na(as.numeric(raw.data[,"kazaSiraNo"])))
  
  
  ################plakaIlKodu 81'den büyük veya 0 olamaz 
  raw.data <- dplyr::filter(raw.data, plakaIlKodu <= "81" & plakaIlKodu != "0")
  
  #################0-100 arasi patern belirtileri filtrelenir
  raw.data <- dplyr::filter(raw.data, !grepl("\\<0 | 0 | 100\\>", surucuVatandaslikNo))
  raw.data <- dplyr::filter(raw.data, !grepl("\\<0 | 100 | 0\\>", surucuVatandaslikNo))
  raw.data <- filter(raw.data, !grepl("\\<5950448\\>", kazaSiraNo))
  
  
  ################Yinelenen degiskenler icin satirlari kaldir
  raw.data <- raw.data %>% distinct(kazaSiraNo, ilkIslemTarihi, sonIslemTarihi, kazaTarihi, ihbarTarihi, 
                                    motorNo, plakaIlKodu, plakaNo, kazaIlKodu, kazaIlceKodu, surucuVatandaslikNo)
  
  
  library(tidyr)
  
  ################ ayri ayri sutunlarda varolan tarih ve saatleri birlestir.
  raw.data <- raw.data %>% tidyr::separate(ilkIslemTarihi, c("ilkIslemTarihi", "ilkIslemTime"), sep = " ")
  raw.data <- raw.data %>% tidyr::separate(sonIslemTarihi, c("sonIslemTarihi", "sonIslemTime"), sep = " ")
  raw.data <- raw.data %>% tidyr::separate(kazaTarihi, c("kazaTarihi", "kazaTarihiTime"), sep = " ")
  raw.data <- raw.data %>% tidyr::separate(ihbarTarihi, c("ihbarTarihi", "ihbarTarihiTime"), sep = " ")
  
  
  raw.data <- raw.data %>% distinct(kazaSiraNo, ilkIslemTarihi, sonIslemTarihi, kazaTarihi, ihbarTarihi, 
                                    motorNo, plakaIlKodu, plakaNo, kazaIlKodu, kazaIlceKodu, surucuVatandaslikNo, .keep_all = TRUE)            
  
  return(raw.data)  
  
} 