import 'package:flutter/widgets.dart';

class ErrorTextWidget extends StatelessWidget {
  final String error;
  const ErrorTextWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
