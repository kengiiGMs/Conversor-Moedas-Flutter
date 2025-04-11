import 'package:conversor_moedas/components/textField_custom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter Moedas \$", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(5), 
              child: Icon(
                Icons.monetization_on, size: 120.0, color: Colors.amber,
              ),
            ),
            TextfieldCustom("Reais", "BR\$"),
            Divider(),
            TextfieldCustom("Dólares", "US\$"),
            Divider(),
            TextfieldCustom("Ienes", "JP\$"),
          ],
        ),
      ),
    );
  }
}