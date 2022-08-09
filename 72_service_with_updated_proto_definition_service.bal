import ballerina/grpc;
import ballerina/log;

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR_72_SERVICE_WITH_UPDATED_PROTO_DEFINITION_SERVICE,
    descMap: getDescriptorMap72ServiceWithUpdatedProtoDefinitionService()
}
service "UserService" on new grpc:Listener(9172) {
    remote function GetOrganization(GetOrganizationRequest req) returns GetOrganizationResponse {
        log:printInfo(req.toString());
        return {
            organization: {
                id: 120,
                uuid: "6c3239ef",
                'handle: "ballerina",
                name: "Ballerina User",
                owner: {
                    id: 231,
                    idp_id: "edc43c23",
                    picture_url: "example.com/picture.png",
                    email: "abc@ballerina.com",
                    display_name: "Ballerina",
                    is_anonymous: true,
                    created_at: [0, 0],
                    expired_at: [1622479545, 0]
                }
            },
            is_admin: true
        };
    }

    remote function GetGroup() returns Group {
        return {
            id: 120,
            org_name: "Ballerina",
            org_uuid: "bal_swan_lake",
            description: "This is Ballerina gRPC",
            default_group: true,
            name: "gRPC",
            other_data: {
                "version": "2.3.1",
                "release_data": [12, 13],
                "artifact_count": 100
            },
            owner: {
                id: 231,
                idp_id: "edc43c23",
                picture_url: "example.com/picture.png",
                email: "abc@ballerina.com",
                display_name: "Ballerina",
                is_anonymous: true,
                created_at: [0, 0],
                expired_at: [1622479545, 0]
            }
        };
    }
}
