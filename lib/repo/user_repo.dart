import 'package:flutter_practice2/models/user_data/user_data.dart';

abstract class UserRepository {
  const UserRepository();
  UserData getUserData(String userId);
}

class UserRepositoryTest extends UserRepository {
  const UserRepositoryTest();
  static UserData? data;
  @override
  UserData getUserData(String userId) {
    if (data == null) {
      data = new UserData(id: "1", name: "Ensar Emir EROL");
    }
    return data!;
  }
}
