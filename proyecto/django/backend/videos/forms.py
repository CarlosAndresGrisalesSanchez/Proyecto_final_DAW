from django import forms
from . import models

class CrearComentario(forms.ModelForm):
    class Meta:
        model=models.comentarios
        fields=['autor','texto','video']