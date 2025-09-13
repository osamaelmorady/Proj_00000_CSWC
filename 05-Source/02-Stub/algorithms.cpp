
#include "BSW_cfg.h"




#include <stdlib.h>
#include <stdbool.h>
#include <iostream>

typedef  unsigned int  data_t ;


void swap (data_t *a, data_t *b) 
{
    data_t temp ; 

    temp = *a ;
    *a = *b ;
    *b= temp ;
}


void AlgorithmPrint(data_t arr[], int size)
{
    for (int j = 0; j<size ; j++)
    {
        std::cout << arr[j] << ' ' ; ;
    }

}



/* ************************************************************************************************************* */
/* ************************************************************************************************************* */

/** 
 *
 * @file algorithms.c
 * @author  osama elmorady
 * 
 * @brief  Module for sorting an array in ascending order using Selection Sort.
 *  This function sorts an array of type `data_t` in ascending order using
 *  the Selection Sort algorithm, which repeatedly finds the smallest element
 *  and swaps it into place.
 * 
 * @param[in,out]   arr[] The array to be sorted (type: data_t).
 * @param[in]   size The number of elements in the array (type: int).
 * @return void
 * 
 * 
 * @note The function operates in-place, meaning it modifies the input array directly.
 * 
 * @callgraph
 * @callergraph
 * 
 * @warning This function has a time complexity of O(n²), making it inefficient for large datasets.
 * @details
 * This sorting algorithm is not efficient for large datasets and works by
 * repeatedly finding the minimum element from the unsorted part and swapping
 * it with the first unsorted element.
 * 
 * @paragraph  SelectionSortAscending Activity Diagram 
 * - **Step 1:** Initialize the sorting process.
 * - **Step 2:** Iterate through the array to find the smallest element.
 * - **Step 3:** Swap the smallest element with the first unsorted element.
 * - **Step 4:** Repeat until the array is sorted.
 * 
 * @paragraph SelectionSortAscending Sequence Diagram
 * @dot
 * digraph SelectionSort {
 *    Caller -> SelectionSortAscending [label="Call SelectionSortAscending(arr, size)"];
 *    SelectionSortAscending -> swap [label="Call swap() if needed"];
 *    swap -> SelectionSortAscending [label="Return from swap()"];
 *    SelectionSortAscending -> Caller [label="Return to caller"];
 * }
 * @enddot
 * 
 *  @paragraph Complexities
 * - **Time Complexity:** O(n²)
 * - **Space Complexity:** O(1)
 * 
*/
void SelectionSortAscending(data_t arr[], int size)
{
    int minIndx = 0 ;
    /**
     * @brief Outer loop: Iterates through each element of the array.
     * 
     * This loop starts from the first element and moves through to the second-last element.
     * The index i represents the current position in the array that will be compared 
     * with the unsorted part of the array.
     * 
     * @loopstart
     * @loopiteration This is the iteration where i is the current element index.
     */
    for (int i = 0 ; i<size-1 ;i++)
    {
        /** 
         * @brief Inner loop: Finds the smallest element in the unsorted part of the array.
         * 
         * This loop compares each element in the unsorted portion of the array with 
         * the current smallest element found.
         * 
         * @loopstart
         * @loopiteration This is the iteration where j checks for smaller values than arr[minIndx].
        */
        minIndx = i ;
        for (int j=minIndx+1 ; j <size ;j++ )
        {
            /**
             * @brief Comparison of elements to find the smallest.
             * 
             * If the current element is smaller than the smallest element, it updates 
             * the index of the minimum element.
            */
            if ( arr[j] < arr[minIndx] )
            {
                minIndx = j ; 
            }
        }
        /**
         * @brief Swap the smallest element with the first element of the unsorted part.
         * 
         * If a smaller element was found, it is swapped with the element at position i.
         * This ensures that the smallest element of the unsorted part gets placed 
         * at the correct position in the array.
         * 
         * @swap
         * @note Swapping only occurs when minIndx is not equal to i, ensuring no unnecessary swap.
         */
        if (minIndx != i)
        {
            swap(&arr[minIndx] ,  &arr[i]) ;
        }
    }
}
void SelectionSortDescending(data_t arr[], int size)
{
    int minIndx = 0 ;

    for (int i = 0 ; i<size-1 ;i++)
    {
        minIndx = i ;
        for (int j=minIndx+1 ; j <size ;j++ )
        {
            if ( arr[j] > arr[minIndx] )
            {
                minIndx = j ; 
            }
        }
        if (minIndx != i)
        {
            swap(&arr[minIndx] ,  &arr[i]) ;
        }
    }
}

/* ************************************************************************************************************* */
/* ************************************************************************************************************* */

