/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package CA_2;

/**
 *
 * @author jna90
 */
public interface RugbyMenu {
    
    //This interface was created to insert a Menu for user interaction, 
    //where it will provide all of the options for user.
    
    enum MenuOption {
        
        SORT,
        SEARCH,
        ADD_PLAYER,
        GENERATE_RANDOM_PLAYERS,
        EXIT
    }
    
    //This mthod will sort the list
    void sort();
        
    //This method will search a player from the list.
    void search();
    
    //This method will add a new player to the list.
    void addPlayer();
    
    //This method will create a new player randomly.
    Player randomPlayer();
    
}
