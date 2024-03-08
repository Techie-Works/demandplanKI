namespace kenafricproduction;

aspect MasterData {}


// Value stream id sequence 100
entity Sections   : MasterData {
    key sectionID : String(3);
    name              : String(40);
    target          :  Integer;
};

