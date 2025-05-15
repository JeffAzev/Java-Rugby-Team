/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CA_2;

/**
 *
 * @author jna90
 */
public class Player {
    
    //List all attributes that players have
    private final String name;
    private final String position;
    private final String coach;
    private final String team;
    
    //Add the new atributes as arguments
    public Player(String name, String position, String coach, String team){
        // This constructor will allow us
        // to return and assign the names of players
        // through the key word name
        this.name = name;
        this.position = position;
        this.coach = coach;
        this.team = team;
    }
    
    public String getName(){
        // this method returns the current state(value) of
        // this.name 
        return name;
    }
    public String getPosition(){
        return position;
    }
    public String getCoach(){
        return coach;
    }
    public String getTeam(){
        return team;
    }
    public static String getPositionName(String option){
        switch(option){
        case "1":
            return PositionEnum.STRIKER.getPosition();
        case "2":
            return PositionEnum.MIDDLEFIELD.getPosition();
        case "3":
            return PositionEnum.DEFENDER.getPosition();
        default:
            return PositionEnum.BENCH.getPosition();
    }
    }
    //Create a new "get" to insert a position for players
    public static PositionEnum getPositionEnumByIndex(int index){
        switch(index){
            case 0:
                return PositionEnum.STRIKER;
            case 1:
                return PositionEnum.MIDDLEFIELD;
            case 2:
                return PositionEnum.DEFENDER;
            default:
                //To not throw exception, if the user don't choose a valid number the player will be a substitute player.
                return PositionEnum.BENCH;
        }
    }
    enum PositionEnum{
        STRIKER("Striker"),
        MIDDLEFIELD("Middle Field"),
        DEFENDER("Defender"),
        BENCH("Bench Player");
        
        private String position;
        
        PositionEnum (String position){
            this.position = position;
        }
        
        public String getPosition(){
            return position;
        }
    }
}
