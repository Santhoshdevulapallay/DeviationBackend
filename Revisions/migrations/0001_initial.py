# Generated by Django 3.1.5 on 2021-02-24 04:40

import django.contrib.postgres.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='RevisionsBaseModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Fin_year', models.CharField(default=None, max_length=15)),
                ('Week_no', django.contrib.postgres.fields.ArrayField(base_field=models.CharField(max_length=200), blank=True, size=None)),
                ('srpc_Startdate', models.DateField(default=None)),
                ('srpc_Enddate', models.DateField(default=None)),
                ('Revision_no', models.CharField(default=None, max_length=255)),
                ('Letter_refno', models.CharField(default=None, max_length=255)),
                ('Letter_date', models.DateField(default=None)),
                ('Due_date', models.DateField(default=None)),
                ('Disbursement_date', models.DateField(default=None)),
                ('Lc_date', models.DateField(default=None)),
                ('Interest_levydate', models.DateField(default=None)),
                ('Entity', models.CharField(default=None, max_length=255)),
                ('DevFinal', models.BigIntegerField(default=None)),
                ('Outstandings', models.BigIntegerField(default=None)),
                ('Status', models.CharField(default='Notified', max_length=100)),
                ('PayableorReceivable', models.CharField(default=None, max_length=25)),
                ('remarks', models.CharField(default='null', max_length=255)),
                ('registration_id', models.CharField(default='null', max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='RevPaymentStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Pay_type', models.CharField(default=None, max_length=15)),
                ('Pay_refno', models.CharField(default=None, max_length=100)),
                ('Pay_date', models.DateField(default=None)),
                ('Pay_amount', models.BigIntegerField(default=None)),
                ('Dev_final', models.BigIntegerField(default=None)),
                ('Due_amount', models.BigIntegerField(default=None)),
                ('Paid_by', models.CharField(default=None, max_length=250)),
                ('Paid_for', models.CharField(default=None, max_length=250)),
                ('Remarks', models.CharField(default=None, max_length=250)),
                ('Status', models.CharField(default='Created', max_length=50)),
                ('reject_remarks', models.CharField(default='null', max_length=255)),
                ('Consider_Week_no', models.CharField(default='null', max_length=10)),
                ('registration_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Revisions.revisionsbasemodel')),
            ],
        ),
    ]
