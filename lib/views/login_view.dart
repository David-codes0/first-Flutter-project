import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mynotes/constants/routes.dart';

import '../utility/show_error.dart';


class Loginview extends StatefulWidget {
  const Loginview({Key? key}) : super(key: key);

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold( appBar:
   AppBar(title: const Text('Login'),
   ),
    body: Column(
                     children: [
                    TextField(
                controller: _email,
                decoration: const InputDecoration(
                hintText: 'Enter your email',
                ),
                autocorrect: false,
              ),
              TextField(
                 controller: _password,
                 obscureText: true,
                decoration: const InputDecoration(
                hintText: 'Enter your password',
                
                  
              ),
            ),
  
              TextButton(onPressed: () async {
            
                final email = _email.text;
                final password = _password.text;
                try{
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                  );
                  final user = FirebaseAuth.instance.currentUser;
                  if (user?.emailVerified ?? false){
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(notesRoute,
                    (route) => false,
                );
                  }
                  else{
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(verifiedemailRoute,
                    (route) => false,
                );
                  }

          
              }
               on FirebaseAuthException catch (e){
                 if (e.code == 'user-not-found'){
                   await showErrorDialog(context, 'User not found');
                 }
                 else if (e.code == 'wrong-password'){
                  await showErrorDialog(context, 'Wrong Password');
                 }
                 else{
                  await showErrorDialog(context, 'Error: ${e.code}');
                 }
                }
                catch (e){
                  await showErrorDialog(context,e.toString());
                }
  
                  
              },
              child: const Text('Login'),
              ),
              TextButton(onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(registerRoute,
                (route) => false);
              },
            child: const  Text('Not registered yet? Register')
          ),
        ],
      ),
    );
  }
}
