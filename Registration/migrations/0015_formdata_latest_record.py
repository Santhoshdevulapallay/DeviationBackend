# Generated by Django 3.1.5 on 2021-03-06 05:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Registration', '0014_auto_20210305_1457'),
    ]

    operations = [
        migrations.AddField(
            model_name='formdata',
            name='latest_record',
            field=models.DateTimeField(default='2021-03-06 11:02:37.432151', null=True),
        ),
    ]
