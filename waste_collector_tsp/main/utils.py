from main.models import Node, Edge
import routes_util
EDGES = [(1, 2, 0.15220937200120155), (1, 3, 0.07486017516677523), (1, 4, 0.08990458481078452), (2, 5, 0.034887468065194625), (4, 5, 0.03341493930864161), (4, 6, 0.04610685976077672), (4, 7, 0.048049166454794505), (3, 6, 0.0374101278399305), (3, 8, 0.03212117539879135), (3, 9, 0.04187703659525126), (5, 7, 0.04318737639635535), (6, 7, 0.04880096083070478), (7, 10, 0.022768393114137565), (8, 10, 0.06504129984094921), (8, 9, 0.04514461740894433)]

def get_routes(node1, node2):
    try:
        node1 = Node.objects.get(name=node1)
        node2 = Node.objects.get(name=node2)

        edges = [(edge.origin_id, edge.destination_id, edge.distance()) for edge in Edge.objects.all()]

        routes = routes_util.get_routes(edges, node1.pk, node2.pk)

        return routes

    except Node.NotFound:
        return []


def get_node_names(routes):
    result = []
    for route in routes:
        names = []
        for node in route:
            try:
                names.append(Node.objects.get(pk=node).name)
            except:
                names.append("Node %s" % node)
        result.append(names)
    return result


def get_edges(route):
    route = list(route)
    route += [None]
    i = 0
    edges = []
    for i in range(0, len(route) - 1):
        source, dest = route[i], route[i + 1]
        if dest:
            try:
                edge = Edge.objects.get(origin_id=source,
                                        destination_id=dest)
            except:
                try:
                    edge = Edge.objects.get(origin_id=dest,
                                        destination_id=source)
                except:
                    edge = None
            if edge:
                edges.append(edge)
    return edges


def get_edges_by_index(route):
    route = list(route)
    route += [None]
    i = 0
    edges = []
    for i in range(0, len(route) - 1):
        source, dest = route[i], route[i + 1]
        if dest:
            try:
                edge = Edge.objects.get(origin=Node.objects.all()[source - 1],
                                        destination=Node.objects.all()[dest - 1])
            except:
                try:
                    edge = Edge.objects.get(origin=Node.objects.all()[dest - 1],
                                            destination=Node.objects.all()[source - 1])
                except:
                    edge = None
            if edge:
                edges.append(edge)
    return edges
