class VpnStatus{
  String? byteIn;
  String? byteOut;
  String? durationTime;
  String?lastPacketReceived;
  VpnStatus({this.byteIn,this.byteOut,this.durationTime,this.lastPacketReceived});
  factory VpnStatus.fromJson(Map<String, dynamic> json) => VpnStatus(
    byteIn : json['byte_in'] ,
    byteOut : json['byte_out'], 
    durationTime : json['duration'] ,
    lastPacketReceived : json['last_packet_received']) ;
  Map<String, dynamic> toJson() => {
    'byte_in': byteIn,
    'byte_out': byteOut,
    'duration': durationTime,
    'last_packet_received': lastPacketReceived,
  };
  

}