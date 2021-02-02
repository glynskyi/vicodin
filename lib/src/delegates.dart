import 'package:vicodin/src/registrar.dart';
import 'package:vicodin/src/resolver.dart';

typedef RegistrarDelegate = void Function(Registrar);

typedef ResolveDelegate<T> = T? Function(Resolver);
