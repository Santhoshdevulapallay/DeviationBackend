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
from tabula import read_pdf
from itertools import groupby 
import random, string
from django.db.models import Sum
from django.db.models import F
from django.contrib import messages
from sentry_sdk import capture_exception
# Create your views here.
import logging
import openpyxl as op
import io
from django.http import FileResponse
from reportlab.pdfgen import canvas
from RRAS.models import *
from Revisions.models import *
from REACT.models import *

logger=logging.getLogger('django')

def ShowFile(request):
    
    request_data=json.loads(request.body)
    states={'StateName':"",
            'DeviationFinal':"",'Payable To Pool/ Receviable From Pool':""}
    popupdata=[]
    
    for i in range(1,len(request_data)):
        states['StateName']=request_data[i]['Entity']
        states['DeviationFinal']=int(request_data[i]['Deviation (Rs) Final'].replace(',',''))
        states['Payable To Pool/ Receviable From Pool']=request_data[i]['Payable To Pool/ Receviable From Pool']
        popupdata.append(states.copy())
    
    return JsonResponse(popupdata,safe=False)


def ValidateJson(request):
    try:

        request_fileData=json.loads(request.body)
        # users_list=User.objects.all().values_list('registration_id__alias1','registration_id__alias2','registration_id__alias3','registration_id__alias4')
        non_users=[]
        
        for i in range(0,len(request_fileData)):
            user_exists=User.objects.filter(Q(generalentities1__alias1__icontains=request_fileData[i]['Entity'])|Q(generalentities1__alias2__icontains=request_fileData[i]['Entity'])|Q(generalentities1__alias3__icontains=request_fileData[i]['Entity'])|Q(generalentities1__alias4__icontains=request_fileData[i]['Entity'])).all()
                
            if len(user_exists)< 1:
                non_users.append(request_fileData[i]['Entity'])
                continue
            else:
                continue
        
        # if  non_users:
        return JsonResponse({"non_users":non_users},safe=False)
        
    except Exception as e:
        print(e)
        return HttpResponse("Error Occured")



def WeeklyUpload(request):
    
    if request.method=="POST":
        key_value=request.body
        # key_value=request.body.decode("utf-8")
        
        weekly_data=json.loads(request.body)
        
        return HttpResponse('<h1>Hello wordl</h1>')
    else:
        return HTTPExceptions()


class FileUpload(APIView):
       
    
    def post(self, request, *args, **kwargs):
        try:

            # request_data=json.loads(request.body)
            
            # for i in range(1,9):
            #     Config=ConfigureData(
            #                 Entity=request_data[i]['Entity'],
            #                 DevAddtional=request_data[i]['Deviation (Rs)* Addtional'],
            #                 DevAddtionalSignChange=request_data[i]['Deviation (Rs)* Addtional for Sign Change'],
            #                 DevPostfacto=request_data[i]['Deviation (Rs)* Postfacto'],
            #                 DevNormal=request_data[i]['Deviation (Rs)* Normal'],
            #                 DevFinal=int(request_data[i]['Deviation (Rs) Final'].replace(',','')),
            #                 PayableOrReceviable=request_data[i]['Payable To Pool/ Receviable From Pool']
            #     )
            #     Config.save()

            config_data=list(ConfigureModel.objects.values())
            

            return JsonResponse(config_data, safe=False)
        except:
            return raise_exception()
        
        def raise_exception():
            raise HTTPExcetions.FORBIDDEN
        

def SRPCFile(request):

    try:
        if request.method == 'POST':
            
            f=request.FILES['file']
            
            _dir = "Registration/static/images/SRPC/"  
            name,extension = os.path.splitext(f.name)
    
            
            year=str(name.split("@")[0])
            weekNo=str(name.split("@")[1].split("$")[0])  # whether DSM,REACTIVE or CONGESTION
            filename=str(name.split("@")[1].split("$")[1])  # whether DSM,REACTIVE or CONGESTION
            _dir = _dir+year+'/'+'Week_No'+weekNo

            if not os.path.exists(_dir):
                os.makedirs(_dir)

            
            path='Registration/static/images/SRPC/'+ str(year)+'/'+'Week_No'+weekNo+'/SRPC File'+filename+extension  # to store in static folder
    
    
            with open(path, 'wb+') as destination:
                for chunk in f.chunks():
                    destination.write(chunk)

            
            image_url=str(path[12:]) 
            
            store_url=SRPCFiles(
                year=year,
                weekNo=weekNo,
                image_url=image_url
            )
            store_url.save()

            image_urls=list(SRPCFiles.objects.filter(year=year,weekNo=weekNo).order_by('-id')[:1].all().values_list('image_url','id'))
            
            return JsonResponse(image_urls,safe=False)

            
        else:
            form = UploadFileForm()
             
            return HttpResponse("FIle not found")

    except Exception as e:
        
        return HttpResponse(e,safe=False)
   
def SRPCPdfFile(request):
    try:
        if request.method=='POST':  
            
            
            srpc=request.FILES['file'].read().decode("utf-8")
            
            states1={'Entity':"",
            'DeviationAddtional':"",'DeviationAddtionalChange':"",'DeviationPostfacto':"",'DeviationNormal':"",'DeviationFinal':"",'PayableReceviable':""}

            from bs4 import BeautifulSoup
            soup = BeautifulSoup(srpc, 'html.parser')
            all_tables=[]
            
            table = soup.find_all('table')
            popupdata=[]
            
            start=0
            for tr in table[1].find_all('tr'):
                if start==0:
                    start+=1
                else:
                    row_wise=[]
                    row_wise=list(tr.find_all('td'))
                    if len(row_wise)<2:
                        continue
                    else:
                        states1['Entity']=row_wise[0].text
                        states1['DeviationAddtional']=row_wise[1].text.replace(',','').replace('--','0')
                        states1['DeviationAddtionalChange']=row_wise[2].text.replace(',','').replace('--','0')
                        states1['DeviationPostfacto']=row_wise[3].text.replace(',','').replace('--','0')
                        states1['DeviationNormal']=row_wise[4].text.replace(',','').replace('--','0')
                        states1['DeviationFinal']=row_wise[5].text.replace(',','').replace('--','0')
                        states1['PayableReceviable']=row_wise[6].text.replace('--','0')
                        popupdata.append(states1.copy())
                
            second_table=0
            for tr in table[2].find_all('tr'):
                if second_table==0:
                    second_table+=1
                else:
                    row_wise=[]
                    row_wise=list(tr.find_all('td'))
                    if len(row_wise)<2:
                        continue
                    else:
                        print(row_wise[0].text)
                        states1['Entity']=row_wise[0].text
                        states1['DeviationAddtional']=row_wise[1].text.replace(',','').replace('--','0')
                        states1['DeviationAddtionalChange']=row_wise[2].text.replace(',','').replace('--','0')
                        states1['DeviationPostfacto']=row_wise[3].text.replace(',','').replace('--','0')
                        states1['DeviationNormal']=row_wise[4].text.replace(',','').replace('--','0')
                        states1['DeviationFinal']=row_wise[5].text.replace(',','').replace('--','0')
                        states1['PayableReceviable']=row_wise[6].text.replace('--','0')
                        popupdata.append(states1.copy())
                
           
            third_table=0
            for tr in table[3].find_all('tr'):
                if third_table==0:
                    third_table+=1
                else:
                    row_wise=[]
                    row_wise=list(tr.find_all('td'))
                    if len(row_wise)<2:
                        continue
                    else:
                        print(row_wise[0].text)
                        states1['Entity']=row_wise[0].text
                        states1['DeviationAddtional']=row_wise[1].text.replace(',','').replace('--','0')
                        states1['DeviationAddtionalChange']=0
                        states1['DeviationPostfacto']=0
                        states1['DeviationNormal']=row_wise[2].text.replace(',','').replace('--','0')
                        states1['DeviationFinal']=row_wise[3].text.replace(',','').replace('--','0')
                        states1['PayableReceviable']=row_wise[4].text.replace('--','0')
                        popupdata.append(states1.copy())
                
            context=[
                {'popup':popupdata}
            ]
            
            return JsonResponse(context,safe=False)
        else:
            return HTTPExceptions(status=404)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccesssful")
def CheckingBeforeSRPCBills(request):
    try:
        form_data=json.loads(request.body)
        check_disbursement=DisbursedDate.objects.filter(year=form_data['year'],weekno=form_data['weekno']).count()
        
        return JsonResponse(check_disbursement,safe=False)

    except Exception as e:
        return JsonResponse('failed to get data')

def DeleteFile(request):
    try:
        row_id=json.loads(request.body)
        
        image_url=list(SRPCFiles.objects.filter(id=row_id).delete())
        
        return JsonResponse("Successfully Deleted",safe=False)
    except Exception as e:
        return HttpResponse(e)
def SRPCFullData(request):
    try:
        if request.method=='POST':  
            
            srpc=request.FILES['file']
            # df1=pd.read_html(srpc)
            
            df=pd.read_excel(srpc,skiprows=1)
            states={'Entity':"",
            'Deviation (Rs)* Addtional':"",'Deviation (Rs)* Addtional for Sign Change':"",'Deviation (Rs)* Postfacto':"",'Deviation (Rs)* Normal':"",'Deviation (Rs)\nFinal':"",'Payable  To Pool/ Receviable From Pool':""}
            
            popupdata1=[]
            for i in range(0,len(df)):
                states['Entity']=df['Entity'][i]
                
                states['Deviation (Rs)* Addtional']=str(df['Deviation (Rs)* Addtional'][i]).replace(',','')
                states['Deviation (Rs)* Addtional for Sign Change']=str(df['Deviation (Rs)* Addtional for Sign Change'][i]).replace(',','')
                states['Deviation (Rs)* Postfacto']=str(df['Deviation (Rs)* Postfacto'][i]).replace(',','')
                states['Deviation (Rs)* Normal']=str(df['Deviation (Rs)* Normal'][i]).replace(',','')
                states['Deviation (Rs)\nFinal']=str(df['Deviation (Rs)\nFinal'][i]).replace(',','')
                states['Payable  To Pool/ Receviable From Pool']=df['Payable  To Pool/ Receviable From Pool'][i]

                popupdata1.append(states.copy())
            return JsonResponse(popupdata1,safe=False)
        else:
            return HttpResponse("unsuccessfull")
    except Exception as e:
        print(e)
        return  HttpResponse("Error Occured",status=404)

def WRPCERPC(request):
    try:
        data=json.loads(request.body)
        entities=['Western Region(*wrpc)','Eastern Region(*erpc)']
        regions=['wr','ER']

        
        for region in regions:
            if len(ConfigureModel.objects.filter(Week_no=data['formdata']['weekNo'],registration_id=region)) >0:
                ConfigureModel.objects.filter(Week_no=data['formdata']['weekNo'],registration_id=region).delete()
            else:
                continue
        
        for i in range(0,2):
            entity=entities[i]
            devfinal=float(data['wrer']['devfinal'+str(i)])
            payorreceive=data['wrer']['payorreceive'+str(i)]
            region=regions[i]
            
            Config=ConfigureModel(
                        Fin_year=data['formdata']['year'],
                        Week_no=data['formdata']['weekNo'],
                        Consider_Week_no=data['formdata']['weekNo'],
                        Week_startdate=datetime.datetime.strptime(data['formdata']['weekStartDate'][:10], '%Y-%m-%d').date(),
                        Week_enddate=datetime.datetime.strptime(data['formdata']['weekEndDate'][:10], '%Y-%m-%d').date(),
                        Revision_no=data['formdata']['revisionNo'],
                        Letter_refno=data['formdata']['srpcRefNo'],
                        Letter_date=datetime.datetime.strptime(data['formdata']['srpcLetterDate'][:10], '%Y-%m-%d').date(),
                        Payment_date=datetime.datetime.strptime(data['formdata']['payDueDate'][:10], '%Y-%m-%d').date(),
                        Disbursement_date=datetime.datetime.strptime(data['formdata']['disburseDueDate'][:10], '%Y-%m-%d').date(),
                        Lc_date=datetime.datetime.strptime(data['formdata']['lcDueDate'][:10], '%Y-%m-%d').date(),
                        Interest_levydate=datetime.datetime.strptime(data['formdata']['levyDueDate'][:10], '%Y-%m-%d').date(),
                        Entity=entity,
                        DevAdditional=0,
                        DevAdditionalSignChange=0,
                        DevPostfacto=0,
                        DevNormal=0,
                        DevFinal=devfinal,
                        Outstandings=devfinal,
                        PayableorReceivable=payorreceive,
                        registration_id=region
                    )
            Config.save()
        
        return JsonResponse("success",safe=False)

    except Exception as e:
        print(e)
        return HTTPExceptions("error",status=404)   

