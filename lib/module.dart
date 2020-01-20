import 'package:vicodin/delegates.dart';
import 'package:vicodin/registrar.dart';
import 'package:vicodin/resolver.dart';

class Module implements Registrar {
  final Map<Type, ResolveDelegate> _singletonDelegates = {};
  final Map<Type, ResolveDelegate> _factoryDelegates = {};
  final Map<Type, Object> _singletons = {};

  @override
  void factory<T>(ResolveDelegate<T> delegate) {
    assert(delegate != null);
    _factoryDelegates[T] = delegate;
  }

  @override
  void singleton<T>(ResolveDelegate<T> delegate) {
    assert(delegate != null);
    _singletonDelegates[T] = delegate;
  }

  T resolve<T>(Resolver resolver) {
    if (_singletons.containsKey(T)) {
      return _singletons[T] as T;
    }
    if (_singletonDelegates.containsKey(T)) {
      final T singleton = _singletonDelegates[T](resolver) as T;
      _singletons[T] = singleton;
      return singleton;
    }
    if (_factoryDelegates.containsKey(T)) {
      return _factoryDelegates[T](resolver) as T;
    }
    return null;
  }
}
