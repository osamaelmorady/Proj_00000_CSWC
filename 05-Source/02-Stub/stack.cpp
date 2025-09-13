#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <iostream>
#include <cstdlib>
#include <ctype.h>
#include <vector>


/***************************************************************************/
// enum boolData {FALSE=0,TRUE} ;

// // how to implement a binary tree
// const int MAX_SIZE = 100 ;

// template <class Data_t>
// class Stack
// {
//     private: 
//         struct Node 
//         {
//             Data_t data ;
//             Node * next ;
//         };

//         Node* top;  // Root of the tree

//         int size ;

//         void print_reverse_helper(Node *node) 
//         {
//             if (node == nullptr)
//             {
//                 return ;
//             }

//             print_reverse_helper(node->next) ;
//             std::cout << node->data <<std::endl ;

//         }


//     public: 

//         Stack() : top(nullptr), size (0)  {}

//         bool is_empty(void)
//         {
//             return top == nullptr ;
//         }

//         bool is_full(void)
//         {
//             return size >= MAX_SIZE ;
//         }


//         bool push(Data_t var)
//         {
//             if (is_full())
//             {
//                 return false;
//             }
            
//             Node * newNode = new Node ;
//             newNode->data = var ;
//             newNode ->next = top ; 
//             top = newNode ;

//             size++;

//             return true ;
//         }

//         bool pop(Data_t &var)
//         {
//             if (is_empty())
//             {
//                 return false;
//             }
            
//             Node * tempNode  = top   ;

//             var = top->data  ;
//             top = top ->next ;

//             delete (tempNode) ;
//             size--;

//             return true ;
//         }


//         int Stack_size(void)
//         {
//             return size ;
//         }


//         void print(void) 
//         {
//             Node* temp = top;

//             while (temp!=nullptr)
//             {
//                 std::cout << temp -> data <<std::endl ;
//                 temp = temp->next ;
//             }
//         }


//         void print_reverse(void) 
//         {
//             print_reverse_helper(top) ;
//         }

//         ~Stack() 
//         {
//             Node* temp = top;

//             while (top!=nullptr)
//             {
//                 temp = top  ;
//                 top = top ->next ;
//                 delete temp ;
//             }
//         }
// };










// int main(int argc,int *argv[])
// {

//     Stack<int> stack ;
//     int element ;
    
//     stack.push(50) ;
//     stack.push(20) ;
//     stack.push(30) ;
//     std::cout << "print order" <<std::endl ;
//     stack.print () ;
//     std::cout << "print reverse" <<std::endl ;
//     stack.print_reverse () ;

// 	return false;
// }




/***************************************************************************/
/***************************************************************************/


// bool Check_if_Balanced(std::vector <char> dataString, int size)
// {
//     Stack<char> stack ;
//     char temp ;

//     if (dataString.empty())
//     {
//         return false ;
//     }


//     for (int i = 0 ; i< size ;i++)
//     {
//         if (dataString.at(i) == '(')
//         {
//             stack.push(dataString[i]) ;
//         }
//         else if (dataString.at(i) == ')')
//         {
//             stack.pop(temp) ;
//         }
//     }

//     return stack.Stack_size()==0 ;


// }



// int main(int argc,int *argv[])
// {

//     Stack<int> stack ;
//     int element ;
//     int n ;
//     std::cin >> n ;

//     std::vector <char> myVectString(n) ;


//     for (int i = 0 ;(i<n) && (myVectString[i]!=' ') ;i++)
//     {
//         std::cin.get(myVectString[i])  ;
//         if (myVectString[i] == ' ' )
//         {
//             n= i-1 ;
//             break;
//         }
//     }


//     for (int i = 0 ; i<=n ;i++)
//     {
//         std::cout << myVectString[i] ;
//     }
// std::cout<< std::endl << n << std::endl ;
//     std::cout<< std::boolalpha << Check_if_Balanced(myVectString,n) ;



// 	return false;
// }








#include <iostream>
#include <stack>
#include <string>
#include <sstream>
using namespace std;

/***************************************************************************/


// bool Check_if_Balanced(string dataString, int size)
// {
//     std::stack<char> s ;
//     char temp ;

//     if (dataString.empty())
//     {
//         return false ;
//     }


//     for (int i = 0 ; i< size ;i++)
//     {
//         if (dataString.at(i) == '(')
//         {
//             s.push(dataString[i]) ;
//         }
//         else if (dataString.at(i) == ')')
//         {
//             s.pop() ;
//         }
//     }

//     return s.size()==0 ;


// }


// // Function to evaluate a postfix expression
// int evaluatePostfix(const std::string& expression) 
// {
//     std::stack<int> s;  // Stack to store operands

//     // Parse the expression
//     for (size_t i = 0; i < expression.length(); i++) {
//         char token = expression[i];

//         // Skip whitespace
//         if (isspace(token)) continue;

//         // If the token is a digit, push it to the stack
//         if (isdigit(token)) {
//             s.push(token - '0');  // Convert char to int
//         } 
//         // If the token is an operator, apply the operation
//         else if (token == '+' || token == '-' || token == '*' || token == '/') {
//             // Pop the top two elements
//             int b = s.top(); s.pop();
//             int a = s.top(); s.pop();

