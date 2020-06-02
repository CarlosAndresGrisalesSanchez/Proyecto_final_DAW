from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class videos(models.Model):#nombre de la tabla que se creara en la base de datos al hacer un migrate
    nombre= models.CharField(max_length=100,unique=True,help_text='Titulo del video')#campo de texto con el nombre de cada video
    fecha= models.DateTimeField(auto_now_add=True)#campo automatico con la fecha en la cual se ha creado la nueva row en la tabla
    imagen= models.ImageField(default='default.png',blank=True)#campo tipo imagen para poder guardar la ruta de las imagenes
    video= models.FileField(default="default.mp4")#campo tipo file para guardar archivos de video
    serie= models.ForeignKey('series',on_delete=models.CASCADE,default='1')#campo para ligar esta tabla a la tabla series
    
    def __str__(self):
        return self.nombre
        
class series(models.Model):
    nombre= models.CharField(max_length=100,unique=True,help_text='Titulo de la serie')#titulo de la serie que sera unico
    fecha= models.DateTimeField(auto_now_add=True)#fecha de creacion
    ImagenPortada= models.ImageField(default='default.png',blank=True)#imagen
    def __str__(self):
        return self.nombre


class comentarios(models.Model):
    autor= models.ForeignKey(User,default=None,on_delete=models.CASCADE)
    fecha= models.DateTimeField(auto_now_add=True)
    texto= models.CharField(max_length=300)
    video= models.ForeignKey('videos',on_delete=models.CASCADE,default='1')


