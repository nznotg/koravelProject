from django.contrib import admin
from .models import *
from django.utils.html import format_html


# admin.site.register(Post)




admin.site.register(Regionreview)

class RegionAdmin(admin.ModelAdmin):
    list_filter = ('regionstar',)
    list_display = ('regionname', 'regionaddr', 'regionphone', 'regioninfo', 'regionstar')

    def styled_regionStar(self, obj):
        if obj.regionstar >= 4 and obj.regionstar <= 5 :
            return format_html(f'<span style="green">{obj.regionstar}</span>')
        if obj.regionstar >= 3 and obj.regionstar < 4 :
            return format_html(f'<span style="blue">{obj.regionstar}</span>')
        if obj.regionstar >= 2 and obj.regionstar < 3 :
            return format_html(f'<span style="orange">{obj.regionstar}</span>')
        if obj.regionstar >= 0 and obj.regionstar < 2 :
            return format_html(f'<span style="red">{obj.regionstar}</span>')
        return obj.regionstar
    styled_regionStar.short_description = '별점'

    def changeList_view(selfself, request, extra_context=None):
        extra_context = {'title': '지역 데이터 목록'}
        return super().changelist_view(request, extra_context)

admin.site.register(Region, RegionAdmin)

class UsrAdmin(admin.ModelAdmin):
    list_display = ['usridx', 'usrid', 'usrnick', 'usremail', 'usrbirth', 'usrsince',
                    'usrpasswd']
    list_display_links = ['usrid']
    list_filter = ('usrbirth',)
    search_fields = ['usrnick']
admin.site.register(Usr, UsrAdmin)


class BoardAdmin(admin.ModelAdmin):
    list_display = ['boardwriter', 'boardtitle',
                    'boardtype', 'boardcat', 'boardkeyword', 'boardviewcount', 'boarddate']
    list_filter = ('boardtype', 'boardcat', 'boardkeyword',)
    search_fields = ['boardkeyword']
admin.site.register(Board, BoardAdmin)

class KeywordAdmin(admin.ModelAdmin):
    list_display = ['mood', 'theme', 'area', 'place']
    list_filter = ('mood', 'theme', 'area', 'place')
    search_fields = ['mood', 'theme', 'area', 'place']
admin.site.register(Keyword, KeywordAdmin)
