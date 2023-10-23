import 'package:flutter/material.dart';

Widget handleNetworkState<T>({
  required AsyncSnapshot<T> snapshot,
  required Function buildChild,
}) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
  } else if (snapshot.hasError == true) {
    return Center(child: Text(snapshot.error.toString()));
  }
  return buildChild(snapshot.data);
}
