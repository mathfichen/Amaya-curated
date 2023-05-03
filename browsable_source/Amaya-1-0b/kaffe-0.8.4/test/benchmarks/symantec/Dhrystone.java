class Dhrystone
   extends Test
{
    public static final int ident1 = 0;
    public static final int ident2 = 1;
    public static final int ident3 = 2;
    public static final int ident4 = 3;
    public static final int ident5 = 4;

    private RecordType recordGlob;
    private RecordType nextRecordGlob;
    private RecordType firstRecord;
    private RecordType secondRecord;
    private int        intGlob;
    private boolean    boolGlob;
    private char       charGlob1;
    private char       charGlob2;
    private int []     arrayGlob1;
    private int [][]   arrayGlob2;
    private long       numberOfExecutions;
    private long       numberOfRuns;

    public Dhrystone()
    {
        super("Dhrystone");
    }

    public void setData(long execs, long runs)
    {
        numberOfExecutions = execs;
        numberOfRuns       = runs;
        firstRecord        = new RecordType();
        secondRecord       = new RecordType();
        arrayGlob1         = new int[128];
        arrayGlob2         = new int[128][128];
    }

    public final void performTest()
    {
        int    intLoc1;
        int    intLoc2;
        int    intLoc3;
        int    intLoc3Ref[];
        int    intLoc1Ref[];
        char   charIndex;
        int    enumLoc[];
        String stringLoc1;
        String stringLoc2;
        int    runIndex;
        int    measIndex;

        intLoc3Ref = new int[1];
        intLoc1Ref = new int[1];
        enumLoc    = new int[1];

        nextRecordGlob        = secondRecord;
        recordGlob            = firstRecord;
        recordGlob.recordComp = nextRecordGlob;
        recordGlob.discr      = ident1;
        recordGlob.enumComp   = ident3;
        recordGlob.intComp    = 40;
        recordGlob.stringComp = "DHRYSTONE PROGRAM, SOME STRING";
        stringLoc1            = "DHRYSTONE PROGRAM, 1'ST STRING";

        for(runIndex = 1; runIndex <= numberOfRuns; ++runIndex)
        {
            for(measIndex = 1; measIndex <= numberOfExecutions; ++measIndex)
            {
                proc5();
                proc4();

                intLoc1 = 2;
                intLoc2 = 3;

                stringLoc2 = "DHRYSTONE PROGRAM, 2'ND STRING";

                enumLoc[0] = ident2;
                boolGlob = !func2(stringLoc1, stringLoc2);

                while(intLoc1 < intLoc2)
                {
                    intLoc3Ref[0] = 5 * intLoc1 - intLoc2;
                    proc7(intLoc1, intLoc2, intLoc3Ref);
                    intLoc1 += 1;
                }

                intLoc3 = intLoc3Ref[0];
                proc8(arrayGlob1, arrayGlob2, intLoc1, intLoc3);
                proc1(recordGlob);

                for(charIndex = 'A'; charIndex <= charGlob2; ++charIndex)
                {
                    if(enumLoc[0] == func1(charIndex, 'C'))
                    {
                        proc6(ident1, enumLoc);
                    }
                }

                intLoc3 = intLoc2 * intLoc1;
                intLoc2 = intLoc3 / intLoc1;
                intLoc2 = 7 * (intLoc3 - intLoc2) - intLoc1;

                intLoc1Ref[0] = intLoc1;
                proc2(intLoc1Ref);
                intLoc1 = intLoc1Ref[0];
            }
        }
    }


    private final void proc1(RecordType pointerParVal)
    {
        RecordType nextRecord = pointerParVal.recordComp;

        pointerParVal.recordComp = recordGlob;
        pointerParVal.intComp = 5;

        nextRecord.intComp = pointerParVal.intComp;
        nextRecord.recordComp = pointerParVal.recordComp;
        proc3(nextRecord.recordComp);

        int [] intRef;

        intRef = new int[1];

        if(nextRecord.discr == ident1)
        {
            nextRecord.intComp = 6;
            intRef[0] = nextRecord.enumComp;
            proc6(pointerParVal.enumComp, intRef);
            nextRecord.enumComp = intRef[0];
            nextRecord.recordComp = recordGlob.recordComp;
            intRef[0] = nextRecord.intComp;
            proc7(nextRecord.intComp, 10, intRef);
            nextRecord.intComp = intRef[0];
        }
        else
        {
            pointerParVal = pointerParVal.recordComp;
        }
    }


    private final void proc2(int intParRef[])
    {
        int intLoc;
        int enumLoc;

        intLoc = intParRef[0] + 10;
        enumLoc = 0;

        do
        {
            if(charGlob1 == 'A')
            {
                intLoc -= 1;
                intParRef[0] = intLoc - intGlob;
                enumLoc = ident1;
            }
        }
        while(enumLoc != ident1);
    }


    private final void proc3(RecordType pointerParRef)
    {
        if(recordGlob != null)
        {
            pointerParRef = recordGlob.recordComp;
        }
        else
        {
            intGlob = 100;
        }

        int [] intCompRef;

        intCompRef = new int[1];

        intCompRef[0] = recordGlob.intComp;
        proc7(10, intGlob, intCompRef);
        recordGlob.intComp = intCompRef[0];
    }


    private final void proc4()
    {
        boolean boolLoc;

        boolLoc = charGlob1 == 'A';
        boolLoc = boolLoc || boolGlob;
        charGlob2 = 'B';
    }


    private final void proc5()
    {
        charGlob1 = 'A';
        boolGlob = false;
    }


    private final void proc6(int enumParVal, int enumParRef[])
    {
        enumParRef[0] = enumParVal;

        if(!func3(enumParVal))
        {
            enumParRef[0] = ident4;
        }

        switch(enumParVal)
        {
            case ident1:
                enumParRef[0] = ident1;
                break;

            case ident2:
                if(intGlob > 100)
                {
                    enumParRef[0] = ident1;
                }
                else
                {
                    enumParRef[0] = ident4;
                }
                break;

            case ident3:
                enumParRef[0] = ident2;
                break;

            case ident4:
                break;

            case ident5:
                enumParRef[0] = ident3;
                break;
        }
    }


    static void proc7(int intParVal1, int intParVal2, int intParRef[])
    {
        int intLoc;

        intLoc        = intParVal1 + 2;
        intParRef[0] = intParVal2 + intLoc;
    }


    private final void proc8(int [] arrayPar1Ref, int [][] arrayPar2Ref, int intParVal1, int intParVal2)
    {
        int intIndex;
        int intLoc;

        intLoc = intParVal1 + 5;
        arrayPar1Ref[intLoc] = intParVal2;
        arrayPar1Ref[intLoc+1] = arrayPar1Ref[intLoc];
        arrayPar1Ref[intLoc+30] = intLoc;

        for(intIndex = intLoc; intIndex <= intLoc + 1; ++intIndex)
        {
            arrayPar2Ref[intLoc][intIndex] = intLoc;
        }

        arrayPar2Ref[intLoc][intLoc - 1] += 1;
        arrayPar2Ref[intLoc + 20][intLoc] = arrayPar1Ref[intLoc];
        intGlob = 5;
    }


    private final int func1(char charPar1Val, char charPar2Val)
    {
        char charLoc1;
        char charLoc2;

        charLoc1 = charPar1Val;
        charLoc2 = charLoc1;

        if(charLoc2 != charPar2Val)
        {
            return ident1;
        }

        return ident2;
    }


    private final boolean func2(String stringPar1Ref, String stringPar2Ref)
    {
        int intLoc;
        char charLoc = '\0';

        intLoc = 2;

        while(intLoc <= 2)
        {
            if(func1(stringPar1Ref.charAt(intLoc), stringPar2Ref.charAt(intLoc + 1)) == ident1)
            {
                charLoc = 'A';
                intLoc += 1;
            }
        }

        if(charLoc >= 'W' && charLoc < 'Z')
        {
            intLoc = 7;
        }

        if(charLoc == 'X')
        {
            return true;
        }

        if(stringPar1Ref.compareTo(stringPar2Ref) > 0)
        {
            intLoc += 7;

            return true;
        }

        return false;
    }


    private final boolean func3(int enumParVal)
    {
        int enumLoc;

        enumLoc = enumParVal;

        if(enumLoc == ident3)
        {
            return true;
        }

        return false;
    }
}


class RecordType
{
    RecordType recordComp;
    int        discr;
    int        enumComp;
    int        intComp;
    String     stringComp;
    int        enumComp2;
    String     stringComp2;
    char       charComp1;
    char       charComp2;
}