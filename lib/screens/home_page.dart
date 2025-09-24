import 'package:ecodesh/dimensions/dimensions.dart';
import 'package:flutter/material.dart';
import 'dart:async';

const Color primaryTextColor = Color(0xFF4F3130);

/// A StatefulWidget for the "Home" screen.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
late Timer _timer;
final List<String> _facts = [
  'Did you know? Recycling one aluminum can saves enough energy to run a TV for three hours.',
  'Over 1 million sea birds and 100,000 sea mammals are killed by pollution every year.',
  'The world produces 381 million tonnes in plastic waste yearly – this is set to double by 2034.',
  'A glass bottle can take 4000 years to decompose.',
  'Composting food waste can reduce landfill mass by up to 30%.',
  'Plastic bags can take up to 1,000 years to degrade in landfills.',
  'India generates over 150,000 tonnes of municipal solid waste daily.',
  'Electronic waste is the fastest-growing waste stream globally.',
  'Recycling one ton of paper saves 17 trees and 26,000 liters of water.',
  'Only 9% of plastic ever produced has been recycled.',
  'Organic waste in landfills produces methane—a greenhouse gas 25x more potent than CO₂.',
  'Recycling steel saves 75% of the energy needed to produce it from raw materials.',
  'Upcycling is a creative way to turn waste into value—think furniture from pallets or bags from old clothes.',
  'Proper segregation at source is the first step toward effective waste management.',
  'Every minute, the equivalent of one garbage truck of plastic is dumped into the ocean.'
];

final PageController _pageController = PageController();
int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _facts.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 1),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer
    _pageController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dim = Dimensions(context);

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: dim.width(5)),
    child: Column(
      children: [
        SizedBox(height: dim.height(2)),
        Container(
          padding: EdgeInsets.all(dim.width(4)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(dim.width(4)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: dim.width(0.5),
                blurRadius: dim.width(1.5),
                offset: Offset(0, dim.height(0.5)),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Announcements',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: dim.width(4.5),
                      color: primaryTextColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Handle "See More" tap
                    },
                    child: const Text(
                      'See More',
                      style: TextStyle(color: Color(0xFF0F5257), ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: dim.height(2)),
              Text(
                'Waste collection schedules have been updated for the upcoming holiday season. Ensure your bins are out by 7 AM.',
                style: TextStyle(fontSize: dim.width(3.5), color: primaryTextColor.withOpacity(0.8)),
              ),
            ],
          ),
        ),
        SizedBox(height: dim.height(3)),

        // --- Banner Placeholder ---
        Container(
          height: dim.height(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(dim.width(4)),
          ),
          child: const Center(
            child: Text(
              'Banner Placeholder (from backend)',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),

        SizedBox(height: dim.height(3)),

        SizedBox(
          height: dim.height(10), // Give the PageView a fixed height
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: _facts.length,
            itemBuilder: (context, index) {
              return Center( // Center the text vertically
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: dim.width(2)),
                  child: Text(
                    _facts[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: dim.width(3.8),
                      color: primaryTextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              );
            },
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
          ),
        ),

        const Spacer(),

        // --- Schedule Pickup Button ---
        Padding(
          padding: EdgeInsets.only(bottom: dim.height(4)),
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: Handle scheduling action
            },
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            label: Text(
              'Schedule Waste Pickups',
              style: TextStyle(fontSize: dim.width(4), color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF669D31), // Green
              minimumSize: Size(dim.width(80), dim.height(7)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(dim.width(3)),
              ),
              elevation: dim.width(1.2),
            ),
          ),
        ),
      ],
    ),
  );
  }
}