from django.urls import path
from . import views


urlpatterns = [
    path('', views.index),
    path('chart/', views.chart),
    path('index/', views.index, name='index')
]


