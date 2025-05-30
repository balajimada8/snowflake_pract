create database git_hub_db;
use database git_hub_db;

CREATE OR REPLACE SECRET git_secret_example
  TYPE = password
  USERNAME = 'balajimada8'
  PASSWORD = 'ghp_';

  show secrets;

CREATE OR REPLACE API INTEGRATION git_api_integration_example
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/balajimada8/')
  ALLOWED_AUTHENTICATION_SECRETS = (git_secret_example)
  ENABLED = TRUE;

  show api integrations;
  show integrations;

  create or replace git repository my_git_repository
    api_integration = git_api_integration_example
    git_credentials = git_secret_example
    origin = 'https://github.com/balajimada8/snowflake_pract/';

show git repositories;
