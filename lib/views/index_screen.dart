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
    final state = Provider.of<StateIndexScreen>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Game"),
        actions: [
          IconButton(
            onPressed: () {
              state.setSetting(!state.isSetting);
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
                (state.modeHise && state.isHide)
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
                    mode: state.modeHise,
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
                  if (state.isHide && state.modeHise)
                    if (state.isHide && state.modeHise)
                      Draggable(
                        feedback: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.06,
                            height: MediaQuery.of(context).size.height / 2.28,
                            color: Colors.transparent,
                            child: const Bowl(),
                          ),
                        ),
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
              if (state.modeHise && state.isHide) {
                state.updateHideStatus(false);
              } else {
                if (state.modeHise) {
                  state.updateHideStatus(true);
                }
                state.rollDices();
              }
            },
            child: Text((state.modeHise && state.isHide) ? "Mở" : "Lắc"),
          ),
        ],
      ),
    );
  }

  Widget buildDices(StateIndexScreen state) {
    if (state.count == 1) {
      return BuildOneDice(
        dices: state.dices,
        shouldReloadDice: state.shouldReload,
      );
    } else if (state.count == 2) {
      return BuilTwoDice(
        dices: state.dices,
        shouldReloadDice: state.shouldReload,
      );
    } else {
      return BuildThreeDice(
        dices: state.dices,
        shouldReloadDice: state.shouldReload,
      );
    }
  }
}
