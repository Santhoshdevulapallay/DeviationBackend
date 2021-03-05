from django.db import models
from django.contrib.auth.models import AbstractUser
from WeeklyUpload.models import *
import datetime

class User(AbstractUser):
    registration_id = models.CharField(max_length=20,default="null",blank=True)
    def __str__(self):
        return self.registration_id

class EmployeeUser1(models.Model):
    empno=models.CharField(max_length=50,default=None)
    name=models.CharField(max_length=100,default=None)
    email=models.CharField(max_length=100,default=None)
    designation=models.CharField(max_length=100,default=None)
    contact_number=models.BigIntegerField(blank=True,default=None)
    # propose_rights=models.BooleanField(default=False)
    # check_rights=models.BooleanField(default=False)
    # approve_rights=models.BooleanField(default=False)
    # usertype=models.CharField(max_length=100,default="MOEmployee")
    registration_id=models.ForeignKey(User,on_delete=models.CASCADE)
    def __str__(self):
        return self.name


class GeneralEntities1(models.Model):
    alias1 = models.CharField(max_length=30, blank=True,default="null")
    alias2 = models.CharField(max_length=30, blank=True,default="null")
    alias3 = models.CharField(max_length=30, blank=True,default="null")
    alias4 = models.CharField(max_length=30, blank=True,null=True,default="null")
    fullname=models.CharField(max_length=200,blank=True,default="null")
    dateofregistration=models.DateField(auto_now=True,blank=True)
    email=models.CharField(default="test@test.com",max_length=50)
    shortname=models.CharField(max_length=50,default="null",blank=True)
    usercategory=models.CharField(max_length=100,default="null")
    usertype=models.CharField(max_length=100,default="null")
    mobileno=models.BigIntegerField(default=None)
    registration_id=models.ForeignKey(User,on_delete=models.CASCADE)
    
    def __str__(self):
        return self.shortname

class FormData(models.Model):
    entityName=models.CharField(max_length=255,default="Null")
    regAddress=models.CharField(max_length=255,default="Null")
    region=models.CharField(max_length=255,default="Null")
    userCategory=models.CharField(max_length=255,default="Null")
   
    # created_by=models.CharField(max_length=100,default=None)
    review_auth1=models.CharField(max_length=100,default=None)
    review_auth2=models.CharField(max_length=100,default=None)
    auth1_remarks=models.CharField(max_length=100,default="Null")
    auth2_remarks=models.CharField(max_length=100,default="Null")

    reject_remarks1=models.CharField(max_length=100,default="Null")
    reject_remarks2=models.CharField(max_length=100,default="Null") 
    status=models.IntegerField(default=None)

    id=models.CharField(primary_key=True,max_length=255)
    register_id=models.CharField(max_length=100,default="Null")

    def __str__(self):
        return self.entityName

class ContactDetails(models.Model):
    contactName=models.CharField(max_length=255,default=None)
    designation=models.CharField(max_length=255,default=None)
    telephone=models.BigIntegerField(blank=True,default=None)
    contactName2=models.CharField(max_length=255,default=None)
    designation2=models.CharField(max_length=255,default=None)
    telephone2=models.BigIntegerField(blank=True,default=None)
    contactName3=models.CharField(max_length=255,default="NULL",null=True)
    designation3=models.CharField(max_length=255,default="NULL",null=True)
    telephone3=models.BigIntegerField(blank=True,default=0,null=True)
    register_id=models.ForeignKey(FormData,on_delete=models.CASCADE)

