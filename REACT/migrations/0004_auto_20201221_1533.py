# Generated by Django 3.0.6 on 2020-12-21 10:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('REACT', '0003_reactbasedata_prorata'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reactbasedata',
            name='modified_remarks',
            field=models.CharField(default='null', max_length=255),
        ),
    ]
