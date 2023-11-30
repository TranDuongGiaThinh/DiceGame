import 'package:app/models/state_index.dart';
import 'package:app/views/bowl.dart';
import 'package:app/views/build_setting_box.dart';
import 'package:app/views/build_one_dice.dart';
import 'package:app/views/build_three_dice.dart';
import 'package:app/views/build_two_dice.dart';
import 'package:app/views/plate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StateIndex>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Game"),
        actions: [
          IconButton(
            onPressed: () {
              if (!state.isSetting) {
                state.setSetting(true);
              }
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: state.isSetting
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (state.isSetting) const SizedBox(),
              Text(
                (!state.mode && state.isHide)
                    ? "Điểm: ?"
                    : "Điểm: ${state.score}",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              if (state.isSetting)
                Container(
                  color: Colors.amberAccent,
                  child: BuildSettingBox(
                    mode: state.mode,
                    count: state.count,
                    update: state.updateMode,
                  ),
                ),
            ],
          ),
          Center(
            child: SizedBox(
              width: 200,
              height: 300,
              child: Stack(
                children: [
                  const Plate(),
                  buildDices(state),
                  if (state.isHide && !state.mode)
                    Draggable(
                      feedback: const Bowl(),
                      childWhenDragging: Container(),
                      onDraggableCanceled: (velocity, offset) {
                        state.updateHideStatus(false);
                      },
                      child: const Bowl(),
                    ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!state.mode && state.isHide) {
                state.updateHideStatus(false);
              } else {
                if (!state.mode) {
                  state.updateHideStatus(true);
                }
                state.rollDices();
              }
            },
            child: Text((!state.mode && state.isHide) ? "Mở" : "Lắc"),
          ),
        ],
      ),
    );
  }

  Widget buildDices(StateIndex state) {
    if (state.count == 1) {
      return BuildOneDice(dices: state.dices, shouldReloadDice: state.shouldReload,);
    } else if (state.count == 2) {
      return BuilTwoDice(dices: state.dices, shouldReloadDice: state.shouldReload,);
    } else {
      return BuildThreeDice(dices: state.dices, shouldReloadDice: state.shouldReload,);
    }
  }
}
