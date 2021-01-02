class Laptop  {
  int id;
  String createdAt;
  String updatedAt;
  String name;
  String os;
  String blutooth;
  String usb;
  String gpu;
  String description;
  String camera;
  String cpu;
  String screenSize;
  String wifi;
  String color;
  int price;
  String ram;
  String storage;
  String image;

  Laptop(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.os,
        this.blutooth,
        this.usb,
        this.gpu,
        this.description,
        this.camera,
        this.cpu,
        this.screenSize,
        this.wifi,
        this.color,
        this.price,
        this.ram,
        this.storage,
        this.image});

  Laptop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    os = json['os'];
    blutooth = json['blutooth'];
    usb = json['usb'];
    gpu = json['gpu'];
    description = json['description'];
    camera = json['camera'];
    cpu = json['cpu'];
    screenSize = json['screen_size'];
    wifi = json['wifi'];
    color = json['color'];
    price = json['price'];
    ram = json['ram'];
    storage = json['storage'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['os'] = this.os;
    data['blutooth'] = this.blutooth;
    data['usb'] = this.usb;
    data['gpu'] = this.gpu;
    data['description'] = this.description;
    data['camera'] = this.camera;
    data['cpu'] = this.cpu;
    data['screen_size'] = this.screenSize;
    data['wifi'] = this.wifi;
    data['color'] = this.color;
    data['price'] = this.price;
    data['ram'] = this.ram;
    data['storage'] = this.storage;
    data['image'] = this.image;
    return data;
  }
}