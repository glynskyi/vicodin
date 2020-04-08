import 'package:vicodin/module.dart';
import 'package:vicodin/resolver.dart';
import 'package:vicodin/shotcuts.dart';

class Component implements Resolver {
  final Component _parentComponent;
  final List<Module> _modules;

  Component(this._parentComponent, this._modules) : assert(_modules != null);

  T _resolveFromSubComponent<T>(Resolver resolver) {
    for (var module in _modules) {
      final dependency = module.resolve<T>(resolver);
      if (dependency != null) {
        return dependency;
      }
    }
    final T resolverDependency = _parentComponent?._resolveFromSubComponent<T>(resolver);
    if (resolverDependency != null) {
      return resolverDependency;
    }
    final T dependency = _parentComponent?._resolveFromSubComponent<T>(this);
    if (dependency != null) {
      return dependency;
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
    final T dependency = _parentComponent?._resolveFromSubComponent<T>(this);
    if (dependency != null) {
      return dependency;
    }
    throw StateError("Can't resolve $T");
  }

  Component bind<T>(T dependency) {
    final module = moduleOf(
        (registrar) => registrar.singleton<T>((resolver) => dependency));
    return componentOf(parent: this, import: [module]);
  }
}
