// ignore: unused_import
import 'package:flutter/material.dart';

class Mentor {
  final int id;
  final String title, description, image, title2;
  final double rating;

  Mentor({
    required this.id,
    required this.image,
    this.rating = 0.0,
    required this.title,
    required this.title2,
    required this.description,
  });
}

// Our food Products

List<Mentor> listMentor = [
  Mentor(
    id: 1,
    image: 'assets/images/profile.png',
    title: "Mahardhika",
    title2: " Matematika",
    description: description,
    rating: 4.8,
  ),
  Mentor(
    id: 2,
    image: "assets/images/profile2.png",
    title: "Asep",
    title2: " Matematika",
    description: description,
    rating: 4.1,
  ),
  Mentor(
    id: 3,
    image: "assets/images/profile.png",
    title: "Bintang",
    title2: " Matematika",
    description: description,
    rating: 4.0,
  ),
  Mentor(
    id: 4,
    image: "assets/images/profile2.png",
    title: "Boy Pablo",
    title2: " Matematika",
    description: description,
    rating: 4.1,
  ),
  Mentor(
    id: 5,
    image: "assets/images/profile2.png",
    title: "El Chapo",
    title2: " Matematika",
    description: description,
    rating: 4.2,
  ),
  Mentor(
    id: 6,
    image: "assets/images/profile.png",
    title: "Lee Dong-hyuck",
    title2: " Matematika",
    description: description,
    rating: 4.5,
  ),
];

const String description =
    "Halo! Saya adalah seorang mentor, saya akan berbagi pengalaman saya kepada my students tentang mata pelajaran yang saya ampu.";
