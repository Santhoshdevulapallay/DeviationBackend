# Generated by Django 3.0.6 on 2020-12-15 09:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('WeeklyUpload', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='TestModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('test_var', models.CharField(default=None, max_length=10)),
            ],
        ),
        migrations.AlterField(
            model_name='chatallmessages',
            name='timestamp',
            field=models.DateTimeField(default='2020-12-15 15:06:48.007318'),
        ),
    ]
