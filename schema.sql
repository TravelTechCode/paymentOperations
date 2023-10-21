
CREATE TABLE pri_paymentOps_PaymentRequestsHeader (
  createdAt TIMESTAMP_TEXT,
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP_TEXT,
  modifiedBy NVARCHAR(255),
  ID NVARCHAR(36) NOT NULL,
  requestNumber INTEGER DEFAULT 0,
  requestType_code NVARCHAR(255),
  requestStatus_code NVARCHAR(255),
  PRIMARY KEY(ID)
);

CREATE TABLE pri_paymentOps_PaymentRequestsItem (
  createdAt TIMESTAMP_TEXT,
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP_TEXT,
  modifiedBy NVARCHAR(255),
  ID NVARCHAR(36) NOT NULL,
  paymentRequestsHeader_ID NVARCHAR(36),
  operationType_code NVARCHAR(255),
  reservationID INTEGER,
  purchaseOrderID NVARCHAR(36),
  requestID NVARCHAR(36),
  purchaseItemID NVARCHAR(36),
  operationID NVARCHAR(36),
  operationStatus NVARCHAR(255),
  assetID NVARCHAR(255),
  businessEntityID NVARCHAR(255),
  amount DECIMAL(16, 3),
  currencyCode_code NVARCHAR(3),
  PRIMARY KEY(ID)
);

CREATE TABLE pri_paymentOps_PaymentRequestsStatus (
  createdAt TIMESTAMP_TEXT,
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP_TEXT,
  modifiedBy NVARCHAR(255),
  ID NVARCHAR(36) NOT NULL,
  paymentRequestsHeader_ID NVARCHAR(36),
  PreviousStatus_code NVARCHAR(255),
  NewStatus_code NVARCHAR(255),
  PRIMARY KEY(ID)
);

CREATE TABLE pri_paymentOps_RequestTypes (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  active BOOLEAN,
  approval BOOLEAN,
  PRIMARY KEY(code)
);

CREATE TABLE pri_paymentOps_OperationTypes (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  active BOOLEAN,
  PRIMARY KEY(code)
);

CREATE TABLE pri_paymentOps_AssetTypes (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  active BOOLEAN,
  PRIMARY KEY(code)
);

CREATE TABLE pri_paymentOps_RequestStatus (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(code)
);

CREATE TABLE pri_paymentOps_RequestActions (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(code)
);

CREATE TABLE pri_paymentOps_StatusTransition (
  ID NVARCHAR(36) NOT NULL,
  FromStatusID_code NVARCHAR(255),
  ToStatusID_code NVARCHAR(255),
  Action_code NVARCHAR(255),
  PRIMARY KEY(ID)
);

CREATE TABLE sap_common_Currencies (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  symbol NVARCHAR(5),
  minorUnit SMALLINT,
  PRIMARY KEY(code)
);

CREATE TABLE pri_paymentOps_RequestTypes_operationTypes (
  up__code NVARCHAR(255) NOT NULL,
  operationType_code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(up__code, operationType_code)
);

CREATE TABLE pri_paymentOps_RequestTypes_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(locale, code)
);

CREATE TABLE pri_paymentOps_OperationTypes_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(locale, code)
);

CREATE TABLE pri_paymentOps_AssetTypes_requestTypes (
  up__code NVARCHAR(255) NOT NULL,
  requestType_code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(up__code, requestType_code)
);

CREATE TABLE pri_paymentOps_AssetTypes_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(locale, code)
);

CREATE TABLE pri_paymentOps_RequestStatus_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(locale, code)
);

CREATE TABLE pri_paymentOps_RequestActions_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(255) NOT NULL,
  PRIMARY KEY(locale, code)
);

CREATE TABLE sap_common_Currencies_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  PRIMARY KEY(locale, code)
);

CREATE VIEW payOpsService_PaymentRequestsHeader AS SELECT
  PaymentRequestsHeader_0.createdAt,
  PaymentRequestsHeader_0.createdBy,
  PaymentRequestsHeader_0.modifiedAt,
  PaymentRequestsHeader_0.modifiedBy,
  PaymentRequestsHeader_0.ID,
  PaymentRequestsHeader_0.requestNumber,
  PaymentRequestsHeader_0.requestType_code,
  PaymentRequestsHeader_0.requestStatus_code
FROM pri_paymentOps_PaymentRequestsHeader AS PaymentRequestsHeader_0;

