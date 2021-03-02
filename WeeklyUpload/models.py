from django.db import models
from datetime import datetime
from jsonfield import JSONField

class ConfigureModel(models.Model):
    Fin_year=models.CharField(max_length=15,blank=True)
    Week_no=models.IntegerField(blank=True)
    Consider_Week_no=models.CharField(max_length=10,default="null")
    Week_startdate=models.DateField(auto_now=True,blank=True)
    Week_enddate=models.DateField(auto_now=True,blank=True)
    Revision_no=models.CharField(default="null",max_length=255)
    Letter_refno=models.CharField(default="null",max_length=255)
    Letter_date=models.DateField(auto_now=True,blank=True)
    Payment_date=models.DateField(auto_now=True,blank=True)
    Disbursement_date=models.DateField(default=datetime.now,blank=True)
    Lc_date=models.DateField(auto_now=True,blank=True)
    Interest_levydate=models.DateField(auto_now=True,blank=True)
    # Deviation Data also 
    Entity=models.CharField(max_length=255,default="null",blank=True)
    DevAdditional=models.BigIntegerField(blank=True)
    DevAdditionalSignChange=models.BigIntegerField(blank=True)
    DevPostfacto=models.BigIntegerField(blank=True)
    DevNormal=models.BigIntegerField(blank=True)
    DevFinal=models.BigIntegerField(blank=True)
    Outstandings=models.BigIntegerField(default=0,blank=True)
    Status=models.CharField(default="Notified",max_length=100)
    PayableorReceivable=models.CharField(max_length=25,default="null",blank=True)
    image_url=models.URLField(max_length=200,default="null")
    is_entered_payment=models.BooleanField(default=False)
    
    modified_remarks=models.CharField(max_length=255,default="null")
    registration_id=models.CharField(max_length=100,default="null")    # Deviation_file=JSONField(default="null")

    def __str__(self):
        return self.Revision_no


class UniqueState(models.Model):
    entity=models.CharField(max_length=200)
    registration_id=models.CharField(max_length=100)

    def __str__(self):
        return self.entity


class PaymentStatus(models.Model):
    Pay_type=models.CharField(max_length=15,blank=True)
    Pay_refno=models.CharField(max_length=100,blank=True)
    Pay_date=models.DateField(blank=True)
    Pay_amount=models.BigIntegerField(blank=True)
    Dev_final=models.BigIntegerField(blank=True)
    Due_amount=models.BigIntegerField(default=0,blank=True)
    Paid_by=models.CharField(default="null",max_length=250)
    Paid_for=models.CharField(default="null",max_length=250)
    Remarks=models.CharField(default="null",max_length=100)
    Status=models.CharField(max_length=50,default="Created")
    # isforSurcharge=models.BooleanField(default=False)
    reject_remarks=models.CharField(max_length=255,default="Null")
    # week_considered=models.BigIntegerField(null=True)
    registration_id=models.ForeignKey(ConfigureModel,on_delete=models.CASCADE)
     

    def __str__(self):
        return self.Status

class MiscPaymentStatus(models.Model):
    Fin_year=models.CharField(max_length=15,default="null",blank=True)
    Week=models.CharField(max_length=15,default="null",blank=True)
    Actual_Week=models.CharField(max_length=15,default="null")
    Pay_type=models.CharField(max_length=15,blank=True)
    Pay_refno=models.CharField(max_length=100,blank=True)
    Pay_date=models.DateField(blank=True)
    Pay_amount=models.BigIntegerField(blank=True)
    Paid_by=models.CharField(default="null",max_length=250)
    Paid_for=models.CharField(default="null",max_length=250)
    Remarks=models.CharField(default="null",max_length=100)
    dsmduepoolmodel_id=models.CharField(default="null",max_length=100)
    # isConsideredInBilling=models.BooleanField(default=False)
    registration_id=models.CharField(max_length=15,default="SRADMIN")

    def __str__(self):
        return self.Status

import datetime
now = datetime.datetime.now()
nextyear=str(now.year+1)
current_year=str(now.year)+"-"+nextyear

class DSMDuePool(models.Model):
    
    year=models.CharField(max_length=10,default=current_year)

    from_year=models.BigIntegerField(default=None)
    to_year=models.BigIntegerField(default=None)

    actual_weekno=models.CharField(max_length=10,null=True)
    considered_weekno=models.CharField(max_length=10,null=True)

    dueinpool=models.BigIntegerField(blank=True)
    
    transdate=models.DateTimeField(auto_now_add=True, null=True)
    
    def __str__(self):
        return self.dueinpool

