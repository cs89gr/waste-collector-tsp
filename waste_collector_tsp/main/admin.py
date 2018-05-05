# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Node,Edge
from leaflet.admin import LeafletGeoAdmin
# Register your models here.


class Node_Admin(LeafletGeoAdmin):
    list_display = ('name','location')
    list_display_links = ('name','location')
    search_fields = ['name']

class Edge_Admin(LeafletGeoAdmin):
    list_display = ('origin','destination')

admin.site.register(Node,Node_Admin)
admin.site.register(Edge,Edge_Admin)