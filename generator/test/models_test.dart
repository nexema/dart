import 'dart:io';

import 'package:nexema_generator/models.dart';
import 'package:test/test.dart';

const String snapshotFile = "./example/snapshot.nexs";

void main() {
  test("Test parse snapshot json", () {
    final data = NexemaSnapshot.fromJson(File(snapshotFile).readAsStringSync());
    expect(
        data.toJson(),
        equals(NexemaSnapshot(version: 1, hashcode: "17641252858630784519", files: [
          NexemaFile(
              id: "15228718835168607873",
              path: "v1/common/entity.nex",
              packageName: "common",
              types: [
                NexemaTypeDefinition(
                  id: "9851093560426766228",
                  name: "Entity",
                  modifier: NexemaTypeModifier.base,
                  fields: [
                    NexemaTypeFieldDefinition(
                        index: 0,
                        name: "id",
                        type: NexemaPrimitiveValueType(
                          nullable: false,
                          primitive: NexemaPrimitive.string,
                        )),
                    NexemaTypeFieldDefinition(
                        index: 1,
                        name: "created_at",
                        type: NexemaPrimitiveValueType(
                          nullable: false,
                          primitive: NexemaPrimitive.timestamp,
                        )),
                    NexemaTypeFieldDefinition(
                        index: 2,
                        name: "deleted_at",
                        type: NexemaPrimitiveValueType(
                          nullable: true,
                          primitive: NexemaPrimitive.timestamp,
                        )),
                    NexemaTypeFieldDefinition(
                        index: 3,
                        name: "modified_at",
                        type: NexemaPrimitiveValueType(
                          nullable: true,
                          primitive: NexemaPrimitive.timestamp,
                        ))
                  ],
                )
              ]),
          NexemaFile(
              id: "5758910570454447854",
              path: "v1/common/location/address.nex",
              packageName: "location",
              types: [
                NexemaTypeDefinition(
                    id: "13009575510080279639",
                    name: "Address",
                    modifier: NexemaTypeModifier.struct,
                    fields: [
                      NexemaTypeFieldDefinition(
                          index: 0,
                          name: "id",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.string)),
                      NexemaTypeFieldDefinition(
                          index: 1,
                          name: "city",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.string)),
                      NexemaTypeFieldDefinition(
                          index: 2,
                          name: "region",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.string)),
                      NexemaTypeFieldDefinition(
                          index: 3,
                          name: "country",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.string)),
                      NexemaTypeFieldDefinition(
                          index: 4,
                          name: "coordinates",
                          type: NexemaTypeValueType(
                              nullable: false, objectId: "13479800383264607709"))
                    ])
              ]),
          NexemaFile(
              id: "18253202679260610236",
              path: "v1/common/location/coordinates.nex",
              packageName: "location",
              types: [
                NexemaTypeDefinition(
                    id: "13479800383264607709",
                    name: "Coordinates",
                    modifier: NexemaTypeModifier.struct,
                    fields: [
                      NexemaTypeFieldDefinition(
                          index: 0,
                          name: "latitude",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.float64)),
                      NexemaTypeFieldDefinition(
                          index: 1,
                          name: "longitude",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.float64)),
                    ])
              ]),
          NexemaFile(
              id: "14814708098205083495",
              path: "v1/identity/user.nex",
              packageName: "identity",
              types: [
                NexemaTypeDefinition(
                    id: "1018294955515524191",
                    name: "User",
                    baseType: "9851093560426766228",
                    modifier: NexemaTypeModifier.struct,
                    defaults: {
                      "first_name": "Tomas",
                      "preferences": {"cats": false, "dogs": true}
                    },
                    fields: [
                      NexemaTypeFieldDefinition(
                          index: 0,
                          name: "first_name",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.string)),
                      NexemaTypeFieldDefinition(
                          index: 1,
                          name: "last_name",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.string)),
                      NexemaTypeFieldDefinition(
                          index: 2,
                          name: "email",
                          type: NexemaPrimitiveValueType(
                              nullable: false, primitive: NexemaPrimitive.string)),
                      NexemaTypeFieldDefinition(
                          index: 3,
                          name: "tags",
                          documentation: ["List of tags"],
                          annotations: {"obsolete": true},
                          type: NexemaPrimitiveValueType(
                              nullable: true,
                              primitive: NexemaPrimitive.list,
                              arguments: [
                                NexemaPrimitiveValueType(
                                    nullable: true, primitive: NexemaPrimitive.string)
                              ])),
                      NexemaTypeFieldDefinition(
                          index: 4,
                          name: "preferences",
                          annotations: {
                            "header": ["hola"]
                          },
                          type: NexemaPrimitiveValueType(
                              nullable: false,
                              primitive: NexemaPrimitive.map,
                              arguments: [
                                NexemaPrimitiveValueType(
                                    nullable: false, primitive: NexemaPrimitive.string),
                                NexemaPrimitiveValueType(
                                    nullable: true, primitive: NexemaPrimitive.bool)
                              ])),
                      NexemaTypeFieldDefinition(
                          index: 5,
                          name: "account_type",
                          type: NexemaTypeValueType(
                              objectId: "17814066070050856057", nullable: false)),
                      NexemaTypeFieldDefinition(
                          index: 6,
                          name: "account_details",
                          type: NexemaTypeValueType(
                              objectId: "10295209963266977739", nullable: false)),
                      NexemaTypeFieldDefinition(
                          index: 7,
                          name: "address",
                          type: NexemaTypeValueType(
                              objectId: "13009575510080279639", nullable: false)),
                    ]),
                NexemaTypeDefinition(
                    id: "17814066070050856057",
                    name: "AccountType",
                    modifier: NexemaTypeModifier.enumerator,
                    fields: [
                      NexemaTypeFieldDefinition(
                        index: 0,
                        name: "unknown",
                      ),
                      NexemaTypeFieldDefinition(
                        index: 1,
                        name: "admin",
                      ),
                      NexemaTypeFieldDefinition(
                        index: 2,
                        name: "employee",
                      ),
                      NexemaTypeFieldDefinition(
                        index: 3,
                        name: "customer",
                      ),
                    ]),
                NexemaTypeDefinition(
                    id: "10295209963266977739",
                    name: "AccountDetails",
                    modifier: NexemaTypeModifier.union,
                    fields: [
                      NexemaTypeFieldDefinition(
                        index: 0,
                        name: "customer",
                        type:
                            NexemaTypeValueType(objectId: "15573699729907174246", nullable: false),
                      ),
                      NexemaTypeFieldDefinition(
                        index: 1,
                        name: "employee",
                        type: NexemaTypeValueType(objectId: "2635019918070179479", nullable: false),
                      ),
                      NexemaTypeFieldDefinition(
                        index: 2,
                        name: "admin",
                        type:
                            NexemaTypeValueType(objectId: "13933365081113129845", nullable: false),
                      ),
                    ]),
                NexemaTypeDefinition(
                    id: "15573699729907174246",
                    name: "CustomerAccount",
                    modifier: NexemaTypeModifier.struct,
                    fields: [
                      NexemaTypeFieldDefinition(
                        index: 0,
                        name: "dni",
                        type: NexemaPrimitiveValueType(
                            nullable: false, primitive: NexemaPrimitive.string),
                      ),
                    ]),
                NexemaTypeDefinition(
                    id: "2635019918070179479",
                    name: "EmployeeAccount",
                    modifier: NexemaTypeModifier.struct,
                    fields: [
                      NexemaTypeFieldDefinition(
                        index: 0,
                        name: "permissions",
                        type: NexemaPrimitiveValueType(
                            nullable: false,
                            primitive: NexemaPrimitive.list,
                            arguments: [
                              NexemaPrimitiveValueType(
                                  nullable: false, primitive: NexemaPrimitive.string)
                            ]),
                      ),
                    ]),
                NexemaTypeDefinition(
                    id: "13933365081113129845",
                    name: "AdminAccount",
                    modifier: NexemaTypeModifier.struct,
                    fields: [
                      NexemaTypeFieldDefinition(
                        index: 0,
                        name: "full_access",
                        type: NexemaPrimitiveValueType(
                            nullable: false, primitive: NexemaPrimitive.bool),
                      ),
                    ])
              ])
        ]).toJson()));
  });
}
