from rest_framework import serializers
from .models import videos
class videosSerializer(serializers.ModelSerializer):
    class Meta:
        model=videos
        fields='__all__'
