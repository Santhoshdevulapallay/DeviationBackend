# Generated by Django 3.1.5 on 2021-03-05 06:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Registration', '0012_delete_regapproveauthority'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='formdata',
            name='created_by',
        ),
    ]
