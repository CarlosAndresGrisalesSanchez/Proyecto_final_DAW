from django.urls import path
from . import views
from rest_framework import routers
from .viewsets import VideosViewSet,ComentariosViewSet,SeriesViewSet

app_name='videos'
#router = routers.SimpleRouter()
#router.register('todos',VideosViewSet)
#router.register('series',SeriesViewSet)
#router.register('comentarios',ComentariosViewSet)


#urlpatterns=router.urls
urlpatterns = [
    path('',views.home,name='home'),#vista que cargara al entrar en /videos
    path('video/<int:id_video>',views.video_concreto,name='video'),#vista que cargara al entrar en /videos/prueba
    path('nuevo_comentario/',views.nuevo_comentario,name='nuevo_comentario'),
    #path('comentarios/',views.t_comentarios,name='comentarios'),
    path('modificar_comentario/<int:id_comentario>',views.modificar_comentario,name='modificar_comentario'),
    path('buscar/',views.buscar_serie,name='buscar_serie'),
    path('videos_serie/<int:id_serie>',views.mostrar_videos_serie,name="videos_serie"),
]
