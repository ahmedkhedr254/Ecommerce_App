part of 'register_bloc.dart';
 class RegisterEvent {
  String name;
  String email;
  String password;
  String phone;
  String country;
  String city;
  String street;
  String HomeId;
  String Birthday;
  RegisterEvent(
      this.name,
      this.email,
      this.password,
      this.phone,
      this.country,
      this.city,
      this.street,
      this.HomeId,
      this.Birthday);
}
