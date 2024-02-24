sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'kenafricproduction.demand',
            componentId: 'OutputsObjectPage',
            contextPath: '/Demand/to_output'
        },
        CustomPageDefinitions
    );
});