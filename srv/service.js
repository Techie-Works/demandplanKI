 
    /**
     * Reflect definations from the service's CDS model
     */
    // const { Demands} = this.entities;

   /**
   * Fill in primary keys for new Outputs.
   *  as multiple users could create new Outputs concurrently.
   */

    // this.before('CREATE', 'Demands', async req =>{
    //     const {maxID} = await SELECT.one `max(outputID) as maxID` .from(Demands)
    //     req.data.outputID = maxID + 1

    // })


    //
    // Action Implementatins
    //
//     this.on ('acceptDemand'), req => UPDATE (req._targe) .with({ProductStatus_code: "A"})
//     this.on ('rejectDemand'), req => UPDATE (req._targe) .with({ProductStatus_code: "X"})


//     //Base class's handlers. Handlers registered above go first
//     return super.init()

// }}
// module.exports = {Demandservice}