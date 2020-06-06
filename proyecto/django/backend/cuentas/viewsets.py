
from django.contrib.auth.models import User
from rest_framework import  viewsets
from .serializer import UserSerializer
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
class UserViewSet(viewsets.ModelViewSet):#para poder visualizar los usuarios
    queryset = User.objects.all()
    serializer_class = UserSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)#comprobar si se ha autenticar