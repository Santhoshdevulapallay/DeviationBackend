# from django.contrib.auth.models import User
from Registration.models import User
from rest_framework import serializers
from django.views.decorators.csrf import csrf_exempt


class BasicSerializer(serializers.Serializer):
    username=serializers.CharField()
    password=serializers.CharField()
    is_active=serializers.BooleanField(default=False)
    def create(self,validated_data):
            user=User.objects.create_user(**validated_data)
            return user
    


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields="__all__"
        # fields = ['id', 'username', 'email','password']
        # extra_kwargs={'password':{'write_only':True,'required':True}}
        # def create(self,validated_data):
        #     user=User.objects.create_user(**validated_data)
        #     return user
