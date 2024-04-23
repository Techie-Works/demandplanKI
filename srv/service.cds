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
    Demands.to_status.name as Status,
    Demands.createdAt as Demanddate,
    Outputs.createdAt as Outoputdate,
    Demands.demand as Demand,
    to_section.name as Section,
    output, //TO REMOVE

    @Core.Computed
    (sum(to_output.to_line.target))/(count(to_output.to_line.target)) as Target :Integer,
    (sum(to_output.to_line.target))/(count(to_output.to_line.target)) * count(Demands.to_output.ID) as runrateTarget :Integer, 
     //AVG TARGET
    sum(to_newdemand.demand_Addition) as NewDemand : Integer,  
    sum(output) as totaloutput : Integer,
    count(Demands.to_output.ID) as Days: Integer,
    Demands.daysplanned as  daysPlanned : Integer,
    (count(Outputs.outputId)*100)/(Demands.daysplanned) as capacityutil : Decimal(2, 2),
    ((sum(output))/(count(Outputs.outputId))) as averagerunrate: Integer,
    (((sum(output))/(count(Outputs.outputId))) * (count(Demands.to_output.ID))) as runrateoutput: Integer,
    ((((sum(output))/(count(Outputs.outputId)))*100)/to_line.target) as  efficiency: Decimal,
    Demands.demand - (sum(output)) as balancetoproduce: Integer,
    //sum(output) as balancetoproduce: Integer,
    (((sum(output))*100)/(Demands.demand )) as productionefficiency : Decimal(2, 2),
    (((sum(output))*100)/(Demands.demand + (sum(to_newdemand.demand_Addition)))) as afterproductionefficiency : Decimal(2, 2),
    (((sum(output))*100)/(Demands.demand)) as Planacheivement : Decimal(2, 2),
    (((sum(output))*100)/(Demands.demand+ (sum(to_newdemand.demand_Addition)))) as afterPlanachievement : Decimal(2, 2),//REPEATED
    (Demands.daysplanned - count(Outputs.outputId))*((sum(output))/(count(Outputs.outputId))) as Remdaysoutput :Decimal(2, 2),
    (((Demands.demand)-(sum(output)))/((sum(output))/(count(Outputs.outputId)))) as days2close : Decimal(2, 2),
    (((Demands.demand + (sum(to_newdemand.demand_Addition)))-(sum(output)))/((sum(output))/(count(Outputs.outputId)))) as afterdays2close : Decimal(2, 2), //COMPARE TO DAYS
    ((Demands.daysplanned - count(Outputs.outputId))*((sum(output))/(count(Outputs.outputId))) + sum(output)) -(Demands.demand) as expectedloss : Integer,
    ((Demands.daysplanned - count(Outputs.outputId))*((sum(output))/(count(Outputs.outputId))) + sum(output)) -(Demands.demand + (sum(to_newdemand.demand_Addition))) as afterexpectedloss : Integer,

    1*75 as maximumvalue  :Decimal(5,2),
    50 as minvalue  :Decimal(5,2),  
    (sum(to_output.to_line.target))/(count(to_output.to_line.target)) *(Demands.daysplanned) as relatedcapacity: Integer,

    
  } where Demands.to_output.ID = Outputs.ID
  group by Demands.demandID
  
}

service BIService{
  entity BIentity as projection on AnalyticsService.Demands

 annotate BIentity with @(
  Aggregation.ApplySupported: {
    Transformations: [
      'aggregate',
      'topcount',
      'bottomcount',
      'identity',
      'concat',
      'groupby',
      'filter',
      'expand',
      'search'      
    ],
    GroupableProperties: [
      Section,Status,averagerunrate,Demand,Demanddate,Outoputdate
    ],
    AggregatableProperties: [
      {
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: output
    },
      {
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: efficiency
    },
      {
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: Demand
    },
      {
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: Target
    }
    
    ]
  },
  Analytics.AggregatedProperty #totaloutput: {
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : output,
    AggregationMethod : 'sum',
    Name : 'totalOutput',
    ![@Common.Label]: 'Total Output'
  },
  //  Analytics.AggregatedProperty #myaggefficiency: {
  //   $Type : 'Analytics.AggregatedPropertyType',
  //   AggregatableProperty : efficiency,
  //   AggregationMethod : 'min',
  //   Name : 'myefficiency',
  //   ![@Common.Label]: 'Myfficiency'
  // },
  Analytics.AggregatedProperty #myaggdemand: {
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : Demand,
    AggregationMethod : 'sum',
    Name : 'myefficiency',
    ![@Common.Label]: 'Demand'
  },
   Analytics.AggregatedProperty #myaggtarget: {
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : Target,
    AggregationMethod : 'sum',
    Name : 'mytarget',
    ![@Common.Label]: 'Target'
  },
);
  
}

annotate AnalyticsService.Demands @Aggregation.ApplySupported: {
    $Type                 : 'Aggregation.ApplySupportedType',
    Transformations       : [
        'aggregate',
        'groupby',
        'filter',
        'search',
        'concat',
        'skip',
        'orderby',
        'top'
    ],
    Rollup                : #None,
    From                  : false,
    GroupableProperties   : [
        Section
    ],
    AggregatableProperties: [{
        Property                    : output, 
        SupportedAggregationMethods : [
            'sum',
            'max',
            'min',
            'average'
        ],
        RecommendedAggregationMethod: 'sum',
    
    }],
};
  
