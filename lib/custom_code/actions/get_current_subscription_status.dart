// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/backend/schema/structs/index.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:purchases_flutter/purchases_flutter.dart';

Future<dynamic> getCurrentSubscriptionStatus() async {
  try {
    final customerInfo = await Purchases.getCustomerInfo();
    final entitlements = customerInfo.entitlements.active;

    if (entitlements.isNotEmpty) {
      final firstEntitlement = entitlements.values.first;

      return {
        'subscription_name': firstEntitlement.identifier ?? '',
        'purchase_date': firstEntitlement.latestPurchaseDate ?? '',
        'expiration_date': firstEntitlement.expirationDate ?? '',
        'status': 'active',
      };
    } else {
      return {
        'status': 'inactive',
        'subscription_name': '',
        'purchase_date': '',
        'expiration_date': '',
      };
    }
  } catch (e) {
    return {
      'status': 'error',
      'message': e.toString(),
    };
  }
}
