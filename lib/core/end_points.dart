class EndPoints {
  String baseUrl = "https://food-api-omega.vercel.app/api/v1/";
  String signIn = "user/signin";
  String signUp = "user/signup";
  String userUpdate = "user/update";
  static String getUserDataEndpoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKeys {
  String status = 'status';
  String errorMessage = 'ErrorMessage';
  String email = 'email';
  String password = 'password';
  String token = 'token';
  String id = 'id';
  String message = 'message';
  String name = 'name';
  String phoneNumber = 'phone';
  String confirmPassword = 'confirmPassword';
  String location = 'location';
  String profilePic = 'profilePic';
}
