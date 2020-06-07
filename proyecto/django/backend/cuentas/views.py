from django.shortcuts import render,redirect

from django.contrib.auth.forms import UserCreationForm,AuthenticationForm #necesario para la creacion de usuarios y para conectarse
from django.contrib.auth import login,logout #logear usuarios y deslogear
from .forms import NUser,modPass,modifi_user#forms personalizados
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib.auth.hashers import check_password,make_password,is_password_usable
# Create your views here.
#registrarse
def registrarse(request):
    if request.method == 'POST':#si alguien ha mandado los datos ya rellenados del post ira aqui para crear el nuevo usuario
        formulario= NUser(request.POST)#guardaremos el formulario enviado en una variable
        if formulario.is_valid():
            usuario=formulario.save()#guardar usuario
            login(request,usuario)#iniciar sesion del usuario creado
            return redirect('/')
    else:
        formulario= NUser()
        return render(request,'registrarse.html',{'form': formulario})#redirigir a la pagina de registro de usuarios
#iniciar sesion de usuario
def login_u(request):
    if request.method == 'POST':
        formularioAu=AuthenticationForm(data=request.POST)#rellenar formulario x defecto de autenticacion
        if formularioAu.is_valid():#mirar si es valido
            usuario=formularioAu.get_user()#coger el usuario del formulario
            if usuario is not None:
                login(request, usuario)#iniciar sesion del usuario
                        
            if 'next' in request.POST:#si ha intentado entrar a otra pagina sin loguearse vendra aqui y volvera a la misma despues de loguearse
                return redirect(request.POST.get('next'))#esto lo redirige a la pagina que habia intentado entrar sin loguearse
            else:
                return redirect('/')
    else:
        formularioAu=AuthenticationForm()#formulario vacio con los campos necesarios 
    return render(request,'login.html',{'form':formularioAu})

def logout_u(request):
    if request.method == 'POST':
        logout(request)
    return  redirect('/')
@login_required()
#mirar perfil de usuario
def mirar_perfil(request):
    usuario_m=User.objects.get(pk=request.user.id)
    return render(request,'mirar_perfil.html',{'usuario':usuario_m})
######################################################
#cambiar contraseña pero no funciona, la guarda mal
@login_required()
def modificar_p_u(request):
     if request.method == 'POST':
        formulario= modPass(request.POST)
        if formulario.is_valid():
            usuario_mod=User.objects.get(pk=request.user.id)
            if check_password(request.POST.get('password'),getattr(usuario_mod,'password')):
                if is_password_usable(request.POST.get('password')):
                    n_contraseña=make_password(request.POST.get('password1'))
                    ########## no logro cambiar bien la contraseña~#################
                    if is_password_usable(n_contraseña):
                        
                        usuario_mod.set_password(n_contraseña)
                        usuario_mod.save()
                        return render(request,'mirar_perfil.html',{'usuario':usuario_mod})
                    else:
                        return render(request,'mod_pass.html',{'usuario':usuario_mod,'error':'contraseña invalida'})
                else:
                    return render(request,'mod_pass.html',{'usuario':usuario_mod,'error':'La contraseña nueva no es válida'})
            else:
                return render(request,'mirar_perfil.html',{'usuario':request.user})
            
        formularioP=modPass()
        return render(request,'mod_pass.html',{'formulario':formularioP,'error':'no coincide la contraseña actual'})
@login_required()
def plantilla_contra_n(request):
    return render(request,'mod_pass.html',{'usuario':request.user})
##########################################################################
#modificar perfil
@login_required()
def plantilla_mod_u(request):
    return render(request,'mod_perfil.html',{'usuario':request.user})
@login_required()
def cambios_perfil(request):
        if request.method == 'POST':
            usuario_modificado=User.objects.filter(pk=request.user.id).update(last_name=request.POST.get('last_name'),first_name=request.POST.get('first_name'),email=request.POST.get('email'))
            return render(request,'mirar_perfil.html',{'usuario':request.user})         
        else:
            return render(request,'mod_perfil.html',{'usuario':request.user})