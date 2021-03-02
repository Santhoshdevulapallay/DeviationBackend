from django.urls import path
from . import views
from django.conf.urls import url
from django.contrib import admin
from .views import *

urlpatterns=[
    # path('configuredData',views.WeeklyUpload)
    path('CheckingBeforeSRPCBills',views.CheckingBeforeSRPCBills),
    path('srpcFile',views.SRPCFile),
    path('srpcPdfFile',views.SRPCPdfFile),
    path('deleteFile',views.DeleteFile),
    path('configuredData',FileUpload.as_view()),
    path('view-bills',views.ViewBills),
    path('monthly-surcharge-bills',views.MonthlySurchargeBills),
    path('submit-surcharge-bills',views.SubmitMonthlySurchargeBills),
    path('surcharge-bills',views.SurchargePayments),
    path('update-bills',views.UpdateBills),
    path('modify-bills',views.ModifyBills),
    path('wrer',views.WRPCERPC),
    path('storeConfigured',views.StoreConfigured),
    path('fetchConfigured',views.FetchConfigured),
    path('initial-viewpayments',views.FetchConfiguredInitial),
    path('pending-viewpayments',views.FetchConfiguredPending),
    path('approved-viewpayments',views.FetchConfiguredApproved),
    path('previousPayments',views.PreviousPayments),
    path('paymentDetails',views.PaymentDetails),
    path('Previous-Week-Payments',views.PreviousWeekPaymentDetails),
    path('surcharge-paymentDetails',views.SurchargePaymentDetails),
    path('viewpayments',views.ViewPayments),
    path('approvepayments',views.ApprovePayments),
    path('rejectpayments',views.RejectPayments),
    path('misc-payments',views.MiscPayments),
    path('int-payments',views.IntPayments),
    path('psdf-payments',views.PSDFPayments),
    path('transfer-payments',views.TransferPayments),
    path('excess-payments',views.ExcessPayments),
    path('approved-misc-payments',views.ApprovedMiscPayments),
    path('delete-misc-payments',views.DeleteMiscPayments),
    path('disbursements',views.Disbursements),
    path('finaldisbursements',views.FinalDisbursements),
    path('previous-week-disbursements',views.PreviousWeekDisbursements),
    path('temp-disbursements',views.TempDisbursements),
    path('temp-disbursements-previousweeks',views.TempDisbursementsPreviousWeeks),
    
    path('disbursementStatus',views.DisbursementStatus),
    path('getallpartial-disbursements',views.GetAllPartialDisbursed),
    path('approve-surcharge',views.ApproveSurcharge),
    path('ForwardAuth',views.ForwardAuth),
    path('ForwardAuthPreviousWeeks',views.ForwardAuthPreviousWeeks),
    path('RevertAuth',views.RevertAuth),
    path('RevertAuthPreviousWeeks',views.RevertAuthPreviousWeeks),

    path('showFile',views.ShowFile),
    path('validateJson',views.ValidateJson),
    path('chatMessages',views.ChatMessages),
    path('getMessages',views.GetMessages),
    path('chatUsers',views.ChatUserList),
    path('download-excel',views.DownloadExcel),
    path('weeklycalendar',views.WeekCalendar),
    path('ImagetoBase64',views.ImagetoBase64),
    path('PrevImagetoBase64',views.PrevImagetoBase64),
    path('createPDF',views.CreatePDF)
   
]  