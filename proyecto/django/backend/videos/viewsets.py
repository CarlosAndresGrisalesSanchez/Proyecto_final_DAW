from rest_framework import viewsets
from .models import videos
from .serializer import videosSerializer
class VideosViewSet(viewsets.ModelViewSet):
    queryset = videos.objects.all()
    serializer_class = videosSerializer