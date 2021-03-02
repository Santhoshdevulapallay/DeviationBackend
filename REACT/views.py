from django.shortcuts import render
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
# from datetime import datetime
import datetime,pdb
from django.db.models import Q
from django.views.decorators.csrf import csrf_exempt
import json,os
from Registration.models import *
from .models import *
from django.http import JsonResponse,HttpResponse
import secrets 
import string,pandas as pd
from django_http_exceptions import HTTPExceptions
from django.core import serializers
from django.db import connection
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
import tabula
from itertools import groupby 
import random, string
from django.db.models import Sum
from django.db.models import F
from django.contrib import messages
from sentry_sdk import capture_exception
from datetime import date
import logging
import openpyxl as op
# Create your views here.

def CheckingBeforeSRPCBills(request):
    try:
        form_data=json.loads(request.body)
        check_disbursement=DisbursedDate.objects.filter(year=form_data['year'],weekno=form_data['weekno']).count()

        return JsonResponse(check_disbursement,safe=False)

    except Exception as e:
        return JsonResponse('failed to get data')


def SRPCReactExcelFile(request):
    try:
        if request.method=='POST':  
            
            srpc=request.FILES['file']
            df=pd.read_excel(srpc,skiprows=1)
            
            states={'StateName':"",
            'DeviationFinal':"",
            'ProRata':"",
            'Payable To Pool/ Receviable From Pool':""}

            states1={'Entity':"",
            'DeviationAddtional':"",'DeviationAddtionalChange':"",'DeviationPostfacto':"",'DeviationNormal':"",'DeviationFinal':"",'PayableReceviable':""}
            
            popupdata=[]
            # popupdata1=[]
            
            for i in range(0,len(df)):
                
                states['StateName']=df['Entity'][i]
                
                states['DeviationFinal']=str(df['AMOUNT'][i]).replace(',','')
                states['ProRata']=str(df['AMOUNT-Pro Rata (Rs)'][i]).replace(',','')
                states['Payable To Pool/ Receviable From Pool']=df['PAYABLE(-)/RECEIVABLE(+)'][i]
                popupdata.append(states.copy())
            
           
            context=[
                {'popup':popupdata}
            ]
            
            return JsonResponse(context,safe=False)
        else:
            return HTTPExceptions(status=404)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccesssful")

def SRPCReactPdfFile(request):

    try:
        if request.method == 'POST':
            f=request.FILES['file']
            
            _dir = "Registration/static/images/SRPC/REACT"  
            name,extension = os.path.splitext(f.name)
    
            year=str(name.split("@")[0])
            weekNo=str(name.split("@")[1].split("$")[0])  # whether DSM,REACTIVE or CONGESTION
            filename=str(name.split("@")[1].split("$")[1])  # whether DSM,REACTIVE or CONGESTION
            _dir = _dir+year+'/'+'Week_No'+weekNo
      
            if not os.path.exists(_dir):
                os.makedirs(_dir)
    
            path='Registration/static/images/SRPC/REACT'+ str(year)+'/'+'Week_No'+weekNo+'/SRPC File'+filename+extension  # to store in static folder
    
    
            with open(path, 'wb+') as destination:
                for chunk in f.chunks():
                    destination.write(chunk)

            
            image_url=str(path[12:]) 
            
            store_url=SRPCREACTFiles(
                year=year,
                weekNo=weekNo,
                image_url=image_url
            )
            store_url.save()

            image_urls=list(SRPCREACTFiles.objects.filter(year=year,weekNo=weekNo).order_by('-id')[:1].all().values_list('image_url','id'))
            
            return JsonResponse(image_urls,safe=False)

            
        else:
            form = UploadFileForm()
             
            return HttpResponse("FIle not found")

    except Exception as e:
        
        return HttpResponse(e,safe=False)

def SRPCDeleteFile(request):
    try:
        row_id=json.loads(request.body)
        
        image_url=list(SRPCREACTFiles.objects.filter(id=row_id).delete())
        
        return JsonResponse("Successfully Deleted",safe=False)
    
    except Exception as e:
        return HttpResponse(e)

def ValidateJson(request):
    try:

        request_fileData=json.loads(request.body)
        # users_list=User.objects.all().values_list('registration_id__alias1','registration_id__alias2','registration_id__alias3','registration_id__alias4')
        non_users=[]
        
        for i in range(0,len(request_fileData)):
            user_exists=User.objects.filter(Q(generalentities1__alias1__icontains=request_fileData[i]['StateName'])|Q(generalentities1__alias2__icontains=request_fileData[i]['StateName'])|Q(generalentities1__alias3__icontains=request_fileData[i]['StateName'])|Q(generalentities1__alias4__icontains=request_fileData[i]['StateName'])).all()
                
            if len(user_exists)< 1:
                non_users.append(request_fileData[i]['StateName'])
                continue
            else:
                continue
        
        return JsonResponse(non_users,safe=False)
        
    except Exception as e:
        print(e)
        return HttpResponse("Error Occured")

