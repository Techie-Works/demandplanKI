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
//   })wdeman
   to_status.name as TravelStatusName,
    @Common.Text: TravelStatusName
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
  entity NewDemand as  projection on my.NewDemand;
  entity Demands as select from  my.Demands, my.Outputs{
    Key Demands.demandID,
    Demands.demand as Demand,
    to_section.name as Section,
    output, //TO REMOVE
    @Core.Computed
    (sum(to_output.to_line.target))/(count(to_output.to_line.target)) as Target :Integer, //AVG TARGET
    sum(to_newdemand.demand_Addition) as NewDemand : Integer,  
    sum(output) as totaloutput : Integer,
    count(Outputs.outputId) as numberOfDays: Integer,
    Demands.daysplanned as  daysPlanned : Integer,
    (count(Outputs.outputId)*100)/(Demands.daysplanned) as capacityutil : Decimal(2, 2),
    ((sum(output))/(count(Outputs.outputId))) as averagerunrate: Integer,
    ((((sum(output))/(count(Outputs.outputId)))*100)/to_section.line.target) as  efficiency: Decimal,
    ((Demands.demand + (sum(to_newdemand.demand_Addition)))-(sum(output))) as balancetoproduce: Integer,
    (((sum(output))*100)/(Demands.demand )) as productionefficiency : Decimal(2, 2),
    (((sum(output))*100)/(Demands.demand + (sum(to_newdemand.demand_Addition)))) as afterproductionefficiency : Decimal(2, 2),
    (((sum(output))*100)/(Demands.demand)) as Planacheivement : Decimal(2, 2),
    (((sum(output))*100)/(Demands.demand+ (sum(to_newdemand.demand_Addition)))) as afterPlanachievement : Decimal(2, 2),//REPEATED
    (Demands.daysplanned - count(Outputs.outputId))*((sum(output))/(count(Outputs.outputId))) as Remdaysoutput :Decimal(2, 2),
    (((Demands.demand + (sum(to_newdemand.demand_Addition)))-(sum(output)))/((sum(output))/(count(Outputs.outputId)))) as days2close : Decimal(2, 2), //COMPARE TO DAYS
    ((Demands.daysplanned - count(Outputs.outputId))*((sum(output))/(count(Outputs.outputId))) + sum(output)) -(Demands.demand + (sum(to_newdemand.demand_Addition))) as expectedloss : Integer
    
  } where Demands.to_output.ID = Outputs.ID
  group by Demands.demandID
}

extend service AnalyticsService with  {
 entity dna as projection on AnalyticsService.Demands
}