class BankPANDetails(models.Model):
    #DSM Account Details
    accountName=models.CharField(max_length=255,default="Null",null=True)
    accountNumber=models.BigIntegerField(blank=True,default=0,null=True)
    bankName=models.CharField(max_length=255,default="Null",null=True)
    branchName=models.CharField(max_length=255,default="Null",null=True)
    ifscCode=models.CharField(max_length=100,default="Null",null=True)
     # REACTIVE Account Details
    accountName2=models.CharField(max_length=255,default="Null",null=True)
    accountNumber2=models.BigIntegerField(blank=True,default=0,null=True)
    bankName2=models.CharField(max_length=255,default="Null",null=True)
    branchName2=models.CharField(max_length=255,default="Null",null=True)
    ifscCode2=models.CharField(max_length=100,default="Null",null=True)
    # CONGESTION account Details
    accountName3=models.CharField(max_length=255,default="Null",null=True)
    accountNumber3=models.BigIntegerField(blank=True,default=0,null=True)
    bankName3=models.CharField(max_length=255,default="Null",null=True)
    branchName3=models.CharField(max_length=255,default="Null",null=True)
    ifscCode3=models.CharField(max_length=100,default="Null",null=True)

    # RRAS account Details
    accountName4=models.CharField(max_length=255,default="Null",null=True)
    accountNumber4=models.BigIntegerField(blank=True,default=0,null=True)
    bankName4=models.CharField(max_length=255,default="Null",null=True)
    branchName4=models.CharField(max_length=255,default="Null",null=True)
    ifscCode4=models.CharField(max_length=100,default="Null",null=True)

    # AGC account Details
    accountName5=models.CharField(max_length=255,default="Null",null=True)
    accountNumber5=models.BigIntegerField(blank=True,default=0,null=True)
    bankName5=models.CharField(max_length=255,default="Null",null=True)
    branchName5=models.CharField(max_length=255,default="Null",null=True)
    ifscCode5=models.CharField(max_length=100,default="Null",null=True)

    # SCED account Details
    accountName6=models.CharField(max_length=255,default="Null",null=True)
    accountNumber6=models.BigIntegerField(blank=True,default=0,null=True)
    bankName6=models.CharField(max_length=255,default="Null",null=True)
    branchName6=models.CharField(max_length=255,default="Null",null=True)
    ifscCode6=models.CharField(max_length=100,default="Null",null=True)

    #TAX Details
    pannumber=models.CharField(max_length=15,default="Null",null=True)
    tannumber=models.CharField(max_length=20,default="Null",null=True)
    gstinnumber=models.CharField(max_length=30,default="Null",null=True)

    bpregister_id=models.ForeignKey(FormData,on_delete=models.CASCADE)

class Approved(models.Model):
    entityName=models.CharField(max_length=255)
    regAddress=models.CharField(max_length=255)
    region=models.CharField(max_length=255)
    userCategory=models.CharField(max_length=255)
    contactName=models.CharField(max_length=255)
    designation=models.CharField(max_length=255)
    telephone=models.BigIntegerField(default=None)
    contactName2=models.CharField(max_length=255)
    designation2=models.CharField(max_length=255)
    telephone2=models.BigIntegerField(default=None)
    contactName3=models.CharField(max_length=255,null=True,blank=True)
    designation3=models.CharField(max_length=255,null=True,blank=True)
    telephone3=models.BigIntegerField(null=True,blank=True)
    #DSM Bank Details 
    accountName=models.CharField(max_length=255)
    accountNumber=models.BigIntegerField(blank=True,null=True,default="Null")
    bankName=models.CharField(max_length=255)
    branchName=models.CharField(max_length=255)
    ifscCode=models.CharField(max_length=100,default="Null")
    # shortName=models.CharField(max_length=100,default="Null")
     # REACTIVE Account Details
    accountName2=models.CharField(max_length=255,default="Null")
    accountNumber2=models.BigIntegerField(blank=True,null=True,default="Null")
    bankName2=models.CharField(max_length=255,default="Null")
    branchName2=models.CharField(max_length=255,default="Null")
    ifscCode2=models.CharField(max_length=100,default="Null")
    # CONGESTION account Details
    accountName3=models.CharField(max_length=255,default="Null")
    accountNumber3=models.BigIntegerField(blank=True,null=True,default="Null")
    bankName3=models.CharField(max_length=255,default="Null")
    branchName3=models.CharField(max_length=255,default="Null")
    ifscCode3=models.CharField(max_length=100,default="Null")

    # RRAS account Details
    accountName4=models.CharField(max_length=255,default="Null")
    accountNumber4=models.BigIntegerField(blank=True,null=True,default="Null")
    bankName4=models.CharField(max_length=255,default="Null")
    branchName4=models.CharField(max_length=255,default="Null")
    ifscCode4=models.CharField(max_length=100,default="Null")

    # AGC account Details
    accountName5=models.CharField(max_length=255,default="Null")
    accountNumber5=models.BigIntegerField(blank=True,null=True,default="Null")
    bankName5=models.CharField(max_length=255,default="Null")
    branchName5=models.CharField(max_length=255,default="Null")
    ifscCode5=models.CharField(max_length=100,default="Null")

    # SCED account Details
    accountName6=models.CharField(max_length=255,default="Null")
    accountNumber6=models.BigIntegerField(blank=True,null=True,default="Null")
    bankName6=models.CharField(max_length=255,default="Null")
    branchName6=models.CharField(max_length=255,default="Null")
    ifscCode6=models.CharField(max_length=100,default="Null")

    pannumber=models.CharField(max_length=20,default="Null")
    tannumber=models.CharField(max_length=20,default="Null")
    gstinnumber=models.CharField(max_length=20,default="Null")

    remarks=models.CharField(max_length=255,default="Null")
    adminremarks=models.CharField(max_length=255,default="Null")

    validfrom=models.DateField(default=datetime.date.today,blank=True)
    validtill=models.DateField(default=datetime.date(2045, 9, 6),blank=True)
    register_id=models.CharField(max_length=100,default="Null")
    id=models.CharField(primary_key=True,max_length=255)

    def __str__(self):
        return self.entityName