class SurchargeModel(models.Model):
    import datetime
    year=models.CharField(max_length=10,default=None)
    month=models.CharField(max_length=10,default=None)
    srpc_duedate=models.DateField(default=None)
    devfinal=models.BigIntegerField(blank=True,default=None)
    paid_date=models.DateField(default=None)
    paid_amount=models.BigIntegerField(blank=True,default=None)
    calinterest=models.BigIntegerField(blank=True,default=None)
    # outstanding=models.BigIntegerField(default=0)
    Status=models.CharField(max_length=50,default="Notified")
    isConsideredInBilling=models.BooleanField(default=True)

    actual_paid_date=models.DateField(default=None,blank=True)
    reference_id=models.ForeignKey(ConfigureModel,on_delete=models.CASCADE)
    
    def __str__(self):
        return self.reference_id
    
class SRPCFiles(models.Model):
    year=models.CharField(max_length=50,default="2020-21")
    weekNo=models.CharField(max_length=50,default="1")
    
    image_url=models.URLField(max_length=200,default="null")

    class Meta:
        db_table = "SRPC_Files"


class ChatAllMessages(models.Model):
    # registration_id=models.CharField(max_length=50,default="null")
    import datetime
    user_id=models.CharField(max_length=50,default="null")              #Short Name
    sender=models.CharField(max_length=200,default="null")
    receiver=models.CharField(max_length=200,default="null")
    message=models.TextField()
    timestamp=models.DateTimeField(default=format(datetime.datetime.now()))
    
    def __str__(self):
        return self.user_id

# class FinalPayDisburse(models.Model):
#     year=models.CharField(max_length=20,default="2020-21")
#     weekno=models.CharField(max_length=20,default="null")
#     pay_constituent=models.CharField(max_length=150,default="null")
#     devfinal=models.BigIntegerField(blank=True)
#     paymentdate=models.DateField(auto_now=True,blank=True)
#     amountpaid=models.BigIntegerField(blank=True)
#     outstanding=models.BigIntegerField(blank=True)
#     registration_id=models.CharField(max_length=50,default="null")
#     def __str__(self):
#         return self.pay_constituent

class FinalPayDisburse1(models.Model):
    year=models.CharField(max_length=20,default="2020-21")
    weekno=models.CharField(max_length=20,default="null")
    pay_constituent=models.CharField(max_length=150,default="null")
    devfinal=models.BigIntegerField(blank=True)
    paymentdate=models.DateField(auto_now=True,blank=True)
    amountpaid=models.BigIntegerField(blank=True)
    outstanding=models.BigIntegerField(blank=True)
    registration_id=models.ForeignKey(ConfigureModel,on_delete=models.CASCADE)
    def __str__(self):
        return self.pay_constituent


# class TestModel(models.Model):
#     test_var=models.CharField(max_length=10,default=None)

class FinalReceiveDisburse1(models.Model):
    # year=models.CharField(max_length=20,default="2020-21")
    # weekno=models.CharField(max_length=20,default="null")
    # receive_constituent=models.CharField(max_length=150,default="null")
    # devfinal=models.BigIntegerField(blank=True)       #Totalamount to receive
    disburseamount=models.BigIntegerField(blank=True)   #Either Pro rata or total disburse
    disbursedate=models.DateField(auto_now=True,blank=True)    #Date of disbursement
    duetopool=models.BigIntegerField(blank=True)
    registration_id=models.ForeignKey(ConfigureModel,on_delete=models.CASCADE)
    
    def __str__(self):
        return self.registration_id

class YearCalendar(models.Model):
    year=models.CharField(max_length=20,default="2020-21")
    weekno=models.CharField(max_length=20,default="null")
    Week_startdate=models.DateField(default="null",blank=True)
    Week_enddate=models.DateField(default="null",blank=True)
    srpc_date=models.DateField(default="null",blank=True)
    due_date=models.DateField(default="null",blank=True)
    disbursement_date=models.DateField(default="null",blank=True)
    
    class Meta:
        db_table = "YearCalendar"

    def __str__(self):
        return self.weekno


class DisbursedDate(models.Model):
    year=models.CharField(max_length=20,default=None)
    weekno=models.CharField(max_length=20,default=None)
    disbursed_date=models.DateField(default=None,blank=True)
    
    class Meta:
        db_table = "DisbursedDate"

    def __str__(self):
        return self.disbursed_date

class MOEmployeeUser(models.Model):
    empno=models.CharField(max_length=50,default=None)
    name=models.CharField(max_length=100,default=None)
    email=models.CharField(max_length=100,default=None)
    designation=models.CharField(max_length=100,default=None)
    contact_number=models.BigIntegerField(blank=True,default=None)
    image_url=models.URLField(max_length=200,default=None)
    registration_id=models.CharField(max_length=50,default="SRADMIN")

    def __str__(self):
        return self.empno

