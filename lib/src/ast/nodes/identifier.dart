part of analyzer_z.ast;

class Identifier extends Node {
  final String value;

  const Identifier(this.value) : super.empty();

  factory Identifier._parse(Parser parser) { throw new UnsupportedError('implement Identifier'); }

  bool operator ==(other) {
    return other is Identifier
        && other.value == value
        && super == other;
  }

  String toString() => value;
}