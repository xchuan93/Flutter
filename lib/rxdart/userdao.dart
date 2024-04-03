import 'package:flutter/cupertino.dart';
import 'package:flutterlearning/commont/model/user.dart';
import 'package:rxdart/rxdart.dart';

class UserDao extends ChangeNotifier {
  final BehaviorSubject<User?> _userSubject =
      BehaviorSubject<User?>.seeded(null);

  Stream<User?> get userStream => _userSubject.stream;

  User? get user => _userSubject.value;

  void updateUser(User user) {
    _userSubject.add(user);
  }

  void fetchUser() {}
}
