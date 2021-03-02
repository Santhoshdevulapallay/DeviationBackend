from django.shortcuts import render
import pdb,json,pandas as pd
import datetime
from .models import *
from django.db.models import Q
from django.http import JsonResponse,HttpResponse
from Registration.models import *
# Create your views here.
def SRPCRevFile(request):
    try:
        srpc=request.FILES['file'].read()
        df=pd.read_excel(srpc).to_json(orient='records')
        
        # excelfile=[
        #     {'file':df}
        # ]
            
        return JsonResponse(json.loads(df),safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccesful",status=404)

def RevisionBillSubmit(request):
    try:
        formdata=json.loads(request.body)['formdata']
        exceldata=json.loads(request.body)['exceldata']
        
        for i in range(0,len(exceldata)):
            reg_id=User.objects.filter(Q(generalentities1__alias1__iexact=exceldata[i]['Entity'])|Q(generalentities1__alias2__iexact=exceldata[i]['Entity'])|Q(generalentities1__alias3__iexact=exceldata[i]['Entity'])|Q(generalentities1__alias4__iexact=exceldata[i]['Entity'])).values('registration_id')
                
            if len(reg_id) <1:
                user_register_id="SRADMIN"
            else:
                user_register_id=reg_id[0]['registration_id']

            RevisionsBaseModel(
                Fin_year=formdata['year'],
                Week_no=formdata['weekNo'],
                srpc_Startdate=datetime.datetime.strptime(formdata['srpcStartDate'][:10], '%Y-%m-%d').date(),
                srpc_Enddate=datetime.datetime.strptime(formdata['srpcEndDate'][:10], '%Y-%m-%d').date(),
                Revision_no=formdata['revisionNo'],
                Letter_refno=formdata['srpcRefNo'],
                Letter_date=datetime.datetime.strptime(formdata['srpcLetterDate'][:10], '%Y-%m-%d').date(),
                Due_date=datetime.datetime.strptime(formdata['payDueDate'][:10], '%Y-%m-%d').date(),
                Disbursement_date=datetime.datetime.strptime(formdata['disburseDueDate'][:10], '%Y-%m-%d').date(),
                Lc_date=datetime.datetime.strptime(formdata['lcDueDate'][:10], '%Y-%m-%d').date(),
                Interest_levydate=datetime.datetime.strptime(formdata['levyDueDate'][:10], '%Y-%m-%d').date(),
                Entity=exceldata[i]['Entity'],
                DevFinal=exceldata[i]['Final'],
                Outstandings=exceldata[i]['Final'],
                PayableorReceivable=exceldata[i]['PayorReceive'],
                registration_id=user_register_id
            ).save()

        return JsonResponse("success",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccesful")

def GetRevisionWeeks(request):
    try:
        all_weeks=list(RevisionsBaseModel.objects.all().distinct().values_list('Fin_year','Week_no'))
        return JsonResponse(all_weeks,safe=False)
    except Exception as e:
        return HttpResponse("unsuccesful",status=404)

def DSMViewBills(request):
    try:
        viewbill=json.loads(request.body)
        
        if viewbill['id']=='SRADMIN':
            if viewbill['Bills']['payorreceive']=='ALL':
                all_bills=list(RevisionsBaseModel.objects.filter(Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno']).values('id','Entity','srpc_Startdate','srpc_Enddate','Letter_refno','Revision_no','DevFinal','PayableorReceivable'))
            else:
                all_bills=list(RevisionsBaseModel.objects.filter(Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno'],PayableorReceivable=viewbill['Bills']['payorreceive']).values('id','Entity','srpc_Startdate','srpc_Enddate','Letter_refno','Revision_no','DevFinal','PayableorReceivable'))

        else:
            all_bills=list(RevisionsBaseModel.objects.filter(registration_id=viewbill['id'],Fin_year=viewbill['Bills']['year'],Week_no=viewbill['Bills']['weekno']).values('id','Entity','srpc_Startdate','srpc_Enddate','Letter_refno','Revision_no','DevFinal','PayableorReceivable'))
        
        return JsonResponse(all_bills,safe=False)
        
    except Exception as e:
        print(e)
        return HttpResponse(e)

def DSMEditBills(request):
    try:
        editdata=json.loads(request.body)
        RevisionsBaseModel.objects.filter(id=editdata['id']).update(
                Revision_no=editdata['Revision_no'],
                Letter_refno=editdata['Letter_refno'],
                Entity=editdata['Entity'],
                DevFinal=editdata['DevFinal'],
                PayableorReceivable=editdata['PayableorReceivable'],
                remarks=editdata['remarks']
        )
        
        return JsonResponse("success",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("successful",status=404)

def InitialViewPayments(request):
    try:
        data=json.loads(request.body)
        if data['reg_id']=='SRADMIN':
            initial_data=list(RevisionsBaseModel.objects.filter(Fin_year=data['formdata']['year'],Week_no=data['formdata']['weekno'],PayableorReceivable=data['formdata']['payorreceive']).exclude(Status="Complete").all().values())
        else:
            initial_data=list(RevisionsBaseModel.objects.filter(Fin_year=data['formdata']['year'],Week_no=data['formdata']['weekno'],PayableorReceivable=data['formdata']['payorreceive'],registration_id=data['reg_id']).exclude(Status="Complete").all().values())
        summary=[
            {'initial_data':initial_data}
        ]
        return JsonResponse(summary,safe=False)

    except Exception as e:
        print(e)
        return HttpResponse("unsuccesful",status=404)

def PaymentDetails(request):
    
    try:
        request_data=json.loads(request.body)
        
        if request_data['paydata']['payamount'] == request_data['selected']['Outstandings']:
            status='Complete'
            due_amount=0
        elif request_data['paydata']['payamount'] < request_data['selected']['Outstandings']:
            status='Partial'
            due_amount=int(request_data['selected']['Outstandings'])-int(request_data['paydata']['payamount'])
        
        if request_data['reg_id']=='SRADMIN':
            ps=RevPaymentStatus(
                Pay_type=request_data['paydata']['paytype'],
                Pay_refno=request_data['paydata']['payrefno'],
                Pay_date=datetime.datetime.strptime(request_data['paydata']['paydate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['paydata']['payamount'],
                Dev_final=request_data['selected']['DevFinal'],
                Due_amount=due_amount,
                Paid_by="SRLDC",
                Paid_for=request_data['selected']['Entity'],
                Remarks=request_data['paydata']['remarks']
                )
        else:
            ps=RevPaymentStatus(
                Pay_type=request_data['paydata']['paytype'],
                Pay_refno=request_data['paydata']['payrefno'],
                Pay_date=datetime.datetime.strptime(request_data['paydata']['paydate'][:10],'%Y-%m-%d').date(),
                Pay_amount=request_data['paydata']['payamount'],
                Dev_final=request_data['selected']['DevFinal'],
                Due_amount=due_amount,
                Paid_by=request_data['selected']['Entity'],
                Paid_for=request_data['selected']['Entity'],
                Remarks=request_data['paydata']['remarks']
                )
        
        rev=RevisionsBaseModel.objects.get(id=request_data['selected']['id'])
        ps.registration_id=rev
        ps.save()
        
        RevisionsBaseModel.objects.filter(id=request_data['selected']['id']).update(Status=status,Outstandings=due_amount)
        
        
        return JsonResponse("Success",safe=False) 
        
    except Exception as e:
        print(e)
        return HttpResponse("Unsuccesful")

def PendingPaymentDetails(request):
    try:
        userData=json.loads(request.body)    
        
        if userData['reg_id']=='SRADMIN':
            ps=list(RevPaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],registration_id__Week_no=userData['formdata']['weekno'],registration_id__PayableorReceivable=userData['formdata']['payorreceive'],Status='Created').values().all())
            
        else:
            ps=list(PaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],
            registration_id__Week_no=userData['formdata']['weekno'],
            registration_id__PayableorReceivable=userData['formdata']['payorreceive'],registration_id__registration_id=userData['reg_id'],Status='Created').values().all())
           
        generated=[
            {'pending_data':ps}
        ]
        
        return JsonResponse(generated,safe=False)
    
    except Exception as e:
        print(e)
        return HTTPExceptions("Error occured")

def ApprovedPaymentDetails(request):
    try:
        userData=json.loads(request.body)    
        if userData['reg_id']=='SRADMIN':
            ps=list(RevPaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],registration_id__Week_no=userData['formdata']['weekno'],registration_id__PayableorReceivable=userData['formdata']['payorreceive'],Status='Approved').values('registration_id__Week_no','Pay_type','Pay_refno','Pay_date','Paid_by','Paid_for','Pay_amount','Dev_final'))
        
        else:
            if userData['formdata']['payorreceive']=='Payable':
                ps=list(RevPaymentStatus.objects.filter(registration_id__Fin_year=userData['formdata']['year'],registration_id__Week_no=userData['formdata']['weekno'],
                registration_id__PayableorReceivable=userData['formdata']['payorreceive'],registration_id__registration_id=userData['reg_id'],Status='Approved').values('registration_id__Week_no','Pay_type','Pay_refno','Pay_date','Paid_by','Paid_for','Pay_amount','Dev_final'))
                
            else:
                ps=[]
            # elif userData['formdata']['payorreceive']=='Receivable':
            #     ps=list(FinalReceiveDisburse1.objects.filter(registration_id__Fin_year=userData['formdata']['year'],registration_id__Week_no=userData['formdata']['weekno'],registration_id__registration_id=userData['reg_id']).values('registration_id__Week_no','disburseamount','disbursedate','registration_id__Entity','registration_id__DevFinal'))
            #     for i in range(0,len(ps)):
            #         ps[i]['Pay_type']='NEFT'
            #         ps[i]['Pay_refno']='23456xgdghdh'
            #         ps[i]['Pay_date']=ps[i]['disbursedate']
            #         ps[i]['Pay_amount']=ps[i]['disburseamount']
            #         ps[i]['Paid_by']='SRLDC'
            #         ps[i]['Paid_for']=ps[i]['registration_id__Entity']
            #         ps[i]['Dev_final']=ps[i]['registration_id__DevFinal']
        
        generated=[
            {'approved_payments':ps}
        ]
        
        return JsonResponse(generated,safe=False)
    
    except Exception as e:
        print(e)
        return HTTPExceptions("Error occured")

def ViewPayments(request):
    try:

        request_data=json.loads(request.body)
        ps_status=[]
        
        if request_data['id'] =='SRADMIN':
    
            ps=list(RevPaymentStatus.objects.filter(registration_id__Fin_year=request_data['Bills']['year'],registration_id__Week_no=request_data['Bills']['weekno'],registration_id__PayableorReceivable=request_data['Bills']['payorreceive'],Status=request_data['Bills']['status']).values().all())
        else:
            ps=list(RevPaymentStatus.objects.filter(registration_id__registration_id=request_data['id'],registration_id__Fin_year=request_data['Bills']['year'],registration_id__Week_no=request_data['Bills']['weekno'],registration_id__PayableorReceivable=request_data['Bills']['payorreceive'],Status=request_data['Bills']['status']).values().all())

        viewpayments=[
            {'success':True},
            {'viewpayments':ps}
        ]
        return JsonResponse(viewpayments,safe=False)
    except Exception as e:
        print(e)
        viewpayments=[
            {'success':False}
        ]
    return JsonResponse(viewpayments,safe=False)

def ApprovePayments(request):
    
    try:
        approve_payment_data=json.loads(request.body)
        
        result_data = [i for i in approve_payment_data['payments'] if i] 
        
        for i in range(0,len(result_data)):
            
            updated_date=datetime.datetime.strptime(result_data[i]['Pay_date'],'%Y-%m-%d').date()
            
            year_week=list(RevisionsBaseModel.objects.filter(revpaymentstatus__id=result_data[i]['id']).values_list('Fin_year','Week_no'))
        
            any_outstanding=list(RevisionsBaseModel.objects.filter(revpaymentstatus__id=result_data[i]['id']).values_list('Outstandings'))

            if any_outstanding[0][0] == 0:
                RevisionsBaseModel.objects.filter(revpaymentstatus__id=result_data[i]['id']).update(Status="Complete")
            
            if approve_payment_data['consider_week'] is None:
                actual_week=''
            else:
                actual_week=approve_payment_data['consider_week']
            
            RevPaymentStatus.objects.filter(id=result_data[i]['id']).update(Pay_date=updated_date,Status="Approved",Consider_Week_no=actual_week)

            DSMDuePool(
                year=year_week[0][0],
                from_year=year_week[0][0][:4],
                to_year=year_week[0][0][:2]+year_week[0][0][5:],
                actual_weekno=actual_week,
                considered_weekno=actual_week,
                dueinpool=result_data[i]['Pay_amount'],
                transdate=datetime.datetime.now()
            ).save()

        return JsonResponse({"successful":True},safe=False)
    except Exception as e:
        print(e)
        return JsonResponse({"successful":False},safe=False)
    

def RejectPayments(request):
    
    try:
       
        payment_details=json.loads(request.body)

        result_data = [i for i in payment_details['payments'] if i] 

        for i in range(0,len(result_data)):
            
            tot_amount=list(RevPaymentStatus.objects.filter(id=result_data[i]['id']).values_list('Dev_final','Pay_amount'))
        
            actual_out=list(RevisionsBaseModel.objects.filter(revpaymentstatus__id=result_data[i]['id']).values_list('Outstandings'))
            
            total_out=actual_out[0][0]+result_data[i]['Pay_amount']   # adding total outstanding
            
            if total_out==result_data[i]['Pay_amount']:    #Nothing Paid 
                status='Notified'
            elif total_out==0:
                status='Complete'
            else:
                status='Partial'

            RevisionsBaseModel.objects.filter(revpaymentstatus__id=result_data[i]['id']).update(Outstandings=total_out,Status=status)

            RevPaymentStatus.objects.filter(id=result_data[i]['id']).update(Due_amount=total_out,Status='Rejected',reject_remarks=payment_details['remarks'])

        return JsonResponse({"successful":True},safe=False)
    except Exception as e:
        print(e)
        return JsonResponse({"successful":False},safe=False)