/** description
// space : o(1)
// time : o(n^2)   // best o(n) in case it is already sorted, by adding the sorted flag check
*/
void BubbleSortAscending(data_t arr[], int size)
{
    int sortedFlag ;

    for (int i = 0 ; i< size-1 ;i++)
    {
        sortedFlag = true ;
        for (int j = 0 ; j< size-i-1 ;j++)       
        {
            if (arr[j+1] < arr[j])
            {
                swap(&arr[j] ,  &arr[j+1]) ;

                sortedFlag = false; 
            }
        }
        if (sortedFlag == true)
        {
            break ;
        }
    }
}
void BubbleSortDescending(data_t arr[], int size)
{
    int sortedFlag ;

    for (int i = 0 ; i< size-1 ;i++)
    {
        sortedFlag = true ;
        for (int j = 0 ; j< size-i-1 ;j++)       
        {
            if (arr[j+1] < arr[j])
            {
                swap(&arr[j] ,  &arr[j+1]) ;

                sortedFlag = false; 
            }
        }
        if (sortedFlag == true)
        {
            break ;
        }
    }
}



/* ************************************************************************************************************* */
/* ************************************************************************************************************* */

//  e   k
// 60  50 | 20 70 80 90
// 50  60 | 20 70 80 90
// 50  60  20 | 70 80 90
// 50  20  60 | 70 80 90
// 20  50  60 | 70 80 90
void InsertionAscending(data_t arr[], int size)
{
 
  int key; 
    // loop on the key indexer
    for (int i=1 ; i< size ;i++)
    {
        key = arr[i] ;
        int j = i-1 ; 
        // loop on the left array , check if the key is the least, otherwise shift the element

        while (key < arr[j] && j>=0)
        {
            arr[j+1] = arr[j] ;  // shifting to right 
            j-- ;
        }
        arr[j+1]  = key ;
    }
}
void InsertionDescending(data_t arr[], int size)
{
 
  int key; 
    // loop on the key indexer
    for (int i=1 ; i< size ;i++)
    {
        key = arr[i] ;
        int j = i-1 ; 
        // loop on the left array , check if the key is the least, otherwise shift the element

        while (key > arr[j] && j>=0)
        {
            arr[j+1] = arr[j] ;
            j-- ;
        }
        arr[j+1]  = key ;
    }
}

/* ************************************************************************************************************* */
/* ************************************************************************************************************* */

//90 | 50 60 70 80 90 | --> 1 , 3 , 5
void MergeAscending(data_t arr[], int l, int m, int r)
{
    int i,j,k ;

    int n1 = m-l + 1 ;
    int n2 = r-m ;

    data_t * Left_Array  = new data_t[n1] ; 
    data_t * Right_Array  = new data_t[n2] ;

    for (i=0;i<n1;i++)
    {
        Left_Array[i]= arr[l+i] ;
    }
    for (j=0;j<n2;j++)
    {
        Right_Array[j]= arr[m+1+j] ;
    }

    i=j= 0 ;

    k = l ;

    while ( (i < n1) && (j < n2) )
    {
        if (Left_Array[i] <= Right_Array[j])
        {
            arr[k] = Left_Array[i] ;
            i++ ;
        }
        else 
        {
            arr[k] = Right_Array[j] ;
            j++ ;
        }
        k++ ;
    }

    while ( (i < n1))
    {
        arr[k] = Left_Array[i] ;
        i++ ;
        k++;
    }


    while ((j < n2) )
    {
        arr[k] = Right_Array[j] ;
        j++ ;
        k++;
    }

    delete[] Left_Array ;
    delete[] Right_Array ;

}
//90 | 50 60 70 80 90 | --> 1 , 3 , 5
void MergeDescending(data_t arr[], int l, int m, int r)
{
    int i,j,k ;

    int n1 = m-l + 1 ;
    int n2 = r-m ;

    data_t * Left_Array  = new data_t[n1] ; 
    data_t * Right_Array  = new data_t[n2] ;

    for (i=0;i<n1;i++)
    {
        Left_Array[i]= arr[l+i] ;
    }
    for (j=0;j<n2;j++)
    {
        Right_Array[j]= arr[m+1+j] ;
    }

    i=j= 0 ;

    k = l ;

    while ( (i < n1) && (j < n2) )
    {
        if (Left_Array[i] <= Right_Array[j])
        {
            arr[k] = Left_Array[i] ;
            i++ ;
        }
        else 
        {
            arr[k] = Right_Array[j] ;
            j++ ;
        }
        k++ ;
    }

    while ( (i < n1))
    {
        arr[k] = Left_Array[i] ;
        i++ ;
        k++;
    }


    while ((j < n2) )
    {
        arr[k] = Right_Array[j] ;
        j++ ;
        k++;
    }

    delete[] Left_Array ;
    delete[] Right_Array ;

}


