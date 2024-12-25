import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Energy Usage Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
      body: ListView(
        children: <Widget>[
          UsageCard(),
          CompareCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Now',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Predictions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class UsageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Usage', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 8),
            Text('CURRENT BILL', style: Theme.of(context).textTheme.caption),
            const SizedBox(height: 4),
            Text('791 kWh', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 16),
            // This would be a custom painted widget in a real app
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              // Placeholder for the chart
            ),
            const SizedBox(height: 16),
            const Text('trending to 1,042 kWh', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

class CompareCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Compare', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 8),
            Text('LAST 30 DAYS', style: Theme.of(context).textTheme.caption),
            const SizedBox(height: 16),
            // This would be a custom painted widget in a real app
            Container(
              height: 20,
              width: double.infinity,
              color: Colors.grey[200],
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.5, // This would be dynamic based on data
                child: Container(
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('HIGHER THAN AVERAGE', style: TextStyle(color: Colors.red)),
            Text('compared to 4k similar homes', style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
    );
  }
}