CREATE VIEW payOpsService_PaymentRequestsItem AS SELECT
  PaymentRequestsItem_0.createdAt,
  PaymentRequestsItem_0.createdBy,
  PaymentRequestsItem_0.modifiedAt,
  PaymentRequestsItem_0.modifiedBy,
  PaymentRequestsItem_0.ID,
  PaymentRequestsItem_0.paymentRequestsHeader_ID,
  PaymentRequestsItem_0.operationType_code,
  PaymentRequestsItem_0.reservationID,
  PaymentRequestsItem_0.purchaseOrderID,
  PaymentRequestsItem_0.requestID,
  PaymentRequestsItem_0.purchaseItemID,
  PaymentRequestsItem_0.operationID,
  PaymentRequestsItem_0.operationStatus,
  PaymentRequestsItem_0.assetID,
  PaymentRequestsItem_0.businessEntityID,
  PaymentRequestsItem_0.amount,
  PaymentRequestsItem_0.currencyCode_code
FROM pri_paymentOps_PaymentRequestsItem AS PaymentRequestsItem_0;

CREATE VIEW payOpsService_RequestTypes AS SELECT
  RequestTypes_0.name,
  RequestTypes_0.descr,
  RequestTypes_0.code,
  RequestTypes_0.active,
  RequestTypes_0.approval
FROM pri_paymentOps_RequestTypes AS RequestTypes_0;

CREATE VIEW payOpsService_RequestStatus AS SELECT
  RequestStatus_0.name,
  RequestStatus_0.descr,
  RequestStatus_0.code
FROM pri_paymentOps_RequestStatus AS RequestStatus_0;

CREATE VIEW payOpsService_PaymentRequestsStatus AS SELECT
  PaymentRequestsStatus_0.createdAt,
  PaymentRequestsStatus_0.createdBy,
  PaymentRequestsStatus_0.modifiedAt,
  PaymentRequestsStatus_0.modifiedBy,
  PaymentRequestsStatus_0.ID,
  PaymentRequestsStatus_0.paymentRequestsHeader_ID,
  PaymentRequestsStatus_0.PreviousStatus_code,
  PaymentRequestsStatus_0.NewStatus_code
FROM pri_paymentOps_PaymentRequestsStatus AS PaymentRequestsStatus_0;

CREATE VIEW payOpsService_OperationTypes AS SELECT
  OperationTypes_0.name,
  OperationTypes_0.descr,
  OperationTypes_0.code,
  OperationTypes_0.active
FROM pri_paymentOps_OperationTypes AS OperationTypes_0;

CREATE VIEW payOpsService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM sap_common_Currencies AS Currencies_0;

CREATE VIEW payOpsService_RequestTypes_operationTypes AS SELECT
  operationTypes_0.up__code,
  operationTypes_0.operationType_code
FROM pri_paymentOps_RequestTypes_operationTypes AS operationTypes_0;

CREATE VIEW payOpsService_AssetTypes AS SELECT
  AssetTypes_0.name,
  AssetTypes_0.descr,
  AssetTypes_0.code,
  AssetTypes_0.active
FROM pri_paymentOps_AssetTypes AS AssetTypes_0;

CREATE VIEW payOpsService_AssetTypes_requestTypes AS SELECT
  requestTypes_0.up__code,
  requestTypes_0.requestType_code
FROM pri_paymentOps_AssetTypes_requestTypes AS requestTypes_0;

CREATE VIEW payOpsService_RequestTypes_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM pri_paymentOps_RequestTypes_texts AS texts_0;

CREATE VIEW payOpsService_RequestStatus_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM pri_paymentOps_RequestStatus_texts AS texts_0;

CREATE VIEW payOpsService_OperationTypes_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM pri_paymentOps_OperationTypes_texts AS texts_0;

CREATE VIEW payOpsService_Currencies_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM sap_common_Currencies_texts AS texts_0;

CREATE VIEW payOpsService_AssetTypes_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM pri_paymentOps_AssetTypes_texts AS texts_0;

CREATE VIEW localized_pri_paymentOps_RequestTypes AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active,
  L_0.approval
FROM (pri_paymentOps_RequestTypes AS L_0 LEFT JOIN pri_paymentOps_RequestTypes_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = 'en');

CREATE VIEW localized_pri_paymentOps_OperationTypes AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active
FROM (pri_paymentOps_OperationTypes AS L_0 LEFT JOIN pri_paymentOps_OperationTypes_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = 'en');

