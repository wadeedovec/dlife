import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Splash-02.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'securePay': (data) async => ParameterData(
        allParams: {
          'amount': getParameter<double>(data, 'amount'),
          'cardName': getParameter<String>(data, 'cardName'),
          'cardNo': getParameter<String>(data, 'cardNo'),
          'cardCvv': getParameter<String>(data, 'cardCvv'),
          'cardExpireMonth': getParameter<String>(data, 'cardExpireMonth'),
          'cardExpireYear': getParameter<String>(data, 'cardExpireYear'),
          'ip': getParameter<String>(data, 'ip'),
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'walletId': getParameter<DocumentReference>(data, 'walletId'),
        },
      ),
  'home': ParameterData.none(),
  'profile': ParameterData.none(),
  'walletOld': (data) async => ParameterData(
        allParams: {
          'successTopUp': getParameter<int>(data, 'successTopUp'),
          'price': getParameter<double>(data, 'price'),
          'dateTime': getParameter<DateTime>(data, 'dateTime'),
        },
      ),
  'qrCodeGenerator': ParameterData.none(),
  'resetPassword': ParameterData.none(),
  'cart': (data) async => ParameterData(
        allParams: {
          'facilityID': getParameter<DocumentReference>(data, 'facilityID'),
        },
      ),
  'amenities': ParameterData.none(),
  'projects': ParameterData.none(),
  'fitnessDetails': (data) async => ParameterData(
        allParams: {
          'fitnessID': getParameter<DocumentReference>(data, 'fitnessID'),
        },
      ),
  'spaDetails': (data) async => ParameterData(
        allParams: {
          'spaID': getParameter<DocumentReference>(data, 'spaID'),
        },
      ),
  'restaurantDetails': (data) async => ParameterData(
        allParams: {
          'restaurantID': getParameter<DocumentReference>(data, 'restaurantID'),
        },
      ),
  'properties': ParameterData.none(),
  'walletHome': (data) async => ParameterData(
        allParams: {
          'successTopUp': getParameter<int>(data, 'successTopUp'),
          'price': getParameter<double>(data, 'price'),
          'dateTime': getParameter<DateTime>(data, 'dateTime'),
        },
      ),
  'rental': ParameterData.none(),
  'resortDetail': (data) async => ParameterData(
        allParams: {
          'hotelAndResortID':
              getParameter<DocumentReference>(data, 'hotelAndResortID'),
        },
      ),
  'restaurants': ParameterData.none(),
  'orderConfirmed': (data) async => ParameterData(
        allParams: {
          'totalPrice': getParameter<double>(data, 'totalPrice'),
          'tableLocation': getParameter<String>(data, 'tableLocation'),
          'restaurantInfo':
              getParameter<DocumentReference>(data, 'restaurantInfo'),
          'orderId': getParameter<String>(data, 'orderId'),
        },
      ),
  'orderHistory': ParameterData.none(),
  'loungeBar': ParameterData.none(),
  'hotelsAndResorts': ParameterData.none(),
  'loungeBarDetails': (data) async => ParameterData(
        allParams: {
          'facilityID': getParameter<DocumentReference>(data, 'facilityID'),
        },
      ),
  'projectDetail': (data) async => ParameterData(
        allParams: {
          'getProject': getParameter<DocumentReference>(data, 'getProject'),
        },
      ),
  'editProfile': ParameterData.none(),
  'profileNotifications': ParameterData.none(),
  'securityAndPrivacy': ParameterData.none(),
  'privacyPolicy': ParameterData.none(),
  'termsAndServices': ParameterData.none(),
  'helpAndSupport': ParameterData.none(),
  'maintenance': ParameterData.none(),
  'maintenanceDetails': (data) async => ParameterData(
        allParams: {
          'maintenanceID':
              getParameter<DocumentReference>(data, 'maintenanceID'),
        },
      ),
  'propertyDetail': (data) async => ParameterData(
        allParams: {
          'myPropertyID': getParameter<DocumentReference>(data, 'myPropertyID'),
        },
      ),
  'login': ParameterData.none(),
  'register': ParameterData.none(),
  'createProfile': ParameterData.none(),
  'selectRole': ParameterData.none(),
  'notifications': ParameterData.none(),
  'events': ParameterData.none(),
  'invoicesAndDues': ParameterData.none(),
  'invoiceDetails': (data) async => ParameterData(
        allParams: {
          'invoiceID': getParameter<DocumentReference>(data, 'invoiceID'),
        },
      ),
  'bookEvent': (data) async => ParameterData(
        allParams: {
          'eventID': getParameter<DocumentReference>(data, 'eventID'),
        },
      ),
  'rewards': ParameterData.none(),
  'more': ParameterData.none(),
  'comingSoon': ParameterData.none(),
  'createAccountQ': ParameterData.none(),
  'selectRoleSettings': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
