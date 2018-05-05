# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.utils import timezone
from django.db import models
from django.contrib.gis.db import models
from django.contrib.gis.geos import LineString


# Create your models here.
class Node(models.Model) :
    name=models.TextField()
    location = models.PointField(srid=4326)
    objects=models.GeoManager()

    def __unicode__(self):
        return self.name

class Edge(models.Model) :
    origin=models.ForeignKey(Node ,related_name='origin')
    destination = models.ForeignKey(Node, related_name='destination')
    objects=models.GeoManager()

    def __unicode__(self):
        return "%s -> %s"%(self.origin.name,self.destination.name)


    @property
    def geometry(self):
        return "test"

    @property
    def geom(self):
        return LineString(self.origin,self.destination)