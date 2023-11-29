import 'package:flutter/material.dart';

class BuildSettingBox extends StatefulWidget {
  const BuildSettingBox(
      {super.key,
      required this.mode,
      required this.count,
      required this.update});
  final bool mode;
  final int count;
  final Function(int, bool) update;

  @override
  State<BuildSettingBox> createState() => _BuildSettingBoxState();
}

class _BuildSettingBoxState extends State<BuildSettingBox> {
  late bool mode;
  late int count;

  @override
  void initState() {
    super.initState();
    reload();
  }

  reload() {
    mode = widget.mode;
    count = widget.count;
    setState(() {});
  }

  void increment() {
    if (count < 3) {
      setState(() {
        count++;
      });
    }
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChangeCounter(),
        buildItemCheckBox(mode, "Hiện ngay kết quả."),
        ElevatedButton(
            onPressed: () {
              widget.update(count, mode);
            },
            child: const Text("Lưu"))
      ],
    );
  }

  Widget buildChangeCounter() {
    return Row(children: [const Text("Số lương xúc xắc:"), buildIconUpDown()]);
  }

  Widget buildIconUpDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: decrement,
        ),
        Text(count.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: increment,
        ),
      ],
    );
  }

  Widget buildItemCheckBox(bool checked, String lable) {
    return Row(children: [
      Checkbox(
          value: checked,
          onChanged: (value) {
            setState(() {
              mode = checked;
            });
          }),
      GestureDetector(
          onTap: () {
            setState(() {
              mode = checked;
            });
          },
          child: Text(lable)),
    ]);
  }
}
