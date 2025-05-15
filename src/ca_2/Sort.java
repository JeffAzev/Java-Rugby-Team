/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CA_2;

/**
 *
 * @author jna90
 */
public class Sort {
    
    //I use Quick Sort to sort the player list.
    
    public static void QuickSort(String [] stringArray, int start, int end) {
        int i = start;
        int k = end;
        if (end - start >= 1) {
            String pivot = stringArray[start];
            while (k > i) {
                while (stringArray[i].compareTo(pivot) <= 0 && i <= end && k > i)
                    i++;
                while (stringArray[k].compareTo(pivot) > 0 && k >= start && k >= i)
                    k--;
                if (k > i)
                    swap(stringArray, i, k);
            }
            swap(stringArray, start, k);
            QuickSort(stringArray, start, k - 1);
            QuickSort(stringArray, k + 1, end);
        } else {}
    }
    public static void swap(String array[], int index1, int index2) {
        String temp = array[index1];
        array[index1] = array[index2];
        array[index2] = temp;
    }
    
}
