using {kenafricproduction} from './service';

//Filters
annotate kenafricproduction.dna with @(UI : {
    SelectionFields  : [
        Section,
        
    ],
    SelectionVariant : {
        $Type         : 'UI.SelectionVariantType',
        SelectOptions : [{
            $Type        : 'UI.SelectOptionType',
            PropertyName : localCurrency,
        }],
    },
});

annotate  kenafricproduction.dna with {
 modifiedAt @UI.Hidden;
 modifiedBy @UI.Hidden;
 createdAt @UI.Hidden;
 createdBy @UI.Hidden ;
 };

//Donut Chart
annotate kenafricproduction.dna with @(UI : {
    Chart #donut                            : {
        $Type               : 'UI.ChartDefinitionType',
        ChartType           : #Donut,
        Description         : 'Donut Chart',
        Measures            : [totaloutput],
        MeasureAttributes   : [{
            $Type     : 'UI.ChartMeasureAttributeType',
            Measure   : totaloutput,
            Role      : #Axis1,
            DataPoint : '@UI.DataPoint#totaloutput'
        }],
        Dimensions          : [Section],
        DimensionAttributes : [{
            $Type     : 'UI.ChartDimensionAttributeType',
            Dimension : Section,
            Role      : #Category
        }]
    },
    PresentationVariant #donutPreVar        : {
        $Type             : 'UI.PresentationVariantType',
        Visualizations    : ['@UI.Chart#donut'],
        MaxItems          : 3,
        IncludeGrandTotal : true,
        SortOrder         : [{
            $Type      : 'Common.SortOrderType',
            Descending : true,
            Property   : totaloutput
        }]
    },
    DataPoint #GrossAmountInCompanyCurrency : {
        $Type                  : 'UI.DataPointType',
        Value                  : totaloutput,
        Title                  : 'Output',
        CriticalityCalculation : {
            $Type                   : 'UI.CriticalityCalculationType',
            ImprovementDirection    : #Maximize,
            DeviationRangeHighValue : 1000000,
            DeviationRangeLowValue  : 3000000
        },
        TrendCalculation       : {
            $Type                : 'UI.TrendCalculationType',
            ReferenceValue       : 1000,
            UpDifference         : 10,
            StrongUpDifference   : 100,
            DownDifference       : -10,
            StrongDownDifference : -100
        },
    },
    Identification                          : [{
        $Type : 'UI.DataField',
        Value : totaloutput
    }]
});