CREATE VIEW localized_pri_paymentOps_AssetTypes AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active
FROM (pri_paymentOps_AssetTypes AS L_0 LEFT JOIN pri_paymentOps_AssetTypes_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = 'en');

CREATE VIEW localized_pri_paymentOps_RequestStatus AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (pri_paymentOps_RequestStatus AS L_0 LEFT JOIN pri_paymentOps_RequestStatus_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = 'en');

CREATE VIEW localized_pri_paymentOps_RequestActions AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (pri_paymentOps_RequestActions AS L_0 LEFT JOIN pri_paymentOps_RequestActions_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = 'en');

CREATE VIEW localized_sap_common_Currencies AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = 'en');

CREATE VIEW localized_pri_paymentOps_PaymentRequestsHeader AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.requestNumber,
  L.requestType_code,
  L.requestStatus_code
FROM pri_paymentOps_PaymentRequestsHeader AS L;

CREATE VIEW localized_pri_paymentOps_PaymentRequestsItem AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.paymentRequestsHeader_ID,
  L.operationType_code,
  L.reservationID,
  L.purchaseOrderID,
  L.requestID,
  L.purchaseItemID,
  L.operationID,
  L.operationStatus,
  L.assetID,
  L.businessEntityID,
  L.amount,
  L.currencyCode_code
FROM pri_paymentOps_PaymentRequestsItem AS L;

CREATE VIEW localized_pri_paymentOps_PaymentRequestsStatus AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.paymentRequestsHeader_ID,
  L.PreviousStatus_code,
  L.NewStatus_code
FROM pri_paymentOps_PaymentRequestsStatus AS L;

CREATE VIEW localized_pri_paymentOps_StatusTransition AS SELECT
  L.ID,
  L.FromStatusID_code,
  L.ToStatusID_code,
  L.Action_code
FROM pri_paymentOps_StatusTransition AS L;

CREATE VIEW localized_pri_paymentOps_RequestTypes_operationTypes AS SELECT
  L.up__code,
  L.operationType_code
FROM pri_paymentOps_RequestTypes_operationTypes AS L;

CREATE VIEW localized_pri_paymentOps_AssetTypes_requestTypes AS SELECT
  L.up__code,
  L.requestType_code
FROM pri_paymentOps_AssetTypes_requestTypes AS L;

CREATE VIEW localized_payOpsService_RequestTypes AS SELECT
  RequestTypes_0.name,
  RequestTypes_0.descr,
  RequestTypes_0.code,
  RequestTypes_0.active,
  RequestTypes_0.approval
FROM localized_pri_paymentOps_RequestTypes AS RequestTypes_0;

CREATE VIEW localized_payOpsService_RequestStatus AS SELECT
  RequestStatus_0.name,
  RequestStatus_0.descr,
  RequestStatus_0.code
FROM localized_pri_paymentOps_RequestStatus AS RequestStatus_0;

CREATE VIEW localized_payOpsService_OperationTypes AS SELECT
  OperationTypes_0.name,
  OperationTypes_0.descr,
  OperationTypes_0.code,
  OperationTypes_0.active
FROM localized_pri_paymentOps_OperationTypes AS OperationTypes_0;

CREATE VIEW localized_payOpsService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_sap_common_Currencies AS Currencies_0;

CREATE VIEW localized_payOpsService_AssetTypes AS SELECT
  AssetTypes_0.name,
  AssetTypes_0.descr,
  AssetTypes_0.code,
  AssetTypes_0.active
FROM localized_pri_paymentOps_AssetTypes AS AssetTypes_0;

CREATE VIEW localized_payOpsService_PaymentRequestsHeader AS SELECT
  PaymentRequestsHeader_0.createdAt,
  PaymentRequestsHeader_0.createdBy,
  PaymentRequestsHeader_0.modifiedAt,
  PaymentRequestsHeader_0.modifiedBy,
  PaymentRequestsHeader_0.ID,
  PaymentRequestsHeader_0.requestNumber,
  PaymentRequestsHeader_0.requestType_code,
  PaymentRequestsHeader_0.requestStatus_code
FROM localized_pri_paymentOps_PaymentRequestsHeader AS PaymentRequestsHeader_0;

CREATE VIEW localized_payOpsService_RequestTypes_operationTypes AS SELECT
  operationTypes_0.up__code,
  operationTypes_0.operationType_code
