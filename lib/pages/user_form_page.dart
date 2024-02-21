import 'package:crud_opearations_with_firestore_database/pages/home_page.dart';
import 'package:crud_opearations_with_firestore_database/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  Widget buildUsername(){
    return  Column(
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
    );
  }

  Widget specialtyBuild(){
    return  Column(
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
    );
  }

  Widget hobbyBuild(){
    return  Column(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(15, 145, 108, 1),
        title: const Text('User form',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child:  SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              buildUsername(),
              const SizedBox(height: 15),
              specialtyBuild(),
              const SizedBox(height: 15),
              hobbyBuild(),
              const SizedBox(height: 100),
              const Divider(
                thickness: 1.5,
                color:  Color.fromRGBO(15, 145, 108, 1),
                height: 2,
                endIndent: 1.5,
                indent: 1.5,
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: MaterialButton(
                  onPressed: () async {
                    String randomUniqueId = randomAlphaNumeric(10);
                    Map<String, dynamic> usersData = {
                      "Username" : usernameController.text,
                      "Specialty" : specialtyController.text,
                       "Id" : randomUniqueId,
                      "Hobby" : hobbyController.text
                    };
                    await CFSDatabaseService().storeData(dataOfUsers: usersData, id: randomUniqueId).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    });

                  },
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: const Color.fromRGBO(15, 145, 108, 1),
                  child: const Text('Insert',
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
      ),
    );
  }
}