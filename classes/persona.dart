import 'exceptions/constructor_exception.dart';

class Persona {
  final String _nome;
  final String _cognome;
  final String _indirizzo;
  final String _citta;
  final String? _telefono;

  Persona(
      {required String nome,
      required String cognome,
      required String indirizzo,
      required String citta,
      String? telefono})
      : _nome = nome,
        _cognome = cognome,
        _indirizzo = indirizzo,
        _citta = citta,
        _telefono = telefono {
    if (nome.isEmpty) {
      throw ConstructorException('Il nome non può essere vuoto');
    }

    if (cognome.isEmpty) {
      throw ConstructorException('Il cognome non può essere vuoto');
    }

    if (indirizzo.isEmpty) {
      throw ConstructorException('L\'indirizzo non può essere vuoto');
    }

    if (citta.isEmpty) {
      throw ConstructorException('La città non può essere vuota');
    }

    if (telefono != null && telefono.length != 10) {
      throw ConstructorException(
          'Il numero di telefono deve essere di 10 cifre');
    }
  }

  factory Persona.fromJSON(Map<String, dynamic> json) {
    return Persona(
      nome: json['nome'],
      cognome: json['cognome'],
      indirizzo: json['indirizzo'],
      citta: json['citta'],
      telefono: json['telefono'],
    );
  }

  String get nome => _nome;
  String get cognome => _cognome;
  String get indirizzo => _indirizzo;
  String get citta => _citta;
  String get telefono => _telefono ?? "Non fornito";

  @override
  String toString() {
    return '''
    - Nome: $_cognome $_nome
    - Indirizzo: $_indirizzo ($_citta)'
    ${_telefono != null ? '- Telefono: +39 $_telefono' : ''}''';
  }
}
