projeyi acarken 
intellij -> import project (not open) -> import project external .. > select maven > select imports maven projects autmaticly > next next

Proje yuklendikten sonra App dosyasini calistirman yeterli

yapisi:
- tabs (her bir tab icin, iceriklerini duzenlemen yeterli)
 	- CreateModelTab
	- DataTab (ornek bir csv data yukleme yaptim, bunu seninkine uyarlamaliyiz )
	- EditModelTab
	- GraphicTab
	- HomePageTab
- App.java (ana program direkt bunu calistiracaksin, her bir tab icin dosya ayri)




git icin


tum git projelerini sil pcden

daha sonra:

# projeyi indirmek icin
git clone https://github.com/kubrasoykan/rproje.git 

# indirdikten sonra yukaridaki gibi intellij'e import edersin

# kod degisigi durumunda 
git add .
git commit -am "{degisiklik mesaji}"
git push


# koddaki bir degisikligi getirmek icin (ornegin ben birsey commitledim sen almak istiyorsun)
git pull

