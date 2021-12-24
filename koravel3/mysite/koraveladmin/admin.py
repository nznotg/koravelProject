
from django.contrib import admin
from .models import *
import django.utils.html as format_html


# admin.site.register(Post)



class RegionReviewAdmin(admin.ModelAdmin):
    list_display = ('regionidx', 'usrnick', 'reviewcontent', 'reviewdate', 'reviewstar')
    list_filter = ('reviewdate',)
    list_display_links = ('reviewcontent',)
    search_fields = ('reviewcontent', 'usrnic', 'reviewstar')

    def changelist_view(self, request, extra_context=None):
        extra_context = {'title': '지역 상세 페이지 리뷰 목록'}
        return super().changelist_view(request, extra_context)
admin.site.register(Regionreview, RegionReviewAdmin)

class RegionAdmin(admin.ModelAdmin):
    list_filter = ('regionstar',)
    list_display = ('regionname', 'regionaddr', 'regionphone', 'regioninfo', 'regionstar')
    search_fields = ('regionstar',)

    # 실패 코딩 : regionstar filter 걸어서 별점 기준으로 보려고 했으나 실패함.
    def styled_status(self, obj):
        if obj.regionstar < 4.0 :
            return format_html.format_html(f'<span style="color:red">{obj.regionstar}</span>')

    styled_status.short_description = '별점'

    # 데이터 리스트의 제목 출력하는 함수
    def changelist_view(self, request, extra_context=None):
        extra_context = {'title': '지역 데이터 목록'} # Region 테이블에 들어가면 제목을 바꿔줌
        return super().changelist_view(request, extra_context)

admin.site.register(Region, RegionAdmin)

class UsrAdmin(admin.ModelAdmin):
    list_display = ['usridx', 'usrid', 'usrnick', 'usremail', 'usrbirth', 'usrsince',
                    'usrpasswd']
    list_display_links = ['usrid']
    list_filter = ('usrbirth',)
    search_fields = ['usrnick']

    def changelist_view(self, request, extra_context=None):
        extra_context = {'title': '회원 데이터 관리'}
        return super().changelist_view(request, extra_context)
admin.site.register(Usr, UsrAdmin)


class BoardAdmin(admin.ModelAdmin):
    list_display = ['boardwriter', 'boardtitle',
                    'boardtype', 'boardcat', 'boardkeyword', 'boardviewcount', 'boarddate']
    list_filter = ('boardtype', 'boardcat', 'boardkeyword',)
    search_fields = ['boardkeyword']

    def changelist_view(selfself, request, extra_context=None):
        extra_context = {'title': '게시판 데이터 목록'}
        return super().changelist_view(request, extra_context)
admin.site.register(Board, BoardAdmin)

class KeywordAdmin(admin.ModelAdmin):
    list_display = ['mood', 'theme', 'area', 'place']
    list_filter = ('mood', 'theme', 'area', 'place')
    search_fields = ['mood', 'theme', 'area', 'place']

    def changelist_view(self, request, extra_context=None):
        extra_context = {'title': '키워드 데이터 목록'}
        return super().changelist_view(request, extra_context)
admin.site.register(Keyword, KeywordAdmin)