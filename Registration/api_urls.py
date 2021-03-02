from django.urls import path
from . import views
from django.conf.urls import url
from django.contrib import admin
from .views import *
from django.urls import include, path
from rest_framework import routers
# from rest_framework.authtoken.views import obtain_auth_token
router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)


urlpatterns=[
    path('', include(router.urls))
]  