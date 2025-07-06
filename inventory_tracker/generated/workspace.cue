Kind: "workspace"
Apps: [{
    Kind:    "application"
    Version: "v2"
    Name:    "inventory-tracker"
    Cors: ["http://localhost:8080", "http://localhost:8081", "http://localhost:3000"]
    AllowedIPAddresses: []
    Auth: {
        Namespace:            "inventory-tracker"
        IdProviderConfigName: "inventory-tracker-auth"
    }
    Subgraphs: [{
        Type: "tailordb"
        Name: "inventory-tracker"
    }, {
        Type: "pipeline"
        Name: "inventory-tracker"
    }]
}]
Services: [{
    Kind:      "tailordb"
    Version:   "v2"
    Namespace: "inventory-tracker"
    Types: [{
        Name:        "User"
        Description: "User of the system"
        Fields: {
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the user"
                Validate: []
                Index:      true
                Required:   true
                Array:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            email: {
                Type: "string"
                AllowedValues: []
                Description: "Email of the user"
                Validate: []
                Index:      true
                Unique:     true
                Required:   true
                Array:      false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            roles: {
                Type: "uuid"
                AllowedValues: []
                Description: "Role IDs of the user"
                Validate: []
                Required:   false
                Array:      true
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
        }
    }, {
        Name:        "Role"
        Description: "ロールマスタ"
        Fields: {
            name: {
                Type: "string"
                AllowedValues: []
                Description: "ロール名"
                Validate: []
                Index:      true
                Required:   true
                Array:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
        }
    }, {
        Name:        "Location"
        Description: "Location is where the inventories are stored. A location can be a warehouse or a storefront."
        Fields: {
            code: {
                Type: "integer"
                AllowedValues: []
                Description: "Location code. Location is where the inventories are stored. A location can be a warehouse or a storefront."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the location."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            address: {
                Type: "string"
                AllowedValues: []
                Description: "Physical address of the location."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            type: {
                Type: "string"
                AllowedValues: []
                Description: "Type of the location. It can be either 'warehouse' or 'storefront'."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            contactNumber: {
                Type: "string"
                AllowedValues: []
                Description: "Contact number of the location."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "Product"
        Description: "Product model"
        Fields: {
            code: {
                Type: "integer"
                AllowedValues: []
                Description: "Product code."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the product."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            description: {
                Type: "string"
                AllowedValues: []
                Description: "Description of the product."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            price: {
                Type: "float"
                AllowedValues: []
                Description: "Price of the product."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            uom: {
                Type: "string"
                AllowedValues: []
                Description: "Unit of measure of the product."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sellingStartDate: {
                Type: "date"
                AllowedValues: []
                Description: "The date this product starts selling. This field is used to calculate the sales velocity used for demand forecasting."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   true
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "Supplier"
        Description: "Supplier Model"
        Fields: {
            code: {
                Type: "integer"
                AllowedValues: []
                Description: "Supplier code."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the supplier."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            address: {
                Type: "string"
                AllowedValues: []
                Description: "Physical address of the supplier."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            email: {
                Type: "string"
                AllowedValues: []
                Description: "Email address of the supplier."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdByRole: {
                Type: "string"
                AllowedValues: []
                Description: "User ID of the logged in user"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "  user.id"
                    UpdateExpr: "  user.id"
                    Create:     null
                    Update:     null
                }
            }
            contactNumber: {
                Type: "string"
                AllowedValues: []
                Description: "Contact number of the supplier."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "UserData"
        Description: "User Data Model"
        Fields: {
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the user."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            "UserDataList"
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "Lot"
        Description: "Model for Lot. Lot is used for trasability. Lot takes PutAway as a foreign key. With this application, each Lot has one PutAway. This can be customized based on the requirement."
        Fields: {
            putAway: {
                Type: "PutAway"
                AllowedValues: []
                Description: "PutAway model. Lot and PutAway is 1:1."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "putAwayID"
            }
            putAwayID: {
                Type: "uuid"
                AllowedValues: []
                Description: "putAway ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "PurchaseOrder"
        Description: "Model for Purchase Order. Each record of the Purchase Order represents unique combination of a Product, a Location, and a Supplier. Customization is required to wrap multiple records (line items) into one purchase order."
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product. This field constitutes a unique key with location"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location. This field constitutes a unique key with product"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            supplier: {
                Type: "Supplier"
                AllowedValues: []
                Description: "Supplier. This field constitutes a unique key with product"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "supplierID"
            }
            supplierID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Supplier ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Order quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            purchaseOrderDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of purchase order"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   true
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "PutAway"
        Description: "Model for Put Away. Putting away means receiving and storing goods to a location. This model takes PurchaseOrder as a foreign key. Each PurchaseOrder can have multiple PutAway."
        Fields: {
            purchaseOrder: {
                Type: "PurchaseOrder"
                AllowedValues: []
                Description: "PurchaseOrder. Each PutAway requires one PurchaseOrder. Each PurchaseOrder can have multiple PutAway in case the order is received as multiple shipping."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "purchaseOrderID"
            }
            purchaseOrderID: {
                Type: "uuid"
                AllowedValues: []
                Description: "purchaseOrder ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Put away quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            putAwayDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of put away"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            true
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "SalesOrder"
        Description: "Model for Sales Order. Each record of the Sales Order should specify a lot. Customization is required to wrap multiple records (line items) into one purchase order."
        Fields: {
            lot: {
                Type: "Lot"
                AllowedValues: []
                Description: "Lot. Each record of the Sales Order should specify a lot for tracability purpose."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "lotID"
            }
            lotID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Lot ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Order quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            salesOrderDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of sales order"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            customerName: {
                Type: "string"
                AllowedValues: []
                Description: "Customer name"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            deliveryAddress: {
                Type: "string"
                AllowedValues: []
                Description: "Delivery address of the customer"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "ShipOut"
        Description: "Model for Ship Out. Shipping out means the goods leaving the location to a customer to fulfill the sales order. This model takes SalesOrder as a foreign key. Each SalesOrder can have multiple ShipOut."
        Fields: {
            salesOrder: {
                Type: "SalesOrder"
                AllowedValues: []
                Description: "SalesOrder. Each ShipOut requires one SalesOrder. Each SalesOrder can have multiple ShipOut in case the order is delivered in multiple shippings."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "salesOrderID"
            }
            salesOrderID: {
                Type: "uuid"
                AllowedValues: []
                Description: "salesOrder ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Ship out quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            shipOutDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of ship out"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "StockEvent"
        Description: "StockEvent model"
        Fields: {
            lot: {
                Type: "Lot"
                AllowedValues: []
                Description: "Lot is the minimum unit to manage inventory here. Any stock movements has to specify a Lot for the tracability purpose"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "lotID"
            }
            lotID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Lot ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            eventDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of the event"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            incrementalQuantity: {
                Type: "integer"
                AllowedValues: []
                Description: "delta of quantity. This value will be negative value if the event reduces inventory quantities"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            reason: {
                Type: "string"
                AllowedValues: []
                Description: "The reason for the stock event, such as putaway, shipout, return, adjuestment, etc."
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "DemandForecast"
        Description: "Demand forecast"
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sumOfIncrementalQuantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Sum of incremental quantity."
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sellingStartDate: {
                Type: "date"
                AllowedValues: []
                Description: "The date this product starts selling. This field is used to calculate the sales velocity used for demand forecasting."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            today: {
                Type: "date"
                AllowedValues: []
                Description: "The date of the calculation"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "date(today())"
                    UpdateExpr: "date(today())"
                    Create:     null
                    Update:     null
                }
            }
            dailyDemand: {
                Type: "float"
                AllowedValues: []
                Description: "Daily demand."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "decimal(_value.sumOfIncrementalQuantity) / decimal((date(today()) - date(_value.sellingStartDate)).getHours()/24)"
                    UpdateExpr: "decimal(_value.sumOfIncrementalQuantity) / decimal((date(today()) - date(_value.sellingStartDate)).getHours()/24)"
                    Create:     null
                    Update:     null
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "PutAwayCalc"
        Description: "Model for Put Away. Putting away means receiving and storing goods to a location. This model takes PurchaseOrder as a foreign key. Each PurchaseOrder can have multiple PutAway."
        Fields: {
            purchaseOrder: {
                Type: "PurchaseOrder"
                AllowedValues: []
                Description: "PurchaseOrder. Each PutAway requires one PurchaseOrder. Each PurchaseOrder can have multiple PutAway in case the order is received as multiple shipping."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "purchaseOrderID"
            }
            purchaseOrderID: {
                Type: "uuid"
                AllowedValues: []
                Description: "purchaseOrder ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            putAwayID: {
                Type: "uuid"
                AllowedValues: []
                Description: "PutAway ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            supplierID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Supplier ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Put away quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            putAwayDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of put away"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            purchaseOrderDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of order"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            leadTime: {
                Type: "integer"
                AllowedValues: []
                Description: "Date of lead time"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "(date(_value.putAwayDate) - date(_value.purchaseOrderDate)).getHours()/24"
                    UpdateExpr: "(date(_value.putAwayDate) - date(_value.purchaseOrderDate)).getHours()/24"
                    Create:     null
                    Update:     null
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "ReplenishmentAlert"
        Description: "Replenishment alert"
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            daysToStockout: {
                Type: "float"
                AllowedValues: []
                Description: "Days to stockout."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            maxLeadTime: {
                Type: "float"
                AllowedValues: []
                Description: "Max lead time."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            expectedDaysForNextOrder: {
                Type: "float"
                AllowedValues: []
                Description: "Expected days for next order."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "ifThen (_value.daysToStockout != null, _value.daysToStockout + _value.maxLeadTime)"
                    UpdateExpr: "ifThen (_value.daysToStockout != null, _value.daysToStockout + _value.maxLeadTime)"
                    Create:     null
                    Update:     null
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "StockEventCalc"
        Description: "Intermediate calculating table of StockEvent. Flattens Lot, PutAway, PurchaseOrder, Product, Location, and StockEvent."
        Fields: {
            lot: {
                Type: "Lot"
                AllowedValues: []
                Description: "Lot is the minimum unit to manage inventory here. Any stock movements has to specify a Lot for the tracability purpose"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "lotID"
            }
            lotID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Lot ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            eventDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of the event"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            incrementalQuantity: {
                Type: "integer"
                AllowedValues: []
                Description: "delta of quantity. This value will be negative value if the event reduces inventory quantities"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            reason: {
                Type: "string"
                AllowedValues: []
                Description: "The reason for the stock event, such as putaway, shipout, return, adjuestment, etc."
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            stockEventID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Stock event ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            putAwayID: {
                Type: "uuid"
                AllowedValues: []
                Description: "PutAway ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            purchaseOrderID: {
                Type: "uuid"
                AllowedValues: []
                Description: "PurchaseOrder ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sellingStartDate: {
                Type: "date"
                AllowedValues: []
                Description: "Selling start date. Attribute of Product"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "StockLevel"
        Description: "Stock level"
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sumOfIncrementalQuantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Sum of incremental quantity."
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            dailyDemand: {
                Type: "float"
                AllowedValues: []
                Description: "Daily demand."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            daysToStockout: {
                Type: "float"
                AllowedValues: []
                Description: "Days to stock out."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "decimal(_value.sumOfIncrementalQuantity) / decimal(_value.dailyDemand)"
                    UpdateExpr: "decimal(_value.sumOfIncrementalQuantity) / decimal(_value.dailyDemand)"
                    Create:     null
                    Update:     null
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "SupplierLeadTime"
        Description: "Supplier lead time"
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            supplier: {
                Type: "Supplier"
                AllowedValues: []
                Description: "Supplier model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "supplierID"
            }
            supplierID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Supplier ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            averageLeadTime: {
                Type: "float"
                AllowedValues: []
                Description: "Lead time"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }]
}, {
    Kind:        "pipeline"
    Version:     "v2"
    Namespace:   "inventory-tracker"
    Description: ""
    Resolvers: [{
        Name: "calculateDemandForecast"
        Description: """
            The purpose of this Pipeline is to refresh DemandForecast table by aggregating the StockEventCalc table to calculate the average demand for each product and location combination, then store the result to DemandForecast.
            This Pipeline follows the following steps:
            1. Get all the DemandForecast records. This old data will be deleted in the last step.
            2. Refresh the StockEventCalc records by running calculateStockEventCalc pipeline.
            3. Aggregate the StockEventCalc records to calculate the average demand time for each product and location.
            4. Create DemandForecast records based on the result of the aggregation.
            5. Delete the DemandForecast records created prior to the the update.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.createDemandForecast.result) || !isNull(context.pipeline.deleteDemandForecast.result)"
        Pipelines: [{
            Name:        "demandForecasts"
            Description: "Get all the DemandForecast records. This old data will be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery demandForecasts {
                    \t\t\t  \t\tdemandForecasts {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t    \t\t}
                    \t\t\t  \t\t} 
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"demandForecasts": args.demandForecasts,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery demandForecasts {
                \t\t\t  \t\tdemandForecasts {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t    \t\t}
                \t\t\t  \t\t} 
                \t\t\t\t}
                """
        }, {
            Name:        "calculateStockEventCalc"
            Description: "Refresh the StockEventCalc records by running calculateStockEventCalc pipeline."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation calculateStockEventCalc{
                    \t\t\t  \t\tcalculateStockEventCalc
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.calculateStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation calculateStockEventCalc{
                \t\t\t  \t\tcalculateStockEventCalc
                \t\t\t\t}
                """
        }, {
            Name:        "aggregateStockEventCalcs"
            Description: "Aggregate the StockEventCalc records to calculate the average demand time for each product and location."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery aggregateStockEventCalcs {
                    \t\t\t\t\taggregateStockEventCalcs(query: {reason: {eq: "Ship Out"}}) {
                    \t\t\t\t\t\tgroupBy {
                    \t\t\t\t\t\tproductID
                    \t\t\t\t\t\tlocationID
                    \t\t\t\t\t\ttoDay {
                    \t\t\t\t\t\t\tsellingStartDate
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\tsum {
                    \t\t\t\t\t\tincrementalQuantity
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"aggregateStockEventCalcs": args.aggregateStockEventCalcs
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery aggregateStockEventCalcs {
                \t\t\t\t\taggregateStockEventCalcs(query: {reason: {eq: "Ship Out"}}) {
                \t\t\t\t\t\tgroupBy {
                \t\t\t\t\t\tproductID
                \t\t\t\t\t\tlocationID
                \t\t\t\t\t\ttoDay {
                \t\t\t\t\t\t\tsellingStartDate
                \t\t\t\t\t\t}
                \t\t\t\t\t\t}
                \t\t\t\t\t\tsum {
                \t\t\t\t\t\tincrementalQuantity
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createDemandForecast"
            Description: "Create DemandForecast records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args.aggregateStockEventCalcs"
            PreScript: """
                \t\t\t{
                \t\t\t\t"input": compact({
                \t\t\t\t\t"productID": each.groupBy.productID,
                \t\t\t\t\t"locationID": each.groupBy.locationID,
                \t\t\t\t\t"sumOfIncrementalQuantity": each.sum.incrementalQuantity,
                \t\t\t\t\t"sellingStartDate": each.groupBy.toDay.sellingStartDate,
                \t\t\t\t})
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($input: DemandForecastCreateInput) {
                    \t\t\t\t\tcreateDemandForecast(input: $input) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createDemandForecast
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($input: DemandForecastCreateInput) {
                \t\t\t\t\tcreateDemandForecast(input: $input) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deleteDemandForecast"
            Description: "delete demandForecasts"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.demandForecasts.demandForecasts.collection"
            Test:    "size(context.pipeline.demandForecasts.demandForecasts.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteDemandForecast($id: ID!) {
                    \t\t\t\t\tdeleteDemandForecast(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteDemandForecast
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteDemandForecast($id: ID!) {
                \t\t\t\t\tdeleteDemandForecast(id: $id)
                \t\t\t\t}
                """
        }]
    }, {
        Name: "calculatePutAwayLeadTime"
        Description: """
            The purpose of this Pipeline is to create a calculation table for PutAway, then aggregate the calculation table to calculate the average lead time for each product, location, supplier combination, then store the result to SupplierLeadTime.
            This Pipeline follows the following steps:
            1. Get all the putAway records. Also in the same query, get all the putAwayCalc records and supplierLeadTime records to be deleted in the last step.
            2. Parse and flatten the putAway records in pre-script. Then store them in putAwayCalc.
            3. Aggregate the putAwayCalc records to calculate the average lead time for each product, location, supplier combination.
            4. Create SupplierLeadTime records based on the result of the aggregation.
            5. Delete the putAwayCalc records and supplierLeadTime records created prior to the step 3 and 4. Those are the result of the step 1.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript: """
            (!isNull(context.pipeline.createPutAwayCalc.result) || !isNull(context.pipeline.deletePutAwayLeadTimeCalc.result))
            &&
            (!isNull(context.pipeline.createSupplierLeadTime.result) || !isNull(context.pipeline.deleteSupplierLeadTime.result))
            """
        Pipelines: [{
            Name:        "getRecords"
            Description: "Get all the putAway records. Also in the same query, get all the putAwayCalc records and supplierLeadTime records to be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery getRecords {
                    \t\t\t\t\tputAways {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t\tquantity
                    \t\t\t\t\t\t\tputAwayDate
                    \t\t\t\t\t\t\tpurchaseOrderID
                    \t\t\t\t\t\t\tpurchaseOrder {
                    \t\t\t\t\t\t\t\tpurchaseOrderDate
                    \t\t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t\t\tsupplierID
                    \t\t\t\t\t\t\t}
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tputAwayCalcs {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tsupplierLeadTimes{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"putAways": args.putAways,
                \t\t\t\t"putAwayCalcs": args.putAwayCalcs,
                \t\t\t\t"supplierLeadTimes": args.supplierLeadTimes,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery getRecords {
                \t\t\t\t\tputAways {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t\tquantity
                \t\t\t\t\t\t\tputAwayDate
                \t\t\t\t\t\t\tpurchaseOrderID
                \t\t\t\t\t\t\tpurchaseOrder {
                \t\t\t\t\t\t\t\tpurchaseOrderDate
                \t\t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t\t\tsupplierID
                \t\t\t\t\t\t\t}
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tputAwayCalcs {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tsupplierLeadTimes{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createPutAwayCalc"
            Description: "Parse and flatten the putAway records in pre-script. Then store them in putAwayCalc."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.putAways.collection"
            PreScript: """
                {
                \t"putAwayID": each.id,
                \t"quantity": each.quantity,
                \t"putAwayDate": each.putAwayDate,
                \t"purchaseOrderID": each.purchaseOrderID,
                \t// flatten nested fields in purchaseOrder
                \t"productID": each.purchaseOrder.productID,
                \t"locationID": each.purchaseOrder.locationID,
                \t"supplierID": each.purchaseOrder.supplierID,
                \t"purchaseOrderDate": each.purchaseOrder.purchaseOrderDate,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation putAwayCalc(
                    \t\t\t\t\t$putAwayID: ID!
                    \t\t\t\t\t$quantity: Int!
                    \t\t\t\t\t$putAwayDate: Date!
                    \t\t\t\t\t$purchaseOrderID: ID!
                    \t\t\t\t\t$productID: ID!
                    \t\t\t\t\t$locationID: ID!
                    \t\t\t\t\t$supplierID: ID!
                    \t\t\t\t\t$purchaseOrderDate: Date!
                    \t\t\t\t) {
                    \t\t\t\tcreatePutAwayCalc: createPutAwayCalc(
                    \t\t\t\t\tinput:{
                    \t\t\t\t\t\tputAwayID:$putAwayID
                    \t\t\t\t\t\tquantity:$quantity
                    \t\t\t\t\t\tputAwayDate:$putAwayDate
                    \t\t\t\t\t\tpurchaseOrderID:$purchaseOrderID
                    \t\t\t\t\t\tproductID:$productID
                    \t\t\t\t\t\tlocationID:$locationID
                    \t\t\t\t\t\tsupplierID:$supplierID
                    \t\t\t\t\t\tpurchaseOrderDate:$purchaseOrderDate
                    \t\t\t\t\t}){
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createPutAwayCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation putAwayCalc(
                \t\t\t\t\t$putAwayID: ID!
                \t\t\t\t\t$quantity: Int!
                \t\t\t\t\t$putAwayDate: Date!
                \t\t\t\t\t$purchaseOrderID: ID!
                \t\t\t\t\t$productID: ID!
                \t\t\t\t\t$locationID: ID!
                \t\t\t\t\t$supplierID: ID!
                \t\t\t\t\t$purchaseOrderDate: Date!
                \t\t\t\t) {
                \t\t\t\tcreatePutAwayCalc: createPutAwayCalc(
                \t\t\t\t\tinput:{
                \t\t\t\t\t\tputAwayID:$putAwayID
                \t\t\t\t\t\tquantity:$quantity
                \t\t\t\t\t\tputAwayDate:$putAwayDate
                \t\t\t\t\t\tpurchaseOrderID:$purchaseOrderID
                \t\t\t\t\t\tproductID:$productID
                \t\t\t\t\t\tlocationID:$locationID
                \t\t\t\t\t\tsupplierID:$supplierID
                \t\t\t\t\t\tpurchaseOrderDate:$purchaseOrderDate
                \t\t\t\t\t}){
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "aggregatePutAwayCalcs"
            Description: "Aggregate the putAwayCalc records to calculate the average lead time for each product, location, supplier combination."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery aggregatPputAwayCalcs\t{
                    \t\t\t\t\taggregatePutAwayCalcs{
                    \t\t\t\t\t\tgroupBy{
                    \t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t\tsupplierID
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\tavg{
                    \t\t\t\t\t\t\tleadTime
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.aggregatePutAwayCalcs
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery aggregatPputAwayCalcs\t{
                \t\t\t\t\taggregatePutAwayCalcs{
                \t\t\t\t\t\tgroupBy{
                \t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t\tsupplierID
                \t\t\t\t\t\t}
                \t\t\t\t\t\tavg{
                \t\t\t\t\t\t\tleadTime
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createSupplierLeadTime"
            Description: "Create SupplierLeadTime records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args.result"
            PreScript: """
                \t\t\t{
                \t\t\t\t"input": {
                \t\t\t\t\t"productID": each.groupBy.productID,
                \t\t\t\t\t"locationID": each.groupBy.locationID,
                \t\t\t\t\t"supplierID": each.groupBy.supplierID,
                \t\t\t\t\t"averageLeadTime": each.avg.leadTime,
                \t\t\t\t}
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($input: SupplierLeadTimeCreateInput) {
                    \t\t\t\t\tcreateSupplierLeadTime(input: $input) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createSupplierLeadTime
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($input: SupplierLeadTimeCreateInput) {
                \t\t\t\t\tcreateSupplierLeadTime(input: $input) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deletePutAwayLeadTimeCalc"
            Description: "Delete the putAwayCalc records created prior to createPutAwayCalc. Those records are the result of the step getRecords.putAwayCalcs."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.putAwayCalcs.collection"
            Test:    "size(context.pipeline.getRecords.putAwayCalcs.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePutAwayCalc($id: ID!) {
                    \t\t\t  \t\tdeletePutAwayCalc(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deletePutAwayCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePutAwayCalc($id: ID!) {
                \t\t\t  \t\tdeletePutAwayCalc(id: $id)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteSupplierLeadTime"
            Description: "Delete the SupplierLeadTime records created prior to createSupplierLeadTime. Those records are the result of the step getRecords.supplierLeadTimes."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.supplierLeadTimes.collection"
            Test:    "size(context.pipeline.getRecords.supplierLeadTimes.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePutAwayLeadTimeCalc($id: ID!) {
                    \t\t\t\t\tdeleteSupplierLeadTime(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteSupplierLeadTime
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePutAwayLeadTimeCalc($id: ID!) {
                \t\t\t\t\tdeleteSupplierLeadTime(id: $id)
                \t\t\t\t}
                """
        }]
    }, {
        Name: "calculateReplenishmentAlert"
        Description: """
            The purpose of this Pipeline is to refresh DemandForecast table by aggregating the StockEventCalc table to calculate the average demand for each product and location combination, then store the result to DemandForecast.
            This Pipeline follows the following steps:
            1. Get all the DemandForecast records. This old data will be deleted in the last step.
            2. Refresh the StockEventCalc records by running calculateStockEventCalc pipeline.
            3. Aggregate the StockEventCalc records to calculate the average demand time for each product and location.
            4. Create DemandForecast records based on the result of the aggregation.
            5. Delete the DemandForecast records created prior to the the update.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.updateReplenishmentAlert.result) || !isNull(context.pipeline.deletereplenishmentAlerts.result)"
        Pipelines: [{
            Name:        "replenishmentAlerts"
            Description: "Get all the stockLevels records. This old data will be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery replenishmentAlerts{
                    \t\t\t\t\treplenishmentAlerts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"replenishmentAlerts": args.replenishmentAlerts,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery replenishmentAlerts{
                \t\t\t\t\treplenishmentAlerts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "aggregateSupplierLeadTimes"
            Description: "Get all the stockLevels records. This old data will be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery aggregateSupplierLeadTimes{
                    \t\t\t\t\taggregateSupplierLeadTimes{
                    \t\t\t\t\t\tmax{
                    \t\t\t\t\t\t\taverageLeadTime
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\tgroupBy{
                    \t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"aggregateSupplierLeadTimes": args.aggregateSupplierLeadTimes,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery aggregateSupplierLeadTimes{
                \t\t\t\t\taggregateSupplierLeadTimes{
                \t\t\t\t\t\tmax{
                \t\t\t\t\t\t\taverageLeadTime
                \t\t\t\t\t\t}
                \t\t\t\t\t\tgroupBy{
                \t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createReplenishmentAlert"
            Description: "Refresh the StockEventCalc records by running calculateStockEventCalc pipeline."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args.aggregateSupplierLeadTimes"
            PreScript: """
                \t\t\t{
                \t\t\t\t"input": {
                \t\t\t\t\t"productID": each.groupBy.productID,
                \t\t\t\t\t"locationID": each.groupBy.locationID,
                \t\t\t\t\t"maxLeadTime": each.max.averageLeadTime,
                \t\t\t\t}
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($input: ReplenishmentAlertCreateInput) {
                    \t\t\t\t\tcreateReplenishmentAlert(input: $input) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tproductID
                    \t\t\t\t\t\tlocationID
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createReplenishmentAlert
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($input: ReplenishmentAlertCreateInput) {
                \t\t\t\t\tcreateReplenishmentAlert(input: $input) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tproductID
                \t\t\t\t\t\tlocationID
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "prepReplenishmentAlertCreateInput"
            Description: "Fetch records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args"
            PreScript: """
                \t\t\t{\t\t\t\t
                \t\t\t\t"productID": each.result.productID,
                \t\t\t\t"locationID": each.result.locationID,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery ($productID: ID, $locationID: ID) {
                    \t\t\t\t\tstockLevels(query: {productID: {eq: $productID}, locationID: {eq: $locationID}}) {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tdaysToStockout
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\treplenishmentAlerts(
                    \t\t\t\t\t\tquery: {productID: {eq: $productID}, locationID: {eq: $locationID}}
                    \t\t\t\t\t) {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": {
                \t\t\t\t\t"daysToStockout": args.stockLevels.collection == [] ? null : args.stockLevels.collection[0].daysToStockout,
                \t\t\t\t\t"id": args.replenishmentAlerts.collection == [] ? null : args.replenishmentAlerts.collection[0].id,
                \t\t\t\t}
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery ($productID: ID, $locationID: ID) {
                \t\t\t\t\tstockLevels(query: {productID: {eq: $productID}, locationID: {eq: $locationID}}) {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tdaysToStockout
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\treplenishmentAlerts(
                \t\t\t\t\t\tquery: {productID: {eq: $productID}, locationID: {eq: $locationID}}
                \t\t\t\t\t) {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "updateReplenishmentAlert"
            Description: "update replenishmentAlert records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args"
            PreScript: """
                \t\t\t{
                \t\t\t\t"id": each.result.id,
                \t\t\t\t"daysToStockout": each.result.daysToStockout,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($id: ID!, $daysToStockout: Float) {
                    \t\t\t\t\tupdateReplenishmentAlert(id: $id, input: {daysToStockout: $daysToStockout}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tdaysToStockout
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.updateReplenishmentAlert
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($id: ID!, $daysToStockout: Float) {
                \t\t\t\t\tupdateReplenishmentAlert(id: $id, input: {daysToStockout: $daysToStockout}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tdaysToStockout
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deletereplenishmentAlerts"
            Description: "delete replenishmentAlerts"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.replenishmentAlerts.replenishmentAlerts.collection"
            Test:    "size(context.pipeline.replenishmentAlerts.replenishmentAlerts.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteReplenishmentAlert($id: ID!) {
                    \t\t\t\t\tdeleteReplenishmentAlert(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteReplenishmentAlert
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteReplenishmentAlert($id: ID!) {
                \t\t\t\t\tdeleteReplenishmentAlert(id: $id)
                \t\t\t\t}
                """
        }]
    }, {
        Name: "calculateStockEventCalc"
        Description: """
            The purpose of this Pipeline is to create a calculation table for StockEvents.
            This Pipeline follows the following steps:
            1. Get all the StockEvent records. Also in the same query, get all the StockEventCalc records to be deleted in the last step.
            2. Parse and flatten the StockEvent records in pre-script. Then store them in StockEventCalc.
            3. Delete the StockEventCalc records created prior to the step 2.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.createStockEventCalc.result) || !isNull(context.pipeline.deleteStockEventCalc.result)"
        Pipelines: [{
            Name:        "getRecords"
            Description: "Get all the StockEvent records. Also in the same query, get all the StockEventCalc records to be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery getRecords {
                    \t\t\t\t\tstockEvents {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t\teventDate
                    \t\t\t\t\t\t\tincrementalQuantity
                    \t\t\t\t\t\t\treason
                    \t\t\t\t\t\t\tlotID
                    \t\t\t\t\t\t\tlot {
                    \t\t\t\t\t\t\t\tputAway {
                    \t\t\t\t\t\t\t\t\tid
                    \t\t\t\t\t\t\t\t\tquantity
                    \t\t\t\t\t\t\t\t\tputAwayDate
                    \t\t\t\t\t\t\t\t\tpurchaseOrderID
                    \t\t\t\t\t\t\t\t\tpurchaseOrder {
                    \t\t\t\t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\t\t\t\tproduct {
                    \t\t\t\t\t\t\t\t\t\t\tsellingStartDate
                    \t\t\t\t\t\t\t\t\t\t}
                    \t\t\t\t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t\t\t\t\tsupplierID
                    \t\t\t\t\t\t\t\t\t}
                    \t\t\t\t\t\t\t\t}
                    \t\t\t\t\t\t\t}
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockEventCalcs{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"stockEvents": args.stockEvents,
                \t\t\t\t"stockEventCalcs": args.stockEventCalcs,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery getRecords {
                \t\t\t\t\tstockEvents {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t\teventDate
                \t\t\t\t\t\t\tincrementalQuantity
                \t\t\t\t\t\t\treason
                \t\t\t\t\t\t\tlotID
                \t\t\t\t\t\t\tlot {
                \t\t\t\t\t\t\t\tputAway {
                \t\t\t\t\t\t\t\t\tid
                \t\t\t\t\t\t\t\t\tquantity
                \t\t\t\t\t\t\t\t\tputAwayDate
                \t\t\t\t\t\t\t\t\tpurchaseOrderID
                \t\t\t\t\t\t\t\t\tpurchaseOrder {
                \t\t\t\t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\t\t\t\tproduct {
                \t\t\t\t\t\t\t\t\t\t\tsellingStartDate
                \t\t\t\t\t\t\t\t\t\t}
                \t\t\t\t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t\t\t\t\tsupplierID
                \t\t\t\t\t\t\t\t\t}
                \t\t\t\t\t\t\t\t}
                \t\t\t\t\t\t\t}
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockEventCalcs{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createStockEventCalc"
            Description: "Parse and flatten the StockEvent records in pre-script. Then store them in StockEventCalc."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockEvents.collection"
            PreScript: """
                \t\t\t{
                \t\t\t\t"stockEventID": each.id,
                \t\t\t\t"purchaseOrderID": each.lot.putAway.purchaseOrderID,
                \t\t\t\t"putAwayID": each.lot.putAway.id,
                \t\t\t\t"productID": each.lot.putAway.purchaseOrder.productID,
                \t\t\t\t"locationID": each.lot.putAway.purchaseOrder.locationID,
                \t\t\t\t"lotID": each.lotID,
                \t\t\t\t"eventDate": each.eventDate,
                \t\t\t\t"sellingStartDate": each.lot.putAway.purchaseOrder.product.sellingStartDate,
                \t\t\t\t"incrementalQuantity": each.incrementalQuantity,
                \t\t\t\t"reason": each.reason,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation (
                    \t\t\t\t$stockEventID: ID!
                    \t\t\t\t$purchaseOrderID: ID!
                    \t\t\t\t$putAwayID: ID!
                    \t\t\t\t$productID: ID!
                    \t\t\t\t$locationID: ID!
                    \t\t\t\t$lotID: ID!
                    \t\t\t\t$eventDate: Date!
                    \t\t\t\t$sellingStartDate: Date!
                    \t\t\t\t$incrementalQuantity: Int!
                    \t\t\t\t$reason: String!
                    \t\t\t\t) {
                    \t\t\t\t\tcreateStockEventCalc(
                    \t\t\t\t\t\tinput: {
                    \t\t\t\t\t\tstockEventID: $stockEventID
                    \t\t\t\t\t\tpurchaseOrderID: $purchaseOrderID
                    \t\t\t\t\t\tputAwayID: $putAwayID
                    \t\t\t\t\t\tproductID: $productID
                    \t\t\t\t\t\tlocationID: $locationID
                    \t\t\t\t\t\tlotID: $lotID
                    \t\t\t\t\t\teventDate: $eventDate
                    \t\t\t\t\t\tsellingStartDate: $sellingStartDate
                    \t\t\t\t\t\tincrementalQuantity: $incrementalQuantity
                    \t\t\t\t\t\treason: $reason
                    \t\t\t\t\t\t}
                    \t\t\t\t\t) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation (
                \t\t\t\t$stockEventID: ID!
                \t\t\t\t$purchaseOrderID: ID!
                \t\t\t\t$putAwayID: ID!
                \t\t\t\t$productID: ID!
                \t\t\t\t$locationID: ID!
                \t\t\t\t$lotID: ID!
                \t\t\t\t$eventDate: Date!
                \t\t\t\t$sellingStartDate: Date!
                \t\t\t\t$incrementalQuantity: Int!
                \t\t\t\t$reason: String!
                \t\t\t\t) {
                \t\t\t\t\tcreateStockEventCalc(
                \t\t\t\t\t\tinput: {
                \t\t\t\t\t\tstockEventID: $stockEventID
                \t\t\t\t\t\tpurchaseOrderID: $purchaseOrderID
                \t\t\t\t\t\tputAwayID: $putAwayID
                \t\t\t\t\t\tproductID: $productID
                \t\t\t\t\t\tlocationID: $locationID
                \t\t\t\t\t\tlotID: $lotID
                \t\t\t\t\t\teventDate: $eventDate
                \t\t\t\t\t\tsellingStartDate: $sellingStartDate
                \t\t\t\t\t\tincrementalQuantity: $incrementalQuantity
                \t\t\t\t\t\treason: $reason
                \t\t\t\t\t\t}
                \t\t\t\t\t) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deleteStockEventCalc"
            Description: "Delete the StockEventCalc records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockEventCalcs.collection"
            Test:    "size(context.pipeline.getRecords.stockEventCalcs.collection) > 0"
            PreScript: """
                {
                \t"stockEventCalcID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockEventCalc($stockEventCalcID: ID!) {
                    \t\t\t\t\tdeleteStockEventCalc(id: $stockEventCalcID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockEventCalc($stockEventCalcID: ID!) {
                \t\t\t\t\tdeleteStockEventCalc(id: $stockEventCalcID)
                \t\t\t\t}
                """
        }]
    }, {
        Name: "calculateStockLevel"
        Description: """
            The purpose of this Pipeline is to refresh DemandForecast table by aggregating the StockEventCalc table to calculate the average demand for each product and location combination, then store the result to DemandForecast.
            This Pipeline follows the following steps:
            1. Get all the DemandForecast records. This old data will be deleted in the last step.
            2. Refresh the StockEventCalc records by running calculateStockEventCalc pipeline.
            3. Aggregate the StockEventCalc records to calculate the average demand time for each product and location.
            4. Create DemandForecast records based on the result of the aggregation.
            5. Delete the DemandForecast records created prior to the the update.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.updateStockLevel.result) || !isNull(context.pipeline.deletestockLevels.result)"
        Pipelines: [{
            Name:        "stockLevels"
            Description: "Get all the stockLevels records. This old data will be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery stockLevels{
                    \t\t\t\t\tstockLevels{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"stockLevels": args.stockLevels,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery stockLevels{
                \t\t\t\t\tstockLevels{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "calculateStockEventCalc"
            Description: "Refresh the StockEventCalc records by running calculateStockEventCalc pipeline."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation calculateStockEventCalc{
                    \t\t\t  \t\tcalculateStockEventCalc
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.calculateStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation calculateStockEventCalc{
                \t\t\t  \t\tcalculateStockEventCalc
                \t\t\t\t}
                """
        }, {
            Name:        "aggregateStockEventCalcs"
            Description: "Aggregate the StockEventCalc records to calculate the average demand time for each product and location."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery aggregateStockEventCalcs {
                    \t\t\t\t\taggregateStockEventCalcs {
                    \t\t\t\t\t\tgroupBy {
                    \t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\tsum {
                    \t\t\t\t\t\t\tincrementalQuantity
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"aggregateStockEventCalcs": args.aggregateStockEventCalcs
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery aggregateStockEventCalcs {
                \t\t\t\t\taggregateStockEventCalcs {
                \t\t\t\t\t\tgroupBy {
                \t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t}
                \t\t\t\t\t\tsum {
                \t\t\t\t\t\t\tincrementalQuantity
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createStockLevel"
            Description: "Create createStockLevel records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args.aggregateStockEventCalcs"
            PreScript: """
                \t\t\t{
                \t\t\t\t"input": {
                \t\t\t\t\t"productID": each.groupBy.productID,
                \t\t\t\t\t"locationID": each.groupBy.locationID,
                \t\t\t\t\t"sumOfIncrementalQuantity": each.sum.incrementalQuantity,
                \t\t\t\t}
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($input: StockLevelCreateInput) {
                    \t\t\t\t\tcreateStockLevel(input: $input) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tproductID
                    \t\t\t\t\t\tlocationID
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createStockLevel
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($input: StockLevelCreateInput) {
                \t\t\t\t\tcreateStockLevel(input: $input) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tproductID
                \t\t\t\t\t\tlocationID
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "prepStockLevelCreateInput"
            Description: "Fetch DemandForecast records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args"
            PreScript: """
                \t\t\t{\t\t\t\t
                \t\t\t\t"productID": each.result.productID,
                \t\t\t\t"locationID": each.result.locationID,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery demandForecasts($productID: ID, $locationID: ID) {
                    \t\t\t\t\tdemandForecasts(
                    \t\t\t\t\t\tquery: {productID: {eq: $productID}, locationID: {eq: $locationID}}
                    \t\t\t\t\t) {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tdailyDemand
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockLevels(query: {productID: {eq: $productID}, locationID: {eq: $locationID}}) {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": {
                \t\t\t\t\t"dailyDemand": args.demandForecasts.collection == [] ? null : args.demandForecasts.collection[0].dailyDemand,
                \t\t\t\t\t"id": args.stockLevels.collection == [] ? null : args.stockLevels.collection[0].id,
                \t\t\t\t}
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery demandForecasts($productID: ID, $locationID: ID) {
                \t\t\t\t\tdemandForecasts(
                \t\t\t\t\t\tquery: {productID: {eq: $productID}, locationID: {eq: $locationID}}
                \t\t\t\t\t) {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tdailyDemand
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockLevels(query: {productID: {eq: $productID}, locationID: {eq: $locationID}}) {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "updateStockLevel"
            Description: "update createStockLevel records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args"
            PreScript: """
                \t\t\t{
                \t\t\t\t"id": each.result.id,
                \t\t\t\t"dailyDemand": each.result.dailyDemand,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($id: ID!, $dailyDemand: Float) {
                    \t\t\t\t\tupdateStockLevel(id: $id, input: {dailyDemand: $dailyDemand}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.updateStockLevel
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($id: ID!, $dailyDemand: Float) {
                \t\t\t\t\tupdateStockLevel(id: $id, input: {dailyDemand: $dailyDemand}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deletestockLevels"
            Description: "delete stockLevels"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.stockLevels.stockLevels.collection"
            Test:    "size(context.pipeline.stockLevels.stockLevels.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockLevels($id: ID!) {
                    \t\t\t  \t\tdeleteStockLevel(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockLevel
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockLevels($id: ID!) {
                \t\t\t  \t\tdeleteStockLevel(id: $id)
                \t\t\t\t}
                """
        }]
    }, {
        Name:        "deleteAllRecords"
        Description: "DANGER: Delete all the records in the database. This is a test resolver for development purpose only."
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.getRecords)"
        Pipelines: [{
            Name:        "getRecords"
            Description: "Get all the records from all the tailordb models."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery getRecords {
                    \t\t\t\t\tlocations{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tproducts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tsuppliers{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tpurchaseOrders{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tputAways{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tlots{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tsalesOrders{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tshipOuts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockEvents {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockEventCalcs{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockLevels{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tsupplierLeadTimes{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tputAwayCalcs{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tdemandForecasts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\treplenishmentAlerts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"locations": args.locations,
                \t\t\t\t"products": args.products,
                \t\t\t\t"suppliers": args.suppliers,
                \t\t\t\t"purchaseOrders": args.purchaseOrders,
                \t\t\t\t"putAways": args.putAways,
                \t\t\t\t"lots": args.lots,
                \t\t\t\t"salesOrders": args.salesOrders,
                \t\t\t\t"shipOuts": args.shipOuts,
                \t\t\t\t"stockEvents": args.stockEvents,
                \t\t\t\t"stockEventCalcs": args.stockEventCalcs,
                \t\t\t\t"stockLevels": args.stockLevels,
                \t\t\t\t"supplierLeadTimes": args.supplierLeadTimes,
                \t\t\t\t"putAwayCalcs": args.putAwayCalcs,
                \t\t\t\t"demandForecasts": args.demandForecasts,
                \t\t\t\t"replenishmentAlerts": args.replenishmentAlerts,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery getRecords {
                \t\t\t\t\tlocations{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tproducts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tsuppliers{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tpurchaseOrders{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tputAways{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tlots{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tsalesOrders{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tshipOuts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockEvents {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockEventCalcs{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockLevels{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tsupplierLeadTimes{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tputAwayCalcs{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tdemandForecasts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\treplenishmentAlerts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deleteLocation"
            Description: "Delete the Location records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.locations.collection"
            Test:    "size(context.pipeline.getRecords.locations.collection) > 0"
            PreScript: """
                {
                \t"locationID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteLocation($locationID: ID!) {
                    \t\t\t  \t\tdeleteLocation(id: $locationID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteLocation
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteLocation($locationID: ID!) {
                \t\t\t  \t\tdeleteLocation(id: $locationID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteProduct"
            Description: "Delete the Product records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.products.collection"
            Test:    "size(context.pipeline.getRecords.products.collection) > 0"
            PreScript: """
                {
                \t"productID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteProduct($productID: ID!) {
                    \t\t\t  \t\tdeleteProduct(id: $productID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteProduct
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteProduct($productID: ID!) {
                \t\t\t  \t\tdeleteProduct(id: $productID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteSupplier"
            Description: "Delete the Supplier records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.suppliers.collection"
            Test:    "size(context.pipeline.getRecords.suppliers.collection) > 0"
            PreScript: """
                {
                \t"supplierID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteSupplier($supplierID: ID!) {
                    \t\t\t  \t\tdeleteSupplier(id: $supplierID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteSupplier
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteSupplier($supplierID: ID!) {
                \t\t\t  \t\tdeleteSupplier(id: $supplierID)
                \t\t\t\t}
                """
        }, {
            Name:        "deletePurchaseOrder"
            Description: "Delete the PurchaseOrder records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.purchaseOrders.collection"
            Test:    "size(context.pipeline.getRecords.purchaseOrders.collection) > 0"
            PreScript: """
                {
                \t"purchaseOrderID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePurchaseOrder($purchaseOrderID: ID!) {
                    \t\t\t  \t\tdeletePurchaseOrder(id: $purchaseOrderID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deletePurchaseOrder
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePurchaseOrder($purchaseOrderID: ID!) {
                \t\t\t  \t\tdeletePurchaseOrder(id: $purchaseOrderID)
                \t\t\t\t}
                """
        }, {
            Name:        "deletePutAway"
            Description: "Delete the PutAway records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.putAways.collection"
            Test:    "size(context.pipeline.getRecords.putAways.collection) > 0"
            PreScript: """
                {
                \t"putAwayID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePutAway($putAwayID: ID!) {
                    \t\t\t  \t\tdeletePutAway(id: $putAwayID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deletePutAway
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePutAway($putAwayID: ID!) {
                \t\t\t  \t\tdeletePutAway(id: $putAwayID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteLot"
            Description: "Delete the Lot records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.lots.collection"
            Test:    "size(context.pipeline.getRecords.lots.collection) > 0"
            PreScript: """
                {
                \t"lotID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteLot($lotID: ID!) {
                    \t\t\t  \t\tdeleteLot(id: $lotID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteLot
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteLot($lotID: ID!) {
                \t\t\t  \t\tdeleteLot(id: $lotID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteSalesOrder"
            Description: "Delete the SalesOrder records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.salesOrders.collection"
            Test:    "size(context.pipeline.getRecords.salesOrders.collection) > 0"
            PreScript: """
                {
                \t"salesOrderID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteSalesOrder($salesOrderID: ID!) {
                    \t\t\t  \t\tdeleteSalesOrder(id: $salesOrderID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteSalesOrder
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteSalesOrder($salesOrderID: ID!) {
                \t\t\t  \t\tdeleteSalesOrder(id: $salesOrderID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteShipOut"
            Description: "Delete the ShipOut records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.shipOuts.collection"
            Test:    "size(context.pipeline.getRecords.shipOuts.collection) > 0"
            PreScript: """
                {
                \t"shipOutID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteShipOut($shipOutID: ID!) {
                    \t\t\t  \t\tdeleteShipOut(id: $shipOutID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteShipOut
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteShipOut($shipOutID: ID!) {
                \t\t\t  \t\tdeleteShipOut(id: $shipOutID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteStockEvent"
            Description: "Delete the StockEvent records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockEvents.collection"
            Test:    "size(context.pipeline.getRecords.stockEvents.collection) > 0"
            PreScript: """
                {
                \t"stockEventID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockEvent($stockEventID: ID!) {
                    \t\t\t  \t\tdeleteStockEvent(id: $stockEventID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockEvent
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockEvent($stockEventID: ID!) {
                \t\t\t  \t\tdeleteStockEvent(id: $stockEventID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteStockEventCalc"
            Description: "Delete the StockEventCalc records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockEventCalcs.collection"
            Test:    "size(context.pipeline.getRecords.stockEventCalcs.collection) > 0"
            PreScript: """
                {
                \t"stockEventCalcID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockEventCalc($stockEventCalcID: ID!) {
                    \t\t\t  \t\tdeleteStockEventCalc(id: $stockEventCalcID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockEventCalc($stockEventCalcID: ID!) {
                \t\t\t  \t\tdeleteStockEventCalc(id: $stockEventCalcID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteStockLevel"
            Description: "Delete the StockLevel records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockLevels.collection"
            Test:    "size(context.pipeline.getRecords.stockLevels.collection) > 0"
            PreScript: """
                {
                \t"stockLevelID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockLevel($stockLevelID: ID!) {
                    \t\t\t  \t\tdeleteStockLevel(id: $stockLevelID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockLevel
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockLevel($stockLevelID: ID!) {
                \t\t\t  \t\tdeleteStockLevel(id: $stockLevelID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteSupplierLeadTime"
            Description: "Delete the SupplierLeadTime records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.supplierLeadTimes.collection"
            Test:    "size(context.pipeline.getRecords.supplierLeadTimes.collection) > 0"
            PreScript: """
                {
                \t"supplierLeadTimeID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteSupplierLeadTime($supplierLeadTimeID: ID!) {
                    \t\t\t  \t\tdeleteSupplierLeadTime(id: $supplierLeadTimeID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteSupplierLeadTime
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteSupplierLeadTime($supplierLeadTimeID: ID!) {
                \t\t\t  \t\tdeleteSupplierLeadTime(id: $supplierLeadTimeID)
                \t\t\t\t}
                """
        }, {
            Name:        "deletePutAwayCalc"
            Description: "Delete the PutAwayCalc records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.putAwayCalcs.collection"
            Test:    "size(context.pipeline.getRecords.putAwayCalcs.collection) > 0"
            PreScript: """
                {
                \t"putAwayCalcID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePutAwayCalc($putAwayCalcID: ID!) {
                    \t\t\t  \t\tdeletePutAwayCalc(id: $putAwayCalcID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deletePutAwayCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePutAwayCalc($putAwayCalcID: ID!) {
                \t\t\t  \t\tdeletePutAwayCalc(id: $putAwayCalcID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteDemandForecast"
            Description: "Delete the DemandForecast records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.demandForecasts.collection"
            Test:    "size(context.pipeline.getRecords.demandForecasts.collection) > 0"
            PreScript: """
                {
                \t"demandForecastID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteDemandForecast($demandForecastID: ID!) {
                    \t\t\t  \t\tdeleteDemandForecast(id: $demandForecastID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteDemandForecast
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteDemandForecast($demandForecastID: ID!) {
                \t\t\t  \t\tdeleteDemandForecast(id: $demandForecastID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteReplenishmentAlert"
            Description: "Delete the ReplenishmentAlert records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.replenishmentAlerts.collection"
            Test:    "size(context.pipeline.getRecords.replenishmentAlerts.collection) > 0"
            PreScript: """
                {
                \t"replenishmentAlertID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteReplenishmentAlert($replenishmentAlertID: ID!) {
                    \t\t\t  \t\tdeleteReplenishmentAlert(id: $replenishmentAlertID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteReplenishmentAlert
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteReplenishmentAlert($replenishmentAlertID: ID!) {
                \t\t\t  \t\tdeleteReplenishmentAlert(id: $replenishmentAlertID)
                \t\t\t\t}
                """
        }]
    }, {
        Name:        "createPutAwayWithEvent"
        Description: "This API is an alternative to createPutAway. It creates a PutAway record and then creates a corresponding StockEvent record. Use this API if you want to create a PutAway record and a StockEvent record in one API call."
        Inputs: [{
            Name:        "input"
            Description: ""
            Required:    true
            Type: {
                Kind:        "UserDefined"
                Name:        "createPutAwayWithEventInput"
                Description: ""
                Required:    false
                Fields: [{
                    Name:        "id"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: false
                }, {
                    Name:        "quantity"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "Int"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "purchaseOrderID"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "putAwayDate"
                    Description: ""
                    Type: {
                        Kind:        "CustomScalarType"
                        Name:        "Date"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "lotID"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: false
                }]
            }
            Array: false
        }]
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "ID"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "context.pipeline.createPutAway.id"
        Pipelines: [{
            Name:        "createPutAway"
            Description: "Create a new PutAway record."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: "context.args.input"
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createPutAway ($id: ID, $purchaseOrderID: ID!, $quantity: Int!, $putAwayDate: Date!){
                    \t\t\t\t\tcreatePutAway (input: {id: $id, purchaseOrderID: $purchaseOrderID, quantity: $quantity, putAwayDate: $putAwayDate}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createPutAway"
            OperationSource: """
                \t\t\t\tmutation createPutAway ($id: ID, $purchaseOrderID: ID!, $quantity: Int!, $putAwayDate: Date!){
                \t\t\t\t\tcreatePutAway (input: {id: $id, purchaseOrderID: $purchaseOrderID, quantity: $quantity, putAwayDate: $putAwayDate}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createLot"
            Description: "Create a new Lot record with the PutAway id created in the previous step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"putAwayID": context.pipeline.createPutAway.id,
                \t"id": get(context.args.input.lotID)
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createLot ($putAwayID: ID!, $id: ID){
                    \t\t\t\t\tcreateLot (input: {putAwayID: $putAwayID, id: $id}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createLot"
            OperationSource: """
                \t\t\t\tmutation createLot ($putAwayID: ID!, $id: ID){
                \t\t\t\t\tcreateLot (input: {putAwayID: $putAwayID, id: $id}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createStockEvent"
            Description: "Create a new StockEvent record with the Lot id created in the previous step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"lotID": context.pipeline.createLot.id,
                \t"incrementalQuantity": context.args.input.quantity,
                \t"putAwayDate": context.args.input.putAwayDate
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createStockEvent ($lotID: ID!, $incrementalQuantity: Int!, $putAwayDate: Date!) {
                    \t\t\t\t\tcreateStockEvent (input: {lotID: $lotID, incrementalQuantity: $incrementalQuantity, eventDate: $putAwayDate, reason: "Put Away"}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createStockEvent"
            OperationSource: """
                \t\t\t\tmutation createStockEvent ($lotID: ID!, $incrementalQuantity: Int!, $putAwayDate: Date!) {
                \t\t\t\t\tcreateStockEvent (input: {lotID: $lotID, incrementalQuantity: $incrementalQuantity, eventDate: $putAwayDate, reason: "Put Away"}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }]
    }, {
        Name:        "createShipOutWithEvent"
        Description: "This API is an alternative to createShipOut. It creates a ShipOut record and then creates a corresponding StockEvent record. Use this API if you want to create a ShipOut record and a StockEvent record in one API call."
        Inputs: [{
            Name:        "input"
            Description: ""
            Required:    true
            Type: {
                Kind:        "UserDefined"
                Name:        "createShipOutWithEventInput"
                Description: ""
                Required:    false
                Fields: [{
                    Name:        "quantity"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "Int"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "salesOrderID"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "shipOutDate"
                    Description: ""
                    Type: {
                        Kind:        "CustomScalarType"
                        Name:        "Date"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }]
            }
            Array: false
        }]
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "ID"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "context.pipeline.createShipOut.id"
        Pipelines: [{
            Name:        "createShipOut"
            Description: "Create a new ShipOut record."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: "context.args.input"
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createShipOut ($salesOrderID: ID!, $quantity: Int!, $shipOutDate: Date!){
                    \t\t\t\t\tcreateShipOut (input: {salesOrderID: $salesOrderID, quantity: $quantity, shipOutDate: $shipOutDate}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tsalesOrder{
                    \t\t\t\t\t\t\tlotID
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createShipOut"
            OperationSource: """
                \t\t\t\tmutation createShipOut ($salesOrderID: ID!, $quantity: Int!, $shipOutDate: Date!){
                \t\t\t\t\tcreateShipOut (input: {salesOrderID: $salesOrderID, quantity: $quantity, shipOutDate: $shipOutDate}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tsalesOrder{
                \t\t\t\t\t\t\tlotID
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createStockEvent"
            Description: "Create a new StockEvent record with the ShipOut id created in the previous step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"lotID": context.pipeline.createShipOut.salesOrder.lotID,
                \t"incrementalQuantity": -context.args.input.quantity,
                \t"shipOutDate": context.args.input.shipOutDate
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createStockEvent ($lotID: ID!, $incrementalQuantity: Int!, $shipOutDate: Date!) {
                    \t\t\t\t\tcreateStockEvent (input: {lotID: $lotID, incrementalQuantity: $incrementalQuantity, eventDate: $shipOutDate, reason: "Ship Out"}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createStockEvent"
            OperationSource: """
                \t\t\t\tmutation createStockEvent ($lotID: ID!, $incrementalQuantity: Int!, $shipOutDate: Date!) {
                \t\t\t\t\tcreateStockEvent (input: {lotID: $lotID, incrementalQuantity: $incrementalQuantity, eventDate: $shipOutDate, reason: "Ship Out"}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }]
    }, {
        Name: "createPutAwayFromPurchaseOrder"
        Description: """
            The purpose of this Pipeline is to create a single click solution to create a Put Away record from a Purchase Order record.
            This Pipeline follows the following steps:
            1. Get the PurchaseOrder record from ID.
            2. Use the data in the PurchaseOrder as inputs for creating a new PutAway record.
            """
        Inputs: [{
            Name:        "input"
            Description: ""
            Required:    true
            Type: {
                Kind:        "UserDefined"
                Name:        "createPutAwayFromPurchaseOrderInput"
                Description: ""
                Required:    false
                Fields: [{
                    Name:        "purchaseOrderID"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "putAwayDate"
                    Description: ""
                    Type: {
                        Kind:        "CustomScalarType"
                        Name:        "Date"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: false
                }]
            }
            Array: false
        }]
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "ID"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "context.pipeline.createPutAway.id"
        Pipelines: [{
            Name:        "purchaseOrder"
            Description: "Get the PurchaseOrder record from ID."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: "context.args.input"
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery purchaseOrder ($purchaseOrderID: ID!) {
                    \t\t\t\t\tpurchaseOrder (id:$purchaseOrderID) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tquantity
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.purchaseOrder"
            OperationSource: """
                \t\t\t\tquery purchaseOrder ($purchaseOrderID: ID!) {
                \t\t\t\t\tpurchaseOrder (id:$purchaseOrderID) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tquantity
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createPutAway"
            Description: "Use the data in the PurchaseOrder as inputs for creating a new PutAway record."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"purchaseOrderID": context.pipeline.purchaseOrder.id,
                \t"quantity": context.pipeline.purchaseOrder.quantity,
                \t"putAwayDate": isNull(context.args.input.putAwayDate) ? date(today()) : context.args.input.putAwayDate
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createPutAway ($purchaseOrderID: ID!, $quantity: Int!, $putAwayDate: Date!) {
                    \t\t\t\t\tcreatePutAway (input: {purchaseOrderID: $purchaseOrderID, quantity: $quantity, putAwayDate: $putAwayDate}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createPutAway"
            OperationSource: """
                \t\t\t\tmutation createPutAway ($purchaseOrderID: ID!, $quantity: Int!, $putAwayDate: Date!) {
                \t\t\t\t\tcreatePutAway (input: {purchaseOrderID: $purchaseOrderID, quantity: $quantity, putAwayDate: $putAwayDate}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }]
    }, {
        Name: "createShipOutFromSalesOrder"
        Description: """
            The purpose of this Pipeline is to create a single click solution to create a Ship Our record from a Sales Order record.
            This Pipeline follows the following steps:
            1. Get the SalesOrder record from ID.
            2. Use the data in the SalesOrder as inputs for creating a new ShipOut record.
            """
        Inputs: [{
            Name:        "input"
            Description: ""
            Required:    true
            Type: {
                Kind:        "UserDefined"
                Name:        "createShipOutFromSalesOrderInput"
                Description: ""
                Required:    false
                Fields: [{
                    Name: "salesOrderID"
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Required:    true
                    Description: "Sales order ID"
                    Array:       false
                }, {
                    Name: "shipOutDate"
                    Type: {
                        Kind:        "CustomScalarType"
                        Name:        "Date"
                        Description: ""
                        Required:    false
                    }
                    Required:    false
                    Description: "Shipping Date"
                    Array:       false
                }]
            }
            Array: false
        }]
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "ID"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        OperationType: "mutation"
        Authorization: "true==true"
        PostScript:    "context.pipeline.createShipOut.id"
        Pipelines: [{
            Name:        "salesOrder"
            Description: "Get the salesOrder record from ID."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: "context.args.input"
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery salesOrder ($salesOrderID: ID!) {
                    \t\t\t\t\tsalesOrder (id:$salesOrderID) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tquantity
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.salesOrder"
            OperationSource: """
                \t\t\t\tquery salesOrder ($salesOrderID: ID!) {
                \t\t\t\t\tsalesOrder (id:$salesOrderID) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tquantity
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createShipOut"
            Description: "Use the data in the SalesOrder as inputs for creating a new ShipOut record."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"salesOrderID": context.pipeline.salesOrder.id,
                \t"quantity": context.pipeline.salesOrder.quantity,
                \t"shipOutDate": isNull(context.args.input.shipOutDate) ? date(today()) : context.args.input.shipOutDate
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createShipOut ($salesOrderID: ID!, $quantity: Int!, $shipOutDate: Date!) {
                    \t\t\t\t\tcreateShipOut (input: {salesOrderID: $salesOrderID, quantity: $quantity, shipOutDate: $shipOutDate}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createShipOut"
            OperationSource: """
                \t\t\t\tmutation createShipOut ($salesOrderID: ID!, $quantity: Int!, $shipOutDate: Date!) {
                \t\t\t\t\tcreateShipOut (input: {salesOrderID: $salesOrderID, quantity: $quantity, shipOutDate: $shipOutDate}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }]
    }]
}, {
    Kind:      "auth"
    Version:   "v2"
    Namespace: "inventory-tracker"
    TailorDBProviderConfig: {
        Kind:          "TAILORDB"
        Namespace:     "inventory-tracker"
        Type:          "User"
        UsernameField: "email"
        AttributesFields: ["roles"]
    }
    IdProviderConfigs: [{
        Name: "inventory-tracker-auth"
        OidcConfig: {
            Kind:     "OIDC"
            ClientID: "ulIr9rgHeytUQYSRl9j2WvrwPJn9XaXx"
            ClientSecret: {
                VaultName: "default-auth"
                SecretKey: "client-secret"
            }
            ProviderURL: "https://dev-uriukbxe1n5cqxwz.us.auth0.com/"
        }
        Config: {
            Kind:     "OIDC"
            ClientID: "ulIr9rgHeytUQYSRl9j2WvrwPJn9XaXx"
            ClientSecret: {
                VaultName: "default-auth"
                SecretKey: "client-secret"
            }
            ProviderURL: "https://dev-uriukbxe1n5cqxwz.us.auth0.com/"
        }
    }]
    UserProfileProvider: "TAILORDB"
    UserProfileProviderConfig: {
        Kind:          "TAILORDB"
        Namespace:     "inventory-tracker"
        Type:          "User"
        UsernameField: "email"
        AttributesFields: ["roles"]
    }
    SCIMConfig:           null
    TenantProvider:       ""
    TenantProviderConfig: null
    MachineUsers: [{
        Name: "admin-machine-user"
        Attributes: [{
            "2153c0d9-27b9-5958-b79f-de21dec65928"
            #type:  "roles"
            #value: "Admin"
        }]
    }]
}, {
    #eventBasedExecutor: {
        Name: "eventbased-executor"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"PurchaseOrder\""
            }
        }
        TargetTailorGraphql: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\tmutation ($input: createPutAwayWithEventInput!) {
                \t\t\tcreatePutAwayWithEvent(input: $input)
                \t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"input": {
                    \t\t\t\t\t"quantity": args.data.newRecord.quantity,
                    \t\t\t\t\t"purchaseOrderID": args.data.newRecord.id,
                    \t\t\t\t\t"putAwayDate": args.data.newRecord.purchaseOrderDate
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
        Description: "Create a data based on the event"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"PurchaseOrder\""
            }
        }
        Target: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\tmutation ($input: createPutAwayWithEventInput!) {
                \t\t\tcreatePutAwayWithEvent(input: $input)
                \t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"input": {
                    \t\t\t\t\t"quantity": args.data.newRecord.quantity,
                    \t\t\t\t\t"purchaseOrderID": args.data.newRecord.id,
                    \t\t\t\t\t"putAwayDate": args.data.newRecord.purchaseOrderDate
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
    }
    #incomingWebhookBasedExecutor: {
        Name:        "incomingwebhook-executor"
        Description: ""
        TriggerIncomingWebhook: {
            Kind: "IncomingWebhook"
        }
        TargetTailorGraphql: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\t\tmutation createProduct($name: String!) {
                \t\t\t\tcreateProduct(input: { name: $name }) {
                \t\t\t\t\tid
                \t\t\t\t}
                \t\t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"name": args.data.title,
                    \t\t\t})
                    """
            }
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
        }
        Trigger: {
            Kind: "IncomingWebhook"
        }
        Target: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\t\tmutation createProduct($name: String!) {
                \t\t\t\tcreateProduct(input: { name: $name }) {
                \t\t\t\t\tid
                \t\t\t\t}
                \t\t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"name": args.data.title,
                    \t\t\t})
                    """
            }
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
        }
    }
    #scheduledEventBasedExecutor: {
        Name: "scheduled-executor"
        TriggerSchedule: {
            Kind:      "Schedule"
            Timezone:  "UTC"
            Frequency: "0 0 1 * *"
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://sample.api.mockbin.io/\""
            }
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"timestamp": new Date().toISOString()
                    \t\t\t})
                    """
            }
        }
        Description: "description"
        Trigger: {
            Kind:      "Schedule"
            Timezone:  "UTC"
            Frequency: "0 0 1 * *"
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://sample.api.mockbin.io/\""
            }
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"timestamp": new Date().toISOString()
                    \t\t\t})
                    """
            }
        }
    }
    #pushItemToShopify: {
        Name: "push-item-to-shopify"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://{your_store_id}.myshopify.com/admin/api/2024-01/products.json\""
            }
            Headers: [{
                Key: "X-Shopify-Access-Token"
                SecretValue: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
                Value: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"product": {
                    \t\t\t\t\t"title": args.data.newRecord.name
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
        Description: "Push item to Shopify"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://{your_store_id}.myshopify.com/admin/api/2024-01/products.json\""
            }
            Headers: [{
                Key: "X-Shopify-Access-Token"
                SecretValue: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
                Value: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"product": {
                    \t\t\t\t\t"title": args.data.newRecord.name
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
    }
    Kind:    "executor"
    Version: "v2"
    #slackNotification: {
        Name: "slacknotification"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://hooks.slack.com/services/{your_webhook_endpoint}/\""
            }
            Headers: [{
                Key:      "Content-type"
                RawValue: "application/json"
                Value:    "application/json"
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"text": "New Product Registration :tada:",
                    \t\t\t\t"blocks": [
                    \t\t\t\t\t{
                    \t\t\t\t\t\t"type": "section",
                    \t\t\t\t\t\t"text": {
                    \t\t\t\t\t\t\t"type": "mrkdwn",
                    \t\t\t\t\t\t\t"text": "*New Product Registration* :tada: " + args.data.newRecord.name
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t]
                    \t\t\t})
                    """
            }
        }
        Description: "notify slack when new product is created"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://hooks.slack.com/services/{your_webhook_endpoint}/\""
            }
            Headers: [{
                Key:      "Content-type"
                RawValue: "application/json"
                Value:    "application/json"
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"text": "New Product Registration :tada:",
                    \t\t\t\t"blocks": [
                    \t\t\t\t\t{
                    \t\t\t\t\t\t"type": "section",
                    \t\t\t\t\t\t"text": {
                    \t\t\t\t\t\t\t"type": "mrkdwn",
                    \t\t\t\t\t\t\t"text": "*New Product Registration* :tada: " + args.data.newRecord.name
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t]
                    \t\t\t})
                    """
            }
        }
    }
    Executors: [{
        Name: "eventbased-executor"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"PurchaseOrder\""
            }
        }
        TargetTailorGraphql: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\tmutation ($input: createPutAwayWithEventInput!) {
                \t\t\tcreatePutAwayWithEvent(input: $input)
                \t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"input": {
                    \t\t\t\t\t"quantity": args.data.newRecord.quantity,
                    \t\t\t\t\t"purchaseOrderID": args.data.newRecord.id,
                    \t\t\t\t\t"putAwayDate": args.data.newRecord.purchaseOrderDate
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
        Description: "Create a data based on the event"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"PurchaseOrder\""
            }
        }
        Target: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\tmutation ($input: createPutAwayWithEventInput!) {
                \t\t\tcreatePutAwayWithEvent(input: $input)
                \t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"input": {
                    \t\t\t\t\t"quantity": args.data.newRecord.quantity,
                    \t\t\t\t\t"purchaseOrderID": args.data.newRecord.id,
                    \t\t\t\t\t"putAwayDate": args.data.newRecord.purchaseOrderDate
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
    }, {
        Name: "incomingwebhook-executor"
        TriggerIncomingWebhook: {
            Kind: "IncomingWebhook"
        }
        TargetTailorGraphql: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\t\tmutation createProduct($name: String!) {
                \t\t\t\tcreateProduct(input: { name: $name }) {
                \t\t\t\t\tid
                \t\t\t\t}
                \t\t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"name": args.data.title,
                    \t\t\t})
                    """
            }
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
        }
        Description: ""
        Trigger: {
            Kind: "IncomingWebhook"
        }
        Target: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\t\tmutation createProduct($name: String!) {
                \t\t\t\tcreateProduct(input: { name: $name }) {
                \t\t\t\t\tid
                \t\t\t\t}
                \t\t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"name": args.data.title,
                    \t\t\t})
                    """
            }
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
        }
    }, {
        Name: "push-item-to-shopify"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://{your_store_id}.myshopify.com/admin/api/2024-01/products.json\""
            }
            Headers: [{
                Key: "X-Shopify-Access-Token"
                SecretValue: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
                Value: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"product": {
                    \t\t\t\t\t"title": args.data.newRecord.name
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
        Description: "Push item to Shopify"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://{your_store_id}.myshopify.com/admin/api/2024-01/products.json\""
            }
            Headers: [{
                Key: "X-Shopify-Access-Token"
                SecretValue: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
                Value: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"product": {
                    \t\t\t\t\t"title": args.data.newRecord.name
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
    }, {
        Name: "slacknotification"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://hooks.slack.com/services/{your_webhook_endpoint}/\""
            }
            Headers: [{
                Key:      "Content-type"
                RawValue: "application/json"
                Value:    "application/json"
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"text": "New Product Registration :tada:",
                    \t\t\t\t"blocks": [
                    \t\t\t\t\t{
                    \t\t\t\t\t\t"type": "section",
                    \t\t\t\t\t\t"text": {
                    \t\t\t\t\t\t\t"type": "mrkdwn",
                    \t\t\t\t\t\t\t"text": "*New Product Registration* :tada: " + args.data.newRecord.name
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t]
                    \t\t\t})
                    """
            }
        }
        Description: "notify slack when new product is created"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://hooks.slack.com/services/{your_webhook_endpoint}/\""
            }
            Headers: [{
                Key:      "Content-type"
                RawValue: "application/json"
                Value:    "application/json"
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"text": "New Product Registration :tada:",
                    \t\t\t\t"blocks": [
                    \t\t\t\t\t{
                    \t\t\t\t\t\t"type": "section",
                    \t\t\t\t\t\t"text": {
                    \t\t\t\t\t\t\t"type": "mrkdwn",
                    \t\t\t\t\t\t\t"text": "*New Product Registration* :tada: " + args.data.newRecord.name
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t]
                    \t\t\t})
                    """
            }
        }
    }]
}]
Auths: [{
    Kind:      "auth"
    Version:   "v2"
    Namespace: "inventory-tracker"
    TailorDBProviderConfig: {
        Kind:          "TAILORDB"
        Namespace:     "inventory-tracker"
        Type:          "User"
        UsernameField: "email"
        AttributesFields: ["roles"]
    }
    IdProviderConfigs: [{
        Name: "inventory-tracker-auth"
        OidcConfig: {
            Kind:     "OIDC"
            ClientID: "ulIr9rgHeytUQYSRl9j2WvrwPJn9XaXx"
            ClientSecret: {
                VaultName: "default-auth"
                SecretKey: "client-secret"
            }
            ProviderURL: "https://dev-uriukbxe1n5cqxwz.us.auth0.com/"
        }
        Config: {
            Kind:     "OIDC"
            ClientID: "ulIr9rgHeytUQYSRl9j2WvrwPJn9XaXx"
            ClientSecret: {
                VaultName: "default-auth"
                SecretKey: "client-secret"
            }
            ProviderURL: "https://dev-uriukbxe1n5cqxwz.us.auth0.com/"
        }
    }]
    UserProfileProvider: "TAILORDB"
    UserProfileProviderConfig: {
        Kind:          "TAILORDB"
        Namespace:     "inventory-tracker"
        Type:          "User"
        UsernameField: "email"
        AttributesFields: ["roles"]
    }
    SCIMConfig:           null
    TenantProvider:       ""
    TenantProviderConfig: null
    MachineUsers: [{
        Name: "admin-machine-user"
        Attributes: [{
            "2153c0d9-27b9-5958-b79f-de21dec65928"
            #type:  "roles"
            #value: "Admin"
        }]
    }]
}]
Pipelines: [{
    Kind:        "pipeline"
    Version:     "v2"
    Namespace:   "inventory-tracker"
    Description: ""
    Resolvers: [{
        Name: "calculateDemandForecast"
        Description: """
            The purpose of this Pipeline is to refresh DemandForecast table by aggregating the StockEventCalc table to calculate the average demand for each product and location combination, then store the result to DemandForecast.
            This Pipeline follows the following steps:
            1. Get all the DemandForecast records. This old data will be deleted in the last step.
            2. Refresh the StockEventCalc records by running calculateStockEventCalc pipeline.
            3. Aggregate the StockEventCalc records to calculate the average demand time for each product and location.
            4. Create DemandForecast records based on the result of the aggregation.
            5. Delete the DemandForecast records created prior to the the update.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.createDemandForecast.result) || !isNull(context.pipeline.deleteDemandForecast.result)"
        Pipelines: [{
            Name:        "demandForecasts"
            Description: "Get all the DemandForecast records. This old data will be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery demandForecasts {
                    \t\t\t  \t\tdemandForecasts {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t    \t\t}
                    \t\t\t  \t\t} 
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"demandForecasts": args.demandForecasts,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery demandForecasts {
                \t\t\t  \t\tdemandForecasts {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t    \t\t}
                \t\t\t  \t\t} 
                \t\t\t\t}
                """
        }, {
            Name:        "calculateStockEventCalc"
            Description: "Refresh the StockEventCalc records by running calculateStockEventCalc pipeline."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation calculateStockEventCalc{
                    \t\t\t  \t\tcalculateStockEventCalc
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.calculateStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation calculateStockEventCalc{
                \t\t\t  \t\tcalculateStockEventCalc
                \t\t\t\t}
                """
        }, {
            Name:        "aggregateStockEventCalcs"
            Description: "Aggregate the StockEventCalc records to calculate the average demand time for each product and location."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery aggregateStockEventCalcs {
                    \t\t\t\t\taggregateStockEventCalcs(query: {reason: {eq: "Ship Out"}}) {
                    \t\t\t\t\t\tgroupBy {
                    \t\t\t\t\t\tproductID
                    \t\t\t\t\t\tlocationID
                    \t\t\t\t\t\ttoDay {
                    \t\t\t\t\t\t\tsellingStartDate
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\tsum {
                    \t\t\t\t\t\tincrementalQuantity
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"aggregateStockEventCalcs": args.aggregateStockEventCalcs
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery aggregateStockEventCalcs {
                \t\t\t\t\taggregateStockEventCalcs(query: {reason: {eq: "Ship Out"}}) {
                \t\t\t\t\t\tgroupBy {
                \t\t\t\t\t\tproductID
                \t\t\t\t\t\tlocationID
                \t\t\t\t\t\ttoDay {
                \t\t\t\t\t\t\tsellingStartDate
                \t\t\t\t\t\t}
                \t\t\t\t\t\t}
                \t\t\t\t\t\tsum {
                \t\t\t\t\t\tincrementalQuantity
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createDemandForecast"
            Description: "Create DemandForecast records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args.aggregateStockEventCalcs"
            PreScript: """
                \t\t\t{
                \t\t\t\t"input": compact({
                \t\t\t\t\t"productID": each.groupBy.productID,
                \t\t\t\t\t"locationID": each.groupBy.locationID,
                \t\t\t\t\t"sumOfIncrementalQuantity": each.sum.incrementalQuantity,
                \t\t\t\t\t"sellingStartDate": each.groupBy.toDay.sellingStartDate,
                \t\t\t\t})
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($input: DemandForecastCreateInput) {
                    \t\t\t\t\tcreateDemandForecast(input: $input) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createDemandForecast
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($input: DemandForecastCreateInput) {
                \t\t\t\t\tcreateDemandForecast(input: $input) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deleteDemandForecast"
            Description: "delete demandForecasts"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.demandForecasts.demandForecasts.collection"
            Test:    "size(context.pipeline.demandForecasts.demandForecasts.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteDemandForecast($id: ID!) {
                    \t\t\t\t\tdeleteDemandForecast(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteDemandForecast
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteDemandForecast($id: ID!) {
                \t\t\t\t\tdeleteDemandForecast(id: $id)
                \t\t\t\t}
                """
        }]
    }, {
        Name: "calculatePutAwayLeadTime"
        Description: """
            The purpose of this Pipeline is to create a calculation table for PutAway, then aggregate the calculation table to calculate the average lead time for each product, location, supplier combination, then store the result to SupplierLeadTime.
            This Pipeline follows the following steps:
            1. Get all the putAway records. Also in the same query, get all the putAwayCalc records and supplierLeadTime records to be deleted in the last step.
            2. Parse and flatten the putAway records in pre-script. Then store them in putAwayCalc.
            3. Aggregate the putAwayCalc records to calculate the average lead time for each product, location, supplier combination.
            4. Create SupplierLeadTime records based on the result of the aggregation.
            5. Delete the putAwayCalc records and supplierLeadTime records created prior to the step 3 and 4. Those are the result of the step 1.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript: """
            (!isNull(context.pipeline.createPutAwayCalc.result) || !isNull(context.pipeline.deletePutAwayLeadTimeCalc.result))
            &&
            (!isNull(context.pipeline.createSupplierLeadTime.result) || !isNull(context.pipeline.deleteSupplierLeadTime.result))
            """
        Pipelines: [{
            Name:        "getRecords"
            Description: "Get all the putAway records. Also in the same query, get all the putAwayCalc records and supplierLeadTime records to be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery getRecords {
                    \t\t\t\t\tputAways {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t\tquantity
                    \t\t\t\t\t\t\tputAwayDate
                    \t\t\t\t\t\t\tpurchaseOrderID
                    \t\t\t\t\t\t\tpurchaseOrder {
                    \t\t\t\t\t\t\t\tpurchaseOrderDate
                    \t\t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t\t\tsupplierID
                    \t\t\t\t\t\t\t}
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tputAwayCalcs {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tsupplierLeadTimes{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"putAways": args.putAways,
                \t\t\t\t"putAwayCalcs": args.putAwayCalcs,
                \t\t\t\t"supplierLeadTimes": args.supplierLeadTimes,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery getRecords {
                \t\t\t\t\tputAways {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t\tquantity
                \t\t\t\t\t\t\tputAwayDate
                \t\t\t\t\t\t\tpurchaseOrderID
                \t\t\t\t\t\t\tpurchaseOrder {
                \t\t\t\t\t\t\t\tpurchaseOrderDate
                \t\t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t\t\tsupplierID
                \t\t\t\t\t\t\t}
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tputAwayCalcs {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tsupplierLeadTimes{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createPutAwayCalc"
            Description: "Parse and flatten the putAway records in pre-script. Then store them in putAwayCalc."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.putAways.collection"
            PreScript: """
                {
                \t"putAwayID": each.id,
                \t"quantity": each.quantity,
                \t"putAwayDate": each.putAwayDate,
                \t"purchaseOrderID": each.purchaseOrderID,
                \t// flatten nested fields in purchaseOrder
                \t"productID": each.purchaseOrder.productID,
                \t"locationID": each.purchaseOrder.locationID,
                \t"supplierID": each.purchaseOrder.supplierID,
                \t"purchaseOrderDate": each.purchaseOrder.purchaseOrderDate,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation putAwayCalc(
                    \t\t\t\t\t$putAwayID: ID!
                    \t\t\t\t\t$quantity: Int!
                    \t\t\t\t\t$putAwayDate: Date!
                    \t\t\t\t\t$purchaseOrderID: ID!
                    \t\t\t\t\t$productID: ID!
                    \t\t\t\t\t$locationID: ID!
                    \t\t\t\t\t$supplierID: ID!
                    \t\t\t\t\t$purchaseOrderDate: Date!
                    \t\t\t\t) {
                    \t\t\t\tcreatePutAwayCalc: createPutAwayCalc(
                    \t\t\t\t\tinput:{
                    \t\t\t\t\t\tputAwayID:$putAwayID
                    \t\t\t\t\t\tquantity:$quantity
                    \t\t\t\t\t\tputAwayDate:$putAwayDate
                    \t\t\t\t\t\tpurchaseOrderID:$purchaseOrderID
                    \t\t\t\t\t\tproductID:$productID
                    \t\t\t\t\t\tlocationID:$locationID
                    \t\t\t\t\t\tsupplierID:$supplierID
                    \t\t\t\t\t\tpurchaseOrderDate:$purchaseOrderDate
                    \t\t\t\t\t}){
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createPutAwayCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation putAwayCalc(
                \t\t\t\t\t$putAwayID: ID!
                \t\t\t\t\t$quantity: Int!
                \t\t\t\t\t$putAwayDate: Date!
                \t\t\t\t\t$purchaseOrderID: ID!
                \t\t\t\t\t$productID: ID!
                \t\t\t\t\t$locationID: ID!
                \t\t\t\t\t$supplierID: ID!
                \t\t\t\t\t$purchaseOrderDate: Date!
                \t\t\t\t) {
                \t\t\t\tcreatePutAwayCalc: createPutAwayCalc(
                \t\t\t\t\tinput:{
                \t\t\t\t\t\tputAwayID:$putAwayID
                \t\t\t\t\t\tquantity:$quantity
                \t\t\t\t\t\tputAwayDate:$putAwayDate
                \t\t\t\t\t\tpurchaseOrderID:$purchaseOrderID
                \t\t\t\t\t\tproductID:$productID
                \t\t\t\t\t\tlocationID:$locationID
                \t\t\t\t\t\tsupplierID:$supplierID
                \t\t\t\t\t\tpurchaseOrderDate:$purchaseOrderDate
                \t\t\t\t\t}){
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "aggregatePutAwayCalcs"
            Description: "Aggregate the putAwayCalc records to calculate the average lead time for each product, location, supplier combination."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery aggregatPputAwayCalcs\t{
                    \t\t\t\t\taggregatePutAwayCalcs{
                    \t\t\t\t\t\tgroupBy{
                    \t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t\tsupplierID
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\tavg{
                    \t\t\t\t\t\t\tleadTime
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.aggregatePutAwayCalcs
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery aggregatPputAwayCalcs\t{
                \t\t\t\t\taggregatePutAwayCalcs{
                \t\t\t\t\t\tgroupBy{
                \t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t\tsupplierID
                \t\t\t\t\t\t}
                \t\t\t\t\t\tavg{
                \t\t\t\t\t\t\tleadTime
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createSupplierLeadTime"
            Description: "Create SupplierLeadTime records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args.result"
            PreScript: """
                \t\t\t{
                \t\t\t\t"input": {
                \t\t\t\t\t"productID": each.groupBy.productID,
                \t\t\t\t\t"locationID": each.groupBy.locationID,
                \t\t\t\t\t"supplierID": each.groupBy.supplierID,
                \t\t\t\t\t"averageLeadTime": each.avg.leadTime,
                \t\t\t\t}
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($input: SupplierLeadTimeCreateInput) {
                    \t\t\t\t\tcreateSupplierLeadTime(input: $input) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createSupplierLeadTime
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($input: SupplierLeadTimeCreateInput) {
                \t\t\t\t\tcreateSupplierLeadTime(input: $input) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deletePutAwayLeadTimeCalc"
            Description: "Delete the putAwayCalc records created prior to createPutAwayCalc. Those records are the result of the step getRecords.putAwayCalcs."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.putAwayCalcs.collection"
            Test:    "size(context.pipeline.getRecords.putAwayCalcs.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePutAwayCalc($id: ID!) {
                    \t\t\t  \t\tdeletePutAwayCalc(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deletePutAwayCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePutAwayCalc($id: ID!) {
                \t\t\t  \t\tdeletePutAwayCalc(id: $id)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteSupplierLeadTime"
            Description: "Delete the SupplierLeadTime records created prior to createSupplierLeadTime. Those records are the result of the step getRecords.supplierLeadTimes."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.supplierLeadTimes.collection"
            Test:    "size(context.pipeline.getRecords.supplierLeadTimes.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePutAwayLeadTimeCalc($id: ID!) {
                    \t\t\t\t\tdeleteSupplierLeadTime(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteSupplierLeadTime
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePutAwayLeadTimeCalc($id: ID!) {
                \t\t\t\t\tdeleteSupplierLeadTime(id: $id)
                \t\t\t\t}
                """
        }]
    }, {
        Name: "calculateReplenishmentAlert"
        Description: """
            The purpose of this Pipeline is to refresh DemandForecast table by aggregating the StockEventCalc table to calculate the average demand for each product and location combination, then store the result to DemandForecast.
            This Pipeline follows the following steps:
            1. Get all the DemandForecast records. This old data will be deleted in the last step.
            2. Refresh the StockEventCalc records by running calculateStockEventCalc pipeline.
            3. Aggregate the StockEventCalc records to calculate the average demand time for each product and location.
            4. Create DemandForecast records based on the result of the aggregation.
            5. Delete the DemandForecast records created prior to the the update.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.updateReplenishmentAlert.result) || !isNull(context.pipeline.deletereplenishmentAlerts.result)"
        Pipelines: [{
            Name:        "replenishmentAlerts"
            Description: "Get all the stockLevels records. This old data will be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery replenishmentAlerts{
                    \t\t\t\t\treplenishmentAlerts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"replenishmentAlerts": args.replenishmentAlerts,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery replenishmentAlerts{
                \t\t\t\t\treplenishmentAlerts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "aggregateSupplierLeadTimes"
            Description: "Get all the stockLevels records. This old data will be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery aggregateSupplierLeadTimes{
                    \t\t\t\t\taggregateSupplierLeadTimes{
                    \t\t\t\t\t\tmax{
                    \t\t\t\t\t\t\taverageLeadTime
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\tgroupBy{
                    \t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"aggregateSupplierLeadTimes": args.aggregateSupplierLeadTimes,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery aggregateSupplierLeadTimes{
                \t\t\t\t\taggregateSupplierLeadTimes{
                \t\t\t\t\t\tmax{
                \t\t\t\t\t\t\taverageLeadTime
                \t\t\t\t\t\t}
                \t\t\t\t\t\tgroupBy{
                \t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createReplenishmentAlert"
            Description: "Refresh the StockEventCalc records by running calculateStockEventCalc pipeline."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args.aggregateSupplierLeadTimes"
            PreScript: """
                \t\t\t{
                \t\t\t\t"input": {
                \t\t\t\t\t"productID": each.groupBy.productID,
                \t\t\t\t\t"locationID": each.groupBy.locationID,
                \t\t\t\t\t"maxLeadTime": each.max.averageLeadTime,
                \t\t\t\t}
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($input: ReplenishmentAlertCreateInput) {
                    \t\t\t\t\tcreateReplenishmentAlert(input: $input) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tproductID
                    \t\t\t\t\t\tlocationID
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createReplenishmentAlert
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($input: ReplenishmentAlertCreateInput) {
                \t\t\t\t\tcreateReplenishmentAlert(input: $input) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tproductID
                \t\t\t\t\t\tlocationID
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "prepReplenishmentAlertCreateInput"
            Description: "Fetch records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args"
            PreScript: """
                \t\t\t{\t\t\t\t
                \t\t\t\t"productID": each.result.productID,
                \t\t\t\t"locationID": each.result.locationID,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery ($productID: ID, $locationID: ID) {
                    \t\t\t\t\tstockLevels(query: {productID: {eq: $productID}, locationID: {eq: $locationID}}) {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tdaysToStockout
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\treplenishmentAlerts(
                    \t\t\t\t\t\tquery: {productID: {eq: $productID}, locationID: {eq: $locationID}}
                    \t\t\t\t\t) {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": {
                \t\t\t\t\t"daysToStockout": args.stockLevels.collection == [] ? null : args.stockLevels.collection[0].daysToStockout,
                \t\t\t\t\t"id": args.replenishmentAlerts.collection == [] ? null : args.replenishmentAlerts.collection[0].id,
                \t\t\t\t}
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery ($productID: ID, $locationID: ID) {
                \t\t\t\t\tstockLevels(query: {productID: {eq: $productID}, locationID: {eq: $locationID}}) {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tdaysToStockout
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\treplenishmentAlerts(
                \t\t\t\t\t\tquery: {productID: {eq: $productID}, locationID: {eq: $locationID}}
                \t\t\t\t\t) {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "updateReplenishmentAlert"
            Description: "update replenishmentAlert records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args"
            PreScript: """
                \t\t\t{
                \t\t\t\t"id": each.result.id,
                \t\t\t\t"daysToStockout": each.result.daysToStockout,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($id: ID!, $daysToStockout: Float) {
                    \t\t\t\t\tupdateReplenishmentAlert(id: $id, input: {daysToStockout: $daysToStockout}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tdaysToStockout
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.updateReplenishmentAlert
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($id: ID!, $daysToStockout: Float) {
                \t\t\t\t\tupdateReplenishmentAlert(id: $id, input: {daysToStockout: $daysToStockout}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tdaysToStockout
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deletereplenishmentAlerts"
            Description: "delete replenishmentAlerts"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.replenishmentAlerts.replenishmentAlerts.collection"
            Test:    "size(context.pipeline.replenishmentAlerts.replenishmentAlerts.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteReplenishmentAlert($id: ID!) {
                    \t\t\t\t\tdeleteReplenishmentAlert(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteReplenishmentAlert
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteReplenishmentAlert($id: ID!) {
                \t\t\t\t\tdeleteReplenishmentAlert(id: $id)
                \t\t\t\t}
                """
        }]
    }, {
        Name: "calculateStockEventCalc"
        Description: """
            The purpose of this Pipeline is to create a calculation table for StockEvents.
            This Pipeline follows the following steps:
            1. Get all the StockEvent records. Also in the same query, get all the StockEventCalc records to be deleted in the last step.
            2. Parse and flatten the StockEvent records in pre-script. Then store them in StockEventCalc.
            3. Delete the StockEventCalc records created prior to the step 2.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.createStockEventCalc.result) || !isNull(context.pipeline.deleteStockEventCalc.result)"
        Pipelines: [{
            Name:        "getRecords"
            Description: "Get all the StockEvent records. Also in the same query, get all the StockEventCalc records to be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery getRecords {
                    \t\t\t\t\tstockEvents {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t\teventDate
                    \t\t\t\t\t\t\tincrementalQuantity
                    \t\t\t\t\t\t\treason
                    \t\t\t\t\t\t\tlotID
                    \t\t\t\t\t\t\tlot {
                    \t\t\t\t\t\t\t\tputAway {
                    \t\t\t\t\t\t\t\t\tid
                    \t\t\t\t\t\t\t\t\tquantity
                    \t\t\t\t\t\t\t\t\tputAwayDate
                    \t\t\t\t\t\t\t\t\tpurchaseOrderID
                    \t\t\t\t\t\t\t\t\tpurchaseOrder {
                    \t\t\t\t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\t\t\t\tproduct {
                    \t\t\t\t\t\t\t\t\t\t\tsellingStartDate
                    \t\t\t\t\t\t\t\t\t\t}
                    \t\t\t\t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t\t\t\t\tsupplierID
                    \t\t\t\t\t\t\t\t\t}
                    \t\t\t\t\t\t\t\t}
                    \t\t\t\t\t\t\t}
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockEventCalcs{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"stockEvents": args.stockEvents,
                \t\t\t\t"stockEventCalcs": args.stockEventCalcs,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery getRecords {
                \t\t\t\t\tstockEvents {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t\teventDate
                \t\t\t\t\t\t\tincrementalQuantity
                \t\t\t\t\t\t\treason
                \t\t\t\t\t\t\tlotID
                \t\t\t\t\t\t\tlot {
                \t\t\t\t\t\t\t\tputAway {
                \t\t\t\t\t\t\t\t\tid
                \t\t\t\t\t\t\t\t\tquantity
                \t\t\t\t\t\t\t\t\tputAwayDate
                \t\t\t\t\t\t\t\t\tpurchaseOrderID
                \t\t\t\t\t\t\t\t\tpurchaseOrder {
                \t\t\t\t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\t\t\t\tproduct {
                \t\t\t\t\t\t\t\t\t\t\tsellingStartDate
                \t\t\t\t\t\t\t\t\t\t}
                \t\t\t\t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t\t\t\t\tsupplierID
                \t\t\t\t\t\t\t\t\t}
                \t\t\t\t\t\t\t\t}
                \t\t\t\t\t\t\t}
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockEventCalcs{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createStockEventCalc"
            Description: "Parse and flatten the StockEvent records in pre-script. Then store them in StockEventCalc."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockEvents.collection"
            PreScript: """
                \t\t\t{
                \t\t\t\t"stockEventID": each.id,
                \t\t\t\t"purchaseOrderID": each.lot.putAway.purchaseOrderID,
                \t\t\t\t"putAwayID": each.lot.putAway.id,
                \t\t\t\t"productID": each.lot.putAway.purchaseOrder.productID,
                \t\t\t\t"locationID": each.lot.putAway.purchaseOrder.locationID,
                \t\t\t\t"lotID": each.lotID,
                \t\t\t\t"eventDate": each.eventDate,
                \t\t\t\t"sellingStartDate": each.lot.putAway.purchaseOrder.product.sellingStartDate,
                \t\t\t\t"incrementalQuantity": each.incrementalQuantity,
                \t\t\t\t"reason": each.reason,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation (
                    \t\t\t\t$stockEventID: ID!
                    \t\t\t\t$purchaseOrderID: ID!
                    \t\t\t\t$putAwayID: ID!
                    \t\t\t\t$productID: ID!
                    \t\t\t\t$locationID: ID!
                    \t\t\t\t$lotID: ID!
                    \t\t\t\t$eventDate: Date!
                    \t\t\t\t$sellingStartDate: Date!
                    \t\t\t\t$incrementalQuantity: Int!
                    \t\t\t\t$reason: String!
                    \t\t\t\t) {
                    \t\t\t\t\tcreateStockEventCalc(
                    \t\t\t\t\t\tinput: {
                    \t\t\t\t\t\tstockEventID: $stockEventID
                    \t\t\t\t\t\tpurchaseOrderID: $purchaseOrderID
                    \t\t\t\t\t\tputAwayID: $putAwayID
                    \t\t\t\t\t\tproductID: $productID
                    \t\t\t\t\t\tlocationID: $locationID
                    \t\t\t\t\t\tlotID: $lotID
                    \t\t\t\t\t\teventDate: $eventDate
                    \t\t\t\t\t\tsellingStartDate: $sellingStartDate
                    \t\t\t\t\t\tincrementalQuantity: $incrementalQuantity
                    \t\t\t\t\t\treason: $reason
                    \t\t\t\t\t\t}
                    \t\t\t\t\t) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation (
                \t\t\t\t$stockEventID: ID!
                \t\t\t\t$purchaseOrderID: ID!
                \t\t\t\t$putAwayID: ID!
                \t\t\t\t$productID: ID!
                \t\t\t\t$locationID: ID!
                \t\t\t\t$lotID: ID!
                \t\t\t\t$eventDate: Date!
                \t\t\t\t$sellingStartDate: Date!
                \t\t\t\t$incrementalQuantity: Int!
                \t\t\t\t$reason: String!
                \t\t\t\t) {
                \t\t\t\t\tcreateStockEventCalc(
                \t\t\t\t\t\tinput: {
                \t\t\t\t\t\tstockEventID: $stockEventID
                \t\t\t\t\t\tpurchaseOrderID: $purchaseOrderID
                \t\t\t\t\t\tputAwayID: $putAwayID
                \t\t\t\t\t\tproductID: $productID
                \t\t\t\t\t\tlocationID: $locationID
                \t\t\t\t\t\tlotID: $lotID
                \t\t\t\t\t\teventDate: $eventDate
                \t\t\t\t\t\tsellingStartDate: $sellingStartDate
                \t\t\t\t\t\tincrementalQuantity: $incrementalQuantity
                \t\t\t\t\t\treason: $reason
                \t\t\t\t\t\t}
                \t\t\t\t\t) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deleteStockEventCalc"
            Description: "Delete the StockEventCalc records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockEventCalcs.collection"
            Test:    "size(context.pipeline.getRecords.stockEventCalcs.collection) > 0"
            PreScript: """
                {
                \t"stockEventCalcID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockEventCalc($stockEventCalcID: ID!) {
                    \t\t\t\t\tdeleteStockEventCalc(id: $stockEventCalcID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockEventCalc($stockEventCalcID: ID!) {
                \t\t\t\t\tdeleteStockEventCalc(id: $stockEventCalcID)
                \t\t\t\t}
                """
        }]
    }, {
        Name: "calculateStockLevel"
        Description: """
            The purpose of this Pipeline is to refresh DemandForecast table by aggregating the StockEventCalc table to calculate the average demand for each product and location combination, then store the result to DemandForecast.
            This Pipeline follows the following steps:
            1. Get all the DemandForecast records. This old data will be deleted in the last step.
            2. Refresh the StockEventCalc records by running calculateStockEventCalc pipeline.
            3. Aggregate the StockEventCalc records to calculate the average demand time for each product and location.
            4. Create DemandForecast records based on the result of the aggregation.
            5. Delete the DemandForecast records created prior to the the update.
            """
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.updateStockLevel.result) || !isNull(context.pipeline.deletestockLevels.result)"
        Pipelines: [{
            Name:        "stockLevels"
            Description: "Get all the stockLevels records. This old data will be deleted in the last step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery stockLevels{
                    \t\t\t\t\tstockLevels{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"stockLevels": args.stockLevels,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery stockLevels{
                \t\t\t\t\tstockLevels{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "calculateStockEventCalc"
            Description: "Refresh the StockEventCalc records by running calculateStockEventCalc pipeline."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation calculateStockEventCalc{
                    \t\t\t  \t\tcalculateStockEventCalc
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.calculateStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation calculateStockEventCalc{
                \t\t\t  \t\tcalculateStockEventCalc
                \t\t\t\t}
                """
        }, {
            Name:        "aggregateStockEventCalcs"
            Description: "Aggregate the StockEventCalc records to calculate the average demand time for each product and location."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery aggregateStockEventCalcs {
                    \t\t\t\t\taggregateStockEventCalcs {
                    \t\t\t\t\t\tgroupBy {
                    \t\t\t\t\t\t\tproductID
                    \t\t\t\t\t\t\tlocationID
                    \t\t\t\t\t\t}
                    \t\t\t\t\t\tsum {
                    \t\t\t\t\t\t\tincrementalQuantity
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"aggregateStockEventCalcs": args.aggregateStockEventCalcs
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery aggregateStockEventCalcs {
                \t\t\t\t\taggregateStockEventCalcs {
                \t\t\t\t\t\tgroupBy {
                \t\t\t\t\t\t\tproductID
                \t\t\t\t\t\t\tlocationID
                \t\t\t\t\t\t}
                \t\t\t\t\t\tsum {
                \t\t\t\t\t\t\tincrementalQuantity
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createStockLevel"
            Description: "Create createStockLevel records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args.aggregateStockEventCalcs"
            PreScript: """
                \t\t\t{
                \t\t\t\t"input": {
                \t\t\t\t\t"productID": each.groupBy.productID,
                \t\t\t\t\t"locationID": each.groupBy.locationID,
                \t\t\t\t\t"sumOfIncrementalQuantity": each.sum.incrementalQuantity,
                \t\t\t\t}
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($input: StockLevelCreateInput) {
                    \t\t\t\t\tcreateStockLevel(input: $input) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tproductID
                    \t\t\t\t\t\tlocationID
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.createStockLevel
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($input: StockLevelCreateInput) {
                \t\t\t\t\tcreateStockLevel(input: $input) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tproductID
                \t\t\t\t\t\tlocationID
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "prepStockLevelCreateInput"
            Description: "Fetch DemandForecast records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args"
            PreScript: """
                \t\t\t{\t\t\t\t
                \t\t\t\t"productID": each.result.productID,
                \t\t\t\t"locationID": each.result.locationID,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery demandForecasts($productID: ID, $locationID: ID) {
                    \t\t\t\t\tdemandForecasts(
                    \t\t\t\t\t\tquery: {productID: {eq: $productID}, locationID: {eq: $locationID}}
                    \t\t\t\t\t) {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tdailyDemand
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockLevels(query: {productID: {eq: $productID}, locationID: {eq: $locationID}}) {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": {
                \t\t\t\t\t"dailyDemand": args.demandForecasts.collection == [] ? null : args.demandForecasts.collection[0].dailyDemand,
                \t\t\t\t\t"id": args.stockLevels.collection == [] ? null : args.stockLevels.collection[0].id,
                \t\t\t\t}
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery demandForecasts($productID: ID, $locationID: ID) {
                \t\t\t\t\tdemandForecasts(
                \t\t\t\t\t\tquery: {productID: {eq: $productID}, locationID: {eq: $locationID}}
                \t\t\t\t\t) {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tdailyDemand
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockLevels(query: {productID: {eq: $productID}, locationID: {eq: $locationID}}) {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "updateStockLevel"
            Description: "update createStockLevel records based on the result of the aggregation."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "args"
            PreScript: """
                \t\t\t{
                \t\t\t\t"id": each.result.id,
                \t\t\t\t"dailyDemand": each.result.dailyDemand,
                \t\t\t}
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation ($id: ID!, $dailyDemand: Float) {
                    \t\t\t\t\tupdateStockLevel(id: $id, input: {dailyDemand: $dailyDemand}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.updateStockLevel
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation ($id: ID!, $dailyDemand: Float) {
                \t\t\t\t\tupdateStockLevel(id: $id, input: {dailyDemand: $dailyDemand}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deletestockLevels"
            Description: "delete stockLevels"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.stockLevels.stockLevels.collection"
            Test:    "size(context.pipeline.stockLevels.stockLevels.collection) > 0"
            PreScript: """
                {
                \t"id": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockLevels($id: ID!) {
                    \t\t\t  \t\tdeleteStockLevel(id: $id)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockLevel
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockLevels($id: ID!) {
                \t\t\t  \t\tdeleteStockLevel(id: $id)
                \t\t\t\t}
                """
        }]
    }, {
        Name:        "deleteAllRecords"
        Description: "DANGER: Delete all the records in the database. This is a test resolver for development purpose only."
        Inputs: []
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "Boolean"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "!isNull(context.pipeline.getRecords)"
        Pipelines: [{
            Name:        "getRecords"
            Description: "Get all the records from all the tailordb models."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery getRecords {
                    \t\t\t\t\tlocations{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tproducts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tsuppliers{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tpurchaseOrders{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tputAways{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tlots{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tsalesOrders{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tshipOuts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockEvents {
                    \t\t\t\t\t\tcollection {
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockEventCalcs{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tstockLevels{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tsupplierLeadTimes{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tputAwayCalcs{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\tdemandForecasts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t\treplenishmentAlerts{
                    \t\t\t\t\t\tcollection{
                    \t\t\t\t\t\t\tid
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"locations": args.locations,
                \t\t\t\t"products": args.products,
                \t\t\t\t"suppliers": args.suppliers,
                \t\t\t\t"purchaseOrders": args.purchaseOrders,
                \t\t\t\t"putAways": args.putAways,
                \t\t\t\t"lots": args.lots,
                \t\t\t\t"salesOrders": args.salesOrders,
                \t\t\t\t"shipOuts": args.shipOuts,
                \t\t\t\t"stockEvents": args.stockEvents,
                \t\t\t\t"stockEventCalcs": args.stockEventCalcs,
                \t\t\t\t"stockLevels": args.stockLevels,
                \t\t\t\t"supplierLeadTimes": args.supplierLeadTimes,
                \t\t\t\t"putAwayCalcs": args.putAwayCalcs,
                \t\t\t\t"demandForecasts": args.demandForecasts,
                \t\t\t\t"replenishmentAlerts": args.replenishmentAlerts,
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tquery getRecords {
                \t\t\t\t\tlocations{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tproducts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tsuppliers{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tpurchaseOrders{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tputAways{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tlots{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tsalesOrders{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tshipOuts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockEvents {
                \t\t\t\t\t\tcollection {
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockEventCalcs{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tstockLevels{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tsupplierLeadTimes{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tputAwayCalcs{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\tdemandForecasts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t\treplenishmentAlerts{
                \t\t\t\t\t\tcollection{
                \t\t\t\t\t\t\tid
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "deleteLocation"
            Description: "Delete the Location records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.locations.collection"
            Test:    "size(context.pipeline.getRecords.locations.collection) > 0"
            PreScript: """
                {
                \t"locationID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteLocation($locationID: ID!) {
                    \t\t\t  \t\tdeleteLocation(id: $locationID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteLocation
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteLocation($locationID: ID!) {
                \t\t\t  \t\tdeleteLocation(id: $locationID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteProduct"
            Description: "Delete the Product records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.products.collection"
            Test:    "size(context.pipeline.getRecords.products.collection) > 0"
            PreScript: """
                {
                \t"productID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteProduct($productID: ID!) {
                    \t\t\t  \t\tdeleteProduct(id: $productID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteProduct
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteProduct($productID: ID!) {
                \t\t\t  \t\tdeleteProduct(id: $productID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteSupplier"
            Description: "Delete the Supplier records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.suppliers.collection"
            Test:    "size(context.pipeline.getRecords.suppliers.collection) > 0"
            PreScript: """
                {
                \t"supplierID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteSupplier($supplierID: ID!) {
                    \t\t\t  \t\tdeleteSupplier(id: $supplierID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteSupplier
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteSupplier($supplierID: ID!) {
                \t\t\t  \t\tdeleteSupplier(id: $supplierID)
                \t\t\t\t}
                """
        }, {
            Name:        "deletePurchaseOrder"
            Description: "Delete the PurchaseOrder records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.purchaseOrders.collection"
            Test:    "size(context.pipeline.getRecords.purchaseOrders.collection) > 0"
            PreScript: """
                {
                \t"purchaseOrderID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePurchaseOrder($purchaseOrderID: ID!) {
                    \t\t\t  \t\tdeletePurchaseOrder(id: $purchaseOrderID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deletePurchaseOrder
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePurchaseOrder($purchaseOrderID: ID!) {
                \t\t\t  \t\tdeletePurchaseOrder(id: $purchaseOrderID)
                \t\t\t\t}
                """
        }, {
            Name:        "deletePutAway"
            Description: "Delete the PutAway records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.putAways.collection"
            Test:    "size(context.pipeline.getRecords.putAways.collection) > 0"
            PreScript: """
                {
                \t"putAwayID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePutAway($putAwayID: ID!) {
                    \t\t\t  \t\tdeletePutAway(id: $putAwayID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deletePutAway
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePutAway($putAwayID: ID!) {
                \t\t\t  \t\tdeletePutAway(id: $putAwayID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteLot"
            Description: "Delete the Lot records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.lots.collection"
            Test:    "size(context.pipeline.getRecords.lots.collection) > 0"
            PreScript: """
                {
                \t"lotID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteLot($lotID: ID!) {
                    \t\t\t  \t\tdeleteLot(id: $lotID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteLot
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteLot($lotID: ID!) {
                \t\t\t  \t\tdeleteLot(id: $lotID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteSalesOrder"
            Description: "Delete the SalesOrder records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.salesOrders.collection"
            Test:    "size(context.pipeline.getRecords.salesOrders.collection) > 0"
            PreScript: """
                {
                \t"salesOrderID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteSalesOrder($salesOrderID: ID!) {
                    \t\t\t  \t\tdeleteSalesOrder(id: $salesOrderID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteSalesOrder
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteSalesOrder($salesOrderID: ID!) {
                \t\t\t  \t\tdeleteSalesOrder(id: $salesOrderID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteShipOut"
            Description: "Delete the ShipOut records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.shipOuts.collection"
            Test:    "size(context.pipeline.getRecords.shipOuts.collection) > 0"
            PreScript: """
                {
                \t"shipOutID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteShipOut($shipOutID: ID!) {
                    \t\t\t  \t\tdeleteShipOut(id: $shipOutID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteShipOut
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteShipOut($shipOutID: ID!) {
                \t\t\t  \t\tdeleteShipOut(id: $shipOutID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteStockEvent"
            Description: "Delete the StockEvent records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockEvents.collection"
            Test:    "size(context.pipeline.getRecords.stockEvents.collection) > 0"
            PreScript: """
                {
                \t"stockEventID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockEvent($stockEventID: ID!) {
                    \t\t\t  \t\tdeleteStockEvent(id: $stockEventID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockEvent
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockEvent($stockEventID: ID!) {
                \t\t\t  \t\tdeleteStockEvent(id: $stockEventID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteStockEventCalc"
            Description: "Delete the StockEventCalc records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockEventCalcs.collection"
            Test:    "size(context.pipeline.getRecords.stockEventCalcs.collection) > 0"
            PreScript: """
                {
                \t"stockEventCalcID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockEventCalc($stockEventCalcID: ID!) {
                    \t\t\t  \t\tdeleteStockEventCalc(id: $stockEventCalcID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockEventCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockEventCalc($stockEventCalcID: ID!) {
                \t\t\t  \t\tdeleteStockEventCalc(id: $stockEventCalcID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteStockLevel"
            Description: "Delete the StockLevel records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.stockLevels.collection"
            Test:    "size(context.pipeline.getRecords.stockLevels.collection) > 0"
            PreScript: """
                {
                \t"stockLevelID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteStockLevel($stockLevelID: ID!) {
                    \t\t\t  \t\tdeleteStockLevel(id: $stockLevelID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteStockLevel
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteStockLevel($stockLevelID: ID!) {
                \t\t\t  \t\tdeleteStockLevel(id: $stockLevelID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteSupplierLeadTime"
            Description: "Delete the SupplierLeadTime records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.supplierLeadTimes.collection"
            Test:    "size(context.pipeline.getRecords.supplierLeadTimes.collection) > 0"
            PreScript: """
                {
                \t"supplierLeadTimeID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteSupplierLeadTime($supplierLeadTimeID: ID!) {
                    \t\t\t  \t\tdeleteSupplierLeadTime(id: $supplierLeadTimeID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteSupplierLeadTime
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteSupplierLeadTime($supplierLeadTimeID: ID!) {
                \t\t\t  \t\tdeleteSupplierLeadTime(id: $supplierLeadTimeID)
                \t\t\t\t}
                """
        }, {
            Name:        "deletePutAwayCalc"
            Description: "Delete the PutAwayCalc records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.putAwayCalcs.collection"
            Test:    "size(context.pipeline.getRecords.putAwayCalcs.collection) > 0"
            PreScript: """
                {
                \t"putAwayCalcID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deletePutAwayCalc($putAwayCalcID: ID!) {
                    \t\t\t  \t\tdeletePutAwayCalc(id: $putAwayCalcID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deletePutAwayCalc
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deletePutAwayCalc($putAwayCalcID: ID!) {
                \t\t\t  \t\tdeletePutAwayCalc(id: $putAwayCalcID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteDemandForecast"
            Description: "Delete the DemandForecast records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.demandForecasts.collection"
            Test:    "size(context.pipeline.getRecords.demandForecasts.collection) > 0"
            PreScript: """
                {
                \t"demandForecastID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteDemandForecast($demandForecastID: ID!) {
                    \t\t\t  \t\tdeleteDemandForecast(id: $demandForecastID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteDemandForecast
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteDemandForecast($demandForecastID: ID!) {
                \t\t\t  \t\tdeleteDemandForecast(id: $demandForecastID)
                \t\t\t\t}
                """
        }, {
            Name:        "deleteReplenishmentAlert"
            Description: "Delete the ReplenishmentAlert records created prior to the step 2"
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            ForEach: "context.pipeline.getRecords.replenishmentAlerts.collection"
            Test:    "size(context.pipeline.getRecords.replenishmentAlerts.collection) > 0"
            PreScript: """
                {
                \t"replenishmentAlertID": each.id,
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation deleteReplenishmentAlert($replenishmentAlertID: ID!) {
                    \t\t\t  \t\tdeleteReplenishmentAlert(id: $replenishmentAlertID)
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript: """
                \t\t\t{
                \t\t\t\t"result": args.deleteReplenishmentAlert
                \t\t\t}
                """
            OperationSource: """
                \t\t\t\tmutation deleteReplenishmentAlert($replenishmentAlertID: ID!) {
                \t\t\t  \t\tdeleteReplenishmentAlert(id: $replenishmentAlertID)
                \t\t\t\t}
                """
        }]
    }, {
        Name:        "createPutAwayWithEvent"
        Description: "This API is an alternative to createPutAway. It creates a PutAway record and then creates a corresponding StockEvent record. Use this API if you want to create a PutAway record and a StockEvent record in one API call."
        Inputs: [{
            Name:        "input"
            Description: ""
            Required:    true
            Type: {
                Kind:        "UserDefined"
                Name:        "createPutAwayWithEventInput"
                Description: ""
                Required:    false
                Fields: [{
                    Name:        "id"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: false
                }, {
                    Name:        "quantity"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "Int"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "purchaseOrderID"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "putAwayDate"
                    Description: ""
                    Type: {
                        Kind:        "CustomScalarType"
                        Name:        "Date"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "lotID"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: false
                }]
            }
            Array: false
        }]
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "ID"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "context.pipeline.createPutAway.id"
        Pipelines: [{
            Name:        "createPutAway"
            Description: "Create a new PutAway record."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: "context.args.input"
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createPutAway ($id: ID, $purchaseOrderID: ID!, $quantity: Int!, $putAwayDate: Date!){
                    \t\t\t\t\tcreatePutAway (input: {id: $id, purchaseOrderID: $purchaseOrderID, quantity: $quantity, putAwayDate: $putAwayDate}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createPutAway"
            OperationSource: """
                \t\t\t\tmutation createPutAway ($id: ID, $purchaseOrderID: ID!, $quantity: Int!, $putAwayDate: Date!){
                \t\t\t\t\tcreatePutAway (input: {id: $id, purchaseOrderID: $purchaseOrderID, quantity: $quantity, putAwayDate: $putAwayDate}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createLot"
            Description: "Create a new Lot record with the PutAway id created in the previous step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"putAwayID": context.pipeline.createPutAway.id,
                \t"id": get(context.args.input.lotID)
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createLot ($putAwayID: ID!, $id: ID){
                    \t\t\t\t\tcreateLot (input: {putAwayID: $putAwayID, id: $id}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createLot"
            OperationSource: """
                \t\t\t\tmutation createLot ($putAwayID: ID!, $id: ID){
                \t\t\t\t\tcreateLot (input: {putAwayID: $putAwayID, id: $id}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createStockEvent"
            Description: "Create a new StockEvent record with the Lot id created in the previous step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"lotID": context.pipeline.createLot.id,
                \t"incrementalQuantity": context.args.input.quantity,
                \t"putAwayDate": context.args.input.putAwayDate
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createStockEvent ($lotID: ID!, $incrementalQuantity: Int!, $putAwayDate: Date!) {
                    \t\t\t\t\tcreateStockEvent (input: {lotID: $lotID, incrementalQuantity: $incrementalQuantity, eventDate: $putAwayDate, reason: "Put Away"}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createStockEvent"
            OperationSource: """
                \t\t\t\tmutation createStockEvent ($lotID: ID!, $incrementalQuantity: Int!, $putAwayDate: Date!) {
                \t\t\t\t\tcreateStockEvent (input: {lotID: $lotID, incrementalQuantity: $incrementalQuantity, eventDate: $putAwayDate, reason: "Put Away"}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }]
    }, {
        Name:        "createShipOutWithEvent"
        Description: "This API is an alternative to createShipOut. It creates a ShipOut record and then creates a corresponding StockEvent record. Use this API if you want to create a ShipOut record and a StockEvent record in one API call."
        Inputs: [{
            Name:        "input"
            Description: ""
            Required:    true
            Type: {
                Kind:        "UserDefined"
                Name:        "createShipOutWithEventInput"
                Description: ""
                Required:    false
                Fields: [{
                    Name:        "quantity"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "Int"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "salesOrderID"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "shipOutDate"
                    Description: ""
                    Type: {
                        Kind:        "CustomScalarType"
                        Name:        "Date"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }]
            }
            Array: false
        }]
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "ID"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "context.pipeline.createShipOut.id"
        Pipelines: [{
            Name:        "createShipOut"
            Description: "Create a new ShipOut record."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: "context.args.input"
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createShipOut ($salesOrderID: ID!, $quantity: Int!, $shipOutDate: Date!){
                    \t\t\t\t\tcreateShipOut (input: {salesOrderID: $salesOrderID, quantity: $quantity, shipOutDate: $shipOutDate}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tsalesOrder{
                    \t\t\t\t\t\t\tlotID
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createShipOut"
            OperationSource: """
                \t\t\t\tmutation createShipOut ($salesOrderID: ID!, $quantity: Int!, $shipOutDate: Date!){
                \t\t\t\t\tcreateShipOut (input: {salesOrderID: $salesOrderID, quantity: $quantity, shipOutDate: $shipOutDate}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tsalesOrder{
                \t\t\t\t\t\t\tlotID
                \t\t\t\t\t\t}
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createStockEvent"
            Description: "Create a new StockEvent record with the ShipOut id created in the previous step."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"lotID": context.pipeline.createShipOut.salesOrder.lotID,
                \t"incrementalQuantity": -context.args.input.quantity,
                \t"shipOutDate": context.args.input.shipOutDate
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createStockEvent ($lotID: ID!, $incrementalQuantity: Int!, $shipOutDate: Date!) {
                    \t\t\t\t\tcreateStockEvent (input: {lotID: $lotID, incrementalQuantity: $incrementalQuantity, eventDate: $shipOutDate, reason: "Ship Out"}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createStockEvent"
            OperationSource: """
                \t\t\t\tmutation createStockEvent ($lotID: ID!, $incrementalQuantity: Int!, $shipOutDate: Date!) {
                \t\t\t\t\tcreateStockEvent (input: {lotID: $lotID, incrementalQuantity: $incrementalQuantity, eventDate: $shipOutDate, reason: "Ship Out"}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }]
    }, {
        Name: "createPutAwayFromPurchaseOrder"
        Description: """
            The purpose of this Pipeline is to create a single click solution to create a Put Away record from a Purchase Order record.
            This Pipeline follows the following steps:
            1. Get the PurchaseOrder record from ID.
            2. Use the data in the PurchaseOrder as inputs for creating a new PutAway record.
            """
        Inputs: [{
            Name:        "input"
            Description: ""
            Required:    true
            Type: {
                Kind:        "UserDefined"
                Name:        "createPutAwayFromPurchaseOrderInput"
                Description: ""
                Required:    false
                Fields: [{
                    Name:        "purchaseOrderID"
                    Description: ""
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: true
                }, {
                    Name:        "putAwayDate"
                    Description: ""
                    Type: {
                        Kind:        "CustomScalarType"
                        Name:        "Date"
                        Description: ""
                        Required:    false
                    }
                    Array:    false
                    Required: false
                }]
            }
            Array: false
        }]
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "ID"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        Authorization: "true==true"
        PostScript:    "context.pipeline.createPutAway.id"
        Pipelines: [{
            Name:        "purchaseOrder"
            Description: "Get the PurchaseOrder record from ID."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: "context.args.input"
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery purchaseOrder ($purchaseOrderID: ID!) {
                    \t\t\t\t\tpurchaseOrder (id:$purchaseOrderID) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tquantity
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.purchaseOrder"
            OperationSource: """
                \t\t\t\tquery purchaseOrder ($purchaseOrderID: ID!) {
                \t\t\t\t\tpurchaseOrder (id:$purchaseOrderID) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tquantity
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createPutAway"
            Description: "Use the data in the PurchaseOrder as inputs for creating a new PutAway record."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"purchaseOrderID": context.pipeline.purchaseOrder.id,
                \t"quantity": context.pipeline.purchaseOrder.quantity,
                \t"putAwayDate": isNull(context.args.input.putAwayDate) ? date(today()) : context.args.input.putAwayDate
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createPutAway ($purchaseOrderID: ID!, $quantity: Int!, $putAwayDate: Date!) {
                    \t\t\t\t\tcreatePutAway (input: {purchaseOrderID: $purchaseOrderID, quantity: $quantity, putAwayDate: $putAwayDate}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createPutAway"
            OperationSource: """
                \t\t\t\tmutation createPutAway ($purchaseOrderID: ID!, $quantity: Int!, $putAwayDate: Date!) {
                \t\t\t\t\tcreatePutAway (input: {purchaseOrderID: $purchaseOrderID, quantity: $quantity, putAwayDate: $putAwayDate}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }]
    }, {
        Name: "createShipOutFromSalesOrder"
        Description: """
            The purpose of this Pipeline is to create a single click solution to create a Ship Our record from a Sales Order record.
            This Pipeline follows the following steps:
            1. Get the SalesOrder record from ID.
            2. Use the data in the SalesOrder as inputs for creating a new ShipOut record.
            """
        Inputs: [{
            Name:        "input"
            Description: ""
            Required:    true
            Type: {
                Kind:        "UserDefined"
                Name:        "createShipOutFromSalesOrderInput"
                Description: ""
                Required:    false
                Fields: [{
                    Name: "salesOrderID"
                    Type: {
                        Kind:        "ScalarType"
                        Name:        "ID"
                        Description: ""
                        Required:    false
                    }
                    Required:    true
                    Description: "Sales order ID"
                    Array:       false
                }, {
                    Name: "shipOutDate"
                    Type: {
                        Kind:        "CustomScalarType"
                        Name:        "Date"
                        Description: ""
                        Required:    false
                    }
                    Required:    false
                    Description: "Shipping Date"
                    Array:       false
                }]
            }
            Array: false
        }]
        Response: {
            Type: {
                Kind:        "ScalarType"
                Name:        "ID"
                Description: ""
                Required:    false
            }
            Description: ""
            Array:       false
            Required:    false
        }
        OperationType: "mutation"
        Authorization: "true==true"
        PostScript:    "context.pipeline.createShipOut.id"
        Pipelines: [{
            Name:        "salesOrder"
            Description: "Get the salesOrder record from ID."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: "context.args.input"
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tquery salesOrder ($salesOrderID: ID!) {
                    \t\t\t\t\tsalesOrder (id:$salesOrderID) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t\tquantity
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.salesOrder"
            OperationSource: """
                \t\t\t\tquery salesOrder ($salesOrderID: ID!) {
                \t\t\t\t\tsalesOrder (id:$salesOrderID) {
                \t\t\t\t\t\tid
                \t\t\t\t\t\tquantity
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }, {
            Name:        "createShipOut"
            Description: "Use the data in the SalesOrder as inputs for creating a new ShipOut record."
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
            PreScript: """
                {
                \t"salesOrderID": context.pipeline.salesOrder.id,
                \t"quantity": context.pipeline.salesOrder.quantity,
                \t"shipOutDate": isNull(context.args.input.shipOutDate) ? date(today()) : context.args.input.shipOutDate
                }
                """
            Operation: {
                Kind: "graphql"
                Url:  null
                Query: """
                    \t\t\t\tmutation createShipOut ($salesOrderID: ID!, $quantity: Int!, $shipOutDate: Date!) {
                    \t\t\t\t\tcreateShipOut (input: {salesOrderID: $salesOrderID, quantity: $quantity, shipOutDate: $shipOutDate}) {
                    \t\t\t\t\t\tid
                    \t\t\t\t\t}
                    \t\t\t\t}
                    """
            }
            OperationType:        1
            SkipOperationOnError: false
            OperationUrl:         null
            PostScript:           "args.createShipOut"
            OperationSource: """
                \t\t\t\tmutation createShipOut ($salesOrderID: ID!, $quantity: Int!, $shipOutDate: Date!) {
                \t\t\t\t\tcreateShipOut (input: {salesOrderID: $salesOrderID, quantity: $quantity, shipOutDate: $shipOutDate}) {
                \t\t\t\t\t\tid
                \t\t\t\t\t}
                \t\t\t\t}
                """
        }]
    }]
}]
Executors: [{
    #eventBasedExecutor: {
        Name: "eventbased-executor"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"PurchaseOrder\""
            }
        }
        TargetTailorGraphql: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\tmutation ($input: createPutAwayWithEventInput!) {
                \t\t\tcreatePutAwayWithEvent(input: $input)
                \t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"input": {
                    \t\t\t\t\t"quantity": args.data.newRecord.quantity,
                    \t\t\t\t\t"purchaseOrderID": args.data.newRecord.id,
                    \t\t\t\t\t"putAwayDate": args.data.newRecord.purchaseOrderDate
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
        Description: "Create a data based on the event"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"PurchaseOrder\""
            }
        }
        Target: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\tmutation ($input: createPutAwayWithEventInput!) {
                \t\t\tcreatePutAwayWithEvent(input: $input)
                \t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"input": {
                    \t\t\t\t\t"quantity": args.data.newRecord.quantity,
                    \t\t\t\t\t"purchaseOrderID": args.data.newRecord.id,
                    \t\t\t\t\t"putAwayDate": args.data.newRecord.purchaseOrderDate
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
    }
    #incomingWebhookBasedExecutor: {
        Name:        "incomingwebhook-executor"
        Description: ""
        TriggerIncomingWebhook: {
            Kind: "IncomingWebhook"
        }
        TargetTailorGraphql: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\t\tmutation createProduct($name: String!) {
                \t\t\t\tcreateProduct(input: { name: $name }) {
                \t\t\t\t\tid
                \t\t\t\t}
                \t\t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"name": args.data.title,
                    \t\t\t})
                    """
            }
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
        }
        Trigger: {
            Kind: "IncomingWebhook"
        }
        Target: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\t\tmutation createProduct($name: String!) {
                \t\t\t\tcreateProduct(input: { name: $name }) {
                \t\t\t\t\tid
                \t\t\t\t}
                \t\t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"name": args.data.title,
                    \t\t\t})
                    """
            }
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
        }
    }
    #scheduledEventBasedExecutor: {
        Name: "scheduled-executor"
        TriggerSchedule: {
            Kind:      "Schedule"
            Timezone:  "UTC"
            Frequency: "0 0 1 * *"
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://sample.api.mockbin.io/\""
            }
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"timestamp": new Date().toISOString()
                    \t\t\t})
                    """
            }
        }
        Description: "description"
        Trigger: {
            Kind:      "Schedule"
            Timezone:  "UTC"
            Frequency: "0 0 1 * *"
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://sample.api.mockbin.io/\""
            }
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"timestamp": new Date().toISOString()
                    \t\t\t})
                    """
            }
        }
    }
    #pushItemToShopify: {
        Name: "push-item-to-shopify"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://{your_store_id}.myshopify.com/admin/api/2024-01/products.json\""
            }
            Headers: [{
                Key: "X-Shopify-Access-Token"
                SecretValue: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
                Value: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"product": {
                    \t\t\t\t\t"title": args.data.newRecord.name
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
        Description: "Push item to Shopify"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://{your_store_id}.myshopify.com/admin/api/2024-01/products.json\""
            }
            Headers: [{
                Key: "X-Shopify-Access-Token"
                SecretValue: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
                Value: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"product": {
                    \t\t\t\t\t"title": args.data.newRecord.name
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
    }
    Kind:    "executor"
    Version: "v2"
    #slackNotification: {
        Name: "slacknotification"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://hooks.slack.com/services/{your_webhook_endpoint}/\""
            }
            Headers: [{
                Key:      "Content-type"
                RawValue: "application/json"
                Value:    "application/json"
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"text": "New Product Registration :tada:",
                    \t\t\t\t"blocks": [
                    \t\t\t\t\t{
                    \t\t\t\t\t\t"type": "section",
                    \t\t\t\t\t\t"text": {
                    \t\t\t\t\t\t\t"type": "mrkdwn",
                    \t\t\t\t\t\t\t"text": "*New Product Registration* :tada: " + args.data.newRecord.name
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t]
                    \t\t\t})
                    """
            }
        }
        Description: "notify slack when new product is created"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://hooks.slack.com/services/{your_webhook_endpoint}/\""
            }
            Headers: [{
                Key:      "Content-type"
                RawValue: "application/json"
                Value:    "application/json"
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"text": "New Product Registration :tada:",
                    \t\t\t\t"blocks": [
                    \t\t\t\t\t{
                    \t\t\t\t\t\t"type": "section",
                    \t\t\t\t\t\t"text": {
                    \t\t\t\t\t\t\t"type": "mrkdwn",
                    \t\t\t\t\t\t\t"text": "*New Product Registration* :tada: " + args.data.newRecord.name
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t]
                    \t\t\t})
                    """
            }
        }
    }
    Executors: [{
        Name: "eventbased-executor"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"PurchaseOrder\""
            }
        }
        TargetTailorGraphql: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\tmutation ($input: createPutAwayWithEventInput!) {
                \t\t\tcreatePutAwayWithEvent(input: $input)
                \t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"input": {
                    \t\t\t\t\t"quantity": args.data.newRecord.quantity,
                    \t\t\t\t\t"purchaseOrderID": args.data.newRecord.id,
                    \t\t\t\t\t"putAwayDate": args.data.newRecord.purchaseOrderDate
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
        Description: "Create a data based on the event"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"PurchaseOrder\""
            }
        }
        Target: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\tmutation ($input: createPutAwayWithEventInput!) {
                \t\t\tcreatePutAwayWithEvent(input: $input)
                \t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"input": {
                    \t\t\t\t\t"quantity": args.data.newRecord.quantity,
                    \t\t\t\t\t"purchaseOrderID": args.data.newRecord.id,
                    \t\t\t\t\t"putAwayDate": args.data.newRecord.purchaseOrderDate
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
    }, {
        Name: "incomingwebhook-executor"
        TriggerIncomingWebhook: {
            Kind: "IncomingWebhook"
        }
        TargetTailorGraphql: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\t\tmutation createProduct($name: String!) {
                \t\t\t\tcreateProduct(input: { name: $name }) {
                \t\t\t\t\tid
                \t\t\t\t}
                \t\t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"name": args.data.title,
                    \t\t\t})
                    """
            }
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
        }
        Description: ""
        Trigger: {
            Kind: "IncomingWebhook"
        }
        Target: {
            Kind:    "TailorGraphql"
            AppName: "inventory-tracker"
            Query: """
                \t\t\tmutation createProduct($name: String!) {
                \t\t\t\tcreateProduct(input: { name: $name }) {
                \t\t\t\t\tid
                \t\t\t\t}
                \t\t\t}
                """
            Variables: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"name": args.data.title,
                    \t\t\t})
                    """
            }
            Invoker: {
                AuthNamespace:   "inventory-tracker"
                MachineUserName: "admin-machine-user"
            }
        }
    }, {
        Name: "push-item-to-shopify"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://{your_store_id}.myshopify.com/admin/api/2024-01/products.json\""
            }
            Headers: [{
                Key: "X-Shopify-Access-Token"
                SecretValue: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
                Value: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"product": {
                    \t\t\t\t\t"title": args.data.newRecord.name
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
        Description: "Push item to Shopify"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://{your_store_id}.myshopify.com/admin/api/2024-01/products.json\""
            }
            Headers: [{
                Key: "X-Shopify-Access-Token"
                SecretValue: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
                Value: {
                    VaultName: "vault"
                    SecretKey: "token"
                }
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"product": {
                    \t\t\t\t\t"title": args.data.newRecord.name
                    \t\t\t\t}
                    \t\t\t})
                    """
            }
        }
    }, {
        Name: "slacknotification"
        TriggerEvent: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        TargetWebhook: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://hooks.slack.com/services/{your_webhook_endpoint}/\""
            }
            Headers: [{
                Key:      "Content-type"
                RawValue: "application/json"
                Value:    "application/json"
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"text": "New Product Registration :tada:",
                    \t\t\t\t"blocks": [
                    \t\t\t\t\t{
                    \t\t\t\t\t\t"type": "section",
                    \t\t\t\t\t\t"text": {
                    \t\t\t\t\t\t\t"type": "mrkdwn",
                    \t\t\t\t\t\t\t"text": "*New Product Registration* :tada: " + args.data.newRecord.name
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t]
                    \t\t\t})
                    """
            }
        }
        Description: "notify slack when new product is created"
        Trigger: {
            Kind:      "Event"
            EventType: "tailordb.type_record.created"
            Condition: {
                Runtime: "javascript"
                Expr:    "args.NamespaceName == \"inventory-tracker\" && args.TypeName == \"Product\""
            }
        }
        Target: {
            Kind: "Webhook"
            URL: {
                Runtime: "javascript"
                Expr:    "\"https://hooks.slack.com/services/{your_webhook_endpoint}/\""
            }
            Headers: [{
                Key:      "Content-type"
                RawValue: "application/json"
                Value:    "application/json"
            }]
            Body: {
                Runtime: "javascript"
                Expr: """
                    \t\t\t({
                    \t\t\t\t"text": "New Product Registration :tada:",
                    \t\t\t\t"blocks": [
                    \t\t\t\t\t{
                    \t\t\t\t\t\t"type": "section",
                    \t\t\t\t\t\t"text": {
                    \t\t\t\t\t\t\t"type": "mrkdwn",
                    \t\t\t\t\t\t\t"text": "*New Product Registration* :tada: " + args.data.newRecord.name
                    \t\t\t\t\t\t}
                    \t\t\t\t\t}
                    \t\t\t\t]
                    \t\t\t})
                    """
            }
        }
    }]
}]
Stateflows: []
Tailordbs: [{
    Kind:      "tailordb"
    Version:   "v2"
    Namespace: "inventory-tracker"
    Types: [{
        Name:        "User"
        Description: "User of the system"
        Fields: {
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the user"
                Validate: []
                Index:      true
                Required:   true
                Array:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            email: {
                Type: "string"
                AllowedValues: []
                Description: "Email of the user"
                Validate: []
                Index:      true
                Unique:     true
                Required:   true
                Array:      false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            roles: {
                Type: "uuid"
                AllowedValues: []
                Description: "Role IDs of the user"
                Validate: []
                Required:   false
                Array:      true
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
        }
    }, {
        Name:        "Role"
        Description: "ロールマスタ"
        Fields: {
            name: {
                Type: "string"
                AllowedValues: []
                Description: "ロール名"
                Validate: []
                Index:      true
                Required:   true
                Array:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }]
        }
    }, {
        Name:        "Location"
        Description: "Location is where the inventories are stored. A location can be a warehouse or a storefront."
        Fields: {
            code: {
                Type: "integer"
                AllowedValues: []
                Description: "Location code. Location is where the inventories are stored. A location can be a warehouse or a storefront."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the location."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            address: {
                Type: "string"
                AllowedValues: []
                Description: "Physical address of the location."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            type: {
                Type: "string"
                AllowedValues: []
                Description: "Type of the location. It can be either 'warehouse' or 'storefront'."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            contactNumber: {
                Type: "string"
                AllowedValues: []
                Description: "Contact number of the location."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "Product"
        Description: "Product model"
        Fields: {
            code: {
                Type: "integer"
                AllowedValues: []
                Description: "Product code."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the product."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            description: {
                Type: "string"
                AllowedValues: []
                Description: "Description of the product."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            price: {
                Type: "float"
                AllowedValues: []
                Description: "Price of the product."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            uom: {
                Type: "string"
                AllowedValues: []
                Description: "Unit of measure of the product."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sellingStartDate: {
                Type: "date"
                AllowedValues: []
                Description: "The date this product starts selling. This field is used to calculate the sales velocity used for demand forecasting."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   true
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "Supplier"
        Description: "Supplier Model"
        Fields: {
            code: {
                Type: "integer"
                AllowedValues: []
                Description: "Supplier code."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the supplier."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            address: {
                Type: "string"
                AllowedValues: []
                Description: "Physical address of the supplier."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            email: {
                Type: "string"
                AllowedValues: []
                Description: "Email address of the supplier."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdByRole: {
                Type: "string"
                AllowedValues: []
                Description: "User ID of the logged in user"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "  user.id"
                    UpdateExpr: "  user.id"
                    Create:     null
                    Update:     null
                }
            }
            contactNumber: {
                Type: "string"
                AllowedValues: []
                Description: "Contact number of the supplier."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "UserData"
        Description: "User Data Model"
        Fields: {
            name: {
                Type: "string"
                AllowedValues: []
                Description: "Name of the user."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            "UserDataList"
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "Lot"
        Description: "Model for Lot. Lot is used for trasability. Lot takes PutAway as a foreign key. With this application, each Lot has one PutAway. This can be customized based on the requirement."
        Fields: {
            putAway: {
                Type: "PutAway"
                AllowedValues: []
                Description: "PutAway model. Lot and PutAway is 1:1."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "putAwayID"
            }
            putAwayID: {
                Type: "uuid"
                AllowedValues: []
                Description: "putAway ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           false
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "PurchaseOrder"
        Description: "Model for Purchase Order. Each record of the Purchase Order represents unique combination of a Product, a Location, and a Supplier. Customization is required to wrap multiple records (line items) into one purchase order."
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product. This field constitutes a unique key with location"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location. This field constitutes a unique key with product"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            supplier: {
                Type: "Supplier"
                AllowedValues: []
                Description: "Supplier. This field constitutes a unique key with product"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "supplierID"
            }
            supplierID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Supplier ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Order quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            purchaseOrderDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of purchase order"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   true
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "PutAway"
        Description: "Model for Put Away. Putting away means receiving and storing goods to a location. This model takes PurchaseOrder as a foreign key. Each PurchaseOrder can have multiple PutAway."
        Fields: {
            purchaseOrder: {
                Type: "PurchaseOrder"
                AllowedValues: []
                Description: "PurchaseOrder. Each PutAway requires one PurchaseOrder. Each PurchaseOrder can have multiple PutAway in case the order is received as multiple shipping."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "purchaseOrderID"
            }
            purchaseOrderID: {
                Type: "uuid"
                AllowedValues: []
                Description: "purchaseOrder ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Put away quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            putAwayDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of put away"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            true
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "SalesOrder"
        Description: "Model for Sales Order. Each record of the Sales Order should specify a lot. Customization is required to wrap multiple records (line items) into one purchase order."
        Fields: {
            lot: {
                Type: "Lot"
                AllowedValues: []
                Description: "Lot. Each record of the Sales Order should specify a lot for tracability purpose."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "lotID"
            }
            lotID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Lot ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Order quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            salesOrderDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of sales order"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            customerName: {
                Type: "string"
                AllowedValues: []
                Description: "Customer name"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            deliveryAddress: {
                Type: "string"
                AllowedValues: []
                Description: "Delivery address of the customer"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "ShipOut"
        Description: "Model for Ship Out. Shipping out means the goods leaving the location to a customer to fulfill the sales order. This model takes SalesOrder as a foreign key. Each SalesOrder can have multiple ShipOut."
        Fields: {
            salesOrder: {
                Type: "SalesOrder"
                AllowedValues: []
                Description: "SalesOrder. Each ShipOut requires one SalesOrder. Each SalesOrder can have multiple ShipOut in case the order is delivered in multiple shippings."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "salesOrderID"
            }
            salesOrderID: {
                Type: "uuid"
                AllowedValues: []
                Description: "salesOrder ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Ship out quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            shipOutDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of ship out"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "StockEvent"
        Description: "StockEvent model"
        Fields: {
            lot: {
                Type: "Lot"
                AllowedValues: []
                Description: "Lot is the minimum unit to manage inventory here. Any stock movements has to specify a Lot for the tracability purpose"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "lotID"
            }
            lotID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Lot ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            eventDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of the event"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            incrementalQuantity: {
                Type: "integer"
                AllowedValues: []
                Description: "delta of quantity. This value will be negative value if the event reduces inventory quantities"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            reason: {
                Type: "string"
                AllowedValues: []
                Description: "The reason for the stock event, such as putaway, shipout, return, adjuestment, etc."
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "DemandForecast"
        Description: "Demand forecast"
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sumOfIncrementalQuantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Sum of incremental quantity."
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sellingStartDate: {
                Type: "date"
                AllowedValues: []
                Description: "The date this product starts selling. This field is used to calculate the sales velocity used for demand forecasting."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            today: {
                Type: "date"
                AllowedValues: []
                Description: "The date of the calculation"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "date(today())"
                    UpdateExpr: "date(today())"
                    Create:     null
                    Update:     null
                }
            }
            dailyDemand: {
                Type: "float"
                AllowedValues: []
                Description: "Daily demand."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "decimal(_value.sumOfIncrementalQuantity) / decimal((date(today()) - date(_value.sellingStartDate)).getHours()/24)"
                    UpdateExpr: "decimal(_value.sumOfIncrementalQuantity) / decimal((date(today()) - date(_value.sellingStartDate)).getHours()/24)"
                    Create:     null
                    Update:     null
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "PutAwayCalc"
        Description: "Model for Put Away. Putting away means receiving and storing goods to a location. This model takes PurchaseOrder as a foreign key. Each PurchaseOrder can have multiple PutAway."
        Fields: {
            purchaseOrder: {
                Type: "PurchaseOrder"
                AllowedValues: []
                Description: "PurchaseOrder. Each PutAway requires one PurchaseOrder. Each PurchaseOrder can have multiple PutAway in case the order is received as multiple shipping."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "purchaseOrderID"
            }
            purchaseOrderID: {
                Type: "uuid"
                AllowedValues: []
                Description: "purchaseOrder ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            putAwayID: {
                Type: "uuid"
                AllowedValues: []
                Description: "PutAway ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            supplierID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Supplier ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            quantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Put away quantity"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            putAwayDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of put away"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            purchaseOrderDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of order"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            leadTime: {
                Type: "integer"
                AllowedValues: []
                Description: "Date of lead time"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "(date(_value.putAwayDate) - date(_value.purchaseOrderDate)).getHours()/24"
                    UpdateExpr: "(date(_value.putAwayDate) - date(_value.purchaseOrderDate)).getHours()/24"
                    Create:     null
                    Update:     null
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "ReplenishmentAlert"
        Description: "Replenishment alert"
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            daysToStockout: {
                Type: "float"
                AllowedValues: []
                Description: "Days to stockout."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            maxLeadTime: {
                Type: "float"
                AllowedValues: []
                Description: "Max lead time."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            expectedDaysForNextOrder: {
                Type: "float"
                AllowedValues: []
                Description: "Expected days for next order."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "ifThen (_value.daysToStockout != null, _value.daysToStockout + _value.maxLeadTime)"
                    UpdateExpr: "ifThen (_value.daysToStockout != null, _value.daysToStockout + _value.maxLeadTime)"
                    Create:     null
                    Update:     null
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "StockEventCalc"
        Description: "Intermediate calculating table of StockEvent. Flattens Lot, PutAway, PurchaseOrder, Product, Location, and StockEvent."
        Fields: {
            lot: {
                Type: "Lot"
                AllowedValues: []
                Description: "Lot is the minimum unit to manage inventory here. Any stock movements has to specify a Lot for the tracability purpose"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "lotID"
            }
            lotID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Lot ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            eventDate: {
                Type: "date"
                AllowedValues: []
                Description: "Date of the event"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            incrementalQuantity: {
                Type: "integer"
                AllowedValues: []
                Description: "delta of quantity. This value will be negative value if the event reduces inventory quantities"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            reason: {
                Type: "string"
                AllowedValues: []
                Description: "The reason for the stock event, such as putaway, shipout, return, adjuestment, etc."
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            stockEventID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Stock event ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            putAwayID: {
                Type: "uuid"
                AllowedValues: []
                Description: "PutAway ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            purchaseOrderID: {
                Type: "uuid"
                AllowedValues: []
                Description: "PurchaseOrder ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sellingStartDate: {
                Type: "date"
                AllowedValues: []
                Description: "Selling start date. Attribute of Product"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "StockLevel"
        Description: "Stock level"
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            sumOfIncrementalQuantity: {
                Type: "integer"
                AllowedValues: []
                Description: "Sum of incremental quantity."
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            dailyDemand: {
                Type: "float"
                AllowedValues: []
                Description: "Daily demand."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            daysToStockout: {
                Type: "float"
                AllowedValues: []
                Description: "Days to stock out."
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "decimal(_value.sumOfIncrementalQuantity) / decimal(_value.dailyDemand)"
                    UpdateExpr: "decimal(_value.sumOfIncrementalQuantity) / decimal(_value.dailyDemand)"
                    Create:     null
                    Update:     null
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }, {
        Name:        "SupplierLeadTime"
        Description: "Supplier lead time"
        Fields: {
            product: {
                Type: "Product"
                AllowedValues: []
                Description: "Product model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "productID"
            }
            productID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Product ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            location: {
                Type: "Location"
                AllowedValues: []
                Description: "Location model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "locationID"
            }
            locationID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Location ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            supplier: {
                Type: "Supplier"
                AllowedValues: []
                Description: "Supplier model"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                SourceId: "supplierID"
            }
            supplierID: {
                Type: "uuid"
                AllowedValues: []
                Description: "Supplier ID"
                Validate: []
                Required:   true
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            averageLeadTime: {
                Type: "float"
                AllowedValues: []
                Description: "Lead time"
                Validate: []
                Required:   false
                Array:      false
                Index:      false
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
            }
            createdAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "createdAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: "now()"
                    UpdateExpr: null
                    Create:     null
                    Update:     null
                }
            }
            updatedAt: {
                Type: "datetime"
                AllowedValues: []
                Description: "updatedAt"
                Validate: []
                Required:   false
                Array:      false
                Index:      true
                Unique:     false
                ForeignKey: false
                #Value: {
                    Value:       string
                    Description: string
                }
                Hooks: {
                    CreateExpr: null
                    UpdateExpr: "now()"
                    Create:     null
                    Update:     null
                }
            }
        }
        Settings: {
            Aggregation:           true
            BulkUpsert:            false
            Draft:                 false
            DefaultQueryLimitSize: 100
            MaxBulkUpsertSize:     1000
            PluralForm:            ""
            PublishRecordEvents:   false
        }
        Extends: false
        Directives: []
        Indexes: {}
        TypePermission: {
            Create: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Read: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }, {
                Id: {
                    "ff2ab186-206f-51bc-939d-7fa3d32d2827"
                    #type:  "roles"
                    #value: "Viewer"
                }
                Permit: "allow"
            }]
            Update: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Delete: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "allow"
            }]
            Admin: [{
                Id: {
                    "2153c0d9-27b9-5958-b79f-de21dec65928"
                    #type:  "roles"
                    #value: "Admin"
                }
                Permit: "allow"
            }, {
                Id: {
                    "5f936f72-4680-519b-ade2-8ca6d1af7d00"
                    #type:  "roles"
                    #value: "Editor"
                }
                Permit: "deny"
            }]
        }
    }]
}]
