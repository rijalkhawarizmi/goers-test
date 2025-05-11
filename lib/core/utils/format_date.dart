 import 'package:intl/intl.dart';

String formatDate(String? rawDate) {
    if (rawDate == null) return 'N/A';
    try {
      final date = DateTime.parse(rawDate);
      return DateFormat('dd MMM yyyy, HH:mm').format(date.toLocal());
    } catch (_) {
      return rawDate;
    }
  }