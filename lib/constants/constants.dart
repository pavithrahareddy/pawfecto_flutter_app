import 'package:flutter/material.dart';

const textinputdecoration = InputDecoration(
  filled: true,
  fillColor: Color.fromARGB(255, 238, 238, 238),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Color.fromARGB(255, 62, 193, 135), width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 0, 136, 145), width: 2.0),
  ),
);
