package hw3;

//Michael Masterson
//E00942993
//Ranjan Chaudhuri
//COSC 221 Sec.1
//Fall 2014
//Lab #3
//September 25, 2014
//a)convert a signed decimal number between -128 and +127 to its 8-bit binary representation in the two's complement number system.
//b)convert an 8-bit binary number(string) in the two's complement number system to its signed decimal value(no spaces allowed in the
//input binary string)This is a program that can read and print binary to decimal and vice versa with a menu.
//------------------------------------------------------------------------------------------------------------------------


import java.util.Scanner;

public class hw3 
{
	private static Scanner scanNum;

	public static void two (int[]numsplit) //two complementary,flip and add 1
	{ 
		for(int m =7; m>=0;m--)
		{
			if(numsplit[m]==0) numsplit[m]=1;
			else
				numsplit[m]=0;
		}
		for (int j =7; j>=0;j--)//flip and add one
		{
			int z=numsplit[j]+1;
			if(z==1)
			{
				numsplit[j]=1;
				break;
			}
			else
			{
				numsplit[j]=0;
			}
		}
	}

	public static int bintodec (int[]numsplit) //binary to decimal

	{
		boolean negative= false;
		int decval=0;

		if(numsplit[0]==1)
		{	
			two(numsplit);
			negative=true;
		}
		int power=128;

		for(int count2 = 0;count2<8;count2++)
		{
			if(numsplit[count2]==1)
			{
				decval=decval*power;
				power=power/2;
			}
		}
		if (negative)
		{
			decval=-decval;
		}
		return decval;
	}

	public static int[] addition (int[]numsplit, int[]numsplit2)
	{
		int[] carry = {0,0,0,0,0,0,0,0};
		int[] sum = {0,0,0,0,0,0,0,0};

		for (int e=7; e>=0; e--) //carry, num, one 
		{
			int b = numsplit[e]+numsplit2[e]+carry[e];
			switch(b)
			{
			case 0:
				sum[e]=0;
				if (e>0) carry[e-1]=0;
				System.out.println(b);
				break;
			case 1:
				sum[e]=1;
				if (e>0) carry[e-1]=0;
				System.out.println(b);
				break;
			case 2:
				sum[e]=0;
				if (e>0) carry[e-1]=1;
				System.out.println(b);
				break;
			case 3:
				sum[e]=1;
				if (e>0) carry[e-1]=1;
				System.out.println(b);
				break;
			}	
		}
		return sum;
	}

	public static void main (String[] args)
	{
		int[] numsplit = new int [8];
		int[] numsplit2 = new int[8];
		int[] sum = {0,0,0,0,0,0,0,0};
		scanNum = new Scanner(System.in);
		while (true)
		{
			System.out.println("Enter 1 to add");
			System.out.println("Enter 2 to subtract");
			System.out.println("Enter 3 to quit");
			int select = scanNum.nextInt();

			if(select == 1) //Addition
			{
				System.out.println("What do you want to add:");
				String s = scanNum.next();
				System.out.println("number2: ");
				String s2 = scanNum.next();

				for (int i=0; i < 8; i++) //1st number
				{   
					char c= s.charAt(i);
					char c2 = s2.charAt(i);
					numsplit[i] = c - 48;
					numsplit2[i] = c2- 48;
				}

				sum=addition(numsplit, numsplit2);	
			}

			System.out.print("The total is: ");
			for (int i=0; i<=7;i++)
			{
				System.out.print(sum[i]);
			}
			
			
			System.out.println();

			if(select == 2) //Subtraction
			{
				System.out.println("What do you want to subtract:");
				String s = scanNum.next();
				System.out.println("number2: ");
				String s2 = scanNum.next();

				for (int i=0; i < 8; i++) //1st number
				{   
					char c= s.charAt(i);
					char c2 = s2.charAt(i);
					numsplit[i] = c - 48;
					numsplit2[i] = c2- 48;
				}

				two(numsplit);
				sum=addition(numsplit, numsplit2);
			}

			System.out.print("The total is: ");
			for (int i=0; i<=7;i++)
			{
				System.out.print(sum[i]);
			}
			System.out.println();

			if(select == 3) //will exit program when selected in menu
			{
				break;
			}
		}
	}
}