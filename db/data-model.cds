namespace pri.paymentOps;

using {
    managed,
    cuid,
    sap.common.CodeList,
    Currency
} from '@sap/cds/common';

entity PaymentRequestsHeader : managed, cuid {

    requestNumber        : Integer @readonly default 0; @assert.unique
    @Core.Computed
    requestType          : Association to RequestTypes;

    @Core.Computed
    requestStatus        : Association to RequestStatus;
    paymentRequestItems  : Composition of many PaymentRequestsItem
                               on paymentRequestItems.paymentRequestsHeader = $self;
    paymentRequestStatus : Composition of many PaymentRequestsStatus
                               on paymentRequestStatus.paymentRequestsHeader = $self;
};

entity PaymentRequestsItem : managed, cuid {

    paymentRequestsHeader : Association to PaymentRequestsHeader;
    operationType         : Association to OperationTypes;
    reservationID        : Integer;
    purchaseOrderID      : UUID;

    requestID             : UUID;
    @Core.Computed
    purchaseItemID        : UUID;

    @Core.Computed
    operationID           : UUID;

    @Core.Computed
    operationStatus       : String;
    assetID               : String;
    businessEntityID      : String;
    
    amount     : Decimal(16, 3);
    currencyCode   : Currency;

};

entity PaymentRequestsStatus : managed, cuid {

    paymentRequestsHeader : Association to PaymentRequestsHeader;
    PreviousStatus        : Association to RequestStatus;
    NewStatus             : Association to RequestStatus;

};

entity RequestTypes : CodeList {
    key code           : String enum {
            payout = 'PAYOUT';
            refund = 'REFUND';
        };
    operationTypes : Composition of many {
            key operationType : Association to OperationTypes;
    }
    assetTypes: Association to many AssetTypes.requestTypes on assetTypes.requestType = $self;
    active         : Boolean;
    approval       : Boolean;
};

entity OperationTypes : CodeList {
    key code   : String enum {
            release  = 'RELEASE';
            withdraw = 'WITHDRAW';
            reverse  = 'REVERSE';
            refund   = 'REFUND';
        };
    requestTypes : Association to many RequestTypes.operationTypes on requestTypes.operationType = $self;
    active : Boolean;
    };

entity AssetTypes : CodeList {
    key code         : String enum {
            payout = 'ACCOMMODATION';
            refund = 'FLIGHTS';
        };
    requestTypes : Composition of many {
            key requestType : Association to RequestTypes;
    }
    active       : Boolean;
};

entity RequestStatus : CodeList {
    key code : String enum {
            Requested = 'REQ';
            Approved  = 'A';
            Cancelled = 'C';
            Rejected  = 'REJ';
            Failed    = 'F';
        };

};

entity RequestActions : CodeList {
    key code : String enum {
            Submit  = 'SUB';
            Approve = 'A';
            Cancel  = 'C';
            Reject  = 'REJ';
        };

};

entity StatusTransition : cuid {

    FromStatusID : Association to RequestStatus;
    ToStatusID   : Association to RequestStatus;
    Action       : Association to RequestActions;

};
