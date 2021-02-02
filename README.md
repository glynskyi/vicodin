# Vicodin

[![pub](https://img.shields.io/pub/v/vicodin)](https://pub.dartlang.org/packages/vicodin)
[![build](https://www.travis-ci.com/glynskyi/vicodin.svg?branch=master)](https://travis-ci.com/glynskyi/vicodin)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Vicodin is a very simple and yet very useful pure Dart dependency container.

## Getting Started

```Dart
/// register a module with a set of dependencies 
final module = moduleOf((r) {
  r.singleton<Person>((c) => Person("Vicodin"));
});

/// combine a few modules to a single component
final component = componentOf(import: [module]);

/// get the required dependency from the component
final Person person1 = component.resolve<Person>();
final Person person2 = component.resolve<Person>();
expect(identical(person1, person2), true);
```