import 'package:ecodesh/dimensions/dimensions.dart';
import 'package:ecodesh/screens/add_page.dart';
import 'package:ecodesh/screens/home_page.dart';
import 'package:ecodesh/screens/profile_page.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // Index to keep track of the currently selected page.
  int _pageIndex = 0;

  // A list of the widgets to be displayed for each tab.
  final List<Widget> _pages = [
    const HomePage(),
    const AddPage(),
    const ProfilePage(),
  ];

  // A list of titles for the AppBar corresponding to each page.
  final List<String> _pageTitles = [
    'Home Feed',
    'Create New Post',
    'My Profile',
  ];

  /// Callback function to update the page index when a navigation item is tapped.
  void _onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Dimensions dim = Dimensions(context);
    return Scaffold(
      
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: dim.width(2)),
        backgroundColor: Colors.green[700],
        elevation: 4,
        title: Row(
          children: [
            Icon(Icons.recycling, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'ecodesh',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            style: IconButton.styleFrom(iconSize: dim.height(3)),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            style: IconButton.styleFrom(iconSize: dim.height(3)),
            onPressed: () {
              // Handle profile
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFF2F5EA), // Off-white background
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF669D31), // Green
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF4F3130)),
              title: const Text('Settings', style: TextStyle(color: Color(0xFF4F3130))),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Settings Page
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF4F3130)),
              title: const Text('About', style: TextStyle(color: Color(0xFF4F3130))),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to About Page
              },
            ),
          ],
        ),
      ),
      // The body of the scaffold displays the widget from the _pages list.
      body: _pages[_pageIndex],

      // The BottomAppBar that holds our navigation icons.
      bottomNavigationBar: BottomAppBar(
        // Adds a circular notch in the bar for the FloatingActionButton.
        child: SizedBox(
          height: 40,
          child: Row(
            // Aligns the icons evenly in the BottomAppBar.
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // Home Button
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                  // The color changes based on whether the item is selected.
                  color: _pageIndex == 0 ? Colors.white : Colors.white70,
                ),
                onPressed: () => _onPageChanged(0),
                tooltip: 'Home',
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 30,
                  // The color changes based on whether the item is selected.
                  color: _pageIndex == 1 ? Colors.white : Colors.white70,
                ),
                onPressed: () => _onPageChanged(1),
                tooltip: 'Add',
              ),
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  size: 30,
                  color: _pageIndex == 2 ? Colors.white : Colors.white70,
                ),
                onPressed: () => _onPageChanged(2),
                tooltip: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}