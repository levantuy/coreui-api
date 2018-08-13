/****** Object:  StoredProcedure [dbo].[User_Get] ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Get]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[User_Get]
GO

CREATE PROCEDURE [dbo].[User_Get]
    @id bigint
AS
    BEGIN

        SET NOCOUNT ON

        /* Get User from table */
        SELECT
            [adm_users].[id],
            [adm_users].[user_name],
            [adm_users].[password],
            [adm_users].[password_salt],
            [adm_users].[password_question],
            [adm_users].[password_answer],
            [adm_users].[is_approved],
            [adm_users].[fullname],
            [adm_users].[email],
            [adm_users].[tel],
            [adm_users].[last_login_date],
            [adm_users].[last_password_changed_date],
            [adm_users].[last_lockout_date],
            [adm_users].[failed_password_attempt_count],
            [adm_users].[failed_password_attempt_window_start],
            [adm_users].[failed_password_answer_attempt_count],
            [adm_users].[failed_password_answer_attempt_window_start],
            [adm_users].[birthday],
            [adm_users].[address],
            [adm_users].[website],
            [adm_users].[avatar],
            [adm_users].[is_lock],
            [adm_users].[user_type],
            [adm_users].[last_modified],
            [adm_users].[last_user_id]
        FROM [dbo].[adm_users]
        WHERE
            [adm_users].[id] = @id

    END
GO

/****** Object:  StoredProcedure [dbo].[User_Add] ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Add]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[User_Add]
GO

CREATE PROCEDURE [dbo].[User_Add]
    @id bigint OUTPUT,
    @user_name nvarchar(256),
    @password nvarchar(128),
    @password_salt nvarchar(128),
    @password_question nvarchar(256),
    @password_answer nvarchar(128),
    @is_approved bit,
    @fullname nvarchar(250),
    @email nvarchar(50),
    @tel nvarchar(50),
    @last_login_date datetime,
    @last_password_changed_date datetime,
    @last_lockout_date datetime,
    @failed_password_attempt_count bigint,
    @failed_password_attempt_window_start datetime,
    @failed_password_answer_attempt_count bigint,
    @failed_password_answer_attempt_window_start datetime,
    @birthday datetime,
    @address nvarchar(250),
    @website nvarchar(50),
    @avatar nvarchar(250),
    @is_lock bit,
    @user_type bigint,
    @last_modified datetime,
    @last_user_id bigint
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.adm_users */
        INSERT INTO [dbo].[adm_users]
        (
            [user_name],
            [password],
            [password_salt],
            [password_question],
            [password_answer],
            [is_approved],
            [fullname],
            [email],
            [tel],
            [last_login_date],
            [last_password_changed_date],
            [last_lockout_date],
            [failed_password_attempt_count],
            [failed_password_attempt_window_start],
            [failed_password_answer_attempt_count],
            [failed_password_answer_attempt_window_start],
            [birthday],
            [address],
            [website],
            [avatar],
            [is_lock],
            [user_type],
            [last_modified],
            [last_user_id]
        )
        VALUES
        (
            @user_name,
            @password,
            @password_salt,
            @password_question,
            @password_answer,
            @is_approved,
            @fullname,
            @email,
            @tel,
            @last_login_date,
            @last_password_changed_date,
            @last_lockout_date,
            @failed_password_attempt_count,
            @failed_password_attempt_window_start,
            @failed_password_answer_attempt_count,
            @failed_password_answer_attempt_window_start,
            @birthday,
            @address,
            @website,
            @avatar,
            @is_lock,
            @user_type,
            @last_modified,
            @last_user_id
        )

        /* Return new primary key */
        SET @id = SCOPE_IDENTITY()

    END
GO

/****** Object:  StoredProcedure [dbo].[User_Upd] ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Upd]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[User_Upd]
GO

CREATE PROCEDURE [dbo].[User_Upd]
    @id bigint,
    @user_name nvarchar(256),
    @password nvarchar(128),
    @password_salt nvarchar(128),
    @password_question nvarchar(256),
    @password_answer nvarchar(128),
    @is_approved bit,
    @fullname nvarchar(250),
    @email nvarchar(50),
    @tel nvarchar(50),
    @last_login_date datetime,
    @last_password_changed_date datetime,
    @last_lockout_date datetime,
    @failed_password_attempt_count bigint,
    @failed_password_attempt_window_start datetime,
    @failed_password_answer_attempt_count bigint,
    @failed_password_answer_attempt_window_start datetime,
    @birthday datetime,
    @address nvarchar(250),
    @website nvarchar(50),
    @avatar nvarchar(250),
    @is_lock bit,
    @user_type bigint,
    @last_modified datetime,
    @last_user_id bigint
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existance */
        IF NOT EXISTS
        (
            SELECT [id] FROM [dbo].[adm_users]
            WHERE
                [id] = @id
        )
        BEGIN
            RAISERROR ('''dbo.User'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.adm_users */
        UPDATE [dbo].[adm_users]
        SET
            [user_name] = @user_name,
            [password] = @password,
            [password_salt] = @password_salt,
            [password_question] = @password_question,
            [password_answer] = @password_answer,
            [is_approved] = @is_approved,
            [fullname] = @fullname,
            [email] = @email,
            [tel] = @tel,
            [last_login_date] = @last_login_date,
            [last_password_changed_date] = @last_password_changed_date,
            [last_lockout_date] = @last_lockout_date,
            [failed_password_attempt_count] = @failed_password_attempt_count,
            [failed_password_attempt_window_start] = @failed_password_attempt_window_start,
            [failed_password_answer_attempt_count] = @failed_password_answer_attempt_count,
            [failed_password_answer_attempt_window_start] = @failed_password_answer_attempt_window_start,
            [birthday] = @birthday,
            [address] = @address,
            [website] = @website,
            [avatar] = @avatar,
            [is_lock] = @is_lock,
            [user_type] = @user_type,
            [last_modified] = @last_modified,
            [last_user_id] = @last_user_id
        WHERE
            [id] = @id

    END
GO

/****** Object:  StoredProcedure [dbo].[User_Delete] ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Delete]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[User_Delete]
GO

CREATE PROCEDURE [dbo].[User_Delete]
    @id bigint
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existance */
        IF NOT EXISTS
        (
            SELECT [id] FROM [dbo].[adm_users]
            WHERE
                [id] = @id
        )
        BEGIN
            RAISERROR ('''dbo.User'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Delete User object from adm_users */
        DELETE
        FROM [dbo].[adm_users]
        WHERE
            [dbo].[adm_users].[id] = @id

    END
GO
