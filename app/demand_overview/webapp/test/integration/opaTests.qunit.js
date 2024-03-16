sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kenafricproduction/demandoverview/test/integration/FirstJourney',
		'kenafricproduction/demandoverview/test/integration/pages/DemandsList',
		'kenafricproduction/demandoverview/test/integration/pages/DemandsObjectPage'
    ],
    function(JourneyRunner, opaJourney, DemandsList, DemandsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kenafricproduction/demandoverview') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheDemandsList: DemandsList,
					onTheDemandsObjectPage: DemandsObjectPage
                }
            },
            opaJourney.run
        );
    }
);