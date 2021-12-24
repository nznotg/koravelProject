from django.shortcuts import render
# from django.http import HttpResponse
import datetime as dt
from .models import Region

def index(request):
    # return HttpResponse(f"""<h1>Welcome! KORAVEL 홈페이지 오신 것을 환영합니다.</h1>
    #                     <hr><br><h4>방문하신 날자는 <span style='color:red'>{dt.datetime.now().strftime('%Y-%m-%d')}</span>이며, 이곳은 여행정보 사이트입니다</h4>""")
    region_list = Region.objects.order_by('regionidx')
    context = {'region_list': region_list}

    return render(request, 'koraveladmin/chart.html', context)



# Create your views here.
