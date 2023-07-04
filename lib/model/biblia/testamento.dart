class Testamento {
  int id;
  String name;

  Testamento({required this.id, required this.name});

  static List<Testamento> getAll() {
    return [
      Testamento(id: 1, name: 'Antigo Testamento'),
      Testamento(id: 2, name: 'Novo Testamento')
    ];
  }
}
