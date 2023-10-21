using {pri.paymentOps as payOpsModel} from '../db/data-model';


service payOpsService @(path: '/PayOps') {

    entity PaymentRequestsHeader as projection on payOpsModel.PaymentRequestsHeader {
        *
    } actions {
        //  action createRequest (prod: $self);
    // action A2 (in: many $self);
    };

    entity PaymentRequestsItem   as projection on payOpsModel.PaymentRequestsItem;

    type createReqResponse {
        requestNUmber : Integer;
    }

    type createReqBody {

    }

    action createRequest(orderID : Integer, reason : String) returns createReqResponse;
    function getPaybackDetails (requestId :String) returns String;

    event release {
        reservationID : Integer;
        reason        : String;
    }

    event refund {
        reservationID : Integer;
        reason        : String;
    }

};
