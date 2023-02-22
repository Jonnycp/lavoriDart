class StraordinaryException implements Exception {
  String causa;

  StraordinaryException(this.causa);

  @override
  String toString() {
    return "Incongruenza sul lavoro straordinario:\n$causa";
  }
}
