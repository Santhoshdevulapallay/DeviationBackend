from django.db import models

class RRASDuePool(models.Model):

    year=models.CharField(max_length=10,default=None)
    from_year=models.BigIntegerField(default=None)
    to_year=models.BigIntegerField(default=None)
    actual_weekno=models.BigIntegerField(default=None)
    considered_weekno=models.BigIntegerField(default=None)
    dueinpool=models.BigIntegerField(default=None)
    transdate=models.DateTimeField(auto_now_add=True, null=True)
    
    def __str__(self):
        return self.dueinpool