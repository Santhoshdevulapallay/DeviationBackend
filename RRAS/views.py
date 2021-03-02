from django.shortcuts import render
from WeeklyUpload.models import *
from .models import *
import pdb
from django.http import JsonResponse,HttpResponse
from django.db.models import Sum
from django.db.models.functions import Coalesce    
# Create your views here.

def GetBalAmountPool(request):
    try:
        
        dsm_bal=DSMDuePool.objects.aggregate(dsm=Coalesce(models.Sum('dueinpool'),0))
        rras_bal=RRASDuePool.objects.aggregate(rras=Coalesce(models.Sum('dueinpool'),0))
        
        summary=[
            {'dsm_bal':dsm_bal['dsm']},
            {'rras_bal':rras_bal['rras']},
        ]
        return JsonResponse(summary,safe=False)
    except Exception as e:
        print(e)
        return HttpResponse("unsuccesful",status=404)