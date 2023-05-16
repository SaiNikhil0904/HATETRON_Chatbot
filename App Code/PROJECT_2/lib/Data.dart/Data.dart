import 'package:flutter/material.dart';

class UnbordingContent {
  String title;
  String discription;
  Color backgroundColor;
  UnbordingContent({
    required this.title,
    required this.discription,
    required this.backgroundColor,
  });
}

// Created By Flutter Baba
List<UnbordingContent> contentsList = [
  UnbordingContent(
    backgroundColor: const Color(0xFF04B4AE),
    title: "Welcome to HATETRON",
    discription: "The Hate Speech Detection Bot",
  ),
  UnbordingContent(
    backgroundColor: const Color(0xFF04B4AE),
    title: '',
    discription:
        "A vigilant friend that's always here to keep things in check.",
  ),
  UnbordingContent(
    backgroundColor: const Color(0xFF04B4AE),
    title: '',
    discription:
        "Hate has no place here - our chatbot is on the case, keeping conversations safe and hate-free!",
  ),
];