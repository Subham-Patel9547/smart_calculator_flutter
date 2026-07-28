import '../models/loan_result.dart';

class LoanCalculator {
  static LoanResult calculate({
    required double principal,
    required double annualRate,
    required int years,
  }) {

    double monthlyRate = annualRate / 12 / 100;

    int months = years * 12;

    double emi = principal *
        monthlyRate *
        (1 + monthlyRate) *
        months /
        ((1 + monthlyRate) * months - 1);


    double totalPayment = emi * months;

    double totalInterest = totalPayment - principal;


    double interestPercentage =
        (totalInterest / principal) * 100;


    return LoanResult(
      monthlyEmi: emi,
      totalInterest: totalInterest,
      totalPayment: totalPayment,
      interestPercentage: interestPercentage,
    );
  }
}