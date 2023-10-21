const cds = require('@sap/cds');
const { executeHttpRequest } = require("@sap-cloud-sdk/http-client");
module.exports = class PayopsService extends cds.ApplicationService {
  init() {
    // register your handlers ...
    this.on("getPaybackDetails", async (req) => {
      let { requestId } = req.data;
      try {
        let response = await executeHttpRequest(
          { //9b5c7cd4-9c4c-4c5e-b10f-2f47a0be4056
            url: `http://localhost:8080/booking/bplatform/b-payments-experience-payback-service/v1/payback/refund-info-by-requestId/${requestId}`,
            // destinationName: "northwind",
          }
          // {
          //   method: "get",
          //   url: "/Products",
          //   data: { ID, Name, Description, Rating, Price },
          // }
        );

        let data = response.data.d;
        return data;
      } catch (error) {
        console.log(error);
      }
    });
    return super.init()
  }
}