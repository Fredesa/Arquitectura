class UsuarioModel {
  String? uid;
  String? identificacion;
  String? nombre;
  String? correo;
  String? edad;
  String? idMedico;
  String? idTratamiento;

  UsuarioModel(
      {this.uid,
      this.nombre,
      this.correo,
      this.edad,
      this.identificacion,
      this.idMedico,
      this.idTratamiento});

  // receiving data from server
  factory UsuarioModel.fromMap(map) {
    return UsuarioModel(
      uid: map['uid'],
      identificacion: map['identificacion'],
      nombre: map['nombre'],
      correo: map['correo'],
      edad: map['edad'],
      idMedico: map['idMedico'],
      idTratamiento: map['idTratamiento'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'identificacion': identificacion,
      'nombre': nombre,
      'correo': correo,
      'edad': edad,
      'idMedico': idMedico,
      'idTratamiento': idTratamiento,
    };
  }
}
