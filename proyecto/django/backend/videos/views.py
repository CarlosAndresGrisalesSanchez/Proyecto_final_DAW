from django.shortcuts import render
from .models import videos
# Create your views here.
from django.http import HttpResponse

def index(request):
    todos_los_videos=videos.objects.all()
    context = {'todos_los_videos':todos_los_videos}
    for x in todos_los_videos:
        print (x)
    return render(request,'index.html',context)

    