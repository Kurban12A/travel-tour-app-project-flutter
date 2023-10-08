import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 400,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color:
                        const Color.fromARGB(115, 54, 54, 54).withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(1, 1))
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(
                        size: 32.0, Icons.person, color: Color(0xFF00C8FF)),
                    title: Text(
                      'My profile',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Change you email, password, login',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        )),
                    trailing: Icon(
                      Icons.arrow_right,
                      size: 28,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Colors.black12,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(
                        size: 32.0, Icons.language, color: Color(0xFF00C8FF)),
                    title: Text(
                      'Language',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Choose a language',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        )),
                    trailing: Icon(
                      Icons.arrow_right,
                      size: 28,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Colors.black12,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(
                        size: 32.0,
                        Icons.travel_explore,
                        color: Color(0xFF00C8FF)),
                    title: Text(
                      'My trips',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Мiew your saved trips',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        )),
                    trailing: Icon(
                      Icons.arrow_right,
                      size: 28,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Colors.black12,
                  ),
                ),
                const SizedBox(height: 50),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(
                        size: 32.0, Icons.logout, color: Color(0xFF00C8FF)),
                    title: Text(
                      'Log out',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Log out of profile',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        )),
                    trailing: Icon(
                      Icons.arrow_right,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
