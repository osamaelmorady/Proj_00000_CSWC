#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <iostream>
#include <cstdlib>



// how to implement a queue

const int QUEUE_MAX_SIZE =  10 ;


template <class Data_t>
class Queue
{
    private :

    struct Node
    {
        Data_t  data ;

        Node * next ;
    } ;

    Node * front;
    Node *  rear ;

    int size ;

    public:
    Queue() : rear (nullptr), front (nullptr),size (0) 
    {}

    bool is_empty(void) const
    {  
        return (front == nullptr) && (rear ==nullptr) ;
    }
    bool is_full(void) const
    {  
        return size == QUEUE_MAX_SIZE ;
    } 
    bool Enqueue(int variable)
    {  
        if (is_full())
            return false ;
        
        Node * tempPtr = new Node {variable,nullptr} ;

        if ((front == nullptr) && (rear ==nullptr))
        {
            front = rear = tempPtr ;
            size ++ ;
        }
        else
        {
            rear -> next = tempPtr ;
            rear = tempPtr ;
            size ++ ;
        }


        return true ;


    }
    bool Dequeue(int &variable)
    {  
        if (is_empty())
            return false ;

        Node * tempPtr = front ;

        variable = front->data ;

        front = front ->next ;

        if (front == nullptr)
        {
            rear = nullptr ;
        }

        delete tempPtr ;
 
        return true ;

    }


    void print(void)
    {
        std::cout << "All variables are  : [ " ;

        Node * current = front ;

        while ( current != nullptr )
        {
           std::cout << current->data << " " ;

            current = current -> next ;
        }
        std::cout << " ] " ;
    }



    void clear(void)
    {
        std::cout << "All variables are  : [ " ;

        Node * current = front ;

        while ( current != nullptr )
        {
           current -> data = 0 ;

            current = current -> next ;
        }

        std::cout << " ] " ;
    }




    bool deleteQueue(void)
    {
        if (is_empty())
            return false ;

        Node * temp ;

        while ( front != nullptr )
        {
            temp = front ;

            front = front -> next ;  

            delete temp  ;

        }

        std::cout << " deleted " ;

        return true ;


    }


}; 







// int main(int argc,int *argv[])
// {
//         std::locale loc;  // Default locale
// const std::ctype<char>& ctype = std::use_facet<std::ctype<char>>(loc);

//     char ch = '9';
//     if (ctype.is(std::ctype_base::digit, ch)) 
//     {
//         std::cout << ch << " is a digit.\n";
//     }


//     Queue<int> queue ;

//     int var = 0 ;
    
    
//     queue.Enqueue(1) ;
//     queue.Enqueue(2) ;
//     queue.Enqueue(3) ;
//     queue.Enqueue(4) ;
//     queue.Enqueue(5) ;
//     queue.Enqueue(20) ;

//     queue.clear() ;

//     queue.print() ;

//     queue.deleteQueue() ;

//         queue.print() ;

//     // std::cout <<std::endl ;

//     // queue.Dequeue(var) ;
//     // queue.Dequeue(var) ;

//     // std::cout << var << std::endl ;

//     // std::cout <<std::endl ;
//     // queue.print() ;

//     // queue.Enqueue(20) ;
//     // queue.Enqueue(21) ;
//     // std::cout <<std::endl ;
//     // queue.print() ;

//     // queue.print() ;



// 	return false;
// }

