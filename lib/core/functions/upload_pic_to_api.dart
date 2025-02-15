import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

Future uploadPicToApi(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
