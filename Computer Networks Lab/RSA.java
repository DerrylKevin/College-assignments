
import java.util.Scanner;
public class RSA
{ public static int mult(int x, int y, int n)
{ int k = 1;
int j;
for (j = 1; j <= y; j++)
k = (k * x) % n;
return k;
}
public static int gcd(int m, int n)
{ if (n == 0)
return m;
else
return (gcd(n, m % n));
}
public static void main(String[] args)
{
int msg, plainText, cipherText;
int n, d = 0, e, z, p, q, i;
Scanner scanner = new Scanner(System.in);
System.out.print("Enter the value of Primes p and q : ");
p = scanner.nextInt();
q = scanner.nextInt();
System.out.print("Enter message less than or equal to ((p*q)-2): ");
msg = scanner.nextInt();
n = p * q;
z = (p - 1) * (q - 1);
do
{ System.out.print("Choose the value of e (e>2) such that gcd(z,e)=1: ");
e = scanner.nextInt();
} while (gcd(z, e) != 1);

i = 2;
while (((i * e) % z) != 1)
{ i++;
d = i;
}
System.out.println("The public Key Pair is (" + e + "," + n + ")");
System.out.println("The private Key Pair is (" + d + "," + n + ")");
cipherText = mult(msg, e, n);
System.out.println("Cipher Text = " + cipherText);
plainText = mult(cipherText, d, n);
System.out.println("Plain Text = "+ plainText);
}
}