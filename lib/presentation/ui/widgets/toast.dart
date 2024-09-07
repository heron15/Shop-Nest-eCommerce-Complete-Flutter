import '../../../core/export/app_widgets.dart';

showToast(
  String text,
  Color bgColor,
  Color textColor,
  ToastGravity toastPosition,
) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastPosition,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: 16.0,
    );
