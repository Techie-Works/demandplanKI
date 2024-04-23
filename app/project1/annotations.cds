using AnalyticsService as service from '../../srv/service';

annotate service.Demands with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@Communication.Contact#contact1',
            Label : '{i18n>Section}',
        },
        {
            $Type : 'UI.DataField',
            Value : Demand,
            Label : 'Demand',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#totaloutput',
            Label : 'totaloutput',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.Chart#output',
            Label : '{i18n>DemandFulfillement}',
        },
                  {
            $Type : 'UI.DataField',
            Value : Target,
            Label : 'Target',
        },
        {
            $Type : 'UI.DataField',
            Value : averagerunrate,
            Label : '{i18n>Runrate}',
        },
        {
            $Type : 'UI.DataField',
            Value : balancetoproduce,
            Label : '{i18n>BalToProduce}',
        },
        {
      $Type : 'UI.DataFieldForAnnotation',
      Target: '@UI.DataPoint#testdp',
      Label : 'Planned Achievement',
      ![@UI.Importance] : #High,

    },
    ]
);
annotate service.Demands with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Demand',
                Value : Demand,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Section',
                Value : Section,
            },
            {
                $Type : 'UI.DataField',
                Label : 'output',
                Value : output,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Target',
                Value : Target,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NewDemand',
                Value : NewDemand,
                Criticality : totaloutput,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totaloutput',
                Value : totaloutput,
            },
            {
                $Type : 'UI.DataField',
                Label : 'daysPlanned',
                Value : daysPlanned,
            },
            {
                $Type : 'UI.DataField',
                Label : 'capacityutil',
                Value : capacityutil,
            },
            {
                $Type : 'UI.DataField',
                Label : 'averagerunrate',
                Value : averagerunrate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'efficiency',
                Value : efficiency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'balancetoproduce',
                Value : balancetoproduce,
            },
            {
                $Type : 'UI.DataField',
                Label : 'productionefficiency',
                Value : productionefficiency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'afterproductionefficiency',
                Value : afterproductionefficiency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Planacheivement',
                Value : Planacheivement,
            },
            {
                $Type : 'UI.DataField',
                Label : 'afterPlanachievement',
                Value : afterPlanachievement,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Remdaysoutput',
                Value : Remdaysoutput,
            },
            {
                $Type : 'UI.DataField',
                Label : 'days2close',
                Value : days2close,
            },
            {
                $Type : 'UI.DataField',
                Label : 'expectedloss',
                Value : expectedloss,
            },
               {
      $Type : 'UI.DataFieldForAnnotation',
      Target: '@UI.DataPoint#testdp',
      Label : 'Planned Achievement',
      ![@UI.Importance] : #High,

    },
        ],
    },
    // UI.Chart      #opchart        : {
    // $Type              : 'UI.ChartDefinitionType',
    // Title              : 'Stock',
    // ChartType          : #Column,
    // Dimensions         : [Outoputdate],
    // DimensionAttributes: [{
    //   $Type    : 'UI.ChartDimensionAttributeType',
    //   Dimension: Section,
    //   Role     : #Category
    // },
    // Measures:[totalOutput],
    // {
    //   $Type : 'UI.ChartDimensionAttributeType',
    //   Dimension: category2,
    //   Role: #Category2
    // }
    // ],
//     DynamicMeasures    : [ '@Analytics.AggregatedProperty#totaloutput' ],

