import 'package:apifinal/constant/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommingSoon extends StatelessWidget {
  final String posterPath;
  final String overView;
  final String title;
  final String date;
  const CommingSoon({
    super.key, 
    required this.posterPath, 
    required this.overView, 
    required this.title, required this.date
    });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime=DateTime.parse(date);
    String month = DateFormat('MMM').format(dateTime);
    String day=DateFormat('dd').format(dateTime);


    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),

                Text(month,style: TextStyle(fontSize: 30),),
                Text(
                  day,
                  style: const TextStyle(fontSize: 30, letterSpacing: 5),
                )


              ],
            ),
            ), Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('$imageurl$posterPath'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 199,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notification_add_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Remind me',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.info,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Info',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coming on $month $day",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    overView,
                    maxLines: 5,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          )),
            const SizedBox(
            width: 10,
          ),

        ],
      ),
    );
  }
}