from rest_framework import viewsets
from .models import videos,series,comentarios
from .serializer import videosSerializer,seriesSerializer,comentariosSerializer
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

class VideosViewSet(viewsets.ModelViewSet):
    queryset = videos.objects.all()
    serializer_class = videosSerializer
class SeriesViewSet(viewsets.ModelViewSet):
    queryset = series.objects.all()
    serializer_class = seriesSerializer

class ComentariosViewSet(viewsets.ModelViewSet):
    queryset = comentarios.objects.all()
    serializer_class = comentariosSerializer
    