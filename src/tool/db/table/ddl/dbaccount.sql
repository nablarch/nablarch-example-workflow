--- workflow sample application init
DROP USER workflow_sample CASCADE
;
DROP USER workflow_sample_test CASCADE
;
DROP USER workflow_sample_test_master CASCADE
;
--- workflow sample application user
CREATE USER workflow_sample
      IDENTIFIED BY workflow_sample
             DEFAULT tablespace USERS
            TEMPORARY tablespace TEMP
;
CREATE USER workflow_sample_test
      IDENTIFIED BY workflow_sample_test
             DEFAULT tablespace USERS
            TEMPORARY tablespace TEMP
;
CREATE USER workflow_sample_test_master
      IDENTIFIED BY workflow_sample_test_master
             DEFAULT tablespace USERS
            TEMPORARY tablespace TEMP
;
GRANT DBA TO workflow_sample,workflow_sample_test,workflow_sample_test_master
;
