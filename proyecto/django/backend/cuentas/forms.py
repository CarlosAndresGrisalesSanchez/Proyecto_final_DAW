from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class NUser(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ("username", "email", "password1", "password2","first_name","last_name")
class modPass(UserCreationForm):
    class Meta:
        model = User
        fields=("password1","password2","password")

   