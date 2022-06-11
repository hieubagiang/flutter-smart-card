class ApduCommand {
  final int cla, ins, p1, p2;
  final List<int> data;

  ApduCommand(
      {required this.cla,
      required this.ins,
      required this.p1,
      required this.p2,
      required this.data});

  factory ApduCommand.connect({required List<int> appletID}) =>
      ApduCommand(cla: 0x00, ins: 0xA4, p1: 0x04, p2: 0x00, data: appletID);

  List<int> toListInt() {
    return [cla, ins, p1, p2, data.length, ...data];
  }
}
