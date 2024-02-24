sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kenafricproduction/demand/test/integration/FirstJourney',
		'kenafricproduction/demand/test/integration/pages/DemandList',
		'kenafricproduction/demand/test/integration/pages/DemandObjectPage',
		'kenafricproduction/demand/test/integration/pages/OutputsObjectPage'
    ],
    function(JourneyRunner, opaJourney, DemandList, DemandObjectPage, OutputsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kenafricproduction/demand') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheDemandList: DemandList,
					onTheDemandObjectPage: DemandObjectPage,
					onTheOutputsObjectPage: OutputsObjectPage
                }
            },
            opaJourney.run
        );
    }
);