create database NFL2023;

use NFL2023;

create table if not exists positions(
position_Id int not null primary key,
descPosition varchar(30)
);

create table if not exists skills(
skillLevels_Id int not null primary key,
descSkills varchar(30)
);

create table if not exists coach(
coach_Id int not null primary key auto_increment,
firstName varchar(20),
lastName varchar(20)
);

create table if not exists teams(
team_Id int not null primary key auto_increment,
coach_Id int not null,
nameTeam varchar(30) not null,
city varchar(30)not null,
foreign key (coach_Id) references coach (coach_Id)
);

create table if not exists players(
player_Id int not null primary key auto_increment,
team_Id int,
position_Id int not null,
skillLevels_Id int not null,
firstName varchar(20),
lastName varchar(20),
Captain boolean,
foreign key (team_Id) references teams (team_Id),
foreign key (position_Id) references positions (position_Id),
foreign key (skillLevels_Id) references skills (skillLevels_Id)
);

CREATE TABLE matchday (
matchday_ID int not null primary key auto_increment,
matchDate date not null
);

create table if not exists matches (
matches_Id int not null primary key auto_increment,
matchday_Id int,
HomeTeam int,
AwayTeam int,
HomeTeamScore int,
AwayTeamScore int,
foreign key (matchday_Id) references matchday (matchday_Id),
foreign key (HomeTeam) references teams (team_Id),
foreign key (AwayTeam) references teams (team_Id)
);

create table if not exists injuryDescription(
desc_Id int not null primary key auto_increment,
descInjury varchar(40) not null
);

create table if not exists injury(
injury_Id int not null primary key auto_increment,
player_Id int,
matches_Id int,
desc_Id int,
foreign key (player_Id) references players (player_Id),
foreign key (matches_Id) references matches (matches_Id),
foreign key (desc_Id) references injuryDescription (desc_Id)
);

insert into positions (position_Id, descPosition) values
(1,"Center"),
(2,"Cornerback"),
(3,"Defensive Back"),
(4,"Defensive End"),
(5,"Defensive Tackle"),
(6,"Guard"),
(7,"Kicker"),
(8,"Linebacker"),
(9,"Long Snaper"),
(10,"Offensive Line"),
(11,"Punter"),
(12,"Quarterback"),
(13,"Running Back"),
(14,"Safety"),
(15,"Offensive Tackle"),
(16,"Tight End"),
(17,"Wide Receiver"),
(18,"Defensive Lineman"),
(19,"Fullback"),
(20,"Outside Linebacker "),
(21,"Offensive Tackle");

insert into skills (skillLevels_Id, descSkills) values

(1,"Endurance"),
(2,"Spatial awareness"),
(3,"Speed"),
(4,"Tactical knowledge"),
(5,"Coordination"),
(6,"Mental strength");

insert into coach (firstName, lastName) values

("Andy","Reid"),
("Kyle","Shanahan"),
("Nick","Sirianni"),
("Mike","McDaniel"),
("Doug","Pederson"),
("John","Harbaugh"),
("Dan","Campbell"),
("Mike","McCarthy"),
("Kevin","Stefanski"),
("Pete","Carroll");

insert into	teams (coach_Id, nameTeam, city) values

(1,"Kansas City Chiefs","Kansas"),
(2,"San Francisco 49ers","San Francisco"),
(3,"Philadelphia Eagles","Philadelphia"),
(4,"Miami Dolphins ","Miami"),
(5,"Jacksonville Jaguars","Jacksonville"),
(6,"Baltimore Ravens","Baltimore"),
(7,"Detroit Lions","Detroit"),
(8,"Dallas Cowboys ","Dallas"),
(9,"Cleveland Browns","Cleveland"),
(10,"Seattle Seahawks","Seattle");

insert into players (team_Id, position_Id, skillLevels_Id, firstName, lastName, Captain)  values

