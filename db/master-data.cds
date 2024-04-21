namespace kenafricproduction;

aspect MasterData {}


// Value stream id sequence 100
entity Sections   : MasterData {
    key sectionID : String(3);
    name              : String(40);

};

// Line id sequence 200
entity Lines : MasterData {
    Key  lineID      : String(20) ;
    linename         : String(20);
    section           : Association to  Sections;
    target            : Integer;
}
