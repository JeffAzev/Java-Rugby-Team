/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package CA_2;

import java.util.List;
import java.util.Random;
import java.util.Scanner;

/**C
 *
 * @author jna90
 */
public class CA_2 implements RugbyMenu{

    /**
     * @param args the command line arguments
     */
    
    //I use the scanner class to get user input.
    private static final Scanner scanner = new Scanner (System.in);
    
    //I created this variable capture to save space, so I just call it when I need the user input some information.
    private static String capture (String ask) {
        System.out.println(ask);
        return scanner.nextLine();    
    }
    
    @Override
    //This mthod will sort the list
    public void sort(){
        //Populating a string with the names from the list
        String [] playerNames = RugbyData.getPlayersName();
        
        //ordem the list using the quick sort
        Sort.QuickSort(playerNames, 0, playerNames.length - 1);
        
        System.out.println("List of players in alphabetical order:\n");
        int count = 0;
        for (String playerName : playerNames){
            //show the first 20 names
            if(count < 20){                
                Player player = RugbyData.getPlayerByName(playerName);
                System.out.println("\nPlayer name: " + playerName + "\nPosition: " + player.getPosition() +"\nCoach:" 
                        + player.getCoach() + "\nTeam: " + player.getTeam());
                System.out.println("-----------------------");
                count++;
            }else{
                break;
            }
        }
        
    }
    
    @Override
    //This method will search a player from the list.
    public void search(){
        //Populating a string with the names from the list
        String [] playerNames = RugbyData.getPlayersName();
        
        //Using the method capture to ask user for some infomration
        String userInput = capture("Please enter a name you want to search.");
        
        String resultLinear;
        //populating the variable indexFound
        int indexFound = Search.linear(playerNames, userInput);
        
        //Check if the index is smaller or equal -1, if it is true, it doesn't show the players details.
        if(indexFound <= -1) {
            resultLinear = "Not Found";        
        }else {
            //Getting the player information from rugbyData class 
            Player player = RugbyData.getPlayerByIndex(indexFound);
            //if indexFound is bigger than -1, show all the information
            resultLinear = "\nPlayer Details:\n" + "Index Position: " + indexFound + "\nPosition: "+ player.getPosition() +"\nName: " + player.getName() 
                    + "\nCoach: " + player.getCoach() + "\nTeam: " + player.getTeam();
        }
        //print all information
        System.out.println(resultLinear);
    }
    
    @Override
    //This method will add a new player to the list.
    public void addPlayer(){
        //Ask user a player name
        String newName = capture ("Please select the name you want to insert.\n");
        
        List <String> playersList = RugbyData.getListPlayersName();
        
        if(playersList.contains(newName)){
            System.out.println("\nUser name is already in use.");
            addPlayer();
        }
        
        //Ask user to choose one of the option
        String coachOption = capture ("Choose a Coach\n1)Attack Coach\n2)Defense Coach\n3)Assistant Coach");
        String coachName = Coach.getCoachName(coachOption);
        
        //Ask user to choose one of the option
        String teamOption = capture ("Choose a Team\n1)Squad A\n2)Juniors Squad\n3)Under-13 Sqaud");
        String teamName = Team.getTeamName(teamOption);
        
        String positionOption = capture("Choose a position\n1) Striker\n2) Middle Field\n3) Defender");
        String positionName = Player.getPositionName(positionOption);
        
        //Add the new player
        RugbyData.addPlayer(newName, positionName, coachName, teamName);
        
        //Show the information that user chose.
        System.out.println("Player Name: " + newName);
        System.out.println("Position: " + positionName);
        System.out.println("Coach: " + coachName);
        System.out.println("Team: " + teamName);
        
        System.out.println("Player has been added successfully!");        
    }
    
    @Override
    //This method will create a new player randomly.
    public Player randomPlayer(){
        
        Player randomPlayer = RugbyData.generateRandomPlayer();
        
        RugbyData.addPlayer(randomPlayer.getName(),randomPlayer.getPosition(), randomPlayer.getCoach(), randomPlayer.getTeam());
        
        return randomPlayer;
    }
    public static void main(String[] args) {
        // TODO code application logic here
                
        //I had to do a boolen to keep asking user a valid file's name until the program got one.
        boolean loaded = false;
        
        while (!loaded) {
            String fileName = capture("Places enter the file with extension (e.g. .txt) name to read.");
            //I'm callin the class DataLibrary to boolean loaded.
            loaded = RugbyData.load(fileName);
        }
        
        //Create an instance the interface to allow us.
        CA_2 rugbyMenu = new CA_2();
        
        RugbyMenu.MenuOption selectOption = null;
        
        //Create a loop for the main menu
        do{
            System.out.println("\nPlease select an option:");
            System.out.println("1) Sort the player list");
            System.out.println("2) Search a player in the list");
            System.out.println("3) Add a player");
            System.out.println("4) Generate a random player");
            System.out.println("5) Exit");
            
            //Check if the user enter a number
            while(!scanner.hasNextInt()){
                System.out.println("Please enter a valid number!");
                scanner.next();
            }
            
            //Capture the user input and populate the variable option to process it.
            int option = scanner.nextInt();
            scanner.nextLine();
            
            //Checkin if the user enter a number from menu.
            if(option<1 || option > MenuOption.values().length){
                System.out.println("Please select from one of the options available!");
            }else{
                
                //the inder for enum starts at 0 so we have to subtract 1 from the user input.
                selectOption = RugbyMenu.MenuOption.values()[option - 1];//1-1 = 0 
                
                //Know we have to match the names here with the enums case names
                switch(selectOption){
                    case SORT:
                        System.out.println("Sort selected!\n"); 
                        rugbyMenu.sort();
                        break;
                    case SEARCH:
                        System.out.println("Search selected!\n");
                        rugbyMenu.search();
                        break;
                    case ADD_PLAYER:
                        System.out.println("Add a player selected!\n");
                        rugbyMenu.addPlayer();
                        break;
                    case GENERATE_RANDOM_PLAYERS:
                        System.out.println("Generate random players selected!\n");
                        Player randomPlayer = rugbyMenu.randomPlayer();
                        System.out.println("\nPlayer name: " + randomPlayer.getName() + "\nPosition: " + randomPlayer.getPosition() +"\nCoach:" 
                                + randomPlayer.getCoach() + "\nTeam: " + randomPlayer.getTeam());
                        break;
                    case EXIT:
                        System.out.println("Exiting program...");
                        break;    
                }
            }
        //keep the loop until user enter the number 5 from main menu.    
        }while(selectOption != RugbyMenu.MenuOption.EXIT);
    }    
}
