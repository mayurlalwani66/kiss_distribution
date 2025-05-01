import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget(
      {super.key, required this.onRatingSubmit, required this.initialRating});
  final void Function(double rating) onRatingSubmit;
  final double initialRating;
  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 0;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          RatingBar.builder(
            glow: false,
            initialRating: _rating,
            minRating: 0,
            allowHalfRating: false,
            direction: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: ColorManager.colorDeepBlue,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
                _showError = rating < 1;
              });
              widget.onRatingSubmit(_rating);
            },
          ),
          if (_showError)
            Padding(
              padding: EdgeInsets.only(top: AppPadding.p8),
              child: Text(
                AppStrings.ratingIsRequired,
                style: TextStyle(color: ColorManager.colorRed),
              ),
            ),
        ],
      ),
    );
  }
}
