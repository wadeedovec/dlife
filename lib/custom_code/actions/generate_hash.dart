// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<String> generateHash(
  String merchantId,
  String userIp,
  String orderId,
  String urlOk,
  String urlFail,
  double amount,
  String currency,
  int installment,
  int isTest,
  String secret,
  String password,
) async {
  // Concatenate the input parameters to form the hash string
  String hashStr =
      '$merchantId$userIp$orderId$urlOk$urlFail$amount$currency$installment$isTest';

  // Append the password to the hash string as per PHP implementation
  hashStr += password;

  // Generate the HMAC-SHA256 hash using the secret
  var key = utf8.encode(secret); // Key
  var bytes = utf8.encode(hashStr); // Data to be hashed

  var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
  var digest = hmacSha256.convert(bytes);

  // Return the hash as a Base64-encoded string
  return base64.encode(digest.bytes);
}
