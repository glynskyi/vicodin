# Vicodin

[![pub](https://img.shields.io/pub/v/vicodin)](https://pub.dartlang.org/packages/vicodin)

Vicodin is a very simple and yet very useful pure Dart dependency container.

## Getting Started

```Dart
final module = moduleOf((r) {
  r.singleton<Person>((c) => Person("Vicodin"));
});
final component = componentOf(import: [module]);

final Person person1 = component.resolve<Person>();
final Person person2 = component.resolve<Person>();
expect(identical(person1, person2), true);
```