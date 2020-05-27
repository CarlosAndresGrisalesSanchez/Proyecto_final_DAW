from django.db import models

# Create your models here.
class videos(models.Model):
    nombre= models.CharField(max_length=100,unique=True,help_text='Titulo del video')
    fecha= models.DateTimeField(auto_now_add=True)
    imagen= models.ImageField(default='default.png',blank=True)
    video= models.FileField(default="default.mp4")
    def __str__(self):
        return self.nombre