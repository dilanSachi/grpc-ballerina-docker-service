import ballerina/grpc;
import ballerina/time;
import ballerina/protobuf.types.empty;

public isolated client class UpdatedServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR_72_SERVICE_WITH_UPDATED_PROTO_DEFINITION_SERVICE, getDescriptorMap72ServiceWithUpdatedProtoDefinitionService());
    }

    isolated remote function GetClass(GetClassRequest|ContextGetClassRequest req) returns GetClassResponse|grpc:Error {
        map<string|string[]> headers = {};
        GetClassRequest message;
        if req is ContextGetClassRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("UpdatedService/GetClass", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <GetClassResponse>result;
    }

    isolated remote function GetClassContext(GetClassRequest|ContextGetClassRequest req) returns ContextGetClassResponse|grpc:Error {
        map<string|string[]> headers = {};
        GetClassRequest message;
        if req is ContextGetClassRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("UpdatedService/GetClass", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <GetClassResponse>result, headers: respHeaders};
    }

    isolated remote function GetGroup() returns Group|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("UpdatedService/GetGroup", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Group>result;
    }

    isolated remote function GetGroupContext() returns ContextGroup|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("UpdatedService/GetGroup", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Group>result, headers: respHeaders};
    }
}

public client class UpdatedServiceGetClassResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendGetClassResponse(GetClassResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextGetClassResponse(ContextGetClassResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class UpdatedServiceGroupCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendGroup(Group response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextGroup(ContextGroup response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextGroup record {|
    Group content;
    map<string|string[]> headers;
|};

public type ContextGetClassResponse record {|
    GetClassResponse content;
    map<string|string[]> headers;
|};

public type ContextGetClassRequest record {|
    GetClassRequest content;
    map<string|string[]> headers;
|};

public type Group record {|
    int g_number = 0;
    string g_name = "";
    string g_id = "";
    string description = "";
    boolean first_group = false;
    map<anydata> other_data = {};
    Student student = {};
    string name?;
    string reg_name?;
|};

isolated function isValidGroup(Group r) returns boolean {
    int display_nameCount = 0;
    if !(r?.name is ()) {
        display_nameCount += 1;
    }
    if !(r?.reg_name is ()) {
        display_nameCount += 1;
    }
    if (display_nameCount > 1) {
        return false;
    }
    return true;
}

isolated function setGroup_Name(Group r, string name) {
    r.name = name;
    _ = r.removeIfHasKey("reg_name");
}

isolated function setGroup_RegName(Group r, string reg_name) {
    r.reg_name = reg_name;
    _ = r.removeIfHasKey("name");
}

public type GetClassResponse record {|
    Class class_data = {};
    boolean has_teacher = false;
|};

public type GetClassRequest record {|
    string class_name = "";
|};

public type Class record {|
    int number = 0;
    string location = "";
    string leader = "";
    string name = "";
    Student student = {};
|};

public type Student record {|
    int number = 0;
    string location = "";
    string email = "";
    string pet_name = "";
    boolean is_fail = false;
    time:Utc admission_time = [0, 0.0d];
|};

const string ROOT_DESCRIPTOR_72_SERVICE_WITH_UPDATED_PROTO_DEFINITION_SERVICE = "0A3637325F736572766963655F776974685F757064617465645F70726F746F5F646566696E6974696F6E5F736572766963652E70726F746F1A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F1A1C676F6F676C652F70726F746F6275662F7374727563742E70726F746F22300A0F476574436C61737352657175657374121D0A0A636C6173735F6E616D651801200128095209636C6173734E616D65225A0A10476574436C617373526573706F6E736512250A0A636C6173735F6461746118012001280B32062E436C6173735209636C61737344617461121F0A0B6861735F74656163686572180220012808520A68617354656163686572228B010A05436C61737312160A066E756D62657218012001280352066E756D626572121A0A086C6F636174696F6E18022001280952086C6F636174696F6E12160A066C656164657218032001280952066C656164657212120A046E616D6518042001280952046E616D6512220A0773747564656E7418052001280B32082E53747564656E74520773747564656E7422AE020A0547726F757012190A08675F6E756D6265721801200128035207674E756D62657212150A06675F6E616D651802200128095205674E616D6512110A04675F6964180320012809520367496412200A0B6465736372697074696F6E180420012809520B6465736372697074696F6E121F0A0B66697273745F67726F7570180520012808520A666972737447726F757012140A046E616D65180620012809480052046E616D65121B0A087265675F6E616D65180720012809480052077265674E616D6512360A0A6F746865725F6461746118082001280B32172E676F6F676C652E70726F746F6275662E53747275637452096F746865724461746112220A0773747564656E7418092001280B32082E53747564656E74520773747564656E74420E0A0C646973706C61795F6E616D6522CA010A0753747564656E7412160A066E756D62657218012001280352066E756D626572121A0A086C6F636174696F6E18022001280952086C6F636174696F6E12140A05656D61696C1803200128095205656D61696C12190A087065745F6E616D6518042001280952077065744E616D6512170A0769735F6661696C180520012808520669734661696C12410A0E61646D697373696F6E5F74696D6518062001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D70520D61646D697373696F6E54696D65326D0A0E5570646174656453657276696365122F0A08476574436C61737312102E476574436C617373526571756573741A112E476574436C617373526573706F6E7365122A0A0847657447726F757012162E676F6F676C652E70726F746F6275662E456D7074791A062E47726F7570620670726F746F33";

public isolated function getDescriptorMap72ServiceWithUpdatedProtoDefinitionService() returns map<string> {
    return {"72_service_with_updated_proto_definition_service.proto": "0A3637325F736572766963655F776974685F757064617465645F70726F746F5F646566696E6974696F6E5F736572766963652E70726F746F1A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F1A1C676F6F676C652F70726F746F6275662F7374727563742E70726F746F22300A0F476574436C61737352657175657374121D0A0A636C6173735F6E616D651801200128095209636C6173734E616D65225A0A10476574436C617373526573706F6E736512250A0A636C6173735F6461746118012001280B32062E436C6173735209636C61737344617461121F0A0B6861735F74656163686572180220012808520A68617354656163686572228B010A05436C61737312160A066E756D62657218012001280352066E756D626572121A0A086C6F636174696F6E18022001280952086C6F636174696F6E12160A066C656164657218032001280952066C656164657212120A046E616D6518042001280952046E616D6512220A0773747564656E7418052001280B32082E53747564656E74520773747564656E7422AE020A0547726F757012190A08675F6E756D6265721801200128035207674E756D62657212150A06675F6E616D651802200128095205674E616D6512110A04675F6964180320012809520367496412200A0B6465736372697074696F6E180420012809520B6465736372697074696F6E121F0A0B66697273745F67726F7570180520012808520A666972737447726F757012140A046E616D65180620012809480052046E616D65121B0A087265675F6E616D65180720012809480052077265674E616D6512360A0A6F746865725F6461746118082001280B32172E676F6F676C652E70726F746F6275662E53747275637452096F746865724461746112220A0773747564656E7418092001280B32082E53747564656E74520773747564656E74420E0A0C646973706C61795F6E616D6522CA010A0753747564656E7412160A066E756D62657218012001280352066E756D626572121A0A086C6F636174696F6E18022001280952086C6F636174696F6E12140A05656D61696C1803200128095205656D61696C12190A087065745F6E616D6518042001280952077065744E616D6512170A0769735F6661696C180520012808520669734661696C12410A0E61646D697373696F6E5F74696D6518062001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D70520D61646D697373696F6E54696D65326D0A0E5570646174656453657276696365122F0A08476574436C61737312102E476574436C617373526571756573741A112E476574436C617373526573706F6E7365122A0A0847657447726F757012162E676F6F676C652E70726F746F6275662E456D7074791A062E47726F7570620670726F746F33", "google/protobuf/empty.proto": "0A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F120F676F6F676C652E70726F746F62756622070A05456D70747942540A13636F6D2E676F6F676C652E70726F746F627566420A456D70747950726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33", "google/protobuf/struct.proto": "0A1C676F6F676C652F70726F746F6275662F7374727563742E70726F746F120F676F6F676C652E70726F746F6275662298010A06537472756374123B0A066669656C647318012003280B32232E676F6F676C652E70726F746F6275662E5374727563742E4669656C6473456E74727952066669656C64731A510A0B4669656C6473456E74727912100A036B657918012001280952036B6579122C0A0576616C756518022001280B32162E676F6F676C652E70726F746F6275662E56616C7565520576616C75653A02380122B2020A0556616C7565123B0A0A6E756C6C5F76616C756518012001280E321A2E676F6F676C652E70726F746F6275662E4E756C6C56616C7565480052096E756C6C56616C756512230A0C6E756D6265725F76616C75651802200128014800520B6E756D62657256616C756512230A0C737472696E675F76616C75651803200128094800520B737472696E6756616C7565121F0A0A626F6F6C5F76616C756518042001280848005209626F6F6C56616C7565123C0A0C7374727563745F76616C756518052001280B32172E676F6F676C652E70726F746F6275662E5374727563744800520B73747275637456616C7565123B0A0A6C6973745F76616C756518062001280B321A2E676F6F676C652E70726F746F6275662E4C69737456616C7565480052096C69737456616C756542060A046B696E64223B0A094C69737456616C7565122E0A0676616C75657318012003280B32162E676F6F676C652E70726F746F6275662E56616C7565520676616C7565732A1B0A094E756C6C56616C7565120E0A0A4E554C4C5F56414C5545100042550A13636F6D2E676F6F676C652E70726F746F627566420B53747275637450726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33", "google/protobuf/timestamp.proto": "0A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F120F676F6F676C652E70726F746F627566223B0A0954696D657374616D7012180A077365636F6E647318012001280352077365636F6E647312140A056E616E6F7318022001280552056E616E6F7342580A13636F6D2E676F6F676C652E70726F746F627566420E54696D657374616D7050726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"};
}

