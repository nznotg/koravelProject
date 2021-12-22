from django.apps import AppConfig


# 수정
class KoraveladminConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'koraveladmin'
    verbose_name = '사이트 정보'
