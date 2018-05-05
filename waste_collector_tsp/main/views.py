# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.core.serializers import serialize
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import TemplateView

from .models import Node,Edge
# Create your views here.


class HomePageView(TemplateView):
    template_name='html/index.html'

def node_datasets(request):
    nodes=serialize('geojson',Node.objects.all())
    return HttpResponse(nodes,content_type='json')

def edge_datasets(request):
    edges=serialize('geojson',Edge.objects.all())
    return HttpResponse(edges,content_type='json')