def StoreConfigured(request):
    if request.method=="POST":
        try:
            
            request_formData=(json.loads(request.body))['formData']
            request_fileData=(json.loads(request.body))['fileData']

            for i in range(0,len(request_fileData)):
                
                reg_id=User.objects.filter(Q(generalentities1__alias1__iexact=request_fileData[i]['Entity'])|Q(generalentities1__alias2__iexact=request_fileData[i]['Entity'])|Q(generalentities1__alias3__iexact=request_fileData[i]['Entity'])|Q(generalentities1__alias4__iexact=request_fileData[i]['Entity'])).values('registration_id')
                
                if len(reg_id) <1:
                    user_register_id="SRADMIN"
                else:
                    user_register_id=reg_id[0]['registration_id']

                Image_url=list(SRPCFiles.objects.filter(year=request_formData['year'],weekNo=request_formData['weekNo']).values_list('image_url'))

                if len(Image_url) >0:
                    Image_url=Image_url[0][0]
                else:
                    Image_url="No-File_Found"

                
                Config=ConfigureModel(
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
                    Entity=request_fileData[i]['Entity'],
                    DevAdditional=int(float(request_fileData[i]['DeviationAddtional'].replace("nan",'0'))),
                    DevAdditionalSignChange=int(float(request_fileData[i]['DeviationAddtionalChange'].replace("nan",'0'))),
                    DevPostfacto=int(float(request_fileData[i]['DeviationPostfacto'].replace("nan",'0'))),
                    DevNormal=int(float(request_fileData[i]['DeviationNormal'].replace("nan",'0'))),
                    DevFinal=int(request_fileData[i]['DeviationFinal'].replace(',','')),
                    Outstandings=int(request_fileData[i]['DeviationFinal'].replace(',','')),
                    PayableorReceivable=request_fileData[i]['PayableReceviable'],
                    image_url=Image_url,
                    registration_id=user_register_id
                )
                Config.save()

            
            payable=list(ConfigureModel.objects.filter(Q(PayableorReceivable__icontains='payable') & Q(Fin_year=request_formData['year'],Week_no=request_formData['weekNo'])).values(
                'Entity', 'DevAdditional','DevAdditionalSignChange',
                'DevPostfacto','DevNormal','DevFinal','PayableorReceivable'))
            
            receivable=list(ConfigureModel.objects.filter(Q(PayableorReceivable__icontains='receivable') & Q(Fin_year=request_formData['year'],Week_no=request_formData['weekNo'])).values(
                'Entity', 'DevAdditional','DevAdditionalSignChange',
                'DevPostfacto','DevNormal','DevFinal','PayableorReceivable'))
            
            context = [
                    {'payable': payable},
                    {'receivable': receivable}
                ]  
                # print(context)
            return JsonResponse(context, safe=False)
        except Exception as e:
            print(e)
            return HttpResponse(e,safe=False)
def MonthlySurchargeBills(request):
    try:
        data=json.loads(request.body)
        months=['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC']
        
        def getnumber(month):
            for i in range(0,12):
                if month==months[i]:
                    return i+1
                else:
                    continue
    
        
        def last_day_of_month(any_day):
            
            next_month = any_day.replace(day=28) + datetime.timedelta(days=4)
            return next_month - datetime.timedelta(days=next_month.day)
        
        first_day=datetime.date(data['year'],getnumber(data['month']),1).strftime('%Y-%m-%d')

        last_day=last_day_of_month(datetime.date(data['year'], getnumber(data['month']), 1)).strftime('%Y-%m-%d')

        surcharge=list(PaymentStatus.objects.filter(Pay_date__range=[first_day,last_day]).values('Pay_date','Pay_amount','registration_id_id'))
        
        all_duesurcharges=[]
        for i in range(0,len(surcharge)):
            datetimeFormat = '%Y-%m-%d %H:%M:%S.%f'
            duesurcharge=list(ConfigureModel.objects.filter(Q(id=surcharge[i]['registration_id_id'])& Q(Payment_date__lt=surcharge[i]['Pay_date']) ).values('id','Entity','Week_no','DevFinal','Payment_date'))
            
            if len(duesurcharge)>0:
                diff = (surcharge[i]['Pay_date'] - duesurcharge[0]['Payment_date']).days
                duesurcharge[0]['Pay_date']=surcharge[i]['Pay_date']
                duesurcharge[0]['Pay_amount']=surcharge[i]['Pay_amount']
                duesurcharge[0]['CalInterest']=diff*0.0005*int(duesurcharge[0]['DevFinal'])

                all_duesurcharges.append(duesurcharge[0])
              
            else:
                continue
        
        final_surcharge=[
                {'surcharge_bills':all_duesurcharges}
            ]
    
        return JsonResponse(final_surcharge,safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccesssful",status=404)

def SubmitMonthlySurchargeBills(request):
    try:
        data=json.loads(request.body)
        
        for i in range(0,len(data['surcharge_data'])):
            surcharge=SurchargeModel(
                year=data['formdata']['year'],
                month=data['formdata']['month'],
                srpc_duedate=data['surcharge_data'][i]['Payment_date'],
                devfinal=data['surcharge_data'][i]['DevFinal'],
                paid_date=data['surcharge_data'][i]['Pay_date'],
                paid_amount=data['surcharge_data'][i]['Pay_amount'],
                calinterest=data['surcharge_data'][i]['CalInterest']
            )

            con=ConfigureModel.objects.get(id=data['surcharge_data'][i]['id'])
            
            surcharge.reference_id=con
        
            surcharge.save()

        return JsonResponse("success",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccessful",status=404)

def ViewBills(request):
    try:
        
        viewbill=json.loads(request.body)
        
        if viewbill['id']=='SRADMIN':
            if viewbill['Bills']['payorreceive']=='ALL':
                all_bills=list(ConfigureModel.objects.filter(Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno']).values('id','Entity','Letter_refno','Revision_no','DevFinal','image_url','PayableorReceivable'))
            else:
                all_bills=list(ConfigureModel.objects.filter(Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno'],PayableorReceivable=viewbill['Bills']['payorreceive']).values('id','Entity','Letter_refno','Revision_no','DevFinal','image_url','PayableorReceivable'))
        
        else:
            all_bills=list(ConfigureModel.objects.filter(registration_id=viewbill['id'],Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno']).values('id','Entity','Letter_refno','Revision_no','DevFinal','image_url','PayableorReceivable'))
        
        return JsonResponse(all_bills,safe=False)
        
    except Exception as e:
        print(e)
        return HttpResponse(e)

def SurchargePayments(request):
    try:
        
        viewdata=json.loads(request.body)
        

        
        # due_date=list(ConfigureModel.objects.filter(Fin_year=viewbill['formdata']['year'],Week_no=viewbill['formdata']['weekno'],PayableorReceivable="Payable").values('id','Payment_date'))
        
        # final_bills=[]
        if viewdata['id']=='SRADMIN':

            allsurcharges=list(SurchargeModel.objects.filter(year=viewdata['formdata']['year'],month=viewdata['formdata']['month'],Status=viewdata['formdata']['status']).values(**{'Entity': F('reference_id__Entity'),'Week_no':F('reference_id__Week_no'),'SRPC_Duedate':F('srpc_duedate'),'DevFinal':F('devfinal'),'Paid_date':F('paid_date'),'Paid_amount':F('paid_amount'),'CalInterest':F('calinterest'),'ref_id':F('reference_id_id')}))


        else:
            allsurcharges=list(SurchargeModel.objects.filter(reference_id__registration_id=viewdata['id'],year=viewdata['formdata']['year'],month=viewdata['formdata']['month'],Status=viewdata['formdata']['status']).values(**{'Entity': F('reference_id__Entity'),'SRPC_Duedate':F('srpc_duedate'),'DevFinal':F('devfinal'),'Paid_date':F('paid_date'),'Paid_amount':F('paid_amount'),'CalInterest':F('calinterest'),'ref_id':F('reference_id_id')}))

        
        surcharge=[
                {'surcharge_bills':allsurcharges}
            ]
        return JsonResponse(surcharge,safe=False)
        
    except Exception as e:
        print(e)
        return HttpResponse(e)

def ModifyBills(request):
    try:
        viewbill=json.loads(request.body)
        
       
        return JsonResponse("success",safe=False)
        
    except Exception as e:
        return HttpResponse(e)

def UpdateBills(request):
    try:
        update_data=json.loads(request.body)
        
        ConfigureModel.objects.filter(id=update_data['id']).update(Letter_refno=update_data['Letter_refno'],Revision_no=update_data['Revision_no'],Entity=update_data['Entity'],DevFinal=update_data['DevFinal'],Outstandings=update_data['DevFinal'],PayableorReceivable=update_data['PayableorReceivable'],modified_remarks=update_data['remarks'])

        return JsonResponse("Success",safe=False)
    
    except Exception as e:
        print(e)
        return HttpResponse(e)

def FetchConfigured(request):

    if request.method =='POST':
        userData=json.loads(request.body)
        try:
            
            user=str(User.objects.get(username=userData['username']))
            
            if user =='SRADMIN':
                
                state_bills=list(ConfigureModel.objects.filter(Fin_year=userData['payment']['year'],Week_no=userData['payment']['weekno'],Status=userData['payment']['status'],PayableorReceivable=userData['payment']['payorreceive']).values('id','Entity','Letter_refno','Revision_no','DevFinal','Outstandings','PayableorReceivable'))
    
            else:
                
                state_bills=list(ConfigureModel.objects.filter(registration_id=user,Fin_year=userData['payment']['year'],Week_no=userData['payment']['weekno'],PayableorReceivable=userData['payment']['payorreceive'],Status=userData['payment']['status']).values('id','Entity','Letter_refno','Revision_no','DevFinal','Outstandings','PayableorReceivable'))
                
             
            generated=[
                {'Bills':state_bills}
            ]
            
        except Exception as e:
            generated="Error Occured"
            print(e)
        
       
        return JsonResponse(generated,safe=False)

def FetchConfiguredInitial(request):
    try:
        userData=json.loads(request.body)    
        if userData['reg_id']=='SRADMIN':  

            state_bills=list(ConfigureModel.objects.filter(Fin_year=userData['formdata']['year'],Week_no=userData['formdata']['weekno'],PayableorReceivable=userData['formdata']['payorreceive']).exclude(Q(Status="Complete") | Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).values('id','Entity','Week_no','Revision_no','DevFinal','Outstandings','PayableorReceivable'))

            erwr=list(ConfigureModel.objects.filter(Q(Fin_year=userData['formdata']['year']) & Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).exclude(~Q(Week_no=userData['formdata']['weekno']) | Q(Status="Complete")).values('id','Entity','Week_no','Revision_no','DevFinal','Outstandings','PayableorReceivable'))

            newerwr=[]
            for i in range(0,len(erwr)):
                if erwr[i]['Entity']=='Western Region' and erwr[i]['PayableorReceivable']==userData['formdata']['payorreceive']:
                    if userData['formdata']['payorreceive']=='Payable':
                        for j in range(0,len(erwr)):
                            if erwr[j]['Entity']=='Western Region(*wrpc)':
                                newerwr.append(erwr[j])
                    else:
                        for j in range(0,len(erwr)):
                            if erwr[j]['Entity']=='Western Region':
                                newerwr.append(erwr[j])
                
                elif  erwr[i]['Entity']=='Eastern Region' and erwr[i]['PayableorReceivable']==userData['formdata']['payorreceive']:
                    if userData['formdata']['payorreceive']=='Payable':
                        for j in range(0,len(erwr)):
                            if erwr[j]['Entity']=='Eastern Region(*erpc)':
                                newerwr.append(erwr[j])
                    else:
                        for j in range(0,len(erwr)):
                            if erwr[j]['Entity']=='Eastern Region':
                                newerwr.append(erwr[j])
                # Duplicate elements removal
            for i in range(len(newerwr)): 
                if newerwr[i] not in newerwr[i + 1:]:   
                    state_bills.append(newerwr[i])
                else:
                    continue 
        else:
            state_bills=list(ConfigureModel.objects.filter(Fin_year=userData['formdata']['year'],Week_no=userData['formdata']['weekno'],
            PayableorReceivable=userData['formdata']['payorreceive'],registration_id=userData['reg_id']).exclude(Status="Complete").values('id','Entity','Week_no','Revision_no','DevFinal','Outstandings','PayableorReceivable'))        
        generated=[
            {'Bills':state_bills}
        ]
        return JsonResponse(generated,safe=False)
    
    except Exception as e:
        print(e)
        return HTTPExceptions("Error occured")

def FetchConfiguredPending(request):
    try:
        userData=json.loads(request.body)    
        
        if userData['reg_id']=='SRADMIN':
            ps=list(PaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],registration_id__Week_no=userData['formdata']['weekno'],registration_id__PayableorReceivable=userData['formdata']['payorreceive'],Status='Created').values().all())
            # registration_id=userData['reg_id']   later add this 
            for i in range(0,len(ps)):
                week_no=list(ConfigureModel.objects.filter(id=ps[i]['registration_id_id']).values_list('Week_no'))
                ps[i]['Week_no']=week_no[0][0]
        else:
            ps=list(PaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],
            registration_id__Week_no=userData['formdata']['weekno'],
            registration_id__PayableorReceivable=userData['formdata']['payorreceive'],registration_id__registration_id=userData['reg_id'],Status='Created').values().all())
            # registration_id=userData['reg_id']   later add this 
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


def FetchConfiguredApproved(request):
    try:
        userData=json.loads(request.body)    
        
        if userData['reg_id']=='SRADMIN':
            ps=list(PaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],
            registration_id__Week_no=userData['formdata']['weekno'],
            registration_id__PayableorReceivable=userData['formdata']['payorreceive'],Status='Approved').values('registration_id__Week_no','Pay_type','Pay_refno','Pay_date','Paid_by','Paid_for','Pay_amount','Dev_final'))
        # registration_id=userData['reg_id']   later add this 
            # for i in range(0,len(ps)):
            #     week_no=list(ConfigureModel.objects.filter(id=ps[i]['registration_id_id']).values_list('Week_no'))
            #     ps[i]['Week_no']=week_no[0][0]
        else:
            if userData['formdata']['payorreceive']=='Payable':
                ps=list(PaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],registration_id__Week_no=userData['formdata']['weekno'],
                registration_id__PayableorReceivable=userData['formdata']['payorreceive'],registration_id__registration_id=userData['reg_id'],Status='Approved').values('registration_id__Week_no','Pay_type','Pay_refno','Pay_date','Paid_by','Paid_for','Pay_amount','Dev_final'))
                
                # for i in range(0,len(ps)):
                #     week_no=list(ConfigureModel.objects.filter(id=ps[i]['registration_id_id']).values_list('Week_no'))
                #     ps[i]['Week_no']=week_no[0][0]
            
            elif userData['formdata']['payorreceive']=='Receivable':
                ps=list(FinalReceiveDisburse1.objects.filter(registration_id__Fin_year=userData['formdata']['year'],registration_id__Week_no=userData['formdata']['weekno'],registration_id__registration_id=userData['reg_id']).values('registration_id__Week_no','disburseamount','disbursedate','registration_id__Entity','registration_id__DevFinal'))
                for i in range(0,len(ps)):
                    ps[i]['Pay_type']='NEFT'
                    ps[i]['Pay_refno']='23456xgdghdh'
                    ps[i]['Pay_date']=ps[i]['disbursedate']
                    ps[i]['Pay_amount']=ps[i]['disburseamount']
                    ps[i]['Paid_by']='SRLDC'
                    ps[i]['Paid_for']=ps[i]['registration_id__Entity']
                    ps[i]['Dev_final']=ps[i]['registration_id__DevFinal']
        
        generated=[
            {'Bills':ps}
        ]
        
        return JsonResponse(generated,safe=False)
    
    except Exception as e:
        print(e)
        return HTTPExceptions("Error occured")