(1,1,1,"Creed","Humphrey",0),
(1,2,1,"Nic","Jones",0),
(1,2,3,"Trent","McDuffie",0),
(1,2,5,"L'Jarius","Sneed",0),
(1,2,1,"Jaylen","Watson",0),
(1,2,2,"Joshua","Williams",0),
(1,3,1,"Chamarri","Conner",0),
(1,4,1,"Felix","Anudike-Uzomah",0),
(1,4,3,"Mike","Danna",0),
(1,4,4,"Neil","Farrell",0),
(1,4,5,"Malik","Herring",0),
(1,4,1,"George","Karlaftis",0),
(1,4,2,"Charles","Omenihu",0),
(1,4,6,"BJ","Thompson",0),
(1,5,1,"Matt","Dickerson",0),
(1,5,2,"Chris","Jones",0),
(1,5,5,"Derrick","Nnadi",0),
(1,5,1,"Tershawn","Wharton",0),
(1,6,1,"Nick","Allegretti",0),
(1,6,1,"Trey","Smith",0),
(1,6,2,"Joe","Thuney",0),
(1,7,2,"Harrison","Butker",0),
(1,8,2,"Leo","Chenal",0),
(1,8,2,"Jack","Cochrane",0),
(1,8,1,"Willie","Gay",0),
(1,8,2,"Darius","Harris",0),
(1,8,3,"Cam","Jones",0),
(1,8,4,"Drue","Tranquill",0),
(1,9,5,"James","Winchester",0),
(1,10,6,"Mike","Caliendo",0),
(1,10,1,"Wanya","Morris",0),
(1,11,2,"Tommy","Townsend",0),
(1,12,3,"Blaine","Gabbert",0),
(1,12,4,"Patrick","Mahomes ",1),
(1,13,5,"Clyde","Edwards-Helaire",0),
(1,13,6,"Jerick","McKinnon",0),
(1,13,1,"Isiah","Pacheco",0),
(1,14,2,"Bryan","Cook",0),
(1,14,3,"Mike","Edwards",0),
(1,14,4,"Justin","Reid",0),
(1,15,5,"Lucas","Niang",0),
(1,15,6,"Donovan","Smith",0),
(1,15,3,"Jawaan","Taylor",0),
(1,16,2,"Blake","Bell",0),
(1,16,3,"Noah","Gray",0),
(1,16,4,"Travis","Kelce",1),
(1,17,5,"Mecole","Hardman",0),
(1,17,6,"Richie","James",0),
(1,17,1,"Skyy","Moore",0),
(1,17,6,"Rashee","Rice",0),
(1,17,3,"Kadarius","Toney",0),
(1,17,4,"Marquez","Valdes-Scantling",0),
(1,17,5,"Justin","Watson",0),
(2,2,1,"Darrell","Luter",0),
(2,2,2,"Isaiah","Oliver",0),
(2,2,3,"Ambry","Thomas",0),
(2,2,4,"Charvarius","Ward",0),
(2,2,5,"Samuel","Womack",0),
(2,3,6,"Deommodore","Lenoir",0),
(2,18,1,"Arik","Armstead",1),
(2,18,2,"Nick","Bosa",0),
(2,18,3,"Kalia","Davis",0),
(2,18,4,"Clelin","Ferrell",0),
(2,18,5,"Kevin","Givens",0),
(2,18,6,"Javon","Hargrave",0),
(2,18,1,"Chase","Young",0),
(2,5,1,"Javon","Kinlaw",0),
(2,19,1,"Kyle","Juszczyk",0),
(2,7,1,"Jake","Moody",0),
(2,8,1,"Oren","Burks",0),
(2,8,1,"Demetrius","Flannigan-Fowles",0),
(2,8,1,"Jalen","Graham",0),
(2,8,1,"Dre","Greenlaw",0),
(2,8,1,"Randy","Gregory",0),
(2,8,4,"Fred","Warner",1),
(2,8,5,"Dee","Winters",0),
(2,9,6,"Taybor","Pepper",0),
(2,10,1,"Aaron","Banks",0),
(2,10,2,"Ben","Bartch",0),
(2,10,3,"Jake","Brendel",0),
(2,10,4,"Spencer","Burford",0),
(2,10,5,"Jon","Feliciano",0),
(2,10,6,"Colton","McKivitz",0),
(2,10,1,"Jaylon","Moore",0),
(2,10,2,"Matt","Pryor",0),
(2,11,3,"Mitch","Wishnowsky",0),
(2,12,4,"Brandon","Allen",0),
(2,12,5,"Sam","Darnold",0),
(2,12,6,"Brock","Purdy",1),
(2,13,1,"Tyrion","Davis-Price",0),
(2,13,2,"Jordan","Mason",0),
(2,13,3,"Christian","McCaffrey",0),
(2,13,4,"Elijah","Mitchell",0),
(2,14,5,"Ji'Ayir","Brown",0),
(2,14,6,"Tashaun","Gipson",0),
(2,14,1,"George","Odum",0),
(2,14,2,"Trent","Williams",1),
(2,16,3,"Ross","Dwelley",0),
(2,16,4,"George","Kittle",1),
(2,16,5,"Brayden","Willis",0),
(2,16,6,"Charlie","Woerner",0),
(2,17,1,"Brandon","Aiyuk",0),
(2,17,2,"Ronnie","Bell",0),
(2,17,3,"Jauan","Jennings",0),
(2,17,4,"Ray-Ray","McCloud",0),
(2,17,5,"Deebo","Samuel",1),
(3,1,1,"Jason","Kelce",0),
(3,2,2,"James","Bradberry",0),
(3,2,3,"Josh","Jobe",0),
(3,2,4,"Eli","Ricks",0),
(3,2,5,"Kelee","Ringo",0),
(3,2,6,"Bradley","Roby",0),
(3,2,1,"Darius","Slay",1),
(3,3,2,"Josiah","Scott",0),
(3,4,3,"Brandon","Graham",1),
(3,4,4,"Josh","Sweat",0),
(3,5,5,"Jalen","Carter",0),
(3,5,6,"Fletcher","Cox",0),
(3,5,1,"Jordan","Davis",0),
(3,5,2,"Moro","Ojomo",0),
(3,5,3,"Marlon","Tuipulotu",0),
(3,5,4,"Milton","Williams",0),
(3,6,5,"Landon","Dickerson",0),
(3,6,6,"Sua","Opeta",0),
(3,7,1,"Jake","Elliott",1),
(3,8,2,"Zach","Cunningham",0),
(3,8,3,"Christian","Elliss",0),
(3,8,4,"Patrick","Johnson",0),
(3,8,5,"Nicholas","Morrow",0),
(3,8,6,"Haason","Reddick",0),
(3,8,1,"Nolan","Smith",0),
(3,9,2,"Rick","Lovato",0),
(3,10,3,"Tyler","Steen",0),
(3,11,1,"Braden","Mann",0),
(3,12,1,"Jalen","Hurts",1),
(3,12,1,"Marcus","Mariota",0),
(3,12,1,"Tanner","McKee",0),
(3,13,2,"Kenneth","Gainwell",0),
(3,13,3,"Rashaad","Penny",0),
(3,13,1,"Boston","Scott",0),
(3,13,5,"D'Andre","Swift",0),
(3,14,6,"Reed","Blankenship",0),
(3,14,1,"Sydney","Brown",0),
(3,14,1,"Kevin","Byard",0),
(3,15,3,"Lane","Johnson",0),
(3,15,4,"Fred","Johnson",0),
(3,15,5,"Jordan","Mailata",0),
(3,16,6,"Grant","Calcaterra",0),
(3,16,1,"Dallas","Goedert",0),
(3,16,2,"Albert","Okwuegbunam",0),
(3,16,3,"Jack","Stoll",0),
(3,17,4,"A.J.","Brown",1),
(3,17,5,"Britain","Covey",0),
(3,17,6,"Julio","Jones",0),
(3,17,1,"DeVonta","Smith",1),
(3,17,2,"Quez","Watkins",0),
(3,17,3,"Olamide","Zaccheaus",0),
(4,13,1,"De'Von","Achane",0),
(4,2,2,"Eli","Apple",0),
(4,15,3,"Terron","Armstead",1),
(4,11,4,"Jake","Bailey",0),
(4,8,5,"Jerome","Baker",0),
(4,17,6,"Braxton","Berrios",0),
(4,2,1,"Justin","Bethel",0),
(4,3,2,"Elijah","Campbell",0),
(4,17,3,"Robbie","Chosen",0),
(4,8,4,"Bradley","Chubb",0),
(4,17,5,"Chase","Claypool",0),
(4,6,6,"Lester","Cotton",0),
(4,17,1,"River","Cracraft",0),
(4,5,2,"Raekwon","Davis",0),
(4,10,3,"Liam","Eichenberg",0),
(4,14,4,"DeShon","Elliott",0),
(4,9,5,"Blake","Ferguson",0),
(4,8,6,"Cameron","Goode",0),
(4,5,1,"Da'Shawn","Hand",0),
(4,16,2,"Julian","Hill",0),
(4,17,3,"Tyreek","Hill",1),
(4,14,4,"Jevon","Holland",1),
(4,2,5,"Xavien","Howard",1),
(4,10,6,"Robert","Hunt",0),
(4,10,1,"Austin","Jackson",0),
(4,14,2,"Brandon","Jones",0),
(4,10,3,"Robert","Jones",0),
(4,2,4,"Kader","Kohou",0),
(4,16,5,"Tyler","Kroft",0),
(4,15,6,"Kendall","Lamm",0),
(4,8,1,"David","Long",0),
(4,13,2,"Raheem","Mostert",0),
(4,2,3,"Nik","Needham",0),
(4,4,4,"Emmanuel","Ogbah",0),
(4,8,5,"Jaelan","Phillips",0),
(4,2,6,"Jalen","Ramsey",0),
(4,8,1,"Duke","Riley",0),
(4,7,2,"Jason","Sanders",0),
(4,5,3,"Zach","Sieler",0),
(4,2,4,"Cam","Smith",0),
(4,15,5,"Kion","Smith",0),
(4,16,6,"Durham","Smythe",0),
(4,12,1,"Tua","Tagovailoa",1),
(4,12,2,"Skylar","Thompson",0),
(4,8,3,"Channing","Tindall",0),
(4,8,4,"Andrew","Van",0),
(4,17,5,"Jaylen","Waddle",0),
(4,12,6,"Mike","White",0),
(4,5,1,"Christian","Wilkins",1),
(4,10,2,"Connor","Williams",0),
(4,17,3,"Cedrick","Wilson",0),
(4,13,4,"Jeff","Wilson",0),
(5,8,1,"Yasir","Abdullah",0),
(5,20,2,"Josh","Allen",0),
(5,12,3,"C.J.","Beathard",0),
(5,13,4,"Tank","Bigsby",0),
(5,18,5,"Angelo","Blackson",0),
(5,2,6,"Montaric","Brown",0),
(5,2,1,"Tyson","Campbell",0),
(5,20,2,"K'Lavon","Chaisson",0),
(5,14,3,"Andre","Cisco",0),
(5,10,4,"Ezra","Cleveland",0),
(5,11,5,"Logan","Cooke",0),
(5,17,6,"Elijah","Cooks",0),
(5,16,1,"Evan","Engram",0),
(5,13,2,"Travis","Etienne",0),
(5,16,3,"Luke","Farrell",0),
(5,18,4,"Folorunso","Fatukasi",0),
(5,10,5,"Luke","Fortner",0),
(5,18,6,"Adam","Gotsis",0),
(5,5,1,"DaVon","Hamilton",0),
(5,10,2,"Blake","Hance",0),
(5,21,1,"Anton","Harrison",0),
(5,2,1,"Tre","Herndon",0),
(5,14,1,"Rayshawn","Jenkins",0),
(5,14,1,"Antonio","Johnson",0),
(5,8,1,"Caleb","Johnson",0),
(5,13,1,"D'Ernest","Johnson",0),
(5,17,1,"Zay","Jones",0),
(5,17,4,"Tim","Jones",0),
(5,2,5,"Gregory","Junior",0),
(5,17,6,"Christian","Kirk",0),
(5,4,1,"Tyler","Lacy",0),
(5,12,2,"Trevor","Lawrence",1),
(5,18,3,"Jeremiah","Ledbetter",0),
(5,10,4,"Walker","Little",0),
(5,8,5,"Devin","Lloyd",0),
(5,9,6,"Ross","Matiscik",0),
(5,7,1,"Brandon","McManus",1),
(5,8,2,"Chad","Muma",0),
(5,8,3,"Foyesade","Oluokun",1),
(5,2,4,"Amani","Oruwariye",0),
(5,8,5,"Shaquille","Quarterman",0),
(5,17,6,"Calvin","Ridley",0),
(5,18,1,"Roy","Robertson-Harris",1),
(5,10,2,"Cam","Robinson",0),
(5,12,3,"Nathan","Rourke",0),
(5,10,4,"Brandon","Scherff",0),
(5,10,5,"Tyler","Shatley",0),
(5,20,6,"Dawuane","Smoot",0),
(5,16,1,"Brenton","Strange",0),
(5,14,2,"Daniel","Thomas",0),
(5,10,3,"Cole","Van",0),
(5,20,4,"Travon","Walker",0),
(5,17,5,"Parker","Washington",0),
(5,2,6,"Darious","Williams",0),
(5,14,1,"Andrew","Wingard",1),
(6,17,1,"Nelson","Agholor",0),
(6,16,2,"Mark","Andrews",0),
(6,2,3,"Jalyn","Armour-Davis",1),
(6,17,4,"Rashod","Bateman",0),
(6,17,5,"Odell","Beckham",0),
(6,6,6,"Ben","Cleveland",0),
(6,20,1,"Jadeveon","Clowney",0),
(6,2,2,"Ronald","Darby",0),
(6,17,3,"Devin","Duvernay",0),
(6,13,4,"Gus","Edwards",0),
(6,15,5,"Daniel","Faalele",0),
(6,17,6,"Zay","Flowers",0),
(6,14,6,"Kyle","Hamilton",0),
(6,8,6,"Malik","Harrison",0),
(6,13,6,"Justice","Hill",0),
(6,2,6,"Marlon","Humphrey",0),
(6,12,5,"Tyler","Huntley",1),
(6,12,6,"Lamar","Jackson",0),
(6,12,1,"Josh","Johnson",0),
(6,5,2,"Travis","Jones",0),
(6,16,3,"Charlie","Kolar",0),
(6,16,4,"Isaiah","Likely",0),
(6,1,5,"Tyler","Linderbaum",0),
(6,5,6,"Justin","Madubuike",0),
(6,2,1,"Arthur","Maulet",0),
(6,10,2,"Patrick","Mekari",1),
(6,13,3,"Keaton","Mitchell",0),
(6,15,4,"Morgan","Moses",0),
(6,1,5,"Sam","Mustipher",0),
(6,9,6,"Tyler","Ott",0),
(6,20,1,"Odafe","Oweh",0),
(6,8,2,"Del'Shawn","Phillips",0),
(6,19,3,"Patrick","Ricard",0),
(6,20,4,"Tavius","Robinson",0),
(6,6,5,"John","Simpson",0),
(6,8,6,"Trenton","Simpson",0),
(6,8,1,"Roquan","Smith",0),
(6,15,2,"Ronnie","Stanley",0),
(6,3,3,"Brandon","Stephens",0),
(6,14,4,"Geno","Stone",0),
(6,11,5,"Jordan","Stout",0),
(6,7,6,"Justin","Tucker",0),
(6,4,1,"Brent","Urban",0),
(6,20,2,"Kyle","Van",0),
(6,17,3,"Tylan","Wallace",0),
(6,5,4,"Broderick","Washington",0),
(6,14,5,"Marcus","Williams",0),
(6,3,6,"Daryl","Worley",0),
(6,2,1,"Rock","Ya-Sin",0),
(6,6,2,"Kevin","Zeitler",0),
(7,8,1,"Alex","Anzalone",1),
(7,6,2,"Kayode","Awosika",0),
(7,8,3,"Derrick","Barnes",0),
(7,3,4,"Brian","Branch",0),
(7,12,5,"Teddy","Bridgewater",0),
(7,18,6,"Isaiah","Buggs",0),
(7,8,1,"Jack","Campbell",0),
(7,18,2,"John","Cominsky",0),
(7,15,3,"Taylor","Decker",0),
(7,2,4,"Khalil","Dorsey",0),
(7,11,5,"Jack","Fox",0),
(7,13,1,"Jahmyr","Gibbs",0),
(7,2,1,"Steven","Gilmore",0),
(7,10,1,"Graham","Glasgow",0),
(7,12,1,"Jared","Goff",1),
(7,17,1,"Antoine","Green",0),
(7,18,5,"Charles","Harris",1),
(7,2,6,"Will","Harris",0),
(7,18,1,"Aidan","Hutchinson",0),
(7,6,2,"Jonah","Jackson",0),
(7,2,3,"Jerry","Jacobs",0),
(7,18,4,"Benito","Jones",0),
(7,14,5,"Kerby","Joseph",0),
(7,16,4,"Sam","LaPorta",0),
(7,2,4,"Chase","Lucas",0),
(7,18,4,"Brodric","Martin",0),
(7,18,4,"Alim","McNeill",0),
(7,9,4,"Jake","McQuaide",0),
(7,14,4,"Ifeatu","Melifonwu",0),
(7,16,4,"James","Mitchell",0),
(7,13,1,"David","Montgomery",0),
(7,8,2,"Trevor","Nowaske",0),
(7,8,3,"Julian","Okwara",0),
(7,18,4,"Romeo","Okwara",0),
(7,18,5,"Levi","Onwuzurike",0),
(7,18,6,"Josh","Paschal",0),
(7,7,1,"Riley","Patterson",0),
(7,17,2,"Donovan","Peoples-Jones",0),
(7,8,3,"Anthony","Pittman",0),
(7,1,4,"Frank","Ragnow",0),
(7,17,5,"Kalif","Raymond",0),
(7,8,6,"Jalen","Reeves-Maybin",1),
(7,13,1,"Craig","Reynolds",0),
(7,17,2,"Josh","Reynolds",0),
(7,8,3,"Malcolm","Rodriguez",0),
(7,15,4,"Penei","Sewell",1),
(7,15,5,"Dan","Skipper",0),
(7,10,6,"Colby","Sorsdal",0),
(7,17,1,"Amon-Ra","St.",1),
(7,2,2,"Cameron","Sutton",0),
(7,14,3,"Tracy","Walker",0),
(7,17,4,"Jameson","Williams",0),
(7,16,5,"Brock","Wright",0),
(8,11,1,"Bryan","Anger",0),
(8,4,2,"Dorance","Armstrong",0),
(8,7,3,"Brandon","Aubrey",0),
(8,6,6,"T.J.","Bass",0),
(8,14,5,"Markquese","Bell",0),
(8,1,6,"Tyler","Biadasz",0),
(8,2,5,"DaRon","Bland",0),
(8,17,6,"Jalen","Brooks",0),
(8,8,6,"Damone","Clark",0),
(8,17,5,"Brandin","Cooks",0),
(8,13,5,"Rico","Dowdle",0),
(8,6,6,"Chuma","Edoga",0),
(8,8,1,"Rashaan","Evans",0),
(8,16,2,"Jake","Ferguson",0),
(8,4,3,"Dante","Fowler",0),
(8,5,4,"Neville","Gallimore",0),
(8,17,5,"Michael","Gallup",0),
(8,2,6,"Stephon","Gilmore",0),
(8,4,1,"Chauncey","Golston",0),
(8,5,2,"Johnathan","Hankins",0),
(8,1,3,"Brock","Hoffman",0),
(8,14,4,"Malik","Hooker",0),
(8,2,5,"Noah","Igbinoghene",0),
(8,14,6,"Jayron","Kearse",0),
(8,17,1,"CeeDee","Lamb",0),
(8,12,2,"Trey","Lance",0),
(8,4,3,"DeMarcus","Lawrence",1),
(8,2,4,"Jourdan","Lewis",0),
(8,13,5,"Hunter","Luepke",0),
(8,6,6,"Zack","Martin",0),
(8,16,1,"Sean","McKeon",0),
(8,14,2,"Israel","Mukuamu",0),
(8,5,3,"Osa","Odighizuwa",0),
(8,8,4,"Micah","Parsons",0),
(8,13,5,"Tony","Pollard",1),
(8,12,6,"Dak","Prescott",0),
(8,10,1,"Asim","Richards",0),
(8,12,2,"Cooper","Rush",0),
(8,16,3,"Luke","Schoonmaker",0),
(8,2,4,"Eric","Scott",0),
(8,9,5,"Trent","Sieg",0),
(8,5,6,"Mazi","Smith",0),
(8,10,1,"Tyler","Smith",0),
(8,15,2,"Tyron","Smith",0),
(8,15,3,"Terence","Steele",0),
(8,14,4,"Juanyeh","Thomas",0),
(8,17,5,"Jalen","Tolbert",0),
(8,17,6,"KaVontae","Turpin",0),
(8,13,1,"Deuce","Vaughn",0),
(8,4,2,"Tyrus","Wheat",0),
(8,4,3,"Sam","Williams",0),
(8,14,4,"Donovan","Wilson",0),
(8,2,5,"Nahshon","Wright",0),
(9,8,1,"Matthew","Adams",0),
(9,16,2,"Jordan","Akins",0),
(9,14,3,"D'Anthony","Bell",0),
(9,17,4,"David","Bell",0),
(9,6,5,"Joel","Bitonio",1),
(9,11,6,"Corey","Bojorquez",0),
(9,16,1,"Harrison","Bryant",0),
(9,21,2,"Geron","Christian",0),
(9,17,2,"Amari","Cooper",0),
(9,14,4,"Grant","Delpit",0),
(9,8,2,"Mohamoud","Diabate",0),
(9,6,1,"Michael","Dunn",0),
(9,5,1,"Jordan","Elliott",0),
(9,2,2,"Martin","Emerson",0),
(9,8,1,"Tony","Fields",0),
(9,13,1,"Jerome","Ford",0),
(9,2,1,"Mike","Ford",0),
(9,4,1,"Myles","Garrett",1),
(9,17,1,"Marquise","Goodwin",0),
(9,2,2,"A.J.","Green",0),
(9,2,3,"Kahlef","Hailassie",0),
(9,1,4,"Nick","Harris",0),
(9,5,5,"Shelby","Harris",0),
(9,14,6,"Ronnie","Hickman",0),
(9,7,1,"Dustin","Hopkins",0),
(9,15,2,"James","Hudson",0),
(9,9,3,"Charley","Hughlett",1),
(9,13,4,"Kareem","Hunt",0),
(9,5,5,"Maurice","Hurst",0),
(9,5,6,"Siaki","Ika",0),
(9,15,1,"Dawand","Jones",0),
(9,8,2,"Jordan","Kunaszyk",0),
(9,14,3,"Tanner","McCalister",0),
(9,4,4,"Isaiah","McGuire",0),
(9,17,5,"Elijah","Moore",0),
(9,2,6,"Greg","Newsome",0),
(9,16,1,"David","Njoku",0),
(9,4,2,"Ogbo","Okoronkwo",0),
(9,8,3,"Jeremiah","Owusu-Koramoah",0),
(9,1,4,"Ethan","Pocic",0),
(9,17,5,"James","Proche",0),
(9,4,6,"Za'Darius","Smith",0),
(9,13,1,"Pierre","Strong",0),
(9,8,2,"Sione","Takitaki",0),
(9,6,3,"Wyatt","Teller",0),
(9,12,4,"Dorian","Thompson-Robinson",0),
(9,14,5,"Juan","Thornhill",0),
(9,17,6,"Cedric","Tillman",0),
(9,5,1,"Dalvin","Tomlinson",0),
(9,8,2,"Anthony","Walker",1),
(9,12,3,"P.J.","Walker",0),
(9,2,4,"Denzel","Ward",0),
(9,15,5,"Leroy","Watson",1),
(9,4,6,"Alex","Wright",0),
(9,1,1,"Luke","Wypler",0),
(10,4,1,"Myles","Adams",0),
(10,8,2,"Nick","Bellore",1),
(10,17,3,"Jake","Bobo",0),
(10,6,4,"Anthony","Bradford",0),
(10,8,5,"Jordyn","Brooks",0),
(10,1,6,"Evan","Brown",0),
(10,2,1,"Tre","Brown",0),
(10,2,2,"Artie","Burns",0),
(10,8,3,"Devin","Bush",0),
(10,13,4,"Zach","Charbonnet",0),
(10,8,5,"Frank","Clark",0),
(10,15,6,"Charles","Cross",0),
(10,6,5,"McClendon","Curtis",0),
(10,13,6,"DeeJay","Dallas",0),
(10,11,6,"Michael","Dickson",0),
(10,16,6,"Will","Dissly",0),
(10,4,5,"Mario","Edwards",0),
(10,17,6,"Dee","Eskridge",0),
(10,16,1,"Noah","Fant",0),
(10,15,2,"Stone","Forsythe",0),
(10,20,3,"Derick","Hall",0),
(10,6,4,"Phil","Haynes",0),
(10,2,5,"Michael","Jackson",0),
(10,4,6,"Dre'Mont","Jones",0),
(10,6,1,"Damien","Lewis",0),
(10,12,2,"Drew","Lock",0),
(10,17,3,"Tyler","Lockett",1),
(10,14,4,"Julian","Love",0),
(10,8,5,"Boye","Mafe",0),
(10,13,6,"Kenny","McIntosh",0),
(10,17,1,"DK","Metcalf",0),
(10,7,2,"Jason","Myers",1),
(10,21,3,"Raiqwon","O'Neal",0),
(10,1,4,"Olu","Oluwatimi",0),
(10,16,5,"Colby","Parkinson",0),
(10,14,6,"Jerrick","Reed",0),
(10,8,1,"Jon","Rhattigan",0),
(10,16,2,"Brady","Russell",0),
(10,12,3,"Geno","Smith",1),
(10,17,4,"Jaxon","Smith-Njigba",0),
(10,9,5,"Chris","Stoll",0),
(10,8,6,"Darrell","Taylor",0),
(10,8,1,"Bobby","Wagner",1),
(10,13,2,"Kenneth","Walker",0),
(10,4,3,"Leonard","Williams",0),
(10,2,4,"Devon","Witherspoon",0),
(10,2,5,"Riq","Woolen",0),
(10,5,6,"Cameron","Young",0),
(10,17,1,"Dareke","Young",0);

