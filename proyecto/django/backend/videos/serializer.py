from rest_framework import serializers
from .models import videos,comentarios,series
class videosSerializer(serializers.ModelSerializer):
    class Meta:
        model=videos
        fields='__all__'
class seriesSerializer(serializers.ModelSerializer):
    class Meta:
        model=series
        fields='__all__'

class comentariosSerializer(serializers.ModelSerializer):
    class Meta:
        model=comentarios
        fields='__all__'