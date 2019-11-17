import 'package:asistencia/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  const UserProvider({
    Key key,
    @required this.user,
    @required Widget child,
  })  : assert(user != null),
        assert(child != null),
        super(key: key, child: child);

  final UserModel user;

  static UserProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(UserProvider) as UserProvider;
  }

  @override
  bool updateShouldNotify(UserProvider old) => user != old.user;
}
