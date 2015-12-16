import 'dart:io';
import 'package:args/args.dart';
import 'dart:convert';
import 'package:analyzer_z/analyzer_z.dart';
import 'package:analyzer_z/ast.dart';

main(List<String> args) {
  final parser = new ArgParser(allowTrailingOptions: true);
  parser.addFlag('help', abbr: 'h', help: 'Show help');
  parser.addOption('out', abbr: 'o', help: 'Write to a file instead of stdout');
  final ArgResults result = parser.parse(args);
  final toFile = result['out'];
  if (result.rest.length > 1 || result['help']) {
    print('Usage: convert [options] <input-file>');
    print(parser.usage);
    return;
  }
  if (result.rest.isEmpty) {
    _parseFromStdin(toFile);
    return;
  }
  final file = new File(result.rest.first);
  if (!file.existsSync()) {
    print('${file.path} doesn\'t exist!');
    return;
  }
  _parseFromFile(file, toFile);
}

_parseFromStdin([String toFile]) async {
  final input = await stdin.map(UTF8.decode).join('\n');
  final output = _output(toFile);
  output(_parse(input));
}

_parseFromFile(File file, [String toFile]) async {
  final input = await file.readAsString();
  final output = _output(toFile);
  output(_parse(input));
}

Function _output([String toFile]) {
  if (toFile == null) return stdout.write;
  return new File(toFile).writeAsStringSync;
}

String _parse(String input) {
  final ast = parseToAst(input);
  return ast.children.map(_convertTopLevel).join('\n') + '\n';
}

String _convertTopLevel(TopLevelDeclaration d) {
  if (d is TopLevelLetDeclaration)
    return _parseValueDeclaration('final ', d.name, d.type, d.value);
  if (d is TopLevelVarDeclaration)
    return _parseValueDeclaration(d.type is UndeclaredType ? 'var ' : '', d.name, d.type, d.value);
  return '';
}

String _parseValueDeclaration(String prefix, Identifier name, TypeName type, Expression value) {
  final typePart = type is UndeclaredType ? '' : '${_convertType(type.value)} ';
  final assignPart = value == null ? '' : ' = ${value}';
  return '$prefix$typePart${name.value}$assignPart;';
}

String _convertType(String type) {
  switch (type) {
    case 'Int':
    case 'Num':
    case 'Double':
    case 'Bool':
      return type.toLowerCase();
    default:
      return type;
  }
}