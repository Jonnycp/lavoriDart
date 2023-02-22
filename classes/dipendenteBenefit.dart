import 'auto.dart';
import 'dipendente.dart';

class DipendenteBenefit extends Dipendente {
  final int _benefitAnnuale;
  final Auto? _auto;
  final String _ruolo;

  DipendenteBenefit(int matricola,
      {required String nome,
      required String cognome,
      required String indirizzo,
      required String citta,
      String? telefono,
      required int oreLavoro,
      required double stipendioOrario,
      required String ruolo,
      required int benefitAnnuale,
      Auto? auto})
      : _benefitAnnuale = benefitAnnuale,
        _auto = auto,
        _ruolo = ruolo,
        super(matricola,
            nome: nome,
            cognome: cognome,
            indirizzo: indirizzo,
            citta: citta,
            telefono: telefono,
            oreLavoro: oreLavoro,
            stipendioOrario: stipendioOrario);

  DipendenteBenefit.direttoreGenerale(
    int matricola, {
    required String nome,
    required String cognome,
    required String indirizzo,
    required String citta,
    String? telefono,
    required String targaAutoAziendale,
    required String marcaAutoAziendale,
  }) : this(matricola,
            nome: nome,
            cognome: cognome,
            indirizzo: indirizzo,
            citta: citta,
            telefono: telefono,
            oreLavoro: 6,
            stipendioOrario: 40,
            ruolo: 'Direttore Generale',
            benefitAnnuale: 20000,
            auto: Auto(targaAutoAziendale, marcaAutoAziendale));

  DipendenteBenefit.ceo(int matricola,
      {required String nome,
      required String cognome,
      required String indirizzo,
      required String citta,
      String? telefono})
      : this(matricola,
            nome: nome,
            cognome: cognome,
            indirizzo: indirizzo,
            citta: citta,
            telefono: telefono,
            oreLavoro: 0,
            stipendioOrario: 1,
            ruolo: 'Amministratore Delegato',
            benefitAnnuale: 100000);

  @override
  double stipendioMensile() {
    return super.stipendioMensile() + (_benefitAnnuale / 12);
  }

  @override
  String toString() {
    return '''$_ruolo #${super.matricola}:
              - Nome: ${super.nome} ${super.cognome}
              - Indirizzo: ${super.indirizzo} (${super.citta})${super.telefono != 'Non fornito' ? '\n              - Telefono: +39 ${super.telefono}' : ''}${_ruolo != "Amministratore Delegato" ? "\n              - Ore di lavoro minime: ${super.oreLavoro} ${super.oreLavoro == 1 ? 'ora' : 'ore'}" : ""}${_ruolo != "Amministratore Delegato" ? "\n              - Stipendio Orario: ${super.stipendioOrario}€" : ""}
              - Benefit Annuale: $_benefitAnnuale€
              - Stipendio Mensile: ${(stipendioMensile()).toStringAsFixed(2)}€;
              ${_auto != null ? _auto!.toString() : ""}''';
  }
}
