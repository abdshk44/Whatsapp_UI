import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            tabs: [
              Icon(Icons.camera_alt),
              Tab(
                child: Text('Chats'),
              ),
              Tab(
                child: Text('Status'),
              ),
              Tab(
                child: Text('Calls'),
              ),
            ],
          ),
          actions: [
            const Icon(Icons.search),
            const SizedBox(
              width: 10,
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(value: 1, child: Text('New Group')),
                PopupMenuItem(value: 2, child: Text('Setting')),
                PopupMenuItem(value: 3, child: Text('Logout')),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No photos or videos',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.photo, size: 40),
                        onPressed: () {},
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(Icons.camera, size: 50),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/2589653/pexels-photo-2589653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  title: Text('Abdullah'),
                  subtitle: Text('Hello how are you doing'),
                  trailing: Text('5:10 pm'),
                );
              },
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('My Status'),
                          Text('12:30pm'),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          ),
                        ),
                        title: Text('Friend $index'),
                        subtitle: Text('Today, 12:30pm'),
                      );
                    },
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/2589653/pexels-photo-2589653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  title: Text('Abdullah'),
                  subtitle: Text('You Missed the call'),
                  trailing: Icon(Icons.phone),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
