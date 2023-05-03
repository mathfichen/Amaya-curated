class simple
{

  public static void main(String[] args)
    {
      byte[] bptr = new byte[16];
      byte[] bcpy = null;

      try {
         bcpy = (byte [])bptr.clone();
      } catch (CloneNotSupportedException cnse) {
         System.out.println("cloning not supported...");
      }

      System.out.println("bcpy has size <" + bcpy.length + ">.");
      System.out.println("bcpy[0] is <" + bcpy[0] + ">.");
      System.out.println("Finished.\n");

      System.exit(0);
    }
}
