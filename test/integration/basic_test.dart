import 'package:testcase/testcase.dart';
export 'package:testcase/init.dart';
import 'package:analyzer_z/analyzer_z.dart';
import 'package:analyzer_z/ast.dart';

class BasicTest extends TestCase {
  setUp() {}

  tearDown() {}

  void expectParses(String source, Matcher matcher) {
    final ast = parseToAst(source);
    expect(ast, matcher);
  }

  @test
  it_turns_a_source_string_into_a_node() {
    expectParses('', new isInstanceOf<Node>());
  }

  @test
  it_wraps_child_nodes_into_the_parent_node() {
    expectParses('', equals(const RootNode.empty()));
  }

  @test
  basic_integration() {
    expectParses('''

        const s = 'string'

        class Point {
          let x: Int
          let y: Int
        }

    ''', equals(

        const RootNode(
            const NodeList(const <TopLevelDeclaration>[
              const TopLevelConstDeclaration(
                  name: const Identifier('s'),
                  value: const Expression(const NodeList<ExpressionLevelDeclaration>(const <ExpressionLevelDeclaration>[
                    const StringLiteral(value: 'string')
                  ])),
                  type: const UndeclaredType()
              ),

              const ClassDeclaration(
                  name: const Identifier('Point'),
                  children: const NodeList(const <ClassLevelDeclaration>[
                    const ClassLevelLetDeclaration(
                        name: const Identifier('x'),
                        type: const TypeName('Int')
                    ),
                    const ClassLevelLetDeclaration(
                        name: const Identifier('y'),
                        type: const TypeName('Int')
                    ),
                  ])
              )
            ])
        )

    ));
  }

  @test
  top_level_integration() {
    const x = const Identifier('x');
    const X = const Identifier('X');
    const typeX = const TypeName('X');
    const nullEx = const Expression(const NodeList<ExpressionLevelDeclaration>(const [
      const NullLiteral()
    ]));

    expectParses('''
        library x
        part of x
        part x
        import x
        import x as x
        import x as x show X
        export x hide X

        var x: X = null
        let x: X = null
        const x: X = null

        var x = null
        let x = null
        const x = null

        var x
        let x
        const x

        x() {}
        class X {}
        abstract class X {}
        enum X {}

        typedef X()
    ''', equals(

        const RootNode(
            const NodeList<TopLevelDeclaration>(const [

              const LibraryDeclaration(x),
              const PartDeclaration(x),
              const PartOfDeclaration(x),
              const ImportDeclaration(x),
              const ImportDeclaration(x, as: x),
              const ImportDeclaration(x, as: x, show: const [typeX]),
              const ExportDeclaration(x, hide: const [typeX]),

              const TopLevelVarDeclaration(name: x, type: typeX, value: nullEx),
              const TopLevelLetDeclaration(name: x, type: typeX, value: nullEx),
              const TopLevelConstDeclaration(name: x, type: typeX, value: nullEx),

              const TopLevelVarDeclaration(name: x, value: nullEx),
              const TopLevelLetDeclaration(name: x, value: nullEx),
              const TopLevelConstDeclaration(name: x, value: nullEx),

              const TopLevelVarDeclaration(name: x),
              const TopLevelLetDeclaration(name: x),
              const TopLevelConstDeclaration(name: x),

              const TopLevelFunctionDeclaration(name: x),
              const ClassDeclaration(name: X),
              const ClassDeclaration(name: X, abstract: true),
              const EnumDeclaration(name: X),

              const TypedefDeclaration(name: X),
            ])
        )
    ));
  }
}