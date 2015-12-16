part of analyzer_z.ast;

class StringLiteral extends ExpressionLevelDeclaration {
  final String value;
  final bool isMultiline;
  final bool isRaw;
  final bool isUsingSingleQuotes;

  const StringLiteral({
    this.value,
    this.isMultiline: false,
    this.isRaw: false,
    this.isUsingSingleQuotes: true
  }) : super(const NodeList.empty());

  factory StringLiteral._parse(Parser parser) {}

  bool operator ==(other) {
    return other is StringLiteral
        && value == other.value
        && super == other;
  }

  String toString() {
    final char = isUsingSingleQuotes ? "'" : '"';
    final after = (isMultiline ? char * 3 : char);
    final before = (isRaw ? 'r' : '') + after;
    return '$before$value$after';
  }
}
