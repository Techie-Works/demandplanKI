annotate AnalyticsService.Demands with @(
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
      Section
    ],
    AggregatableProperties: [{
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: output
    }]
  },
  Analytics.AggregatedProperty #totalOutput: {
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : output,
    AggregationMethod : 'sum',
    Name : 'totalOutput',
    ![@Common.Label]: 'Total Output'
    }
);

annotate AnalyticsService.Demands with @(
  UI.Chart: {
    $Type : 'UI.ChartDefinitionType',
    Title: 'Output',
    ChartType : #Column,
    Dimensions: [
      Section
    ],
    DimensionAttributes: [{
      $Type : 'UI.ChartDimensionAttributeType',
      Dimension: Section,
      Role: #Section
    }],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalOutput]
    ],
    MeasureAttributes: [{
      $Type: 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#totalOutput],
      Role: #Axis1
    }]
  },
  UI.PresentationVariant: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart',
    ],
  }
);
annotate AnalyticsService.Demands  with @(
  UI.Chart #category1: {
    $Type : 'UI.ChartDefinitionType',
    ChartType: #Bar,
    Dimensions: [
      Section
    ],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalOutput]
    ]
  },
  UI.PresentationVariant #prevSection: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart#section',
    ],
  }
){
  category1 @Common.ValueList #vlCategory1: {
    $Type : 'Common.ValueListType',
    CollectionPath : 'AnalyticsService',
    Parameters: [{
      $Type : 'Common.ValueListParameterInOut',
      ValueListProperty : 'section',
      LocalDataProperty: section
    }],
    PresentationVariantQualifier: 'prevSection'
  }
}