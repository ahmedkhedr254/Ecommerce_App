class MobileSale {
  int id;
  String createdAt;
  String updatedAt;
  String name;
  String usbType;
  String charger;
  String battery;
  String screenSize;
  String gps;
  String network;
  String video;
  String primaryCamera;
  String secondaryCamera;
  String os;
  String audioConnector;
  String blutooth;
  String sensors;
  int type;
  String wifi;
  String screenType;
  String wirelessCharger;
  String cpu;
  String gpu;
  String simNum;
  String description;
  int price;
  String ram;
  String color;
  String storage;
  String image;
  Pivot pivot;

  MobileSale(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.usbType,
        this.charger,
        this.battery,
        this.screenSize,
        this.gps,
        this.network,
        this.video,
        this.primaryCamera,
        this.secondaryCamera,
        this.os,
        this.audioConnector,
        this.blutooth,
        this.sensors,
        this.type,
        this.wifi,
        this.screenType,
        this.wirelessCharger,
        this.cpu,
        this.gpu,
        this.simNum,
        this.description,
        this.price,
        this.ram,
        this.color,
        this.storage,
        this.image,
        this.pivot});

  MobileSale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    usbType = json['usb_type'];
    charger = json['charger'];
    battery = json['battery'];
    screenSize = json['screen_size'];
    gps = json['gps'];
    network = json['network'];
    video = json['video'];
    primaryCamera = json['primary_camera'];
    secondaryCamera = json['secondary_camera'];
    os = json['os'];
    audioConnector = json['audio_connector'];
    blutooth = json['blutooth'];
    sensors = json['sensors'];
    type = json['type'];
    wifi = json['wifi'];
    screenType = json['screen_type'];
    wirelessCharger = json['wireless_charger'];
    cpu = json['cpu'];
    gpu = json['gpu'];
    simNum = json['sim_num'];
    description = json['description'];
    price = json['price'];
    ram = json['ram'];
    color = json['color'];
    storage = json['storage'];
    image = json['image'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['usb_type'] = this.usbType;
    data['charger'] = this.charger;
    data['battery'] = this.battery;
    data['screen_size'] = this.screenSize;
    data['gps'] = this.gps;
    data['network'] = this.network;
    data['video'] = this.video;
    data['primary_camera'] = this.primaryCamera;
    data['secondary_camera'] = this.secondaryCamera;
    data['os'] = this.os;
    data['audio_connector'] = this.audioConnector;
    data['blutooth'] = this.blutooth;
    data['sensors'] = this.sensors;
    data['type'] = this.type;
    data['wifi'] = this.wifi;
    data['screen_type'] = this.screenType;
    data['wireless_charger'] = this.wirelessCharger;
    data['cpu'] = this.cpu;
    data['gpu'] = this.gpu;
    data['sim_num'] = this.simNum;
    data['description'] = this.description;
    data['price'] = this.price;
    data['ram'] = this.ram;
    data['color'] = this.color;
    data['storage'] = this.storage;
    data['image'] = this.image;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int userId;
  int mobileTabletId;
  String createdAt;

  Pivot({this.userId, this.mobileTabletId, this.createdAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mobileTabletId = json['mobile_tablet_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mobile_tablet_id'] = this.mobileTabletId;
    data['created_at'] = this.createdAt;
    return data;
  }
}