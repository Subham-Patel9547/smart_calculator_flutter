import '../model/emi_result.dart';

class EmiCalculator {

  static EmiResult calculate({
    required double principal,
    required double annualRate,
    required int tenureMonths,
  }) {

    double monthlyRate = annualRate / 12 / 100;

    double emi;

    if (monthlyRate == 0) {
      emi = principal / tenureMonths;
    } else {

      emi = principal *
          monthlyRate *
          (1 + monthlyRate) *
          tenureMonths /
          (((1 + monthlyRate) * tenureMonths) - 1);
    }


    double totalPayment = emi * tenureMonths;

    double totalInterest =
        totalPayment - principal;


    return EmiResult(
      monthlyEmi: emi,
      totalInterest: totalInterest,
      totalPayment: totalPayment,
    );
  }
}