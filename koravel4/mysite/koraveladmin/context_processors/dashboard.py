from koraveladmin.models import Usr
from django.db.models.functions import TruncMonth
from django.db.models import Count

def dashboard(request):
    usr_list = Usr.objects.values(month=TruncMonth('usrbirth')).values('month').annotate(c=Count('usrid')).values('month', 'c')
    return { 'usr_list' : usr_list }