FROM localized_pri_paymentOps_RequestTypes_operationTypes AS operationTypes_0;

CREATE VIEW localized_payOpsService_AssetTypes_requestTypes AS SELECT
  requestTypes_0.up__code,
  requestTypes_0.requestType_code
FROM localized_pri_paymentOps_AssetTypes_requestTypes AS requestTypes_0;

CREATE VIEW localized_payOpsService_PaymentRequestsStatus AS SELECT
  PaymentRequestsStatus_0.createdAt,
  PaymentRequestsStatus_0.createdBy,
  PaymentRequestsStatus_0.modifiedAt,
  PaymentRequestsStatus_0.modifiedBy,
  PaymentRequestsStatus_0.ID,
  PaymentRequestsStatus_0.paymentRequestsHeader_ID,
  PaymentRequestsStatus_0.PreviousStatus_code,
  PaymentRequestsStatus_0.NewStatus_code
FROM localized_pri_paymentOps_PaymentRequestsStatus AS PaymentRequestsStatus_0;

CREATE VIEW localized_payOpsService_PaymentRequestsItem AS SELECT
  PaymentRequestsItem_0.createdAt,
  PaymentRequestsItem_0.createdBy,
  PaymentRequestsItem_0.modifiedAt,
  PaymentRequestsItem_0.modifiedBy,
  PaymentRequestsItem_0.ID,
  PaymentRequestsItem_0.paymentRequestsHeader_ID,
  PaymentRequestsItem_0.operationType_code,
  PaymentRequestsItem_0.reservationID,
  PaymentRequestsItem_0.purchaseOrderID,
  PaymentRequestsItem_0.requestID,
  PaymentRequestsItem_0.purchaseItemID,
  PaymentRequestsItem_0.operationID,
  PaymentRequestsItem_0.operationStatus,
  PaymentRequestsItem_0.assetID,
  PaymentRequestsItem_0.businessEntityID,
  PaymentRequestsItem_0.amount,
  PaymentRequestsItem_0.currencyCode_code
FROM localized_pri_paymentOps_PaymentRequestsItem AS PaymentRequestsItem_0;

CREATE VIEW localized_de_pri_paymentOps_RequestTypes AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active,
  L_0.approval
FROM (pri_paymentOps_RequestTypes AS L_0 LEFT JOIN pri_paymentOps_RequestTypes_texts AS localized_de_1 ON localized_de_1.code = L_0.code AND localized_de_1.locale = 'de');

CREATE VIEW localized_fr_pri_paymentOps_RequestTypes AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active,
  L_0.approval
FROM (pri_paymentOps_RequestTypes AS L_0 LEFT JOIN pri_paymentOps_RequestTypes_texts AS localized_fr_1 ON localized_fr_1.code = L_0.code AND localized_fr_1.locale = 'fr');

CREATE VIEW localized_de_pri_paymentOps_OperationTypes AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active
FROM (pri_paymentOps_OperationTypes AS L_0 LEFT JOIN pri_paymentOps_OperationTypes_texts AS localized_de_1 ON localized_de_1.code = L_0.code AND localized_de_1.locale = 'de');

CREATE VIEW localized_fr_pri_paymentOps_OperationTypes AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active
FROM (pri_paymentOps_OperationTypes AS L_0 LEFT JOIN pri_paymentOps_OperationTypes_texts AS localized_fr_1 ON localized_fr_1.code = L_0.code AND localized_fr_1.locale = 'fr');

CREATE VIEW localized_de_pri_paymentOps_AssetTypes AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active
FROM (pri_paymentOps_AssetTypes AS L_0 LEFT JOIN pri_paymentOps_AssetTypes_texts AS localized_de_1 ON localized_de_1.code = L_0.code AND localized_de_1.locale = 'de');

CREATE VIEW localized_fr_pri_paymentOps_AssetTypes AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.active
FROM (pri_paymentOps_AssetTypes AS L_0 LEFT JOIN pri_paymentOps_AssetTypes_texts AS localized_fr_1 ON localized_fr_1.code = L_0.code AND localized_fr_1.locale = 'fr');

CREATE VIEW localized_de_pri_paymentOps_RequestStatus AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (pri_paymentOps_RequestStatus AS L_0 LEFT JOIN pri_paymentOps_RequestStatus_texts AS localized_de_1 ON localized_de_1.code = L_0.code AND localized_de_1.locale = 'de');

