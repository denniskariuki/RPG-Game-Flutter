import 'package:flutter/material.dart';
import 'package:rpg_game/shared/styled_text.dart';

import '../../models/character.dart';
import '../../theme.dart';


class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [

          // available points
          Container(
              color: AppColors.secondaryColor,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(Icons.star,
                    color: widget.character.points > 0 ? Colors.yellow : Colors.grey,
                  ),
                  const SizedBox(width: 20),
                  const StyledText('Stat points available:'),
                  const Expanded(child: SizedBox()),
                  StyledHeading(widget.character.points.toString())
                ],
              )
          ),

          // stats table
          Table(
            children: widget.character.statsAsFormattedList.map((stat) {
              final title = stat['title'] ?? 'Unknown'; // Provide a default value if null
              final value = stat['value'] ?? '0'; // Provide a default value if null

              return TableRow(
                decoration: BoxDecoration(color: AppColors.secondaryColor.withOpacity(0.5)),
                children: [
                  // stat title (e.g. health)
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StyledHeading(title), // Using the title safely
                    ),
                  ),

                  // stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StyledHeading(value), // Using the value safely
                    ),
                  ),

                  // icon to increase stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward, color: AppColors.textColor),
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(value);
                        });
                      },
                    ),
                  ),

                  // icon to decrease stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: GestureDetector(
                      child: Icon(Icons.arrow_downward, color: AppColors.textColor),
                      onTap: () {
                        setState(() {
                          widget.character.decreaseStat(value);
                        });
                      },
                    ),
                  ),

                ],
              );
            }).toList(),
          ),

        ],
      ),
    );
  }
}