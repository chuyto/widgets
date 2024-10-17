import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaluación Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  String _greetingMessage = '';

  // Función para generar el saludo con el nombre ingresado
  void _showGreeting() {
    setState(() {
      String name = _nameController.text;
      if (name.isNotEmpty) {
        _greetingMessage = '¡Hola, $name! Bienvenido a la Evaluación Flutter.';
      } else {
        _greetingMessage = 'Por favor ingresa tu nombre.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluación Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container con estilo personalizado
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Por favor ingrese su nombre a continuación:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Campo de texto para ingresar el nombre
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Botón que muestra el saludo
            ElevatedButton(
              onPressed: _showGreeting,
              child: const Text('Mostrar saludo'),
            ),

            const SizedBox(height: 20),

            // Mostrar el mensaje de saludo
            Text(
              _greetingMessage,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
