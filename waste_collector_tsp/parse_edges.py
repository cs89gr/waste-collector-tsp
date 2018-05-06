import codecs
import sys


def parse_node(txt):
    try:
        i = txt.find(":")
        j = txt.find(",", i)

        name, lat, lon = txt[:i], txt[i + 1:j], txt[j + 1:]
        return {
            "name": txt[:i].strip().replace('"', ""),
            "lat": float(lat.strip()),
            "lon": float(lon.strip())
        }
    except:
        return None


def parse_file(file_path):
    nodes = []
    edges = []
    with codecs.open(file_path, 'r', encoding='utf-8') as f:
        while True:
            line = f.readline()
            if not line:
                break
            line = line.strip()
            if line == "" or line.startswith("#"):
                continue
            try:
                tokens = line.split(";")
                origin = parse_node(tokens[0])
                destination = parse_node(tokens[1])

                if origin and destination:
                    if not any([node for node in nodes if node["name"] == origin["name"]]):
                        nodes.append(origin)
                    if not any([node for node in nodes if node["name"] == destination["name"]]):
                        nodes.append(destination)
                    edges.append((nodes.index(origin) + 1, nodes.index(destination) + 1, distance(origin, destination)))
                    #edges.append((origin["name"], destination["name"] + str(nodes.index(destination)), distance(origin, destination)))
            except:
                pass
    return nodes, edges


def distance(node1, node2):
    #print node1, node2
    try:
        from osgeo import ogr
        point1 = ogr.Geometry(ogr.wkbPoint)
        point1.AddPoint(node1["lat"], node1["lon"])

        point2 = ogr.Geometry(ogr.wkbPoint)
        point2.AddPoint(node2["lat"], node2["lon"])
        return point1.Distance(point2)
    except Exception as e:
        print e
        return 0

if __name__ == "__main__":


    file_path = sys.argv[1] if len(sys.argv) > 1 else "..\\edges.txt"
    print "Parsing %s" % file_path
    nodes, edges = parse_file(file_path)
    print "Nodes:"
    print nodes
    print "Edges:"
    print edges
