import types

from django.contrib import admin
from django.contrib.admin import sites
from .models import *
import django.utils.html as format_html
import json
from django.core.serializers.json import DjangoJSONEncoder
from django.db.models import Count, Sum
from django.db.models.functions import TruncMonth
from django.shortcuts import render
from django.contrib.admin import AdminSite

class MyAdminSite(AdminSite):
    index_template = 'templates/admin/index.html'

    def index(request):
        usr_list = Usr.objects.values(month=TruncMonth('usrbirth')).values('month').annotate(c=Count('usrid')).values(
            'month', 'c')
        context = {
            'usr_list': usr_list
        }
        return render(request, 'admin/index.html', context)

site = MyAdminSite()

class RegionReviewAdmin(admin.ModelAdmin):
    list_display = ('regionidx', 'usrnick', 'reviewcontent', 'reviewdate', 'reviewstar')
    list_filter = ('reviewdate',)
    list_display_links = ('reviewcontent',)
    search_fields = ('reviewcontent', 'usrnic', 'reviewstar')
    change_list_template = 'admin/koraveladmin/regionreviews/reviews_change_list.html'


    # change_list.html 로 데이터 전송 // 참조 사이트 : https://findwork.dev/blog/adding-charts-to-django-admin/
    # 관광 정보에 대한 리뷰 평균 쿼리 : SELECT round(avg(reviewStar),2) from regionReview;
    # 관광지별 댓글 개수 : select regionIdx, count(regionIdx) from regionReview group by regionIdx;
    def changelist_view(self, request, extra_context=None):
        review_count = Regionreview.objects.values('regionidx').annotate(review_count=Count('reviewcontent'))
        print(review_count)
        extra_context = {
            'title' : "게시글별 댓글 현황",
            'review_count': review_count,
        }
        return super().changelist_view(request, extra_context=extra_context)
admin.site.register(Regionreview, RegionReviewAdmin)

class RegionAdmin(admin.ModelAdmin):
    list_filter = ('regionstar',)
    list_display = ('regionname', 'regionaddr', 'regionphone', 'regioninfo', 'regionstar')
    search_fields = ('regionstar',)
    change_list_template = 'admin/koraveladmin/region/change_list.html'

    # 실패 코딩 : regionstar filter 걸어서 별점 기준으로 보려고 했으나 실패함.
    def regionstar(self, obj):
        if obj.regionstar != 4.0 :
            return format_html(f'<tb><span style="color:red">{ obj.regionstar }</span></tb>')

    regionstar.short_description = '별점'

    # change_list.html 로 데이터 전송 // 참조 사이트 : https://findwork.dev/blog/adding-charts-to-django-admin/
    def changelist_view(self, request, extra_context=None):
        regionaddr_all = Region.objects.values('regionsumaddr').annotate(region_count=Count('regionaddrcode'))
        title = '관광지 데이터'
        region_seoul = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='11').count()
        print('서울 :',region_seoul)
        region_kungky = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='28').count()\
                        + Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='41').count()
        print("경기도 :",region_kungky)
        region_kangwon = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='42').count()
        print('강원도 :',region_kangwon)
        region_choong = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='43').count() \
                        + Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='44').count()
        print("충청도 :",region_choong)
        region_kungsang = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='47').count() \
                        + Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='26').count() \
                        + Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='27').count() \
                        + Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='31').count()
        print('경상도 :', region_kungsang)
        region_junra = Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='45').count() \
                        + Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='46').count() \
                        + Region.objects.values('regionsumaddr').filter(regionaddrcode__startswith='29').count()
        print('전라도 :',region_junra)

        extra_context = {
            'title' : title,
            'regionaddr_all': regionaddr_all
        }
        return super().changelist_view(request, extra_context=extra_context)

admin.site.register(Region, RegionAdmin)

class UsrAdmin(admin.ModelAdmin):
    list_display = ['usridx', 'usrid', 'usrnick', 'usremail', 'usrbirth', 'usrsince', 'usrpasswd']
    list_display_links = ['usrid']
    list_filter = ('usrsince',)
    search_fields = ['usrnick']
    change_list_template = 'admin/koraveladmin/usr/usr_change_list.html'
    admin.site.index_template = 'admin/index.html'

    def changelist_view(self, request, extra_context=None):
        usr_list = Usr.objects.values(month=TruncMonth('usrbirth')).values('month').annotate(c=Count('usrid')).values(
            'month', 'c')
        print(usr_list)
        extra_context = {
            'title': '회원 데이터 관리',
            'usr_list': usr_list
        }
        return super().changelist_view(request, extra_context)

admin.site.register(Usr, UsrAdmin)


class BoardAdmin(admin.ModelAdmin):
    list_display = ['boardwriter', 'boardtitle',
                    'boardtype', 'boardcat', 'boardkeyword', 'boardviewcount', 'boarddate']
    list_filter = ('boardtype', 'boardcat', 'boardkeyword',)
    search_fields = ['boardkeyword']
    change_list_template = 'admin/koraveladmin/boards/boards_change_list.html'

    def changelist_view(selfself, request, extra_context=None):
        board_cat = Board.objects.values('boardcat').annotate(view_count=Count('boardviewcount'))
        title = '게시판 데이터 목록'
        print(board_cat)
        extra_context = {
            'title': title,
            'board_cat' : board_cat
        }
        return super().changelist_view(request, extra_context)
admin.site.register(Board, BoardAdmin)

class KeywordAdmin(admin.ModelAdmin):
    list_display = ['mood', 'count']
    list_filter = ('mood', 'count')
    search_fields = ['mood', 'count']

    def changelist_view(self, request, extra_context=None):
        extra_context = {'title': '키워드 데이터 목록'}
        return super().changelist_view(request, extra_context)
# admin.site.register(Keyword, KeywordAdmin)

class EventAdmin(admin.ModelAdmin):
    list_display = ['eventidx', 'eventname', 'eventaddr', 'eventinfo', 'eventstar', 'eventinsertsince']
    list_filter = ('eventinsertsince', )

admin.site.register(Event, EventAdmin)