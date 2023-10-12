import 'package:firstproject/TapEffect/tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/model/user_services_model.dart';
import 'package:firstproject/user_service/user_service.dart';

class UserDetailsScreens extends StatefulWidget {
  const UserDetailsScreens({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreens> createState() => _UserDetailsScreensState();
}

class _UserDetailsScreensState extends State<UserDetailsScreens> {
  UserServices userServices = UserServices();
  List<UserServiceModel> userData = [];
  TextEditingController search = TextEditingController();
  List<UserServiceModel> searchList = [];

  void getData() async {
    userData = await userServices.getUserData(context: context);
    print("name ${userData[0].name}");
  }

  void searchProducts(String value) {
    setState(() {
      searchList = userData
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: search,
              onChanged: (String value) {
                searchProducts(value);
              },
              decoration: InputDecoration(
                hintText: "Enter",
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<UserServiceModel>>(
              future: userServices.getUserData(context: context),
              builder: (context, AsyncSnapshot<List<UserServiceModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  userData = snapshot.data!;
                  final displayedData = searchList.isNotEmpty ? searchList : userData;

                   return ListView.builder(
                    itemCount: displayedData.length,
                    itemBuilder: (context, index) {
                      final data = displayedData[index];

                      return Card(
                        elevation: 4,
                        color: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Text(
                                data.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data.id.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(data.email),
                              TapEffect(child: Text(data.phone)),
                              Text(data.username),
                              Text(data.website),
                              Text(data.name),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("No data available"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
