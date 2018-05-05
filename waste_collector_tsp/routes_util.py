EDGES = [(1, 2, 0.15220937200120155), (1, 3, 0.07486017516677523), (1, 4, 0.08990458481078452), (2, 5, 0.034887468065194625), (4, 5, 0.03341493930864161), (4, 6, 0.04610685976077672), (4, 7, 0.048049166454794505), (3, 6, 0.0374101278399305), (3, 8, 0.03212117539879135), (3, 9, 0.04187703659525126), (5, 7, 0.04318737639635535), (6, 7, 0.04880096083070478), (7, 10, 0.022768393114137565), (8, 10, 0.06504129984094921), (8, 9, 0.04514461740894433)]
NODES = [{'lat': 41.092083, 'lon': 23.541016, 'name': u'Serres'}, {'lat': 41.068238, 'lon': 23.390686, 'name': u'Provatas'}, {'lat': 41.020032, 'lon': 23.520701, 'name': u'Skoutari'}, {'lat': 41.05868, 'lon': 23.457547, 'name': u'K. Mitrousi'}, {'lat': 41.05832, 'lon': 23.424134, 'name': u'A. Kamila'}, {'lat': 41.020431, 'lon': 23.483293, 'name': u'K. Kamila'}, {'lat': 41.016434, 'lon': 23.434656, 'name': u'Koumaria'}, {'lat': 40.988154, 'lon': 23.516756, 'name': u'Peponia'}, {'lat': 41.003545, 'lon': 23.559196, 'name': u'Ag. Eleni'}, {'lat': 41.014645, 'lon': 23.457354, 'name': u'Adelfiko'}]

def next_step(edges, node, routes):
    print "Node", node
    for origin, destination, distance in edges:
        if origin == node or destination == node:
            print origin, destination
            #next_step(edges, destination, routes)


def get_routes_for_path(edges, source, dest, path=[]):
    # Append source to path
    path = path + [source]

    # Skip loops
    if source == dest:
        return [path]

    paths = []
    for origin, destination, distance in edges:
        # Get adjacent nodes of source
        target = None
        if origin == source:
            target = destination
        elif destination == source:
            target = origin

        # Ensure that target node has not been visited
        if target not in path:
            child_paths = get_routes_for_path(edges, target, dest, path)
            for child_path in child_paths:
                paths.append(child_path)
    return paths


def get_routes(edges, source, dest):
    return get_routes_for_path(edges, source, dest)


def node_index(nodes, name):
    results = [i + 1 for i, node in enumerate(nodes) if node["name"] == name]
    if results:
        return results[0]
    return None


def route_contains_nodes(route, nodes, node_index=None):
    for node in nodes:
        try:
            found_index = route.index(node)
        except ValueError:
            found_index = None
        #if node not in route:
        #    return False
        if found_index is None and (node_index is None or node_index >= found_index):
            return False
    return True


if __name__ == "__main__":
    edges = EDGES
    nodes = NODES

    start_node = 1
    end_node = 9

    start_node = node_index(nodes, "Serres")
    end_node = node_index(nodes, "Adelfiko")

    #end_node = 9

    MUST_NODES_NAMES = ["Koumaria", "Skoutari", "Peponia", "Provatas"]
    #MUST_NODES_NAMES = ["Provatas"]
    MUST_NODES = [node_index(nodes, name) for name in MUST_NODES_NAMES]

    SPONTANEOUS_NODES_NAMES = ["A. Kamila", "K. Mitrousi"]
    SPONTANEOUS_NODES = [node_index(nodes, name) for name in SPONTANEOUS_NODES_NAMES]

    print start_node, end_node
    routes = get_routes(edges, start_node, end_node)
    print "Routes"
    min_cost = None
    min_route = None
    for route in routes:
        if len(route) < len(nodes):
            #print "not all nodes visited"
            #continue

        if len([node for node in route if node == end_node]) > 1:
            print "end node visited more than once"
            #continue

        if route_contains_nodes(route, MUST_NODES):
            print "route contains: %s" % ", ".join(MUST_NODES_NAMES)
            #continue

        if route_contains_nodes(route, SPONTANEOUS_NODES, 2):
            print "route contains: %s (after 2nd node)" % ", ".join(SPONTANEOUS_NODES_NAMES)
            #continue

        print route
        route += [None]
        cost = 0
        i = 0
        for i in range(0, len(route) - 1):
            source, dest = route[i], route[i + 1]
            #print source, dest
            if dest:
                distance = [distance for origin, destination, distance in edges if (source, dest) == (origin, destination) or (source, dest) == (destination, origin)][0]
                cost += distance
        print cost
        print
        if min_cost is None or cost < min_cost:
            min_cost = cost
            min_route = route[:-1]

    print "Min cost route"
    print min_route
    print min_cost
