import 'dipendente.dart';
import 'interface/straordinario.dart';

class DipendenteStraordinario extends Dipendente with Straordinario {
  final int? _oreLavoroStraordinario;
  final String _ruolo;
  final double _percentualeStipendioStraordinario;
  final int _maxOreMensiliStraordinario;

  DipendenteStraordinario(
    int matricola, {
    required String nome,
    required String cognome,
    required String indirizzo,
    required String citta,
    String? telefono,
    int? oreLavoroStraordinario = 0,
    required int oreLavoro,
    required double stipendioOrario,
    required int maxOreMensiliStraordinario,
    required double percentualeStipendioStraordinario,
    required String ruolo,
  })  : _oreLavoroStraordinario = oreLavoroStraordinario,
        _ruolo = ruolo,
        _percentualeStipendioStraordinario = percentualeStipendioStraordinario,
        _maxOreMensiliStraordinario = maxOreMensiliStraordinario,
        super(matricola,
            nome: nome,
            cognome: cognome,
            indirizzo: indirizzo,
            citta: citta,
            telefono: telefono,
            oreLavoro: oreLavoro,
            stipendioOrario: stipendioOrario);

  DipendenteStraordinario.programmatore(int matricola,
      {required String nome,
      required String cognome,
      required String indirizzo,
      required String citta,
      String? telefono,
      int? oreLavoroStraordinario = 0})
      : this(
          matricola,
          nome: nome,
          cognome: cognome,
          indirizzo: indirizzo,
          citta: citta,
          telefono: telefono,
          oreLavoroStraordinario: oreLavoroStraordinario,
          oreLavoro: 8,
          stipendioOrario: 20,
          maxOreMensiliStraordinario: 20,
          percentualeStipendioStraordinario: 30,
          ruolo: 'Programmatore',
        );

  DipendenteStraordinario.capoProgetto(int matricola,
      {required String nome,
      required String cognome,
      required String indirizzo,
      required String citta,
      String? telefono,
      int? oreLavoroStraordinario = 0})
      : this(
          matricola,
          nome: nome,
          cognome: cognome,
          indirizzo: indirizzo,
          citta: citta,
          telefono: telefono,
          oreLavoroStraordinario: oreLavoroStraordinario,
          oreLavoro: 8,
          stipendioOrario: 50,
          maxOreMensiliStraordinario: 20,
          percentualeStipendioStraordinario: 30,
          ruolo: 'Capo Progetto',
        );

  double getPagaStraordinario() {
    return getStipendioStraordinario(_oreLavoroStraordinario, this,
        maxOreMensili: _maxOreMensiliStraordinario,
        percentualeStipendio: _percentualeStipendioStraordinario);
  }

  @override
  double stipendioMensile() {
    return (super.stipendioMensile() + getPagaStraordinario());
  }

  @override
  String toString() {
    return '''$_ruolo #${super.matricola}:
              - Nome: ${super.nome} ${super.cognome}
              - Indirizzo: ${super.indirizzo} (${super.citta})${super.telefono != 'Non fornito' ? '\n              - Telefono: +39 ${super.telefono}' : ''}
              - Ore di lavoro minime: ${super.oreLavoro} ${super.oreLavoro == 1 ? 'ora' : 'ore'}
              - Stipendio Orario: ${super.stipendioOrario}€
              - Paga per straordinari: ${getPagaStraordinario().toStringAsFixed(2)}€ 
              - Ore straordinarie: $_oreLavoroStraordinario ${super.oreLavoro == 1 ? 'ora' : 'ore'}
              - Stipendio Mensile: ${(stipendioMensile()).toStringAsFixed(2)}€''';
  }
}
