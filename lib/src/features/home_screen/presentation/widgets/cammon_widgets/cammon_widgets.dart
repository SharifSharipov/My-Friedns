// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_freends/src/core/colors/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MenuContainer extends StatefulWidget {
  final TextEditingController controller;
  final Function(int?) onSwitch;
  final int intialLabelIndex;
  const MenuContainer(
      {super.key,
      required this.controller,
      required this.onSwitch,
      required this.intialLabelIndex});

  @override
  State<StatefulWidget> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 30),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.yellowAccent),
            borderRadius: BorderRadius.circular(8),
            color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: TextField(
                  maxLines: 2,
                  controller: widget.controller,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.yellowAccent),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.yellowAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.yellowAccent),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "Where you vould go?",
                      hintStyle: TextStyle(
                          color: Color(0xffd0d0d0),
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ToggleSwitch(
                  minWidth: 160,
                  minHeight: 35,
                  // cornerRadius: 20.0,
                  activeFgColor: Colors.yellowAccent.shade400,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Color(0xffd0d0d0),
                  initialLabelIndex: widget.intialLabelIndex,
                  totalSwitches: 2,
                  labels: const ["Transport", "Delivery"],
                  onToggle: widget.onSwitch,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.c_2DA4BA),
      child: Text("Create order"),
    );
  }
}
