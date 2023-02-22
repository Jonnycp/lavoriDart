import '../classes/dipendenteStraordinario.dart';
import '../classes/dipendenteBenefit.dart';
import '../classes/persona.dart';
import 'package:faker/faker.dart';
import 'dart:math';

void main(List<String> arguments) {
  var faker = Faker();
  Random random = Random();
  List<Persona> risorseUmane = [];

  //Programmatori
  for (int i = 0; i < 6; i++) {
    risorseUmane.add(DipendenteStraordinario.programmatore(
      random.nextInt(9999) + 1000,
      nome: faker.person.firstName(),
      cognome: faker.person.lastName(),
      indirizzo: faker.address.streetAddress(),
      citta: faker.address.city(),
      oreLavoroStraordinario: random.nextInt(20),
    ));
  }
  //Capi Progetto
  for (int i = 0; i < 4; i++) {
    risorseUmane.add(DipendenteStraordinario.capoProgetto(
      random.nextInt(9999) + 1000,
      nome: faker.person.firstName(),
      cognome: faker.person.lastName(),
      indirizzo: faker.address.streetAddress(),
      citta: faker.address.city(),
      oreLavoroStraordinario: random.nextInt(20),
    ));
  }

  risorseUmane.add(DipendenteBenefit.direttoreGenerale(
    random.nextInt(9999) + 1000,
    nome: 'Mario',
    cognome: 'Rossi',
    indirizzo: 'Via Roma 1',
    citta: 'Roma',
    marcaAutoAziendale: "FIAT Panda",
    targaAutoAziendale: "AA000AA",
  ));
  risorseUmane.add(DipendenteBenefit.ceo(random.nextInt(9999) + 1000,
      nome: 'Mario', cognome: 'Rossi', indirizzo: 'Via Roma 1', citta: 'Roma'));

  for (Persona p in risorseUmane) {
    print("$p\n");
  }
}
