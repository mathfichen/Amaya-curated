//  Eratosthenes Sieve prime number benchmark in Java

public class Sieve {

  static String results1, results2;

  public static void main(String[] args) {
     System.out.println("Running Sieve benchmark.");
     System.out.println("This will take about 10 seconds.");
     runSieve();
     System.out.println(results1);
     System.out.println(results2);
  }

  static void runSieve() {
     int SIZE = 8190;
     boolean flags[] = new boolean[SIZE+1];
     int i, prime, k, iter, count;
     int iterations = 0;
     double seconds = 0.0;
     int score = 0;
     long startTime, elapsedTime;

     startTime = System.currentTimeMillis();
     while (true) {
        count=0;
        for(i=0; i<=SIZE; i++) flags[i]=true;
        for (i=0; i<=SIZE; i++) {
           if(flags[i]) {
              prime=i+i+3;
              for(k=i+prime; k<=SIZE; k+=prime)
                 flags[k]=false;
              count++;
           }
        }
        iterations++;
        elapsedTime = System.currentTimeMillis() - startTime;
        if (elapsedTime >= 10000) break;
     }
     seconds = elapsedTime / 1000.0;
     score = (int) Math.round(iterations / seconds);
     results1 = iterations + " iterations in " + seconds + " seconds";
     if (count != 1899)
        results2 = "Error: count <> 1899";
     else
        results2 = "Sieve score = " + score;
  }
}
