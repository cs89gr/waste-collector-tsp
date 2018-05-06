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
from django.contrib.gis.geos import Point
from utils import get_routes, get_edges_by_index, get_edges, get_node_names
#import folium
#import networkx
import tempfile

SOURCE = "Serres"
DESTINATION = "Adelfiko"


def HomePageView(request):
    if request.method == "POST":
        file = request.FILES.get('upload_file')
        if file:
            temp_file = tempfile.NamedTemporaryFile(delete=False)
            #my_path='C:/Users/saran/Desktop/name.txt'
            with open(temp_file.name, 'wb+') as destination:
                for chunk in file.chunks():
                    destination.write(chunk)
            nodes, edges = parse_file(temp_file.name)
            try:
                Edge.objects.all().delete()
            except:
                pass
            try:
                Node.objects.all().delete()
            except:
                pass

            for i in nodes:
                name=i['name']
                lat_lon=Point(i['lon'],i['lat'])
                Node.objects.create(name=name, location=lat_lon)
            for i in edges:
                origin=i[0]
                destination=i[1]
                distance=i[2]

                #Edge.objects.create(origin_id=origin, destination_id=destination)
                ori=Node.objects.all()[origin-1]
                des=Node.objects.all()[destination-1]
                Edge.objects.create(origin=ori, destination=des)



        #t1=nodes[0]
        #print t1
        #print edges[0]

    routes = get_routes(SOURCE, DESTINATION)
    routes = get_node_names(routes)

    try:
        route_index = int(request.GET.get("route_index"))
    except:
        route_index = 0

    #return render(request, "html/upload.html")
    return render(request, 'html/index.html', {
        'routes': routes,
        'route_index': route_index
    })

#class HomePageView(TemplateView):
#    template_name='html/index.html'

def node_datasets(request):
    nodes=serialize('geojson',Node.objects.all())
    return HttpResponse(nodes,content_type='json')

def edge_datasets(request):
    edges=serialize('geojson',Edge.objects.all())
    return HttpResponse(edges,content_type='json')


def route_datasets(request):
    routes = get_routes(SOURCE, DESTINATION)
    #print routes



    try:
        route = routes[int(request.GET.get("route_index"))]
    except:
        route = routes[0]
    edges = get_edges(route)


    #route = [1, 2, 5, 4, 7, 6, 3, 9, 8, 10]
    #edges = get_edges_by_index(route)

    #edges = Edge.objects.all()[:5]
    edges = serialize('geojson', edges)
    return HttpResponse(edges, content_type='json')
