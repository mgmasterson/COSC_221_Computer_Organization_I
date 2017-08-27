package hw1;

//Michael Masterson
//E00942993
//Ranjan Chaudhuri
//COSC 221 Sec.1
//Fall 2014
//September 9, 2014
//This is a program that can read and print binary to decimal and vice versa with a menu.
//KNOWN ISSUES: posnummarr should have been computed programmatically. binary must have been read as string.

import java.util.Scanner;

public class hw1b 
{
	private static Scanner scanNum;

	public static void main (String[] args) 
	{
		int [] posnumarr= {1,2,4,8,16,32,64,128};
		int[] numsplit = new int [8];
		scanNum = new Scanner(System.in);



		while (true)
		{
			System.out.println("Enter 1 to convert binary to decimal");
			System.out.println("Enter 2 to convert decimal to binary");
			System.out.println("Enter 3 to quit");
			int number = scanNum.nextInt();

			if(number == 1)
			{
				System.out.println("Enter binary:");
				int number1 = scanNum.nextInt();
				int decval=0;
				int count=0;

				while (number1 > 0) //converting to decimal
				{     
					numsplit[count]=( number1 % 10);
					if(numsplit[count]!=1 && numsplit[count] !=0)
					{
						System.out.println("Please Enter a correct binary number!");

						main(null);
					}				count++; 
					number1 = number1 / 10;
				}

				for(int count2 = 0;count2<8;count2++)
				{
					if(numsplit[count2]==1)
					{
						decval=decval+posnumarr[count2];
					}
				}

				System.out.print("The Binary Equalivant is: " +decval);
				System.out.println();
			}

			if(number == 2)
			{
				System.out.println("Enter decimal:");
				int number2 = scanNum.nextInt();
				int index =0;

				while(index < 8)  //converting to binary
				{
					numsplit[index++] = number2 % 2;
					number2 = number2 /2;
				}
				System.out.println("The Binary is: ");
				for (int i=index - 1; i>=0;i--)
				{
					System.out.print(numsplit[i]);
				}
				System.out.println();
				System.out.println();
			}

			if(number == 3) //will exit program when selected in menu
			{
				break;
			}
		}
		System.out.println("End of program");
	}
}
/*Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
1
Enter binary:
10101010
The Binary Equalivant is: 170
Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
2
Enter decimal:
13
The Binary is: 
00001101

Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
1
Enter binary:
00001101
The Binary Equalivant is: 13
Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
1
Enter binary:
11111111
The Binary Equalivant is: 255
Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
2
Enter decimal:
225
The Binary is: 
11100001

Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
2
Enter decimal:
255
The Binary is: 
11111111

Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
3
End of program*/