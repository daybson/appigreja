class Versiculo {
  int id;
  int book_id;
  int chapter;
  int verse;
  String text;

  Versiculo(
      {required this.id,
      required this.book_id,
      required this.chapter,
      required this.verse,
      required this.text});

  static Versiculo fromMap(Map<String, dynamic> item) {
    return Versiculo(
        id: int.parse(item['id'].toString()),
        book_id: int.parse(item['book_id'].toString()),
        chapter: int.parse(item['chapter'].toString()),
        verse: int.parse(item['verse'].toString()),
        text: item['text']);
  }
}
