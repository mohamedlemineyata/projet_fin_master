from django.db import models
class Docteur(models.Model):
    def __str__(self):
      return f'{self.name}' 
    name = models.fields.CharField(max_length=100)
    specialité = models.fields.CharField(max_length=1000,default='docteur general')
    numero_telephone = models.fields.IntegerField(default=0000)
    active = models.fields.BooleanField(default=True)
    official_facebookpage = models.fields.URLField(null=True, blank=True)
