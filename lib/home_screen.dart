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
            title: const Text('Whatsapp'),
            backgroundColor: Colors.teal,
            bottom: const TabBar(
              tabs:[
                Icon(Icons.camera_alt),
                Tab(child: Text('Chats'),),
                Tab(child: Text('Status'),),
                Tab(child: Text('Calls'),),


              ],



            ),
            actions: [
              const Icon(Icons.search),
              const SizedBox(width: 10,),
              PopupMenuButton(itemBuilder: (context,)=>[
                PopupMenuItem(
                    value: 1,
                    child: Text('New Group')),
                PopupMenuItem(
                    value: 1,
                    child: Text('Setting')),
                PopupMenuItem(
                    value: 1,
                    child: Text('Logout')),

              ])
            ],

          ),
          body: TabBarView(
            children: [
              Text('Camera'),
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/2589653/pexels-photo-2589653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      title: Text('Abdullah'),
                      subtitle: Text('Hello how are you doing'),
                      trailing: Text('5:10 pm'),
                    );
                  }),
             Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: CircleAvatar(
                         radius: 30,
                         backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Column(
                         children: [
                           Text('My Status'),
                           Text('12:30pm'),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 90,top: 16),
                       child: Column(
                         children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                         ],
                       ),
                     ),

                   ],
                 ),
                 Divider(thickness: 3,),
               ],
             ),




              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context,index){
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/2589653/pexels-photo-2589653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      title: Text('Abdullah'),
                      subtitle: Text( 'You Missed the call'),
                      trailing: Icon( Icons.phone ),
                    );
                  }),
            ],
          ),


        )
    );
  }
}
