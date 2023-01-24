from django.shortcuts import render
from rest_framework.views import APIView
from calc.models import CalculatorOperation
from calc.serializers import CalculatorOperationPayloadSerializer, CalculatorOperationModelSerializer
from services.helpers.api_response import api_response
from loguru import logger


class CalculatorOperationView(APIView):
    def get(self, request):
        try:
            operations = CalculatorOperation.objects.all()[:5]
            return api_response(
                data={
                    "operations": CalculatorOperationsModelSerializer(operations, many=True).data
                }
            ) 
        except Exception as exc:
            logger.error(exc)
            return api_response(request, num_status=500, bool_status=False)


    def post(self, request):
        try:
            payload = CalculatorOperationPayloadSerializer(data=request.data)
            if payload.is_valid():
                operation = payload.create()
                return api_respionse(request, data={"operation": CalculatorOperationModelSerializer(operation).data})
            else:
                logger.error(payload.errors)
                return api_response(request, num_status=400, bool_status=False, issues=payload.errors)
        except Exception as exc:
            logger.error(exc)
            return api_response(request, num_status=500, bool_status=False)
