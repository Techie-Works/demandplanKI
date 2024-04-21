using BIService as service from '../../srv/service';
using from '../../srv/service';


annotate service.BIentity with @(

  UI.Chart              : {
    $Type              : 'UI.ChartDefinitionType',
    Title              : 'Stock',
    ChartType          :#CombinationDual ,
    Dimensions         : [Section],
    DimensionAttributes: [{
      $Type    : 'UI.ChartDimensionAttributeType',
      Dimension: Section,
      Role     : #Category
    },
    // {
    //   $Type : 'UI.ChartDimensionAttributeType',
    //   Dimension: category2,
    //   Role: #Category2
    // }
    ],
    DynamicMeasures    : [ 
      ![@Analytics.AggregatedProperty#myaggdemand],
      ![@Analytics.AggregatedProperty#totaloutput],
      ![@Analytics.AggregatedProperty#myaggtarget],

  
    ],
    MeasureAttributes  : [
    // {
    //   $Type         : 'UI.ChartMeasureAttributeType',
    //   DynamicMeasure: ![@Analytics.AggregatedProperty#totaloutput],
    //   Role          : #Axis1
    // },
      {
      $Type         : 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#myaggdemand],
      Role          : #Axis1,
      // DataPoint : '@UI.DataPoint#totaloutputchart',
    },
     {
      $Type         : 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#totaloutput],
      Role          : #Axis1,
      DataPoint : '@UI.DataPoint#totaloutputchart',
      // DataPoint : '@UI.DataPoint#totaloutputchart',

    },
     {
      $Type         : 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#myaggtarget],
      Role          : #Axis1,

    },
    ]
  },
   UI.DataPoint #totaloutputchart : {
        Value : totaloutput,
        // MinimumValue : 0,
        // MaximumValue : 500,
        // Criticality:#Negative,
         ForecastValue : Demand
     
    //     TargetValue : Target,
    //      ValueFormat : {
    //     ScaleFactor : 2,
    //     NumberOfFractionalDigits : 1
    // },
        // CriticalityCalculation : {
        //     ImprovementDirection : #Minimize,
        //     DeviationRangeHighValue : Demand,
        //     ToleranceRangeHighValue : Demand,
        // },
    },
  UI.PresentationVariant: {
    $Type         : 'UI.PresentationVariantType',
    Visualizations: ['@UI.Chart', ],
    // SortOrder: #Desc
  },
  UI.LineItem #bitable  : [
    {
      $Type : 'UI.DataFieldForAnnotation',
      Target: '@Communication.Contact#contact1',
      Label : '{i18n>Section}',
    },
      {
          $Type : 'UI.DataFieldForAnnotation',
          Target : '@UI.DataPoint#totaloutput3',
          Label : 'totaloutput',
      },
    {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.DataPoint#efficiencydp',
            Label : '{i18n>Efficiency}',
        },
    {
      $Type : 'UI.DataFieldForAnnotation',
      Target: '@UI.Chart#output',
      Label : '{i18n>DemandFulfillement}',
    },

    // {
    //   $Type      : 'UI.DataFieldForAnnotation',
    //   Target     : '@UI.DataPoint#dpcap',
    //   // Criticality: Target,
    //   ![@UI.Importance] : #High,

    // },
      {
          $Type : 'UI.DataField',
          Value : Target,
          Label : 'Target',
          ![@UI.Importance] : #High,
      },
    // {
    //   $Type : 'UI.DataFieldForAnnotation',
    //   Target: '@UI.DataPoint#dpplan',
    //   Label : 'Planned Achievement',
    //   ![@UI.Importance] : #High,

    // },
      {
          $Type : 'UI.DataField',
          Value : balancetoproduce,
          Label : 'balancetoproduce',
          Criticality : balancetoproduce,
          CriticalityRepresentation : #WithIcon,
      },
      {
          $Type : 'UI.DataFieldForAnnotation',
          Target : '@UI.Chart#totaloutput',
          Label : 'totaloutput',
          ![@UI.Importance] : #High,
      },
      {
          $Type : 'UI.DataFieldForAnnotation',
          Target : '@UI.Chart#totaloutput1',
          Label : 'Total Output vs Target',
          ![@UI.Importance] : #High,
      },
  
  ],
  UI.DataPoint #dpcap   : {
    // $Type      : 'UI.DataPointType',
    // Title      : 'Believeit ',
    Value      : totaloutput,
    TargetValue:0,
    // ForecastValue:days2close,
    Criticality: Days,
     MinimumValue : 1,
    MaximumValue : 1,
    // CriticalityCalculation : {
    //   ImprovementDirection : #Minimize,
    //   // DeviationRangeHighValue :10,
    //   // ToleranceRangeHighValue : productionefficiency,
    //   // DeviationRangeLowValue : 5,
    //   AcceptanceRangeHighValue : 100,
    //   AcceptanceRangeLowValue:50
    // },
    //     // ValueFormat : {
    //     ScaleFactor : 2,
    //     NumberOfFractionalDigits : 1
    // },
    // CriticalityCalculation : {
    //     ImprovementDirection : #Minimize,
    //     DeviationRangeHighValue : '7300',
    //     ToleranceRangeHighValue : '7200'
    // },
    // TargetValue : '2.000 ',
    // TrendCalculation : {
    //     ReferenceValue : 200,
    //     UpDifference:300,
    //     DownDifference : 10,
    //     StrongDownDifference:5,
    //     StrongUpDifference:13
    // }
  },
  
  UI.DataPoint #dpplan  : {
    $Type                 : 'UI.DataPointType',
    // MinimumValue          : 20,
    // MaximumValue          : 100,
    Value                 : Planacheivement,
    // Title                 : 'Revenue',
    Criticality : Demand,
    CriticalityCalculation: {
      $Type                  : 'UI.CriticalityCalculationType',
      ImprovementDirection   : #Maximize,
      DeviationRangeHighValue: 20,
      DeviationRangeLowValue : 40
    },
  TrendCalculation       : {
      $Type                : 'UI.TrendCalculationType',
      ReferenceValue       : Target,
      UpDifference         : 10,
      StrongUpDifference   : 100,
      DownDifference       : -10,
      StrongDownDifference : -100
  },
  
  // $Type : 'UI.DataPointType',
  // Title : 'Sales India - Generic Card',
  // Value : Planacheivement,
  // // Criticality:Target,
  //  MinimumValue          : 0,
  //     MaximumValue          : 40,
  //     TargetValue           : 20,
  //     Visualization         : #BulletChart,

  // CriticalityCalculation : {
  //     $Type     : 'UI.CriticalityCalculationType',
  //     ImprovementDirection : #Maximize,
  //     DeviationRangeHighValue : 40,
  //     ToleranceRangeLowValue : 20
  // },
  // TargetValue : '2 ',

  },
  UI.DataPoint #efficiencydp        : {
        $Type                 : 'UI.DataPointType',
        Value                 : efficiency,
        TargetValue           : 30,
        Title                 : 'Revenue',

        CriticalityCalculation: {
            $Type                  : 'UI.CriticalityCalculationType',
            ImprovementDirection   : #Maximize,
            DeviationRangeHighValue: 100,
            AcceptanceRangeHighValue : 100,
            AcceptanceRangeLowValue : 50,
            // ToleranceRangeLowValue : 80,
            // ToleranceRangeHighValue: 50,
            DeviationRangeLowValue : 10

        },
        TrendCalculation      : {
            $Type               : 'UI.TrendCalculationType',
            ReferenceValue      : averagerunrate,
            UpDifference        : 10,
            StrongUpDifference  : 100,
            DownDifference      : -10,
            StrongDownDifference: -100
        }
    }
);

