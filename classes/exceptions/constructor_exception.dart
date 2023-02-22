class ConstructorException implements Exception {
  String causa;

  ConstructorException(this.causa);

  @override
  String toString() {
    return "Errore di implementazione della classe:\n$causa";
  }
}