CREATE VIEW localized_fr_pri_paymentOps_RequestStatus AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (pri_paymentOps_RequestStatus AS L_0 LEFT JOIN pri_paymentOps_RequestStatus_texts AS localized_fr_1 ON localized_fr_1.code = L_0.code AND localized_fr_1.locale = 'fr');

CREATE VIEW localized_de_pri_paymentOps_RequestActions AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (pri_paymentOps_RequestActions AS L_0 LEFT JOIN pri_paymentOps_RequestActions_texts AS localized_de_1 ON localized_de_1.code = L_0.code AND localized_de_1.locale = 'de');

CREATE VIEW localized_fr_pri_paymentOps_RequestActions AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (pri_paymentOps_RequestActions AS L_0 LEFT JOIN pri_paymentOps_RequestActions_texts AS localized_fr_1 ON localized_fr_1.code = L_0.code AND localized_fr_1.locale = 'fr');

CREATE VIEW localized_de_sap_common_Currencies AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_de_1 ON localized_de_1.code = L_0.code AND localized_de_1.locale = 'de');

CREATE VIEW localized_fr_sap_common_Currencies AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_fr_1 ON localized_fr_1.code = L_0.code AND localized_fr_1.locale = 'fr');

CREATE VIEW localized_de_pri_paymentOps_PaymentRequestsHeader AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.requestNumber,
  L.requestType_code,
  L.requestStatus_code
FROM pri_paymentOps_PaymentRequestsHeader AS L;

CREATE VIEW localized_fr_pri_paymentOps_PaymentRequestsHeader AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.requestNumber,
  L.requestType_code,
  L.requestStatus_code
FROM pri_paymentOps_PaymentRequestsHeader AS L;

CREATE VIEW localized_de_pri_paymentOps_PaymentRequestsItem AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.paymentRequestsHeader_ID,
  L.operationType_code,
  L.reservationID,
  L.purchaseOrderID,
  L.requestID,
  L.purchaseItemID,
  L.operationID,
  L.operationStatus,
  L.assetID,
  L.businessEntityID,
  L.amount,
  L.currencyCode_code
FROM pri_paymentOps_PaymentRequestsItem AS L;

CREATE VIEW localized_fr_pri_paymentOps_PaymentRequestsItem AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.paymentRequestsHeader_ID,
  L.operationType_code,
  L.reservationID,
  L.purchaseOrderID,
  L.requestID,
  L.purchaseItemID,
  L.operationID,
  L.operationStatus,
  L.assetID,
  L.businessEntityID,
  L.amount,
  L.currencyCode_code
FROM pri_paymentOps_PaymentRequestsItem AS L;

CREATE VIEW localized_de_pri_paymentOps_PaymentRequestsStatus AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.paymentRequestsHeader_ID,
  L.PreviousStatus_code,
  L.NewStatus_code
FROM pri_paymentOps_PaymentRequestsStatus AS L;

CREATE VIEW localized_fr_pri_paymentOps_PaymentRequestsStatus AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.ID,
  L.paymentRequestsHeader_ID,
  L.PreviousStatus_code,
  L.NewStatus_code
FROM pri_paymentOps_PaymentRequestsStatus AS L;

CREATE VIEW localized_de_pri_paymentOps_StatusTransition AS SELECT
  L.ID,
  L.FromStatusID_code,
  L.ToStatusID_code,
  L.Action_code
FROM pri_paymentOps_StatusTransition AS L;

CREATE VIEW localized_fr_pri_paymentOps_StatusTransition AS SELECT
  L.ID,
  L.FromStatusID_code,
  L.ToStatusID_code,
  L.Action_code
FROM pri_paymentOps_StatusTransition AS L;

CREATE VIEW localized_de_pri_paymentOps_RequestTypes_operationTypes AS SELECT
  L.up__code,
  L.operationType_code
FROM pri_paymentOps_RequestTypes_operationTypes AS L;

CREATE VIEW localized_fr_pri_paymentOps_RequestTypes_operationTypes AS SELECT
  L.up__code,
  L.operationType_code
FROM pri_paymentOps_RequestTypes_operationTypes AS L;

CREATE VIEW localized_de_pri_paymentOps_AssetTypes_requestTypes AS SELECT
  L.up__code,
  L.requestType_code
FROM pri_paymentOps_AssetTypes_requestTypes AS L;