void SortMergeAscending(data_t arr[], int l, int r) 
{
    if (l < r) 
    {
        int mid = l + (r - l) / 2; // Correctly calculate middle index

        // Recursively sort left and right halves
        SortMergeAscending(arr, l, mid);
        SortMergeAscending(arr, mid + 1, r);

        // Merge the sorted halves
        MergeAscending(arr, l, mid, r);
    }
}
void SortMergeDescending(data_t arr[], int l, int r) 
{
    if (l < r) 
    {
        int mid = l + (r - l) / 2; // Correctly calculate middle index

        // Recursively sort left and right halves
        SortMergeDescending(arr, l, mid);
        SortMergeDescending(arr, mid + 1, r);

        // Merge the sorted halves
        MergeDescending(arr, l, mid, r);
    }
}




/* ************************************************************************************************************* */
/* ************************************************************************************************************* */


// 50 60 10 40 20 30 70 60 90 90        3
// 50 60 10 40 20 30 70 90 60 90        2
// 50 60 10 40 90 30 70 90 60 20        1
int Partition(data_t arr[], int low, int high)
{
    int mid = (high-low)/2+low ;
    data_t pivot = arr[mid];

    int i = low ;
    int j = high ;

    while(i<=j)
    {
        // inc low with check
        while (pivot > arr[i])
        {
            i++ ;   // Move right
        }
        // dec high with check
        while (pivot < arr[j])
        {
            j-- ;   // Move left
        }

        // swap
        if (i<=j)
        {
            swap(&arr[i],&arr[j]) ;
            i++;
            j--;
        }
    }

    return i ;  // Return correct partition index
}


void QuickSort(data_t arr[], int low, int high)
{
    if (low<high)
    {
        int pivot_index = Partition(arr, low, high);
        QuickSort(arr,low,pivot_index-1);       // Left partition
        QuickSort(arr,pivot_index+1,high);      // Right partition
    }

}






/* ************************************************************************************************************* */
/* ************************************************************************************************************* */



// #define MAX_SIZE    10
// int main(int argc,int *argv[])
// {

//     data_t array[] = {50,20,90,70,60,30,80,10,60,45} ;
//     int size = sizeof(array)/sizeof(data_t) ;

//     std::cout<< "Pure Data" <<std::endl ;
//     AlgorithmPrint(array,size) ;
//     std::cout<<std::endl ;

// /* ************************************************************************************************************* */
// /* ************************************************************************************************************* */

//     // std::cout<< "SelectionSortAscending" <<std::endl ;
//     // SelectionSortAscending(array,size) ;
//     // AlgorithmPrint(array,size) ;
//     // std::cout<<std::endl ;

//     // std::cout<< "SelectionSortDescending" <<std::endl ;
//     // SelectionSortDescending(array,size) ;
//     // AlgorithmPrint(array,size) ;
//     // std::cout<<std::endl ;

// /* ************************************************************************************************************* */
// /* ************************************************************************************************************* */

//     // std::cout<< "SelectionSortAscending" <<std::endl ;
//     // BubbleSortAscending(array,size) ;
//     // AlgorithmPrint(array,size) ;
//     // std::cout<<std::endl ;

//     // std::cout<< "SelectionSortDescending" <<std::endl ;
//     // BubbleSortDescending(array,size) ;
//     // AlgorithmPrint(array,size) ;
//     // std::cout<<std::endl ;

// /* ************************************************************************************************************* */
// /* ************************************************************************************************************* */

//     // std::cout<< "SelectionSortAscending" <<std::endl ;
//     // InsertionAscending(array,size) ;
//     // AlgorithmPrint(array,size) ;
//     // std::cout<<std::endl ;

//     // std::cout<< "SelectionSortDescending" <<std::endl ;
//     // InsertionDescending(array,size) ;
//     // AlgorithmPrint(array,size) ;
//     // std::cout<<std::endl ;

// /* ************************************************************************************************************* */
// /* ************************************************************************************************************* */

//     // std::cout<< "MergeSortAscending" <<std::endl ;
//     // SortMergeAscending(array,0,size-1) ;
//     // AlgorithmPrint(array,size) ;
//     // std::cout<<std::endl ;


//     // std::cout<< "MergeSortDescending" <<std::endl ;
//     // SortMergeDescending(array,0,size-1) ;
//     // AlgorithmPrint(array,size) ;
//     // std::cout<<std::endl ;

// /* ************************************************************************************************************* */
// /* ************************************************************************************************************* */

//     std::cout<< "QuickSortAscending" <<std::endl ;
//     QuickSort(array,0,size-1) ;
//     AlgorithmPrint(array,size) ;
//     std::cout<<std::endl ;

//     std::cout<< "QuickSortDescending" <<std::endl ;
//     QuickSort(array,0,size-1) ;
//     AlgorithmPrint(array,size) ;
//     std::cout<<std::endl ;


// /* ************************************************************************************************************* */
// /* ************************************************************************************************************* */
// 	return false;
// }









