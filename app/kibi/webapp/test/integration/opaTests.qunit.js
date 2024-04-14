sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kibi/test/integration/FirstJourney',
		'kibi/test/integration/pages/BIentityList',
		'kibi/test/integration/pages/BIentityObjectPage'
    ],
    function(JourneyRunner, opaJourney, BIentityList, BIentityObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kibi') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBIentityList: BIentityList,
					onTheBIentityObjectPage: BIentityObjectPage
                }
            },
            opaJourney.run
        );
    }
);