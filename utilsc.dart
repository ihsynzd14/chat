import 'dart:collection';
import 'package:myapp/page-1/auth/storage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Example event class.
class Event {
  final String title;
  final int? pk; // Making 'pk' nullable

  Event(this.title, {this.pk}); // Making 'pk' an optional named parameter

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: (date) => date.day * 1000000 + date.month * 10000 + date.year,
);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final DateTime kToday = DateTime.now();
final DateTime kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final DateTime kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

/// Function to fetch therapies from the API
Future<List<Map<String, dynamic>>> fetchTherapies() async {
  kEvents.clear();

  final apiUrl = 'https://mymedbook.it/api/v1/therapy/';

  String accessToken = await SessionManager.getAccessToken();

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    final List<dynamic> jsonData = jsonDecode(response.body);
    // Convert dynamic JSON data to List<Map<String, dynamic>>
    List<Map<String, dynamic>> therapies = [];
    for (var data in jsonData) {
      therapies.add(Map<String, dynamic>.from(data));
    }
    print('Therapy data: $therapies'); // Add this line to print therapy data
    return therapies;
  } else {
    // If the server did not return a 200 OK response,
    // throw an exception.
    throw Exception('Failed to load therapies');
  }
}

Future<List<Map<String, dynamic>>> fetchEvents() async {
  kEvents.clear();

  final apiUrl = 'https://mymedbook.it/api/v1/event/';

  String accessToken = await SessionManager.getAccessToken();

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    final List<dynamic> jsonData = jsonDecode(response.body);
    // Convert dynamic JSON data to List<Map<String, dynamic>>
    List<Map<String, dynamic>> eventsCalendar = [];
    for (var data in jsonData) {
      eventsCalendar.add(Map<String, dynamic>.from(data));
    }
    print(
        'eventsCalendar data: $eventsCalendar'); // Add this line to print therapy data
    return eventsCalendar;
  } else {
    // If the server did not return a 200 OK response,
    // throw an exception.
    throw Exception('Failed to load events_calendar');
  }
}

void main() async {
  try {
    // Fetch therapies from the API
  } catch (e) {
    print('Error fetching therapies: $e');
  }
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}
