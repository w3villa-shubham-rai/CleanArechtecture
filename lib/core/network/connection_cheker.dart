import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class InterNetCheckedData{
  Future<bool> get isConnected;
}
class InterNetCheckedDataImpl implements InterNetCheckedData{
  final InternetConnection internetConnection;
  InterNetCheckedDataImpl(this.internetConnection);
  @override
  Future<bool> get isConnected  async => await internetConnection.hasInternetAccess;

}