# Generated by Django 3.1.5 on 2021-02-24 08:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Revisions', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='revpaymentstatus',
            name='Remarks',
            field=models.CharField(default='null', max_length=250),
        ),
    ]
