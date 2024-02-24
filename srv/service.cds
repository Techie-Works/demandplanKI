using kenafricproduction as my from '../db/schema';

service Demandservice @(path:'/processor') {
  entity Demand as projection on my.Demands{
    *,
    to_section.name as Section,
    @Common.Text: Section
    to_section,


  } actions {
    action rejectOutput();
    action acceptOutput();
  };

    
  //annotate Breakdowns {
   // to_machine @Common.Text: MachineName;
  //}
 

 

   
   annotate Demand with @odata.draft.enabled;
   annotate my.MasterData with @cds.autoexpose @readonly

  
}


