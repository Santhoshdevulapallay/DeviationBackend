# Generated by Django 3.0.6 on 2021-01-06 05:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('REACT', '0006_auto_20201231_1705'),
    ]

    operations = [
        migrations.CreateModel(
            name='REACTDuePool',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.CharField(default=None, max_length=10)),
                ('from_year', models.BigIntegerField(default=None)),
                ('to_year', models.BigIntegerField(default=None)),
                ('actual_weekno', models.BigIntegerField(default=None)),
                ('considered_weekno', models.BigIntegerField(default=None)),
                ('dueinpool', models.BigIntegerField(default=None)),
                ('transdate', models.DateTimeField(auto_now_add=True, null=True)),
            ],
        ),
    ]
