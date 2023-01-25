from django.db import models
from calculator.model import SoftDeleteModel


class CalculatorOperation(SoftDeleteModel):
    num_one = models.FloatField(null=False, blank=False)
    num_two = models.FloatField(null=False, blank=False)
    operation = models.CharField(max_length=2, null=False, blank=False)
    result = models.FloatField(null=False, blank=False)

    class Meta:
        verbose_name = "Calculator Operation"
        verbose_name_plural = "Calculator Operations"
        table_prefix = "co"
        ordering = ("-updated_at",)


class ApiRequest(SoftDeleteModel):
    method = models.CharField(max_length=6, default="GET", blank=True, null=True)
    path = models.CharField(max_length=255, blank=True, null=True)
    headers = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = "API Request"
        verbose_name_plural = "API Requests"
        table_prefix = "request"
    
