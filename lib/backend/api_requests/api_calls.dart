import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start BF - emailSupportTicket Group Code

class BFEmailSupportTicketGroup {
  static String getBaseUrl() => 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailSupportTicketCall emailSupportTicketCall =
      EmailSupportTicketCall();
}

class EmailSupportTicketCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? name = '',
    String? email = '',
    String? topic = '',
    String? category = '',
    String? message = '',
  }) async {
    final baseUrl = BFEmailSupportTicketGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "sk-bf-6d9ccec7-9054-4f71-965b-ff26a8262f99": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailSupportTicket',
      apiUrl:
          '${baseUrl}/email?templateId=waij1iOrSuG3NIwlTOz6&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}&name=${name}&email=${email}&topic=${topic}&category=${category}&message=${message}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - emailSupportTicket Group Code

class TikoPaymentCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? currency = '',
    double? amount,
    int? installment = 0,
    String? urlOk = '',
    String? urlFail = '',
    String? cardName = '',
    String? cardNo = '',
    String? cardCvv = '',
    String? cardExpireMonth = '',
    String? cardExpireYear = '',
    String? cardType = '',
    String? userIp = '',
    String? userName = '',
    String? userEmail = '',
    String? hash = '',
    String? merchantId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'tikoPayment',
      apiUrl: 'https://www.tikokart.com/api-sanalpos/gateway/pay3d',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'MerchantId': merchantId,
        'OrderId': orderId,
        'Amount': amount,
        'Currency': currency,
        'Installment': installment,
        'UrlOk': urlOk,
        'UrlFail': urlFail,
        'CardName': cardName,
        'CardNo': cardNo,
        'CardCvv': cardCvv,
        'CardExpireMonth': cardExpireMonth,
        'CardExpireYear': cardExpireYear,
        'CardType': cardType,
        'UserIp': userIp,
        'UserName': userName,
        'UserEmail': userEmail,
        'Hash': hash,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'test',
      apiUrl: 'https://www.tikokart.com/api-sanalpos/gateway/pay3d',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserIpCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'userIp',
      apiUrl: 'https://api.country.is/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
