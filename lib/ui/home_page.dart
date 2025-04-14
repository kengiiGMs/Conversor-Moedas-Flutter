import 'package:conversor_moedas/components/textField_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final ieneController = TextEditingController();

  String request = "";
  double? iene;
  double? dolar;

  void _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real * (this.dolar ?? 1)).toStringAsFixed(2);
    ieneController.text = (real / (iene ?? 1)).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * (this.dolar ?? 1)).toStringAsFixed(2);
    ieneController.text = (dolar * (this.dolar ?? 1) / (iene ?? 1))
        .toStringAsFixed(2);
  }

  void _ieneChanged(String text) {
    double iene = double.parse(text);
    realController.text = (iene * (this.iene ?? 1)).toStringAsFixed(2);
    dolarController.text = (iene * (this.iene ?? 1) / (dolar ?? 1))
        .toStringAsFixed(2);
  }

  @override
  void initState() {
    super.initState();
    getFileEnv();
  }

  Future<void> getFileEnv() async {
    /* Mobile - assets/.env | Web - .env */
    await dotenv.load(fileName: "assets/.env");
    print("Api: ${dotenv.env['API_URL_KEY']}");
    setState(() {
      request = dotenv.env['API_URL_KEY'] ?? "ERRO";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Converter Moedas \$",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ao Carregar dados",
                    style: TextStyle(color: Colors.red, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data?["results"]["currencies"]["USD"]["buy"];
                iene = snapshot.data?["results"]["currencies"]["JPY"]["buy"];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.monetization_on,
                          size: 120.0,
                          color: Colors.amber,
                        ),
                      ),
                      TextfieldCustom(
                        "Reais",
                        "BR\$",
                        realController,
                        _realChanged,
                      ),
                      Divider(),
                      TextfieldCustom(
                        "Dólares",
                        "US\$",
                        dolarController,
                        _dolarChanged,
                      ),
                      Divider(),
                      TextfieldCustom(
                        "Ienes",
                        "JP\$",
                        ieneController,
                        _ieneChanged,
                      ),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }

  Future<Map> getData() async {
    http.Response response = await http.get(Uri.parse(request));
    return json.decode(response.body);
  }
}
