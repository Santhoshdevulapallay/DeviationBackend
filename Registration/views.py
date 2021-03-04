from django.shortcuts import render
from rest_framework import viewsets
from rest_framework import permissions
from Deviation.settings import EMAIL_HOST_USER
from django.core.mail import send_mail
from django.views.decorators.csrf import csrf_exempt
import json, reportlab
from django.http import JsonResponse,HttpResponse
from .models import *
from django.db.models import Q
import secrets ,requests,datetime,pandas as pd
import string,pdb,os
from django_http_exceptions import HTTPExceptions
from django.core import serializers
from django.db import connection
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from django.contrib.auth import login as django_login,logout as django_logout
from .forms import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAdminUser
from rest_framework.authentication import SessionAuthentication,BasicAuthentication,TokenAuthentication
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
import io
from django.http import FileResponse
from reportlab.pdfgen import canvas
import csv
from django.http import HttpResponse
import os
from rest_framework import viewsets
from rest_framework import permissions
from Deviation.serializers import UserSerializer
from Deviation.serializers import BasicSerializer
from .serializers import LoginSerializer
from WeeklyUpload.models  import *
# from termcolor import colored
import logging
logger=logging.getLogger('django')


class UserViewSet(viewsets.ModelViewSet):
#     """
#     API endpoint that allows users to be viewed or edited.
#     """
#     # authentication_classes=[SessionAuthentication,BasicAuthentication]
#     # permission_classes=[permissions.IsAuthenticated]

    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer    #Select any serializer either BasicSerializer or UserSerializer
    
    # permission_classes = [permissions.IsAuthenticated]

def Index(request):
    return render(request,'index.html')


def CreateUser(request):
    request_data=json.loads(request.body)

    try:
        val = request_data['alias4']
        if not val:
            val=val or None
               
    except ValueError:
        val = None

    if val is not None or val:
        val=str(request_data['alias4'])
    try:
        
        R=User.objects.create_user(username=request_data['entityname'],
            password="password1", 
            registration_id=request_data['fncid']
            )
        R.save()

        us=User.objects.get(username=request_data['entityname'])
        
        
        ge=GeneralEntities1(
            fullname=request_data['fullname'],
            dateofregistration=request_data['dateofregistration'],
            usercategory=request_data['userCategory'],
            usertype=request_data['userPrivileges'],
            shortname=request_data['shortname'],
            mobileno=request_data['mobileno'],
            email=request_data['email'],
            alias1=request_data['alias1'],
            alias2=request_data['alias2'],
            alias3=request_data['alias3'],
            alias4=val)
        
        ge.registration_id=us
        ge.save()

        # subject = 'Login Credentials of DSM Application'
        
        # message = 'Dear Sir/Ma`am , \n Welcome to DSM Application ,Please find below the login credentials of application \n \n \t username : '+str(request_data['entityname'])+' \n \t password : password1 \n \n Thanks and Regards \n SRLDC MO ' 
        # recepient =str(request_data['email'])
        
        # send_mail(subject,message, EMAIL_HOST_USER, [recepient], fail_silently = False)

        # message_info="Hi Sir/Ma`am , \n Reg: SRLDC MO DSM APP Credentials \n \n Please Check your mail for DSM App login credentials."
        
        # requests.get("http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=CROOM_SRLDC&passwd=croom@1234&mobilenumber="+request_data['mobileno']+"&message="+message_info+"&sid=SRLDCE&mtype=N&DR=Y")
    
        return JsonResponse("succesfully created",safe=False)
    except Exception as e:
        print(e)
        return HttpResponse(e)

def EmployeeUser(request):
    try:
        
        employee=json.loads(request.body)

        
        user=User.objects.create_user(username=employee['formdata']['empno'],
                                    password="password1",
                                    registration_id='SRADMIN') 
        user.save()
        
        
        mo=MOEmployeeUser(
            empno=employee['formdata']['empno'],
            name=employee['formdata']['empname'],
            email=employee['formdata']['email'],
            designation=employee['formdata']['designation'],
            contact_number=employee['formdata']['contactnumber'],
            image_url=employee['fileurl'][0]
        ).save()

        return JsonResponse("successful",safe=False)

    except Exception as e:
        print(e)
        return JsonResponse('User May Already be created,Please check',status=403)

def EmployeeSign(request):
    try:
        f=request.FILES['file']
        
        _dir = "Registration/static/images/MO/"  
        name,extension = os.path.splitext(f.name)
        
        
        filename=str(name.split("@")[1].split("$")[1])  # whether DSM,REACTIVE or CONGESTION
        _dir = _dir+name.split("@")[0]+'/'+name.split("@")[1].split("$")[0]
    
        if not os.path.exists(_dir):
            os.makedirs(_dir)

        path=_dir+'/'+filename+extension  

        
    
        with open(path, 'wb+') as destination:
            for chunk in f.chunks():
                destination.write(chunk)
        
        return JsonResponse(path[12:],safe=False)

    except Exception as e:
        return JsonResponse("unsuccessful",status=404)

def GetUsers(request):

    try:
        # u=User.objects.all()
        # users = [str(user) for user in User.objects.all()]
        usernames = list(User.objects.values_list('username', flat=True))
        result=usernames
    except Exception as e:
        result=e

    return JsonResponse(result,safe=False)


def UserLogin_Details(request):
    try:
        user_data=json.loads(request.body)
        # selected_user=request.body.decode("utf-8").replace(" ","") user_data['selecteduser']
        
        user=User.objects.get(username=user_data['selecteduser'])
        user.set_password(user_data['password'])
        
        user.save()
        return JsonResponse("Changed Successfullly",safe=False)

    except Exception as e:
        print(e)
        return HttpResponse(e)
    
    
    
