
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/services/crud/notes_service.dart';

import '../../enums/menu_action.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {

  late final NotesService _notesService;

  String get userEmail => AuthService.firebase().currentUser!.email!;

  @override
  void initState() {
   _notesService = NotesService();
   super.initState();
  }

  @override
  void dispose() {
   _notesService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Notes'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(newNoteRoute);
            
          }, icon: const Icon(Icons.add),
        ),
          PopupMenuButton<MenuAction>(onSelected: (value) async{
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogoutDialog(context);
                if (shouldLogout ){
                await AuthService.firebase().logOut();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (_) => false);
                }
               }
              },
          itemBuilder: (context) {
            return const [ PopupMenuItem<MenuAction>(
              value: MenuAction.logout,
              child: Text('Log Out'),
          ),
          
          ];
        },
      ),
      ],
      ),
      // body: Column( children: [
      // TextButton(onPressed: () {
      //      Navigator.of(context).pushNamedAndRemoveUntil(
      //           loginRoute,
      //           (_) => false);
      //     }, child: const Text('Log Out'),),const Text('data'),],),
      body:FutureBuilder(
      future: _notesService.getOrCreateUser(email: userEmail),
      builder: (context,snapshot) {
        switch (snapshot.connectionState){
           case ConnectionState.done:
            return StreamBuilder(
                stream: _notesService.allNotes,
                builder: (context,snapshot) {
                  switch (snapshot.connectionState){
                    case ConnectionState.waiting:
                     return const Text('Waiting for all notes.....');
                    default:
                      return const CircularProgressIndicator(backgroundColor: Colors.grey,
                      color: Colors.green,
                      strokeWidth: 5,
                      value: 0,
                   );
                  }
                },
              );
              
            
          default :
            return const CircularProgressIndicator();
          }

        },
      ),
    );
  }
}

Future<bool> showLogoutDialog(BuildContext context){
  return showDialog<bool>(
    context: context, 
    builder: (context){
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you sure you want to Log Out') ,
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop(false);
          }, child: const Text('Cancel'),
          ),
          TextButton(onPressed: () {
            Navigator.of(context).pop(true);
          }, child: const Text('Log Out'),
          )
        ],

      );
    }
  ).then((value) => value ?? false);
}