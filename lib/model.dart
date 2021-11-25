import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

FlutterChatModel model = FlutterChatModel();

class FlutterChatModel extends Model {
  BuildContext? rootBuildContext;
  Directory? docDir;
  String greeting = '';
  String userName = '';

  static const String defaultRoomName = 'Not currently in a room';
  String currentRoomName = defaultRoomName;

  List currentRoomUserList = [];

  bool currentRoomEnabled = false;

  List currentRoomMessages = [];

  List roomList = [];
  List userList = [];

  bool creatorFunctionsEnabled = false;
  Map roomInvites = {};

  set greetings(final String inGreetings) {
    greeting = inGreetings;
    notifyListeners();
  }

  set setUserName(final String inUserName) {
    userName = inUserName;
    notifyListeners();
  }

  set currentRoom(final String inRoomName) {
    currentRoomName = inRoomName;
    notifyListeners();
  }

  set setCreatorFunctionsEnabled(final bool enabled) {
    creatorFunctionsEnabled = enabled;
    notifyListeners();
  }

  set setCurrentRoomEnabled(final bool enabled) {
    currentRoomEnabled = enabled;
    notifyListeners();
  }

  void addMessage(final String inUserName, final String inMessage) {
    currentRoomMessages.add(
      {'userName': inUserName, 'message': inMessage},
    );
    notifyListeners();
  }

  void setRoomList(final Map inRoomList) {
    final rooms = [];
    for (final roomName in inRoomList.keys) {
      final room = inRoomList[roomName];
      rooms.add(room);
    }
    roomList = rooms;
    notifyListeners();
  }

  void addRoomInvite(final String inRoomName) {
    roomInvites[inRoomName] = true;
  }

  void removeRoomInvite(final String inRoomName) {
    roomInvites.remove(inRoomName);
  }

  void clearCurrentRoomMessages() {
    currentRoomMessages = [];
  }
}
