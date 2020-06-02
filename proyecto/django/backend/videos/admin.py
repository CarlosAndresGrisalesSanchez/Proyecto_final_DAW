from django.contrib import admin
from .models import videos,series,comentarios
# Register your models here.
admin.site.register(videos)#linea usada para poder modificar y guardar datos con el administrador de django
admin.site.register(series)#linea usada para poder modificar y guardar datos con el administrador de django
admin.site.register(comentarios)#linea usada para poder modificar y guardar datos con el administrador de django