insert into matchday (matchDate) values
("2023-10-08"),
("2023-10-09"),
("2023-10-15"),
("2023-10-16");

insert into matches (matchday_Id, HomeTeam, AwayTeam, HomeTeamScore, AwayTeamScore) values
(1,1,2,44,23),
(1,3,4,31,17),
(2,5,6,7,23),
(2,7,8,6,24),
(2,9,10,24,24),
(3,1,6,36,36),
(3,2,7,41,33),
(3,3,8,13,33),
(4,4,9,39,1),
(4,5,10,7,31);

select * from matches;

insert into injuryDescription (descInjury) values
("Ankle sprains"),
("Knee injuries"),
("Hamstring"),
("Hip pointers"),
("Shoulder dislocations"),
("Acromioclavicular sprains"),
("Wrist and hand injuries"),
("Football concussions");

insert into injury (player_Id, matches_Id, desc_Id) values
(130,2,1),
(170,2,4),
(171,2,6),
(214,3,7),
(287,3,1),
(288,3,8),
(324,4,6),
(378,4,3),
(446,5,1),
(480,5,3),
(130,8,6),
(480,10,4),
(324,7,2),
(1,1,3),
(2,1,5),
(102,1,4),
(107,1,5),
(119,1,5);

select * from players;

/*1-List all captains ID with their first, last name and Team.*/
/*  While NFL rules state that teams may name up to six captains, this rule is not strictly enforced.*/

