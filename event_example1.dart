import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/page-1/auth/storage.dart';
import 'package:table_calendar/table_calendar.dart';
import '../data/circledataservice.dart';
import '../data/dossierdataservice.dart';
import '../utilsc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Import the intl package for date formatting

// Method to format the date and time strings
// Method to format the date and time strings
Map<String, String> formatDateTime(String dateTimeString) {
  // Parse the date and time string into a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Format the date as "dd/MM/yyyy"
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

  // Format the time as "HH:mm"
  String formattedTime = DateFormat('HH:mm').format(dateTime);

  // Return a map with formatted date and time strings
  return {'date': formattedDate, 'time': formattedTime};
}

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  final CirclesDataService circlesDataService = CirclesDataService();
  late dynamic locale;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    // Fetch therapies when initializing the widget
    _fetchTherapies();
    final dynamic locale;

    _fetchEvents();
  }

  Future<String> fetchCircleName(BuildContext context, int circleId) async {
    final baseUrl = 'https://mymedbook.it/api/v1/circle/';

    String bearerToken = await SessionManager.getAccessToken();

    final response = await http.get(
      Uri.parse('$baseUrl$circleId/'), // Append circleId to the URL
      headers: {
        'Authorization': 'Bearer $bearerToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      return decodedData['name'];
    } else {
      throw Exception('Failed to load circle name');
    }
  }

  Future<void> _deleteEvent(int eventPK) async {
    try {
      String accessToken = await SessionManager.getAccessToken();
      final String apiUrl = 'https://mymedbook.it/api/v1/event/$eventPK/';
      final Uri uri = Uri.parse(apiUrl);

      final http.Response response = await http.delete(
        uri,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );
// Display a confirmation dialog
      bool confirmed = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Conferma'),
            content: Text('Vuoi davvero eliminare questo evento?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Return true if confirmed
                },
                child: Text('Sì'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Return false if canceled
                },
                child: Text('Annulla'),
              ),
            ],
          );
        },
      );

      if (confirmed != null && confirmed) {
        // User confirmed, proceed with deletion
        if (response.statusCode == 204) {
          // Deletion successful
          print('Evento deleted successfully');
          Navigator.of(context).pop(); // Pop the current route
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => TableEventsExample(),
            ),
          );
        } else {
          // Handle errors or show a message if the deletion was not successful
          print('Error deleting group. Status code: ${response.statusCode}');

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text('Errore'),
                  ],
                ),
                content: Text(
                    'Non si può eliminare questo evento. (${response.statusCode})'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }

  Future<void> _fetchTherapies() async {
    try {
      kEvents.clear(); // Clear kEvents before fetching data

      final therapies = await fetchTherapies();
      // Add therapies to kEvents
      for (var therapy in therapies) {
        DateTime startDate = DateTime.parse(therapy['start_date']);
        DateTime endDate = DateTime.parse(therapy['end_date']);
        for (var date in daysInRange(startDate, endDate)) {
          kEvents[date] ??= [];
          kEvents[date]?.add(Event("Terapia: ${therapy['drug']}"));
        }
      }
      // Update selected events to refresh the UI
      _selectedEvents.value = _getEventsForDay(_selectedDay!);
    } catch (e) {
      print('Error fetching therapies: $e');
    }
  }

  Future<void> _fetchEvents() async {
    try {
      kEvents.clear(); // Clear kEvents before fetching data

      // Clear the kEvents map before fetching new events

      final eventsCalendar = await fetchEvents();
      // Add therapies to kEvents
      for (var event in eventsCalendar) {
        DateTime startDate = DateTime.parse(event['start_date']);
        DateTime endDate = DateTime.parse(event['end_date']);
        String? eventTypeSymbol = event['event_type']?['symbol'];
        int? eventPk = event['pk']; // Fetch the pk value from the event data
        for (var date in daysInRange(startDate, endDate)) {
          kEvents[date] ??= [];
          kEvents[date]
              ?.add(Event("$eventTypeSymbol: ${event['name']}", pk: eventPk));
        }
      }

      // Update selected events to refresh the UI
      _selectedEvents.value = _getEventsForDay(_selectedDay!);
    } catch (e) {
      print('Error fetching calendar event: $e');
    }
  }

