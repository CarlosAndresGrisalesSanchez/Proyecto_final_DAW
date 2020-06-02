from django.urls import path
from . import views
app_name='usuarios'
urlpatterns = [
    path('signup/',views.registrarse,name='registrarse'),#vista que se cargara para iniciar el registro de un nuevo usuario
    path('login/',views.login_u,name='login'),
    path('logout/',views.logout_u,name='logout'),
]