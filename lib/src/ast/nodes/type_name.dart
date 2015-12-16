part of analyzer_z.ast;

class TypeName extends Identifier {
  const TypeName(String value) : super(value);

  factory TypeName._parse(Parser parser) {}

  bool operator ==(other) {
    return other is TypeName
        && super == other;
  }
}