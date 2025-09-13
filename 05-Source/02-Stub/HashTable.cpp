
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


#define HASH_TABLE_SIZE  10


typedef int Data_t ;

typedef struct Node
{
    int key ;
    Data_t value ;
    Node * next ;
}Node ;


typedef struct HashTable
{
    Node * table[HASH_TABLE_SIZE] ;         // Array of (pointers) linked list heads
}HashTable;




int hashFunction(Data_t var)
{
    return abs(var%HASH_TABLE_SIZE);
}



HashTable * createHashTable (void)
{
    HashTable* hashTable = (HashTable*)malloc(sizeof(HashTable));

    for (int i = 0; i < HASH_TABLE_SIZE; i++) {
        hashTable->table[i] = NULL;
    }
    return hashTable;
} 


void insert(HashTable* hashTable, int key, int value)
{
    int index = hashFunction(key);

    // Create new node
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->key = key;
    newNode->value = value;
    newNode->next = hashTable->table[index];  // Insert at head (chaining)
    hashTable->table[index] = newNode;
}








// int main(int argc,char **argv)
// {






//     return false ;
// }
