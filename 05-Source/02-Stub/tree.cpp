#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <iostream>
#include <cstdlib>



// how to implement a binary tree


template <class Data_t>
class BinaryTree
{
    private: 
        struct Node 
        {
            Data_t data ;
            Node * left ;
            Node * right ;
        };

        Node* root;  // Root of the tree

        // traversals Inorder left-root-right
        void InorderTraversal (Node * root)     
        {
            if (root == nullptr)  return; 
            else
            {
                InorderTraversal(root->left) ;
                std::cout << root->data<< " " ;
                InorderTraversal(root->right) ;
            }
            return;
        }

        // traversals Preorder root-left-right
        void PreorderTraversal (Node * root)     
        {
            if (root == nullptr)  return; 
            else
            {
                std::cout << root->data<< " " ;
                InorderTraversal(root->left) ;
                InorderTraversal(root->right) ;
            }
            return;
        }


        // traversals Postorder left-right-root
        void PostorderTraversal (Node * root)     
        {
            if (root == nullptr)  return; 
            else
            {
                InorderTraversal(root->left) ;
                InorderTraversal(root->right) ;
                std::cout << root->data<< " " ;
            }
            return;
        }

        // insert
        Node * insertNode (Node * node, int var)     
        {
            if (node == nullptr)  
            {
                Node * temp = new Node ;

                temp->data = var ;
                temp ->left = nullptr ;
                temp ->right = nullptr ;
                return temp ;
            } 
            else
            {
                if (var > node->data)
                {
                    // Insert into right subtree
                    node->right = insertNode(node->right, var) ;
                }
                else if  (var < node->data)
                {
                    // Insert into left subtree
                    node->left = insertNode(node->left, var) ;
                }

            }
            return node;
        }



        Node * insertNode_try (Node * node, int var)
        {
            
            if (node ==nullptr)
            {
                Node * temp = new Node ;
                temp ->data = var ;
                temp ->left =nullptr ;
                temp->right = nullptr ;

                return temp ;
            }

            if (var > node->data)
            {
                node-> right = insertNode_try (node,var) ;
            }
            else if (var < node->data)
            {
                node-> left = insertNode_try (node,var) ;
            }


            return node ;

        }






        // Recursively delete the tree
        void deleteTree(Node* node) 
        {
            if (node == nullptr) return;
            else
            {
                deleteTree(node->left) ;
                deleteTree(node->right) ;
                delete     node ;
                return ;            
            }
        }


    public: 
        BinaryTree() : root(nullptr) {} 


        void insert(int var)
        {
            root = insertNode(root , var) ;
        }

        void Inorder(void)
        {
            InorderTraversal(root) ;
            std::cout<<std::endl ;
        }

        void Preorder(void)
        {
            PreorderTraversal(root) ;
            std::cout<<std::endl ;
        }

        void Postorder(void)
        {
            PostorderTraversal(root) ;
            std::cout<<std::endl ;
        }

        ~BinaryTree() 
        {
            deleteTree(root) ;
        }
};










// int main(int argc,int *argv[])
// {

//     BinaryTree<int> tree ;
    
//     tree.insert(50) ;
//     tree.insert(20) ;
//     tree.insert(30) ;

//     tree.Inorder() ;

//     tree.Preorder() ;

//     tree.Postorder() ;

// 	return false;
// }

