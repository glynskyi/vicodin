import 'package:vicodin/module.dart';
import 'package:vicodin/resolver.dart';

class Component implements Resolver {
  final Component _parentComponent;
  final List<Module> _modules;

  Component(this._parentComponent, this._modules) : assert(_modules != null);

  T _resolveFromSubComponent<T>(Resolver resolver) {
    for (var module in _modules) {
      final dependency = module.resolve<T>(this);
      if (dependency != null) {
        return dependency;
      }
    }
    return null;
  }

  @override
  T resolve<T>() {
    for (var module in _modules) {
      final dependency = module.resolve<T>(this);
      if (dependency != null) {
        return dependency;
      }
    }
    final dependency = _parentComponent?._resolveFromSubComponent(this);
    final T dependency = _parentComponent?._resolveFromSubComponent<T>(this);
    if (dependency != null) {
      return dependency;
    }
    throw StateError("Can't resolve $T");
  }
}
