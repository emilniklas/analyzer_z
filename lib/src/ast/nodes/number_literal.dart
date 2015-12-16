part of analyzer_z.ast;

class NumberLiteral extends ExpressionLevelDeclaration {
  final num value;

  const NumberLiteral(this.value) : super(const NodeList.empty());

  factory NumberLiteral._parse(Parser parser) { throw new UnsupportedError('implement NumberLiteral'); }

  bool operator ==(other) {
    return other is NumberLiteral
        && value == other.value
        && super == other;
  }

  String toString() => '$value';
}
