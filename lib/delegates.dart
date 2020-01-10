import 'package:vicodin/registrar.dart';
import 'package:vicodin/resolver.dart';

typedef RegistrarDelegate = void Function(Registrar);

typedef ResolveDelegate<T> = T Function(Resolver);
