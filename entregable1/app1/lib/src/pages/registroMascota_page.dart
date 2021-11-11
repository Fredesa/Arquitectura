// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, prefer_const_declarations, prefer_const_constructors, prefer_final_fields
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class registroMascotaPage extends StatefulWidget {
  @override
  _registroMascotaPageState createState() => _registroMascotaPageState();
  static final String routeName = 'registroMascota';
}

class _registroMascotaPageState extends State<registroMascotaPage> {
  final picker = ImagePicker();
  var pickedFile;

  String _nombre = "";
  String _edad = "";
  String _raza = "Affenpinscher";
  String _caracter = "Docil";
  String _afeccion = "";

  List<String> _listaRazas = [
    "Affenpinscher",
    "Airedale terrier",
    "Akita",
    "Akita americano",
    "Alaskan Husky",
    "Alaskan malamute",
    "American Foxhound",
    "American pit bull terrier",
    "American staffordshire terrier",
    "Ariegeois",
    "Artois",
    "Australian silky terrier",
    "Australian Terrier",
    "Austrian Black & Tan Hound",
    "Azawakh",
    "Balkan Hound",
    "Basenji",
    "Basset Alpino",
    "Basset Artesiano Normando",
    "Basset Azul de Gascuña",
    "Basset de Artois",
    "Basset de Westphalie",
    "Basset Hound",
    "Basset Leonado de Bretaña ",
    "Bavarian Mountain Scenthound",
    "Beagle",
    "Beagle Harrier",
    "Beauceron",
    "Bedlington Terrier",
    "Bichon Boloñes",
    "Bichón Frisé",
    "Bichón Habanero",
    "Billy",
    "Black and Tan Coonhound",
    "Bloodhound ",
    "Bobtail",
    "Boerboel",
    "Border Collie",
    "Border terrier",
    "Borzoi",
    "Bosnian Hound",
    "Boston terrier",
    "Bouvier des Flandres",
    "Boxer",
    "Boyero de Appenzell",
    "Boyero de Australia",
    "Boyero de Entlebuch",
    "Boyero de las Ardenas",
    "Boyero de Montaña Bernes",
    "Braco Alemán de pelo corto",
    "Braco Alemán de pelo duro",
    "Braco de Ariege",
    "Braco de Auvernia",
    "Braco de Bourbonnais",
    "Braco de Saint Germain",
    "Braco Dupuy",
    "Braco Francés",
    "Braco Italiano",
    "Broholmer",
    "Buhund Noruego",
    "Bull terrier",
    "Bulldog americano",
    "Bulldog inglés",
    "Bulldog francés",
    "Bullmastiff",
    "Ca de Bestiar",
    "Cairn terrier",
    "Cane Corso",
    "Cane da Pastore Maremmano-Abruzzese",
    "Caniche (Poodle)",
    "Caniche Toy (Toy Poodle)",
    "Cao da Serra de Aires",
    "Cao da Serra de Estrela",
    "Cao de Castro Laboreiro",
    "Cao de Fila de Sao Miguel",
    "Cavalier King Charles Spaniel",
    "Cesky Fousek",
    "Cesky Terrier",
    "Chesapeake Bay Retriever",
    "Chihuahua",
    "Chin",
    "Chow Chow",
    "Cirneco del Etna",
    "Clumber Spaniel",
    "Cocker Spaniel Americano",
    "Cocker Spaniel Inglés",
    "Collie Barbudo",
    "Collie de Pelo Cort",
    "Collie de Pelo Largo",
    "Cotón de Tuléar",
    "Criollo",
    "Curly Coated Retriever",
    "Dálmata",
    "Dandie dinmont terrier",
    "Deerhound",
    "Dobermann",
    "Dogo Argentino",
    "Dogo de Burdeos",
    "Dogo del Tibet",
    "Drentse Partridge Dog",
    "Drever",
    "Dunker",
    "Elkhound Noruego",
    "Elkhound Sueco",
    "English Foxhound",
    "English Springer Spaniel",
    "English Toy Terrier",
    "Epagneul Picard",
    "Eurasier",
    "Fila Brasileiro",
    "Finnish Lapphound",
    "Flat Coated Retriever",
    "Fox terrier de pelo de alambre",
    "Fox terrier de pelo liso",
    "Foxhound Inglés",
    "Frisian Pointer",
    "Galgo Español",
    "Galgo húngaro (Magyar Agar)",
    "Galgo Italiano",
    "Galgo Polaco (Chart Polski)",
    "Glen of Imaal Terrier",
    "Golden Retriever",
    "Gordon Setter",
    "Gos d'Atura Catalá",
    "Gran Basset Griffon Vendeano",
    "Gran Boyero Suizo",
    "Gran Danés (Dogo Aleman)",
    "Gran Gascón Saintongeois",
    "Gran Griffon Vendeano",
    "Gran Munsterlander",
    "Gran Perro Japonés",
    "Grand Anglo Francais Tricoleur",
    "Grand Bleu de Gascogne",
    "Greyhound",
    "Griffon Bleu de Gascogne",
    "Griffon de pelo duro (Grifón Korthals)",
    "Griffon leonado de Bretaña",
    "Griffon Nivernais",
    "Grifon Belga",
    "Grifón de Bruselas",
    "Haldenstoever",
    "Harrier",
    "Hokkaido",
    "Hovawart",
    "Husky Siberiano (Siberian Husky)",
    "Ioujnorousskaia Ovtcharka",
    "Irish Glen of Imaal terrier",
    "Irish soft coated wheaten terrier",
    "Irish terrier",
    "Irish Water Spaniel",
    "Irish Wolfhound",
    "Jack Russell terrier",
    "Jindo Coreano",
    "Kai",
    "Keeshond",
    "Kelpie australiano (Australian kelpie)",
    "Kerry blue terrier",
    "King Charles Spaniel",
    "Kishu",
    "Komondor",
    "Kooiker",
    "Kromfohrländer",
    "Kuvasz",
    "Labrador Retriever",
    "Lagotto Romagnolo",
    "Laika de Siberia Occidental",
    "Laika de Siberia Oriental",
    "Laika Ruso Europeo",
    "Lakeland terrier",
    "Landseer",
    "Lapphund Sueco",
    "Lebrel Afgano",
    "Lebrel Arabe (Sloughi)",
    "Leonberger",
    "Lhasa Apso",
    "Lowchen (Pequeño Perro León)",
    "Lundehund Noruego",
    "Malamute de Alaska",
    "Maltés",
    "Manchester terrier",
    "Mastiff",
    "Mastín de los Pirineos",
    "Mastín Español",
    "Mastín Napolitano",
    "Mudi",
    "Norfolk terrier",
    "Norwich terrier",
    "Nova Scotia duck tolling retriever",
    "Ovejero alemán",
    "Otterhound",
    "Rafeiro do Alentejo",
    "Ratonero Bodeguero Andaluz",
    "Retriever de Nueva Escocia",
    "Rhodesian Ridgeback",
    "Ridgeback de Tailandia",
    "Rottweiler",
    "Saarloos",
    "Sabueso de Hamilton",
    "Sabueso de Hannover",
    "Sabueso de Hygen",
    "Sabueso de Istria",
    "Sabueso de Posavaz",
    "Sabueso de Schiller ",
    "Sabueso de Smaland ",
    "Sabueso de Transilvania",
    "Sabueso del Tirol",
    "Sabueso Español",
    "Sabueso Estirio de pelo duro",
    "Sabueso Finlandés",
    "Sabueso Francés blanco y negro",
    "Sabueso Francés tricolor",
    "Sabueso Griego",
    "Sabueso Polaco ",
    "Sabueso Serbio",
    "Sabueso Suizo",
    "Sabueso Yugoslavo de Montaña",
    "Sabueso Yugoslavo tricolor",
    "Saluki",
    "Samoyedo",
    "San Bernardo",
    "Sarplaninac",
    "Schapendoes",
    "Schipperke",
    "Schnauzer estándar",
    "Schnauzer gigante",
    "Schnauzer miniatura",
    "Scottish terrier",
    "Sealyham terrier",
    "Segugio Italiano",
    "Seppala Siberiano",
    "Setter Inglés",
    "Setter Irlandés",
    "Setter Irlandés rojo y blanco",
    "Shar Pei",
    "Shiba Inu",
    "Shih Tzu",
    "Shikoku",
    "Skye terrier",
    "Slovensky Cuvac",
    "Slovensky Kopov",
    "Smoushond Holandés",
    "Spaniel Alemán",
    "Spaniel Azul de Picardía",
    "Spaniel Bretón",
    "Spaniel de Campo",
    "Spaniel de Pont Audemer",
    "Spaniel Francés",
    "Spaniel Tibetano",
    "Spinone Italiano",
    "Spítz Alemán",
    "Spitz de Norbotten ",
    "Spitz Finlandés",
    "Spitz Japonés",
    "Staffordshire bull terrier",
    "Staffordshire terrier americano",
    "Sussex Spaniel",
    "Teckel (Dachshund)",
    "Tchuvatch eslovaco",
    "Terranova (Newfoundland)",
    "Terrier australiano",
    "Terrier brasilero",
    "Terrier cazador alemán",
    "Terrier checo ",
    "Terrier galés",
    "Terrier irlandés ",
    "Terrier japonés ",
    "Terrier negro ruso",
    "Terrier tibetano",
    "Tosa",
    "Viejo Pastor Inglés",
    "Viejo Pointer Danés",
    "Vizsla",
    "Volpino Italiano",
    "Weimaraner",
    "Welsh springer spaniel",
    "Welsh Corgi Cardigan",
    "Welsh Corgi Pembroke",
    "Welsh terrier",
    "West highland white terrier",
    "Whippet",
    "Wirehaired solvakian pointer",
    "Xoloitzcuintle"
  ];
  List<String> _listaCaracter = [
    "Docil",
    "Agresivo",
    "Territorial",
    "Tranquilo",
    "Asustadizo",
    "Perezoso"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro Mascota'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              _inputNombre(),
              SizedBox(height: size.height * 0.05),
              _inputEdad(),
              SizedBox(height: size.height * 0.05),
              _inputRaza(),
              SizedBox(height: size.height * 0.05),
              _inputCaracter(),
              SizedBox(height: size.height * 0.05),
              Center(
                child: Column(
                  children: [
                    Text(
                        "Si posee alguna afeccion fisica escribela a continuacion"),
                    SizedBox(height: size.height * 0.02),
                    _inputEstado(),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Text('Ingresar una foto de tu mascota'),
              SizedBox(height: size.height * 0.02),
              _inputImagen(),
              SizedBox(height: size.height * 0.05),
              Center(
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                        primary: Colors.orange,
                        side: BorderSide(color: Colors.black),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      'Registrarte',
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () => _inputMascota(),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future selImagen() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
  }

  Widget _inputImagen() {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.black,
                primary: Colors.orange,
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text(
              'Seleccionar foto',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () => selImagen()),
      ),
    );
  }

  Widget _inputNombre() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.orange[900],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Nombre de la Mascota',
                labelText: 'Nombre de la Mascota',
                icon: Icon(Icons.pets, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _nombre = valor;
                });
              },
            )));
  }

  Widget _inputEstado() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.orange[900],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Afeccion fisica ',
                labelText: 'Afeccion Fisica',
                icon: Icon(Icons.pets, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _afeccion = valor;
                });
              },
            )));
  }

  Widget _inputEdad() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.orange[900],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Edad',
                labelText: 'Edad de la Mascota',
                icon: Icon(Icons.phone, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _edad = valor;
                });
              },
            )));
  }

  _inputMascota() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Datos'),
                Text('El nombre de la mascota es : $_nombre'),
                Text('La edad de la mascota es : $_edad'),
                Text('La raza de tu mascota es : $_raza'),
                Text('El caracter de la mascota es : $_caracter'),
                Text('Las afecciones de tu mascota son es : $_afeccion')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(primary: Colors.orange[900]),
                child: Text('Registrarse'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'recorrido');
                }),
          ],
        );
      },
    );
  }

  Widget _inputRaza() {
    return Center(
        child: SizedBox(
      width: 380,
      child: Column(children: <Widget>[
        InputDecorator(
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.orange[900],
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Raza',
            labelText: 'Raza',
            icon: Icon(Icons.select_all, color: Colors.orange[900]),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _raza,
              items: getOpcionesRazas(),
              onChanged: (opci) {
                setState(() {
                  _raza = opci.toString();
                });
              },
            ),
          ),
        )
      ]),
    ));
  }

  Widget _inputCaracter() {
    return Center(
        child: SizedBox(
      width: 380,
      child: Column(children: <Widget>[
        InputDecorator(
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.orange[900],
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Caracter de tu mascota',
            labelText: 'Caracter',
            icon: Icon(Icons.select_all, color: Colors.orange[900]),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _caracter,
              items: getOpcionesCaracter(),
              onChanged: (opci) {
                setState(() {
                  _caracter = opci.toString();
                });
              },
            ),
          ),
        )
      ]),
    ));
  }

  List<DropdownMenuItem<String>> getOpcionesRazas() {
    List<DropdownMenuItem<String>> lista = [];
    _listaRazas.forEach((raza) {
      lista.add(DropdownMenuItem(
        child: Text(raza),
        value: raza,
      ));
    });
    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesCaracter() {
    List<DropdownMenuItem<String>> lista = [];
    _listaCaracter.forEach((caracter) {
      lista.add(DropdownMenuItem(
        child: Text(caracter),
        value: caracter,
      ));
    });
    return lista;
  }
}
