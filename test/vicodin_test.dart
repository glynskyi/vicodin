import 'package:test/test.dart';
import 'package:vicodin/vicodin.dart';

class Person {
  final String firstName;

  Person(this.firstName);
}

class AgedPerson {
  final String firstName;
  final int age;

  AgedPerson(this.firstName, this.age);
}

void main() {
  test('tests a singleton', () {
    final module = moduleOf((r) {
      r.singleton<Person>((c) => Person("Vicodin"));
    });
    final component = componentOf(import: [module]);

    final Person person1 = component.resolve();
    final Person person2 = component.resolve();
    expect(identical(person1, person2), true);
  });

  test('tests a factory', () {
    final module = moduleOf((r) {
      r.factory<Person>((c) => Person("Vicodin"));
    });
    final component = componentOf(import: [module]);

    final Person person1 = component.resolve();
    final Person person2 = component.resolve();
    expect(identical(person1, person2), false);
  });

  test('tests a subcomponent', () {
    final nameModule = moduleOf((r) {
      r.factory<String>((c) => "Vicodin");
    });
    final personModule = moduleOf((r) {
      r.factory<Person>((c) => Person(c.resolve()));
    });

    final parentComponent = componentOf(import: [nameModule]);
    final subComponent = componentOf(parent: parentComponent, import: [personModule]);

    final Person person = subComponent.resolve();
    expect(person.firstName, "Vicodin");
  });

  test('tests an argumented resolve', () {
    final personModule = moduleOf((r) {
      r.factory<Person>((c) => Person(c.resolve()));
    });

    final component = componentOf(import: [personModule]);

    final subComponent = component.bind<String>("Vicodin");
    final Person person = subComponent.resolve();
    expect(person.firstName, "Vicodin");
  });

  test('tests an hierarchy resolve', () {
    final personModule = moduleOf((r) {
      r.factory<AgedPerson>((c) => AgedPerson(c.resolve(), c.resolve()));
    });

    final personComponent = componentOf(import: [personModule]);
    final nameComponent = personComponent.bind<String>("Vicodin");
    final ageComponent = nameComponent.bind<int>(29);

    final AgedPerson person = ageComponent.resolve();
    expect(person.firstName, "Vicodin");
    expect(person.age, 29);
  });
}
