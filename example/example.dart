import 'package:vicodin/vicodin.dart';

class Person {
  final String firstName;

  Person(this.firstName);
}

void main() {
  final module = moduleOf((r) {
    r.singleton<Person>((c) => Person("Vicodin"));
  });
  final component = componentOf(import: [module]);

  final Person person1 = component.resolve();
  final Person person2 = component.resolve();
  print(identical(person1, person2));
}
