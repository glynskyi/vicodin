import 'package:vicodin/src/component.dart';
import 'package:vicodin/src/delegates.dart';
import 'package:vicodin/src/module.dart';

Module moduleOf(RegistrarDelegate delegate) {
  final module = Module();
  delegate(module);
  return module;
}

Component componentOf({Component? parent, required List<Module> import}) {
  return Component(parent, import);
}
