import 'package:file_picker/file_picker.dart';

class UploadImage {
  Future<Map<String, dynamic>?> pick() async {
    final result = await FilePicker.platform.pickFiles(
        allowCompression: true,
        type: FileType.image,
        allowedExtensions: ["png", "jpg"]);
    if (result != null) {
      return {
        "path": result.files.single.path,
        "name": result.files.single.name
      };
    }
    return null;
  }
}
