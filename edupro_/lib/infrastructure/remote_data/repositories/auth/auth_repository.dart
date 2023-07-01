import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';
String user1="";
String user2="";
 String UserStatus ="";
class AuthRepository {
  ApiProvider? apiClient;

  AuthRepository() {
    apiClient ??= ApiProvider();
  }
  Future registerUser(String body) async {
    Response response = await apiClient!
        .getJsonInstance()
        .post(Api.registerWithEmailAndPassword, data: body);
    print("response->${response.data}");
    return response;
  }

  Future<Response> login(String body) async {
    Response response = await apiClient!
        .getJsonInstance()
        .post(Api.logInWithEmailAndPassword, data: body);
    // UserStatus =response.data['instructor']['user_status'];
    print("gvgbg${UserStatus}");
user1 = response.data['instructor'][0];
user2 =response.data['institution'][0];
return response;
  }

  Future verifyEduproUser(String body) async {
    Response response = await apiClient!
        .getJsonInstance()
        .post(Api.eduproUserVerification, data: body);
    return response;
  }
}