class Rejected(models.Model):
    entityName=models.CharField(max_length=255)
    regAddress=models.CharField(max_length=255)
    region=models.CharField(max_length=255)
    userCategory=models.CharField(max_length=255)
    contactName=models.CharField(max_length=255)
    designation=models.CharField(max_length=255)
    telephone=models.BigIntegerField(default=None)
    contactName2=models.CharField(max_length=255)
    designation2=models.CharField(max_length=255)
    telephone2=models.BigIntegerField(default=None)
    contactName3=models.CharField(max_length=255,null=True,blank=True)
    designation3=models.CharField(max_length=255,null=True,blank=True)
    telephone3=models.BigIntegerField(null=True,blank=True)

    accountName=models.CharField(max_length=255)
    accountNumber=models.BigIntegerField(blank=True,default=None)
    bankName=models.CharField(max_length=255)
    branchName=models.CharField(max_length=255)
    ifscCode=models.CharField(max_length=100,default="Null")

    accountName2=models.CharField(max_length=255,default="Null")
    accountNumber2=models.BigIntegerField(blank=True,default=None)
    bankName2=models.CharField(max_length=255,default="Null")
    branchName2=models.CharField(max_length=255,default="Null")
    ifscCode2=models.CharField(max_length=100,default="Null")
    # CONGESTION account Details
    accountName3=models.CharField(max_length=255,default="Null")
    accountNumber3=models.BigIntegerField(blank=True,default=None)
    bankName3=models.CharField(max_length=255,default="Null")
    branchName3=models.CharField(max_length=255,default="Null")
    ifscCode3=models.CharField(max_length=100,default="Null")

    # RRAS account Details
    accountName4=models.CharField(max_length=255,default="Null")
    accountNumber4=models.BigIntegerField(blank=True,default=None)
    bankName4=models.CharField(max_length=255,default="Null")
    branchName4=models.CharField(max_length=255,default="Null")
    ifscCode4=models.CharField(max_length=100,default="Null")

    # AGC account Details
    accountName5=models.CharField(max_length=255,default="Null")
    accountNumber5=models.BigIntegerField(blank=True,default=None)
    bankName5=models.CharField(max_length=255,default="Null")
    branchName5=models.CharField(max_length=255,default="Null")
    ifscCode5=models.CharField(max_length=100,default="Null")

    # SCED account Details
    accountName6=models.CharField(max_length=255,default="Null")
    accountNumber6=models.BigIntegerField(blank=True,default=None)
    bankName6=models.CharField(max_length=255,default="Null")
    branchName6=models.CharField(max_length=255,default="Null")
    ifscCode6=models.CharField(max_length=100,default="Null")

    pannumber=models.CharField(max_length=20,default="Null")
    tannumber=models.CharField(max_length=20,default="Null")
    gstinnumber=models.CharField(max_length=20,default="Null")
    adminremarks=models.CharField(max_length=255,default="Null")


    remarks=models.CharField(max_length=150,default="Null",blank=True)
    register_id=models.CharField(max_length=100,default="Null")
    id=models.CharField(primary_key=True,max_length=255)

    def __str__(self):
        return self.entityName


class OldDetails(models.Model):
    contactName=models.CharField(max_length=100,default="Null")
    designation=models.CharField(max_length=255,default="Null")
    telephone=models.BigIntegerField(default=None,blank=True)
    contactName2=models.CharField(max_length=255,default="Null")
    designation2=models.CharField(max_length=255,default="Null")
    telephone2=models.BigIntegerField(default=None,blank=True)
    contactName3=models.CharField(max_length=255,default="Null",blank=True)
    designation3=models.CharField(max_length=255,default="Null",blank=True)
    telephone3=models.BigIntegerField(default=None,blank=True)

    isadminverified=models.BooleanField(default=False)
    approvedDate=models.DateField(default=datetime.date.today,blank=True)
    fullname=models.CharField(max_length=100,default="Null")
    register_id=models.ForeignKey(Approved,on_delete=models.CASCADE,default="Null")

    def __str__(self):
        return self.contactName

class OldBankDetails2(models.Model):
    acctype=models.CharField(max_length=50,default="DSM")
    accountName=models.CharField(max_length=100,default="Null")
    accountNumber=models.BigIntegerField(blank=True,default=None)
    bankName=models.CharField(max_length=255,default="Null")
    branchName=models.CharField(max_length=255,default="Null")
    ifscCode=models.CharField(max_length=255,default="Null")
    fullname=models.CharField(max_length=255,default="Null")

    isadminverified=models.BooleanField(default=False)

    validfrom=models.DateField(default=datetime.date.today,blank=True)
    validtill=models.DateField(default=datetime.date(2045, 9, 6),blank=True)
    register_id=models.ForeignKey(Approved,on_delete=models.CASCADE,default="Null")

    def __str__(self):
        return self.acctype

