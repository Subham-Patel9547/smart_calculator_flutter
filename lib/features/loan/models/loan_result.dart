class LoanResult {
  final double monthlyEmi;
  final double totalInterest;
  final double totalPayment;
  final double interestPercentage;

  LoanResult({
    required this.monthlyEmi,
    required this.totalInterest,
    required this.totalPayment,
    required this.interestPercentage,
  });
}