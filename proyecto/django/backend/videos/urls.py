from django.urls import path
from . import views
app_name='videos'
urlpatterns = [
    path('',views.index,name='index'),#vista que cargara al entrar en /videos
    path('todos/',views.todos_videos,name='todos'),#vista que cargara al entrar en /videos/prueba
    path('nuevo_comentario/',views.nuevo_comentario,name='nuevo_comentario'),
    path('comentarios/',views.t_comentarios,name='comentarios'),
]