annotate service.BIentity with @(
  UI.Chart #visualFilter              : {
    $Type          : 'UI.ChartDefinitionType',
    ChartType      : #Bar,
    Dimensions     : [Section, ],
    DynamicMeasures: ['@Analytics.AggregatedProperty#totaloutput', ],
  },
  UI.PresentationVariant #visualFilter: {
    $Type         : 'UI.PresentationVariantType',
    Visualizations: ['@UI.Chart#visualFilter', ],
  },
  UI.SelectionFields                  : []
);

annotate service.BIentity with {
  Section @(
    Common.ValueList #visualFilter: {
      $Type                       : 'Common.ValueListType',
      CollectionPath              : 'BIentity',
      Parameters                  : [{
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Section,
        ValueListProperty: 'Section',
      }, ],
      PresentationVariantQualifier: 'visualFilter',
    },
    Common.Label                  : 'Section'
  )
};




annotate service.BIentity with @(
    UI.Chart #visualFilter1 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            Status,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#totaloutput',
        ],
    },
    UI.PresentationVariant #visualFilter1 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter1',
        ],
    }
);
annotate service.BIentity with {
    Status @Common.ValueList #visualFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'BIentity',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : Status,
                ValueListProperty : 'Status',
            },
        ],
        PresentationVariantQualifier : 'visualFilter1',
    }
};
annotate service.BIentity with @(
    UI.Chart #visualFilter2 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            Demand,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#totaloutput',
        ],
    },
    UI.PresentationVariant #visualFilter2 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter2',
        ],
    }
);
annotate service.BIentity with {
    Demand @(Common.ValueList #visualFilter : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BIentity',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Demand,
                    ValueListProperty : 'Demand',
                },
            ],
            PresentationVariantQualifier : 'visualFilter2',
        },
        Common.Label : 'Demand'
)};
annotate service.BIentity with @(
    UI.DataPoint #averagerunrate3 : {
        Value : averagerunrate,
        Visualization : #Progress,
        TargetValue : 100,
        Criticality : expectedloss,
    }
);
annotate service.BIentity with @(
    UI.DataPoint #totaloutput : {
        Value : totaloutput,
        Visualization : #Rating,
        TargetValue : 5,
    }
);
annotate service.BIentity with @(
    UI.DataPoint #efficiency1 : {
        Value : efficiency,
        Visualization : #Rating,
        TargetValue : 5,
    }
);
annotate service.BIentity with @(
    UI.DataPoint #efficiency2 : {
        Value : efficiency,
        Visualization : #Rating,
        TargetValue : 10,
    }
);
annotate service.BIentity with @(
    UI.DataPoint #capacityutil1 : {
        Value : capacityutil,
        MinimumValue : 0,
        MaximumValue : 100,
        CriticalityCalculation : {
            ImprovementDirection : #Minimize,
            DeviationRangeHighValue : productionefficiency,
            ToleranceRangeHighValue : productionefficiency,
        },
        TargetValue : productionefficiency,
    },
    UI.Chart #capacityutil1 : {
        ChartType : #Bullet,
        Measures : [
            capacityutil,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#capacityutil1',
                Role : #Axis1,
                Measure : capacityutil,
            },
        ],
    }
);
annotate service.BIentity with @(
    UI.DataPoint #Planacheivement : {
        Value : Planacheivement,
        MinimumValue : 0,
        MaximumValue : 100,
    },
    UI.Chart #Planacheivement : {
        ChartType : #Bullet,
        Measures : [
            Planacheivement,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#Planacheivement',
                Role : #Axis1,
                Measure : Planacheivement,
            },
        ],
    }
);
annotate service.BIentity with {
    balancetoproduce @Common.Text : {
            $value : Status,
            ![@UI.TextArrangement] : #TextFirst,
        }
};
annotate service.BIentity with @(
    UI.DataPoint #totaloutput1 : {
        Value : totaloutput,
        TargetValue : Target,
         MinimumValue : 0,
        MaximumValue : 1000,
        Criticality:Days
    },
    UI.Chart #totaloutput : {
        ChartType : #Donut,
        Measures : [
            totaloutput,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#totaloutput1',
                Role : #Axis1,
                Measure : totaloutput,
            },
        ],
    }
);
annotate service.BIentity with @(
    UI.DataPoint #totaloutput2 : {
        Value : totaloutput,
        MinimumValue : Days,
        MaximumValue : Demand,
        TargetValue : Demand,
        CriticalityCalculation : {
            ImprovementDirection : #Minimize,
            DeviationRangeHighValue : Demand,
            ToleranceRangeHighValue : totaloutput,
        },
    },
    UI.Chart #totaloutput1 : {
        ChartType : #Bullet,
        Measures : [
            totaloutput,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#totaloutput2',
                Role : #Axis1,
                Measure : totaloutput,
            },
        ],
    }
);
annotate service.BIentity with @(
    UI.DataPoint #totaloutput3 : {
        Value : totaloutput,
        Visualization : #Progress,
        TargetValue : Demand,
    }
);
