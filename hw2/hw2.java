package hw2;

//Michael Masterson
//E00942993
//Ranjan Chaudhuri
//COSC 221 Sec.1
//Fall 2014
//September 18, 2014
//a)convert a signed decimal number between -128 and +127 to its 8-bit binary representation in the two's complement number system.
//b)convert an 8-bit binary number(string) in the two's complement number system to its signed decimal value(no spaces allowed in the
//input binary string)This is a program that can read and print binary to decimal and vice versa with a menu.
//------------------------------------------------------------------------------------------------------------------------


import java.util.Scanner;

public class hw2 
{
	private static Scanner scanNum;

	public static void comp (int[]numsplit) //two complementary
	{
		if(numsplit[0] == 1) 
		{
			for(int m =7; m>=0;m--)
			{
				if(numsplit[m]==0) numsplit[m]=1;
				else
					numsplit[m]=0;
			}
			for (int j =7; j>=0;j--)
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
	}

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
			int num = scanNum.nextInt();

			if(num == 1)
			{
				System.out.println("Enter binary:");
				String s = scanNum.next();
				int decval=0;
				int count =0;

				for (int i=0; i < 8; i++)
				{   
					char c= s.charAt(i);
					numsplit[i] = c - 48;
				}
				int i=0;

				//if (numsplit[0]==1)
				//{
				comp(numsplit);

				for(int j = 0, k = 7; k>0; j++,k--) //raise to power.
					i = i + (int)(numsplit[k]*Math.pow(10, j));

				while (i > 0) //converting to decimal
				{     
					numsplit[count]=( i % 10);
					if(numsplit[count]!=1 && numsplit[count] !=0)
					{
						System.out.println("Please Enter a correct binary number!");
						main(null);
					}				
					count++; 
					i = i / 10;
				}

				for(int count2 = 0;count2<8;count2++)
				{
					if(numsplit[count2]==1)
					{
						decval=decval+posnumarr[count2];
					}
				}

				System.out.print("The Binary Equalivant is: -" + decval);
				System.out.println();

			}
			/*else
					while (i > 0) //converting to decimal
					{     
						numsplit[count]=( i % 10);
						if(numsplit[count]!=1 && numsplit[count] !=0)
						{
							System.out.println("Please Enter a correct binary number!");
							main(null);
						}				
						count++; 
						i = i / 10;
					}

					for(int count2 = 0;count2<8;count2++)
					{
						if(numsplit[count2]==1)
						{
							decval=decval+posnumarr[count2];
						}
					}
					System.out.print("The Binary Equalivant is: " + decval);
					System.out.println();
			}*/

			if(num == 2)
			{
				System.out.println("Enter decimal:");
				int number2 = scanNum.nextInt();
				int index =0;

				comp(numsplit);

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

			if(num == 3) //will exit program when selected in menu
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
01010101
The Binary Equalivant is: -213
Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
2
Enter decimal:
23
The Binary is: 
00010111

Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
2
Enter decimal:
-23
The Binary is: 
000-10-1-1-1

Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit
1
Enter binary:
11110011
The Binary Equalivant is: -189
Enter 1 to convert binary to decimal
Enter 2 to convert decimal to binary
Enter 3 to quit*/