//             // Perform the operation and push the result
//             switch (token) {
//                 case '+': s.push(a + b); break;
//                 case '-': s.push(a - b); break;
//                 case '*': s.push(a * b); break;
//                 case '/': s.push(a / b); break;
//                 default: throw invalid_argument("Unsupported operator");
//             }
//         } else {
//             throw invalid_argument("Invalid character in expression");
//         }
//     }

//     // The final result is the only element left in the stack
//     return s.top();
// }

// int main() {
//     string postfix = "5 4 + 8 9 * +";  // Example postfix expression

//     try {
//         cout << boolalpha << Check_if_Balanced (postfix,postfix.size()) << endl ;
//         int result = evaluatePostfix(postfix);
//         cout << "The result of the postfix expression is: " << result << endl;
//     } catch (const exception& e) {
//         cerr << "Error: " << e.what() << endl;
//     }

//     return 0;
// }


// int main() {
//     string postfix = "5 4 + 8 9 * +";  // Example postfix expression

//     try {
//         int result = evaluatePostfix(postfix);
//         cout << "The result of the postfix expression is: " << result << endl;
//     } catch (const exception& e) {
//         cerr << "Error: " << e.what() << endl;
//     }

//     return 0;
// }





/***************************************************************************/
bool is_digit(const char ch)
{
   return (ch >='0') && (ch <='9') ;
}


bool is_Operand(const char ch)
{
    switch (ch)
    {
        case '+':
        case '-':
        case '*':
        case '/':
            return true ;
        default:
            return false;
    }
}


bool Check_if_Balanced(char * dataStream, int size)
{
    std::stack<char> s ;
    char temp ;

    if (dataStream==nullptr)
    {
        return false ;
    }


    for (int i = 0 ; i< size ;i++)
    {
        if (dataStream[i] == '(')
        {
            s.push(dataStream[i]) ;
        }
        else if (dataStream[i] == ')')
        {
            if (s.empty()) 
            {
                return false;  // Unbalanced expression
            }
            s.pop();
        }
        else if (!is_digit(dataStream[i]) && !is_Operand(dataStream[i])) 
        {
            return false;  // Invalid character
        }
    }

    return s.size()==0 ;
}





// Function to evaluate a prefix expression
int evaluatePrefix(const int size,const char * postfix, int * result) 
{
    std::stack<int> s;  // Stack to store operands
    char token ;
    int left_op, right_op ;
    int local_result = 0 ;

    if ((size <=0) || (postfix==nullptr) || (result==nullptr) )
    {
        return false ;
    }

    for (int i=0; i< size ; i++)
    {
        token = postfix[i] ;
        
        if (is_digit(token))
        {
            s.push(token-'0');

            continue ;
        }

        if (is_Operand(token))
        {
            if (s.size() <2)
            {
                return false ;
            }
            else
            {
                right_op = s.top() ; s.pop() ;
                left_op = s.top() ; s.pop() ;
            }
        }
        else
        {
            return false ;
        }

        switch (token)
        {
            case '+':   local_result = left_op + right_op ;    break ;
            case '-':   local_result = left_op - right_op ;    break ;
            case '*':   local_result = left_op * right_op ;    break ;
            case '/':  
                if (right_op!=0)
                {
                    local_result = left_op / right_op ;
                }
                else 
                {
                    return false ;
                }
               break ;
            default:
                return false;
        }

        s.push(local_result) ;

    }

    if (s.size () !=0)  
        return false ;
    else 
        * result = local_result ;
    
    return true ;
}


// Function to evaluate a postfix expression
int evaluatePostfix(const int size,const char * postfix, int * result) 
{
    std::stack<int> s;  // Stack to store operands
    char token ;
    int left_op, right_op ;
    int local_result = 0 ;

    if ((size <=0) || (postfix==nullptr) || (result==nullptr) )
    {
        return false ;
    }

    for (int i=0; i< size ; i++)
    {
        token = postfix[i] ;
        
        if (is_digit(token))
        {
            s.push(token-'0');

            continue ;
        }

        if (is_Operand(token))
        {
            if (s.size() <2)
            {
                return false ;
            }
            else
            {
                right_op = s.top() ; s.pop() ;
                left_op = s.top() ; s.pop() ;
            }
        }
        else
        {
            return false ;
        }

        switch (token)
        {
            case '+':   local_result = left_op + right_op ;    break ;
            case '-':   local_result = left_op - right_op ;    break ;
            case '*':   local_result = left_op * right_op ;    break ;
            case '/':  
                if (right_op!=0)
                {
                    local_result = left_op / right_op ;
                }
                else 
                {
                    return false ;
                }
               break ;
            default:
                return false;
        }

        s.push(local_result) ;

    }

    if (s.size () !=0)  
        return false ;
    else 
        * result = local_result ;
    
    return true ;
}

#define  MAX_SIZE    (int)7

// int main() 
// {
//     char postfix[MAX_SIZE] = {'5','4','+','8','9','*','+'};  // Example postfix expression "5 4 + 8 9 * +"
//     int result = 0 ;
//     bool ret ;

//     ret = Check_if_Balanced (postfix,MAX_SIZE) ;
//     cout << boolalpha << ret << endl ;

//     if (ret) 
//     {
//         ret = evaluatePostfix(MAX_SIZE, postfix, &result );
//     }

//     if (ret)
//     {
//         cout << "The result of the postfix expression is: " << result << endl;
//     }
//     else
//     {
//         cout << "Invalid Expression " << endl;
//     }


//     return 0;
// }