import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
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
                  _image == null
                      ? Column(
                    children: [
                      Icon(Icons.camera_alt, size: 100, color: Colors.grey),
                      SizedBox(height: 20),
                      Text(
                        'No photos or videos',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                      : Image.file(File(_image!.path), height: 300, width: 300),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.photo, size: 40),
                        onPressed: () => _pickImage(ImageSource.gallery),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(Icons.camera, size: 50),
                        onPressed: () => _pickImage(ImageSource.camera),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                String imageUrl = widget.imageUrls[random.nextInt(widget.imageUrls.length)];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),

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
                      String imageUrl = widget.imageUrls[random.nextInt(widget.imageUrls.length)];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
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
                String imageUrl = widget.imageUrls[random.nextInt(widget.imageUrls.length)];
                bool isPhoneIcon = random.nextBool();
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  title: Text('Abdullah'),
                  subtitle: Text('You Missed the call'),
                  trailing: Icon(isPhoneIcon ? Icons.phone : Icons.videocam),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
