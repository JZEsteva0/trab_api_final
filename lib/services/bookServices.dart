import 'package:dio/dio.dart';
import 'package:trab_final_api/models/bookModel.dart';

class BookServices {
  final Dio _dio = Dio();

  static const apiKey = 'dVPTwkfKZW9zL7Ce1uyNzAPa4WJYXPab';
  static const apiUrl = 'https://api.nytimes.com/svc/books/v3/';

  Future<List<BookModel>> fetchBooksInformation() async {
    const String allBooksUrl =
        '$apiUrl/lists/full-overview.json?api-key=$apiKey';

    try {
      final response = await _dio.get(allBooksUrl);
      if (response.statusCode == 200) {
        List<dynamic> booksList = [];

        var lists = response.data['results']['lists'] as List;
        for (var list in lists) {
          var books = list['books'] as List;
          booksList.addAll(books);
        }

        // Mapeia cada livro para o modelo BookModel
        return booksList.map((book) => BookModel.fromJson(book)).toList();
      } else {
        throw Exception('Erro ao solicitar informações do livro!');
      }
    } catch (e) {
      throw Exception('Erro ao acessar api ${e}!');
    }
  }
}