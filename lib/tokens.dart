library analyzer_z.tokens;

import 'dart:core' hide Symbol;
import 'dart:core' as core show Symbol;
import 'src/token.dart';

const Token whitespace = const Token(#WHITESPACE);
const Break lineBreak = const Break.lineBreak();
const Break semicolon = const Break.semicolon();

const Keyword abstractKeyword = const Keyword('abstract');
const Keyword continueKeyword = const Keyword('continue');
const Keyword falseKeyword = const Keyword('false');
const Keyword newKeyword = const Keyword('new');
const Keyword thisKeyword = const Keyword('this');
const Keyword asKeyword = const Keyword('as');
const Keyword defaultKeyword = const Keyword('default');
const Keyword letKeyword = const Keyword('let');
const Keyword nullKeyword = const Keyword('null');
const Keyword throwKeyword = const Keyword('throw');
const Keyword assertKeyword = const Keyword('assert');
const Keyword deferredKeyword = const Keyword('deferred');
const Keyword finallyKeyword = const Keyword('finally');
const Keyword operatorKeyword = const Keyword('operator');
const Keyword trueKeyword = const Keyword('true');
const Keyword asyncKeyword = const Keyword('async');
const Keyword doKeyword = const Keyword('do');
const Keyword forKeyword = const Keyword('for');
const Keyword partKeyword = const Keyword('part');
const Keyword tryKeyword = const Keyword('try');
const Keyword dynamicKeyword = const Keyword('dynamic');
const Keyword getKeyword = const Keyword('get');
const Keyword rethrowKeyword = const Keyword('rethrow');
const Keyword typedefKeyword = const Keyword('typedef');
const Keyword awaitKeyword = const Keyword('await');
const Keyword elseKeyword = const Keyword('else');
const Keyword ifKeyword = const Keyword('if');
const Keyword returnKeyword = const Keyword('return');
const Keyword varKeyword = const Keyword('var');
const Keyword breakKeyword = const Keyword('break');
const Keyword enumKeyword = const Keyword('enum');
const Keyword implementsKeyword = const Keyword('implements');
const Keyword setKeyword = const Keyword('set');
const Keyword voidKeyword = const Keyword('void');
const Keyword caseKeyword = const Keyword('case');
const Keyword exportKeyword = const Keyword('export');
const Keyword importKeyword = const Keyword('import');
const Keyword staticKeyword = const Keyword('static');
const Keyword whileKeyword = const Keyword('while');
const Keyword catchKeyword = const Keyword('catch');
const Keyword externalKeyword = const Keyword('external');
const Keyword inKeyword = const Keyword('in');
const Keyword superKeyword = const Keyword('super');
const Keyword withKeyword = const Keyword('with');
const Keyword classKeyword = const Keyword('class');
const Keyword extendsKeyword = const Keyword('extends');
const Keyword isKeyword = const Keyword('is');
const Keyword switchKeyword = const Keyword('switch');
const Keyword yieldKeyword = const Keyword('yield');
const Keyword constKeyword = const Keyword('const');
const Keyword factoryKeyword = const Keyword('factory');
const Keyword libraryKeyword = const Keyword('library');

const Token period = const Token(#PERIOD);
const Token comma = const Token(#COMMA);
const Token colon = const Token(#COLON);
const Token openCurlyBrace = const Token(#OPEN_CURLYBRACE);
const Token closeCurlyBrace = const Token(#CLOSE_CURLYBRACE);
const Token openParenthesis = const Token(#OPEN_PARENTHESIS);
const Token closeParenthesis = const Token(#CLOSE_PARENTHESIS);
const Token openBracket = const Token(#OPEN_BRACKET);
const Token closeBracket = const Token(#CLOSE_BRACKET);
const Token openAngleBracket = const Token(#OPEN_ANGLEBRACKET);
const Token closeAngleBracket = const Token(#CLOSE_ANGLEBRACKET);
const Token hash = const Token(#HASH);
const Token bang = const Token(#BANG);
const Token questionMark = const Token(#QUESTION_MARK);
const Token slash = const Token(#SLASH);
const Token backslash = const Token(#BACKSLASH);
const Token ampersand = const Token(#AMPERSAND);
const Token pipe = const Token(#PIPE);
const Token tilde = const Token(#TILDE);
const Token percentSign = const Token(#PERCENT_SIGN);
const Token plus = const Token(#PLUS);
const Token equals = const Token(#EQUALS);
const Token dash = const Token(#DASH);
const Token doubleQuote = const Token(#DOUBLE_QUOTE);
const Token singleQuote = const Token(#SINGLE_QUOTE);


class Break extends Token {
  static const core.Symbol _name = #BREAK;

  final bool isSemicolon;
  final bool isLineBreak;

  const Break.semicolon()
      : isSemicolon = true,
        isLineBreak = false,
        super(_name);

  const Break.lineBreak()
      : isSemicolon = false,
        isLineBreak = true,
        super(_name);
}

class Symbol extends Token {
  final String value;

  const Symbol(this.value) : super(#SYMBOL);

  bool operator ==(other) {
    return other is Symbol
        && value == other.value
        && super == other;
  }

  String toString() => 'SymbolToken($value)';
}

class Keyword extends Symbol {
  const Keyword(String value) : super(value);

  bool operator ==(other) {
    return other is Keyword
        && super == other;
  }

  String toString() => 'Keyword($value)';
}

class Number extends Token {
  final num value;

  const Number(this.value) : super(#NUMBER);

  bool operator ==(other) {
    return other is Number
        && value == other.value
        && super == other;
  }

  String toString() => 'Number($value)';
}

class StringToken extends Token {
  final String value;
  final bool isMultiline;
  final bool isRaw;
  final bool isUsingSingleQuotes;

  const StringToken({
    this.value,
    this.isMultiline: false,
    this.isRaw: false,
    this.isUsingSingleQuotes: true
  }) : super(#STRING);

  bool operator ==(other) {
    return other is StringToken
        && value == other.value
        && super == other;
  }

  String toString() => 'String($value)';
}

abstract class Comment extends Token {
  final String content;

  bool get isLineComment;
  bool get isDocComment;
  bool get isMultilineComment;

  const Comment(this.content) : super(#COMMENT);

  bool operator ==(other) {
    return other is Comment
        && content == other.content
        && super == other;
  }
}

class LineComment extends Comment {
  const LineComment(String content) : super(content);

  bool get isDocComment => false;
  bool get isLineComment => true;
  bool get isMultilineComment => false;

  bool operator ==(other) {
    return other is LineComment
        && super == other;
  }

  String toString() => 'Comment(//$content)';
}

class MultilineComment extends Comment {
  const MultilineComment(String content) : super(content);

  bool get isDocComment => false;
  bool get isLineComment => false;
  bool get isMultilineComment => true;

  bool operator ==(other) {
    return other is LineComment
        && super == other;
  }

  String toString() => 'Comment(/*$content*/)';
}

class DocComment extends Comment {
  const DocComment(String content) : super(content);

  bool get isDocComment => true;
  bool get isLineComment => false;
  bool get isMultilineComment => false;

  bool operator ==(other) {
    return other is LineComment
        && super == other;
  }

  String toString() => 'Comment(///$content)';
}
