import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  TextEditingController _reviewController = TextEditingController();
  double _currentRating = 0.0;
  List<double> _ratings = [];
  List<String> _reviews = [];

  void _submitRating() {
    setState(() {
      _ratings.add(_currentRating);
      _reviews.add(_reviewController.text);
      _currentRating = 0.0;
      _reviewController.clear();
    });
  }

  double _calculateAverageRating() {
    if (_ratings.isEmpty) {
      return 0.0;
    } else {
      double totalRating = _ratings.reduce((value, element) => value + element);
      return totalRating / _ratings.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[50],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Rating & Review',
          style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: RatingBar.builder(
              initialRating: _calculateAverageRating(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star_rate_rounded,
                color: Colors.amberAccent,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _currentRating = rating;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "You have ${_ratings.length} ratings and ${_calculateAverageRating().toStringAsFixed(1)} average rating",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${_ratings.length}",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Total Rating",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _calculateAverageRating().toStringAsFixed(1),
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Average",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 5,
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Write your experience here",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Give your rating:',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 4.0),
                              Center(
                                child: RatingBar.builder(
                                  initialRating: _currentRating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    setState(() {
                                      _currentRating = rating;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'Leave your feedback:',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 8.0),
                              TextField(
                                controller: _reviewController,
                                decoration: InputDecoration(
                                  hintText: 'Leave your review',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 3,
                              ),
                              SizedBox(height: 20.0),
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.pinkAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _submitRating();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.91,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Write your review here",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.comment,
                          size: 16,
                          color: Colors.grey.shade600,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "User review",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _ratings.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amberAccent,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rating: ${_ratings[index]}',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Review: ${_reviews[index]}',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      ),
    );
  }
}
