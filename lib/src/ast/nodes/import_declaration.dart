part of analyzer_z.ast;

class ImportDeclaration extends TopLevelDeclaration {
  final Identifier as;
  final Iterable<TypeName> show;
  final Iterable<TypeName> hide;

  const ImportDeclaration(Identifier name, {
    this.as,
    this.show: const [],
    this.hide: const []
  }) : super(name: name, children: const NodeList.empty());

  factory ImportDeclaration._parse(Parser parser) { throw new UnsupportedError('implement ImportDeclaration'); }

  bool operator ==(other) {
    return other is ImportDeclaration
        && other.as == as
        && _equalIterable(other.show, show)
        && _equalIterable(other.hide, hide)
        && super == other;
  }

  bool _equalIterable(Iterable a, Iterable b) {
    if (a.length != b.length) return false;
    final aIterator = a.iterator;
    final bIterator = b.iterator;
    while (aIterator.moveNext()) {
      if (!bIterator.moveNext()) return false;
      if (aIterator.current != bIterator.current) return false;
    }
    return true;
  }
}