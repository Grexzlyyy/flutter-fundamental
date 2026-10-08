import 'package:flutter/material.dart';
import 'package:pml/basic_widget/image_widget.dart';
import 'package:pml/basic_widget/input_widget.dart';
import 'package:pml/basic_widget/text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Daftar Akun Stimata'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DateTime? _dateTime = DateTime.now();

  void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }


  void tampilkanDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed: () => Navigator. pop(context),
      );
  

  AlertDialog dialog = AlertDialog(
    title: Text("Anda yakin ingin Menambahkan Data Baru?"),
    content: Text("Tekan Ok jika Yakin"),
    actions: [okButton],
  );

  showDialog(context: context, builder: (BuildContext context) {
    return dialog;
  },
  );
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: .center,
          children: [
            Text(_dateTime?.toIso8601String() ?? "Test"),
            MyImageWidget(),
            InputTextWidget(),

            ElevatedButton(
              child: Text("Ubah Tanggal"),
              onPressed: () async {
                final DateTime? tanggal = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2004, 1), 
                  lastDate: DateTime(2100),
                );

                if (tanggal != null && tanggal != _dateTime) {
                  setState(() {
                    _dateTime = tanggal;
                  });
                }  
              }   
            ),
             
            MyTextWidget(),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => tampilkanDialog(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
