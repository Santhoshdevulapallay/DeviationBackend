from django.urls import path
from . import views
from django.conf.urls import url
from django.contrib import admin
from .views import *

urlpatterns=[
    # path('configuredData',views.WeeklyUpload)
    path('CheckingBeforeSRPCBills',views.CheckingBeforeSRPCBills),
    path('srpcFile',views.SRPCReactExcelFile),
    path('srpcPDFFile',views.SRPCReactPdfFile),
    path('deleteFile',views.SRPCDeleteFile),
    path('validateJson',views.ValidateJson),
    path('storeReactData',views.StoreConfigured),
    path('view-bills',views.ViewBills),
    path('update-bills',views.UpdateBills),
    path('initial-viewpayments',views.InitialPayments),
    path('pending-viewpayments',views.PendingPayments),
    path('approved-viewpayments',views.ApprovedPayments),
    path('payment-details',views.PaymentDetails),
    path('viewpayments',views.ViewPayments),
    path('approvepayments',views.ApprovePayments),
    path('rejectpayments',views.RejectPayments),
    path('disbursements',views.Disbursements)
]
