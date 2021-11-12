class Notification {
  String? id;
  String? nombre;
  String? asunto;

  Notification({this.id, this.nombre, this.asunto});

  factory Notification.fromMap(Map<String, dynamic> obj) =>
      Notification(id: obj["id"], nombre: obj["nombre"], asunto: obj["asunto"]);
}
