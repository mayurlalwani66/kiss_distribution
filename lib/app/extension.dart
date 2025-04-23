// extension on String

import 'package:intl/intl.dart';
import 'package:k_distribution/app/functions.dart';

import '../data/mapper/auth_mapper.dart';

extension StringExtension on String {
  String toCapitalize() {
    String targetString = this;
    List<String> stringSeparatedBySpace = targetString.toLowerCase().split(" ");
    List<String> capitalizedWord = [];

    for (var word in stringSeparatedBySpace) {
      word.isEmpty
          ? ""
          : capitalizedWord.add("${word[0].toUpperCase()}${word.substring(1)}");
    }

    return capitalizedWord.join(" ");
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

// extension on Integer

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

// extension on Double

extension NonNullDouble on double? {
  double orZeroPointZero() {
    if (this == null) {
      return ZEROPOINTZERO;
    } else {
      return this!;
    }
  }
}

// extension on num

extension NonNullNum on num? {
  num orNum() {
    if (this == null) {
      return ZEROPOINTZERO;
    } else {
      return this!;
    }
  }
}

// extension on Date

extension NonNullDate on DateTime? {
  DateTime orDate() {
    if (this == null) {
      return DATE;
    } else {
      return this!;
    }
  }
}
// extension on bool

extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return FALSE;
    } else {
      return this!;
    }
  }
}

extension ProductTypeExtension on ProductType {
  String toJson() {
    return toString().split('.').last;
  }
}

extension ProductTypeParsing on String? {
  ProductType toProductType() {
    switch (this) {
      case "previousOrder":
        return ProductType.previousOrder;
      case "mostLoved":
        return ProductType.mostLoved;
      case "menu":
        return ProductType.menu;
      default:
        return ProductType.menu;
    }
  }
}

extension NumRoundExtension on num {
  double roundToTwo() {
    return double.parse(toStringAsFixed(2));
  }
}

extension FormattedDateTime on DateTime {
  String toFormattedString(
      {String datePattern = 'dd/MM/yyyy', String timePattern = 'kk:mm:a'}) {
    final date = DateFormat(datePattern).format(this);
    final time = DateFormat(timePattern).format(this);
    return "$date  $time";
  }
}
