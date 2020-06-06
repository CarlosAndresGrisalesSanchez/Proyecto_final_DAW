from django.shortcuts import render,redirect,get_object_or_404
from .models import videos,comentarios
from django.http import JsonResponse#enviar en formato json

from django.http import HttpResponse
from django.core import serializers#cambiar a formato json
from django.contrib.auth.decorators import login_required#requiere inicio de sesion
from . import forms#importar formulario para los nuevos comentarios
from django.views.decorators.clickjacking import xframe_options_sameorigin#cargar videos


def home(request):
    todos_los_videos=videos.objects.all()#obtengo todos los datos de la tabla de videos
    context = {'todos_los_videos':todos_los_videos}#guardo los datos cogidos en un diccionario el cual le asigno como clave/variable 'todos_los_videos' para su futura utilizacion en la template a la que se lo pasare
    #print(todos_los_videos)
    return render(request,'index.html',context)#envio los datos recibidos a una template renderizando lo obtenido en la tabla

@xframe_options_sameorigin
def video_concreto(request,id_video):
    try:#mirar si tiene comentarios        
        t_comentarios=comentarios.objects.filter(video_id=id_video)
    except:#pasarlo vacio si no tiene ningun comentario
        t_comentarios=""
    video=get_object_or_404(videos,id=id_video)#obtengo el video solicitado  
    return render(request,'videos.html',{'video':video,'comentarios':t_comentarios})

@login_required(login_url="/cuentas/login/")
def nuevo_comentario(request):
    if request.method == 'POST':
        formulario_comentario=forms.CrearComentario(request.POST,request.FILES)
        if formulario_comentario.is_valid():
            instancia=formulario_comentario.save(commit=False)
            instancia.autor=request.user
            instancia.save()
            if 'next' in request.POST:
                return redirect(request.POST.get('next'))
            else:
                return redirect('/')         
    return redirect('/')

@login_required()
def modificar_comentario(request,id_comentario):
    if request.method == 'POST':
            comentario_m=comentarios.objects.filter(pk=id_comentario).update(texto=request.POST.get('texto'))
            
            if 'next' in request.POST:
                return redirect(request.POST.get('next'))
            else:
                redirect('/')
    return redirect('/')