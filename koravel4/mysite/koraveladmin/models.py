# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models




class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Board(models.Model):
    boardtitle = models.CharField(db_column='boardTitle', max_length=200, blank=True, null=True)  # Field name made lowercase.
    boardcat = models.CharField(db_column='boardCat', max_length=20)  # Field name made lowercase.
    boardtype = models.CharField(db_column='boardType', max_length=20)  # Field name made lowercase.
    boardcontent1 = models.CharField(db_column='boardContent1', max_length=500, blank=True, null=True)  # Field name made lowercase.
    boardreco = models.IntegerField(db_column='boardReco', blank=True, null=True)  # Field name made lowercase.
    boardviewcount = models.IntegerField(db_column='boardViewCount', blank=True, null=True)  # Field name made lowercase.
    boardidx = models.AutoField(db_column='boardIdx', primary_key=True)  # Field name made lowercase.
    boardwriter = models.CharField(db_column='boardWriter', max_length=100, blank=True, null=True)  # Field name made lowercase.
    boarddate = models.DateTimeField(db_column='boardDate')  # Field name made lowercase.
    b_fname = models.CharField(max_length=100, blank=True, null=True)
    b_realfname = models.CharField(max_length=100, blank=True, null=True)
    b_fsize = models.IntegerField(blank=True, null=True)
    boardkeyword = models.CharField(db_column='boardKeyword', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'board'
        verbose_name = '게시판 정보'
        verbose_name_plural = '게시판 정보'

    def to_json(self):
        return {
            "boardtitle" : self.boardtitle,
            "boardcat" : self.boardcat,
            "boardtype" : self.boardtype,
            "boardcontent1" : self.boardcontent1,
            "boardreco" : self.boardreco,
            "boardviewcount" : self.boardviewcount,
            "boardidx" : self.boardidx,
            "boardwriter" : self.boardwriter,
            "boarddate" : self.boarddate,
            'b_fname' : self.b_fname,
            'b_realfname' : self.b_realfname,
            'b_fsize' : self.b_fsize,
            "boardkeyword" : self.boardkeyword
        }


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Event(models.Model):
    eventidx = models.AutoField(db_column='eventIdx', primary_key=True)  # Field name made lowercase.
    eventname = models.CharField(db_column='eventName', max_length=20)  # Field name made lowercase.
    eventaddr = models.CharField(db_column='eventAddr', max_length=20)  # Field name made lowercase.
    eventphone = models.CharField(db_column='eventPhone', max_length=20, blank=True, null=True)  # Field name made lowercase.
    eventinfo = models.CharField(db_column='eventInfo', max_length=255)  # Field name made lowercase.
    eventstar = models.FloatField(db_column='eventStar', blank=True, null=True)  # Field name made lowercase.
    eventx = models.FloatField(db_column='eventX')  # Field name made lowercase.
    eventy = models.FloatField(db_column='eventY')  # Field name made lowercase.
    eventinsertsince = models.DateTimeField(db_column='eventInsertSince')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'event'
        verbose_name = '지역 행사 정보'
        verbose_name_plural = '지역 행사 정보'


class Eventreview(models.Model):
    eventidx = models.IntegerField(db_column='eventIdx')  # Field name made lowercase.
    reviewidx = models.AutoField(db_column='reviewIdx', primary_key=True)  # Field name made lowercase.
    usrnick = models.CharField(db_column='usrNick', max_length=20)  # Field name made lowercase.
    reviewcontent = models.CharField(db_column='reviewContent', max_length=500)  # Field name made lowercase.
    reviewdate = models.DateTimeField(db_column='reviewDate')  # Field name made lowercase.
    reviewstar = models.FloatField(db_column='reviewStar', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'eventReview'


class Keyword(models.Model):
    mood = models.CharField(max_length=20, blank=True, null=True)
    count = models.IntegerField(null=False, default=0)

    class Meta:
        managed = False
        db_table = 'keyword'


class Reco(models.Model):
    recoidx = models.AutoField(db_column='recoIdx', primary_key=True)  # Field name made lowercase.
    regionidx = models.IntegerField(db_column='regionIdx', blank=True, null=True)  # Field name made lowercase.
    boardidx = models.IntegerField(db_column='boardIdx', blank=True, null=True)  # Field name made lowercase.
    usrid = models.CharField(db_column='usrID', max_length=20)  # Field name made lowercase.
    recodate = models.DateTimeField(db_column='recoDate')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'reco'


class Region(models.Model):
    regionidx = models.AutoField(db_column='regionIdx', primary_key=True)  # Field name made lowercase.
    regionname = models.CharField(db_column='regionName', max_length=20)  # Field name made lowercase.
    regionaddr = models.CharField(db_column='regionAddr', max_length=200, blank=True, null=True)  # Field name made lowercase.
    regionphone = models.CharField(db_column='regionPhone', max_length=20, blank=True, null=True)  # Field name made lowercase.
    regioninfo = models.CharField(db_column='regionInfo', max_length=3000, blank=True, null=True)  # Field name made lowercase.
    regionstar = models.FloatField(db_column='regionStar', blank=True, null=True)  # Field name made lowercase.
    regionx = models.DecimalField(db_column='regionX', max_digits=12, decimal_places=9, blank=True, null=True)  # Field name made lowercase.
    regiony = models.DecimalField(db_column='regionY', max_digits=12, decimal_places=10, blank=True, null=True)  # Field name made lowercase.
    regioninsertsince = models.DateTimeField(db_column='regionInsertSince')  # Field name made lowercase.
    regionmainimgfile = models.CharField(db_column='regionMainImgFile', max_length=20, blank=True, null=True)  # Field name made lowercase.
    regiondetailbximg1 = models.CharField(db_column='regionDetailBxImg1', max_length=100, blank=True, null=True)  # Field name made lowercase.
    regiondetailbximg2 = models.CharField(db_column='regionDetailBxImg2', max_length=100, blank=True, null=True)  # Field name made lowercase.
    regiondetailbximg3 = models.CharField(db_column='regionDetailBxImg3', max_length=100, blank=True, null=True)  # Field name made lowercase.
    regiondetailbxthumbimg1 = models.CharField(db_column='regionDetailBxthumbImg1', max_length=100, blank=True, null=True)  # Field name made lowercase.
    regiondetailbxthumbimg2 = models.CharField(db_column='regionDetailBxthumbImg2', max_length=100, blank=True, null=True)  # Field name made lowercase.
    regiondetailbxthumbimg3 = models.CharField(db_column='regionDetailBxthumbImg3', max_length=100, blank=True, null=True)  # Field name made lowercase.
    ocean = models.IntegerField(blank=True, null=True)
    amusement_park = models.IntegerField(db_column='Amusement Park', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    exhibition = models.IntegerField(blank=True, null=True)
    mountain = models.IntegerField(blank=True, null=True)
    active_static = models.IntegerField(db_column='Active/static', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    family = models.IntegerField(blank=True, null=True)
    couple = models.IntegerField(blank=True, null=True)
    kid = models.IntegerField(blank=True, null=True)
    regionaddrcode = models.IntegerField(db_column='regionAddrCode')  # Field name made lowercase.
    regionsumaddr = models.CharField(db_column='regionSumAddr', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'region'
        verbose_name = '지역 정보'
        verbose_name_plural = '지역 정보'




class Regionreview(models.Model):
    regionidx = models.IntegerField(db_column='regionIdx')  # Field name made lowercase.
    reviewidx = models.AutoField(db_column='reviewIdx', primary_key=True)  # Field name made lowercase.
    usrnick = models.CharField(db_column='usrNick', max_length=20)  # Field name made lowercase.
    reviewcontent = models.CharField(db_column='reviewContent', max_length=500)  # Field name made lowercase.
    reviewdate = models.DateTimeField(db_column='reviewDate')  # Field name made lowercase.
    reviewstar = models.FloatField(db_column='reviewStar', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'regionReview'
        verbose_name = '지역 리뷰 정보'
        verbose_name_plural = '지역 리뷰 정보'


class Usr(models.Model):
    usridx = models.AutoField(db_column='usrIdx', primary_key=True)  # Field name made lowercase.
    usremail = models.CharField(db_column='usrEmail', unique=True, max_length=50, blank=True, null=True)  # Field name made lowercase.
    usrbirth = models.DateField(db_column='usrBirth')  # Field name made lowercase.
    usrnick = models.CharField(db_column='usrNick', max_length=20)  # Field name made lowercase.
    usrsince = models.DateTimeField(db_column='usrSince')  # Field name made lowercase.
    usrpasswd = models.CharField(db_column='usrPasswd', max_length=20)  # Field name made lowercase.
    usrid = models.CharField(db_column='usrID', unique=True, max_length=20)  # Field name made lowercase.
    usrdevkey = models.CharField(db_column='usrDevKey', max_length=255, blank=True, null=True)  # Field name made lowercase.
    usrmood = models.CharField(max_length=20, blank=True, null=True)
    usrtheme = models.CharField(max_length=20, blank=True, null=True)
    usrplace = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'usr'
        verbose_name = '회원 정보'
        verbose_name_plural = '회원 정보'
