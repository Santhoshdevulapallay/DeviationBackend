# Generated by Django 3.0.6 on 2020-12-21 10:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('REACT', '0002_reactbasedata'),
    ]

    operations = [
        migrations.AddField(
            model_name='reactbasedata',
            name='ProRata',
            field=models.BigIntegerField(blank=True, default=None),
        ),
    ]
