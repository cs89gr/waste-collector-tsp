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
    line=models.LineStringField(srid=4326,null=True,blank=True)
    objects=models.GeoManager()

    def distance(self):
        if self.origin_id and self.destination_id:
            from parse_edges import distance
            return distance({
                "lat": self.origin.location.x,
                "lon": self.origin.location.y
            }, {
                "lat": self.destination.location.x,
                "lon": self.destination.location.y
            })

    def __unicode__(self):
        return "%s -> %s"%(self.origin.name,self.destination.name)

    def save(self,*args,**kwargs):
        if self.origin_id and self.destination_id:
            self.line = LineString(self.origin.location,self.destination.location)
        super(Edge,self).save(*args,**kwargs)

'''
    @property
    def geometry(self):
        return "test"

    @property
    def geom(self):
        return LineString(self.origin,self.destination)
'''