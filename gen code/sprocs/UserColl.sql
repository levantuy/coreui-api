/****** Object:  StoredProcedure [dbo].[UserColl_Get] ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserColl_Get]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[UserColl_Get]
GO

CREATE PROCEDURE [dbo].[UserColl_Get]
AS
    BEGIN

        SET NOCOUNT ON

        /* Get UserInfo from table */
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

    END
GO

