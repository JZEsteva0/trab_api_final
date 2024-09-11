// ignore: file_names
class BookModel {
  final String title;
  final String author;
  final String bookImage;
  final String description;

  BookModel({
    required this.title,
    required this.author,
    required this.bookImage,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      bookImage: json['book_image'] ?? '',
      description: json['description'] ?? '',
    );
  }
}