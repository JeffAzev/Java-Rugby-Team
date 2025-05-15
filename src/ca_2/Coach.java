/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CA_2;

/**
 *
 * @author jna90
 */
public class Coach {
    // Cheking which options the user chose
    public static String getCoachName(String option){
        switch (option){
            case "1":
                return CoachEnum.ATTACK_COACH.getCoach();                
            case "2":
                return CoachEnum.DEFENSE_COACH.getCoach();
            case "3":
                return CoachEnum.ASSISTANT_COACH.getCoach();                
            default:
                return "Unknown Coach";
        }  
    }
    //Create this variable to call it in rugbyData class easier .
    public static CoachEnum getCoachEnumByIndex(int index){
        switch(index){
            case 0:
                return CoachEnum.ATTACK_COACH;
            case 1:
                return CoachEnum.DEFENSE_COACH;
            case 2:
                return CoachEnum.ASSISTANT_COACH;
            default:
                //To not throw exception it was adapted to return a Attack Coach as default
                return CoachEnum.ATTACK_COACH;
            
        }
    }
}
//Created a enum to make easier
enum CoachEnum{
    ATTACK_COACH("Attack Coach"),
    DEFENSE_COACH("Defense Coach"),
    ASSISTANT_COACH("Assistant Coach");
    
    private final String coach;

    CoachEnum (String coach){
        this.coach = coach;
    }
    
    public String getCoach(){
        return coach;
    }
}