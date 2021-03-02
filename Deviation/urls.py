from django.contrib import admin
from django.urls import path
from django.urls import include, path
from rest_framework import routers
from django.conf import settings
from django.conf.urls.static import static
from rest_framework.authtoken.views import ObtainAuthToken





# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    # path('DSMBACKEND/admin/', admin.site.urls),
    # path('DSMBACKEND/auth/', include('rest_framework.urls', namespace='rest_framework')),
    # path('DSMBACKEND/',include('Registration.urls')),
    # path('DSMBACKEND/DSMBACKEND/',include('Registration.api_urls')),
    # path('DSMBACKEND/file/',include('WeeklyUpload.urls')),
    # path('DSMBACKEND/react/',include('REACT.urls')),
    # path('DSMBACKEND/revisions/',include('Revisions.urls')),
    # path('DSMBACKEND/rras/',include('RRAS.urls'))

    #In Prodction time uncomment above lines and comment below ones
    path('admin/', admin.site.urls),
    path('auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('',include('Registration.urls')),
    path('api/',include('Registration.api_urls')),
    path('file/',include('WeeklyUpload.urls')),
    path('react/',include('REACT.urls')),
    path('revisions/',include('Revisions.urls')),
    path('rras/',include('RRAS.urls'))
]
