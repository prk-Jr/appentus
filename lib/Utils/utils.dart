import 'package:appentus/imports.dart';
import 'package:file_picker/file_picker.dart';

class Utils {
  static TextField underlineTextField(
          {bool obscureText = false,
          TextInputType keyboardType = TextInputType.name,
          required String labelText,
          required TextEditingController controller,
          required Function(String) onSubmitted,
          String hintText = "",
          bool validate = false}) =>
      TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textCapitalization: keyboardType == TextInputType.name
            ? TextCapitalization.words
            : TextCapitalization.none,
        onChanged: onSubmitted,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: validate && controller.text.trim().isEmpty
              ? "Please " + labelText
              : null,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: new UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0d6efd)),
          ),
        ),
      );

  Future<List<PlatformFile>> pickFiles({
    int maxFileLength = 1,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: maxFileLength > 1,
        type: FileType.custom,
        allowCompression: true,
        allowedExtensions: ["jpg", "png"]);

    if (result != null) {
      try {
        final files = result.files;

        return result.files.sublist(
            0, files.length > maxFileLength ? maxFileLength : files.length);
      } catch (e) {
        print("Error $e ");
        return [];
      }
    } else {
      return [];
    }
  }

  static AppBar appBar({
    required Widget title,
  }) =>
      AppBar(
        backgroundColor: Colors.white,
        title: title,
        elevation: 0,
      );

  static printData(final data) => {print(data)};
}
