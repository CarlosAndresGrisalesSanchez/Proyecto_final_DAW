from django.shortcuts import render,redirect

from django.contrib.auth.forms import UserCreationForm,AuthenticationForm #necesario para la creacion de usuarios y para conectarse
from django.contrib.auth import login,logout #logear usuarios y deslogear
from .forms import NUser
# Create your views here.
def registrarse(request):
    if request.method == 'POST':#si alguien ha mandado los datos ya rellenados del post ira aqui para crear el nuevo usuario
        formulario= NUser(request.POST)#guardaremos el formulario enviado en una variable
        if formulario.is_valid():
            usuario=formulario.save()#guardar usuario
            login(request,usuario)#iniciar sesion del usuario creado
            return redirect('/videos')
    else:
        formulario= NUser()
    return render(request,'registrarse.html',{'form': formulario})#redirigir a la pagina de registro de usuarios

def login_u(request):#iniciar sesion de usuario
    if request.method == 'POST':
        formularioAu=AuthenticationForm(data=request.POST)
        if formularioAu.is_valid():
            usuario=formularioAu.get_user()
            if usuario is not None:
                login(request, usuario)#iniciar sesion del usuario
                        
            if 'next' in request.POST:#si ha intentado entrar a otra pagina sin loguearse vendra aqui y volvera a la misma despues de loguearse
                return redirect(request.POST.get('next'))#esto lo redirige a la pagina que habia intentado entrar sin loguearse
            else:
                return redirect('/videos')
    else:
        formularioAu=AuthenticationForm()#formulario vacio con los campos necesarios 
    return render(request,'login.html',{'form':formularioAu})

def logout_u(request):
    if request.method == 'POST':
        logout(request)
    return  redirect('/videos')