select 
    p.firstName as Captain_FirstName,
    p.lastName as Captain_LastName,
    t.nameTeam as Team_Name
from
    players p
join 
    teams t on p.team_Id = t.team_Id
where 
    p.Captain = 1;
    
    
    
/* 2-List all unique positions found in the database.*/
    
select distinct descPosition from positions;



/* 3-List all the football players’ names ordered alphabetically in ascending order, 
i.e. first name and last name in alphabetical order, for a particular team, 
and display their Last Name first*/

select 
	p.lastName as player_lastname,
    p.firstName as player_firstName,
    t.nameTeam as Team_Name
from 
	players p
join
	teams t on p.team_Id = t.team_Id
where
	p.team_Id = 1
order by 
	player_lastname asc;


    
/* 4- Count how many teams won, lost or draw on the last matchday*/

select
    t.nameTeam as TeamName,
    case
        when m.HomeTeamScore > m.AwayTeamScore and t.team_Id = m.HomeTeam then 'Win'
        when m.HomeTeamScore < m.AwayTeamScore and t.team_Id = m.HomeTeam then 'Loss'
        when m.HomeTeamScore < m.AwayTeamScore and t.team_Id = m.AwayTeam then 'Win'
        when m.HomeTeamScore > m.AwayTeamScore and t.team_Id = m.AwayTeam then 'Loss'
        else 'Draw'
		end as Match_Result
