import codecs
import sys


def parse_node(txt):
    try:
        i = txt.find(":")
        j = txt.find(",", i)

        name, lat, lon = txt[:i], txt[i + 1:j], txt[j + 1:]
        return {
            "name": txt[:i],
            "lat": float(lat.strip()),
            "lon": float(lon.strip())
        }
    except:
        return None


def parse_file(file_path):
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
                    edges.append((nodes.index(origin) + 1, nodes.index(destination) + 1))
            except:
                pass
    return nodes, edges


if __name__ == "__main__":
    nodes = []
    edges = []

    file_path = sys.argv[1] if len(sys.argv) > 1 else "edges.txt"
    print "Parsing %s" % file_path
    nodes, edges = parse_file(file_path)
    print "Nodes:"
    print nodes
    print "Edges:"
    print edges
