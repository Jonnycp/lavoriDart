import '../dipendente.dart';
import '../exceptions/straordinary_exception.dart';

mixin Straordinario {
  double getStipendioStraordinario(oreStraordinario, Dipendente d,
      {required int maxOreMensili, required double percentualeStipendio}) {
    if (maxOreMensili < 0) {
      throw StraordinaryException(
          'Le ore di straordinario massime non possono essere minori di 0');
    }
    if (percentualeStipendio < 0 || percentualeStipendio > 100) {
      throw StraordinaryException(
          'La percentuale di straordinario non può essere minore di 0 o maggiore di 100');
    }
    if (oreStraordinario > maxOreMensili) {
      throw StraordinaryException(
          'Le ore di straordinario non possono essere maggiori delle ore di straordinario massime');
    }

    return oreStraordinario *
        (d.stipendioOrario +
            ((d.stipendioOrario * percentualeStipendio) / 100));
  }
}