CREATE VIEW localized_fr_pri_paymentOps_AssetTypes_requestTypes AS SELECT
  L.up__code,
  L.requestType_code
FROM pri_paymentOps_AssetTypes_requestTypes AS L;

CREATE VIEW localized_de_payOpsService_RequestTypes AS SELECT
  RequestTypes_0.name,
  RequestTypes_0.descr,
  RequestTypes_0.code,
  RequestTypes_0.active,
  RequestTypes_0.approval
FROM localized_de_pri_paymentOps_RequestTypes AS RequestTypes_0;

CREATE VIEW localized_fr_payOpsService_RequestTypes AS SELECT
  RequestTypes_0.name,
  RequestTypes_0.descr,
  RequestTypes_0.code,
  RequestTypes_0.active,
  RequestTypes_0.approval
FROM localized_fr_pri_paymentOps_RequestTypes AS RequestTypes_0;

CREATE VIEW localized_de_payOpsService_RequestStatus AS SELECT
  RequestStatus_0.name,
  RequestStatus_0.descr,
  RequestStatus_0.code
FROM localized_de_pri_paymentOps_RequestStatus AS RequestStatus_0;

CREATE VIEW localized_fr_payOpsService_RequestStatus AS SELECT
  RequestStatus_0.name,
  RequestStatus_0.descr,
  RequestStatus_0.code
FROM localized_fr_pri_paymentOps_RequestStatus AS RequestStatus_0;

CREATE VIEW localized_de_payOpsService_OperationTypes AS SELECT
  OperationTypes_0.name,
  OperationTypes_0.descr,
  OperationTypes_0.code,
  OperationTypes_0.active
FROM localized_de_pri_paymentOps_OperationTypes AS OperationTypes_0;

CREATE VIEW localized_fr_payOpsService_OperationTypes AS SELECT
  OperationTypes_0.name,
  OperationTypes_0.descr,
  OperationTypes_0.code,
  OperationTypes_0.active
FROM localized_fr_pri_paymentOps_OperationTypes AS OperationTypes_0;

CREATE VIEW localized_de_payOpsService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_de_sap_common_Currencies AS Currencies_0;

CREATE VIEW localized_fr_payOpsService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_fr_sap_common_Currencies AS Currencies_0;

CREATE VIEW localized_de_payOpsService_AssetTypes AS SELECT
  AssetTypes_0.name,
  AssetTypes_0.descr,
  AssetTypes_0.code,
  AssetTypes_0.active
FROM localized_de_pri_paymentOps_AssetTypes AS AssetTypes_0;

CREATE VIEW localized_fr_payOpsService_AssetTypes AS SELECT
  AssetTypes_0.name,
  AssetTypes_0.descr,
  AssetTypes_0.code,
  AssetTypes_0.active
FROM localized_fr_pri_paymentOps_AssetTypes AS AssetTypes_0;

CREATE VIEW localized_de_payOpsService_PaymentRequestsHeader AS SELECT
  PaymentRequestsHeader_0.createdAt,
  PaymentRequestsHeader_0.createdBy,
  PaymentRequestsHeader_0.modifiedAt,
  PaymentRequestsHeader_0.modifiedBy,
  PaymentRequestsHeader_0.ID,
  PaymentRequestsHeader_0.requestNumber,
  PaymentRequestsHeader_0.requestType_code,
  PaymentRequestsHeader_0.requestStatus_code
FROM localized_de_pri_paymentOps_PaymentRequestsHeader AS PaymentRequestsHeader_0;

CREATE VIEW localized_fr_payOpsService_PaymentRequestsHeader AS SELECT
  PaymentRequestsHeader_0.createdAt,
  PaymentRequestsHeader_0.createdBy,
  PaymentRequestsHeader_0.modifiedAt,
  PaymentRequestsHeader_0.modifiedBy,
  PaymentRequestsHeader_0.ID,
  PaymentRequestsHeader_0.requestNumber,
  PaymentRequestsHeader_0.requestType_code,
  PaymentRequestsHeader_0.requestStatus_code
FROM localized_fr_pri_paymentOps_PaymentRequestsHeader AS PaymentRequestsHeader_0;

CREATE VIEW localized_de_payOpsService_RequestTypes_operationTypes AS SELECT
  operationTypes_0.up__code,
  operationTypes_0.operationType_code
FROM localized_de_pri_paymentOps_RequestTypes_operationTypes AS operationTypes_0;

