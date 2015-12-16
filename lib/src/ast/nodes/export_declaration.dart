part of analyzer_z.ast;

class ExportDeclaration extends TopLevelDeclaration {
  final Iterable<TypeName> show;
  final Iterable<TypeName> hide;

  const ExportDeclaration(Identifier name, {
    this.show: const [],
    this.hide: const []
  }) : super(name: name, children: const NodeList.empty());

  factory ExportDeclaration._parse(Parser parser) { throw new UnsupportedError('implement ExportDeclaration'); }

  bool operator ==(other) {
    return other is ExportDeclaration
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