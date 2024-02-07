import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/user2'));
      if (response.statusCode == 200) {
        setState(() {
          userData = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  // Calculate Health Index
  double? calculateHealthIndex() {
    if (userData == null) return null;

    final double stepCount = userData!['StepCount'].toDouble();
    final double screenTime = userData!['ScreenTime'].toDouble();
    final double physicalActivity = userData!['PhysicalActivity'].toDouble();
    final double sleepQuality = userData!['SleepQuality'].toDouble();
    final double eatingHabits = userData!['EatingHabits'].toDouble();

    final healthIndex = (0.2 * screenTime) +
        (0.3 * physicalActivity) +
        (0.3 * sleepQuality) +
        (0.2 * eatingHabits);
    return healthIndex;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Dashboard'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Health Index',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.blue,
                      width: 5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${(calculateHealthIndex() ?? 0).toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: userData != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User Data',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('Step Count: ${userData!['StepCount']}'),
                                Text('Calories: ${userData!['Calories']}'),
                                Text('Sleep Time: ${userData!['SleepTime']}'),
                                Text('Screen Time: ${userData!['ScreenTime']}'),
                                Text('Physical Activity: ${userData!['PhysicalActivity']}'),
                                Text('Sleep Quality: ${userData!['SleepQuality']}'),
                                Text('Eating Habits: ${userData!['EatingHabits']}'),
                              ],
                            )
                          : CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
