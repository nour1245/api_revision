import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/signin_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/repostries/user_repostoriy.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepostoriy) : super(UserInitial());
  final UserRepostoriy userRepostoriy;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignInModel? user;

  singIn() async {
    emit(SignInLoading());
    final response = await userRepostoriy.signIn(
      signInEmail.text,
      signInPassword.text,
    );
    response.fold((errorMessage) => emit(SignInError(msg: errorMessage)),
        (signinModel) => emit(SignInSuccses()));
  }

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await userRepostoriy.signUp(
        signUpName.text,
        signUpEmail.text,
        signUpPhoneNumber.text,
        signUpPassword.text,
        confirmPassword.text,
        profilePic!);
    response.fold(
      (errorMessage) => emit(SignUpError(msg: errorMessage)),
      (singUpModel) => emit(
        SignUpSuccses(message: singUpModel.message),
      ),
    );
  }

  getUserDataProfile() async {
    emit(GetUserDataLoading());
    final response = await userRepostoriy.getUserProfile();
    response.fold(
      (errorMessage) => emit(GetUserDataError(msg: errorMessage)),
      (user) => emit(
        GetUserDataSuccses(user: user),
      ),
    );
  }

  // userUpdate() async {
  //   try {
  //     emit(updateUserDataLoading());
  //     final response =
  //         await api.patch(EndPoints().userUpdate, isFormData: true,
  //          data: {
  //           name
  //           phone
  //           location
  //           profilePic
  //         });
  //   } on ServerExcption catch (e) {
  //     emit(
  //       updateUserDataError(msg: e.errorModel.errorMessage),
  //     );
  //   }
  //   ;
  // }
}