def StoreConfigured(request):
    if request.method=="POST":
        try:
            
            request_formData=(json.loads(request.body))['formdata']
            request_fileData=(json.loads(request.body))['exceldata']
            
            for i in range(0,len(request_fileData)):
                
                reg_id=User.objects.filter(Q(generalentities1__alias1__iexact=request_fileData[i]['StateName'])|Q(generalentities1__alias2__iexact=request_fileData[i]['StateName'])|Q(generalentities1__alias3__iexact=request_fileData[i]['StateName'])|Q(generalentities1__alias4__iexact=request_fileData[i]['StateName'])).values('registration_id')
                
                if len(reg_id) <1:
                    user_register_id="SRADMIN"
                else:
                    user_register_id=reg_id[0]['registration_id']

                Image_url=list(SRPCREACTFiles.objects.filter(year=request_formData['year'],weekNo=request_formData['weekNo']).values_list('image_url'))

                if len(Image_url) >0:
                    Image_url=Image_url[0][0]
                else:
                    Image_url="No-File_Found"

                react=ReactBaseData(
                    Fin_year=request_formData['year'],
                    Week_no=request_formData['weekNo'],
                    Consider_Week_no=request_formData['weekNo'],
                    Week_startdate=datetime.datetime.strptime(request_formData['weekStartDate'][:10], '%Y-%m-%d').date(),
                    Week_enddate=datetime.datetime.strptime(request_formData['weekEndDate'][:10], '%Y-%m-%d').date(),
                    Revision_no=request_formData['revisionNo'],
                    Letter_refno=request_formData['srpcRefNo'],
                    Letter_date=datetime.datetime.strptime(request_formData['srpcLetterDate'][:10], '%Y-%m-%d').date(),
                    Payment_date=datetime.datetime.strptime(request_formData['payDueDate'][:10], '%Y-%m-%d').date(),
                    Disbursement_date=datetime.datetime.strptime(request_formData['disburseDueDate'][:10], '%Y-%m-%d').date(),
                    Lc_date=datetime.datetime.strptime(request_formData['lcDueDate'][:10], '%Y-%m-%d').date(),
                    Interest_levydate=datetime.datetime.strptime(request_formData['levyDueDate'][:10], '%Y-%m-%d').date(),
                    Entity=request_fileData[i]['StateName'],
                    DevFinal=float(request_fileData[i]['DeviationFinal'].replace(',','').replace('-','')),
                    ProRata=float(request_fileData[i]['ProRata'].replace(',','').replace('-','')),
                    Outstandings=float(request_fileData[i]['DeviationFinal'].replace(',','').replace('-','')),
                    PayableorReceivable=request_fileData[i]['Payable To Pool/ Receviable From Pool'],
                    image_url=Image_url,
                    registration_id=user_register_id
                )
                react.save()

            return JsonResponse("success",safe=False)
        
        except Exception as e:
            print(e)
            return HttpResponse(e,safe=False)

