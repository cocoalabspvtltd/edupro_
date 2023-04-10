import 'package:pgs_edupro/domain/auth/user.dart';

class ServerUserMapper {
  User? toDomain(User u) {
    return u.id == '' //|| UserDetailsLocal.apiToken != null
        ? null
        : User(
            id: (u.id),
            name: u.name,
            emailAddress: u.emailAddress,
      type: u.type
          );
  }
}
