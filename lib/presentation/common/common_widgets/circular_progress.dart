import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';

class CircularProgressWidget extends StatefulWidget {
  const CircularProgressWidget({super.key});

  @override
  State<CircularProgressWidget> createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: ColorManager.colorPrimary),
    );
  }
}