def ViewBills(request):
    try:
        
        viewbill=json.loads(request.body)
        
        if viewbill['id']=='SRADMIN':
            if viewbill['Bills']['payorreceive']=='ALL':
                all_bills=list(ReactBaseData.objects.filter(Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno']).values('id','Entity','Letter_refno','Revision_no','DevFinal','ProRata','image_url','PayableorReceivable'))
            else:
                all_bills=list(ReactBaseData.objects.filter(Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno'],PayableorReceivable=viewbill['Bills']['payorreceive']).values('id','Entity','Letter_refno','Revision_no','DevFinal','ProRata','image_url','PayableorReceivable'))

        else:
            all_bills=list(ReactBaseData.objects.filter(registration_id=viewbill['id'],Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno']).values('id','Entity','Letter_refno','Revision_no','DevFinal','ProRata','image_url','PayableorReceivable'))
        
        return JsonResponse(all_bills,safe=False)
        
    except Exception as e:
        print(e)
        return HttpResponse(e)

def UpdateBills(request):
    try:
        update_data=json.loads(request.body)
        
        ReactBaseData.objects.filter(id=update_data['id']).update(Letter_refno=update_data['Letter_refno'],Revision_no=update_data['Revision_no'],Entity=update_data['Entity'],DevFinal=update_data['DevFinal'],ProRata=update_data['ProRata'],Outstandings=update_data['DevFinal'],PayableorReceivable=update_data['PayableorReceivable'],modified_remarks=update_data['remarks'])

        return JsonResponse("Success",safe=False)
    
    except Exception as e:
        print(e)
        return HttpResponse(e)


def PaymentDetails(request):
    request_data=json.loads(request.body)
    
    try:
        uniqueid=request_data['id']
        entity_name=list(ReactBaseData.objects.filter(id=uniqueid).values('Entity','Fin_year','Week_no','DevFinal','Outstandings'))
        
        due_amount=int(entity_name[0]['Outstandings'])-int(request_data['formdata']['payamount'])
        if entity_name[0]['Outstandings'] > request_data['formdata']['payamount']:
            status='Partial'
        elif entity_name[0]['Outstandings'] == request_data['formdata']['payamount']:
            status='Complete'
        else:
            status='Excess'   
        
        if request_data['regid']=='SRADMIN':
            ps=RePaymentStatus(
                Pay_type=request_data['formdata']['paytype'],
                Pay_refno=request_data['formdata']['payrefno'],
                Pay_date=datetime.datetime.strptime(request_data['formdata']['paydate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['formdata']['payamount'],
                Dev_final=entity_name[0]['DevFinal'],
                Due_amount=due_amount,
                Paid_by="SRLDC",
                Paid_for=entity_name[0]['Entity'],
                Remarks=request_data['formdata']['remarks'],
                )
        else:
            ps=RePaymentStatus(
                Pay_type=request_data['formdata']['paytype'],
                Pay_refno=request_data['formdata']['payrefno'],
                Pay_date=datetime.datetime.strptime(request_data['paydate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['formdata']['payamount'],
                Dev_final=entity_name[0]['DevFinal'],
                Due_amount=due_amount,
                Paid_by=request_data['username'],
                Paid_for=entity_name[0]['Entity'],
                Remarks=request_data['formdata']['remarks'],
                )
        
        
        con=ReactBaseData.objects.get(id=uniqueid)
        ps.registration_id=con
        ps.save()
        
        ReactBaseData.objects.filter(id=uniqueid).update(Status=status,Outstandings=due_amount)
        
        return JsonResponse("Success",safe=False) 
        
    except Exception as e:
        print(e)
        return HttpResponse("Unsuccesful")

def InitialPayments(request):
    try:
        userData=json.loads(request.body)    
        
        if userData['reg_id']=='SRADMIN':  

            state_bills=list(ReactBaseData.objects.filter(Fin_year=userData['formdata']['year'],Week_no=userData['formdata']['weekno'],PayableorReceivable=userData['formdata']['payorreceive']).exclude(Status="Complete").values('id','Entity','Week_no','Revision_no','DevFinal','Outstandings','PayableorReceivable'))

        else:
            state_bills=list(ReactBaseData.objects.filter(Fin_year=userData['formdata']['year'],PayableorReceivable=userData['formdata']['payorreceive'],registration_id=userData['reg_id']).exclude(Status="Complete").values('id','Entity','Week_no','Revision_no','DevFinal','Outstandings','PayableorReceivable'))
                 
        generated=[
            {'Bills':state_bills}
        ]
        
        return JsonResponse(generated,safe=False)
    
    except Exception as e:
        print(e)
        return HTTPExceptions("Error occured")

def PendingPayments(request):
    try:
        userData=json.loads(request.body)    
        
        if userData['reg_id']=='SRADMIN':
            ps=list(RePaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],registration_id__Week_no=userData['formdata']['weekno'],registration_id__PayableorReceivable=userData['formdata']['payorreceive'],Status='Created').values('registration_id__Fin_year','registration_id__Week_no','Pay_type','Pay_refno','Pay_date','Pay_amount','Dev_final','Due_amount','Paid_by','Paid_for','Remarks'))
            # registration_id=userData['reg_id']   later add this 
            
        else:
            ps=list(RePaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],
            registration_id__Week_no=userData['formdata']['weekno'],
            registration_id__PayableorReceivable=userData['formdata']['payorreceive'],registration_id__registration_id=userData['reg_id'],Status='Created').values('registration_id__Fin_year','registration_id__Week_no','Pay_type','Pay_refno','Pay_date','Pay_amount','Dev_final','Due_amount','Paid_by','Paid_for','Remarks'))
        
        generated=[
            {'Bills':ps}
        ]
        
        return JsonResponse(generated,safe=False)
    
    except Exception as e:
        print(e)
        return HTTPExceptions("Error occured")


def ApprovedPayments(request):
    try:
        userData=json.loads(request.body)    
        
        if userData['reg_id']=='SRADMIN':
            ps=list(PaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],
            registration_id__Week_no=userData['formdata']['weekno'],
            registration_id__PayableorReceivable=userData['formdata']['payorreceive'],Status='Approved').values().all())
        # registration_id=userData['reg_id']   later add this 
            for i in range(0,len(ps)):
                week_no=list(ConfigureModel.objects.filter(id=ps[i]['registration_id_id']).values_list('Week_no'))
                ps[i]['Week_no']=week_no[0][0]
        else:
            ps=list(PaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],
            registration_id__Week_no=userData['formdata']['weekno'],
            registration_id__PayableorReceivable=userData['formdata']['payorreceive'],registration_id__registration_id=userData['reg_id'],Status='Approved').values().all())
            for i in range(0,len(ps)):
                week_no=list(ConfigureModel.objects.filter(id=ps[i]['registration_id_id']).values_list('Week_no'))
                ps[i]['Week_no']=week_no[0][0]
            
        generated=[
            {'Bills':ps}
        ]
        
        return JsonResponse(generated,safe=False)
    
    except Exception as e:
        print(e)
        return HTTPExceptions("Error occured")

def ViewPayments(request):
    try:
        request_data=json.loads(request.body)
        ps_status=[]
        user=str(User.objects.get(username=request_data['username']))
        
        if user =='SRADMIN':
            ps=list(RePaymentStatus.objects.filter(registration_id__Fin_year=request_data['data']['year'],registration_id__Week_no=request_data['data']['weekno'],registration_id__PayableorReceivable=request_data['data']['payorreceive'],Status=request_data['data']['status']).values().all())  
        else:
            ps=list(RePaymentStatus.objects.filter(registration_id__registration_id=user,registration_id__Fin_year=request_data['data']['year'],registration_id__Week_no=request_data['data']['weekno'],registration_id__PayableorReceivable=request_data['data']['payorreceive'],Status=request_data['data']['status']).values().all()) 

        viewpayments=[
            {'viewpayments':ps}
        ]
    except Exception as e:
        print(e)
        viewpayments=[
            {'viewpayments':e}
        ]
    return JsonResponse(viewpayments,safe=False)

def ApprovePayments(request):
    try:
        approve_payment_data=json.loads(request.body)
        result_data = [i for i in approve_payment_data['all_payments'] if i] 
        
        for i in range(0,len(result_data)):
            updated_date=datetime.datetime.strptime(result_data[i]['Pay_date'],'%Y-%m-%d').date()
            year_week=list(ReactBaseData.objects.filter(repaymentstatus__id=result_data[i]['id']).values_list('Fin_year','Week_no'))
            
            RePaymentStatus.objects.filter(id=result_data[i]['id']).update(Pay_date=updated_date,Status="Approved")
            any_outstanding=list(ReactBaseData.objects.filter(repaymentstatus__id=result_data[i]['id']).values_list('Outstandings'))

            if any_outstanding[0][0] == 0:
                ReactBaseData.objects.filter(repaymentstatus__id=result_data[i]['id']).update(Status="Complete")
        
            if approve_payment_data['consider_week'] is None:
                actual_week=year_week[0][1]
            else:
                actual_week=approve_payment_data['consider_week']
            
            ReactBaseData.objects.filter(repaymentstatus__id=result_data[i]['id']).update(Consider_Week_no=actual_week)

            REACTDuePool(
                year=year_week[0][0],
                from_year=year_week[0][0][:4],
                to_year=year_week[0][0][:2]+year_week[0][0][5:],
                actual_weekno=year_week[0][1],
                considered_weekno=actual_week,
                dueinpool=result_data[i]['Pay_amount'],
                transdate=datetime.datetime.now()
            ).save()

        return JsonResponse("successful",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccessful")
    
def RejectPayments(request):
    try:
        payment_id=json.loads(request.body)
        tot_amount=list(RePaymentStatus.objects.filter(id=payment_id['id']).values_list('Dev_final','Pay_amount'))
        actual_out=list(ReactBaseData.objects.filter(repaymentstatus__id=payment_id['id']).values_list('Outstandings'))
        total_out=actual_out[0][0]+tot_amount[0][1]   # adding total outstanding
        
        if total_out==tot_amount[0][0]:    #Nothing Paid 
            status='Notified'
        elif total_out==0:
            status='Complete'
        else:
            status='Partial'

        ReactBaseData.objects.filter(repaymentstatus__id=payment_id['id']).update(Outstandings=total_out,Status=status)
        RePaymentStatus.objects.filter(id=payment_id['id']).update(Due_amount=total_out,Status='Rejected',reject_remarks=payment_id['remarks'])

        return JsonResponse("succesful",safe=False)
    
    except Exception as e:
        print(e)
        return HttpResponse("unsuccesful",status=404)

def Disbursements(request):
    try:
        request_data=json.loads(request.body)
        dis_data=request_data['formdata']

        # start_date=list(YearCalendar.objects.filter(year=dis_data['year'],weekno=dis_data['weekno']).values_list('srpc_date'))
        # start_date=start_date[0][0].strftime('%Y-%m-%d')

        is_already_disbursed_date=ReactDisbursedDate.objects.filter(year=dis_data['year'],weekno=dis_data['weekno']).values('disbursed_date')

        if len(is_already_disbursed_date)>0:
            already_disbursed=True
            current_date=(is_already_disbursed_date[0]['disbursed_date']).strftime('%Y-%m-%d')
        else:
            already_disbursed=False
            current_date=date.today().strftime('%Y-%m-%d')
        
    
        disburse_payable=list(RePaymentStatus.objects.filter(Q(registration_id__Fin_year=dis_data['year'],registration_id__Week_no=dis_data['weekno'],registration_id__PayableorReceivable='Payable To Pool',Status='Approved')).distinct().values('registration_id__id','registration_id__Week_no','registration_id__Entity','registration_id__Letter_date','Dev_final','registration_id__Payment_date','Pay_date','Pay_amount','Due_amount'))

    
        disburse_previousweeks=list(RePaymentStatus.objects.filter(Q(registration_id__Fin_year=dis_data['year'],registration_id__Consider_Week_no=dis_data['weekno'],registration_id__PayableorReceivable='Payable To Pool',Status='Approved')).exclude(registration_id__Week_no=dis_data['weekno']).values('registration_id__id','registration_id__Week_no','registration_id__Entity','Dev_final','registration_id__Payment_date','Pay_date','Pay_amount','Due_amount'))

       
        pending_payments=list(ReactBaseData.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],PayableorReceivable='Payable To Pool',Status='Notified').values(**{'registration_id__id':F('id'),'registration_id__Week_no':F('Week_no'),'registration_id__Entity':F('Entity'),'Dev_final':F('DevFinal'),'registration_id__Payment_date':F('Payment_date')}))

        # converting to disburse_payble type list
        pending_payments_dict={ "registration_id__id":'',
                                "registration_id__Week_no":'',
                                "registration_id__Entity":'',
                                "Dev_final":'',
                                "registration_id__Payment_date":'',
                                "Pay_date":'',
                                "Pay_amount":0,
                                "Due_amount":'' }
        
        for x in pending_payments:
            x['Pay_date']=''
            x['Pay_amount']=0
            x['Due_amount']=x['Dev_final']
            disburse_payable.append(x.copy())
        
        disburse_receivable=list(ReactBaseData.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],PayableorReceivable='Receivable From Pool').values('id','Week_no','Entity','Letter_date','DevFinal','Status','Outstandings'))

        to_year=int(dis_data['year'][:2]+dis_data['year'][5:])
        
        previous_total_inpool=REACTDuePool.objects.filter(from_year__lte=dis_data['year'][:4],                to_year__lte=int(str(dis_data['year'][2:4])+str(dis_data['year'][5:7])),
                                                        considered_weekno__lt=int(dis_data['weekno'])
                                                        ).aggregate(Sum('dueinpool'))
        
        if previous_total_inpool['dueinpool__sum']==None:
            previous_total_inpool['dueinpool__sum']=0

        paid_incurrent_week=REACTDuePool.objects.filter(year=dis_data['year'],actual_weekno=dis_data['weekno']).aggregate(Sum('dueinpool'))

        prevdues_incurrent_week=REACTDuePool.objects.filter(Q(year=dis_data['year']) & Q(considered_weekno=dis_data['weekno']) & ~Q(actual_weekno=dis_data['weekno'])).aggregate(Sum('dueinpool'))
        if prevdues_incurrent_week['dueinpool__sum']==None:
            prevdues_incurrent_week['dueinpool__sum']=0
        

        summary=[
            {'disburse_pay':disburse_payable},
            {'disburse_receive':disburse_receivable},
            {'disburse_previousweeks':disburse_previousweeks},
            {'prev_total_inpool':previous_total_inpool['dueinpool__sum']},
            {'paid_incurrent_week':paid_incurrent_week['dueinpool__sum']},
            {'prevdues_incurrent_week':prevdues_incurrent_week['dueinpool__sum']},
            {'already_disbursed':already_disbursed}
        ]
        return JsonResponse(summary,safe=False)

    except Exception as e:
        return JsonResponse(e)
