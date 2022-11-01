import 'package:aula31/src/controller/personagem_controller.dart';
import 'package:flutter/material.dart';
import '../src/repository/personagem_repository.dart';
import '../src/models/personagem.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PersonagemController resultado = PersonagemController(
    repository: PersonagemRepository(),
  );
  @override
  void initState() {
    super.initState();
    resultado.getAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
      ),
      body: FutureBuilder<List<Personagem>>(
        future: resultado.getAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (!snapshot.hasData && !snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return SizedBox(
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data![index].image /*== null
                            ? ''
                            : snapshot.data?[index].image*/,
                      ),
                    ),
                    title: Text(snapshot.data![index].name.toString()),
                    subtitle: Text('Casa'),
                  );
                },
              ),
            );
            
          }
          return Center();
        },
      ),
    );
  }
}
