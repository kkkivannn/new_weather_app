enum Endpoints {
  getWeatherInfo(endpoint: '/data/2.5/forecast');

  final String endpoint;
  const Endpoints({required this.endpoint});
}
// enum Endpoints {

//   getQrCode(endpoint: "/driver/orders/getQr");

//   final String endpoint;
//   const Endpoints({required this.endpoint});
// }