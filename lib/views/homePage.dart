import 'package:flutter/material.dart';
import 'package:trab_final_api/models/bookModel.dart';
import 'package:trab_final_api/services/bookServices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookServices _bookServices = BookServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text('Livros mais lidos do The New York Times'),
      ),
      body: FutureBuilder(
          future: _bookServices.fetchBooksInformation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao acessar API!'),
              );
            } else if (snapshot.hasData) {
              final books = snapshot.data!;
              return ListView.separated(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return ListTile(
                    // leading: Image.network(
                    //   BookModel.bookImage
                    // ),
                    title: Text(book.title),
                    subtitle: Text('Autor: ${book.author}'),
                    onTap: () {},
                  );
                }, separatorBuilder: (BuildContext context, int index) => const Divider(),
              );
            } else {
              return Center(child: Text('Nenhuma informação disponível!'));
            }
          }),
    );
  }
}