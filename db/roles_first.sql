INSERT INTO dbo.adm_features_groups
(
    name,
    last_modified,
    last_user_id
)
VALUES
(   N'Quản trị',       -- name - nvarchar(256)
    GETDATE(), -- last_modified - datetime
    1          -- last_user_id - bigint
    )
GO 
INSERT INTO dbo.adm_features
(
    name,
    feature_group_id,
    last_modified,
    last_user_id
)
VALUES
(   N'Người dùng',       -- name - nvarchar(256)
    1,         -- feature_group_id - bigint
    GETDATE(), -- last_modified - datetime
    1          -- last_user_id - bigint
    )
GO 
INSERT INTO dbo.adm_roles
(
    name,
    feature_id,
    last_modified,
    last_user_id
)
VALUES
(   N'Xem danh sách người dùng',       -- name - nvarchar(50)
    1,         -- feature_id - bigint
    GETDATE(), -- last_modified - datetime
    1          -- last_user_id - bigint
    )
GO 
INSERT INTO dbo.adm_users_roles
(
    user_id,
    role_id,
    last_modified,
    last_user_id
)
VALUES
(   1,         -- user_id - bigint
    1,         -- role_id - bigint
    GETDATE(), -- last_modified - datetime
    1          -- last_user_id - bigint
    )