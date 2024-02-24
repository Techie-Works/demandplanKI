using { custom.managed, sap.common.CodeList, cuid } from './common';

using {
    kenafricproduction.Sections,
    } from './master-data.cds';

namespace kenafricproduction;

entity Demands : managed, cuid {
    key demandID         : UUID;
    to_section           : Association to Sections;
    date                 : Date;
    demand               : Integer; // Quantity demanded (in units)
    daysplanned          : Integer;
    descr                : String;
    total_output               : Integer @readonly;
    to_output            : Composition of many Outputs on to_output.to_demand = $self;
};

entity Outputs : managed, cuid{
    Key  outputId               : UUID;
    date                  : Date;
    output                : Integer;
    to_demand             : Association to  Demands;
}

entity DemandStatus : CodeList {
  key code : String enum {
    Open     = 'O';
    Fullfilled = 'F';
    Canceled = 'X';
  } default 'O'; //> will be used for foreign keys as well
  criticality : Integer; //  2: yellow colour,  3: green colour, 0: unknown
  fieldControl: Integer @odata.Type:'Edm.Byte'; // 1: #ReadOnly, 7: #Mandatory
  createDeleteHidden: Boolean;
  insertDeleteRestriction: Boolean; // = NOT createDeleteHidden
};