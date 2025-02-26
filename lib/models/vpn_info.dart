class VpnInfo {
  late String hostName;
  late String ip;
  late String ping;
  late int Speed;
  late String countryLongName;
  late String countryShortName;
  late int numVpnSessions;
  late String base64OpenVPNConfigData;
  VpnInfo(
      {required this.hostName,
      required this.ip,
      required this.ping,
      required this.Speed,
      required this.countryLongName,
      required this.countryShortName,
      required this.numVpnSessions,
      required this.base64OpenVPNConfigData});
  VpnInfo.fromJson(Map<String, dynamic> json) {
    hostName = json['HostName'] ?? '';
    ip = json['IP'] ?? '';
    ping = json['Ping'].toString()??'';
    Speed = json['Speed'] ?? 0;
    countryLongName = json['CountryLong'] ?? '';
    countryShortName = json['CountryShort'] ?? '';
    numVpnSessions = json['NumVpnSessions'] ?? 0;
    base64OpenVPNConfigData = json['OpenVPN_ConfigData_Base64'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['HostName'] = hostName;
    data['IP'] = ip;
    data['Ping'] = ping;
    data['Speed'] = Speed;
    data['CountryLong'] = countryLongName;
    data['CountryShort'] = countryShortName;
    data['NumVpnSessions'] = numVpnSessions;
    data['OpenVPN_ConfigData_Base64'] = base64OpenVPNConfigData;
    return data;
  }
}
