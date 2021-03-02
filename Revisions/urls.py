from django.urls import path
from . import views
from django.conf.urls import url
from django.contrib import admin
from .views import *

urlpatterns=[
    path('srpcRevFile',views.SRPCRevFile),
    path('revisionFinalBillSubmit',views.RevisionBillSubmit),
    path('getrevisionweeks',views.GetRevisionWeeks),
    path('dsmview-bills',views.DSMViewBills),
    path('edit-bills',views.DSMEditBills),
    path('initial-viewpayments',views.InitialViewPayments),
    path('entered-payments',views.PaymentDetails),
    path('pending-viewpayments',views.PendingPaymentDetails),
    path('approved-viewpayments',views.ApprovedPaymentDetails),
    path('view-payments',views.ViewPayments),
    path('approve-payments',views.ApprovePayments),
    path('reject-payments',views.RejectPayments)
    
]