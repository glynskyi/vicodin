import 'package:test/test.dart';
import 'package:vicodin/vicodin.dart';

class Person {
  final String firstName;

  Person(this.firstName);
}

void main() {
  test('tests singletons', () {
    final module = moduleOf((r) {
      r.singleton<Person>((c) => Person("Vicodin"));
    });
    final component = componentOf(import: [module]);

    final Person person1 = component.resolve();
    final Person person2 = component.resolve();
    expect(identical(person1, person2), true);
  });

  test('tests factories', () {
    final module = moduleOf((r) {
      r.factory<Person>((c) => Person("Vicodin"));
    });
    final component = componentOf(import: [module]);

    final Person person1 = component.resolve();
    final Person person2 = component.resolve();
    expect(identical(person1, person2), false);
  });
}
