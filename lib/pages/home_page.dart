import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_opearations_with_firestore_database/pages/user_form_page.dart';
import 'package:flutter/material.dart';

import '../services/database_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController usernameController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();


  Stream? userStream;

  getOnTheLoad() async{
    userStream = await CFSDatabaseService().readAllData();
    setState(() {

    });
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allUserDetail(){
    return StreamBuilder(
        stream: userStream,
        builder: (context, AsyncSnapshot snapshot){
          return snapshot.hasData? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index){
                DocumentSnapshot ds = snapshot.data.docs[index];
                return   Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(15, 145, 108, 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Name: "+ds["Username"],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: (){
                                  usernameController.text = ds["Username"];
                                  specialtyController.text = ds["Specialty"];
                                  hobbyController.text = ds["Hobby"];
                                  editUserInfo(ds["Id"]);
                                },
                                child: const Icon(Icons.edit,
                                color: Colors.yellow,
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () async{
                                  await CFSDatabaseService().deleteUser(ds["Id"]);
                                },
                                child: const Icon(Icons.delete,
                                  color: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Text("Specialty: "+ds["Specialty"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("Hobby: "+ds["Hobby"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          ): Container();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(15, 145, 108, 1),
        title: const Text('User info',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Expanded(child: allUserDetail()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserForm()));
        },
        backgroundColor: const Color.fromRGBO(15, 145, 108, 1),
        child: const Icon(Icons.add,
        color: Colors.white,
        ),
      ),
    );
  }

  Future editUserInfo(String id) => showDialog(context: context, builder: (context) => AlertDialog(
    content: Container(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.cancel),
              ),
              const SizedBox(width: 60),
              const Text('Update User Info',
                style: TextStyle(
                  color: Color.fromRGBO(15, 145, 108, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        const SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          const Text(
          'Username:',
          style: TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'
          ),
        ),
          const SizedBox(height: 8),
          Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color:  const Color.fromRGBO(110, 230, 196, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
            child:  TextField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            style: const TextStyle(
                color: Colors.black87
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.person_3_sharp,
                  color: Color.fromRGBO(15, 145, 108, 1),
                ),
                hintText: 'username',
                hintStyle: TextStyle(
                    color: Color.fromRGBO(15, 145, 108, 1)
                )
            ),
          ),
        )
      ],
    ),

       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
          'Specialty',
          style: TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'
          ),
        ),
         const SizedBox(height: 8),
         Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color:  const Color.fromRGBO(110, 230, 196, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child:   TextField(
            controller: specialtyController,
            keyboardType: TextInputType.text,
            style: const TextStyle(
                color: Colors.black87
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.flash_on,
                  color: Color.fromRGBO(15, 145, 108, 1),
                ),
                hintText: 'specialty',
                hintStyle: TextStyle(
                    color: Color.fromRGBO(15, 145, 108, 1)
                )
            ),
          ),

        )
      ],
    ),

        Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
          const Text(
          'Hobby:',
          style: TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'
          ),
        ),
          const SizedBox(height: 8),
          Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color:  const Color.fromRGBO(110, 230, 196, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
            child:   TextField(
            controller: hobbyController,
            keyboardType: TextInputType.text,
            style: const TextStyle(
                color: Colors.black87
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.sports_soccer,
                  color: Color.fromRGBO(15, 145, 108, 1),
                ),
                hintText: 'hobby',
                hintStyle: TextStyle(
                    color: Color.fromRGBO(15, 145, 108, 1)
                )
            ),
          ),

        )
      ],
    ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: MaterialButton(
              onPressed: () async {
                Map<String, dynamic> userUpdateData = {
                  "Username": usernameController.text,
                  "Specialty": specialtyController.text,
                  "Id": id,
                  "Hobby": hobbyController.text
                };
                await CFSDatabaseService().updateUser(id, userUpdateData).then((value) {
                  Navigator.pop(context);
                });
              },

              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              color: const Color.fromRGBO(15, 145, 108, 1),
              child: const Text('Update',
                style: TextStyle(color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));

}
