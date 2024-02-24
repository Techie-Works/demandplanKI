using Demandservice as service from '../../srv/service';
using from '../../db/schema';
using from '../../db/master-data';

annotate service.Demand with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : date,
            Label : '{i18n>Date}',
        },
        {
            $Type : 'UI.DataField',
            Value : to_section_sectionID,
            Label : '{i18n>Section}',
        },{
            $Type : 'UI.DataField',
            Value : demand,
            Label : '{i18n>DemandInCtns}',
        },
        {
            $Type : 'UI.DataField',
            Value : daysplanned,
            Label : '{i18n>DaysPlanned}',
        },
        {
            $Type : 'UI.DataField',
            Value : total_output,
            Label : '{i18n>ActualTotalOutput}',
        },]
);
annotate service.Demand with {
    to_section @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Sections',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : to_section_sectionID,
                ValueListProperty : 'sectionID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};
annotate service.Demand with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Demand Details',
            ID : 'DemandDetails',
            Facets : [
                {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>HeaderInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
                {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>GeneralInformation}',
            ID : 'i18nGeneralInformation',
            Target : '@UI.Identification',
        },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Particulars}',
                    ID : 'i18nParticulars',
                    Target : '@UI.FieldGroup#i18nParticulars',
                },],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>DailyOutput}',
            ID : 'i18nDailyOutput',
            Target : 'to_output/@UI.LineItem#i18nDailyOutput',
        },
    ]
);
annotate service.Demand with @(
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : date,
            Label : '{i18n>Date1}',
        },{
            $Type : 'UI.DataField',
            Value : descr,
            Label : '{i18n>Description}',
        },
        {
            $Type : 'UI.DataField',
            Value : to_section_sectionID,
            Label : '{i18n>Section}',
        },]
);
annotate service.Demand with @(
    UI.FieldGroup #i18nParticulars : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : daysplanned,
                Label : '{i18n>DaysPlanned}',
            },{
                $Type : 'UI.DataField',
                Value : demand,
                Label : '{i18n>Demand}',
            },
            {
                $Type : 'UI.DataField',
                Value : total_output,
                Label : '{i18n>TotalOutput}',
            },],
    }
);
annotate service.Outputs with @(
    UI.LineItem #i18nDailyOutput : [
        {
            $Type : 'UI.DataField',
            Value : date,
            Label : '{i18n>Date1}',
        },{
            $Type : 'UI.DataField',
            Value : output,
            Label : '{i18n>Output}',
        },]
);
annotate service.Outputs with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Daily Output',
            ID : 'DailyOutput',
            Target : '@UI.FieldGroup#DailyOutput',
        },
    ],
    UI.FieldGroup #DailyOutput : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : output,
                Label : '{i18n>Output}',
            },{
                $Type : 'UI.DataField',
                Value : date,
                Label : '{i18n>Date1}',
            },],
    }
);
annotate service.Demand with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Section,
        },
        TypeName : '',
        TypeNamePlural : '',
        TypeImageUrl : 'data:image/jpeg;base64,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',
    }
);
annotate service.Outputs with @(
    UI.HeaderInfo : {
        TypeImageUrl : 'data:image/jpeg;base64,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',
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    }
);
annotate service.Demand with {
    to_section @Common.Text : {
            $value : to_section.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Demand with {
    to_section @Common.ValueListWithFixedValues : true
};
annotate service.Sections with {
    sectionID @Common.Text : name
};
