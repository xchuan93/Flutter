import 'package:flutterlearning/commont/model/user.dart';
import 'package:flutterlearning/redux/xc_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

final userReducer = combineReducers<User?>([
  TypedReducer<User?, UpdateUserAction>(_updateLoaded).call,
]);

User? _updateLoaded(User? user, action) {
  user = action.userInfo;
  return user;
}

class UpdateUserAction {
  final User? userInfo;

  UpdateUserAction(this.userInfo);
}

class FetchUserAction {}

class UserInfoMiddleware implements MiddlewareClass<XCState> {
  @override
  call(Store<XCState> store, action, NextDispatcher next) {
    // TODO: implement call
    if (action is UpdateUserAction) {
      print("UpdateUserAction");
    }
    next(action);
  }
}

Stream<dynamic> userInfoEpic(
    Stream<dynamic> actions, EpicStore<XCState> store) {
  Stream<dynamic> _loadUserInfo() async* {
    // var res = await UserDao.getUserInfo(null);
    // yield UpdateUserAction(res.data);
  }

  return actions
      // to UpdateUserAction actions
      .whereType<FetchUserAction>()
      // Don't start  until the 10ms
      .debounce(((_) => TimerStream(true, const Duration(milliseconds: 10))))
      .switchMap((action) => _loadUserInfo());
}
