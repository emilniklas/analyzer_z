part of analyzer_z.ast;

abstract class Node<C extends Node> {
  final NodeList<C> children;

  const Node(this.children);

  const Node.empty() : this.children = const NodeList<Node>.empty();

  bool operator ==(other) {
    return other is Node && other.children == children;
  }

  String toString() => '$runtimeType(${children.join(' ')})';
}