def PaymentDetails(request):
    request_data=json.loads(request.body)
    try:
        uniqueid=request_data['bottomrow']['id']
        
        entity_name=list(ConfigureModel.objects.filter(id=uniqueid).values('Entity','Fin_year','Week_no'))
        
        due_amount=int(request_data['bottomrow']['Outstandings'])-int(request_data['paymentamount'])
        
        if request_data['reg_id']=='SRADMIN':
            ps=PaymentStatus(
                Pay_type=request_data['paymenttype'],
                Pay_refno=request_data['paymentref'],
                Pay_date=datetime.datetime.strptime(request_data['paymentdate'],'%Y-%m-%d').date(),
                Pay_amount=request_data['paymentamount'],
                Dev_final=request_data['bottomrow']['DevFinal'],
                Due_amount=due_amount,
                Paid_by="SRLDC",
                Paid_for=entity_name[0]['Entity'],
                Remarks=request_data['remarks'],
                )
        else:
            ps=PaymentStatus(
                Pay_type=request_data['paymenttype'],
                Pay_refno=request_data['paymentref'],
                Pay_date=datetime.datetime.strptime(request_data['paymentdate'],'%Y-%m-%d').date(),
                Pay_amount=request_data['paymentamount'],
                Dev_final=request_data['bottomrow']['DevFinal'],
                Due_amount=due_amount,
                Paid_by=request_data['username'],
                Paid_for=entity_name[0]['Entity'],
                Remarks=request_data['remarks'],
                )
        
        
        c=ConfigureModel.objects.get(id=uniqueid)
        
        ps.registration_id=c
        
        ps.save()
        
        ConfigureModel.objects.filter(id=uniqueid).update(Status=request_data['status'],Outstandings=due_amount)
        
        
        return JsonResponse("Success",safe=False) 
        
    except Exception as e:
        print(e)
        return HttpResponse("Unsuccesful")

def PreviousWeekPaymentDetails(request):
    try:
        request_data=json.loads(request.body)
        
        uniqueid=request_data['bottomrow']['id']
        
        entity_name=list(ConfigureModel.objects.filter(id=uniqueid).values('Entity','Fin_year','Week_no'))

        due_amount=int(request_data['bottomrow']['Outstandings'])-int(request_data['formdata']['payamount'])

        current_date=datetime.date.today()

        for val1 in disburse_data['disburseamount']:
            unique_id=int(val1['id'])
            transaction_number = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(16))

            devfinal=list(ConfigureModel.objects.filter(id=unique_id).values_list('DevFinal'))
            
            if len(devfinal)>0:
                devfinal_amount=devfinal[0][0]
            else:
                devfinal_amount=0
            
            outstanding_amount= devfinal_amount - val1['amount']

            receive_disburse=FinalReceiveDisburse1(
                disburseamount=val1['amount'],
                disbursedate=current_date,
                duetopool=outstanding_amount
            )
            con=ConfigureModel.objects.get(id=unique_id)
            receive_disburse.registration_id=con
            receive_disburse.save()
            
            #Updating in the Configure model also 
            if outstanding_amount==0:
                ConfigureModel.objects.filter(id=unique_id).update(Status='Complete',Outstandings=outstanding_amount)
            else:
                ConfigureModel.objects.filter(id=unique_id).update(Status='Partial',Outstandings=outstanding_amount)


            # DSMDuePool(
            #         year=disburse_data['disburse']['year'],
            #         weekno=disburse_data['disburse']['weekno'],
            #         dueinpool=-val1['amount'],
            #         transid=transaction_number).save() 

        
        # if request_data['reg_id']=='SRADMIN':
        #     ps=PaymentStatus(
        #         Pay_type=request_data['formdata']['paytype'],
        #         Pay_refno=request_data['formdata']['payrefno'],
        #         Pay_date=datetime.datetime.strptime(request_data['formdata']['paydate'][:10],'%Y-%m-%d').date(),
        #         Pay_amount=request_data['formdata']['payamount'],
        #         Dev_final=request_data['bottomrow']['DevFinal'],
        #         Due_amount=due_amount,
        #         Paid_by="SRLDC",
        #         Paid_for=entity_name[0]['Entity'],
        #         Remarks=request_data['formdata']['remarks']
        #         )
        # else:
        #     ps=PaymentStatus(
        #         Pay_type=request_data['formdata']['paytype'],
        #         Pay_refno=request_data['formdata']['payrefno'],
        #         Pay_date=datetime.datetime.strptime(request_data['formdata']['paydate'][:10],'%Y-%m-%d').date(),
        #         Pay_amount=request_data['formdata']['payamount'],
        #         Dev_final=request_data['bottomrow']['DevFinal'],
        #         Due_amount=due_amount,
        #         Paid_by=entity_name[0]['Entity'],
        #         Paid_for=entity_name[0]['Entity'],
        #         Remarks=request_data['formdata']['remarks']
        #         )
        
        
        # c=ConfigureModel.objects.get(id=uniqueid)
        
        # ps.registration_id=c
        
        # ps.save()
        
        # ConfigureModel.objects.filter(id=uniqueid).update(Status=request_data['formdata']['status'],Outstandings=due_amount)
        
        
        return JsonResponse("Success",safe=False) 
        
    except Exception as e:
        print(e)
        return HttpResponse("Unsuccesful")

