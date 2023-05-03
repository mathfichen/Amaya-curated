// JAVA version 

import java.io.*;




// Just to spice things up a bit ..

class MyObject {
        public int isObject() { return 1; }
}



class Token extends MyObject {
        String type ;
        String value ;


        public Token( String t , String v ){
                        type = t ;
                        value = v;
        }
        public String asText() {
                return "type: " + type + ";" + "value: " + value ; 
        }
}




// Simple List class


class ListNode {
        Token           token;
        ListNode        next;

        public ListNode( Token t ){
                token = t ;
                next = null;
        }
}


class List extends Object {
        ListNode        head ;
        ListNode        tail;

        public List() {
                head = null ;
                tail = null;
        }
        public void put( Token t) {
                ListNode        node = new ListNode( t ) ;
                
                //System.out.println("putting " + t.asText() );

                if( head == null || tail == null){
                        
                        head = node ;
                        tail = node ;
                }
                else {
                        // THIS CRASHES on 1554 nodes !!!
                        tail.next = node;
                        tail = node ;
                }
        }

        public Token get( ) {
                if( head == null )
                        return null ;

                ListNode node = head;
                head = head.next ;

                if( head == null )
                        tail = null ;

                return node.token ;
        }
}

                        
// Do It 

class java_class {

        static void doit() {

                List    list = new List();
                Token token;

        // Changing the 2000 to a 1000  fixes problem !
                // Actually any value < 1554 works fine !
                for( int i = 0 ; i < 2000 ; i++ ){

                        token = new Token( "some_type" , i  + "" ); 
                        int random = token.isObject();

                        list.put( token );
                        token = null;
                }
                        

                while( (token = list.get()) != null  ){
                        System.out.println( token.asText() );
                }

        }
        public static void main(String args[]){
                System.out.println("main");
                for( int i = 0 ; i < 100 ; i++ )
                        doit();
        }

}
