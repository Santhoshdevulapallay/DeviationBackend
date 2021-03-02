from django.urls import path
from . import views
from django.conf.urls import url
from django.contrib import admin
from .views import *

urlpatterns=[
    
    path('getbalamount',views.GetBalAmountPool),
    
]