from django.db import models

# Create your models here.
class SRPCREACTFiles(models.Model):
    year=models.CharField(max_length=50,default=None)
    weekNo=models.CharField(max_length=50,default=None)
    
    image_url=models.URLField(max_length=200,default=None)

    class Meta:
        db_table = "SRPC_REACT_Files"


class ReactBaseData(models.Model):
    Fin_year=models.CharField(max_length=15,default=None)
    Week_no=models.CharField(max_length=15,default=None)
    Consider_Week_no=models.CharField(max_length=10,default=None)
    Week_startdate=models.DateField(default=None)
    Week_enddate=models.DateField(default=None)
    Revision_no=models.CharField(default=None,max_length=255)
    Letter_refno=models.CharField(default=None,max_length=255)
    Letter_date=models.DateField(default=None)
    Payment_date=models.DateField(default=None)
    Disbursement_date=models.DateField(default=None)
    Lc_date=models.DateField(default=None)
    Interest_levydate=models.DateField(default=None)
    # Deviation Data also 
    Entity=models.CharField(max_length=255,default=None)
    DevFinal=models.BigIntegerField(blank=True,default=None)
    ProRata=models.BigIntegerField(blank=True,default=None)
    Outstandings=models.BigIntegerField(default=0,blank=True)
    Status=models.CharField(default="Notified",max_length=100)
    PayableorReceivable=models.CharField(max_length=25,default=None)
    image_url=models.URLField(max_length=200,default="null")
   
    modified_remarks=models.CharField(max_length=255,default="null")
    registration_id=models.CharField(max_length=100,default=None)    # Deviation_file=JSONField(default="null")

    def __str__(self):
        return self.Revision_no

class RePaymentStatus(models.Model):
    Pay_type=models.CharField(max_length=15,default=None)
    Pay_refno=models.CharField(max_length=100,default=None)
    Pay_date=models.DateField(default=None)
    Pay_amount=models.BigIntegerField(default=None)
    Dev_final=models.BigIntegerField(default=None)
    Due_amount=models.BigIntegerField(default=None)
    Paid_by=models.CharField(default=None,max_length=250)
    Paid_for=models.CharField(default=None,max_length=250)
    Remarks=models.CharField(default=None,max_length=100)
    Status=models.CharField(max_length=50,default="Created")
    reject_remarks=models.CharField(max_length=255,default="Null")
    registration_id=models.ForeignKey(ReactBaseData,on_delete=models.CASCADE)
     

    def __str__(self):
        return self.Status

class REACTDuePool(models.Model):

    year=models.CharField(max_length=10,default=None)
    from_year=models.BigIntegerField(default=None)
    to_year=models.BigIntegerField(default=None)
    actual_weekno=models.BigIntegerField(default=None)
    considered_weekno=models.BigIntegerField(default=None)
    dueinpool=models.BigIntegerField(default=None)
    transdate=models.DateTimeField(auto_now_add=True, null=True)
    
    def __str__(self):
        return self.dueinpool

class ReactDisbursedDate(models.Model):
    year=models.CharField(max_length=20,default=None)
    weekno=models.CharField(max_length=20,default=None)
    disbursed_date=models.DateField(default=None,blank=True)

    def __str__(self):
        return self.disbursed_date