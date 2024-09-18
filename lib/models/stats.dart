mixin Stats{
 int _points = 10;
 int _health = 10;
 int _attack = 10;
 int _defence = 10;
 int _skills = 10;

 // Getters
int get points => _points;


Map<String, int> get statsAsMap=>{
  "health": _health,
  "attack": _attack,
  "defense": _defence,
  "skill": _skills,

};


List<Map<String , String>> get statsAsFormattedList=>[
  {'Title': 'health', 'value': _health.toString()},
  {'Title': 'attack', 'value': _attack.toString()},
  {'Title': 'defence', 'value': _defence.toString()},
  {'Title': 'skills', 'value': _skills.toString()},

];
 //Methods


 void increaseStat (String stat){
   if (_points >0){
     if(stat =='Health'){
       _health ++;
     }
     if(stat =='attack'){
       _attack ++;
     }
     if(stat =='defense'){
       _defence ++;
     }
     if(stat =='skill'){
       _skills ++;
     }

   }
 }



 void decreaseStat(String stat){
   if (stat == 'health' && _health >5){
     _health--;
     _points++;
   }
   if (stat == 'attack' && _attack >5){
     _attack--;
     _points++;
   }
   if (stat == 'defence' && _defence>5){
     _defence--;
     _points++;
   }
   if (stat == 'skill' && _skills >5){
     _skills--;
     _points++;
   }

 }
}


