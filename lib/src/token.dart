library analyzer_z.token;

class Token {
  final Symbol name;

  const Token(this.name);

  static const Token eof = const Token(#EOF);

  bool operator ==(other) {
    return other is Token
        && other.name == name;
  }

  String toString() {
    return 'Token#$name';
  }
}