# Generated by Django 3.0.6 on 2020-12-29 09:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('WeeklyUpload', '0009_auto_20201229_1301'),
    ]

    operations = [
        migrations.AddField(
            model_name='miscpaymentstatus',
            name='dsmduepoolmodel_id',
            field=models.CharField(default='null', max_length=100),
        ),
        migrations.AlterField(
            model_name='chatallmessages',
            name='timestamp',
            field=models.DateTimeField(default='2020-12-29 15:07:27.197917'),
        ),
    ]
