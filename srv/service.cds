using kenafricproduction as my from '../db/schema';

service Demandservice @(path:'/processor') {
  entity Demand as projection on my.Demands{
    *,
    to_section.name as Section,
    @Common.Text: Section
    to_section,
    // Define calculated field
   

// this.before ('CREATE', 'Outputs', async req => {
//     const { maxID } = await SELECT.one `max(output) as maxID` .from (Outputs)
//     console.log(maxID)
//     // req.data.TravelID = maxID + 1
//   })

    to_status.name as DemandStatusName,
    @Common.Text: DemandStatusName
    to_status
  } actions {
    action fullfilled();
    action cancel();
  } 

   

    
  //annotate Breakdowns {
   // to_machine @Common.Text: MachineName;
  //}
 

 

   
   annotate Demand with @odata.draft.enabled;
   annotate my.MasterData with @cds.autoexpose @readonly;
  
};
 
service AnalyticsService {
  entity Outputs as projection on my.Outputs;
  entity Demands as select from  my.Demands, my.Outputs{
    Key Demands.demandID,
    Demands.demand,
    to_section.name,
    to_section.target,
    @Core.Computed
    sum(output) as totaloutput : Integer,
    count(Outputs.outputId) as numberOfDays: Integer,
    Demands.daysplanned as  daysPlanned : Integer,
    (count(Outputs.outputId)*100)/(Demands.daysplanned) as capacityutil : Decimal(2, 2),
    ((sum(output))/(count(Outputs.outputId))) as averagerunrate: Integer,
    ((((sum(output))/(count(Outputs.outputId)))*100)/to_section.target) as  efficiency: Decimal,
    ((Demands.demand)-(sum(output))) as balancetoproduce: Integer,
    (((sum(output))*100)/(Demands.demand)) as productionefficiency : Decimal(2, 2),
    (((sum(output))*100)/(Demands.demand)) as Planachevement : Decimal(2, 2),
    (Demands.daysplanned - count(Outputs.outputId))*((sum(output))/(count(Outputs.outputId))) as Remdaysoutput :Decimal(2, 2),
    ((Demands.demand-(sum(output)))/((sum(output))/(count(Outputs.outputId)))) as days2close : Decimal(2, 2),
    ((Demands.daysplanned - count(Outputs.outputId))*((sum(output))/(count(Outputs.outputId))) + sum(output)) -(Demands.demand) as expectedloss : Integer
    
  } where Demands.to_output.ID = Outputs.ID
  group by Demands.demandID;

    
};



//sample code

