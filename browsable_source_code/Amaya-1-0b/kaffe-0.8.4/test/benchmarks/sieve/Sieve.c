static char results1[100];
static char results2[100];

static void runSieve(void);

main(int argc, char* argv)
{
     printf("Running Sieve benchmark.\n");
     printf("This will take about 10 seconds.\n");
     runSieve();
     printf(results1);
     printf(results2);
}

static
void
runSieve()
{
     int SIZE = 8190;
     char flags[SIZE+1];
     int i, prime, k, iter, count;
     int iterations = 0;
     double seconds = 0.0;
     int score = 0;
     long startTime, elapsedTime;

     time(&startTime);
     while (1) {
        count=0;
        for(i=0; i<=SIZE; i++) flags[i]=1;
        for (i=0; i<=SIZE; i++) {
           if(flags[i]) {
              prime=i+i+3;
              for(k=i+prime; k<=SIZE; k+=prime)
                 flags[k]=0;
              count++;
           }
        }
        iterations++;
	time(&elapsedTime);
        elapsedTime -= startTime;
        if (elapsedTime >= 10) break;
     }
     seconds = elapsedTime;
     score = (int) (iterations / seconds);
     sprintf(results1, "%d iterations in %f seconds\n", iterations, seconds);
     if (count != 1899)
        sprintf(results2, "Error: count <> 1899\n");
     else
        sprintf(results2, "Sieve score = %d\n", score);
}
