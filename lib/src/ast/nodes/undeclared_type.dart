part of analyzer_z.ast;

class UndeclaredType extends TypeName {
  const UndeclaredType() : super(null);

  factory UndeclaredType._parse(Parser parser) {}

  bool operator ==(other) {
    return other is UndeclaredType
        && super == other;
  }
}
