import 'dart:async';

void main(List<String> args) async {
  User user = User();
  UserManager userManager = UserManager(localStorage());
  print(await userManager.datastorage.getUserAge(user));
}

class User {
  int age = 0;
}

class UserManager {
  final IDatastorage datastorage;

  UserManager(this.datastorage);

  void saveUserData(User user, int option) {
    datastorage.saveData(user);
  }

  FutureOr<int> getUserData(User user) async {
    return await datastorage.getUserAge(user);
  }

  // getUserAge(User user) {}
}

abstract class IDatastorage {
  void saveData(User user);
  FutureOr<int> getUserAge(User user);
}

class FirebaseStorage implements IDatastorage {
  @override
  void saveData(User user) {}

  @override
  Future<int> getUserAge(User user) async {
    await Future.delayed(Duration(seconds: 1));
    return 20;
  }
}

class localStorage implements IDatastorage {
  @override
  void saveData(User user) {}

  @override
  int getUserAge(User user) {
    // TODO: implement getUserAge
    return 10;
  }
}
