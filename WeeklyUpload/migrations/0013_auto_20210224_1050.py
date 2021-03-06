# Generated by Django 3.1.5 on 2021-02-24 05:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('WeeklyUpload', '0012_auto_20210123_1306'),
    ]

    operations = [
        migrations.CreateModel(
            name='DSMRRASBothSidesTransfers',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Fin_year', models.CharField(default=None, max_length=15)),
                ('Actual_Week', models.CharField(default=None, max_length=15)),
                ('Pay_type', models.CharField(default=None, max_length=15)),
                ('Pay_refno', models.CharField(default=None, max_length=100)),
                ('Pay_date', models.DateField(default=None)),
                ('Pay_amount', models.BigIntegerField(default=None)),
                ('Remarks', models.CharField(default=None, max_length=100)),
                ('dsmduepoolmodel_id', models.CharField(default=None, max_length=100)),
                ('rrasduepoolmodel_id', models.CharField(default=None, max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='ExcessPaymentStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Fin_year', models.CharField(default=None, max_length=15)),
                ('Actual_Week', models.CharField(default=None, max_length=15)),
                ('Pay_type', models.CharField(default=None, max_length=15)),
                ('Pay_refno', models.CharField(default=None, max_length=100)),
                ('Pay_date', models.DateField(default=None)),
                ('Pay_amount', models.BigIntegerField(default=None)),
                ('Paid_by', models.CharField(default=None, max_length=250)),
                ('Paid_for', models.CharField(default=None, max_length=250)),
                ('Remarks', models.CharField(default=None, max_length=100)),
                ('dsmduepoolmodel_id', models.CharField(default=None, max_length=100)),
                ('registration_id', models.CharField(default='SRADMIN', max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='IntPaymentStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Fin_year', models.CharField(default=None, max_length=15)),
                ('Actual_Week', models.CharField(default=None, max_length=15)),
                ('Pay_type', models.CharField(default=None, max_length=15)),
                ('Pay_refno', models.CharField(default=None, max_length=100)),
                ('Pay_date', models.DateField(default=None)),
                ('Pay_amount', models.BigIntegerField(default=None)),
                ('Paid_by', models.CharField(default=None, max_length=250)),
                ('Paid_for', models.CharField(default=None, max_length=250)),
                ('Remarks', models.CharField(default=None, max_length=100)),
                ('dsmduepoolmodel_id', models.CharField(default=None, max_length=100)),
                ('registration_id', models.CharField(default='SRADMIN', max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='PSDFPaymentStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Fin_year', models.CharField(default=None, max_length=15)),
                ('Actual_Week', models.CharField(default=None, max_length=15)),
                ('Pay_type', models.CharField(default=None, max_length=15)),
                ('Pay_refno', models.CharField(default=None, max_length=100)),
                ('Pay_date', models.DateField(default=None)),
                ('Pay_amount', models.BigIntegerField(default=None)),
                ('Paid_by', models.CharField(default=None, max_length=250)),
                ('Paid_for', models.CharField(default=None, max_length=250)),
                ('Remarks', models.CharField(default=None, max_length=100)),
                ('dsmduepoolmodel_id', models.CharField(default=None, max_length=100)),
                ('registration_id', models.CharField(default='SRADMIN', max_length=15)),
            ],
        ),
        migrations.AlterField(
            model_name='chatallmessages',
            name='timestamp',
            field=models.DateTimeField(default='2021-02-24 10:50:35.895685'),
        ),
    ]
