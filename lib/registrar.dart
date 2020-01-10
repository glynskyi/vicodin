import 'package:vicodin/delegates.dart';

abstract class Registrar {
  void singleton<T>(ResolveDelegate<T> delegate);

  void factory<T>(ResolveDelegate<T> delegate);
}
