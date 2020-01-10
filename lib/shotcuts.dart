import 'package:vicodin/component.dart';
import 'package:vicodin/delegates.dart';
import 'package:vicodin/module.dart';

Module moduleOf(RegistrarDelegate delegate) {
  final module = Module();
  delegate(module);
  return module;
}

Component componentOf({Component parent, List<Module> import}) {
  return Component(parent, import);
}