from
    matches m
    join teams t on t.team_Id = m.HomeTeam or t.team_Id = m.AwayTeam
    join matchday md on m.matchday_Id = md.matchday_ID
where
    md.matchday_Id = 4
order by Match_Result;
    
    

/* 5- Provide the list with all the details of the football 
players, of the teams that lost the first matchday, 
and sort them by skill level in ascending order */

select * from matches;

select
    p.skillLevels_Id,
    p.firstName,
    p.lastName,
    t.nameTeam as Team_name
from
	players p
join
	teams t on p.team_Id = t.team_Id
join
	matches m on t.team_Id = m.HomeTeam OR t.team_Id = m.AwayTeam
where
	m.matchday_Id = 1
    AND (
		(m.HomeTeamScore < m.AwayTeamScore and t.team_Id = m.HomeTeam)
    or
		(m.HomeTeamScore >m.AwayteamScore and t.team_Id = m.AwayTeam)
        )
order by
    p.skillLevels_Id ASC;



/*6- How many football players with a low skill level had or has an injury?*/

select
    COUNT(*) as lowSkillLevel_Injury
from
    players p
join
    injury i ON p.player_Id = i.player_Id
where
    p.skillLevels_Id = 1;
    



/* 7- How many football players have had more than one injury? 
Display the information of the football player, including the 
information of the Team (name and city) and they type and the dates of the 
injuries*/

