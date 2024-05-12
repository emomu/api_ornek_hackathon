import 'package:api_ornek_hackathon/userModel.dart';
import 'package:api_ornek_hackathon/userService.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserService _service = UserService();
  List<UserModelData?> users = [];
  @override
  void initState() {
    super.initState();
    UserService().fetchUsers().then((userModel) {
      if (userModel != null && userModel.data != null) {
        setState(() {
          users = userModel.data!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    "${users[index]!.firstName}  ${users[index]!.lastName}"),
                subtitle: Text("${users[index]!.email}"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${users[index]!.avatar}"),
                ),
              );
            }),
      ),
    );
  }
}
