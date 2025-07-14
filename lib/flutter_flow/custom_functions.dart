import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;

int? textCount(String text) {
  // a funtion that count the number of characters in a text including spaces and punctuation marks, and returns the amount as integer
  return text
      .length; // Count the number of characters including spaces and punctuation
}

int howManyDay(
  DateTime startDate,
  DateTime expireDate,
) {
  // a function that calculates how many days from imputed past date to current date which is in my perimeter startDate and expireDateand returns integer if both dates are the same day return zero 0 also if the start date is future and expiredate is past resove to zero i mean if the result is in minus resolve to 0
  DateTime now = DateTime.now();

  // If startDate is in the future or expireDate is in the past, return 0
  if (startDate.isAfter(now) || expireDate.isBefore(now)) {
    return 0;
  }

  // Calculate the difference in days
  int difference = expireDate.difference(startDate).inDays;

  // If both dates are the same day, return 0
  return difference == 0 ? 0 : difference;
}

DateTime oneMonthDate(DateTime startdate) {
  // a function that tell future date date in one month from start date input and it should return date in dateTime format, it should use calender cycle not 30 days or 31 day standard, if the month is 30 let it give if its 28 let it give
// Add one month to the start date using the calendar cycle
  DateTime newDate =
      DateTime(startdate.year, startdate.month + 1, startdate.day);

  // Check if the new date exceeds the last day of the month
  if (newDate.month != (startdate.month + 1) % 12) {
    // If it does, set the day to the last day of the month
    newDate = DateTime(newDate.year, newDate.month + 1, 0);
  }

  return newDate;
}

DateTime? oneYearDate(DateTime? startDate) {
  // a function that tell future date date in one year from start date input and it should return date in dateTime format, it should use calender cycle not just 365 days  standard
  if (startDate == null) return null;

  // Add one year to the start date using the calendar cycle
  DateTime newDate =
      DateTime(startDate.year + 1, startDate.month, startDate.day);

  // Check if the new date exceeds the last day of the month
  if (newDate.month != (startDate.month + 1) % 12) {
    // If it does, set the day to the last day of the month
    newDate = DateTime(newDate.year, newDate.month + 1, 0);
  }

  return newDate;
}

int pecentagGet(
  int mainbalance,
  int currentbalance,
) {
  // a function that divides currentblanle in my perimeter by mainbalance in my perimeter then multiply the result by 100 return integer
  // a function that divides currentbalance by mainbalance then multiply the result by 100 and return integer
  if (mainbalance == 0) return 0; // Avoid division by zero
  return ((currentbalance / mainbalance) * 100).toInt();
}

double getDecimal(int pecentResult) {
  // a function that divides and integer from my perimeter pecentResult by 100 return a double
  return pecentResult / 100.0; // Divide the integer by 100 to get a double
}

int divide(int number) {
  // function that divides a number from my number input perimeter by 3 then returns answer as integer
  return (number / 3).toInt(); // Divide the number by 3 and return as integer
}
