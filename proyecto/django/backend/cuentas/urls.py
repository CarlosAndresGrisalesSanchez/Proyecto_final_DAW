from django.urls import path
from . import views
from rest_framework import routers
from .viewsets import UserViewSet
from rest_framework.authtoken.views import ObtainAuthToken
#from django.views.decorators.csrf import csrf_exempt

app_name='usuarios'

#router = routers.SimpleRouter()#django rest framework hacer rutas
#router.register('users', UserViewSet)#django rest framework registrarlas
#urlpatterns=router.urls#django rest framework poder buscarlas

urlpatterns = [
 #   path(r'autenticar/',ObtainAuthToken.as_view()),
   
    path('signup/',views.registrarse,name='registrarse'),#vista que se cargara para iniciar el registro de un nuevo usuario
    path('login/',views.login_u,name='login'),
    path('logout/',views.logout_u,name='logout'),
    path('perfil/',views.mirar_perfil,name="perfil"),
    path('modificar_p/',views.modificar_p_u,name='modificar_p_u'),
    path('plantilla_p/',views.plantilla_contra_n,name='plantilla_p')

]