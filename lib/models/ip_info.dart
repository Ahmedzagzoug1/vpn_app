class IpInfo {
  late final String country;
  late final String city;
  late final String region;
  late final String zip;
  late final String timezone;
  late final String internetServerProvider; //internet service provider
  late final String query;
  IpInfo(
      {required this.country,
      required this.city,
      required this.region,
      required this.zip,
      required this.timezone,
      required this.internetServerProvider,
      required this.query});
  IpInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    region = json['region'];
    zip = json['zip'];
    timezone = json['timezone'];
    internetServerProvider = json['isp'];
    query = json['query'];
  }
  
}
