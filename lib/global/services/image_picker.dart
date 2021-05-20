import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService._internal();

  static final ImagePicker _imagePicker = ImagePicker();
  static ImagePickerService? _imagePickerService;

  static ImagePickerService get getInstance =>
      _imagePickerService ??= ImagePickerService._internal();

  Future<File> getImage() async {
    try {
      var pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
      return File(pickedFile!.path);
    } catch (e) {
      throw Exception('Can\'t pick the image from gallery');
    }
  }
}
