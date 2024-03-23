namespace kenafricproduction;

aspect MasterData {}


// Value stream id sequence 100
entity Sections   : MasterData {
    key sectionID : String(3);
    name              : String(40);
    line            : Composition of many Lines on line.section = $self;
};

// Line id sequence 200
entity Lines : MasterData {
    Key  lineID      : String(5) ;
    linename         : String(20);
    section           : Association to  Sections;
    target            : Integer;
}