select 

    concat(p.firstname,' ',p.lastname) as Full_Name,
    t.nameTeam AS teamName,
    t.city AS teamCity,
    count(i.desc_Id) as Number_Of_Injuries
from
	players p
join
	teams t on p.team_Id = t.team_Id
join
	injury i on p.player_Id = i.player_Id
where
	p.player_Id 
in(
		select
			player_Id
		from
			injury
		group by
			player_Id
		having
			count(*) > 1
	)
group by
	p.player_Id
order by
	full_name;
    
select 
    concat(p.firstname,' ',p.lastname) as Full_Name,
    t.nameTeam AS teamName,
    t.city AS teamCity,
    group_concat(des.descInjury) as Injury_Type,
    group_concat(md.matchDate) as Injury_Date
from
	players p
join
	teams t on p.team_Id = t.team_Id
join
	injury i on p.player_Id = i.player_Id
join
	injurydescription des on i.desc_Id = des.desc_Id
join
	matchday md on i.matches_Id = md.matchday_Id
where
	p.player_Id 
in(
		select
			player_Id
		from
			injury
		group by
			player_Id
		having
			count(distinct injury_Id) > 1
	)
GROUP BY
    p.player_Id
order by
	p.player_Id;
    

/*8- Display a list of the most common injuries and order them by ascending order.*/

