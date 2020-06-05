from django.urls import path
from . import views
from rest_framework import routers
from .viewsets import UserViewSet
app_name='usuarios'

router = routers.SimpleRouter()#django rest framework hacer rutas
router.register('users', UserViewSet)#django rest framework registrarlas
urlpatterns=router.urls#django rest framework poder buscarlas

urlpatterns += [
    path('signup/',views.registrarse,name='registrarse'),#vista que se cargara para iniciar el registro de un nuevo usuario
    path('login/',views.login_u,name='login'),
    path('logout/',views.logout_u,name='logout'),
]