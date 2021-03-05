# Generated by Django 3.1.5 on 2021-03-05 05:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Registration', '0009_auto_20210304_1417'),
    ]

    operations = [
        migrations.CreateModel(
            name='RegApproveAuthority',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_by', models.CharField(default=None, max_length=100)),
                ('review_auth1', models.CharField(default=None, max_length=100)),
                ('review_auth2', models.CharField(default=None, max_length=100)),
                ('auth1_remarks', models.CharField(default='Null', max_length=100)),
                ('auth2_remarks', models.CharField(default='Null', max_length=100)),
                ('status', models.IntegerField(default=None)),
            ],
        ),
    ]
