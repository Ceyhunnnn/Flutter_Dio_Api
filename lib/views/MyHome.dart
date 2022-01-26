import "package:flutter/material.dart";
import 'package:flutter_api_json/models/user_model.dart';
import 'package:flutter_api_json/services/user_model_service.dart';

class MyHome extends StatelessWidget {
  UserModelApi userApi = UserModelApi();
  @override
  Widget build(BuildContext context) {
    userApi.getUserList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API - JSON"),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: userApi.getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userList = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                var user = userList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [ListTile(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(

                              color: Colors.brown
                          ),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.address.city.toString()),
                      leading: Text(user.id.toString()),
                    ),

                    Divider(
                      color: Colors.black,
                    )]

                  ),
                );
              },
              itemCount: userList.length,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
