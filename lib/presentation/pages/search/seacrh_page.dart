import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});    
  
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorButton = Color(0xFF00C8FF);
    const textStyle = TextStyle(color: Colors.black45, fontSize: 12);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text('Find a city', style: themeData.appBarTheme.titleTextStyle),
        shadowColor: Colors.black26,
        bottom: const PreferredSize(
          preferredSize:  Size.fromHeight(63),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SearchFormWidget(),)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemBuilder:(context, index) => ListTile(
            trailing: Icon(Icons.arrow_right),
            title: InkWell(
              //TODO кнопка 
              onTap: () {
                print('TAP');
              },
              child: const Row(children: [
                Icon(Icons.location_on),
                SizedBox(width: 5,),
                Text('Yerevan'),
              ],),
            )), 
          separatorBuilder:(context, index) => const Divider(
            color: Colors.black12, 
            height: 1,
            thickness: 1,), 
          itemCount: 20),
      ),
    );
  }
}

class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        label: Text('search'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C8FF)),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        floatingLabelStyle: TextStyle(color: Color(0xFF00C8FF)),
        labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide:
              BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid),
        ),
      ),
    );
  }
}
