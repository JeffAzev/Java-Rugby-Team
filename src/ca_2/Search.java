/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CA_2;

/**
 *
 * @author jna90
 */
public class Search {
    //I choose the linear search.
    public static int linear(String arr[], String x) {
        for (int i = 1; i < arr.length; i++) {
            if (arr[i].equals(x)) {
                return i;
            }
        }
        return -1;
    }
}