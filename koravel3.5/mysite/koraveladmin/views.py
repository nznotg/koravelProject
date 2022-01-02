from django.shortcuts import render
from django.http import HttpResponse
from django.db.models import Count, Sum
import datetime as dt
import json
from .models import Region, Regionreview, Board, Usr
from koraveladmin.models import Regionreview
from django.db.models.functions import TruncMonth
from django.shortcuts import render
from django.db.models import Count
from django.views.generic import TemplateView
from django.http import JsonResponse




# def index(request):
#     return HttpResponse(f"""<h1>Welcome! KORAVEL 홈페이지 오신 것을 환영합니다.</h1>
#                         <hr><br><h4>방문하신 날자는 <span style='color:red'>{dt.datetime.now().strftime('%Y-%m-%d')}</span>이며, 이곳은 관리자 사이트입니다</h4>
#                         <br><br><h4><a href='/chart/'>chart 보기</a><h4>""")

def index(request):
    usr_list = Usr.objects.values(month=TruncMonth('usrbirth')).values('month').annotate(c=Count('usrid')).values('month', 'c')
    context = {
        'usr_list' : usr_list
    }
    return render(request, 'admin/index.html', context)



def chart(request):
    # 데이터를 넘겨주는지 테스트
    # review_list = Regionreview.objects.order_by('reviewidx')
    # context = {'review_list': review_list}

    # 실제 chart 표시할 데이터 : 카테고리별 뷰카운트
    # SELECT boardCat , count(boardViewCount) as count
    #   from board
    #  group by boardCat;
    board_cat = Board.objects.values('boardcat').annotate(view_count=Count('boardviewcount'))
    print(board_cat)


    # test : 서울 지역 정보 count aggregate(Sum('field_name'))
    # seoul_count = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='11').annotate(region_count=Count('regionsumaddr')).aggregate(Sum('region_count'))
    # print('seoul_count = ', seoul_count)
    # busan_count = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='26').annotate(region_count=Count('regionsumaddr')).aggregate(Sum('region_count'))
    # print('busan_count = ', busan_count)
    # daegu_count = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='27').annotate(region_count=Count('regionsumaddr')).aggregate(Sum('region_count'))
    # print('daegu_count = ', daegu_count)
    # inchun_count = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='28').annotate(region_count=Count('regionsumaddr')).aggregate(Sum('region_count'))
    # print('inchun_count = ', inchun_count)
    # gwangju_count = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='29').annotate(region_count=Count('regionsumaddr')).aggregate(Sum('region_count'))
    # print('gwangju_count = ', gwangju_count)
    # daejun_count = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='30').annotate(region_count=Count('regionsumaddr')).aggregate(Sum('region_count'))
    # print('daejun_count = ', daejun_count)
    # ulsan_count = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='31').annotate(region_count=Count('regionsumaddr')).aggregate(Sum('region_count'))
    # print('ulsan_count = ', ulsan_count)
    # sejung_count = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='36').annotate(region_count=Count('regionsumaddr')).aggregate(Sum('region_count'))
    # print('sejung_count = ', sejung_count)



    # region_seoul = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='11').count()
    # # region_count2 = len(region_seoul)
    # print('region_seoul = ', region_seoul)

    # test : 전 지역별 정보수 count
    regionaddr_all = Region.objects.values('regionsumaddr').annotate(region_count=Count('regionaddrcode'))
    print('region_all = ', regionaddr_all)

    # board_list = Board.objects.all()
    # 쿼리 결과 확인
    # print(board_list)

    # test : 게시글에 따른 댓글 count 그래프 구현
    review_count = Regionreview.objects.values('regionidx').annotate(review_count=Count('reviewcontent'))
    print('review_count = ', review_count)

    # test : usr QuerySet result
    usr_list = Usr.objects.values(month=TruncMonth('usrbirth')).values('month').annotate(c=Count('usrid')).values(
        'month', 'c')
    print(usr_list)


    context = {
        # 'board_cat' : board_cat,
        # 'regionaddr_all': regionaddr_all
        # 'review_count' : review_count
        'usr_list': usr_list
        # 'board_list' : board_list,
        # 'board_js' : json.dumps([board.json() for board in board_list])
    }
    #JSON 결과 확인
    print('context = ', context);
    return render(request, 'koraveladmin/chart.html', context)

# Create your views here.
