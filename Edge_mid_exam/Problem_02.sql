-- 2. Create a PROFILE named Combine where PASSWORDLIFETIME will be 10 days, 
-- PASSWORDGRACETIME will be 8 days, PASSWORD REUSE MAX will be 3, PASSWORDLOCKTIME will for 1 day, 
-- FAILEDLOGIN ATTEMPTS for 2 times, PASSWORDREUSETIME 10 day. Prove each profile by appropriate comment execution. 
-- Submit the consequent execution comment in text file. Also show the comment for showing your created profile.

CREATE PROFILE Combine 
LIMIT
    PASSWORD_LIFE_TIME 10
    PASSWORD_GRACE_TIME 8
    PASSWORD_REUSE_MAX 3
    PASSWORD_LOCK_TIME 1
    FAILED_LOGIN_ATTEMPTS 2
    PASSWORD_REUSE_TIME 10;


SELECT * FROM DBA_PROFILES WHERE PROFILE = 'Combine';