class TempDisburseData(models.Model):
    disburseamount=models.BigIntegerField(blank=True)   #Either Pro rata or total disburse
    duetopool=models.BigIntegerField(blank=True)
    registration_id=models.ForeignKey(ConfigureModel,on_delete=models.CASCADE)

    def __str__(self):
        return self.registration_id

class ApproveAuthority(models.Model):
    Fin_year=models.CharField(max_length=15,default=None)
    Week_no=models.IntegerField(default=None)
    created_by=models.CharField(max_length=100,default=None)
    review_auth1=models.CharField(max_length=100,default=None)
    review_auth2=models.CharField(max_length=100,default=None)
    remarks=models.CharField(max_length=100,default="Null")
    status=models.IntegerField(default=None)

    def __str__(self):
        return self.Week_no

class TempDisburseDataPreviousWeeks(models.Model):
    disburseamount=models.BigIntegerField(blank=True)   #Either Pro rata or total disburse
    duetopool=models.BigIntegerField(blank=True)
    registration_id=models.ForeignKey(ConfigureModel,on_delete=models.CASCADE)

    def __str__(self):
        return self.registration_id

class ApproveAuthorityPreviousWeeks(models.Model):
    Fin_year=models.CharField(max_length=15,default=None)
    Week_no=models.IntegerField(default=None)
    created_by=models.CharField(max_length=100,default=None)
    review_auth1=models.CharField(max_length=100,default=None)
    review_auth2=models.CharField(max_length=100,default=None)
    remarks=models.CharField(max_length=100,default="Null")
    status=models.IntegerField(default=None)

    def __str__(self):
        return self.Week_no

class IntPaymentStatus(models.Model):
    Fin_year=models.CharField(max_length=15,default=None)
    Actual_Week=models.CharField(max_length=15,default=None)
    Pay_type=models.CharField(max_length=15,default=None)
    Pay_refno=models.CharField(max_length=100,default=None)
    Pay_date=models.DateField(default=None)
    Pay_amount=models.BigIntegerField(default=None)
    Paid_by=models.CharField(default=None,max_length=250)
    Paid_for=models.CharField(default=None,max_length=250)
    Remarks=models.CharField(default=None,max_length=100)
    dsmduepoolmodel_id=models.CharField(default=None,max_length=100)
    registration_id=models.CharField(max_length=15,default="SRADMIN")

class PSDFPaymentStatus(models.Model):
    Fin_year=models.CharField(max_length=15,default=None)
    Actual_Week=models.CharField(max_length=15,default=None)
    Pay_type=models.CharField(max_length=15,default=None)
    Pay_refno=models.CharField(max_length=100,default=None)
    Pay_date=models.DateField(default=None)
    Pay_amount=models.BigIntegerField(default=None)
    Paid_by=models.CharField(default=None,max_length=250)
    Paid_for=models.CharField(default=None,max_length=250)
    Remarks=models.CharField(default=None,max_length=100)
    dsmduepoolmodel_id=models.CharField(default=None,max_length=100)
    registration_id=models.CharField(max_length=15,default="SRADMIN")

class ExcessPaymentStatus(models.Model):
    Fin_year=models.CharField(max_length=15,default=None)
    Actual_Week=models.CharField(max_length=15,default=None)
    Pay_type=models.CharField(max_length=15,default=None)
    Pay_refno=models.CharField(max_length=100,default=None)
    Pay_date=models.DateField(default=None)
    Pay_amount=models.BigIntegerField(default=None)
    Paid_by=models.CharField(default=None,max_length=250)
    Paid_for=models.CharField(default=None,max_length=250)
    Remarks=models.CharField(default=None,max_length=100)
    dsmduepoolmodel_id=models.CharField(default=None,max_length=100)
    registration_id=models.CharField(max_length=15,default="SRADMIN")

class DSMRRASBothSidesTransfers(models.Model):
    Fin_year=models.CharField(max_length=15,default=None)
    Actual_Week=models.CharField(max_length=15,default=None)
    Pay_type=models.CharField(max_length=15,default=None)
    Pay_refno=models.CharField(max_length=100,default=None)
    Pay_date=models.DateField(default=None)
    Pay_amount=models.BigIntegerField(default=None)
    Remarks=models.CharField(default=None,max_length=100)
    dsmduepoolmodel_id=models.CharField(default=None,max_length=100)
    rrasduepoolmodel_id=models.CharField(default=None,max_length=100)
