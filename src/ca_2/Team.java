/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CA_2;

/**
 *
 * @author jna90
 */
public class Team {
    // Cheking which options the user chose
    public static String getTeamName(String option){
        switch (option){
            case "1":
                return TeamEnum.SQUAD_A.getTeam();                
            case "2":
                return TeamEnum.JUNIOR_SQUAD.getTeam();
            case "3":
                return TeamEnum.UNDER_13_SQUAD.getTeam();                
            default:
                return "Unknown Team";
        }
    }
    
    //Create this variable to call it in rugbyData class easier.
    public static TeamEnum getTeamEnumByIndex(int index){
        switch(index){
            case 0:
                return TeamEnum.SQUAD_A;
            case 1:
                return TeamEnum.JUNIOR_SQUAD;
            case 2:
                return TeamEnum.UNDER_13_SQUAD;
            default:
                //To not throw exception it was adapted to return a Squad A as default
                return TeamEnum.SQUAD_A;
            
        }
    }
}
//Created a enum to make easier
enum TeamEnum{
    SQUAD_A("Squad A"),
    JUNIOR_SQUAD("Junior Squad"),
    UNDER_13_SQUAD("Under-13 Squad");
    
    private final String team;

    TeamEnum (String team){
        this.team = team;
    }
    
    public String getTeam(){
        return team;
    }
}

