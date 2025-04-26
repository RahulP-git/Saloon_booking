import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustProfilePage extends StatefulWidget {
  String emailId;
  CustProfilePage({required this.emailId});
  @override
  _CustProfilePageState createState() => _CustProfilePageState();
}

class _CustProfilePageState extends State<CustProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      _emailController.text = user.email ?? '';
      final doc =
      await _firestore.collection('users').doc(user.uid).get();
      final data = doc.data();
      if (data != null) {
        _nameController.text = data['Name'] ?? '';
        _phoneController.text = data['Mobile'] ?? '';
        _emailController.text = data['Email'] ?? '';
      }
    }
  }

  Future<void> _updateUserDetails() async {
    if (!_formKey.currentState!.validate()) return;

    final user = _auth.currentUser;
    if (user != null) {
      try {
        // Update Auth email
        if (_emailController.text != user.email) {
          await user.updateEmail(_emailController.text);
        }

        // Update Firestore data
        await _firestore.collection('users').doc(user.uid).set({
          'Name': _nameController.text,
          'Mobile': _phoneController.text,
          'Email': _emailController.text,
        }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully!')),
        );
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile')),
        );
      }
    }
  }


  onSubmit() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Update"),
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter your name'
                            : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(labelText: 'Phone'),
                        keyboardType: TextInputType.phone,
                        validator: (value) => value == null || value.length < 10
                            ? 'Enter valid phone'
                            : null,
                      ),
                      SizedBox(height: 30),

                      ElevatedButton(
                        onPressed:(){
                          _updateUserDetails();
                        }
                        ,
                        child: Text('Save Changes'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.orange,
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where("Email", isEqualTo: widget.emailId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No bookings.'));
              }

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var booking = snapshot.data!.docs[index];
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(20),
                        height: 300,
                        width: MediaQuery.of(context).size.width / 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.blueAccent,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          booking["Name"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          booking["Email"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          booking["Mobile"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Address:Ramnagar At Post Boripardhi\n"
                                  "Tal-Daund, Dist Pune",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                onSubmit();
                              },
                              child: Container(
                                height: 35,
                                width: 200,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
