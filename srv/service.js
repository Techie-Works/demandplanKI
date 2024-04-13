// // const cds = require ('@sap/cds');

//const { Console } = require("console")

// // class ExtService extends cds.ApplicationService{
// // init() {

// //   /**
// //    * Reflect definitions from the service's CDS model
// //    */
// //   const { Demand } = this.entities


// //   /**
// //    * Fill in primary keys for new Travels.
// //    * Note: In contrast to Bookings and BookingSupplements that has to happen
// //    * upon SAVE, as multiple users could create new Travels concurrently.
// //    */
// //   this.after ('CREATE', 'Demand', async req => {
// //     const { maxID } = await SELECT.one `max(demand) as maxID` .from (Demand)
// //     console.log("MY OUTPUT");
// //     console.log(req.data) ;
// //   })
// //   return super.init()

// // }}
// module.exports = {ExtService}
// const cds = require('@sap/cds')
// module.exports = function (){
// //   this.on ('submitOrder', (req)=>{...}) //> custom actions
//   this.after ('CREATE',`Demand`,async (req)=>{
//     console.log("hallon woorld")
//     console.log("i m working",req) ;
//     // req.data.BookingSupplementID = maxID + 1
//     let totalOutputVar= 0
//     for (let i=0;i<req.to_output.length;i++){
//     // req.data.BookingSupplementID = maxID + 1
//     // req.data.BookingSupplementID = maxID + 1
//         totalOutputVar=req.to_output[i].output+totalOutputVar
        
        
//     }
//     console.log("total",totalOutputVar)
//     req.total_output =totalOutputVar
//     const TotalOutput = cds.entities.Demands;
//         const db = cds.services.db;

//         try {
//             // Insert the calculated totalOutputVar into the TotalOutput entity
//             await db.run(INSERT.into(Demands).entries({ value: totalOutputVar }));
//             console.log("Total Output persisted to database.");
//         } catch (error) {
//             console.error("Error persisting Total Output to database:", error);
//         }

//   })
//   this.before ('UPDATE',`*`, (req)=>{...})
//   this.after ('READ',`Books`, (each)=>{...})
//}

// const cds = require('@sap/cds')

// module.exports = function () {
//   // Helper function to update total_output
//   function updateTotalOutput(req) {
//     let totalOutput = 0;

//     if (req.to_output && Array.isArray(req.to_output)) {
//       for (const item of req.to_output) {
//         if (item.output) {
//           totalOutput += item.output;
//         } else {
//           console.error("Item in to_output is missing 'output' property");
//         }
//       }
//     } else {
//       console.error("req.to_output is not a valid array");
//     }

//     return totalOutput;
//   }

//   // Event handler to calculate and save total_output after Demand creation
//   this.after('CREATE', 'Demand', async (req) => {
//     // ... your other logic (if any)

//     req.total_output = updateTotalOutput(req);

//     // Logic to save the updated 'total_output'
//     try {
//       await UPDATE(Demands)
//         .set({ total_output: req.total_output })
//         .where({ ID: req.ID }); // Assuming 'ID' is the primary key of Demands
//     } catch (error) {
//       console.error("Error updating total_output:", error);
//     }
//   });
// }

// const cds = require('@sap/cds')

// module.exports = async (srv) => {

//   // Helper function to update total_output
//   function updateTotalOutput(demand) {
//     let totalOutput = 0;

//     if (demand.to_output && Array.isArray(demand.to_output)) {
//       for (const item of demand.to_output) {
//         if (item.output) {
//           totalOutput += item.output;
//         } else {
//           console.error("Item in to_output is missing 'output' property");
//         }
//       }
//     } else {
//       console.error("demand.to_output is not a valid array");
//     }

//     return totalOutput;
//   }

//   // Event handler for Demand creation
//   srv.after('CREATE', 'Demands', async (demand) => {
//     try {
//       demand.total_output = updateTotalOutput(demand); 
//     } catch (error) {
//       console.error("Error in Demands CREATE handler:", error);
//     }
//   });

//   // Event handler to recalculate on Output changes (or creation)
//   srv.after(['CREATE', 'UPDATE'], 'Outputs', async (output, req) => {
//     try {
//       const demand = await cds.transaction(req).run(
//         SELECT.one.from('my.Demands').where({ID: output.to_demand_ID})
//       );

//       if (demand) {
//         demand.total_output = updateTotalOutput(demand);

//         try {
//           await cds.transaction(req).run(
//             UPDATE('my.Demands')
//               .set({ total_output: demand.total_output })
//               .where({ ID: demand.ID }) 
//           );
//         } catch (error) {
//           console.error("Error updating Demands:", error);
//         }
//       } else {
//         console.error('Demand not found for Output:', output);
//       }
//     } catch (error) {
//       console.error("Error in Outputs CREATE/UPDATE handler:", error); 
//     }
//   });

//   // ... The rest of your service definitions with entity exposures
// };


//   // ... Other service logic 

//  const cds = require ('@sap/cds')

// class Demandservice extends cds.ApplicationService {
// init() {

//   const {Demands} = this.entities

  
//   this.on ('fullfilled', req => UPDATE (req._target) .with ({to_status_code:'F'}))
//   this.on ('cancel', req => UPDATE (req._target) .with ({to_status_code:'X'}))

//   // Add base class's handlers. Handlers registered above go first.
//   return super.init();

// }}
// module.exports = {Demandservice}

// const cds = require('@sap/cds')

// class Demandservice extends cds.ApplicationService {
//   init() {
//     const { Demand } = this.entities;

//   this.on('fullfilled', 'Demand', async (req) => {
//     const { demandID } = req.data;
//     const tx = cds.tx(req);

//     try {
//       if (demandID) {
//         // Perform the necessary updates when the "fullfilled" action is invoked
//         const updatedDemand = await tx.run(
//           UPDATE(Demand, { demandID })
//             .set('to_status.code', 'F') // Set the status to 'Fullfilled'
//         );

//         // Return the updated demand entity
//         return updatedDemand;
//       } else {
//         req.error(400, 'demandID is required');
//       }
//     } catch (err) {
//       req.error(err.code || 500, err.message);
//     }
//   });
// });
//     return super.init()

//     // ... (rest of the code)
//   }
// module.exports = { Demandservice }

// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function() {
//   const { Demand } = this.entities;

//   this.on('fullfilled', 'Demand', async (req) => {
//     const { demandID } = req.data;
//     const tx = cds.tx(req);

//     try {
//       if (demandID) {
//         const updatedDemand = await tx.run(
//           UPDATE(Demand, { demandID })
//             .set('to_status.code', 'F')
//         );

//         return updatedDemand;
//       } else {
//         return req.error(400, 'Invalid request data. demandID is required to fulfill a demand.');
//       }
//     } catch (err) {
//       req.error(err.code || 500, err.message);
//     }
//   });
// });

// module.exports = srv => {

//   const { Demands } = srv.entities

//   srv.after('READ', 'Outputs', (outputs, req) => {

//     return outputs.map(async to_demand => {
//       const publications = await cds.transaction(req).run(
//         SELECT .from(Demands) .where({ to_demand_ID: to_demand.ID })
//       )
//       to_demand.numberOfBooks = publications.length
//       console.log("hello there")
//     })

//   })

// }
