import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5.0,
                        color: Colors.indigoAccent,
                      ),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width),
                    ),
                    child: Image.asset('assets/images/photo.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      child: FloatingActionButton(
                        tooltip: 'Upload Profile Photo',
                        onPressed: () {},
                        child: const Icon(
                          Icons.upload,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        enabled: false,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        enabled: false,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              Tooltip(
                message: 'Edit profile',
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Edit Profile'),
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
