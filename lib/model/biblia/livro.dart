class Livro {
  int id;
  int book_reference_id;
  int testament_reference_id;
  String name;

  Livro(
      {required this.id,
      required this.book_reference_id,
      required this.testament_reference_id,
      required this.name});

  static Livro fromMap(Map<String, dynamic> item) {
    return Livro(
        id: int.parse(item['id'].toString()),
        book_reference_id: int.parse(item['book_reference_id'].toString()),
        testament_reference_id: int.parse(item['testament_reference_id'].toString()),
        name: item['name']);
  }
}
