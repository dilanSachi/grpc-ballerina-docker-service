import ballerina/grpc;
import ballerina/log;

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR_72_SERVICE_WITH_UPDATED_PROTO_DEFINITION_SERVICE,
    descMap: getDescriptorMap72ServiceWithUpdatedProtoDefinitionService()
}
service "UpdatedService" on new grpc:Listener(9172) {
    remote function GetClass(GetClassRequest req) returns GetClassResponse {
        log:printInfo(req.toString());
        return {
            class_data: {
                number: 120,
                location: "galle",
                leader: "Charlie",
                name: "13-A",
                student: {
                    number: 231,
                    location: "colombo",
                    email: "abc@ballerina.com",
                    pet_name: "chaz",
                    is_fail: true,
                    admission_time: [1622479545, 0]
                }
            },
            has_teacher: true
        };
    }

    remote function GetGroup() returns Group {
        return {
            g_number: 120,
            g_name: "ABC",
            g_id: "g_abc",
            description: "This is ABC Group",
            first_group: true,
            name: "ABC",
            other_data: {
                "count": "5",
                "names": ["A", "B", "C", "D"],
                "marks": 100
            },
            student: {
                number: 231,
                location: "colombo",
                email: "abc@ballerina.com",
                pet_name: "chaz",
                is_fail: true,
                admission_time: [1622479545, 0]
            }
        };
    }
}