def SurchargePaymentDetails(request):
    request_data=json.loads(request.body)
    try:
        
        uniqueid=request_data['entitydata']['ref_id']
        entity_name=list(ConfigureModel.objects.filter(id=uniqueid).values('Entity'))
        
        if request_data['reg_id']=='SRADMIN':
            ps=PaymentStatus(
                Pay_type=request_data['formData']['paytype'],
                Pay_refno=request_data['formData']['payrefno'],
                Pay_date=datetime.datetime.strptime(request_data['formData']['paydate'][0:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['formData']['payamount'],
                Dev_final=int(request_data['entitydata']['CalInterest']),
                Due_amount=int(request_data['entitydata']['CalInterest'])-request_data['formData']['payamount'],
                Paid_by="SRLDC",
                Paid_for=entity_name[0]['Entity'],
                Remarks=request_data['formData']['remarks']
                )
        else:
            ps=PaymentStatus(
                Pay_type=request_data['formData']['paytype'],
                Pay_refno=request_data['formData']['payrefno'],
                Pay_date=datetime.datetime.strptime(request_data['formData']['paydate'],'%Y-%m-%d').date(),
                Pay_amount=request_data['formData']['payamount'],
                Dev_final=int(request_data['entitydata']['CalInterest']),
                Due_amount=int(request_data['entitydata']['CalInterest'])-request_data['formData']['payamount'],
                Paid_by=request_data['username'],
                Paid_for=entity_name[0]['Entity'],
                Remarks=request_data['formData']['remarks']
                )
        
        
        con=ConfigureModel.objects.get(id=uniqueid)
        
        ps.registration_id=con
        
        ps.save()
        
        SurchargeModel.objects.filter(reference_id_id=uniqueid,actual_paid_date=datetime.datetime.strptime(request_data['formData']['paydate'][0:10],'%Y-%m-%d').date()).update(Status="Created")
        return JsonResponse("Success",safe=False) 
        
    except Exception as e:
        print(e)
        return HttpResponse("Unsuccesful")


def ViewPayments(request):
    try:

        request_data=json.loads(request.body)
        
        ps_status=[]
        user=str(User.objects.get(username=request_data['username']))
        
        # and request_data['data']['payorreceive'] =='Payable'
        if user =='SRADMIN':
        
        # for i in range(0,len(vp)):
            ps=list(PaymentStatus.objects.filter(registration_id__Fin_year=request_data['data']['year'],registration_id__Week_no=request_data['data']['weekno'],registration_id__PayableorReceivable=request_data['data']['payorreceive'],Status=request_data['data']['status']).values().all())
        else:
            ps=list(PaymentStatus.objects.filter(registration_id__registration_id=user,registration_id__Fin_year=request_data['data']['year'],registration_id__Week_no=request_data['data']['weekno'],registration_id__PayableorReceivable=request_data['data']['payorreceive'],Status=request_data['data']['status']).values().all())
        
        viewpayments=[
            {'viewpayments':ps}
        ]
    except Exception as e:
        print(e)
        viewpayments=[
            {'viewpayments':e}
        ]
    return JsonResponse(viewpayments,safe=False)

def PreviousPayments(request):
    try:
        
        reg_id=json.loads(request.body)
        all_details=list(PaymentStatus.objects.filter(registration_id_id=reg_id['registration_id_id']).values().distinct().all())

        
        return JsonResponse(all_details,safe=False)

    except Exception as e:
        print(e)
        return HttpResponse("Unsuccessful")   

def ApprovePayments(request):
    
    try:
        # payment_id=json.loads(request.body)
        approve_payment_data=json.loads(request.body)
        
        result_data = [i for i in approve_payment_data['all_payments'] if i] 
        
        for i in range(0,len(result_data)):
            
            updated_date=datetime.datetime.strptime(result_data[i]['Pay_date'],'%Y-%m-%d').date()
            
            year_week=list(ConfigureModel.objects.filter(paymentstatus__id=result_data[i]['id']).values_list('Fin_year','Week_no'))
        
            
            PaymentStatus.objects.filter(id=result_data[i]['id']).update(Pay_date=updated_date,Status="Approved")
        
            any_outstanding=list(ConfigureModel.objects.filter(paymentstatus__id=result_data[i]['id']).values_list('Outstandings'))

            

            if any_outstanding[0][0] == 0:
                ConfigureModel.objects.filter(paymentstatus__id=result_data[i]['id']).update(Status="Complete")
        
            if approve_payment_data['consider_week'] is None:
                actual_week=year_week[0][1]
            else:
                actual_week=approve_payment_data['consider_week']
            
            ConfigureModel.objects.filter(paymentstatus__id=result_data[i]['id']).update(Consider_Week_no=actual_week)

            DSMDuePool(
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
        # payment_id=json.loads(request.body)
        # net_amount=list(PaymentStatus.objects.filter(id=payment_id['id']).values_list('Dev_final','Pay_amount','Due_amount'))

        # total_net=int(net_amount[0][1]+net_amount[0][2])

        # if net_amount[0][0]==total_net:
        #     ConfigureModel.objects.filter(paymentstatus__id=payment_id['id']).update(Outstandings=total_net,Status="Notified")
        # else:
        #     ConfigureModel.objects.filter(paymentstatus__id=payment_id['id']).update(Outstandings=total_net,Status="Partial")
        
        # PaymentStatus.objects.filter(id=payment_id['id']).update(Status="Rejected",reject_remarks=payment_id['remarks'])
        
        payment_id=json.loads(request.body)
        tot_amount=list(PaymentStatus.objects.filter(id=payment_id['id']).values_list('Dev_final','Pay_amount'))
        actual_out=list(ConfigureModel.objects.filter(paymentstatus__id=payment_id['id']).values_list('Outstandings'))
        total_out=actual_out[0][0]+tot_amount[0][1]   # adding total outstanding
        
        if total_out==tot_amount[0][0]:    #Nothing Paid 
            status='Notified'
        elif total_out==0:
            status='Complete'
        else:
            status='Partial'

        ConfigureModel.objects.filter(paymentstatus__id=payment_id['id']).update(Outstandings=total_out,Status=status)
        PaymentStatus.objects.filter(id=payment_id['id']).update(Due_amount=total_out,Status='Rejected',reject_remarks=payment_id['remarks'])

        rejectpayments=[
            {"rejected":"Successfully Rejected"}
        ]
    except Exception as e:
        print(e)
        rejectpayments=[{"rejected":e}]
    
    return JsonResponse(rejectpayments,safe=False)

def MiscPayments(request):
    try:
        request_data=json.loads(request.body)
        regid=list(Approved.objects.filter(entityName__icontains=request_data['entity']).values_list('register_id'))

        if len(regid)>0:
            regid=regid[0][0].replace(' ','')
        else:
            regid='SRADMIN'
        
        dsm=DSMDuePool(
                year=request_data['year'],
                from_year=request_data['year'][:4],
                to_year=request_data['year'][:2]+request_data['year'][5:],

                actual_weekno=request_data['billtowards'],
                considered_weekno=request_data['billactualweek'],
                dueinpool=request_data['billamount'],
                transdate=datetime.datetime.now()
            )
        dsm.save()
        latest_id=dsm.id

        mps=MiscPaymentStatus(
                Fin_year=request_data['year'],
                Week=request_data['billtowards'],
                Actual_Week=request_data['billactualweek'],
                Pay_type=request_data['paytype'],
                Pay_refno=request_data['payreference'],
                Pay_date=datetime.datetime.strptime(request_data['billdate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['billamount'],
                Paid_by="SRLDC",
                Paid_for=request_data['entity'],
                Remarks=request_data['remarks'],
                registration_id=regid,
                dsmduepoolmodel_id=dsm.id
                )
        mps.save()

        return JsonResponse("success",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccessful",status=404)

def ApprovedMiscPayments(request):
    try:
        form_miscdata=json.loads(request.body)
        all_payments=list(MiscPaymentStatus.objects.filter(Fin_year=form_miscdata['year'],Actual_Week=form_miscdata['week']).all().values())

        summary=[
            {'all_payments':all_payments}
        ]
        return JsonResponse(summary,safe=False)
    except Exception as e:
        return HttpResponse("unsuccessful",status=404)    

def DeleteMiscPayments(request):
    try:
        deleted_data=json.loads(request.body)
        pool_id=list(MiscPaymentStatus.objects.filter(id=deleted_data['id']).values_list('dsmduepoolmodel_id'))
        DSMDuePool.objects.filter(id=pool_id[0][0]).delete()

        MiscPaymentStatus.objects.filter(id=deleted_data['id']).delete()
        
        return JsonResponse("successful",safe=False)

    except Exception as e:
        return JsonResponse("unsucessful",status=404)
def ApproveSurcharge(request):
    try:
        approve_data=json.loads(request.body)
        
        PaymentStatus.objects.filter(registration_id_id=approve_data['element']['ref_id']).update(Status='Approved')
        
        SurchargeModel.objects.filter(reference_id=approve_data['element']['ref_id']).update(Status='Approved')
        transaction_number = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(16))

        # DSMDuePool(
        #     year=approve_data['formdata']['year'],
        #     weekno=approve_data['formdata']['month'],
        #     dueinpool=approve_data['element']['CalInterest'],
        #     transid=transaction_number
        # ).save()

        return JsonResponse("success",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccessful",status=404)

def IntPayments(request):
    try:
        request_data=json.loads(request.body)
        
        regid=list(Approved.objects.filter(entityName__icontains=request_data['entity']).values_list('register_id'))

        if len(regid)>0:
            regid=regid[0][0].replace(' ','')
        else:
            regid='SRADMIN'
        
        
        dsm=DSMDuePool(
                year=request_data['year'],
                from_year=request_data['year'][:4],
                to_year=request_data['year'][:2]+request_data['year'][5:],
                actual_weekno=request_data['billactualweek'],
                considered_weekno=request_data['billactualweek'],
                dueinpool=request_data['billamount'],
                transdate=datetime.datetime.now()
            )
        dsm.save()
        
        ips=IntPaymentStatus(
                Fin_year=request_data['year'],
                Actual_Week=request_data['billactualweek'],
                Pay_type=request_data['paytype'],
                Pay_refno=request_data['payreference'],
                Pay_date=datetime.datetime.strptime(request_data['billdate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['billamount'],
                Paid_by="SRLDC",
                Paid_for=request_data['entity'],
                Remarks=request_data['remarks'],
                registration_id=regid,
                dsmduepoolmodel_id=dsm.id
                )
        ips.save()

        return JsonResponse("success",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccessful",status=404)

def PSDFPayments(request):
    try:
        request_data=json.loads(request.body)
        
        regid=list(Approved.objects.filter(entityName__icontains=request_data['entity']).values_list('register_id'))

        if len(regid)>0:
            regid=regid[0][0].replace(' ','')
        else:
            regid='SRADMIN'
        
        dsm=DSMDuePool(
                year=request_data['year'],
                from_year=request_data['year'][:4],
                to_year=request_data['year'][:2]+request_data['year'][5:],
                actual_weekno=request_data['billactualweek'],
                considered_weekno=request_data['billactualweek'],
                dueinpool=request_data['billamount'],
                transdate=datetime.datetime.now()
            )
        dsm.save()
        
        psdf=PSDFPaymentStatus(
                Fin_year=request_data['year'],
                Actual_Week=request_data['billactualweek'],
                Pay_type=request_data['paytype'],
                Pay_refno=request_data['payreference'],
                Pay_date=datetime.datetime.strptime(request_data['billdate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['billamount'],
                Paid_by="SRLDC",
                Paid_for=request_data['entity'],
                Remarks=request_data['remarks'],
                registration_id=regid,
                dsmduepoolmodel_id=dsm.id
                )
        psdf.save()

        return JsonResponse("success",safe=False)
    except Exception as e:
        return HttpResponse("unsuccessful",status=404)

def TransferPayments(request):
    try:
        request_data=json.loads(request.body)
        
        if request_data['from_entity']=='RRAS':
            dsm=DSMDuePool(
                    year=request_data['year'],
                    from_year=request_data['year'][:4],
                    to_year=request_data['year'][:2]+request_data['year'][5:],
                    actual_weekno=request_data['billactualweek'],
                    considered_weekno=request_data['billactualweek'],
                    dueinpool=request_data['billamount'],
                    transdate=datetime.datetime.now()
                )
            dsm.save()
            
            rras=RRASDuePool(
                    year=request_data['year'],
                    from_year=request_data['year'][:4],
                    to_year=request_data['year'][:2]+request_data['year'][5:],
                    actual_weekno=request_data['billactualweek'],
                    considered_weekno=request_data['billactualweek'],
                    dueinpool=-request_data['billamount'],
                    transdate=datetime.datetime.now()
                )
            rras.save()
        else:
            rras=RRASDuePool(
                    year=request_data['year'],
                    from_year=request_data['year'][:4],
                    to_year=request_data['year'][:2]+request_data['year'][5:],
                    actual_weekno=request_data['billactualweek'],
                    considered_weekno=request_data['billactualweek'],
                    dueinpool=request_data['billamount'],
                    transdate=datetime.datetime.now()
                )
            rras.save()
            dsm=DSMDuePool(
                    year=request_data['year'],
                    from_year=request_data['year'][:4],
                    to_year=request_data['year'][:2]+request_data['year'][5:],
                    actual_weekno=request_data['billactualweek'],
                    considered_weekno=request_data['billactualweek'],
                    dueinpool=-request_data['billamount'],
                    transdate=datetime.datetime.now()
                )
            dsm.save()
        
        DSMRRASBothSidesTransfers(
                Fin_year=request_data['year'],
                Actual_Week=request_data['billactualweek'],
                Pay_type=request_data['paytype'],
                Pay_refno=request_data['payreference'],
                Pay_date=datetime.datetime.strptime(request_data['billdate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['billamount'],
                Remarks=request_data['remarks'],
                dsmduepoolmodel_id=dsm.id,
                rrasduepoolmodel_id=rras.id,
        ).save()
        
        return JsonResponse("success",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccessful",status=404)

def ExcessPayments(request):
    try:
        request_data=json.loads(request.body)
        regid=list(Approved.objects.filter(entityName__icontains=request_data['entity']).values_list('register_id'))

        if len(regid)>0:
            regid=regid[0][0].replace(' ','')
        else:
            regid='SRADMIN'
        
        dsm=DSMDuePool(
                year=request_data['year'],
                from_year=request_data['year'][:4],
                to_year=request_data['year'][:2]+request_data['year'][5:],
                actual_weekno=request_data['billactualweek'],
                considered_weekno=request_data['billactualweek'],
                dueinpool=request_data['billamount'],
                transdate=datetime.datetime.now()
            )
        dsm.save()
        
        excess=ExcessPaymentStatus(
                Fin_year=request_data['year'],
                Actual_Week=request_data['billactualweek'],
                Pay_type=request_data['paytype'],
                Pay_refno=request_data['payreference'],
                Pay_date=datetime.datetime.strptime(request_data['billdate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['billamount'],
                Paid_by="SRLDC",
                Paid_for=request_data['entity'],
                Remarks=request_data['remarks'],
                registration_id=regid,
                dsmduepoolmodel_id=dsm.id
                )
        excess.save()

        return JsonResponse("success",safe=False)
    except Exception as e:
        return HttpResponse("unsuccessful",status=404)



def Disbursements(request):
    try:
        request_data=json.loads(request.body)
        dis_data=request_data['formdata']

        from datetime import date
        
        start_date=list(YearCalendar.objects.filter(year=dis_data['year'],weekno=dis_data['weekno']).values_list('srpc_date'))

        start_date=start_date[0][0].strftime('%Y-%m-%d')

        # last_disbursed_date=DisbursedDate.objects.filter(year=prev_year,weekno=previous_week).values('disbursed_date')

        is_already_disbursed_date=DisbursedDate.objects.filter(year=dis_data['year'],weekno=dis_data['weekno']).values('disbursed_date')

        if len(is_already_disbursed_date)>0:
            already_disbursed=True
            current_date=(is_already_disbursed_date[0]['disbursed_date']).strftime('%Y-%m-%d')
        else:
            already_disbursed=False
            current_date=date.today().strftime('%Y-%m-%d')
        
        
        
        disburse_payable=list(PaymentStatus.objects.filter(Q(registration_id__Fin_year=dis_data['year'],registration_id__Week_no=dis_data['weekno'],registration_id__PayableorReceivable='Payable',Status='Approved')).distinct().values('registration_id__id','registration_id__Week_no','registration_id__Entity','registration_id__Letter_date','Dev_final','registration_id__Payment_date','Pay_date','Pay_amount','Due_amount'))


        disburse_previousweeks=list(PaymentStatus.objects.filter(Q(registration_id__Fin_year=dis_data['year'],registration_id__Consider_Week_no=dis_data['weekno'],Status='Approved')).exclude(registration_id__Week_no=dis_data['weekno']).values('registration_id__id','registration_id__Week_no','registration_id__Entity','Dev_final','registration_id__Payment_date','Pay_date','Pay_amount','Due_amount'))

        # deleting already disbursed previous week payments
        j=0
        for i in range(len(disburse_previousweeks)):
            is_exists=FinalPayDisburse1.objects.filter(registration_id__id=disburse_previousweeks[j]['registration_id__id'],amountpaid=disburse_previousweeks[j]['Pay_amount']).count()
            j=j+1
            if is_exists>0:
                j=j-1
                del disburse_previousweeks[j]
            
        disburse_intpayments=list(IntPaymentStatus.objects.filter(Fin_year=dis_data['year'],Actual_Week=dis_data['weekno']).values('Actual_Week','Paid_for','Pay_amount','Pay_date','Remarks'))

        disburse_psdf=list(PSDFPaymentStatus.objects.filter(Fin_year=dis_data['year'],Actual_Week=dis_data['weekno']).values('Actual_Week','Paid_for','Pay_amount','Pay_date','Remarks'))

        interest_psdf=disburse_intpayments+disburse_psdf
        
        disburse_surcharge=list(SurchargeModel.objects.filter(Q(actual_paid_date__range=[start_date,current_date],Status='Approved')).values_list('reference_id_id'))   
        

        disburse_surcharge1=[]
        
        for i in range(0,len(disburse_surcharge)):
            surcharges=list(PaymentStatus.objects.filter(registration_id_id=disburse_surcharge[i][0]).values(**{'Week':F('registration_id__Week_no'),'Entity':F('registration_id__Entity'),'Paid_date':F('Pay_date'),'Paid_amount':F('Pay_amount')}))
            
            for j in range(0,len(surcharges)):
                if len(list(SurchargeModel.objects.filter(Q(reference_id_id=disburse_surcharge[i][0]) & Q(calinterest__gte=surcharges[j]['Paid_amount']))))>0 :
                    disburse_surcharge1.append(surcharges[j])
                else:
                    continue
            
        pending_payments=list(ConfigureModel.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],PayableorReceivable='Payable',Status='Notified').exclude(Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).values(**{'registration_id__id':F('id'),'registration_id__Week_no':F('Week_no'),'registration_id__Entity':F('Entity'),'Dev_final':F('DevFinal'),'registration_id__Payment_date':F('Payment_date')}))

        
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

        
        
        disburse_receivable=list(ConfigureModel.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],PayableorReceivable='Receivable').exclude(Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).distinct().values('id','Week_no','Entity','Letter_date','DevFinal','Status','Outstandings'))

        # ALl ER and WR (Total 4)
        erwr=list(ConfigureModel.objects.filter(Q(Fin_year=dis_data['year']) & Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).exclude(~Q(Week_no=dis_data['weekno'])).values('id','Week_no','Entity','Payment_date','DevFinal','Outstandings','PayableorReceivable'))
        
        # Payable of ER/WR
        newerwr_pending=[]
        for i in range(0,len(erwr)):
            if erwr[i]['Entity']=='Western Region' and erwr[i]['PayableorReceivable']=='Payable':
                    for j in range(0,len(erwr)):
                        if erwr[j]['Entity']=='Western Region(*wrpc)':
                            newerwr_pending.append(erwr[j])
            
            elif  erwr[i]['Entity']=='Eastern Region' and erwr[i]['PayableorReceivable']=='Payable':
                    for j in range(0,len(erwr)):
                        if erwr[j]['Entity']=='Eastern Region(*erpc)':
                            newerwr_pending.append(erwr[j])
        
        # Info WR/ER Payable
        info_inter_payable=[]
        for entity in newerwr_pending:
            if entity['Entity']=='Western Region(*wrpc)' or entity['Entity']=='Western Region':
                if entity['Entity']=='Western Region(*wrpc)':
                    info_inter_payable=list(ConfigureModel.objects.filter(Entity='Western Region',Fin_year=dis_data['year'],Week_no=dis_data['weekno']).values('id','Week_no','Entity','DevFinal','Outstandings'))
                else:
                    info_inter_payable=list(ConfigureModel.objects.filter(Entity='Western Region(*wrpc)',Fin_year=dis_data['year'],Week_no=dis_data['weekno']).values('id','Week_no','Entity','DevFinal','Outstandings'))
            # ER CHECKING
            elif entity['Entity']=='Eastern Region' or entity['Entity']=='Eastern Region(*erpc)':
                if entity['Entity']=='Eastern Region':
                    info_inter_payable=list(ConfigureModel.objects.filter(Entity='Eastern Region(*erpc)',Fin_year=dis_data['year'],Week_no=dis_data['weekno']).values('id','Week_no','Entity','DevFinal','Outstandings'))
                else:
                    info_inter_payable=list(ConfigureModel.objects.filter(Entity='Eastern Region',Fin_year=dis_data['year'],Week_no=dis_data['weekno']).values('id','Week_no','Entity','DevFinal','Outstandings'))
    
        
        if len(newerwr_pending)>0:
            pay_date=list(PaymentStatus.objects.filter(registration_id=newerwr_pending[0]['id']).values('Pay_date','Pay_amount','Due_amount'))
        
            if len(pay_date)==0:
                    pending_payments_dict['registration_id__id']=newerwr_pending[0]['id']
                    pending_payments_dict['registration_id__Week_no']=newerwr_pending[0]['Week_no']
                    pending_payments_dict['registration_id__Entity']=newerwr_pending[0]['Entity']
                    pending_payments_dict['Dev_final']=newerwr_pending[0]['DevFinal']
                    pending_payments_dict['registration_id__Payment_date']=newerwr_pending[0]['Payment_date']
                    pending_payments_dict['Pay_date']=''
                    pending_payments_dict['Pay_amount']=newerwr_pending[0]['DevFinal']-newerwr_pending[0]['Outstandings']
                    pending_payments_dict['Due_amount']=newerwr_pending[0]['Outstandings']
                    disburse_payable.append(pending_payments_dict.copy())
            else:
                for paid_date in pay_date:
                    pending_payments_dict['registration_id__id']=newerwr_pending[0]['id']
                    pending_payments_dict['registration_id__Week_no']=newerwr_pending[0]['Week_no']
                    pending_payments_dict['registration_id__Entity']=newerwr_pending[0]['Entity']
                    pending_payments_dict['Dev_final']=newerwr_pending[0]['DevFinal']
                    pending_payments_dict['registration_id__Payment_date']=newerwr_pending[0]['Payment_date']
                    pending_payments_dict['Pay_date']=paid_date['Pay_date']
                    pending_payments_dict['Pay_amount']=paid_date['Pay_amount']
                    pending_payments_dict['Due_amount']=paid_date['Due_amount']
                    disburse_payable.append(pending_payments_dict.copy())        

        # Receivable of ER/WR
        newerwr=[]
        for i in range(0,len(erwr)):
            if erwr[i]['Entity']=='Western Region' and erwr[i]['PayableorReceivable']=='Receivable':
                    for j in range(0,len(erwr)):
                        if erwr[j]['Entity']=='Western Region':
                            newerwr.append(erwr[j])
            
            elif  erwr[i]['Entity']=='Eastern Region' and erwr[i]['PayableorReceivable']=='Receivable':
                    for j in range(0,len(erwr)):
                        if erwr[j]['Entity']=='Eastern Region':
                            newerwr.append(erwr[j])
        # Info WR/ER Payable
        info_inter_receivable=[]
        for entity in newerwr:
            if entity['Entity']=='Western Region(*wrpc)' or entity['Entity']=='Western Region':
                if entity['Entity']=='Western Region(*wrpc)':
                    info_inter_receivable=list(ConfigureModel.objects.filter(Entity='Western Region',Fin_year=dis_data['year'],Week_no=dis_data['weekno']).values('id','Week_no','Entity','DevFinal','Outstandings'))
                else:
                    info_inter_receivable=list(ConfigureModel.objects.filter(Entity='Western Region(*wrpc)',Fin_year=dis_data['year'],Week_no=dis_data['weekno']).values('id','Week_no','Entity','DevFinal','Outstandings'))
            # ER CHECKING
            elif entity['Entity']=='Eastern Region' or entity['Entity']=='Eastern Region(*erpc)':
                if entity['Entity']=='Eastern Region':
                    info_inter_receivable=list(ConfigureModel.objects.filter(Entity='Eastern Region(*erpc)',Fin_year=dis_data['year'],Week_no=dis_data['weekno']).values('id','Week_no','Entity','DevFinal','Outstandings'))
                else:
                    info_inter_receivable=list(ConfigureModel.objects.filter(Entity='Eastern Region',Fin_year=dis_data['year'],Week_no=dis_data['weekno']).values('id','Week_no','Entity','DevFinal','Outstandings'))
        
        if len(newerwr)>0:
            disburse_receivable.append(newerwr[0])

        to_year=int(dis_data['year'][:2]+dis_data['year'][5:])
        previous_total_inpool=DSMDuePool.objects.filter(from_year__lte=dis_data['year'][:4],                to_year__lte=int(str(dis_data['year'][2:4])+str(dis_data['year'][5:7])),
                                                        considered_weekno__lt=int(dis_data['weekno'])
                                                        ).aggregate(Sum('dueinpool'))
        
        if previous_total_inpool['dueinpool__sum']==None:
            previous_total_inpool['dueinpool__sum']=0

        paid_incurrent_week=DSMDuePool.objects.filter(year=dis_data['year'],actual_weekno=dis_data['weekno']).aggregate(Sum('dueinpool'))

        
        prevdues_incurrent_week=DSMDuePool.objects.filter(Q(year=dis_data['year']) & Q(considered_weekno=dis_data['weekno']) & ~Q(actual_weekno=dis_data['weekno'])).aggregate(Sum('dueinpool'))
        
        if prevdues_incurrent_week['dueinpool__sum']==None:
            prevdues_incurrent_week['dueinpool__sum']=0
        
        misc_data=list(MiscPaymentStatus.objects.filter(Q(Fin_year=dis_data['year']) & Q(Actual_Week=dis_data['weekno'])).all().values('Fin_year','Week','Paid_for','Pay_amount','Pay_date','Remarks','id'))

        # After Disbursement to download Excel
        
        excelreceive=list(FinalReceiveDisburse1.objects.filter(registration_id__Fin_year=dis_data['year'],registration_id__Week_no=dis_data['weekno'],registration_id__PayableorReceivable='Receivable').values('registration_id__Week_no','registration_id__Entity','registration_id__DevFinal','disburseamount','duetopool'))

        #Pending Authority Data
        status=list(ApproveAuthority.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno']).order_by('-id').values_list('status'))

        created_auth=list(ApproveAuthority.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],created_by=request_data['empno'],status=0).order_by('-id').values_list('id','remarks'))

        # Checking first button disable
        first_approval_auth=list(ApproveAuthority.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],review_auth1=request_data['empno'],status=1).order_by('-id').values_list('id','remarks'))

        second_approval_auth=list(ApproveAuthority.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],review_auth2=request_data['empno'],status=2).order_by('-id').values_list('id','remarks'))

        temp_data_auth1=list(TempDisburseData.objects.filter(registration_id__Fin_year=dis_data['year'],registration_id__Week_no=dis_data['weekno']).values('registration_id__Week_no','registration_id__Entity','registration_id__DevFinal','disburseamount','duetopool'))
        
        if_disbursed=list(DisbursedDate.objects.filter(year=dis_data['year'],weekno=dis_data['weekno']).values('disbursed_date'))
        
        if len(status)>0:
            status=int(status[0][0])
        else:
            status=0

        if len(if_disbursed)>0:   #Already Disbursement done
            enable_created=True
            enable_auth1=True
            enable_auth2=True
            id_set=''
            pending_auth_data=[]   #only for remarks before disbursement
            status=status

        elif len(created_auth)>0 and len(temp_data_auth1)<1:
            enable_created=False
            enable_auth1=True
            enable_auth2=True
            id_set=created_auth[0][0]
            pending_auth_data=created_auth
            status=status

        elif len(first_approval_auth)>0:
            enable_created=True
            enable_auth1=False
            enable_auth2=True
            id_set=first_approval_auth[0][0]
            pending_auth_data=first_approval_auth
            status=status

        elif len(second_approval_auth)>0:
            enable_created=True
            enable_auth1=True
            enable_auth2=False
            id_set=second_approval_auth[0][0]
            pending_auth_data=second_approval_auth
            status=status
        
        elif len(created_auth)<1:
            if len(first_approval_auth)<1:
                if len(second_approval_auth)<1:
                    enable_created=False
                    enable_auth1=True
                    enable_auth2=True
                    id_set=''
                    pending_auth_data=[]
                    status=status
        else:
            enable_created=True
            enable_auth1=True
            enable_auth2=True     
            id_set=''
            pending_auth_data=[]
            status=status
        
        summary=[
            {'disburse_pay':disburse_payable},
            {'disburse_receive':disburse_receivable},
            {'disburse_surcharge':disburse_surcharge1},
            {'disburse_previousweeks':disburse_previousweeks},
            {'misc_data':misc_data},
            {'prev_total_inpool':previous_total_inpool['dueinpool__sum']},
            {'paid_incurrent_week':paid_incurrent_week['dueinpool__sum']},
            {'prevdues_incurrent_week':prevdues_incurrent_week['dueinpool__sum']},
            {'already_disbursed':already_disbursed},
            {'excel_receive':excelreceive},
            {'temp_data_auth1':temp_data_auth1},
            {'enable_created':enable_created},
            {'enable_auth1':enable_auth1},
            {'enable_auth2':enable_auth2},
            {'id_set':id_set},
            {'pending_auth_data':pending_auth_data},
            {'status':status},
            {'info_inter_payable':info_inter_payable},
            {'info_inter_receivable':info_inter_receivable},
            {'disburse_intpayments':interest_psdf}
        ]
        return JsonResponse(summary,safe=False)

    except Exception as e:
        
        return JsonResponse(e)

def FinalDisbursements(request):
    try:
        
        disburse_data=json.loads(request.body)
        
        for val in disburse_data['paiddetails']:
            unique_id=int(val['registration_id__id'])

            pay_disburse=FinalPayDisburse1(
                year=disburse_data['disburse']['year'],
                weekno=disburse_data['disburse']['weekno'],
                pay_constituent=val['registration_id__Entity'],
                devfinal=val['Dev_final'],
                paymentdate=val['registration_id__Payment_date'],
                amountpaid=val['Pay_amount'],
                outstanding=val['Due_amount'],
            )
            # con=ConfigureModel.objects.get(id=unique_id)
            # pay_disburse.registration_id=con
            # pay_disburse.save()

        for val in disburse_data['dataPrev']:
            unique_id=int(val['registration_id__id'])

            prev_disburse=FinalPayDisburse1(
                year=disburse_data['disburse']['year'],
                weekno=val['registration_id__Week_no'],
                pay_constituent=val['registration_id__Entity'],
                devfinal=val['Dev_final'],
                paymentdate=val['registration_id__Payment_date'],
                amountpaid=val['Pay_amount'],
                outstanding=val['Due_amount'],
            )
            # con=ConfigureModel.objects.get(id=unique_id)
            # prev_disburse.registration_id=con
            # prev_disburse.save()
        
        current_date=datetime.date.today()
        
        for val1 in disburse_data['disburseamount']:
            unique_id=int(val1['id'])
           
            devfinal=list(ConfigureModel.objects.filter(id=unique_id).values_list('DevFinal','Week_no'))
            
            if len(devfinal)>0:
                devfinal_amount=devfinal[0][0]
            else:
                devfinal_amount=0
            
            outstanding_amount= devfinal_amount - val1['amount']

            receive_disburse=FinalReceiveDisburse1(
                disburseamount=val1['amount'],
                disbursedate=current_date,
                duetopool=outstanding_amount
            )
            con=ConfigureModel.objects.get(id=unique_id)
            receive_disburse.registration_id=con
            receive_disburse.save()
            
            #Updating in the Configure model also 
            if outstanding_amount==0:
                ConfigureModel.objects.filter(id=unique_id).update(Status='Complete',Outstandings=outstanding_amount)
            else:
                ConfigureModel.objects.filter(id=unique_id).update(Status='Partial',Outstandings=outstanding_amount)

            dsm=DSMDuePool(
                year=disburse_data['disburse']['year'],
                from_year=disburse_data['disburse']['year'][:4],
                to_year=disburse_data['disburse']['year'][:2]+disburse_data['disburse']['year'][5:],

                actual_weekno=devfinal[0][1],
                considered_weekno=disburse_data['disburse']['weekno'],
                dueinpool=-val1['amount'],
                transdate=datetime.datetime.now()
            )
            dsm.save()
        

        DisbursedDate(
                year=disburse_data['disburse']['year'],
                weekno=disburse_data['disburse']['weekno'],
                disbursed_date=current_date
        ).save()

        return JsonResponse("Success",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccesful")

def PreviousWeekDisbursements(request):
    try:
        disbursed_data=json.loads(request.body)
       
        current_date=datetime.date.today()
        
        for val1 in disbursed_data['disburseamount']:
            unique_id=int(val1['id'])
            transaction_number = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(16))

            devfinal=list(ConfigureModel.objects.filter(id=unique_id).values_list('DevFinal','Outstandings','Week_no'))
            
            if len(devfinal)>0:
                devfinal_amount=devfinal[0][1]
            else:
                devfinal_amount=0
            
            outstanding_amount= devfinal_amount - val1['amount']

            receive_disburse=FinalReceiveDisburse1(
                disburseamount=val1['amount'],
                disbursedate=current_date,
                duetopool=outstanding_amount
            )
            con=ConfigureModel.objects.get(id=unique_id)
            receive_disburse.registration_id=con
            receive_disburse.save()
            
            #Updating in the Configure model also 
            if outstanding_amount==0:
                ConfigureModel.objects.filter(id=unique_id).update(Status='Complete',Outstandings=outstanding_amount)
            else:
                ConfigureModel.objects.filter(id=unique_id).update(Status='Partial',Outstandings=outstanding_amount)

            DSMDuePool(
                year=disbursed_data['disburseddata'][0]['Fin_year'],
                from_year=disbursed_data['disburseddata'][0]['Fin_year'][:4],
                to_year=disbursed_data['disburseddata'][0]['Fin_year'][:2]+disbursed_data['disburseddata'][0]['Fin_year'][5:],

                actual_weekno=devfinal[0][2],
                considered_weekno=devfinal[0][2],
                dueinpool=-val1['amount'],
                transdate=datetime.datetime.now()
            ).save()

        return JsonResponse('success',safe=False)
    except Exception as e:
        print(e)
        return JsonResponse(e,safe=False)

def DisbursementStatus(request):
    try:
        dis_status=json.loads(request.body)
        each_entity_status={
            'weekno':'',
            'startdate':'',
            'enddate':'',
            'status':'',
        }
        all_entity_status=[]
        total_inpool=DSMDuePool.objects.aggregate(Sum('dueinpool'))
        
        if total_inpool['dueinpool__sum']==None:
            total_inpool=0
        else:
            total_inpool=total_inpool['dueinpool__sum']

        if dis_status['weekno']=='ALL':
            

            for i in range(1,53):
                is_completed=ConfigureModel.objects.filter(Fin_year=dis_status['year'],Week_no=i,PayableorReceivable='Receivable').exclude(Q(Status='Complete')).count()

                total_entities=ConfigureModel.objects.filter(Fin_year=dis_status['year'],Week_no=i,PayableorReceivable='Receivable').count()


                if is_completed ==0 and total_entities !=0:
                    status='Complete'
                elif is_completed !=0 and is_completed < total_entities:
                    status='Partial'
                else:
                    status='Yet to be disbursed'
                
                week_dates=list(YearCalendar.objects.filter(year=dis_status['year'],weekno=i).values_list('Week_startdate','Week_enddate'))
                
                each_entity_status={
                    'year':dis_status['year'],
                    'weekno':i,
                    'startdate':week_dates[0][0],
                    'enddate':week_dates[0][1],
                    'status':status,
                }
                
                all_entity_status.append(each_entity_status)
            
            return JsonResponse([{'tot_details':all_entity_status},{'total_inpool':total_inpool}],safe=False)

        else:
            
            is_completed=ConfigureModel.objects.filter(Fin_year=dis_status['year'],Week_no=dis_status['weekno'],PayableorReceivable='Receivable').exclude(Q(Status='Complete')).count()
            
            total_entities=ConfigureModel.objects.filter(Fin_year=dis_status['year'],Week_no=dis_status['weekno'],PayableorReceivable='Receivable').count()
            
            

            if is_completed ==0 and total_entities !=0:
                status='Complete'

            elif is_completed !=0 and is_completed < total_entities:
                status='Partial'
            else:
                status='Yet to be done'
                
            week_dates=list(YearCalendar.objects.filter(year=dis_status['year'],weekno=dis_status['weekno']).values_list('Week_startdate','Week_enddate'))
            
            each_entity_status={
                'year':dis_status['year'],
                'weekno':dis_status['weekno'],
                'startdate':week_dates[0][0],
                'enddate':week_dates[0][1],
                'status':status,
            }
            
            all_entity_status.append(each_entity_status)
            
            return JsonResponse([{'tot_details':all_entity_status},{'total_inpool':total_inpool}],safe=False)

    except Exception as e:
        print(e)
        return HttpResponse("Failed to send the message")

def GetAllPartialDisbursed(request):
    try:
        request_data=json.loads(request.body)
        dis_data=request_data['formdata']
        empno=request_data['empno']
        
        
        #Receivable Part  *********************************
        disburse_receivable=list(ConfigureModel.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],PayableorReceivable='Receivable').exclude(Q(Status='Complete') | Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).values('id','Fin_year','Week_no','Entity','Revision_no','DevFinal','Outstandings'))

        erwr=list(ConfigureModel.objects.filter(Q(Fin_year=dis_data['year']) & Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).exclude(~Q(Week_no=dis_data['weekno'])|Q(Status='Complete')).values('id','Fin_year','Week_no','Entity','Revision_no','DevFinal','Outstandings','PayableorReceivable'))
        # Receivable ER/WR
        newerwr=[]
        for i in range(0,len(erwr)):
            if erwr[i]['Entity']=='Western Region' and erwr[i]['PayableorReceivable']=='Receivable':
                    for j in range(0,len(erwr)):
                        if erwr[j]['Entity']=='Western Region':
                            newerwr.append(erwr[j])
            
            elif  erwr[i]['Entity']=='Eastern Region' and erwr[i]['PayableorReceivable']=='Receivable':
                    for j in range(0,len(erwr)):
                        if erwr[j]['Entity']=='Eastern Region':
                            newerwr.append(erwr[j])
        if len(newerwr)!=0:
            disburse_receivable.append(newerwr[0])
        else:
            pass
        
        # **************  ALL DATA PAYBALE,MISC,PREV ,SURCHARGE ***** 

        start_date=list(YearCalendar.objects.filter(year=dis_data['year'],weekno=dis_data['weekno']).values_list('srpc_date'))

        start_date=start_date[0][0].strftime('%Y-%m-%d')

        is_already_disbursed_date=DisbursedDate.objects.filter(year=dis_data['year'],weekno=dis_data['weekno']).values('disbursed_date')

        if len(is_already_disbursed_date)>0:
            current_date=(is_already_disbursed_date[0]['disbursed_date']).strftime('%Y-%m-%d')
        else:
            current_date=date.today().strftime('%Y-%m-%d')
    
        
        disburse_payable=list(PaymentStatus.objects.filter(Q(registration_id__Fin_year=dis_data['year'],registration_id__Week_no=dis_data['weekno'],registration_id__PayableorReceivable='Payable',Status='Approved')).distinct().values('registration_id__id','registration_id__Week_no','registration_id__Entity','registration_id__Letter_date','Dev_final','registration_id__Payment_date','Pay_date','Pay_amount','Due_amount'))

        
        set1=PaymentStatus.objects.filter(Pay_date__range=[start_date,current_date],Status='Approved').exclude(Q(registration_id__Week_no__gte=dis_data['weekno'])).values('registration_id_id')

        set2=FinalPayDisburse1.objects.filter(outstanding=0).values('registration_id_id')

        set3=list(set1.difference(set2))

        disburse_previousweeks=[]
        for i in set3:
            prev_week=list(PaymentStatus.objects.filter(registration_id_id=i['registration_id_id']).values('registration_id__id','registration_id__Week_no','registration_id__Entity','Dev_final','registration_id__Payment_date','Pay_date','Pay_amount','Due_amount'))

            for j in prev_week:
                disburse_previousweeks.append(j)
        
    
        disburse_surcharge=list(SurchargeModel.objects.filter(Q(actual_paid_date__range=[start_date,current_date],Status='Approved')).values_list('reference_id_id'))   

        disburse_surcharge1=[]
        
        for i in range(0,len(disburse_surcharge)):
            surcharges=list(PaymentStatus.objects.filter(registration_id_id=disburse_surcharge[i][0]).values(**{'Week':F('registration_id__Week_no'),'Entity':F('registration_id__Entity'),'Paid_date':F('Pay_date'),'Paid_amount':F('Pay_amount')}))
            
            for j in range(0,len(surcharges)):
                if len(list(SurchargeModel.objects.filter(Q(reference_id_id=disburse_surcharge[i][0]) & Q(calinterest__gte=surcharges[j]['Paid_amount']))))>0 :
                    disburse_surcharge1.append(surcharges[j])
                else:
                    continue
            
        pending_payments=list(ConfigureModel.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],PayableorReceivable='Payable',Status='Notified').exclude(Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).values(**{'registration_id__id':F('id'),'registration_id__Week_no':F('Week_no'),'registration_id__Entity':F('Entity'),'Dev_final':F('DevFinal'),'registration_id__Payment_date':F('Payment_date')}))

        
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

        newerwr_pending=[]

        erwr_updated=list(ConfigureModel.objects.filter(Q(Fin_year=dis_data['year']) & Q(Entity='Eastern Region(*erpc)')|Q(Entity='Western Region(*wrpc)')|Q(Entity='Western Region')|Q(Entity='Eastern Region')).exclude(~Q(Week_no=dis_data['weekno'])).values('id','Fin_year','Week_no','Entity','Payment_date','DevFinal','Outstandings','PayableorReceivable'))
        # Payable ER/WR
        for i in range(0,len(erwr_updated)):
            if erwr_updated[i]['Entity']=='Western Region' and erwr_updated[i]['PayableorReceivable']=='Payable':
                    for j in range(0,len(erwr_updated)):
                        if erwr_updated[j]['Entity']=='Western Region(*wrpc)':
                            newerwr_pending.append(erwr_updated[j])
            
            elif  erwr_updated[i]['Entity']=='Eastern Region' and erwr_updated[i]['PayableorReceivable']=='Payable':
                    for j in range(0,len(erwr_updated)):
                        if erwr_updated[j]['Entity']=='Eastern Region(*erpc)':
                            newerwr_pending.append(erwr_updated[j])
        
        
        pay_date=list(PaymentStatus.objects.filter(registration_id=newerwr_pending[0]['id']).values('Pay_date','Pay_amount','Due_amount'))

        if len(pay_date)==0:
                pending_payments_dict['registration_id__id']=newerwr_pending[0]['id']
                pending_payments_dict['registration_id__Week_no']=newerwr_pending[0]['Week_no']
                pending_payments_dict['registration_id__Entity']=newerwr_pending[0]['Entity']
                pending_payments_dict['Dev_final']=newerwr_pending[0]['DevFinal']
                pending_payments_dict['registration_id__Payment_date']=newerwr_pending[0]['Payment_date']
                pending_payments_dict['Pay_date']=''
                pending_payments_dict['Pay_amount']=newerwr_pending[0]['DevFinal']-newerwr_pending[0]['Outstandings']
                pending_payments_dict['Due_amount']=newerwr_pending[0]['Outstandings']
                disburse_payable.append(pending_payments_dict.copy())
        else:
            for paid_date in pay_date:
                pending_payments_dict['registration_id__id']=newerwr_pending[0]['id']
                pending_payments_dict['registration_id__Week_no']=newerwr_pending[0]['Week_no']
                pending_payments_dict['registration_id__Entity']=newerwr_pending[0]['Entity']
                pending_payments_dict['Dev_final']=newerwr_pending[0]['DevFinal']
                pending_payments_dict['registration_id__Payment_date']=newerwr_pending[0]['Payment_date']
                pending_payments_dict['Pay_date']=paid_date['Pay_date']
                pending_payments_dict['Pay_amount']=paid_date['Pay_amount']
                pending_payments_dict['Due_amount']=paid_date['Due_amount']
                disburse_payable.append(pending_payments_dict.copy())
            
        misc_data=list(MiscPaymentStatus.objects.filter(Q(Pay_date__range=[start_date,current_date]) & Q(Actual_Week=dis_data['weekno'])).all().values('Fin_year','Week','Paid_for','Pay_amount','Pay_date','Remarks','id'))
        
        # After Disbursement to download Excel
        
        excelreceive=list(FinalReceiveDisburse1.objects.filter(registration_id__Fin_year=dis_data['year'],registration_id__Week_no=dis_data['weekno'],registration_id__PayableorReceivable='Receivable').values('registration_id__Week_no','registration_id__Entity','registration_id__DevFinal','disburseamount','disbursedate','duetopool'))
        # group by disbursedate
        excel_updated_receive=[]
        def key_func(k): 
            return k['disbursedate'] 
   
        Excel_groupreceive = sorted(excelreceive, key=key_func) 
        
        for key, value in groupby(Excel_groupreceive, key_func): 
            excel_updated_receive.append(list(value))
        
        
        #Pending Authority Data
        created_auth=list(ApproveAuthorityPreviousWeeks.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],created_by=empno,status=0).order_by('-id').values_list('id','remarks'))
        
        # Checking first button disable
        first_approval_auth=list(ApproveAuthorityPreviousWeeks.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],review_auth1=empno,status=1).order_by('-id').values_list('id','remarks'))

        second_approval_auth=list(ApproveAuthorityPreviousWeeks.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno'],review_auth2=empno,status=2).order_by('-id').values_list('id','remarks'))

        temp_data_auth1=list(TempDisburseDataPreviousWeeks.objects.filter(registration_id__Fin_year=dis_data['year'],registration_id__Week_no=dis_data['weekno']).values('registration_id__Week_no','registration_id__Entity','registration_id__DevFinal','disburseamount','duetopool'))
        
        status=list(ApproveAuthorityPreviousWeeks.objects.filter(Fin_year=dis_data['year'],Week_no=dis_data['weekno']).order_by('-id').values_list('status'))

        if len(status)>0:
            status=int(status[0][0])
        else:
            status=0

        # if_disbursed=list(DisbursedDate.objects.filter(year=dis_data['year'],weekno=dis_data['weekno']).values('disbursed_date'))
        
        # if len(if_disbursed)>0:   #Already Disbursement done
        #     enable_created=True
        #     enable_auth1=True
        #     enable_auth2=True
        #     id_set=''
        #     pending_auth_data=[]   #only for remarks before disbursement
        
        if len(created_auth)>0 and len(temp_data_auth1)<1:
            enable_created=False
            enable_auth1=True
            enable_auth2=True
            id_set=created_auth[0][0]
            pending_auth_data=created_auth
            status=status

        elif len(first_approval_auth)>0:
            enable_created=True
            enable_auth1=False
            enable_auth2=True
            id_set=first_approval_auth[0][0]
            pending_auth_data=first_approval_auth
            status=status

        elif len(second_approval_auth)>0:
            enable_created=True
            enable_auth1=True
            enable_auth2=False
            id_set=second_approval_auth[0][0]
            pending_auth_data=second_approval_auth
            status=status
        
        elif len(created_auth)<1 and len(first_approval_auth)<1:
                if len(second_approval_auth)<1:
                    if len(temp_data_auth1)<1:
                        enable_created=False
                        enable_auth1=True
                        enable_auth2=True
                        id_set=''
                        pending_auth_data=[]
                        status=status
                    else:
                        enable_created=True
                        enable_auth1=True
                        enable_auth2=True
                        id_set=''
                        pending_auth_data=[]
                        status=status
        else:
            enable_created=True
            enable_auth1=True
            enable_auth2=True     
            id_set=''
            pending_auth_data=[]
            status=status
        
        
        summary=[
            {'disburse_pay':disburse_payable},
            {'disburse_surcharge':disburse_surcharge1},
            {'disburse_previousweeks':disburse_previousweeks},
            {'misc_data':misc_data},
            {'disburse_receive':disburse_receivable},
            {'excel_receive':excel_updated_receive},
             {'temp_data_auth1':temp_data_auth1},
            {'enable_created':enable_created},
            {'enable_auth1':enable_auth1},
            {'enable_auth2':enable_auth2},
            {'id_set':id_set},
            {'pending_auth_data':pending_auth_data},
            {'status':status},
        ]
        return JsonResponse(summary,safe=False)

    except Exception as e:
        return JsonResponse(e)


def TempDisbursements(request):
    try:
        request_data=json.loads(request.body)

        resulted_list=[i for i in request_data['disburse_amount'] if i] 
        
        year_week=list(ConfigureModel.objects.filter(id=resulted_list[0]['id']).values_list('Fin_year','Week_no'))
        
        for val1 in resulted_list:
            unique_id=int(val1['id'])
            devfinal=list(ConfigureModel.objects.filter(id=unique_id).values_list('DevFinal','Week_no'))
            if len(devfinal)>0:
                devfinal_amount=devfinal[0][0]
            else:
                devfinal_amount=0
            
            outstanding_amount= devfinal_amount - int(val1['amount'])

            receive_disburse=TempDisburseData(
                disburseamount=int(val1['amount']),
                duetopool=outstanding_amount
            )
            con=ConfigureModel.objects.get(id=unique_id)
            receive_disburse.registration_id=con
            receive_disburse.save()
            
        ApproveAuthority(
            Fin_year=year_week[0][0],
            Week_no=year_week[0][1],
            created_by=request_data['formdata']['created_by'],
            review_auth1=request_data['formdata']['first_approval'],
            review_auth2=request_data['formdata']['second_approval'],
            status=1
        ).save()

        return JsonResponse("success",safe=False)

    except Exception as e:
        print(e)
        return JsonResponse({"unsuccess":e},safe=False)

def TempDisbursementsPreviousWeeks(request):
    try:
        request_data=json.loads(request.body)
        
        year_week=list(ConfigureModel.objects.filter(id=request_data['disburse_amount'][0]['id']['id']).values_list('Fin_year','Week_no'))
        
        for val1 in request_data['disburse_amount']:
            if type(val1['id']) is dict:
                unique_id=val1['id']
                devfinal=list(ConfigureModel.objects.filter(id=unique_id['id']).values_list('Outstandings','Week_no'))
            
                if len(devfinal)>0:
                    devfinal_amount=devfinal[0][0]
                else:
                    devfinal_amount=0
            
                outstanding_amount= devfinal_amount - val1['amount']
                
                receive_disburse=TempDisburseDataPreviousWeeks(
                disburseamount=val1['amount'],
                duetopool=outstanding_amount)

                con=ConfigureModel.objects.get(id=unique_id['id'])
                receive_disburse.registration_id=con
                receive_disburse.save()
            
            else:
                devfinal=list(ConfigureModel.objects.filter(id=val1['id']).values_list('Outstandings','Week_no'))
            
                if len(devfinal)>0:
                    devfinal_amount=devfinal[0][0]
                else:
                    devfinal_amount=0
            
                outstanding_amount= devfinal_amount - val1['amount']
                
                receive_disburse=TempDisburseDataPreviousWeeks(
                disburseamount=val1['amount'],
                duetopool=outstanding_amount
                )
                con=ConfigureModel.objects.get(id=val1['id'])
                receive_disburse.registration_id=con
                receive_disburse.save()
            
         
        ApproveAuthorityPreviousWeeks(
            Fin_year=year_week[0][0],
            Week_no=year_week[0][1],
            created_by=request_data['formdata']['created_by'],
            review_auth1=request_data['formdata']['first_approval'],
            review_auth2=request_data['formdata']['second_approval'],
            status=1
        ).save()

        return JsonResponse("success",safe=False)

    except Exception as e:
        print(e)
        return HttpResponse({"unsuccess":e},safe=False)

def ForwardAuth(request):
    try:
        forward_data=json.loads(request.body)
        disburse_data=forward_data['tot_data']
        
        if forward_data['status']==1:
            ApproveAuthority.objects.filter(id=forward_data['id']).update(status=2,remarks=forward_data['remarks'])

            return JsonResponse('success',safe=False)
        
        elif forward_data['status']==2:
    
            ApproveAuthority.objects.filter(id=forward_data['id']).update(status=3,remarks=forward_data['remarks'])
            current_date=datetime.date.today()
            DisbursedDate(
                year=disburse_data['disburse']['year'],
                weekno=disburse_data['disburse']['weekno'],
                disbursed_date=current_date
            ).save()
            
            disburse_amount=list(TempDisburseData.objects.filter(registration_id__Fin_year=disburse_data['disburse']['year'] ,registration_id__Week_no=disburse_data['disburse']['weekno']).all().values())
            
            for val1 in disburse_amount:
                unique_id=int(val1['registration_id_id'])
                devfinal=list(ConfigureModel.objects.filter(id=unique_id).values_list('DevFinal','Week_no'))
                if len(devfinal)>0:
                    devfinal_amount=devfinal[0][0]
                else:
                    devfinal_amount=0
            
                outstanding_amount= devfinal_amount - val1['disburseamount']
                
                receive_disburse=FinalReceiveDisburse1(
                    disburseamount=val1['disburseamount'],
                    disbursedate=current_date,
                    duetopool=outstanding_amount
                )
                con=ConfigureModel.objects.get(id=unique_id)
                receive_disburse.registration_id=con
                receive_disburse.save()
            
                #Updating in the Configure model also 

                if outstanding_amount==0:
                    ConfigureModel.objects.filter(id=unique_id).update(Status='Complete',Outstandings=outstanding_amount)
                else:
                    ConfigureModel.objects.filter(id=unique_id).update(Status='Partial',Outstandings=outstanding_amount)

                dsm=DSMDuePool(
                    year=disburse_data['disburse']['year'],
                    from_year=disburse_data['disburse']['year'][:4],
                    to_year=disburse_data['disburse']['year'][:2]+disburse_data['disburse']['year'][5:],
                    actual_weekno=devfinal[0][1],
                    considered_weekno=disburse_data['disburse']['weekno'],
                    dueinpool=-val1['disburseamount'],
                    transdate=datetime.datetime.now()
                )
                dsm.save()
            
            for val in disburse_data['paiddetails']:
                unique_id=int(val['registration_id__id'])

                pay_disburse=FinalPayDisburse1(
                    year=disburse_data['disburse']['year'],
                    weekno=disburse_data['disburse']['weekno'],
                    pay_constituent=val['registration_id__Entity'],
                    devfinal=val['Dev_final'],
                    paymentdate=val['registration_id__Payment_date'],
                    amountpaid=val['Pay_amount'],
                    outstanding=val['Due_amount'],
                )
                con=ConfigureModel.objects.get(id=unique_id)
                pay_disburse.registration_id=con
                pay_disburse.save()
            
            for val in disburse_data['previousweekdetails']:
                unique_id=int(val['registration_id__id'])

                prev_disburse=FinalPayDisburse1(
                    year=disburse_data['disburse']['year'],
                    weekno=val['registration_id__Week_no'],
                    pay_constituent=val['registration_id__Entity'],
                    devfinal=val['Dev_final'],
                    paymentdate=val['Pay_date'],
                    amountpaid=val['Pay_amount'],
                    outstanding=val['Due_amount'],
                )
                con=ConfigureModel.objects.get(id=unique_id)
                prev_disburse.registration_id=con
                prev_disburse.save()
        
            return JsonResponse('success',safe=False)
        else:
            return HttpResponse("unsuccessful",status=404)
    
    except Exception as e:
        print(e)
        return HttpResponse("error occured",safe=False)

def ForwardAuthPreviousWeeks(request):
    try:
        forward_data=json.loads(request.body)
        # disburse_data=forward_data['tot_data']
        
        if forward_data['status']==1:
            ApproveAuthorityPreviousWeeks.objects.filter(id=forward_data['id']).update(status=2,remarks=forward_data['remarks'])

            return JsonResponse('success',safe=False)
        
        elif forward_data['status']==2:
            ApproveAuthorityPreviousWeeks.objects.filter(id=forward_data['id']).update(status=3,remarks=forward_data['remarks'])

            current_date=datetime.date.today()
            
            disburse_amount=list(TempDisburseDataPreviousWeeks.objects.filter(registration_id__Fin_year=forward_data['disburse_data']['year'] ,registration_id__Week_no=forward_data['disburse_data']['weekno']).all().values())
            
            for val1 in disburse_amount:
                unique_id=int(val1['registration_id_id'])
           
                devfinal=list(ConfigureModel.objects.filter(id=unique_id).values_list('Outstandings','Week_no'))
            
                if len(devfinal)>0:
                    devfinal_amount=devfinal[0][0]
                else:
                    devfinal_amount=0
            
                outstanding_amount= devfinal_amount - val1['disburseamount']
                
                receive_disburse=FinalReceiveDisburse1(
                    disburseamount=val1['disburseamount'],
                    disbursedate=current_date,
                    duetopool=outstanding_amount
                )
                con=ConfigureModel.objects.get(id=unique_id)
                receive_disburse.registration_id=con
                receive_disburse.save()
            
                #Updating in the Configure model also 
                if outstanding_amount==0:
                    ConfigureModel.objects.filter(id=unique_id).update(Status='Complete',Outstandings=outstanding_amount)
                else:
                    ConfigureModel.objects.filter(id=unique_id).update(Status='Partial',Outstandings=outstanding_amount)

                DSMDuePool(
                    year=forward_data['disburse_data']['year'],
                    from_year=forward_data['disburse_data']['year'][:4],
                    to_year=forward_data['disburse_data']['year'][:2]+forward_data['disburse_data']['year'][5:],
                    actual_weekno=devfinal[0][1],
                    considered_weekno=forward_data['disburse_data']['weekno'],
                    dueinpool=-val1['disburseamount'],
                    transdate=datetime.datetime.now()
                ).save() 

            TempDisburseDataPreviousWeeks.objects.filter(registration_id__Fin_year=forward_data['disburse_data']['year'] ,registration_id__Week_no=forward_data['disburse_data']['weekno']).delete()
        return JsonResponse('success',safe=False)
    
    except Exception as e:
        print(e)
        return JsonResponse("error occured",safe=False)

def RevertAuth(request):
    try:
        revert_data=json.loads(request.body)
        
        year_week=list(ApproveAuthority.objects.filter(id=revert_data['id']).values('Fin_year','Week_no'))
        
        TempDisburseData.objects.filter(registration_id__Fin_year=year_week[0]['Fin_year'] ,           registration_id__Week_no=year_week[0]['Week_no']).delete()

        ApproveAuthority.objects.filter(id=revert_data['id']).update(status=0,remarks=revert_data['remarks'])
        
        
        return JsonResponse('success',safe=False)
    
    except Exception as e:
        return JsonResponse("error occured",safe=False)

def RevertAuthPreviousWeeks(request):
    try:
        revert_data=json.loads(request.body)
        
        year_week=list(ApproveAuthorityPreviousWeeks.objects.filter(id=revert_data['id']).values('Fin_year','Week_no'))
        
        TempDisburseDataPreviousWeeks.objects.filter(registration_id__Fin_year=year_week[0]['Fin_year'] ,           registration_id__Week_no=year_week[0]['Week_no']).delete()

        ApproveAuthorityPreviousWeeks.objects.filter(id=revert_data['id']).update(status=0,remarks=revert_data['remarks'])
        
        
        return JsonResponse('success',safe=False)
    
    except Exception as e:
        return JsonResponse("error occured",safe=False)

def DownloadExcel(request):
    try:
        form_data=json.loads(request.body)

        disburse_payable=list(PaymentStatus.objects.filter(Q(registration_id__Fin_year=form_data['year'],registration_id__Week_no=form_data['weekno'],registration_id__PayableorReceivable='Payable',Status='Approved')).distinct().values_list('registration_id__id','registration_id__Week_no','registration_id__Entity','Dev_final','registration_id__Payment_date','Pay_date','Pay_amount','Due_amount'))
        
        workbook=op.load_workbook('E:\DSM\DjangoBack\Deviation\Template.xlsx')
        ws=workbook.active
        ws.append(['2','4','55','99'])
        ws.title="Dev.Wk."+str(form_data['weekno'])+"P1"
        
        # for row in disburse_payable:
        #     ws.append(row)
        
        workbook.save(filename="demo.xlsx")
        
        return JsonResponse('success')
    
    except Exception as e:
        print(e)
        return JsonResponse("unsuccessful",safe=False)

def ChatMessages(request):
    try:
        msg_data=json.loads(request.body)
        
        now=datetime.datetime.now()
        
        cs=ChatAllMessages(
                user_id=msg_data['short_name'],      #Short Name
                sender=msg_data['sender'],
                message=msg_data['message'],
                receiver=msg_data['receiver'],
                timestamp=now.strftime("%Y-%m-%d %H:%M:%S")
                )
        cs.save()
        
        all_messages=list(ChatAllMessages.objects.filter(Q(sender=msg_data['sender'])&Q(receiver=msg_data['receiver']) | Q(sender=msg_data['receiver'])&Q(receiver=msg_data['sender'])).order_by('timestamp')[:20].all().values())
        
        return JsonResponse(all_messages,safe=False)

    except Exception as e:
        print(e)
        return HttpResponse("Failed to send the message")

def GetMessages(request):
    try:
        
        msg_header=json.loads(request.body)
       
        # sender=request.body.decode("utf-8")   #unique_id like 'SRADMIN' 
        
        # if type(user_id)==type("string"):
        #     user_id=user_id
        # else:
        #     user_id=user_id[0]
        
        get_messages=list(ChatAllMessages.objects.filter(Q(sender=msg_header['sender'])&Q(receiver=msg_header['receiver']) | Q(sender=msg_header['receiver'])&Q(receiver=msg_header['sender'])).order_by('timestamp')[:20].all().values())
        
        
        
        return JsonResponse(get_messages,safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccess")

def ChatUserList(request):

    try:
        users_list=list(User.objects.values_list('username'))

        return JsonResponse(users_list,safe=False)
    except Exception as e:
        return HttpResponse("unsuccessful")

def WeekCalendar(request):
    try:
        if request.method=='POST':
            week=request.FILES['file']
            
            df=pd.read_excel(week,skiprows=1)
            

            for i in range(0,len(df['Wk.No.'])):
                year_cal=YearCalendar(
                   year=week.name,
                   weekno=df['Wk.No.'][i],
                   Week_startdate=df['Period From'][i],
                   Week_enddate=df['Period To'][i],
                   srpc_date=df['SRPC issuded Date'][i],
                   due_date=df['Due Date for Payments '][i],
                   disbursement_date=df['SRLDC Disbursement Date'][i]
                )

                year_cal.save()
                # datetime.datetime.strptime(request_formData['disburseDueDate'][:10], '%Y-%m-%d').date()
            
            return JsonResponse("Success",safe=False)
        else:
            return HttpResponse("unsuccessfull",status=404)

    except Exception as e:
        print(e)
        return HttpResponse(e.args,status=404)

def ImagetoBase64(request):
    try:
        import base64
        form_data=json.loads(request.body)
        
        approve_auth=list(ApproveAuthority.objects.filter(Fin_year=form_data['year'],Week_no=form_data['weekno'],status=3).values('review_auth2'))
        
        
        # if len(approve_auth)>0:
        #     image_path=list(MOEmployeeUser.objects.filter(empno=approve_auth[0]['review_auth2']).values('image_url','name','designation'))
            
        #     with open('E:\DSM\DjangoBack\Deviation\Registration'+image_path[0]['image_url'], "rb") as image_file:
        #         encoded_string = base64.b64encode(image_file.read()).decode("utf-8")
            
        #  
        #         final_encoded_image=[
        #             {'encoded_string':False},
        #             {'encoded_image':encoded_string},
        #             {'authority_name':image_path[0]['name']},
        #             {'designation':image_path[0]['designation']}
        #         ] 

        # else:
        #     final_encoded_image=[
        #         {'encoded_string':True},
                
            # ]
        
        if len(approve_auth)>0:
            image_path=list(MOEmployeeUser.objects.filter(empno=approve_auth[0]['review_auth2']).values('image_url','name','designation'))
            
            with open('E:\\DSM\\Backend\\Deviation\\Registration'+image_path[0]['image_url'], "rb") as image_file:
                encoded_string = base64.b64encode(image_file.read()).decode("utf-8")
                
            final_encoded_image=[
                    {'encoded_string':False},
                    {'encoded_image':encoded_string},
                    {'authority_name':image_path[0]['name']},
                    {'designation':image_path[0]['designation']}
                    
                ]
        else:
            final_encoded_image=[
                {'encoded_string':True}
            ]
        return JsonResponse(final_encoded_image,safe=False)
    
    except Exception as e:
        print(e)
        return JsonResponse('unsuccessful',status=404)

def PrevImagetoBase64(request):
    try:
        import base64
        
        form_data=json.loads(request.body)
        
        approve_auth=list(ApproveAuthorityPreviousWeeks.objects.filter(Fin_year=form_data['year'],Week_no=form_data['weekno'],status=3).values('review_auth2'))
        
        
        if len(approve_auth)>0:
            image_path=list(MOEmployeeUser.objects.filter(empno=approve_auth[0]['review_auth2']).values('image_url','name','designation'))
            
            # with open('''E:/DSM/DjangoBack/Deviation/Registration/'''+image_path[0]['image_url'], "rb") as image_file:
            #     encoded_string = base64.b64encode(image_file.read()).decode("utf-8")

            final_encoded_image=[
                {'encoded_string':False},
                {'encoded_image':''},
                {'authority_name':image_path[0]['name']},
                {'designation':image_path[0]['designation']}
            ]   
        else:
            final_encoded_image=[
                {'encoded_string':True},
                
            ]
        
        return JsonResponse(final_encoded_image,safe=False)
    
    except Exception as e:
        print(e)
        return HttpResponse('unsuccessful',status=404)

def CreatePDF(request):
    try:
        buffer = io.BytesIO()

        p = canvas.Canvas(buffer)
        p.drawString(100, 100, "Hello world.")
        p.showPage()
        p.save()

        buffer.seek(0)
        return FileResponse(buffer, as_attachment=True, filename='hello.pdf')
    
    except Exception as e:
        print(e)
        return HttpResponse(e)