select 
	descInjury, COUNT(*) as InjuryCount
from 
	injuryDescription
join 
	injury on injury.desc_Id = injuryDescription.desc_Id
group by 
	descInjury
order by 
	InjuryCount desc;
    
    
    
/*9- Which match date has more draws? Show a list of the teams that 
have draw that date and their score.*/

select
    md.matchDate,
    t1.nameTeam as HomeTeam,
    t2.nameTeam as AwayTeam,
    m.HomeTeamScore,
    m.AwayTeamScore
from
    matches m
join 
	matchday md on m.matchday_Id = md.matchday_ID
join 
	teams t1 on m.HomeTeam = t1.team_Id
join 
	teams t2 on m.AwayTeam = t2.team_Id
where
    m.HomeTeamScore = m.AwayTeamScore
order by
    md.matchDate;
    
    /*10- Count how many players have a low skill level, medium skill level and high 
    skill level, group them by team and sort them in an increasing order.*/
    
SELECT
    t.nameTeam AS TeamName,
    case
        when s.skillLevels_Id in (1, 2) then 'Low Skill'
        when s.skillLevels_Id in (3, 4) then 'Medium Skill'
        when s.skillLevels_Id in (5, 6) then 'High Skill'
        else 'no skills'
    end as SkillLevel,
    COUNT(p.player_Id) as PlayerCount
from
    teams t
join 
    players p on t.team_Id = p.team_Id
join 
    skills s on p.skillLevels_Id = s.skillLevels_Id
group by
    t.team_Id, SkillLevel
order by
    t.team_Id asc;