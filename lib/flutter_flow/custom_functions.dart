import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? searchFilter(
  String? textSearchFor,
  String? textSearchIn,
) {
  // search filter for textSearchFor and textSearchIn
  if (textSearchFor == null || textSearchIn == null) {
    return null;
  }
  final regex = RegExp(textSearchFor, caseSensitive: false);
  return regex.hasMatch(textSearchIn);
}

double? getTotalAmount(double? requestedAmount) {
  // get requestedAmount  from user then multiply by 0.05 to get the total amount with the tax and the amount of tax
  if (requestedAmount == null) {
    return null;
  }
  final tax = requestedAmount * 0.05;
  final totalAmount = requestedAmount + tax;
  return totalAmount;
}

double? getTaxAmount(double? requestedAmount) {
  // get requestedAmount  from user then multiply by 0.05 to get  the amount of tax
  if (requestedAmount == null) {
    return null;
  }
  final tax = requestedAmount * 0.05;
  return tax;
}

bool isProductInCart(
  String productId,
  List<dynamic> cartItems,
) {
  return cartItems.any((item) => item['product_id'] == productId);
}

List<dynamic> increaseCartQuantity(
  String productId,
  List<dynamic> cartItems,
) {
  final updatedCart = List<Map<String, dynamic>>.from(cartItems);
  final index =
      updatedCart.indexWhere((item) => item['product_id'] == productId);

  if (index != -1) {
    updatedCart[index]['quantity'] = (updatedCart[index]['quantity'] ?? 1) + 1;
  }

  return updatedCart;
}

int getTotalCartQuantity(List<dynamic> cartItems) {
  int total = 0;
  for (final item in cartItems) {
    total += (item['quantity'] ?? 0) as int;
  }
  return total;
}

double getTotalCartPrice(
  List<dynamic> cartItems,
  int? userRole,
) {
  double total = 0;

  for (final item in cartItems) {
    final price = (userRole == 4
            ? (item['emp_price'] ?? 0)
            : (item['product_price'] ?? 0))
        .toDouble();
    final quantity = (item['quantity'] ?? 0).toInt();
    total += price * quantity;
  }

  return total;
}

List<dynamic> updateCartQuantity(
  String productId,
  int quantity,
  List<dynamic> cartItems,
) {
  final updatedCart = List<Map<String, dynamic>>.from(cartItems);
  final index =
      updatedCart.indexWhere((item) => item['product_id'] == productId);

  if (index != -1) {
    if (quantity <= 0) {
      updatedCart.removeAt(index); // Optionally remove item if 0
    } else {
      updatedCart[index]['quantity'] = quantity;
    }
  }

  return updatedCart;
}

List<dynamic> removeFromCart(
  String productId,
  List<dynamic> cartItems,
) {
  final updatedCart = List<Map<String, dynamic>>.from(cartItems);
  updatedCart.removeWhere((item) => item['product_id'] == productId);
  return updatedCart;
}

int getProductQuantity(
  String productId,
  List<dynamic> cartItems,
) {
  for (final item in cartItems) {
    if (item['product_id'] == productId) {
      return item['quantity'] ?? 0;
    }
  }
  return 0;
}

String extractFieldFromDartString(
  String input,
  String fieldName,
) {
  try {
    final parts = input.split(',');
    for (final part in parts) {
      if (part.trim().startsWith('$fieldName:')) {
        final value = part.split(':')[1].trim();
        return value.replaceAll('}', '').trim();
      }
    }
    return '';
  } catch (e) {
    return '';
  }
}

double sumTotalPrices(List<OrdersRecord> orders) {
  double total = 0;
  for (var order in orders) {
    if (order.totalPrice != null) {
      total += order.totalPrice!;
    }
  }
  return total;
}

int getRoleFromEmail(String email) {
  final lowerEmail = email.toLowerCase();

  final allowedDomains = [
    '@dovecgroup.com',
    '@courtyardcyprus.com',
  ];

  for (final domain in allowedDomains) {
    if (lowerEmail.endsWith(domain)) {
      return 4;
    }
  }

  return 0; // Default role
}

DateTime? getEndOfWeek() {
  final now = DateTime.now();
  final remainingDays = 7 - now.weekday;
  return DateTime(now.year, now.month, now.day + remainingDays, 23, 59, 59);
}

double sumPendingInvoices(List<InvoicesRecord> invoices) {
  double total = 0;
  for (final invoice in invoices) {
    total += invoice.amount ?? 0;
  }
  return total;
}

int getDaysRemaining(DateTime endDate) {
  final now = DateTime.now();
  return endDate.difference(now).inDays;
}

DateTime calculateGymEndDateFormatted(
  DateTime startDate,
  int durationInMonths,
) {
  return DateTime(
      startDate.year, startDate.month + durationInMonths, startDate.day);
}

int calculateProgressPercentage(
  DateTime startDate,
  DateTime endDate,
) {
  final now = DateTime.now();

  if (now.isBefore(startDate)) return 0;
  if (now.isAfter(endDate)) return 100;

  final totalDuration = endDate.difference(startDate).inDays;
  final elapsedDuration = now.difference(startDate).inDays;

  if (totalDuration == 0) return 100; // Avoid division by zero

  return ((elapsedDuration / totalDuration) * 100).round();
}

String calculateAverageProgress(List<ProjectsRecord> projects) {
  int totalProgress = 0;

  for (var project in projects) {
    final startDate = project.projectStartingDate;
    final endDate = project.projectDeliveryDate;

    if (startDate != null && endDate != null) {
      totalProgress += calculateProgressPercentage(startDate, endDate);
    }
  }

  return (projects.isNotEmpty)
      ? (totalProgress / projects.length).round().toString()
      : '0';
}

String getProjectStatus(DateTime? deliveryDate) {
  if (deliveryDate == null) return 'Unknown';

  return DateTime.now().isAfter(deliveryDate)
      ? 'Completed'
      : 'Under Construction';
}

String getFacilityStatus(
  String openAt,
  String closeAt,
) {
  try {
    final now = DateTime.now();
    final openParts = openAt.split(":");
    final closeParts = closeAt.split(":");

    final openTime = DateTime(now.year, now.month, now.day,
        int.parse(openParts[0]), int.parse(openParts[1]));
    final closeTime = DateTime(now.year, now.month, now.day,
        int.parse(closeParts[0]), int.parse(closeParts[1]));

    if (now.isAfter(openTime) && now.isBefore(closeTime)) {
      return 'Open';
    } else {
      return 'Closed';
    }
  } catch (e) {
    return 'Closed'; // Fallback in case of error or invalid format
  }
}

double convertToDouble(String value) {
  return double.tryParse(value) ?? 0.0;
}

String formatToTRY(String value) {
  try {
    final parsed =
        double.tryParse(value.replaceAll('.', '').replaceAll(',', '.')) ?? 0.0;
    final formatted =
        NumberFormat.currency(locale: 'tr_TR', symbol: '₺', decimalDigits: 2)
            .format(parsed);
    return formatted;
  } catch (e) {
    return '₺0,00';
  }
}
