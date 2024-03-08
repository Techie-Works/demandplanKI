using AnalyticsService as service from '../../srv/service';

annotate service.Demands with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.Chart#capacityutil',
            Label : 'capacityutil',
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
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
            Value : averagerunrate,
            Label : 'averagerunrate',
        },
        {
            $Type : 'UI.DataField',
            Value : balancetoproduce,
            Label : 'balancetoproduce',
        },
        {
            $Type : 'UI.DataField',
            Value : demandID,
            Label : 'demandID',
        },
        {
            $Type : 'UI.DataField',
            Value : efficiency,
            Label : 'efficiency',
        },
        {
            $Type : 'UI.DataField',
            Value : productionefficiency,
            Label : 'productionefficiency',
        },
        {
            $Type : 'UI.DataField',
            Value : capacityutil,
            Label : 'capacityutil',
        },
    ]
);
annotate service.Demands with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
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
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Something}',
            ID : 'i18nSomething',
            Facets : [
            ],
        },
    ]
);
annotate service.Demands with @(
    UI.DataPoint #capacityutil : {
        Value : capacityutil,
        MinimumValue : 0,
        MaximumValue : 24,
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
