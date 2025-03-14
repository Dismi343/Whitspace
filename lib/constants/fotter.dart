import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";

class Fotter extends StatelessWidget {
  const Fotter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(color: Colors.grey[600], thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Terms & Conditions - ",
                  style: GoogleFonts.poppins(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Click here",
                    style: GoogleFonts.poppins(
                      color: primaryYellow,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
