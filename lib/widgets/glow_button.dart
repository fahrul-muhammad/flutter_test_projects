import 'package:flutter/material.dart';

class GlowButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;

  const GlowButton({
    super.key,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: isEnabled
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF4FE3C1),
                    Color(0xFF3B82F6),
                  ],
                )
              : const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF4FE3C1),
                    Color(0xFF3B82F6),
                  ],
                ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                    color:
                        // ignore: deprecated_member_use
                        const Color(0xFF3B82F6).withOpacity(0.5),
                    blurRadius: 20, // Efek blur glow
                    spreadRadius: 1,
                  ),
                ]
              : null, // Tidak ada efek glow jika tombol disabled
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: isEnabled ? onPressed : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                color: isEnabled ? Colors.white : Colors.white54, // Warna teks
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