//   },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Test',
            ID : 'Test',
            Facets : [

            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        //  {
        //     $Type : 'UI.ReferenceFacet',
        //     ID : 'GeneratedFacet2',
        //     Label : 'General Info',
        //     Target : '@UI.Chart#opchart',
        // },
    ]
);
annotate service.Demands with @(
    UI.DataPoint #Demand : {
        Value : Demand,
        Visualization : #Progress,
        TargetValue : 100,
    }
);
annotate service.Demands with @(
    UI.DataPoint #output : {
        Value : output,
        Visualization : #Progress,
        TargetValue : Demand,
    }
);
annotate service.Demands with @(
    UI.DataPoint #capacityutil : {
        Value : capacityutil,
        MinimumValue : 0,
        MaximumValue : 100,
    },
    UI.DataPoint #testdp : {
    $Type : 'UI.DataPointType',
    Title : 'Sales India - Generic Card',
    Value : productionefficiency,
    // ValueFormat : {
    //     ScaleFactor : 2,
    //     NumberOfFractionalDigits : 1
    // },
    CriticalityCalculation : {
        ImprovementDirection : #Maximize,
        DeviationRangeHighValue : 4,
        ToleranceRangeHighValue : 3
    },
    TargetValue : 2,
    TrendCalculation : {
        ReferenceValue : '5201680',
        DownDifference : 10000000.0
    }
    },

    UI.Chart #capacityutil : {
        ChartType : #Bullet,
        Measures : [
            capacityutil,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#capacityutil',
                Role : #Axis1,
                Measure : capacityutil,
            },
        ],
    }
);
annotate service.Demands with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : Section,
    }
);
annotate service.Demands with @(
    UI.DataPoint #numberOfDays : {
        Value : numberOfDays,
        TargetValue : daysPlanned,
    },
    UI.Chart #numberOfDays : {
        ChartType : #Donut,
        Measures : [
            numberOfDays,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#numberOfDays',
                Role : #Axis1,
                Measure : numberOfDays,
            },
        ],
    }
);
annotate service.Demands with @(
    UI.DataPoint #output1 : {
        Value : output,
        TargetValue : Demand,
    },
    UI.Chart #output : {
        ChartType : #Donut,
        Measures : [
            output,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#output1',
                Role : #Axis1,
                Measure : output,
            },
        ],
    }
);
annotate service.Demands with @(
    UI.DataPoint #Target : {
        Value : Target,
        Visualization : #Progress,
        TargetValue : 100,
    }
);
annotate service.Demands with @(
    UI.DataPoint #averagerunrate : {
        Value : averagerunrate,
        Visualization : #Progress,
        TargetValue : Target,
    }
);
annotate service.Demands with @(
    UI.Identification : [
    ]
);
annotate service.Demands with @(
    UI.DataPoint #output2 : {
        Value : output,
        TargetValue : Demand,
        CriticalityCalculation : {
            ImprovementDirection : #Minimize,
            DeviationRangeHighValue : minvalue,
            ToleranceRangeHighValue : maximumvalue,
        },
    },
    UI.Chart #output1 : {
        ChartType : #Donut,
        Title : '',
        Measures : [
            output,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#output2',
                Role : #Axis1,
                Measure : output,
            },
        ],
        Description : '{i18n>DemandFulfillment}',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'output1',
            Target : '@UI.Chart#output3',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'output',
            Target : '@UI.Chart#output1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'averagerunrate',
            Target : '@UI.Chart#averagerunrate',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Demand',
            Target : '@UI.Chart#Demand',
        },
    ]
);
annotate service.Demands with @(
    UI.DataPoint #numberOfDays1 : {
        Value : numberOfDays,
        TargetValue : daysPlanned,
    },
    UI.Chart #numberOfDays1 : {
        ChartType : #Donut,
        Title : '',
        Measures : [
            numberOfDays,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#numberOfDays1',
                Role : #Axis1,
                Measure : numberOfDays,
            },
        ],
        Description : '{i18n>CapacityUtilisation}',
    }
);
annotate service.Demands with @(
    UI.DataPoint #efficiency : {
        $Type : 'UI.DataPointType',
        Value : efficiency,
        Title : 'efficiency',
    }
);
annotate service.Demands with @(
    UI.FieldGroup #Something : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : capacityutil,
                Label : 'capacityutil',
            },],
    }
);
annotate service.Demands with {
    capacityutil @Measures.Unit : '%'
};
annotate service.Demands with @(
    UI.DataPoint #progress : {
        $Type : 'UI.DataPointType',
        Value : numberOfDays,
        Title : '',
        TargetValue : daysPlanned,
        Visualization : #Progress,
        Description : '{i18n>DaysProgress}',
    }
);
annotate service.Demands with @(
    UI.DataPoint #averagerunrate1 : {
        Value : averagerunrate,
        TargetValue : Target,
        CriticalityCalculation : {
            ImprovementDirection : #Minimize,
            DeviationRangeHighValue : maximumvalue,
            ToleranceRangeHighValue : maximumvalue,
        },
    },
    UI.Chart #averagerunrate : {
        ChartType : #Donut,
        Title : '',
        Measures : [
            averagerunrate,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#averagerunrate1',
                Role : #Axis1,
                Measure : averagerunrate,
            },
        ],
        Description : '{i18n>Efficiency}',
    }
);
annotate service.Demands with @(
    UI.DataPoint #averagerunrate2 : {
        Value : averagerunrate,
        MinimumValue : 0,
        MaximumValue : 100,
    },
    UI.Chart #averagerunrate1 : {
        ChartType : #Bullet,
        Title : 'averagerunrate',
        Measures : [
            averagerunrate,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#averagerunrate2',
                Role : #Axis1,
                Measure : averagerunrate,
            },
        ],
    }
);
annotate service.Demands with @(
    UI.DataPoint #output3 : {
        Value : output,
        TargetValue : Demand,
    },
    UI.Chart #output2 : {
        ChartType : #Donut,
        Title : 'output',
        Measures : [
            output,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#output3',
                Role : #Axis1,
                Measure : output,
            },
        ],
    }
);
annotate service.Demands with @(
    UI.DataPoint #output4 : {
        Value : output,
        MinimumValue : 0,
        MaximumValue : 100,
        TargetValue : Demand,
    },
    UI.Chart #output3 : {
        ChartType : #Bullet,
        Title : '',
        Measures : [
            output,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#output4',
                Role : #Axis1,
                Measure : output,
            },
        ],
        Description : '{i18n>OutputVsDemand1}',
    }
);
annotate service.Demands with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Section,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : '{i18n>DemandFulfillmentDrillDown}',
        },
    }
);
annotate service.Demands with @(
    UI.DataPoint #rating : {
        $Type : 'UI.DataPointType',
        Value : output,
        Title : 'output',
        TargetValue : 1000,
        Visualization : #Rating,
    }
);
annotate service.Demands with @(
    UI.DataPoint #Demand1 : {
        $Type : 'UI.DataPointType',
        Value : Demand,
        Title : 'Demand',
        ![@Common.QuickInfo] : 'Demand for the whole month',
    }
);
annotate service.Demands with @(
    UI.FieldGroup #WithDemandAddition : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Demands with @(
    UI.DeleteHidden : true
);
annotate service.Demands with @(
    UI.DataPoint #relatedcapacity : {
        Value : relatedcapacity,
        TargetValue : Demand,
    },
    UI.Chart #relatedcapacity : {
        ChartType : #Donut,
        Title : 'relatedcapacity',
        Measures : [
            relatedcapacity,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#relatedcapacity',
                Role : #Axis1,
                Measure : relatedcapacity,
            },
        ],
    }
);
annotate service.Demands with @(
    UI.DataPoint #Demand2 : {
        Value : Demand,
        TargetValue : relatedcapacity,
    },
    UI.Chart #Demand : {
        ChartType : #Donut,
        Title : '',
        Measures : [
            Demand,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#Demand2',
                Role : #Axis1,
                Measure : Demand,
            },
        ],
        Description : '{i18n>UtilisationBasedOnDemand}',
    }
);
annotate service.Demands with @(
    UI.DataPoint #output5 : {
        Value : output,
        Visualization : #Progress,
        TargetValue : Demand,
        Criticality: totaloutput
    }
);
annotate service.Demands with @(
    UI.DataPoint #output6 : {
        Value : output,
        TargetValue : Demand,
    },
    UI.Chart #output4 : {
        ChartType : #Donut,
        Measures : [
            output,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#output6',
                Role : #Axis1,
                Measure : output,
            },
        ],
    }
);
annotate service.Demands with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : Section,
    }
);
annotate service.Demands with {
    efficiency @Measures.Unit : '%'
};
annotate service.Demands with {
    afterproductionefficiency @Measures.Unit : '%'
};
annotate service.Demands with {
    afterPlanachievement @Measures.Unit : '%'
};
annotate service.Demands with {
    Planacheivement @Measures.Unit : '%'
};
annotate service.Demands with {
    Demand @Measures.Unit : 'Ctns.'
};
annotate service.Demands with @(
    UI.DataPoint #totaloutput : {
        Value : totaloutput,
        Visualization : #Progress,
        TargetValue : Demand,
    }
);
annotate service.Demands with @(
    Analytics.AggregatedProperty #output_sum : {
        $Type : 'Analytics.AggregatedPropertyType',
        Name : 'output_sum',
        AggregatableProperty : output,
        AggregationMethod : 'sum',
        ![@Common.Label] : 'output (Sum)',
    },
    UI.Chart #alpChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            Section,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#output_sum',
        ],
    }
);
annotate service.Demands with @(
    UI.Chart #alpChart1 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #HorizontalWaterfall,
        Dimensions : [
            Section,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#output_sum',
        ],
    }
);