class LoginAPI(APIView):

    def post(self, request):
        try:
            serializer=LoginSerializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            user = serializer.validated_data['user']
            
            # django_login(request,user)   #It returns session id not a mandatory one
            token, created = Token.objects.get_or_create(user=user)
            
            
            mo_employee=list(MOEmployeeUser.objects.filter(empno=user.username,registration_id=user.registration_id).all().values())
            
            fiscal=datetime.datetime.now()

            if(fiscal.month>3):
                year=str(fiscal.year+1)[-2:]
                fullyear=str(fiscal.year)+'-'+year
            else:
                year=str(fiscal.year-1)
                fullyear=str(year)+'-'+str(fiscal.year)[-2:]

            calendar=list(YearCalendar.objects.filter(year=fullyear).all().values())
            
            if user.is_superuser:
                return Response({
                    'token': token.key,
                    'user_id': user.pk,
                    'isSuperUser':user.is_superuser,
                    'userName':user.username,
                    'registration_id':user.registration_id,
                    'calendar':calendar
                    })

            elif len(mo_employee)>0:
            
                return Response({
                    'token': token.key,
                    'emp_no': mo_employee[0]['empno'],
                    # 'emp_name': mo_employee[0]['name'],
                    'email': mo_employee[0]['email'],
                    'isSuperUser':user.is_superuser,
                    'designation':mo_employee[0]['designation'],
                    'userName':mo_employee[0]['name'],
                    'usertype':'MO',
                    'registration_id':user.registration_id,
                    'calendar':calendar
                    })
            else:
                ge=list(GeneralEntities1.objects.filter(registration_id_id=user.pk).values().all())
                
                if len(ge)>0:
                    return Response({
                        'token': token.key,
                        'user_id': user.pk,
                        'email': ge[0]['email'],
                        'isSuperUser':user.is_superuser,
                        'shortName':ge[0]['alias1'],
                        'userName':user.username,
                        'registration_id':user.registration_id,
                        'fullname':ge[0]['fullname'],
                        'usercategory':ge[0]['usercategory'],
                        'usertype':ge[0]['usertype'],
                        'calendar':calendar
                        })
                else:
                    return HttpResponse('notfound',status=404)
        except Exception as e:
            # logger.info('invalid login credentials'+e)
            return JsonResponse('invalid login credentials',status=404)

class LogoutAPI(APIView):
    authentication_classes=(TokenAuthentication,)
    
    def post(self,request):
        django_logout(request) 
        return Response(status=204)

def TokenVerification(request):
    token=request.body.decode("utf-8")
    
    pass

def FinanceVerification(request):
    try:
        finance_verified=json.loads(request.body)
        
        if finance_verified['status'] =='approve':
            FormData.objects.filter(id=finance_verified['rowid']).update(remarks=finance_verified['remarks'],isFinanceVerified=True,isFinanceApproved=True)
        else:
            FormData.objects.filter(id=finance_verified['rowid']).update(remarks=finance_verified['remarks'],isFinanceVerified=True,isFinanceApproved=False)
        

        return JsonResponse("succesfully verified",safe=False)
    except Exception as e:
        return HttpResponse("Unsuccessful")
    


def Registration(request,*args):

    
    if request.method=="POST":
        request_data=json.loads(request.body)
        try:
            val = request_data['postData']['telephone3']
            if not val:
                val=val or None
               
        except ValueError:
            val = None

        if val is not None or val:
            val=int(request_data['postData']['telephone3'])

        
        if request_data['postData']['accountNumber2'] =='' or request_data['postData']['accountNumber2'] ==None:
                accountNumber2=None
        else:
            accountNumber2=int(request_data['postData']['accountNumber2'])

        
        if request_data['postData']['accountNumber3'] =='' or request_data['postData']['accountNumber3'] ==None:
                accountNumber3=None
        else:
            accountNumber3=int(request_data['postData']['accountNumber3'])
        
        if request_data['postData']['accountNumber4'] =='' or request_data['postData']['accountNumber4'] ==None:
                accountNumber4=None
        else:
            accountNumber4=int(request_data['postData']['accountNumber4'])

        if request_data['postData']['accountNumber5'] =='' or request_data['postData']['accountNumber5']==None:
                accountNumber5=None
        else:
            accountNumber5=int(request_data['postData']['accountNumber5'])

        if request_data['postData']['accountNumber6'] =='' or request_data['postData']['accountNumber6']==None:
                accountNumber6=None
        else:
            accountNumber6=int(request_data['postData']['accountNumber6'])
               
        
        
        Base=FormData(
                    entityName=request_data['postData']['entityName'],
                    regAddress=request_data['postData']['regAddress'],
                    region=request_data['postData']['region'],
                    userCategory=request_data['postData']['userCategory'],
                    register_id=request_data['regid'],
                    id=str(request_data['random'])
        )
        Base.save()

        reference_id=FormData.objects.get(id=Base.id)

        con=ContactDetails(
            contactName=request_data['postData']['contactName'],
            designation=request_data['postData']['designation'],
            telephone=request_data['postData']['telephone'],
            contactName2=request_data['postData']['contactName2'],
            designation2=request_data['postData']['designation2'],
            telephone2=request_data['postData']['telephone2'],
            contactName3=request_data['postData']['contactName3'],
            designation3=request_data['postData']['designation3'],
            telephone3=val
            )
        con.register_id=reference_id
        con.save()

        bp=BankPANDetails(
            accountName=request_data['postData']['accountName'],
            accountNumber=request_data['postData']['accountNumber'],
            bankName=request_data['postData']['bankName'],
            branchName=request_data['postData']['branchName'],
            ifscCode=request_data['postData']['ifscCode'],

            accountName2=request_data['postData']['accountName2'],
            accountNumber2=accountNumber2,
            bankName2=request_data['postData']['bankName2'],
            branchName2=request_data['postData']['branchName2'],
            ifscCode2=request_data['postData']['ifscCode2'],

            accountName3=request_data['postData']['accountName3'],
            accountNumber3=accountNumber3,
            bankName3=request_data['postData']['bankName3'],
            branchName3=request_data['postData']['branchName3'],
            ifscCode3=request_data['postData']['ifscCode3'],

            accountName4=request_data['postData']['accountName4'],
            accountNumber4=accountNumber4,
            bankName4=request_data['postData']['bankName4'],
            branchName4=request_data['postData']['branchName4'],
            ifscCode4=request_data['postData']['ifscCode4'],

            accountName5=request_data['postData']['accountName5'],
            accountNumber5=accountNumber5,
            bankName5=request_data['postData']['bankName5'],
            branchName5=request_data['postData']['branchName5'],
            ifscCode5=request_data['postData']['ifscCode5'],

            accountName6=request_data['postData']['accountName6'],
            accountNumber6=accountNumber6,
            bankName6=request_data['postData']['bankName6'],
            branchName6=request_data['postData']['branchName6'],
            ifscCode6=request_data['postData']['ifscCode6'],

            pannumber=request_data['postData']['pannumber'],
            tannumber=request_data['postData']['tannumber'],
            gstinnumber=request_data['postData']['gstinnumber']
        )

        bp.register_id=reference_id
        bp.save()

        response_data={
        "Success":[{ "status": "Succesfully Stored" }]
            }
        return JsonResponse(response_data)
    else:
        return HttpResponse(status=403)
    

