# Generated by Django 3.1.5 on 2021-03-04 07:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Registration', '0006_auto_20210304_1241'),
    ]

    operations = [
        migrations.CreateModel(
            name='BankPANDetails',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('accountName', models.CharField(default='Null', max_length=255, null=True)),
                ('accountNumber', models.BigIntegerField(blank=True, default=0, null=True)),
                ('bankName', models.CharField(default='Null', max_length=255, null=True)),
                ('branchName', models.CharField(default='Null', max_length=255, null=True)),
                ('ifscCode', models.CharField(default='Null', max_length=100, null=True)),
                ('accountName2', models.CharField(default='Null', max_length=255, null=True)),
                ('accountNumber2', models.BigIntegerField(blank=True, default=0, null=True)),
                ('bankName2', models.CharField(default='Null', max_length=255, null=True)),
                ('branchName2', models.CharField(default='Null', max_length=255, null=True)),
                ('ifscCode2', models.CharField(default='Null', max_length=100, null=True)),
                ('accountName3', models.CharField(default='Null', max_length=255, null=True)),
                ('accountNumber3', models.BigIntegerField(blank=True, default=0, null=True)),
                ('bankName3', models.CharField(default='Null', max_length=255, null=True)),
                ('branchName3', models.CharField(default='Null', max_length=255, null=True)),
                ('ifscCode3', models.CharField(default='Null', max_length=100, null=True)),
                ('accountName4', models.CharField(default='Null', max_length=255, null=True)),
                ('accountNumber4', models.BigIntegerField(blank=True, default=0, null=True)),
                ('bankName4', models.CharField(default='Null', max_length=255, null=True)),
                ('branchName4', models.CharField(default='Null', max_length=255, null=True)),
                ('ifscCode4', models.CharField(default='Null', max_length=100, null=True)),
                ('accountName5', models.CharField(default='Null', max_length=255, null=True)),
                ('accountNumber5', models.BigIntegerField(blank=True, default=0, null=True)),
                ('bankName5', models.CharField(default='Null', max_length=255, null=True)),
                ('branchName5', models.CharField(default='Null', max_length=255, null=True)),
                ('ifscCode5', models.CharField(default='Null', max_length=100, null=True)),
                ('accountName6', models.CharField(default='Null', max_length=255, null=True)),
                ('accountNumber6', models.BigIntegerField(blank=True, default=0, null=True)),
                ('bankName6', models.CharField(default='Null', max_length=255, null=True)),
                ('branchName6', models.CharField(default='Null', max_length=255, null=True)),
                ('ifscCode6', models.CharField(default='Null', max_length=100, null=True)),
                ('pannumber', models.CharField(default='Null', max_length=15, null=True)),
                ('tannumber', models.CharField(default='Null', max_length=20, null=True)),
                ('gstinnumber', models.CharField(default='Null', max_length=30, null=True)),
                ('register_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Registration.formdata')),
            ],
        ),
    ]
