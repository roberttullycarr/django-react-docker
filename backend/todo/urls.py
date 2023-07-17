from django.urls import path
from .views import GetAllTodosView

urlpatterns = [
    path('', GetAllTodosView.as_view())
]