def GetMOUsers(request):
    try:
        if request.method =='GET':
            all_users=list(MOEmployeeUser.objects.all().values())
            
            return JsonResponse(all_users,safe=False)
        
        else:
            return HttpResponse("Bad Request ",404)
    except Exception as e:
        return HTTPExceptions(e)

def GetAllUsers(request):
    try:
        if request.method =='GET':
            all_users=list(Approved.objects.all().values())
            
            return JsonResponse(all_users,safe=False)
        
        else:
            return HttpResponse("Bad Request ",404)
    except Exception as e:
        return HTTPExceptions(e)

def GetAllFullNames(request):
    try:
        if request.method =='GET':
            all_users=list(GeneralEntities1.objects.all().values('alias1'))
            # all_users=list(Approved.objects.all().values('entityName'))
            
            return JsonResponse(all_users,safe=False)
        
        else:
            return HttpResponse("Bad Request ",404)
    except Exception as e:
        return HTTPExceptions(e)

def FetchData(request):
    try:
        # data = list(FormData.objects.filter(Status='Created').values('register_id__contactName'))
        query1=list(ContactDetails.objects.filter(register_id__Status='Created').values('register_id__register_id','register_id__entityName','register_id__regAddress','register_id__region','register_id__userCategory','register_id__remarks','register_id__id','contactName','designation','telephone','contactName2','designation2','telephone2','contactName3','designation3','telephone3'))

        query2=list(BankPANDetails.objects.filter(bpregister_id__Status='Created').all().values())
        total_data=[]
        for i in query1:
            for j in query2:
                if i['register_id__id']==j['bpregister_id_id']:
                    final={**i,**j}
                    total_data.append(final)
        
        return JsonResponse(total_data, safe=False)
    
    except:
        return HttpResponse("unsuccessful")

    # return HttpResponse(records_json, content_type='application/json')
    # return JsonResponse(records_json,safe=False)

def ImageData(request):

    try:
        if request.method == 'POST':
            handle_uploaded_file(request.FILES['file'])
            
        else:
            form = UploadFileForm()
    except Exception as e:
        
        return JsonResponse(e,safe=False)

    return JsonResponse("succesfully uploaded",safe=False)

def UpdateImage(request):
    try:
        if request.method == 'POST':
            handle_uploaded_file1(request.FILES['file'])
            
        else:
            form = UploadFileForm()
        
        return JsonResponse("succesfully uploaded",safe=False)
    except Exception as e:
        
        return HttpResponse("unsuccessful")

    

