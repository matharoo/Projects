
public class BettingMoney {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] amounts = {200,300,100};
		int[] centsPerDollar =  {10,10,10};
		BettingMoney b = new BettingMoney();
		System.out.println("When Victory decision is 1, Net profit of the day is: "+b.moneyMade(amounts, centsPerDollar, 1));
		System.out.println("When Victory decision is 2, Net profit of the day is: "+b.moneyMade(amounts, centsPerDollar, 2));
		System.out.println("When Victory decision is draw, Net profit of the day is: "+b.moneyMade(amounts, centsPerDollar, 0));
		System.out.println("When Victory decision is 3, Net profit of the day is: "+b.moneyMade(amounts, centsPerDollar, 3));
	}
	
	public int moneyMade(int[] amounts, int[] centsPerDollar, int finalResult){
		int sum=0;
		if(finalResult<amounts.length){
			for(int i=0; i<amounts.length; i++){
				if(i!=finalResult) sum= sum + amounts[i];
			}
			return sum*100-amounts[finalResult]*centsPerDollar[finalResult];
		}
		return 0;
	}

}