// Inside _fetchEventData method
// Inside _fetchEventData method
  Future<void> _fetchEventData(int? eventPK) async {
    try {
      // Fetch event data from the API using the event's primary key
      // Construct the API URL with the event's primary key
      String apiUrl = 'https://mymedbook.it/api/v1/event/$eventPK/';
      String accessToken = await SessionManager.getAccessToken();

      // Fetch event data using http.get
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON response body
        final eventData = jsonDecode(response.body);
        print('Event Data: $eventData'); // Add this line for debugging
        Map<String, String> dateTimeMap =
            formatDateTime(eventData['start_date']);
        Map<String, String> dateEndTimeMap =
            formatDateTime(eventData['end_date']);
        // Fetch circle names based on their primary keys
        dynamic circlesData = eventData['circle'];
        print('Circles Data: $circlesData'); // Add this line for debugging

        List<int> circleIds = [];

        if (circlesData is List) {
          // If circlesData is a list, assume it contains circle IDs directly
          circleIds = List<int>.from(circlesData);
        } else if (circlesData is Map<String, dynamic>) {
          // If circlesData is a map, assume it's a single circle object
          circleIds = [circlesData['pk']];
        }

        List<String> circleNames = [];
        for (int circleId in circleIds) {
          String name = await circlesDataService.fetchCircleNames(circleId);
          circleNames.add(name);
        }

        // Display the popup with the fetched event data
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('${eventData['name']}'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Descrizione: ${eventData['desc']} '),
                  Text('Data Inizio: ${dateTimeMap['date']}'),
                  Text('Orario Inizio: ${dateTimeMap['time']}'),
                  Text('Data Fine: ${dateEndTimeMap['date']}'),
                  Text('Orario Fine: ${dateEndTimeMap['time']}'),
                  Text(
                    'Gruppi: ${circleNames.join(', ')}',
                  ),
                  Text(
                    'Tipo di evento: ${eventData['event_type']?['symbol']}',
                  ),
                  Text(
                    'Dossier: ${eventData['dossier']?['name']}',
                  ),
                  Text(
                    'Notifica: ${eventData['notification']}',
                  ),
                  Text(
                    'Ente: ${eventData['authority']}',
                  ),
                  Text(
                    'Indirizzo: ${eventData['address']}',
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        eventData['attachments'].map<Widget>((attachment) {
                      return Text('File: ${attachment['name']}');
                    }).toList(),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle error if the response is not successful
        print(
            'Failed to fetch event data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error fetching event data: $e');
    }
  }

  Future<void> uploadFile(int pk) async {
    final accessToken = await SessionManager.getAccessToken();
    final String uploadApiUrl = 'https://mymedbook.it/api/v1/upload/events';
    FilePickerResult? result;

    try {
      result = await FilePicker.platform.pickFiles();
    } catch (e) {
      // Handle file picking errors
      print('Error picking file: $e');
      return;
    }

    try {
      if (result != null && result.files.isNotEmpty) {
        final PlatformFile fileInfo = result.files.single;
        final String fileName = fileInfo.name ?? 'file.pdf';

        if (fileInfo.size != null && fileInfo.size! > 0) {
          final List<int> fileBytes = await File(fileInfo.path!).readAsBytes();

          print('File picked successfully: $fileName');
          print('File size: ${fileBytes.length} bytes');

          final Uri apiUrl = Uri.parse('$uploadApiUrl/?pk=$pk');

          final http.Response uploadResponse = await http
              .post(
                apiUrl,
                headers: <String, String>{
                  'Accept': 'application/json, text/plain, */*',
                  'Authorization': 'Bearer $accessToken',
                  'Content-Type': 'application/pdf',
                  'Content-Disposition': 'inline; filename*=UTF-8\'\'$fileName',
                },
                body: fileBytes,
              )
              .timeout(Duration(seconds: 60)); // Set a timeout for the request

          if (uploadResponse.statusCode == 200) {
            // File uploaded successfully
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.bottomSlide,
              title: 'Success',
              desc: 'Documento caricato!',
              btnOkOnPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TableEventsExample()),
                );
              },
            )..show();
            print('File uploaded successfully!');
          } else {
            // File upload failed
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: 'Error',
              desc: 'Non è possibile caricare file.',
              btnOkOnPress: () {},
            )..show();
            print(
                'File upload failed. Status Code: ${uploadResponse.statusCode}');
            print('Response body: ${uploadResponse.body}');
          }
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Error',
            desc: 'File pesa 0 KB o non esiste più.',
            btnOkOnPress: () {},
          )..show();
          // Handle the case where the file size is 0 or null
          print('File size is 0 or null');
        }
      } else {
        // Handle the case where FilePickerResult is null or files are empty
        print('FilePickerResult is null or files are empty');
      }
    } catch (e) {
      // Handle network errors or other exceptions
      print('Error uploading file: $e');
    }
  }

  Future<void> deleteDocument(int documentPk) async {
    try {
      final String accessToken = await SessionManager.getAccessToken();
      final String documentApiUrl =
          'https://mymedbook.it/api/v1/document/$documentPk/';

      final response = await http.delete(
        Uri.parse(documentApiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Successo',
          desc: 'Documento di Dossier eliminato!',
          btnOkOnPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TableEventsExample()),
            );
          },
        )..show();
        print('Dossier updated successfully');
        // Document successfully deleted
        print('Document deleted successfully');
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Errore',
          desc: 'Si è verificato un errore durante eliminazione del documento',
          btnOkOnPress: () {},
        )..show();
        // Error occurred while deleting the document
        print('Failed to delete document. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while deleting document: $e');
      throw Exception('Failed to delete document');
    }
  }

  Future<void> _EditDocData(int? eventPK) async {
    try {
      // Fetch event data from the API using the event's primary key
      String apiUrl = 'https://mymedbook.it/api/v1/event/$eventPK/';
      String accessToken = await SessionManager.getAccessToken();

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final eventData = jsonDecode(response.body);

        // Display the popup with the fetched event data
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  icon: Icon(Icons.edit_calendar_rounded),
                  title: Text('${eventData['name']}'),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: eventData['attachments']
                                .map<Widget>((attachment) {
                              // Store the document pk in a variable
                              int documentPk = attachment['pk'];
                              return ListTile(
                                title: Text('File: ${attachment['name']}'),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Call deleteDocument function with the document pk
                                    deleteDocument(documentPk);
                                    // Optionally, you can remove the deleted document from the UI
                                    setState(() {
                                      eventData['attachments'].removeWhere(
                                          (doc) => doc['pk'] == documentPk);
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print(eventPK!);
                              uploadFile(eventPK!);
                            },
                            child: Text('Aggiungi File'),
                          )
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text('Close'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Call the function to update event data
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text('Update'),
                    ),
                  ],
                );
              },
            );
          },
        );
      } else {
        // Handle error if the response is not successful
        print(
            'Failed to fetch event data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error fetching event data: $e');
    }
  }

  Future<void> _fetchEventEditData(int? eventPK) async {
    try {
      // Fetch event data from the API using the event's primary key
      String apiUrl = 'https://mymedbook.it/api/v1/event/$eventPK/';
      String accessToken = await SessionManager.getAccessToken();

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final eventData = jsonDecode(response.body);
        print('Event Data: $eventData');

        List<Dossier> dossiers = [];
        try {
          dossiers = await DossierDataService().fetchDossier(context);
        } catch (error) {
          print('Error fetching dossiers: $error');
          // Handle error as needed
        }

// Get the ID of the dossier associated with the event data, if any
        int? selectedDossierId = eventData['dossier']?['pk'];

        Map<String, String> dateTimeMap =
            formatDateTime(eventData['start_date']);
        Map<String, String> dateEndTimeMap =
            formatDateTime(eventData['end_date']);

        dynamic circlesData = eventData['circle'];
        print('Circles Data: $circlesData');

        List<int> circleIds = [];

        if (circlesData is List) {
          circleIds = List<int>.from(circlesData);
        } else if (circlesData is Map<String, dynamic>) {
          circleIds = [circlesData['pk']];
        }

        List<String> circleNames = [];
        for (int circleId in circleIds) {
          String name = await circlesDataService.fetchCircleNames(circleId);
          circleNames.add(name);
          print('Circle Name for ID $circleId: $name');
        }
        print('Circle Names: $circleNames');

        Map<String, String> eventTypeAbbreviations = {
          'P': 'Prelievi',
          'T': 'Terapia',
          'E': 'Esami',
          'V': 'Visita',
          'S': 'Servizio a Domicilio',
          'A': 'Accompagnamenti',
        };

        Map<String, int> eventTypePrimaryKeys = {
          'P': 1, // Prelievi
          'T': 2, // Terapia
          'E': 3, // Esami
          'V': 4, // Visita
          'S': 5, // Servizio a Domicilio
          'A': 6, // Accompagnamenti
        };

        bool notificationValue = eventData['notification'] ?? false;

        String? selectedEventTypeAbbreviation =
            eventData['event_type']?['symbol'];

// Get the primary key corresponding to the selected abbreviation
        int? selectedEventTypePrimaryKey = selectedEventTypeAbbreviation != null
            ? eventTypePrimaryKeys[selectedEventTypeAbbreviation]
            : null;

        List<int> selectedCircleIds = [];
        // Display the popup with the fetched event data
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  insetPadding:
                      EdgeInsets.all(7), // Adjust the padding as needed
                  icon: Icon(Icons.edit_calendar_rounded),
                  title: Text('${eventData['name']}'),
                  content: SizedBox(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.78,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              initialValue: eventData['desc'],
                              decoration:
                                  InputDecoration(labelText: 'Descrizione'),
                              onChanged: (value) {
                                eventData['desc'] = value;
                              },
                            ),
                            TextFormField(
                              initialValue: dateTimeMap['date'],
                              decoration:
                                  InputDecoration(labelText: 'Data Inizio'),
                              onChanged: (value) {
                                setState(() {
                                  dateTimeMap['date'] = value;
                                  // Update eventData['start_date'] with the properly formatted date and time if date and time are not null
                                  if (dateTimeMap['date'] != null &&
                                      dateTimeMap['time'] != null) {
                                    eventData['start_date'] =
                                        _parseAndFormatDateTime(
                                            dateTimeMap['date']!,
                                            dateTimeMap['time']!);
                                  }
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: dateTimeMap['time'],
                              decoration:
                                  InputDecoration(labelText: 'Orario Inizio'),
                              onChanged: (value) {
                                setState(() {
                                  dateTimeMap['time'] = value;
                                  // Update eventData['start_date'] with the properly formatted date and time if date and time are not null
                                  if (dateTimeMap['date'] != null &&
                                      dateTimeMap['time'] != null) {
                                    eventData['start_date'] =
                                        _parseAndFormatDateTime(
                                            dateTimeMap['date']!,
                                            dateTimeMap['time']!);
                                  }
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: dateEndTimeMap['date'],
                              decoration:
                                  InputDecoration(labelText: 'Data Fine'),
                              onChanged: (value) {
                                setState(() {
                                  dateEndTimeMap['date'] = value;
                                  // Update eventData['end_date'] with the properly formatted date and time if date and time are not null
                                  if (dateEndTimeMap['date'] != null &&
                                      dateEndTimeMap['time'] != null) {
                                    eventData['end_date'] =
                                        _parseAndFormatDateTime(
                                            dateEndTimeMap['date']!,
                                            dateEndTimeMap['time']!);
                                  }
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: dateEndTimeMap['time'],
                              decoration:
                                  InputDecoration(labelText: 'Orario Fine'),
                              onChanged: (value) {
                                setState(() {
                                  dateEndTimeMap['time'] = value;
                                  // Update eventData['end_date'] with the properly formatted date and time if date and time are not null
                                  if (dateEndTimeMap['date'] != null &&
                                      dateEndTimeMap['time'] != null) {
                                    eventData['end_date'] =
                                        _parseAndFormatDateTime(
                                            dateEndTimeMap['date']!,
                                            dateEndTimeMap['time']!);
                                  }
                                });
                              },
                            ),
                            DropdownButtonFormField<int>(
                              value: selectedEventTypePrimaryKey,
                              decoration:
                                  InputDecoration(labelText: 'Tipo di evento'),
                              items: eventTypePrimaryKeys.entries
                                  .map<DropdownMenuItem<int>>(
                                (MapEntry<String, int> entry) {
                                  String eventTypeFullName =
                                      eventTypeAbbreviations[entry.key] ?? '';
                                  return DropdownMenuItem<int>(
                                    value: entry.value,
                                    child: Text(eventTypeFullName),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedEventTypePrimaryKey = value;
                                  selectedEventTypeAbbreviation =
                                      eventTypePrimaryKeys.entries
                                          .firstWhere(
                                            (entry) => entry.value == value,
                                            orElse: () => MapEntry('',
                                                -1), // Provide a default value for the case where the primary key is not found
                                          )
                                          .key;
                                });
                              },
                            ),
                            SizedBox(
                                child: DropdownButtonFormField<int>(
                              value: selectedDossierId,
                              decoration: InputDecoration(
                                labelText: 'Select a dossier',
                              ),
                              isExpanded: true,
                              items: [
                                for (var dossier in dossiers)
                                  DropdownMenuItem<int>(
                                    value: dossier.pk,
                                    child: SizedBox(
                                      width: double
                                          .infinity, // Allow text wrapping
                                      child: Text(
                                        dossier.name,
                                        overflow: TextOverflow
                                            .ellipsis, // Add ellipsis for long texts
                                      ),
                                    ),
                                  ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedDossierId = value;
                                });
                              },
                            )),
                            SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gruppi:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Add some space between the header and the list
                                Text(
                                  '${circleNames.toSet().join(', ')}',
                                ),
                                // Add some space between circle names and the buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          try {
                                            // Fetch circles only if selectedCircleIds is empty
                                            if (selectedCircleIds.isEmpty) {
                                              selectedCircleIds =
                                                  List<int>.from(circlesData);
                                            }

                                            List<Circles> circles =
                                                await circlesDataService
                                                    .fetchPkAndNameOnly(
                                                        context);
                                            circlesData = List<int>.from(
                                                selectedCircleIds); // Update circlesData initially

                                            List<int>? newCircleIds =
                                                await showDialog<List<int>>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Select Circles to Add'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: circles
                                                              .map<Widget>(
                                                                  (circle) {
                                                            return CheckboxListTile(
                                                              title: Text(
                                                                  circle.name ??
                                                                      ''),
                                                              value: selectedCircleIds
                                                                  .contains(
                                                                      circle
                                                                          .pk),
                                                              onChanged: (bool?
                                                                  value) {
                                                                setState(() {
                                                                  if (value!) {
                                                                    selectedCircleIds
                                                                        .add(circle
                                                                            .pk!);
                                                                    circlesData
                                                                        .add(circle
                                                                            .pk!); // Add to circlesData if checked
                                                                  } else {
                                                                    selectedCircleIds
                                                                        .remove(
                                                                            circle.pk);
                                                                    circlesData
                                                                        .remove(
                                                                            circle.pk); // Remove from circlesData if unchecked
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the dialog
                                                          },
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(selectedCircleIds ??
                                                                    []); // Pass selected circle IDs back
                                                          },
                                                          child: Text('Add'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );

                                            if (newCircleIds != null) {
                                              // Update circleNames based on selectedCircleIds
                                              List<String> updatedCircleNames =
                                                  [];
                                              for (int circleId
                                                  in selectedCircleIds) {
                                                String name =
                                                    await circlesDataService
                                                        .fetchCircleNames(
                                                            circleId);
                                                updatedCircleNames.add(name);
                                              }
                                              setState(() {
                                                circleNames = updatedCircleNames
                                                    .toSet()
                                                    .toList();
                                              });
                                            }
                                            print(circlesData);
                                          } catch (error) {
                                            print(
                                                'Error fetching circles: $error');
                                            // Handle error as needed
                                          }
                                        },
                                        child: Text('Add Circles'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ), // Add some space between buttons
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Notifica'),
                                ),
                                Checkbox(
                                  value: notificationValue,
                                  onChanged: (value) {
                                    setState(() {
                                      notificationValue = value!;
                                      eventData['notification'] = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            TextFormField(
                              initialValue: eventData['authority'],
                              decoration: InputDecoration(labelText: 'Ente'),
                              onChanged: (value) {
                                eventData['authority'] = value;
                              },
                            ),
                            TextFormField(
                              initialValue: eventData['address'],
                              decoration:
                                  InputDecoration(labelText: 'Indirizzo'),
                              onChanged: (value) {
                                eventData['address'] = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text('Close'),
                    ),
                    TextButton(
                      onPressed: () {
                        _updateEventData(
                            eventPK!,
                            eventData,
                            selectedEventTypePrimaryKey,
                            selectedDossierId,
                            circlesData);
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text('Update'),
                    ),
                  ],
                );
              },
            );
          },
        );
      } else {
        // Handle error if the response is not successful
        print(
            'Failed to fetch event data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error fetching event data: $e');
    }
  }

  String _parseAndFormatDateTime(String date, String time) {
    // Split the date string by '/' to extract day, month, and year
    List<String> dateParts = date.split('/');
    // Split the time string by ':' to extract hours and minutes
    List<String> timeParts = time.split(':');

    // Combine date and time parts into a single string with the format 'yyyy-MM-ddTHH:mm:ss'
    String formattedDateTime =
        '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}T${timeParts[0]}:${timeParts[1]}:00';

    return formattedDateTime;
  }

  Future<void> _updateEventData(
      int? eventPK,
      Map<String, dynamic> eventData,
      int? selectedEventTypePrimaryKey,
      int? selectedDossierId,
      List circlesData) async {
    try {
      String formattedStartDate =
          eventData['start_date'] ?? ''; // Provide default value if null
      String formattedEndDate =
          eventData['end_date'] ?? ''; // Provide default value if null

      // Create the payload for the PUT request
      Map<String, dynamic> payload = {
        'pk': eventData['pk'],
        'name': eventData['name'],
        'desc': eventData['desc'],
        'start_date': formattedStartDate,
        'end_date': formattedEndDate,
        'notification': eventData['notification'],
        'authority': eventData['authority'],
        'address': eventData['address'],
        'user': {
          'pk': eventData['user']['pk'],
          'first_name': eventData['user']['first_name'],
          'last_name': eventData['user']['last_name'],
          'structureaffiliation_set': eventData['user']
              ['structureaffiliation_set'],
          'structuremembership_set': eventData['user']
              ['structuremembership_set'],
          'email': eventData['user']['email'],
          'phone': eventData['user']['phone'],
          'avatar': eventData['user']['avatar'],
          'groups': eventData['user']['groups'],
        },
        'event_type': selectedEventTypePrimaryKey,
        'circle': circlesData,
        'dossier': selectedDossierId, // Including dossier PK
        'attachments': eventData['attachments'], // Corrected attachments part
      };

      // Make a PUT request to update event data
      String apiUrl = 'https://mymedbook.it/api/v1/event/$eventPK/';
      String accessToken = await SessionManager.getAccessToken();

      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      void logPayload(Map<String, dynamic> payload) {
        // Convert the payload to JSON format
        String jsonPayload = jsonEncode(payload);

        // Define the maximum length of each chunk
        final int chunkLength = 1000;

        // Log the payload in chunks
        for (int i = 0; i < jsonPayload.length; i += chunkLength) {
          int endIndex = (i + chunkLength < jsonPayload.length)
              ? i + chunkLength
              : jsonPayload.length;
          String chunk = jsonPayload.substring(i, endIndex);
          print(chunk);
        }
      }

      logPayload(payload);

      if (response.statusCode == 200) {
        // Event data updated successfully
        print('Event data updated successfully');
      } else {
        // Handle other status codes
        print(
            'Failed to update event data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error updating event data: $e');
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('MyMedBook - Agenda',
                style: TextStyle(color: Colors.white))),
        backgroundColor: Color.fromARGB(255, 40, 40, 40),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              markerDecoration: const BoxDecoration(
                color: Color.fromARGB(255, 30, 30, 30),
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: true,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              onTap: () => print('${value[index]}'),
                              title: Text('${value[index]}'),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              _fetchEventData(value[index]
                                  .pk); // Fetch event data when search icon button is pressed
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _fetchEventEditData(value[index].pk);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.edit_document),
                            onPressed: () {
                              _EditDocData(value[index].pk);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              if (value[index].pk != null) {
                                _deleteEvent(value[index]
                                    .pk!); // Pass the event's pk to _deleteEvent function
                              } else {
                                // Handle the case where pk is null, maybe show a message or log an error
                                print('Event pk is null.');
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          child: GNav(
            backgroundColor: Color.fromARGB(102, 255, 255, 255),
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 40, 40, 40),
            iconSize: MediaQuery.of(context).size.width *
                0.08, // adjust the size of the icons
            gap: MediaQuery.of(context).size.width *
                0.03, // adjust the gap between the icons
            onTabChange: (index) {
              print(index);
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/calendar');
                  break;
                case 1:
                  // Navigate to Home page
                  Navigator.pushNamed(context, '/home');
                  break;
                case 2:
                  // Handle Chat tab
                  break;
              }
            },
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 0.03), // adjust the padding
            selectedIndex: 0, // Set the index for the "Home" tab
            tabs: const [
              GButton(icon: Icons.calendar_month, text: 'Calendar'),
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.dashboard, text: 'Bacheca'),
              GButton(icon: Icons.maps_ugc_rounded, text: 'Chat'),
            ],
          ),
        ),
      ),
    );
  }
}
