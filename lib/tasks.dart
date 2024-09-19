import 'package:flutter/material.dart';

void main() {
  runApp(SeniorCareApp());
}

class SeniorCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Care App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DailySchedulePage(),
    );
  }
}

class DailySchedulePage extends StatefulWidget {
  @override
  _DailySchedulePageState createState() => _DailySchedulePageState();
}

class _DailySchedulePageState extends State<DailySchedulePage> {
  List<Task> tasks = []; // List to store daily tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Tasks',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(task.name),
                    subtitle: Text(task.time),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the task creation page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskCreationPage(),
            ),
          ).then((newTask) {
            if (newTask != null) {
              // Add the newly created task to the list
              setState(() {
                tasks.add(newTask);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskCreationPage extends StatefulWidget {
  @override
  _TaskCreationPageState createState() => _TaskCreationPageState();
}

class _TaskCreationPageState extends State<TaskCreationPage> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: taskNameController,
              decoration: InputDecoration(
                labelText: 'Task Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: taskTimeController,
              decoration: InputDecoration(
                labelText: 'Task Time',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Create a new task with the provided details
                final taskName = taskNameController.text;
                final taskTime = taskTimeController.text;
                if (taskName.isNotEmpty && taskTime.isNotEmpty) {
                  final newTask = Task(name: taskName, time: taskTime);
                  // Return the new task to the previous screen
                  Navigator.pop(context, newTask);
                }
              },
              child: Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String name;
  final String time;

  Task({required this.name, required this.time});
}