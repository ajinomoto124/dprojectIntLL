module intlisttest;
import std.stdio;

void main(){
}

class IntegerLinkedList{

    Node hed;
    int seze;

    this(){
        hed = new Node();
        seze = 0;
    }

    public void insert(int index, int element){
        Node temp = new Node(element);
        Node current = hed;

	   for(int i = 0; i < index && current.getNext()!is null; ++i){
		  current = current.getNext();
	   }

	   temp.setNext(current.getNext());
	   current.setNext(temp);
	   seze++;
    
    }

    public int remove(int index){
        Node current = hed;
        int temp;
        if(index > seze || index <0){
            return -1;
        }

        for(int i = 0; i < (index) && current.getNext()!is null; ++i){
          current = current.getNext();
        }
        temp = current.getNext().getValue();
        current.setNext(current.getNext().getNext());
        seze--;
        return temp;
    }
    
    public int get(int index){
    	if (index <0)
	    return -1;

        Node current = hed.getNext();
        for(int i = 0; i < index; ++i){
		
            if(current.getNext() is null){
                return -1;
            }

		current = current.getNext();
	}

	return current.getValue();
    }

    public int size(){
        return seze;
    }

    public int head(){
        return hed.getNext().getValue();
    }

    public int tail(){
        Node current = hed;
        for(int i = 0; current.getNext()!is null; ++i){
          current = current.getNext();
        }
        return current.getValue();
    }


}

class Node{
    Node next;

    int value;

    this(){
        next = null;
    }
    this(int number){
        next = null;
        value = number;
    }

    this(int number, Node nextNode){
    	next = nextNode;
        value = number;
    }

    int getValue(){
        return value;
    }
	
    void setValue(int number){
    	value = number;
    }

    Node getNext(){
    	return next;
    }
    void setNext(Node nextNode){
    	next = nextNode;
    }
}
