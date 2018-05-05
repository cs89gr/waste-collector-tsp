# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.core.serializers import serialize
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import TemplateView
from parse_edges import parse_node,parse_file
from .models import Node,Edge
# Create your views here.
import re

def HomePageView(request):
    if request.method == "POST":
        file = request.FILES['upload_file']
        my_path='C:/Users/saran/Desktop/name.txt'
        with open(my_path, 'wb+') as destination:
            for chunk in file.chunks():
                destination.write(chunk)
        nodes,edges=parse_file(my_path)
        for i in nodes:
            print i['name']
        for i in edges:
            print i
        #t1=nodes[0]
        #print t1
        #print edges[0]





    #return render(request, "html/upload.html")
    return render(request, 'html/index.html')

#class HomePageView(TemplateView):
#    template_name='html/index.html'

def node_datasets(request):
    nodes=serialize('geojson',Node.objects.all())
    return HttpResponse(nodes,content_type='json')

def edge_datasets(request):
    edges=serialize('geojson',Edge.objects.all())
    return HttpResponse(edges,content_type='json')



