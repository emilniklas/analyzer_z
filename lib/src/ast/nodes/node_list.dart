part of analyzer_z.ast;

class NodeList<N extends Node> extends IterableBase<N> implements Iterable<N> {
  final Iterable<N> _internal;

  const NodeList(Iterable<N> nodes) : _internal = nodes;

  const NodeList.empty() : _internal = const [];

  Iterator<N> get iterator => _internal.iterator;

  NodeList<N> operator +(NodeList<N> other) {
    return new NodeList<N>(toList()
      ..addAll(other));
  }

  bool operator ==(other) {
    return other is NodeList<N> && _hasEqualNodes(other);
  }

  bool _hasEqualNodes(NodeList<N> other) {
    // Must have equal length
    if (other.length != this.length) return false;

    // Each child must be equal
    final iterator = this.iterator;
    final otherIterator = other.iterator;
    while (iterator.moveNext()) {
      if (!otherIterator.moveNext()) return false;

      if (iterator.current != otherIterator.current) return false;
    }

    return true;
  }
}
