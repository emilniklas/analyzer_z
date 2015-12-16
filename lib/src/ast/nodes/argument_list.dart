part of analyzer_z.ast;

class ArgumentList extends NodeList<Argument> {
  const ArgumentList(Iterable<Argument> arguments) : super(arguments);

  const ArgumentList.empty() : super.empty();

  factory ArgumentList._parse(Parser parser) { throw new UnsupportedError('implement ArgumentList'); }

  bool operator ==(other) {
    return other is ArgumentList
        && super == other;
  }
}
