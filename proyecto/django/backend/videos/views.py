from django.shortcuts import render,redirect
from .models import videos,comentarios
from django.http import JsonResponse#enviar en formato json

from django.http import HttpResponse
from django.core import serializers#cambiar a formato json
from django.contrib.auth.decorators import login_required#requiere inicio de sesion
from . import forms#importar formulario para los nuevos comentarios
def index(request):
    todos_los_videos=videos.objects.all()#obtengo todos los datos de la tabla de videos
    context = {'todos_los_videos':todos_los_videos}#guardo los datos cogidos en un diccionario el cual le asigno como clave/variable 'todos_los_videos' para su futura utilizacion en la template a la que se lo pasare
    
    return render(request,'index.html',context)#envio los datos recibidos a una template renderizando lo obtenido en la tabla


def todos_videos(request):
    todos_los_videos=videos.objects.all()#obtengo todos los datos de la tabla de videos
    respuestaJson= serializers.serialize('json',todos_los_videos)#paso los datos obtenidos a un formato compatible con json
    return HttpResponse(respuestaJson, content_type="application/json")#devuelvo todos los datos que he sacado de la tabla videos en formato json

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
                return redirect('/videos')
    else:
        formulario_comentario=forms.CrearComentario()
    return render(request,'nuevo_comentario.html',{'form': formulario_comentario})

@login_required(login_url="/cuentas/login/")
def t_comentarios(request):
    todos_los_comentarios=comentarios.objects.all()
    respuestaJson= serializers.serialize('json',todos_los_comentarios)
    return HttpResponse(respuestaJson, content_type="application/json")