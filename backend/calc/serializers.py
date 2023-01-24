from rest_framework import serializers
from calc.models import CalculatorOperation

class CalculatorOperationModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = CalculatorOperation
        fields = "__all__"

    def to_representation(self, instance):
        calculator_operation = super(CalculatorOperationModelSerializer, self).to_representation()
        return calculator_operation


class CalculatorOperationPayloadSerializer(serializers.Serializer):
    num_one = serializers.FloatField(required=True)
    num_two = serializers.FloatField(required=True)
    operation = serializers.CharField(required=True, min_length=1, max_length=1)
    
    def validate(self, attrs):
        if attrs.get('operation') in ["+", "-", "*", "/"]:
            pass
        else:
            raise serializers.ValidationError("Operation unknown. Allowed operations [+, -, *, /]")

        return attrs

    def create(self, validated_data):
        result = eval(f"{validated_data.get('num_one')}{validated_data.get('operation')}{validated_data.get('num_two')}")
        calculator_operation = CalculatorOperation(
            num_one=validated_data.get('num_one'),
            num_two=validated_data.get('num_two'),
            operation=validated_data.get('operation'),
            results=result
        )
        calculator.save()
        return calculator
