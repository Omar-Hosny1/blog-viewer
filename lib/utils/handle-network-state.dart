import 'package:flutter/material.dart';

Widget handleNetworkState<T>({
  required AsyncSnapshot<T> snapshot,
  required Function buildChild,
}) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return CircularProgressIndicator();
  } else if (snapshot.hasError == true) {
    return Text(snapshot.error.toString());
  }
  return buildChild(snapshot.data);
}
