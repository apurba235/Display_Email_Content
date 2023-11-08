List<MailListTileModel> items = [
  MailListTileModel(
    leadingText: 'H',
    sender: 'Happilo',
    titleText: 'Thank you for your purchase!',
    subTitleText:
    'Hi Sparks, we\'re getting your order ready to be shipped. We will notify you when it has been sent.',
  ),
  MailListTileModel(
    leadingText: 'H',
    sender: 'Hopscotch',
    titleText: 'Order Shipped',
    subTitleText:
    'Dear PremierMonk, We are pleased to inform you that your Hopscotch order is on its way! We have packed it with care & couriered it.',
  ),
  MailListTileModel(
    leadingText: 'N',
    sender: 'Noise',
    titleText: 'Order Shipped',
    subTitleText: 'THANK YOU FOR PLACING YOUR ORDER WITH US. Your order number: 2343881 has been confirmed.',
  )
];

class MailListTileModel {
  String leadingText;
  String sender;
  String titleText;
  String subTitleText;

  MailListTileModel(
      {required this.leadingText, required this.sender, required this.titleText, required this.subTitleText});
}