class OldBankDetails(models.Model):
    accountName=models.CharField(max_length=255)
    accountNumber=models.BigIntegerField(blank=True,default=None)
    bankName=models.CharField(max_length=255)
    branchName=models.CharField(max_length=255)
    ifscCode=models.CharField(max_length=100,default="Null")
    # shortName=models.CharField(max_length=100,default="Null")
     # REACTIVE Account Details
    accountName2=models.CharField(max_length=255,default="Null")
    accountNumber2=models.BigIntegerField(blank=True,default=None)
    bankName2=models.CharField(max_length=255,default="Null")
    branchName2=models.CharField(max_length=255,default="Null")
    ifscCode2=models.CharField(max_length=100,default="Null")
    # CONGESTION account Details
    accountName3=models.CharField(max_length=255,default="Null")
    accountNumber3=models.BigIntegerField(blank=True,default=None)
    bankName3=models.CharField(max_length=255,default="Null")
    branchName3=models.CharField(max_length=255,default="Null")
    ifscCode3=models.CharField(max_length=100,default="Null")

    # RRAS account Details
    accountName4=models.CharField(max_length=255,default="Null")
    accountNumber4=models.BigIntegerField(blank=True,default=None)
    bankName4=models.CharField(max_length=255,default="Null")
    branchName4=models.CharField(max_length=255,default="Null")
    ifscCode4=models.CharField(max_length=100,default="Null")

    # AGC account Details
    accountName5=models.CharField(max_length=255,default="Null")
    accountNumber5=models.BigIntegerField(blank=True,default=None)
    bankName5=models.CharField(max_length=255,default="Null")
    branchName5=models.CharField(max_length=255,default="Null")
    ifscCode5=models.CharField(max_length=100,default="Null")

    # SCED account Details
    accountName6=models.CharField(max_length=255,default="Null")
    accountNumber6=models.BigIntegerField(blank=True,default=None)
    bankName6=models.CharField(max_length=255,default="Null")
    branchName6=models.CharField(max_length=255,default="Null")
    ifscCode6=models.CharField(max_length=100,default="Null")

    validfrom=models.DateField(default=datetime.date.today,blank=True)
    validtill=models.DateField(default=datetime.date(2045, 9, 6),blank=True)

    isadminverified=models.BooleanField(default=False)
    register_id=models.ForeignKey(Approved,on_delete=models.CASCADE,default="Null")

    def __str__(self):
        return self.accountName

class ApplicantImages(models.Model):
    entityName=models.CharField(max_length=100,default="null")
    # username=models.ForeignKey(User,on_delete=models.CASCADE,max_length=100,default="santhosh")
    image_url=models.URLField(max_length=200,default="null")

    class Meta:
        db_table = "images"

class BankEditedImages(models.Model):
    entityName=models.CharField(max_length=100,default="null")
    # username=models.ForeignKey(User,on_delete=models.CASCADE,max_length=100,default="santhosh")
    image_url=models.URLField(max_length=200,default="null")

    class Meta:
        db_table = "bank_images"

class BankDetails(models.Model):
    accountname=models.CharField(max_length=100,default="null")
    bankname=models.CharField(max_length=100,default="null")
    accountnumber=models.IntegerField(default="null")
    branchname=models.CharField(max_length=100,default="null")
    ifsccode=models.CharField(max_length=100,default="null")
    validfrom=models.DateField(max_length=100,default="null")
    validtill=models.DateField(max_length=100,default="null")
    
    class Meta:
        db_table = "bankdetails"

    def __str__(self):
        return self.accountname

class EmployeeSigns(models.Model):
    empno=models.ForeignKey(EmployeeUser1,on_delete=models.CASCADE)
    image_url=models.URLField(max_length=200,default=None)
    # empno actually mapped to Employeeuser1 table acting as foreign key
    class Meta:
        db_table = "Employee_signs"

# class RegApproveAuthority(models.Model):
#     created_by=models.CharField(max_length=100,default=None)
#     review_auth1=models.CharField(max_length=100,default=None)
#     review_auth2=models.CharField(max_length=100,default=None)
#     auth1_remarks=models.CharField(max_length=100,default="Null")
#     auth2_remarks=models.CharField(max_length=100,default="Null")
#     status=models.IntegerField(default=None)

#     def __str__(self):
#         return self.created_by