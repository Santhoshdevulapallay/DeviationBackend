from django.db import models
from django.contrib.postgres.fields import ArrayField
# Create your models here.
class RevisionsBaseModel(models.Model):
    Fin_year=models.CharField(max_length=15,default=None)
    Week_no=ArrayField(models.CharField(max_length=200), blank=True)
    # Consider_Week_no=models.CharField(max_length=10,default=None)
    srpc_Startdate=models.DateField(default=None)
    srpc_Enddate=models.DateField(default=None)
    Revision_no=models.CharField(default=None,max_length=255)
    Letter_refno=models.CharField(default=None,max_length=255)
    Letter_date=models.DateField(default=None)
    Due_date=models.DateField(default=None)
    Disbursement_date=models.DateField(default=None)
    Lc_date=models.DateField(default=None)
    Interest_levydate=models.DateField(default=None)
   
    Entity=models.CharField(max_length=255,default=None)
    DevFinal=models.BigIntegerField(default=None)
    Outstandings=models.BigIntegerField(default=None)
    Status=models.CharField(default="Notified",max_length=100)
    PayableorReceivable=models.CharField(max_length=25,default=None)
    remarks=models.CharField(max_length=255,default="null")
    registration_id=models.CharField(max_length=100,default="null")    # Deviation_file=JSONField(default="null")
    
    def __str__(self):
        return self.registration_id

class RevPaymentStatus(models.Model):
    Pay_type=models.CharField(max_length=15,default=None)
    Pay_refno=models.CharField(max_length=100,default=None)
    Pay_date=models.DateField(default=None)
    Pay_amount=models.BigIntegerField(default=None)
    Dev_final=models.BigIntegerField(default=None)
    Due_amount=models.BigIntegerField(default=None)
    Paid_by=models.CharField(default=None,max_length=250)
    Paid_for=models.CharField(default=None,max_length=250)
    Remarks=models.CharField(default='null',max_length=250)
    Status=models.CharField(max_length=50,default="Created")
    reject_remarks=models.CharField(max_length=255,default="null")
    Consider_Week_no=models.CharField(max_length=10,default="null")
    registration_id=models.ForeignKey(RevisionsBaseModel,on_delete=models.CASCADE)