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
    # path('', include(router.urls)),
    # path('login', views.Index),
    path('createuser',views.CreateUser),
    path('createemployee',views.EmployeeUser),
    path('upload_employeesign',views.EmployeeSign),
    # path('api-registration/', views.UserRegistration,name='api_registration'),
    path('api-token-login/', LoginAPI.as_view(), name='api_token_login'),
    path('api-token-logout/', LogoutAPI.as_view(), name='api_token_logout'),
    path('auth-token-verify/', TokenVerification),
    path('formData',views.Registration),
    path('get-mo-users',views.GetMOUsers),
    path('get-all-users',views.GetAllUsers),
    path('getallfullnames',views.GetAllFullNames),
    path('getusers',views.GetUsers),
    path('logindetails',views.UserLogin_Details),
    path('fetchData',views.FetchData),
    path('imageData',views.handle_uploaded_file),
    path('deletefile',views.DeleteFile),
    path('updateImage',views.UpdateImage),
    path('registerformimage',views.RegisterImageData),
    path('bankdetails',views.MOBankDetails),
    path('edit-details',views.FetchEditDetails),
    path('edited-details',views.EditDetails),
    path('editedpendingContacts',views.FetchAdminContacts),
    path('editedpendingBankDetails',views.FetchAdminBankDetails),
    path('final-edit-approval',views.FinalEditApproval),
    path('final-edit-rejection',views.FinalEditRejection),
    path('srldc-bankdetails',views.GetBankDetails),
    path('all-mobankdetails',views.AllBankDetails),
    path('getimageurls',views.ImageUrls),
    path('financeVerification',views.FinanceVerification),
    path('approvedForm',views.ApprovedForm),
    path('rejectedForm',views.RejectedForm),
    path('pendingUsers',views.PendingList),
    path('rejectlist',views.RejectedDetails),
    path('getaccountdetails',views.GetEditBankDetails),
    path('updatebankdetails',views.UpdateBankDetails),
    path('final-bank-approval',views.FinalBankApproval),
    path('final-bank-rejection',views.FinalBankRejection),
    path('getBankImage',views.GetBankImages)
    
]  