from django.contrib import admin
from my_healingapp.models import Docteur
class docAdmin(admin.ModelAdmin):  
 list_display = ('name', 'numero_telephone', 'active')
admin.site.register(Docteur, docAdmin)