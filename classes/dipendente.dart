import 'exceptions/constructor_exception.dart';
import 'persona.dart';

const giorniLavorativi = 22;

class Dipendente extends Persona {
  int _matricola;
  int _oreLavoro;
  double _stipendioOrario;

  Dipendente(int matricola,
      {required String nome,
      required String cognome,
      required String indirizzo,
      required String citta,
      required int oreLavoro,
      required double stipendioOrario,
      String? telefono})
      : _matricola = matricola,
        _oreLavoro = oreLavoro,
        _stipendioOrario = stipendioOrario,
        super(
            nome: nome,
            cognome: cognome,
            indirizzo: indirizzo,
            citta: citta,
            telefono: telefono) {
    if (matricola <= 0) {
      throw ConstructorException('La matricola deve essere maggiore di 0');
    }
    if (stipendioOrario <= 0) {
      throw ConstructorException(
          'Lo stipendio orario non può essere 0 oppure negativo');
    }
    if (oreLavoro < 0) {
      throw ConstructorException(
          'Le ore di lavoro non possono essere negative');
    }
  }

  int get matricola => _matricola;
  int get oreLavoro => _oreLavoro;
  double get stipendioOrario => _stipendioOrario;

  factory Dipendente.fromJSON(Map<String, dynamic> json) {
    return Dipendente(
      json['matricola'],
      nome: json['nome'],
      cognome: json['cognome'],
      indirizzo: json['indirizzo'],
      citta: json['citta'],
      oreLavoro: json['oreLavoro'],
      stipendioOrario: json['stipendioOrario'],
      telefono: json['telefono'],
    );
  }

  double stipendioMensile() {
    return _oreLavoro * _stipendioOrario * giorniLavorativi;
  }

  @override
  String toString() {
    return '''Dipendente #$_matricola:
          - Nome: ${super.nome} ${super.cognome}
          - Indirizzo: ${super.indirizzo} (${super.citta})${super.telefono != 'Non fornito' ? '\n              - Telefono: +39 ${super.telefono}' : ''}
          - Ore di lavoro minime: $_oreLavoro ${_oreLavoro == 1 ? 'ora' : 'ore'}
          - Stipendio orario: $_stipendioOrario€
          - Stipendio mensile: ${stipendioMensile()}€''';
  }
}
