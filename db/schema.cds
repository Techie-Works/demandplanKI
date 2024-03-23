using { custom.managed, sap.common.CodeList, cuid } from './common';

using {
    kenafricproduction.Sections,
    kenafricproduction.Lines,
    } from './master-data.cds';

namespace kenafricproduction;

entity Demands : managed, cuid {
    key demandID         : UUID;
    to_section           : Association to Sections;
    date                 : Date @cds.on.insert : $now;
    demand               : Integer; // Quantity demanded (in units)
    daysplanned          : Integer @readonly default 24;
    descr                : String;
    total_output         : Integer @readonly;
    to_output            : Composition of many Outputs on to_output.to_demand = $self;
    to_status            : Association to DemandStatus;
    to_newdemand         : Composition of many NewDemand on to_newdemand.to_demand = $self;
};
entity NewDemand : managed, cuid {
  reason : String;
  to_demand : Association to Demands;
  demand_Addition : Integer;
}
entity Outputs : managed, cuid{
    Key  outputId               : UUID;
    date                  : Date;
    output                : Integer;
    to_demand             : Association to  Demands;
    to_line               : Association to  Lines;

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

