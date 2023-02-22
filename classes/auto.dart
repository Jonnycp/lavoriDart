import 'exceptions/constructor_exception.dart';

class Auto {
  final String _targa;
  final String _marca;

  Auto(this._targa, this._marca) {
    if (_targa.length != 7) {
      throw ConstructorException('Targa non valida');
    }
  }

  String get targa => _targa;
  String get marca => _marca;

  @override
  String toString() {
    return '- Auto Aziendale: $_marca ($_targa)';
  }
}