CREATE VIEW localized_fr_payOpsService_RequestTypes_operationTypes AS SELECT
  operationTypes_0.up__code,
  operationTypes_0.operationType_code
FROM localized_fr_pri_paymentOps_RequestTypes_operationTypes AS operationTypes_0;

CREATE VIEW localized_de_payOpsService_AssetTypes_requestTypes AS SELECT
  requestTypes_0.up__code,
  requestTypes_0.requestType_code
FROM localized_de_pri_paymentOps_AssetTypes_requestTypes AS requestTypes_0;

CREATE VIEW localized_fr_payOpsService_AssetTypes_requestTypes AS SELECT
  requestTypes_0.up__code,
  requestTypes_0.requestType_code
FROM localized_fr_pri_paymentOps_AssetTypes_requestTypes AS requestTypes_0;

CREATE VIEW localized_de_payOpsService_PaymentRequestsStatus AS SELECT
  PaymentRequestsStatus_0.createdAt,
  PaymentRequestsStatus_0.createdBy,
  PaymentRequestsStatus_0.modifiedAt,
  PaymentRequestsStatus_0.modifiedBy,
  PaymentRequestsStatus_0.ID,
  PaymentRequestsStatus_0.paymentRequestsHeader_ID,
  PaymentRequestsStatus_0.PreviousStatus_code,
  PaymentRequestsStatus_0.NewStatus_code
FROM localized_de_pri_paymentOps_PaymentRequestsStatus AS PaymentRequestsStatus_0;

CREATE VIEW localized_fr_payOpsService_PaymentRequestsStatus AS SELECT
  PaymentRequestsStatus_0.createdAt,
  PaymentRequestsStatus_0.createdBy,
  PaymentRequestsStatus_0.modifiedAt,
  PaymentRequestsStatus_0.modifiedBy,
  PaymentRequestsStatus_0.ID,
  PaymentRequestsStatus_0.paymentRequestsHeader_ID,
  PaymentRequestsStatus_0.PreviousStatus_code,
  PaymentRequestsStatus_0.NewStatus_code
FROM localized_fr_pri_paymentOps_PaymentRequestsStatus AS PaymentRequestsStatus_0;

CREATE VIEW localized_de_payOpsService_PaymentRequestsItem AS SELECT
  PaymentRequestsItem_0.createdAt,
  PaymentRequestsItem_0.createdBy,
  PaymentRequestsItem_0.modifiedAt,
  PaymentRequestsItem_0.modifiedBy,
  PaymentRequestsItem_0.ID,
  PaymentRequestsItem_0.paymentRequestsHeader_ID,
  PaymentRequestsItem_0.operationType_code,
  PaymentRequestsItem_0.reservationID,
  PaymentRequestsItem_0.purchaseOrderID,
  PaymentRequestsItem_0.requestID,
  PaymentRequestsItem_0.purchaseItemID,
  PaymentRequestsItem_0.operationID,
  PaymentRequestsItem_0.operationStatus,
  PaymentRequestsItem_0.assetID,
  PaymentRequestsItem_0.businessEntityID,
  PaymentRequestsItem_0.amount,
  PaymentRequestsItem_0.currencyCode_code
FROM localized_de_pri_paymentOps_PaymentRequestsItem AS PaymentRequestsItem_0;

CREATE VIEW localized_fr_payOpsService_PaymentRequestsItem AS SELECT
  PaymentRequestsItem_0.createdAt,
  PaymentRequestsItem_0.createdBy,
  PaymentRequestsItem_0.modifiedAt,
  PaymentRequestsItem_0.modifiedBy,
  PaymentRequestsItem_0.ID,
  PaymentRequestsItem_0.paymentRequestsHeader_ID,
  PaymentRequestsItem_0.operationType_code,
  PaymentRequestsItem_0.reservationID,
  PaymentRequestsItem_0.purchaseOrderID,
  PaymentRequestsItem_0.requestID,
  PaymentRequestsItem_0.purchaseItemID,
  PaymentRequestsItem_0.operationID,
  PaymentRequestsItem_0.operationStatus,
  PaymentRequestsItem_0.assetID,
  PaymentRequestsItem_0.businessEntityID,
  PaymentRequestsItem_0.amount,
  PaymentRequestsItem_0.currencyCode_code
FROM localized_fr_pri_paymentOps_PaymentRequestsItem AS PaymentRequestsItem_0;