def handle_uploaded_file(request):
    # with open('images/cheque.jpeg', 'wb+') as destination:  Images in Djangoback/Deviation/images previously
    
    f=request.FILES['file']
    _dir = "Registration/static/images/"  
    name,extension = os.path.splitext(f.name)
    filename=name.split("@")[0]
    typeofcheque=name.split("@")[1]  # whether DSM,REACTIVE or CONGESTION
    _dir = _dir+filename
    
    if not os.path.exists(_dir):
        os.makedirs(_dir)

    random = ''.join(secrets.choice(string.digits) for i in range(5))
    

    path='Registration/static/images/'+ str(filename)+'/'+typeofcheque+random+extension  # to store in static folder
   
    with open(path, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

    
    # image_url='127.0.0.1:8000'+str(path[12:]) 
    image_url=str(path[12:]) 
     #to fetch from front end using direct url
    store_url=ApplicantImages(
        entityName=filename,
        image_url=image_url
    )
    store_url.save()

    image_urls=list(ApplicantImages.objects.filter(entityName=filename,
        image_url=image_url).order_by('-id')[:1].all().values_list('image_url','id'))
    
    return JsonResponse(image_urls,safe=False)

def handle_uploaded_file1(f):
    # with open('images/cheque.jpeg', 'wb+') as destination:  Images in Djangoback/Deviation/images previously
    _dir = "Registration/static/images/"  
    name,extension = os.path.splitext(f.name)
    filename=name.split("@")[0]
    typeofcheque=name.split("@")[1]  # whether DSM,REACTIVE or CONGESTION
    _dir = _dir+filename
      
    if not os.path.exists(_dir):
        os.makedirs(_dir)

    random = ''.join(secrets.choice(string.digits) for i in range(5))
    

    path='Registration/static/images/'+ str(filename)+'/'+typeofcheque+random+extension  # to store in static folder
    with open(path, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

    image_url='127.0.0.1:8000'+str(path[12:]) 
     #to fetch from front end using direct url
    store_url=BankEditedImages(
        entityName=filename,
        image_url=image_url
    )
    store_url.save()


def RegisterImageData(request):
    try:
        if request.method == 'POST':
            handle_uploaded_registerfile(request.FILES['file'])
            
        else:
            form = UploadFileForm()
    except Exception as e:
        
        return JsonResponse(e,safe=False)

    return JsonResponse("succesfully uploaded",safe=False)

def handle_uploaded_registerfile(f):
    _dir = "Registration/static/RegistrationForms/"
    name,extension = os.path.splitext(f.name)
    filename=name.split("@")[0]
      # whether DSM,REACTIVE or CONGESTION
    _dir = _dir+filename
      
    if not os.path.exists(_dir):
        os.makedirs(_dir)

    random = ''.join(secrets.choice(string.digits) for i in range(5))
    

    path='Registration/static/RegistrationForms/'+ str(filename)+'/'+filename+random+extension  # to store in static folder
    with open(path, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

    image_url='127.0.0.1:8000'+str(path[12:]) 
     #to fetch from front end using direct url
    store_url=ApplicantImages(
        entityName=filename,
        image_url=image_url
    )
    store_url.save()

def DeleteFile(request):
    try:
        row_id=json.loads(request.body)
        
        image_url=list(ApplicantImages.objects.filter(id=row_id).values_list('image_url'))
        if len(image_url)>0:
            path='Registration/'+image_url[0][0]
            os.remove(path)
        else:
            pass
        
        image_del=list(ApplicantImages.objects.filter(id=row_id).delete())

        return JsonResponse("Successfully Deleted",safe=False)
    except Exception as e:
        return HttpResponse(e)

def ImageUrls(request):
    try:
        userid=str(request.body.decode("utf-8")).replace(" ","")
        get_username=User.objects.filter(registration_id=userid).values_list('username')
        pdb.set_trace()
        if len(get_username)>0:
            imageurls=list(ApplicantImages.objects.filter(entityName__icontains=get_username[0][0]).order_by('-id')[:6].values_list('image_url'))
        else:
            imageurls=[]
        
        status=imageurls
    except Exception as e:
        status=e

    return JsonResponse(status,safe=False)
@csrf_exempt
def MOBankDetails(request):
    try:
        bankdata=json.loads(request.body)
        bd=BankDetails(
            accountname=bankdata['accountname'],
            bankname=bankdata['bankname'],
            accountnumber=bankdata['accountnumber'],
            branchname=bankdata['branchname'],
            ifsccode=bankdata['ifsccode'],
            validfrom=datetime.strptime(bankdata['validfrom'][:10], '%Y-%m-%d').date(),
            validtill=datetime.strptime(bankdata['validtill'][:10], '%Y-%m-%d').date()
        )
        bd.save()

        return JsonResponse("Stored Succesfully",safe=False)
    except Exception as e:
        return HttpResponse(e)
    
@csrf_exempt
def GetBankDetails(request):

    try:
        if request.method=="GET":
            mo_details=list(BankDetails.objects.filter(validtill__gt=datetime.now()).all().values('accountname','bankname','accountnumber','branchname','ifsccode','validfrom','validtill'))
            
            if not mo_details:
                return JsonResponse("No Details Found",safe=False)
            else:
                mo_detailstext='These are the MO Bank Details for Pool Account \n \n \n AccountName ::'+mo_details[0]['accountname']+'\n Bank Name ::'+ mo_details[0]['bankname']+' \n Account Number::'+ str(mo_details[0]['accountnumber'])+' \n Branch Name ::'+ mo_details[0]['branchname']+' \n IFSC Code ::'+mo_details[0]['ifsccode'] +' \n Valid From ::'+mo_details[0]['validfrom'].strftime("%d/%m/%Y") +' \n Valid Till ::'+ mo_details[0]['validtill'].strftime("%d/%m/%Y")+' \n \n  Thanks and Regards  \n SRLDC MO.'

                return JsonResponse(mo_detailstext,safe=False)
    except Exception as e:
        return HttpResponse(e)
@csrf_exempt
def AllBankDetails(request):

    try:
        if request.method =="GET":

            mo_details=list(BankDetails.objects.all().values('accountname','bankname','accountnumber','branchname','ifsccode','validfrom','validtill'))

            all_details=""
            for i in range(0,len(mo_details)):
                mo_detailstext='These are the MO Bank Details for Pool Account \n \n \n AccountName ::'+mo_details[i]['accountname']+'\n Bank Name ::'+ mo_details[i]['bankname']+' \n Account Number::'+ str(mo_details[i]['accountnumber'])+' \n Branch Name ::'+ mo_details[i]['branchname']+' \n IFSC Code ::'+mo_details[i]['ifsccode'] +' \n Valid From ::'+mo_details[i]['validfrom'].strftime("%d/%m/%Y") +' \n Valid Till ::'+ mo_details[i]['validtill'].strftime("%d/%m/%Y")+' \n \n  Thanks and Regards  \n SRLDC MO.'

                all_details=all_details+mo_detailstext
                
            
            return JsonResponse(all_details,safe=False)
    except Exception as e:
        return HttpResponse("Unsuccessful to fetch detials")

@csrf_exempt
def ApprovedForm(request):
    try:
        if request.method=="POST":
            approved_data=json.loads(request.body)
            key_value=approved_data['data']['Rowid']
            rows=FormData.objects.filter(id__icontains=key_value).values()
            # Storing User Details in Database
            try:
                Store=Approved(
                                entityName=rows[0]['entityName'],regAddress=rows[0]['regAddress'],region=rows[0]['region'],userCategory=rows[0]['userCategory'],contactName=rows[0]['contactName'],
                                designation=rows[0]['designation'],telephone=rows[0]['telephone'],contactName2=rows[0]['contactName2'],designation2=rows[0]['designation2'],telephone2=rows[0]['telephone2'],contactName3=rows[0]['contactName3'],designation3=rows[0]['designation3'],telephone3=rows[0]['telephone3'],

                                accountName=rows[0]['accountName'],accountNumber=rows[0]['accountNumber'],bankName=rows[0]['bankName'],branchName=rows[0]['branchName'],ifscCode=rows[0]['ifscCode'],

                                accountName2=rows[0]['accountName2'],accountNumber2=rows[0]['accountNumber2'],bankName2=rows[0]['bankName2'],branchName2=rows[0]['branchName2'],ifscCode2=rows[0]['ifscCode2'],

                                accountName3=rows[0]['accountName3'],accountNumber3=rows[0]['accountNumber3'],bankName3=rows[0]['bankName3'],branchName3=rows[0]['branchName3'],ifscCode3=rows[0]['ifscCode3'],

                                accountName4=rows[0]['accountName4'],accountNumber4=rows[0]['accountNumber4'],bankName4=rows[0]['bankName4'],branchName4=rows[0]['branchName4'],ifscCode4=rows[0]['ifscCode4'],

                                accountName5=rows[0]['accountName5'],accountNumber5=rows[0]['accountNumber5'],bankName5=rows[0]['bankName5'],branchName5=rows[0]['branchName5'],ifscCode5=rows[0]['ifscCode5'],

                                accountName6=rows[0]['accountName6'],accountNumber6=rows[0]['accountNumber6'],bankName6=rows[0]['bankName6'],branchName6=rows[0]['branchName6'],ifscCode6=rows[0]['ifscCode6'],

                                pannumber=rows[0]['pannumber'],
                                tannumber=rows[0]['tannumber'],
                                gstinnumber=rows[0]['gstinnumber'],
                                
                                remarks=rows[0]['remarks'],
                                adminremarks=approved_data['data']['adminremarks'],
                                validfrom=datetime.date.today(),
                                validtill=datetime.date(2045, 9, 6),
                                
                                register_id=rows[0]['register_id'],
                                id=rows[0]['id']
                )
                Store.save()
                
                FormData.objects.filter(id=key_value).delete()
                
                return JsonResponse("successful",safe=False) 
            except Exception as e:
                print(e)
        else:

            return HttpResponse("unsuccessful",404)
    except Exception as e:
        return HttpResponse(e)

@csrf_exempt
def RejectedForm(request):
    
    
    if request.method=="POST":
        request_data=json.loads(request.body)
        # key_value=request.body.decode("utf-8")
        
        # rows=FormData.objects.filter(id__icontains=key_value).values()
        rows=FormData.objects.filter(id__icontains=request_data['rowId']).values()
        
        # Storing User Details in Database
        Store=Rejected(
                        entityName=rows[0]['entityName'],regAddress=rows[0]['regAddress'],region=rows[0]['region'],userCategory=rows[0]['userCategory'],contactName=rows[0]['contactName'],
                        designation=rows[0]['designation'],
                        
                        telephone=rows[0]['telephone'],contactName2=rows[0]['contactName2'],designation2=rows[0]['designation2'],
                        telephone2=rows[0]['telephone2'],
                        contactName3=rows[0]['contactName3'],
                        designation3=rows[0]['designation3'],
                        telephone3=rows[0]['telephone3'],

                        accountName=rows[0]['accountName'],accountNumber=rows[0]['accountNumber'],bankName=rows[0]['bankName'],branchName=rows[0]['branchName'],ifscCode=rows[0]['ifscCode'],

                        accountName2=rows[0]['accountName2'],accountNumber2=rows[0]['accountNumber2'],bankName2=rows[0]['bankName2'],branchName2=rows[0]['branchName2'],ifscCode2=rows[0]['ifscCode2'],

                        accountName3=rows[0]['accountName3'],accountNumber3=rows[0]['accountNumber3'],bankName3=rows[0]['bankName3'],branchName3=rows[0]['branchName3'],ifscCode3=rows[0]['ifscCode3'],

                        accountName4=rows[0]['accountName4'],accountNumber4=rows[0]['accountNumber4'],bankName4=rows[0]['bankName4'],branchName4=rows[0]['branchName4'],ifscCode4=rows[0]['ifscCode4'],

                        accountName5=rows[0]['accountName5'],accountNumber5=rows[0]['accountNumber5'],bankName5=rows[0]['bankName5'],branchName5=rows[0]['branchName5'],ifscCode5=rows[0]['ifscCode5'],

                        accountName6=rows[0]['accountName6'],accountNumber6=rows[0]['accountNumber6'],bankName6=rows[0]['bankName6'],branchName6=rows[0]['branchName6'],ifscCode6=rows[0]['ifscCode6'],

                        pannumber=rows[0]['pannumber'],
                        tannumber=rows[0]['tannumber'],
                        gstinnumber=rows[0]['gstinnumber'],
                                
                        remarks=rows[0]['remarks'],
                        adminremarks=request_data['remarks_column'],
                        register_id=rows[0]['register_id'],
                        id=rows[0]['id']
        )
        Store.save()
        FormData.objects.filter(id=request_data['rowId']).delete()
        
        return JsonResponse("success",safe=False) 
    else:

        return HttpResponse("unsuccessfule")


def PendingList(request):

    try:
        if request.method=="POST":
            
            get_data=request.body.decode("utf-8")
            
            if get_data=="SRADMIN" or get_data=="SRFINANCE":
                admin_data=list(FormData.objects.all().values_list('entityName','id'))
                
                finance_approved=list(FormData.objects.filter(Q(isFinanceVerified=True)&Q(isFinanceApproved=True)).values_list('id'))

                finance_rejected=list(FormData.objects.filter(Q(isFinanceVerified=True)&Q(isFinanceApproved=False)).values_list('id','remarks'))

                pending_contacts=list(OldDetails.objects.filter(isadminverified=False).all().values())

                pending_bank=list(OldBankDetails2.objects.filter(isadminverified=False).all().values())
                
                return JsonResponse({"admin_data":admin_data,"finance_approved":finance_approved,"finance_rejected":finance_rejected,"pending_contacts":pending_contacts,"pending_bank":pending_bank},safe=False)
            
            else:
                form_data=FormData.objects.filter(register_id__icontains=get_data).values_list('entityName','id')
                
                
                approved=Approved.objects.filter(register_id__icontains=get_data).values_list('entityName','id','validfrom')
                
                rejected=Rejected.objects.filter(register_id__icontains=get_data).values_list('adminremarks','id')
                
                generated_bills=ConfigureModel.objects.filter(registration_id=get_data).order_by('-id')[:1].values_list('Fin_year','Week_startdate','Week_enddate','Revision_no')
                
                id_user=list(Approved.objects.filter(register_id__icontains=get_data).values('id'))
                

                # disbursement_done=list(FinalReceiveDisburse1.objects.filter(registration_id__icontains=get_data).order_by('-id').values_list('year','weekno'))

                # disbursement_done=list(FinalReceiveDisburse.objects.filter(registration_id__icontains=get_data).order_by('-id').values_list('year','weekno'))

                # id_contact=list(Approved.objects.filter(register_id__icontains=get_data).values('id'))
                
                
                if len(id_user) >0:
                    updated_contact=list(OldDetails.objects.filter(register_id_id=id_user[0]['id']).order_by('-id')[:1].values('id','approvedDate'))
                else:
                    updated_contact=[]
                
                if len(id_user) >0:
                    updated_bank=list(OldBankDetails2.objects.filter(register_id_id=id_user[0]['id']).order_by('-id')[:1].values('id','validfrom'))
                else:
                    updated_bank=[]

                
                
                
                if len(id_user)>0:
                    pending_contacts_user=list(OldDetails.objects.filter(Q(register_id_id=id_user[0]['id'])&Q(isadminverified=False)).values())

                    pending_bank_user=list(OldBankDetails2.objects.filter(Q(register_id_id=id_user[0]['id'])&Q(isadminverified=False)).values())
                else:
                    pending_contacts_user=""
                    pending_bank_user=""

                
                if len(form_data)>0:
                    # for i in range(0,len(form_data)):
                    #     form_data.append(form_data[i][0])
                    form_data=form_data[len(form_data)-1]
                else:
                    form_data=""
            
                if len(approved)>0:
                    # for i in range(0,len(approved)):
                    #     approved.append(approved[i][0])
                    approved=approved[len(approved)-1]
                
                else:
                    approved=""

                if len(rejected)>0:
                    # for i in range(0,len(rejected)):
                    #     rejected.append(rejected[i][0])
                    rejected=rejected[len(rejected)-1]  
                else:
                    rejected=""

                if len(generated_bills)>0:
                    # for i in range(0,len(rejected)):
                    #     rejected.append(rejected[i][0])
                    generated_bills=generated_bills[len(generated_bills)-1]  
                else:
                    generated_bills=""
            
                if len(pending_contacts_user)>0:
                    pending=pending_contacts_user[len(pending_contacts_user)-1]
                else:
                    pending=""

                if len(pending_bank_user)>0:
                    bank_pending=pending_bank_user[len(pending_bank_user)-1]
                else:
                    bank_pending=""

                if len(updated_contact)>0:
                    updated_contact=updated_contact[len(updated_contact)-1]
                    
                else:
                    updated_contact=""

                if len(updated_bank)>0:
                    updated_bank=updated_bank[len(updated_bank)-1]
                else:
                    updated_bank=""
                # if len(disbursement_done)>0:
                #     disbursement_done=disbursement_done[len(disbursement_done)-1]
                # else:
                #     disbursement_done=""
                

                response={
                    "formdata":form_data,
                    "approved":approved,
                    "rejected":rejected,
                    "bills_generated":generated_bills,
                    "pending":pending,
                    "bank_pending":bank_pending,
                    "updated_contact":updated_contact,
                    "updated_bank":updated_bank,
                    # "disbursement_done":disbursement_done
                }
                return JsonResponse(response)
    except Exception as e:
        print(e)
        return JsonResponse({"Unsuccessful":404})


@csrf_exempt
def RejectedDetails(request):
    try:
        user_id=request.body.decode("utf-8")
        
        if user_id =="SRADMIN":
            user_totaldata=[]
            readOnlyStatus=False
        else:
            user_registered=list(FormData.objects.filter(register_id__icontains=user_id).values('id'))
            user_approved=list(Approved.objects.filter(register_id__icontains=user_id).values('id'))

            if len(user_registered)>0 or len(user_approved)>0:
                readOnlyStatus=True
            else:
                readOnlyStatus=False
            
            
            user_formdata=list(FormData.objects.filter(register_id__icontains=user_id).all().values())
            user_formdata1=list(Approved.objects.filter(register_id__icontains=user_id).all().values())
            
            user_formdata2=list(Rejected.objects.filter(register_id__icontains=user_id).all().values())

            user_totaldata=user_formdata+user_formdata1+user_formdata2
            
            if len(user_totaldata)>0:
                user_totaldata=user_totaldata[len(user_totaldata)-1]
            else:
                user_totaldata=[]
            
        return JsonResponse({"user_formdata":user_totaldata,"readonly":readOnlyStatus},safe=False)
        
    except Exception as e:
        return HttpResponse("Failed to fetch records")
      
@csrf_exempt
def FetchEditDetails(request):
    try:
        user_id=request.body.decode("utf-8")

        
        user_details=list(Approved.objects.filter(register_id__icontains=user_id).values('contactName','designation','telephone','contactName2','designation2','telephone2','contactName3','designation3','telephone3'))

        
        return JsonResponse(user_details[len(user_details)-1],safe=False)

    except Exception as e:
        return HttpResponse("unsuccessful")

@csrf_exempt
def EditDetails(request):
    try:
        edited_data=json.loads(request.body)
        formdata=edited_data['formcontent']
        try:
            val = formdata['telephone3']
            if not val:
                val=val or None
               
        except ValueError:
            val = None

        if val is not None or val:
            val=int(formdata['telephone3'])

        clone_data=OldDetails(
            contactName=formdata['contactName'],
            designation=formdata['designation'],
            telephone=formdata['telephone'],
            contactName2=formdata['contactName2'],
            designation2=formdata['designation2'],
            telephone2=formdata['telephone2'],
            contactName3=formdata['contactName3'],
            designation3=formdata['designation3'],
            telephone3=val,
            fullname=edited_data['fullname'],
            isadminverified=False
        )
        
        c=Approved.objects.get(register_id__icontains=edited_data['register_id'])
        clone_data.register_id=c
        clone_data.save()
        return JsonResponse("success",safe=False)
    except Exception as e:
        return HttpResponse("unsuccessful")

@csrf_exempt
def FetchAdminContacts(request):
    try:
        fetchforadmin=list(OldDetails.objects.filter(isadminverified=False).all().values())

        return JsonResponse(fetchforadmin,safe=False)

    except Exception as e:
        return HttpResponse("unsuccessful")
@csrf_exempt
def FinalEditApproval(request):
    try:
        final_data=json.loads(request.body)
        OldDetails.objects.filter(id=final_data['id']).update(isadminverified=True)
        
        new_details=list(OldDetails.objects.filter(id=final_data['id']).values_list('contactName','designation','telephone','contactName2','designation2','telephone2','contactName3','designation3','telephone3'))

        old_details=list(Approved.objects.filter(id=final_data['register_id']).values_list('contactName','designation','telephone','contactName2','designation2','telephone2','contactName3','designation3','telephone3'))

        
        OldDetails.objects.filter(id=final_data['id']).update(contactName=old_details[0][0],designation=old_details[0][1],telephone=old_details[0][2],
        contactName2=old_details[0][3],designation2=old_details[0][4],
        telephone2=old_details[0][5],
        contactName3=old_details[0][6],designation3=old_details[0][7],
        telephone3=old_details[0][8],approvedDate=datetime.date.today())
        
        Approved.objects.filter(id=final_data['register_id']).update(contactName=new_details[0][0],designation=new_details[0][1],telephone=new_details[0][2],
        contactName2=new_details[0][3],designation2=new_details[0][4],
        telephone2=new_details[0][5],
        contactName3=new_details[0][6],designation3=new_details[0][7],
        telephone3=new_details[0][8])
        
        return JsonResponse("Successfull",safe=False)
       
    
    except Exception as e:
        return HttpResponse(e,status=204)

@csrf_exempt
def FinalEditRejection(request):
    try:
        final_data=json.loads(request.body)
        
        OldDetails.objects.filter(id=final_data['id']).delete()

        return JsonResponse("Success",safe=False)

    except Exception as e:
        return HttpResponse("failed to reject")

@csrf_exempt
def GetEditBankDetails(request):
    try:
        request_data=json.loads(request.body)

        if request_data['type'] =='DSM':
            details=list(Approved.objects.filter(register_id__icontains=request_data['id']).values('accountName','accountNumber','bankName','branchName','ifscCode'))
        
        elif request_data['type'] =='RRAS':
            details=list(Approved.objects.filter(register_id__icontains=request_data['id']).values('accountName4','accountNumber4','bankName4','branchName4','ifscCode4'))
        
        elif request_data['type'] =='AGC':
            details=list(Approved.objects.filter(register_id__icontains=request_data['id']).values('accountName5','accountNumber5','bankName5','branchName5','ifscCode5'))

        elif request_data['type'] =='REACTIVE':
            details=list(Approved.objects.filter(register_id__icontains=request_data['id']).values('accountName2','accountNumber2','bankName2','branchName2','ifscCode2'))

        elif request_data['type'] =='SCED':
            details=list(Approved.objects.filter(register_id__icontains=request_data['id']).values('accountName6','accountNumber6','bankName6','branchName6','ifscCode6'))

        elif request_data['type'] =='CONGESTION':
            details=list(Approved.objects.filter(register_id__icontains=request_data['id']).values('accountName3','accountNumber3','bankName3','branchName3','ifscCode3'))
        
        return JsonResponse(details,safe=False)

    
    except Exception as e:
        return HttpResponse("unsuccessful")
@csrf_exempt
def UpdateBankDetails(request):
    try:
        requested_data=json.loads(request.body)

        update_bank=OldBankDetails2(
            acctype=requested_data['type'],
            accountName=requested_data['accName'],
            accountNumber=requested_data['accNum'],
            bankName=requested_data['bankName'],
            branchName=requested_data['branchName'],
            fullname=requested_data['fullname'],
            ifscCode=requested_data['ifsc']
        )

        c=Approved.objects.get(register_id__icontains=requested_data['id'])
        update_bank.register_id=c
        update_bank.save()

        return JsonResponse("success",safe=False)
    
    except Exception as e:
        return HttpResponse("unsuccessful")


@csrf_exempt
def FetchAdminBankDetails(request):
    try:
        fetchforadmin=list(OldBankDetails2.objects.filter(isadminverified=False).all().values())

        return JsonResponse(fetchforadmin,safe=False)

    except Exception as e:
        return HttpResponse("unsuccessful")

def FinalBankApproval(request):
    try:
        requested_data=json.loads(request.body)
        
        new_details=list(OldBankDetails2.objects.filter(id=requested_data['id']).values_list('acctype','accountName','accountNumber','bankName','branchName','ifscCode'))
    
        
        if new_details[0][0] =='DSM':
            old_details=list(Approved.objects.filter(id=requested_data['register_id']).values_list('accountName','accountNumber','bankName','branchName','ifscCode'))
        elif new_details[0][0]=='RRAS':
            old_details=list(Approved.objects.filter(id=requested_data['register_id']).values_list('accountName4','accountNumber4','bankName4','branchName4','ifscCode4'))
        elif new_details[0][0]=='AGC':
            old_details=list(Approved.objects.filter(id=requested_data['register_id']).values_list('accountName5','accountNumber5','bankName5','branchName5','ifscCode5'))
        elif new_details[0][0]=='REACTIVE':
            old_details=list(Approved.objects.filter(id=requested_data['register_id']).values_list('accountName2','accountNumber2','bankName2','branchName2','ifscCode2'))
        elif new_details[0][0]=='SCED':
            old_details=list(Approved.objects.filter(id=requested_data['register_id']).values_list('accountName6','accountNumber6','bankName6','branchName6','ifscCode6'))
        elif new_details[0][0]=='CONGESTION':
            old_details=list(Approved.objects.filter(id=requested_data['register_id']).values_list('accountName3','accountNumber3','bankName3','branchName3','ifscCode3'))

        
        OldBankDetails2.objects.filter(id=requested_data['id']).update(accountName=old_details[0][0],accountNumber=old_details[0][1],bankName=old_details[0][2],
        branchName=old_details[0][3],ifscCode=old_details[0][4])

        
        if new_details[0][0]=='DSM':
            Approved.objects.filter(id=requested_data['register_id']).update(accountName=new_details[0][1],accountNumber=new_details[0][2],bankName=new_details[0][3],branchName=new_details[0][4],ifscCode=new_details[0][5],validfrom=datetime.date.today(),validtill=datetime.date(2045, 9, 6))
        
        elif new_details[0][0]=='RRAS':
            Approved.objects.filter(id=requested_data['register_id']).update(accountName4=new_details[0][1],accountNumber4=new_details[0][2],bankName4=new_details[0][3],branchName4=new_details[0][4],ifscCode4=new_details[0][5],validfrom=datetime.date.today(),validtill=datetime.date(2045, 9, 6))
        elif new_details[0][0]=='AGC':
            Approved.objects.filter(id=requested_data['register_id']).update(accountName5=new_details[0][1],accountNumber5=new_details[0][2],bankName5=new_details[0][3],branchName5=new_details[0][4],ifscCode5=new_details[0][5],validfrom=datetime.date.today(),validtill=datetime.date(2045, 9, 6))
        elif new_details[0][0]=='REACTIVE':
            Approved.objects.filter(id=requested_data['register_id']).update(accountName2=new_details[0][1],accountNumber2=new_details[0][2],bankName2=new_details[0][3],branchName2=new_details[0][4],ifscCode2=new_details[0][5],validfrom=datetime.date.today(),validtill=datetime.date(2045, 9, 6))
        elif new_details[0][0]=='SCED':
            Approved.objects.filter(id=requested_data['register_id']).update(accountName6=new_details[0][1],accountNumber6=new_details[0][2],bankName6=new_details[0][3],branchName6=new_details[0][4],ifscCode6=new_details[0][5],validfrom=datetime.date.today(),validtill=datetime.date(2045, 9, 6))
        elif new_details[0][0]=='CONGESTION':
            Approved.objects.filter(id=requested_data['register_id']).update(accountName3=new_details[0][1],accountNumber3=new_details[0][2],bankName3=new_details[0][3],branchName3=new_details[0][4],ifscCode3=new_details[0][5],validfrom=datetime.date.today(),validtill=datetime.date(2045, 9, 6))
        OldBankDetails2.objects.filter(id=requested_data['id']).update(isadminverified=True)
        return JsonResponse("successful",safe=False)

    except Exception as e:
        print(e)
        return HttpResponse(e)

def FinalBankRejection(request):
    try:
        
        unique_id=json.loads(request.body)

        OldBankDetails2.objects.filter(id=unique_id['id']).delete()

        return JsonResponse("Success",safe=False)

    except Exception as e:
        return HttpResponse("failed to reject")

def GetBankImages(request):
    try:
        
        user_data=json.loads(request.body)
        register_id=list(Approved.objects.filter(id=user_data['register_id_id']).values_list('register_id'))
        
        register_id=register_id[0][0].replace(' ','')
        if len(register_id)>0:
            imageurls=list(BankEditedImages.objects.filter(entityName__icontains=register_id).order_by('-id')[:3].values_list('image_url'))
        else:
            imageurls=[]
        
        
        return JsonResponse(imageurls,safe=False)

    except Exception as e:
        return HttpResponse(e)

