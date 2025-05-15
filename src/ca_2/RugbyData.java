/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CA_2;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author jna90
 */
public class RugbyData {
    //This array is to collect the full player's name.
    private static List<Player> players = new ArrayList();
    
    public static boolean load (String fileName) {
        
        //I used this File class to work with the Club_Form.txt.
        File file = new File (fileName);

        //Variable to count how many lines there are in the file.
        int numOfLines = 0;

        //Check if the file exists.
        boolean validFile = file.exists();    

        if(validFile){
            try{
                //Scanner to read the file.
                Scanner scanner = new Scanner (file);

                //Checking if there is a next line in the file.
                //Reading the nex line.
                //Counting how many lines.
                while(scanner.hasNextLine()){
                    scanner.nextLine();
                    numOfLines++;
                }
                
                //I used the scanner again to reset the line position.
                scanner = new Scanner(file);
                //Use it to skip header
                scanner.next();

                //Variable separator to separate line content when there is a comma. 
                //I am calling it when I need to populate a array.
                String separator = ",";
                
                //I am using a scanner to check if there are more lines.
                while(scanner.hasNextLine()){
                    //variable line to read the next line.
                    String line = scanner.nextLine();
                    
                    if (line.contains(separator)){
                        String[] parts = line.split(separator);
                        String name = parts[1] + " " + parts[2];
                        //populate the playerName array with the first and second index from Club_Form.txt                    }
                        players.add(generateRandomPlayer(name));
                    }
                }
                
                //Stop Reading
                scanner.close();
                
                //Print if thefile was read successfully or not.
                System.out.println("File read successfully");
                System.out.println("Number of lines in this file: " +numOfLines);
                
            }catch (IOException e) {
                System.out.println("Occur some error readinh file: " + e.getMessage());
                return false;
            }
            
            return true;
        }else {
            System.out.println("File not found to provide fileName");
            
            return false;
        }
    } 
    
    //As I created the search and sort at the beggining, I just pupulate a String[] with the information
    //from ArrayList
    public static String[] getPlayersName(){
        
        String[] playerName = new String[players.size()];
        
        for(int i = 0; i<players.size(); i++){
            playerName [i] = players.get(i).getName();
        }
        return playerName;
    }
    
    public static List<String> getListPlayersName(){
        List<String> list = new ArrayList();
        for(Player player : players){
            list.add(player.getName());
        }
        return list;
    }
    
    //Create this method to add the new player that user input.
    public static void addPlayer(String playerName,String position, String coach, String team){
        Player player = new Player(playerName,position, coach, team);
        players.add(player);
    }
    
    //Create this for user find the player by index.
    public static Player getPlayerByIndex (int index){
        return players.get(index);
    }
    
    //This method is for create coach and team randomly for each player.
    public static Player generateRandomPlayer(String name){
        Random random = new Random();
        
        int index = random.nextInt(CoachEnum.values().length);
        
        CoachEnum coach = Coach.getCoachEnumByIndex(index);
        
        index = random.nextInt(TeamEnum.values().length);
        
        TeamEnum team = Team.getTeamEnumByIndex(index);
        
        index = random.nextInt(Player.PositionEnum.values().length);
        
        Player.PositionEnum position = Player.getPositionEnumByIndex(index);
        
        return new Player(name,position.getPosition(), coach.getCoach(), team.getTeam());
    }
    
    //I had to do this method, because it wasn't accepting a int.
    public static Player getPlayerByName (String name){
        for(Player player : players){
            if(player.getName().equals(name))
                return player;
        }
        //To not throw exception it was adapted to return a random player as default
        return generateRandomPlayer(name);
    }
    
     public static Player generateRandomPlayer(){
         Random random = new Random();
         
         int index = random.nextInt(players.size());
         
         Player p1 = players.get(index);
         
         index = random.nextInt(players.size());
         
         Player p2 = players.get(index);
         
         String name = p1.getName().split(" ")[0] + " " + p2.getName().split(" ")[1];
         
         return generateRandomPlayer(name);
     }
}
