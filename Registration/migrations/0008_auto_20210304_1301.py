# Generated by Django 3.1.5 on 2021-03-04 07:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Registration', '0007_bankpandetails'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='formdata',
            name='accountName',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountName2',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountName3',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountName4',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountName5',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountName6',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountNumber',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountNumber2',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountNumber3',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountNumber4',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountNumber5',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='accountNumber6',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='bankName',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='bankName2',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='bankName3',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='bankName4',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='bankName5',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='bankName6',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='branchName',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='branchName2',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='branchName3',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='branchName4',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='branchName5',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='branchName6',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='gstinnumber',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='ifscCode',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='ifscCode2',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='ifscCode3',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='ifscCode4',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='ifscCode5',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='ifscCode6',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='pannumber',
        ),
        migrations.RemoveField(
            model_name='formdata',
            name='tannumber',
        ),
        migrations.AddField(
            model_name='formdata',
            name='Status',
            field=models.CharField(default='Created', max_length=255),
        ),
    ]
