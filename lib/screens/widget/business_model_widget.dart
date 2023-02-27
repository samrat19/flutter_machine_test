import 'package:flutter/material.dart';
import '../../model/availability_response_model.dart';

class BusinessModelWidget extends StatelessWidget {
  final Listed item;

  const BusinessModelWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 10 / 375,
        vertical: width * 6 / 375,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(width * 8 / 375)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //todo business details
          businessDetailsWidget(context),
          //todo business location
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: width * 10 / 375,
            ),
            child: Text(
              'Location: ${item.address!}',
              style: TextStyle(
                fontSize: width * 14 / 375,
                color: Colors.blue[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //todo business time slot
          if(item.timeAvailable!.isNotEmpty)
            Text(
              'Select Time Slot: ',
              style: TextStyle(
                fontSize: width * 15 / 375,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          if(item.timeAvailable!.isNotEmpty)
            SizedBox(
              height: width * 10 / 375,
            ),
          Wrap(
            runSpacing: 10,
            spacing: 5,
            children: [
              ...item.timeAvailable!.map((e) => timeWidget(context,e)).toList(),
            ],
          ),
          if(item.timeAvailable!.isNotEmpty)
            SizedBox(
              height: width * 40 / 375,
            ),
        ],
      ),
    );
  }

  Widget businessDetailsWidget(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //todo business logo
        Container(
          height: width * 100 / 375,
          width: width * 100 / 375,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                item.image!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: width * 10 / 375,
        ),
        //todo business name and details
        Expanded(
          flex: 7,
          child: SizedBox(
            height: width * 90 / 375,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.businessName!,
                  style: TextStyle(
                    fontSize: width * 17 / 375,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: width * 10 / 375,
                ),
                Text(
                  item.description!,
                  style: TextStyle(
                    fontSize: width * 15 / 375,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
        //todo business rating
        Flexible(
          flex: 2,
          child: SizedBox(
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  '${item.rating!}/5',
                  style: TextStyle(
                    fontSize: width * 17 / 375,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget timeWidget(BuildContext context,TimeAvailable timeAvailable) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 2,
        ),
        child: Text(
          timeAvailable.time!,
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 14 / 375,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}