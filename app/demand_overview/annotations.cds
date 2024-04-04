using AnalyticsService as service from '../../srv/service';

annotate service.Demands with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : averagerunrate,
            Label : '{i18n>AvgRunRate}',
            Criticality : Target,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : balancetoproduce,
            Label : '{i18n>BalanceToProduce}',
        },
        {
            $Type : 'UI.DataField',
            Value : capacityutil,
            Label : '{i18n>CapacityUtil}',
        },
        {
            $Type : 'UI.DataField',
            Value : days2close,
            Label : '{i18n>DaysToClose}',
        },
        {
            $Type : 'UI.DataField',
            Value : expectedloss,
            Label : '{i18n>ExpectedLoss}',
        },
        {
            $Type : 'UI.DataField',
            Value : productionefficiency,
            Label : '{i18n>ProductionEfficiency}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.Chart#efficiency',
            Label : '{i18n>LineEfficiency}',
        },
    ]
);
annotate service.Demands with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'totaloutput',
                Value : totaloutput,
            },
            {
                $Type : 'UI.DataField',
                Label : 'numberOfDays',
                Value : numberOfDays,
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
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.Demands with @(
    UI.SelectionFields : []
);
annotate service.Demands with {
    name @Common.Label : 'name'
};
// annotate service.Demands with @(
//     UI.DataPoint #totaloutput : {
//         Value : totaloutput,
//         Visualization : #Progress,
//         TargetValue : demand,
//     }
// );
annotate service.Demands with @(
    UI.DataPoint #efficiency : {
        Value : efficiency,
        MinimumValue : 0,
        MaximumValue : 100,
    },
    UI.Chart #efficiency : {
        ChartType : #Bullet,
        Measures : [
            efficiency,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#efficiency',
                Role : #Axis1,
                Measure : efficiency,
            },
        ],
    }
);
annotate service.Demands with @(
    UI.DataPoint #demand : {
        $Type : 'UI.DataPointType',
        Value : demand,
        Title : 'demand',
    },
    UI.DataPoint #averagerunrate : {
        $Type : 'UI.DataPointType',
        Value : averagerunrate,
        Title : 'averagerunrate',
    },
    UI.DataPoint #totaloutput1 : {
        $Type : 'UI.DataPointType',
        Value : totaloutput,
        Title : 'totaloutput',
        Criticality : totaloutput,
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'averagerunrate',
            Target : '@UI.DataPoint#averagerunrate',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'totaloutput',
            Target : '@UI.DataPoint#totaloutput1',
        },
    ]
);
annotate service.Demands with @(
    Analytics.AggregatedProperty #output_average : {
        $Type : 'Analytics.AggregatedPropertyType',
        Name : 'output_average',
        AggregatableProperty : output,
        AggregationMethod : 'average',
        ![@Common.Label] : 'output (Average)',
    },
    UI.Chart #alpChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Dimensions : [
            Section,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#output_average',
        ],
    }
);
