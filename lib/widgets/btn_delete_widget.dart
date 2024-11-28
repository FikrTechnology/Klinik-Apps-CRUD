part of 'widgets.dart';

class BtnDelete extends StatelessWidget {
  final String buttonText;
  final VoidCallback onConfirm;
  final Color backgroundColor;
  final Color textColor;

  const BtnDelete({
    super.key,
    required this.buttonText,
    required this.onConfirm,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.white,
  });

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        contentText: 'Yakin ingin menghapus data ini?',
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showConfirmationDialog(context),
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final String contentText;
  final VoidCallback onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.contentText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(contentText),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                onConfirm();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('YA', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Tidak', style: TextStyle(color: Colors.white)),
            ),
          ],
        )
      ],
    );
  }
}
