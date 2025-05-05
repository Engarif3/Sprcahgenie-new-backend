--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: UserRole; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."UserRole" AS ENUM (
    'SUPER_ADMIN',
    'ADMIN',
    'BASIC_USER'
);


ALTER TYPE public."UserRole" OWNER TO postgres;

--
-- Name: UserStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."UserStatus" AS ENUM (
    'ACTIVE',
    'BLOCKED',
    'DELETED',
    'PENDING'
);


ALTER TYPE public."UserStatus" OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF EXISTS (
      SELECT 1
      FROM pg_event_trigger_ddl_commands() AS ev
      JOIN pg_extension AS ext
      ON ev.objid = ext.oid
      WHERE ext.extname = 'pg_net'
    )
    THEN
      IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'supabase_functions_admin'
      )
      THEN
        CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
      END IF;

      GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

      IF EXISTS (
        SELECT FROM pg_extension
        WHERE extname = 'pg_net'
        -- all versions in use on existing projects as of 2025-02-20
        -- version 0.12.0 onwards don't need these applied
        AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8.0', '0.10.0', '0.11.0')
      ) THEN
        ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
        ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

        ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
        ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

        REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
        REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

        GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
        GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      END IF;
    END IF;
  END;
  $$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: Conversation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Conversation" (
    id integer NOT NULL,
    topic text NOT NULL,
    text jsonb NOT NULL,
    "levelId" integer NOT NULL
);


ALTER TABLE public."Conversation" OWNER TO postgres;

--
-- Name: Conversation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Conversation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Conversation_id_seq" OWNER TO postgres;

--
-- Name: Conversation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Conversation_id_seq" OWNED BY public."Conversation".id;


--
-- Name: _AntonymRelation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_AntonymRelation" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_AntonymRelation" OWNER TO postgres;

--
-- Name: _SimilarWordRelation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_SimilarWordRelation" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_SimilarWordRelation" OWNER TO postgres;

--
-- Name: _SynonymRelation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_SynonymRelation" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_SynonymRelation" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    "profilePhoto" text,
    "contactNumber" text NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: basic_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basic_users (
    id text NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    "profilePhoto" text,
    "contactNumber" text,
    address text,
    "isDeleted" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.basic_users OWNER TO postgres;

--
-- Name: favorite_words; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite_words (
    "userId" text NOT NULL,
    "wordId" integer NOT NULL
);


ALTER TABLE public.favorite_words OWNER TO postgres;

--
-- Name: levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.levels (
    id integer NOT NULL,
    level text NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE public.levels OWNER TO postgres;

--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.levels_id_seq OWNER TO postgres;

--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.levels_id_seq OWNED BY public.levels.id;


--
-- Name: parts_of_speech; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parts_of_speech (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.parts_of_speech OWNER TO postgres;

--
-- Name: parts_of_speech_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parts_of_speech_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parts_of_speech_id_seq OWNER TO postgres;

--
-- Name: parts_of_speech_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parts_of_speech_id_seq OWNED BY public.parts_of_speech.id;


--
-- Name: prefix_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prefix_types (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.prefix_types OWNER TO postgres;

--
-- Name: prefix_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prefix_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prefix_types_id_seq OWNER TO postgres;

--
-- Name: prefix_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prefix_types_id_seq OWNED BY public.prefix_types.id;


--
-- Name: prefixes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prefixes (
    id integer NOT NULL,
    "prefixName" text NOT NULL,
    meaning text[],
    sentences text[],
    "prefixTypeId" integer NOT NULL,
    "prefixWord" text NOT NULL,
    verb boolean NOT NULL
);


ALTER TABLE public.prefixes OWNER TO postgres;

--
-- Name: prefixes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prefixes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prefixes_id_seq OWNER TO postgres;

--
-- Name: prefixes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prefixes_id_seq OWNED BY public.prefixes.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.topics OWNER TO postgres;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topics_id_seq OWNER TO postgres;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    name text,
    role public."UserRole" NOT NULL,
    "needPasswordChange" boolean DEFAULT true NOT NULL,
    status public."UserStatus" DEFAULT 'ACTIVE'::public."UserStatus" NOT NULL,
    "verificationToken" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: words_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.words_table (
    id integer NOT NULL,
    value text NOT NULL,
    meaning text[],
    sentences text[],
    "levelId" integer,
    "topicId" integer,
    "articleId" integer,
    "partOfSpeechId" integer,
    "pluralForm" text
);


ALTER TABLE public.words_table OWNER TO postgres;

--
-- Name: words_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.words_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.words_table_id_seq OWNER TO postgres;

--
-- Name: words_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.words_table_id_seq OWNED BY public.words_table.id;


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER VIEW vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: Conversation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conversation" ALTER COLUMN id SET DEFAULT nextval('public."Conversation_id_seq"'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels ALTER COLUMN id SET DEFAULT nextval('public.levels_id_seq'::regclass);


--
-- Name: parts_of_speech id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts_of_speech ALTER COLUMN id SET DEFAULT nextval('public.parts_of_speech_id_seq'::regclass);


--
-- Name: prefix_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prefix_types ALTER COLUMN id SET DEFAULT nextval('public.prefix_types_id_seq'::regclass);


--
-- Name: prefixes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prefixes ALTER COLUMN id SET DEFAULT nextval('public.prefixes_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: words_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words_table ALTER COLUMN id SET DEFAULT nextval('public.words_table_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: Conversation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Conversation" (id, topic, text, "levelId") FROM stdin;
28	Gesunde Ernährung	[{"message": "Hallo zusammen! Ich habe neulich über gesunde Ernährung nachgedacht. Was denkt ihr, wie wichtig ist es, sich gesund zu ernähren?", "speaker": "Eva"}, {"message": "Hallo Eva! Ich finde es sehr wichtig, sich gesund zu ernähren. Es beeinflusst nicht nur unsere körperliche Gesundheit, sondern auch unsere Energie und Stimmung.", "speaker": "Markus"}, {"message": "Ja, das stimmt, Markus. Aber es ist manchmal schwer, sich gesund zu ernähren, besonders wenn man wenig Zeit hat oder viel arbeitet. Oft greift man dann zu schnellen, ungesunden Mahlzeiten.", "speaker": "Laura"}, {"message": "Das ist ein Problem, Laura. Aber ich denke, wenn man sich im Voraus plant, kann man auch im stressigen Alltag gesunde Mahlzeiten zubereiten. Zum Beispiel kann man am Wochenende Mahlzeiten vorkochen.", "speaker": "Eva"}, {"message": "Gute Idee, Eva! Ich habe auch angefangen, meine Mahlzeiten vorzubereiten. Das spart Zeit und hilft mir, mich gesünder zu ernähren.", "speaker": "Markus"}, {"message": "Ich versuche, mehr Obst und Gemüse in meine Ernährung zu integrieren. Es ist nicht nur gesund, sondern auch lecker und vielseitig.", "speaker": "Laura"}, {"message": "Ich stimme dir zu, Laura. Aber ich finde es manchmal schwierig, genug Gemüse zu essen, vor allem, wenn es nicht in vielen Gerichten vorkommt. Ich muss kreativer sein!", "speaker": "Markus"}, {"message": "Ja, man muss neue Rezepte ausprobieren. Zum Beispiel kann man Gemüse in Smoothies oder Suppen integrieren. So bekommt man viele Nährstoffe.", "speaker": "Eva"}, {"message": "Stimmt! Und was haltet ihr von vegetarischer oder veganer Ernährung? Ich habe überlegt, es auszuprobieren, aber es scheint mir schwierig zu sein, genug Eiweiß zu bekommen.", "speaker": "Laura"}, {"message": "Ich finde vegetarisch oder vegan eine gute Wahl, wenn man es richtig macht. Man muss sich nur gut informieren und auf eine ausgewogene Ernährung achten. Es gibt viele pflanzliche Eiweißquellen.", "speaker": "Markus"}, {"message": "Ich stimme dir zu, Markus. Es gibt viele leckere Rezepte, die auch ohne Fleisch gesund sind. Ich denke, es ist wichtig, sich Zeit zu nehmen und auf den eigenen Körper zu hören.", "speaker": "Eva"}, {"message": "Es ist wirklich eine Frage der Balance. Wenn man sich ausgewogen ernährt, fühlt man sich besser und hat mehr Energie.", "speaker": "Laura"}, {"message": "Ich denke, wir sind uns alle einig: Eine gesunde Ernährung ist wichtig und jeder sollte versuchen, für sich selbst das Beste zu tun.", "speaker": "Markus"}]	3
29	Freizeitaktivitäten	[{"message": "Hallo zusammen! Was macht ihr in eurer Freizeit am liebsten? Ich versuche immer, mich zu entspannen, wenn ich Zeit habe.", "speaker": "Clara"}, {"message": "Hallo Clara! Ich gehe in meiner Freizeit gerne joggen. Es hilft mir, den Kopf freizubekommen und mich fit zu halten.", "speaker": "Felix"}, {"message": "Joggen ist eine gute Idee, Felix! Ich gehe auch gerne spazieren, vor allem in der Natur. Es ist eine tolle Möglichkeit, den Alltag zu vergessen.", "speaker": "Miriam"}, {"message": "Ich finde es auch schön, draußen zu sein. Aber ich spiele auch gerne Videospiele, besonders an Wochenenden, wenn ich etwas mehr Zeit habe.", "speaker": "Lukas"}, {"message": "Videospiele sind auch ein toller Zeitvertreib, Lukas! Aber ich versuche, meine Freizeit mit Aktivitäten zu füllen, die mich auch körperlich herausfordern. Zum Beispiel gehe ich ins Fitnessstudio.", "speaker": "Felix"}, {"message": "Das ist eine gute Balance, Felix! Ich finde es wichtig, auch aktiv zu bleiben. Aber manchmal mag ich es auch, einfach einen Film zu schauen oder ein Buch zu lesen.", "speaker": "Clara"}, {"message": "Ich liebe es, neue Filme zu entdecken! Aber ich bevorzuge es, draußen etwas zu unternehmen, besonders bei gutem Wetter. Ein Picknick im Park ist immer eine schöne Option.", "speaker": "Miriam"}, {"message": "Ja, Picknick ist eine tolle Idee, Miriam! Aber was ist mit kreativen Aktivitäten? Ich habe neulich mit Malen angefangen, es macht mir sehr viel Spaß.", "speaker": "Lukas"}, {"message": "Das klingt spannend, Lukas! Ich wollte auch mal etwas Kreatives ausprobieren, wie z.B. Basteln oder Kochen. Es ist eine gute Möglichkeit, sich zu entspannen und gleichzeitig etwas Neues zu lernen.", "speaker": "Clara"}, {"message": "Ich finde es immer interessant, neue Hobbys zu entdecken. Vielleicht sollte ich auch mehr in kreativen Bereichen wie Musik oder Kunst versuchen.", "speaker": "Felix"}, {"message": "Ja, es gibt so viele Dinge, die man in seiner Freizeit tun kann. Man muss nur die richtige Balance finden, damit man sich nicht überfordert fühlt.", "speaker": "Miriam"}, {"message": "Ich denke, wir haben viele gute Ideen gesammelt! Freizeit ist wichtig, um sich zu erholen und neue Energie zu tanken.", "speaker": "Lukas"}]	3
1	Büro vs Homeoffice	[{"message": "Hallo zusammen! Ich habe neulich einen Artikel über Homeoffice gelesen. Viele Unternehmen bieten jetzt die Möglichkeit, von zu Hause aus zu arbeiten. Was denkt ihr darüber?", "speaker": "Lena"}, {"message": "Hallo Lena! Ich persönlich finde Homeoffice super. Ich spare viel Zeit, weil ich nicht zur Arbeit pendeln muss. Außerdem kann ich meine Arbeitszeit flexibler gestalten.", "speaker": "David"}, {"message": "Das stimmt, aber ich finde es manchmal schwierig, mich zu konzentrieren. Zu Hause gibt es viele Ablenkungen, zum Beispiel Familie oder Haushalt. Im Büro bin ich produktiver.", "speaker": "Sophie"}, {"message": "Ich bin da eher zwiegespalten. Einerseits ist Homeoffice bequem, andererseits fehlt mir der soziale Kontakt mit meinen Kollegen. Man kann nicht einfach in der Kaffeepause über Ideen sprechen oder schnell Fragen klären.", "speaker": "Max"}, {"message": "Ja, genau! Ich denke, ein Hybridmodell wäre ideal. Also zum Beispiel drei Tage im Büro und zwei Tage Homeoffice. So hätte man sowohl Struktur als auch Flexibilität.", "speaker": "Lena"}, {"message": "Das klingt gut. Aber was ist mit Teamarbeit? Ich finde, dass Videokonferenzen nicht dasselbe sind wie persönliche Meetings.", "speaker": "David"}, {"message": "Stimmt, die Kommunikation ist im Büro oft effizienter. Aber Homeoffice hat auch Vorteile für die Work-Life-Balance. Man kann zum Beispiel während der Mittagspause spazieren gehen oder gesünder essen.", "speaker": "Sophie"}, {"message": "Gute Argumente! Vielleicht kommt es auch auf den Beruf an. In der IT-Branche ist Homeoffice einfacher als zum Beispiel in einem Krankenhaus oder einer Schule.", "speaker": "Max"}, {"message": "Das ist ein guter Punkt. Vielleicht sollten Unternehmen ihren Mitarbeitern mehr Freiheit geben, zu entscheiden, was für sie am besten funktioniert.", "speaker": "Lena"}, {"message": "Ja, das wäre fair. Ich denke, die Zukunft gehört der Flexibilität.", "speaker": "David"}, {"message": "Genau! Jeder arbeitet anders und braucht andere Bedingungen, um produktiv zu sein.", "speaker": "Sophie"}, {"message": "Super Diskussion! Ich finde, wir haben gute Argumente auf beiden Seiten gehört.", "speaker": "Max"}]	1
27	Umweltschutz	[{"message": "Hallo zusammen! Ich habe neulich über Umweltschutz nachgedacht. Wie wichtig ist es für euch, etwas für die Umwelt zu tun?", "speaker": "Anna"}, {"message": "Hallo Anna! Ich finde Umweltschutz sehr wichtig. Ich versuche, weniger Plastik zu benutzen und mehr recyceln. Es ist wichtig, die Umwelt zu schützen, damit auch zukünftige Generationen in einer sauberen Welt leben können.", "speaker": "Tom"}, {"message": "Ja, ich stimme dir zu, Tom. Aber manchmal fällt es mir schwer, konsequent zu sein. Es ist nicht immer einfach, umweltfreundliche Entscheidungen zu treffen, vor allem wenn es mehr kostet oder weniger bequem ist.", "speaker": "Lisa"}, {"message": "Ich verstehe, was du meinst, Lisa. Aber ich glaube, wenn wir alle kleine Dinge ändern, können wir gemeinsam viel erreichen. Zum Beispiel könnte jeder versuchen, öfter das Fahrrad zu nehmen oder auf den Kauf von Einwegprodukten zu verzichten.", "speaker": "Paul"}, {"message": "Das stimmt, Paul. Ich habe vor kurzem auch angefangen, öfter auf das Auto zu verzichten und öffentliche Verkehrsmittel zu nutzen. Das hilft nicht nur der Umwelt, sondern auch meinem Geldbeutel.", "speaker": "Anna"}, {"message": "Ich finde auch, dass man schon bei der Ernährung umweltbewusst handeln kann. Zum Beispiel weniger Fleisch essen oder Produkte aus der Region kaufen. So unterstützt man auch die lokale Landwirtschaft.", "speaker": "Tom"}, {"message": "Gute Idee, Tom! Aber manchmal ist es schwierig, solche Entscheidungen im Alltag zu treffen, besonders wenn man wenig Zeit hat. Manchmal greift man einfach zu dem, was schnell und einfach ist.", "speaker": "Lisa"}, {"message": "Ja, aber ich denke, wenn man sich einmal an die neuen Gewohnheiten gewöhnt, wird es leichter. Man muss nur den ersten Schritt machen.", "speaker": "Paul"}, {"message": "Das stimmt, Paul. Ich versuche, mich mehr zu informieren und bewusster zu konsumieren. Es ist zwar eine Herausforderung, aber es lohnt sich.", "speaker": "Anna"}, {"message": "Genau, jeder kleine Schritt zählt. Ich hoffe, dass immer mehr Menschen erkennen, wie wichtig es ist, die Umwelt zu schützen.", "speaker": "Tom"}, {"message": "Ich denke, wir sollten alle unser Bestes tun. Es ist die Verantwortung von uns allen, unseren Planeten zu bewahren.", "speaker": "Lisa"}, {"message": "Eine tolle Diskussion! Ich finde es wichtig, dass wir uns gegenseitig motivieren und gemeinsam an einer besseren Zukunft arbeiten.", "speaker": "Paul"}]	3
30	Reisen	[{"message": "Hallo zusammen! Ich liebe es, zu reisen. Welches Land oder welche Stadt möchtet ihr als nächstes besuchen?", "speaker": "Sarah"}, {"message": "Hallo Sarah! Ich würde gerne nach Japan reisen. Die Kultur und das Essen interessieren mich sehr. Außerdem möchte ich die schönen Tempel und die Natur dort erleben.", "speaker": "Jonas"}, {"message": "Japan klingt fantastisch, Jonas! Ich habe schon viel darüber gehört. Aber ich würde auch gerne nach Spanien reisen, besonders nach Barcelona. Die Architektur von Gaudí ist beeindruckend.", "speaker": "Anna"}, {"message": "Barcelona ist wirklich eine tolle Stadt, Anna! Aber ich habe vor kurzem einen Urlaub in Italien gemacht, und es war unglaublich. Die Sehenswürdigkeiten in Rom und die Strände in Sizilien sind einfach wunderschön.", "speaker": "Max"}, {"message": "Italien ist wirklich ein tolles Reiseziel, Max. Ich war auch schon dort, aber ich möchte unbedingt noch nach Griechenland. Die Inseln sollen sehr schön sein, und ich liebe griechisches Essen.", "speaker": "Sarah"}, {"message": "Griechenland klingt super, Sarah! Aber ich finde es auch spannend, neue Städte in Europa zu entdecken. Letztes Jahr war ich in Prag, und es war einfach zauberhaft.", "speaker": "Jonas"}, {"message": "Prag ist eine tolle Stadt, Jonas! Ich möchte auch gerne mal nach Skandinavien reisen, besonders nach Norwegen. Die Fjorde und die Natur sollen atemberaubend sein.", "speaker": "Anna"}, {"message": "Norwegen ist definitiv auf meiner Liste, Anna! Aber ich finde auch Fernreisen spannend. Ich habe gehört, dass Bali ein perfektes Ziel für einen entspannten Urlaub ist.", "speaker": "Max"}, {"message": "Ja, Bali steht auch auf meiner Wunschliste, Max! Aber ich denke, bevor ich so weit reise, möchte ich noch einige europäische Länder besser kennenlernen.", "speaker": "Sarah"}, {"message": "Ich verstehe, was du meinst, Sarah. Manchmal ist es auch schön, mehr von Europa zu sehen, bevor man große Reisen unternimmt. Ich habe zum Beispiel auch vor, nächstes Jahr nach Amsterdam zu fahren.", "speaker": "Jonas"}, {"message": "Amsterdam ist eine wunderbare Stadt, Jonas! Reisen ist eine tolle Möglichkeit, neue Kulturen kennenzulernen und unvergessliche Erlebnisse zu sammeln.", "speaker": "Anna"}, {"message": "Absolut, Anna! Ich freue mich schon darauf, bald wieder zu reisen und neue Abenteuer zu erleben.", "speaker": "Max"}]	3
31	Sport und Fitness	[{"message": "Hallo zusammen! Macht ihr regelmäßig Sport? Ich habe vor kurzem angefangen, ins Fitnessstudio zu gehen, um fit zu bleiben.", "speaker": "Julia"}, {"message": "Hallo Julia! Ich mache regelmäßig Yoga und gehe zum Laufen. Es hilft mir, mich zu entspannen und fit zu bleiben. Aber Fitnessstudio ist auch eine gute Idee, wenn man gezielt Muskeln aufbauen möchte.", "speaker": "Daniel"}, {"message": "Ich gehe oft schwimmen, weil es sehr gut für den ganzen Körper ist. Es ist gelenkschonend und gleichzeitig ein tolles Cardio-Training.", "speaker": "Lisa"}, {"message": "Schwimmen ist wirklich eine großartige Sportart, Lisa! Ich habe es auch mal ausprobiert, aber ich finde, dass ich beim Laufen mehr Ausdauer aufbaue. Es ist so einfach, es in den Alltag zu integrieren.", "speaker": "Max"}, {"message": "Ja, Laufen ist wirklich praktisch, Max. Aber ich finde, dass es wichtig ist, auch die Flexibilität zu trainieren, deshalb mache ich regelmäßig Dehnübungen.", "speaker": "Julia"}, {"message": "Ich habe vor kurzem mit Pilates angefangen. Es ist auch super für die Flexibilität und stärkt den Rumpf. Ich finde, es ist eine gute Ergänzung zu anderen Sportarten.", "speaker": "Daniel"}, {"message": "Pilates klingt gut! Ich mache auch Krafttraining, um meine Muskeln zu stärken. Aber manchmal fällt es mir schwer, mich zu motivieren. Habt ihr Tipps, wie man die Motivation hochhält?", "speaker": "Lisa"}, {"message": "Motivation kann wirklich eine Herausforderung sein, Lisa. Ich setze mir kleine Ziele und belohne mich, wenn ich sie erreiche. Das hilft mir, am Ball zu bleiben.", "speaker": "Max"}, {"message": "Ich mache auch gerne Sport mit Freunden. Es macht viel mehr Spaß, zusammen zu trainieren. Vielleicht könntest du dich einer Trainingsgruppe anschließen, Lisa.", "speaker": "Julia"}, {"message": "Das ist eine tolle Idee, Julia! Zusammen macht Sport wirklich mehr Spaß. Ich denke, es ist auch wichtig, regelmäßig neue Sportarten auszuprobieren, um sich nicht zu langweilen.", "speaker": "Daniel"}, {"message": "Ja, das stimmt! Ich denke, der wichtigste Aspekt beim Sport ist, dass man Freude daran hat. Wenn man Spaß hat, bleibt man auch länger dabei.", "speaker": "Max"}]	3
\.


--
-- Data for Name: _AntonymRelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_AntonymRelation" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _SimilarWordRelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_SimilarWordRelation" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _SynonymRelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_SynonymRelation" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
13a087fd-7eb3-42c6-9fe2-63c5dd8ac75b	1f09d361989afe01975048b254b4982bbce8015f622495ddd5f921374ebfa974	2025-03-22 16:39:43.712809+00	20250223170112_add_prefix_conversation	\N	\N	2025-03-22 16:39:43.424788+00	1
e8ec6e1c-8d98-4058-a698-8ef39417871e	048421eac9471e9d6d9759480c57206e466d9085ae9d502ed7441a1308825e65	2025-03-22 16:39:43.842433+00	20250224040917_add_prefix	\N	\N	2025-03-22 16:39:43.749676+00	1
de6eecaa-14a2-4fbc-a70c-8f75fbfb8eff	42c6ac5c603c585cab4c1949fec9ceac692ef9a9e3662968e2691986251fc5b6	2025-03-22 16:39:43.97551+00	20250225165146_boolean_added	\N	\N	2025-03-22 16:39:43.878804+00	1
b068280f-12d4-4d63-bf29-33bb66a38328	971f330643d71b03e3074c8fc517d22348baaf8a4d4b4236cbdfe558f5a79e0b	2025-03-22 16:39:44.104687+00	20250322153240_add_reset_token_used	\N	\N	2025-03-22 16:39:44.011223+00	1
c732d36f-d1b2-441e-9144-9c3ff1c92661	b8100f7704775eed8b9a9c009edce54355653ae9114a04c4727e58ff5789be1b	2025-03-22 16:39:46.532443+00	20250322163946_add_reset_token_used	\N	\N	2025-03-22 16:39:46.437192+00	1
891c7b59-6a49-4739-95e8-6e579cc89352	1f09d361989afe01975048b254b4982bbce8015f622495ddd5f921374ebfa974	2025-02-25 16:50:17.489963+00	20250223170112_add_prefix_conversation	\N	\N	2025-02-25 16:50:17.136716+00	1
99e05ea0-336d-4c78-8f77-b718c92efc31	048421eac9471e9d6d9759480c57206e466d9085ae9d502ed7441a1308825e65	2025-02-25 16:50:17.615846+00	20250224040917_add_prefix	\N	\N	2025-02-25 16:50:17.522488+00	1
174e6918-9002-48e6-812e-0c76e76a9bd4	42c6ac5c603c585cab4c1949fec9ceac692ef9a9e3662968e2691986251fc5b6	2025-02-25 16:51:46.60754+00	20250225165146_boolean_added	\N	\N	2025-02-25 16:51:46.485021+00	1
af8f97c6-b7b4-4d7c-bb8f-765f6d660ebe	1f09d361989afe01975048b254b4982bbce8015f622495ddd5f921374ebfa974	2025-02-24 04:57:08.493192+00	20250223170112_add_prefix_conversation	\N	\N	2025-02-24 04:57:08.210392+00	1
abb715fc-812d-41b7-81de-6d69057151d8	048421eac9471e9d6d9759480c57206e466d9085ae9d502ed7441a1308825e65	2025-02-24 04:57:08.651282+00	20250224040917_add_prefix	\N	\N	2025-02-24 04:57:08.53877+00	1
2f1037c5-4a77-4465-890e-db9fba56d790	1f09d361989afe01975048b254b4982bbce8015f622495ddd5f921374ebfa974	2025-02-23 18:02:21.674331+00	20250223170112_add_prefix_conversation	\N	\N	2025-02-23 18:02:21.413818+00	1
59fc3dfd-f3c6-4eff-8d9b-78ea02133fe4	3e4f6d22d953dbf377fa6449f21f29e7c057168adf684fd1c54c3b163499a491	2025-01-19 06:01:25.709216+00	20250119060125_init	\N	\N	2025-01-19 06:01:25.532412+00	1
dd378218-7f98-406a-8d9a-101ff767f551	3e4f6d22d953dbf377fa6449f21f29e7c057168adf684fd1c54c3b163499a491	2025-01-19 05:38:01.37951+00	20250119053801_init	\N	\N	2025-01-19 05:38:01.195702+00	1
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, name, email, "profilePhoto", "contactNumber", "isDeleted", "createdAt", "updatedAt") FROM stdin;
c56400e7-54dc-4524-88b2-3b64289bf38c	Super Admin	arif.aust.eng@gmail.com	\N	01234567890	f	2025-02-24 00:12:02.922	2025-02-24 00:12:02.922
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, name) FROM stdin;
1	der
2	die
3	das
4	unknown
5	der/die
\.


--
-- Data for Name: basic_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basic_users (id, email, name, "profilePhoto", "contactNumber", address, "isDeleted", "createdAt", "updatedAt") FROM stdin;
3393583b-08ad-403b-b5f1-f1aebdf4819e	ibnaasif12@gmail.com	Asif	\N	\N	\N	f	2025-03-07 21:24:18.94	2025-03-07 21:24:18.94
282ad498-bf99-411a-a47f-ddb2b7fc7f85	rumi.others@gmail.com	rumi	\N	\N	\N	f	2025-03-15 11:30:35.736	2025-03-15 11:30:35.736
833df8f5-3327-4aa8-a504-fd7f1c70a886	arif.aust.eng1@gmail.com	Rahim	\N	\N	\N	f	2025-03-22 21:32:53.748	2025-03-22 21:32:53.748
d6cfb5c6-a447-4dd5-a1e7-203de94b9060	almon.arif@gmail.com	Md Arifur Rahman 	\N	\N	\N	f	2025-03-23 16:36:15.379	2025-03-23 16:36:15.379
90d96eed-f4d9-4cb2-9533-8b6d61f7126d	ashiq.mamun10@gmail.com	Md Ashiqur Rahman	\N	\N	\N	f	2025-03-31 18:31:51.391	2025-03-31 18:31:51.391
61386c05-ca17-4854-acf1-d0356673d4ad	riyadhbd2@gmail.com	Easir Arafat	\N	\N	\N	f	2025-04-06 21:08:28.019	2025-04-06 21:08:28.019
f5e61b8c-ac07-40c9-963a-82913bc8d27d	sabbir.ziauddin@gmail.com	sabbir	\N	\N	\N	f	2025-04-13 12:04:38.965	2025-04-13 12:04:38.965
42fd455a-79e1-491b-90ad-56929e1ffb9f	bhua14bhua@gmail.com	Tahsin	\N	\N	\N	f	2025-05-03 17:41:45.157	2025-05-03 17:41:45.157
\.


--
-- Data for Name: favorite_words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_words ("userId", "wordId") FROM stdin;
\.


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.levels (id, level, "deletedAt") FROM stdin;
1	A1	\N
2	A2	\N
3	B1	\N
4	B2	\N
5	C1	\N
\.


--
-- Data for Name: parts_of_speech; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parts_of_speech (id, name) FROM stdin;
1	noun
2	verb
3	unknown
\.


--
-- Data for Name: prefix_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prefix_types (id, name) FROM stdin;
1	Separable
2	Inseparable
3	Dual
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prefixes (id, "prefixName", meaning, sentences, "prefixTypeId", "prefixWord", verb) FROM stdin;
76	Er	{"to replace","to use","to employ","to deploy"}	{"Ich muss die alten Batterien ersetzen.","Das Unternehmen ersetzte die veraltete Software."}	2	Ersetzen	t
77	Er	{"to experience"}	{"Ich habe viel über andere Kulturen erfahren.","Sie erfuhr von der neuen Regelung durch die Nachrichten."}	2	Erfahren	t
78	Er	{"to experience","to witness"}	{"Ich habe eine spannende Reise erlebt.","Er erlebte viele Abenteuer während seines Urlaubs."}	2	Erleben	t
79	Er	{"to invent"}	{"Er hat eine neue Technologie erfunden.","Viele glauben, dass Leonardo da Vinci das Flugzeugkonzept erfunden hat."}	2	Erfinden	t
80	Er	{"to explain"}	{"Der Lehrer erklärt die Grammatik sehr gut.","Kannst du mir das bitte nochmal erklären?"}	2	Erklären	t
81	Er	{"to reach"}	{"Ich habe endlich mein Ziel erreicht.","Er erreichte den höchsten Punkt des Berges."}	2	Erreichen	t
82	Er	{"to allow"}	{"Meine Eltern erlauben mir, lange aufzubleiben.","Das Gesetz erlaubt das Rauchen in bestimmten Bereichen."}	2	Erlauben	t
83	Er	{"to remind","to remember"}	{"Ich erinnere mich an meinen ersten Schultag.","Kannst du mich an das Meeting erinnern?"}	2	Erinnern	t
84	Er	{"to increase"}	{"Die Firma hat die Gehälter erhöht.","Er erhöhte seine Laufgeschwindigkeit."}	2	Erhöhen	t
85	Er	{"to recognize"}	{"Ich kann ihn nach all den Jahren kaum erkennen.","Er erkannte die Wahrheit sofort."}	2	Erkennen	t
86	Er	{"to fight for","to win through effort"}	{"Er hat sich seinen Erfolg hart erkämpft.","Die Mannschaft erkämpfte sich den Sieg in der letzten Minute."}	2	Erkämpfen	t
87	Er	{"to encourage"}	{"Meine Lehrerin hat mich immer ermutigt.","Die positiven Kommentare ermutigten ihn weiterzumachen."}	2	Ermutigen	t
88	Er	{"to produce"}	{"Windkraft erzeugt saubere Energie.","Das Feuer erzeugt Wärme."}	2	Erzeugen	t
89	Er	{"to receive","to get","to obtain"}	{"Ich habe eine E-Mail von meinem Chef erhalten.","Sie erhielt ein Geschenk zu ihrem Geburtstag."}	2	Erhalten	t
90	Er	{"to require","to demand"}	{"Diese Arbeit erfordert viel Geduld.","Das Projekt erfordert eine sorgfältige Planung."}	2	Erfordern	t
91	Er	{"to encourage"}	{"Die Regierung fördert den Umweltschutz.","Er fördert junge Talente in seiner Firma."}	2	Erfördern	t
92	Er	{"to inquire","to investigate"}	{"Die Wissenschaftler erforschen neue Behandlungsmethoden.","Er erforschte die Geschichte seiner Familie."}	2	Erforschen	t
93	Er	{"to complete","to take care of"}	{"Ich muss noch ein paar Dinge erledigen.","Er erledigte seine Aufgaben schnell und effizient."}	2	Erledigen	t
94	Er	{"to expand","to extend"}	{"Das Unternehmen erweitert sein Geschäft.","Er erweiterte seine Sprachkenntnisse durch Reisen."}	2	Erweitern	t
95	Er	{success}	{"Er hatte großen Erfolg in seinem Beruf.","Der Erfolg des Projekts war beeindruckend."}	2	Erfolg	f
96	An	{"to look at","to examine"}	{"Ich möchte mir den Film anschauen.","Sie schaute sich das Gemälde genau an."}	1	anschauen	t
97	An	{"to arrive"}	{"Der Zug kommt um 18 Uhr an.","Wann bist du zu Hause angekommen?"}	1	ankommen	t
98	Auf	{"to open"}	{"Kannst du bitte das Fenster aufmachen?","Er machte die Tür vorsichtig auf."}	1	aufmachen	t
99	Auf	{"to get up","to stand up"}	{"Ich stehe jeden Morgen um 7 Uhr auf.","Er stand während der Rede auf."}	1	aufstehen	t
100	Aus	{"to execute","to perform"}	{"Der Computer führte den Befehl aus.","Er führte die Aufgabe erfolgreich aus."}	1	ausführen	t
101	Aus	{"to come out","to get along"}	{"Er kommt gut mit seinen Kollegen aus.","Wann kommt der neue Film aus?"}	1	auskommen	t
102	Ein	{"to press in","to dent"}	{"Bitte nicht zu stark eindrücken.","Er hat den Knopf eingedrückt."}	1	eindrücken	t
103	Ein	{"to inhale"}	{"Atme tief ein und entspanne dich.","Er musste den Rauch einatmen."}	1	einatmen	t
104	Mit	{"to come with"}	{"Kommst du mit ins Kino?","Er kam spontan mit uns mit."}	1	mitkommen	t
105	Mit	{"to participate","to join in"}	{"Ich mache beim Wettbewerb mit.","Er hat beim Marathon mitgemacht."}	1	mitmachen	t
106	Nach	{"to pursue","to trace"}	{"Er ging seiner Leidenschaft nach.","Die Polizei geht dem Hinweis nach."}	1	nachgehen	t
107	Nach	{"to refill"}	{"Bitte füllen Sie das Glas nach.","Er hat den Drucker mit Papier nachgefüllt."}	1	nachfüllen	t
108	Zu	{"to admit","to confess"}	{"Er musste seinen Fehler zugeben.","Ich gebe zu, dass ich mich geirrt habe."}	1	zugeben	t
109	Zu	{"to authorize","to allow"}	{"Die Schule lässt keine Handys zu.","Er wurde zur Prüfung zugelassen."}	1	zulassen	t
110	Er	{experience}	{"Sie hat viel Erfahrung in diesem Bereich.","Die Reise war eine wertvolle Erfahrung für mich."}	2	Erfahrung	f
111	Er	{insight,realization}	{"Er hatte eine plötzliche Erkenntnis über sein Leben.","Die wissenschaftliche Erkenntnis hilft uns, die Welt besser zu verstehen."}	2	Erkenntnis	f
147	Er	{"to issue",give}	{"Er erteilte mir die Erlaubnis.","Sie erteilte eine Genehmigung."}	2	Erteilen	t
148	Er	{replacement,substitute}	{"Dieser Ersatz war notwendig.","Er brachte einen guten Ersatz."}	2	Ersatz	f
112	Er	{memory}	{"Die Erinnerung an meine Kindheit ist sehr lebendig.","Er hat eine schöne Erinnerung an seine Schulzeit."}	2	Erinnerung	f
113	Er	{permission}	{"Ich brauche die Erlaubnis meiner Eltern.","Er erhielt die Erlaubnis, das Gebäude zu betreten."}	2	Erlaubnis	f
114	Er	{increase}	{"Die Erhöhung der Preise führte zu Protesten.","Eine Erhöhung des Gehalts ist immer willkommen."}	2	Erhöhung	f
115	Er	{product,"manufactured good"}	{"Dieses Erzeugnis wird in Deutschland hergestellt.","Die Qualität des Erzeugnisses ist hervorragend."}	2	Erzeugnis	f
116	Ein	{purchase,shopping}	{"Der Einkauf im Supermarkt dauerte eine Stunde.","Ich habe meinen Einkauf in der Tasche."}	1	Einkauf	f
117	Ein	{impression}	{"Er machte einen guten Eindruck beim Vorstellungsgespräch.","Mein erster Eindruck von der Stadt war positiv."}	1	Eindruck	f
118	Ein	{influence}	{"Seine Eltern haben einen großen Einfluss auf ihn.","Der Klimawandel hat einen Einfluss auf das Wetter."}	1	Einfluss	f
119	Ein	{entrance}	{"Der Eingang zum Gebäude ist auf der rechten Seite.","Bitte benutzen Sie den Haupteingang."}	1	Eingang	f
120	Ein	{unit,unity}	{"Kilogramm ist eine Einheit des Gewichts.","Die Menschen demonstrierten für Einheit und Frieden."}	1	Einheit	f
121	Ein	{income,revenue,"intake (medicine)"}	{"Die Firma verzeichnete hohe Einnahmen im letzten Jahr.","Die Einnahme des Medikaments sollte regelmäßig erfolgen."}	1	Einnahme	f
122	Ein	{invitation}	{"Ich habe eine Einladung zur Hochzeit bekommen.","Seine Einladung zum Abendessen war sehr nett."}	1	Einladung	f
123	Ein	{insight,understanding}	{"Er zeigte Einsicht in seine Fehler.","Die Dokumente sind nur für autorisierte Personen zur Einsicht."}	1	Einsicht	f
124	Ein	{inhabitant,resident}	{"Berlin hat über 3 Millionen Einwohner.","Die Einwohner der Stadt sind sehr freundlich."}	1	Einwohner	f
125	Ein	{burglary,break-in}	{"Letzte Nacht gab es einen Einbruch in der Nachbarschaft.","Die Polizei untersucht den Einbruch im Museum."}	1	Einbruch	f
126	Ein	{intervention,"procedure (medical)"}	{"Der Arzt führte einen kleinen Eingriff durch.","Ein politischer Eingriff ist in dieser Situation notwendig."}	1	Eingriff	f
127	Ein	{facility,furnishing}	{"Die Einrichtung der neuen Wohnung ist sehr modern.","Krankenhäuser sind wichtige medizinische Einrichtungen."}	1	Einrichtung	f
128	Ein	{assessment,evaluation}	{"Seine Einschätzung der Situation war korrekt.","Die Experten gaben eine Einschätzung zum Wirtschaftswachstum ab."}	1	Einschätzung	f
129	Ein	{detail}	{"Er erklärte mir jede Einzelheit des Plans.","Die Einzelheiten des Vertrags müssen noch geklärt werden."}	1	Einzelheit	f
130	Ein	{"to come to mind","to occur"}	{"Mir ist eine gute Idee eingefallen.","Fällt dir eine Lösung für dieses Problem ein?"}	1	einfallen	t
131	Ein	{"to enter (data)","to input"}	{"Bitte geben Sie Ihr Passwort ein.","Er hat seine Adresse in das Formular eingegeben."}	1	eingeben	t
132	Ein	{"to set up","to furnish"}	{"Wir müssen das neue Büro noch einrichten.","Er hat seinen Laptop neu eingerichtet."}	1	einrichten	t
133	Ein	{"to switch on","to turn on"}	{"Kannst du bitte das Licht einschalten?","Ich habe den Computer gerade eingeschaltet."}	1	einschalten	t
134	Ein	{"to enter","to join"}	{"Er trat langsam in den Raum ein.","Ich möchte in den Verein eintreten."}	1	eintreten	t
135	Ein	{"to move in","to confiscate"}	{"Wir ziehen nächste Woche in unsere neue Wohnung ein.","Der Staat hat sein Eigentum eingezogen."}	1	einziehen	t
136	Ein	{"to pack","to wrap"}	{"Vergiss nicht, deine Sachen einzupacken.","Ich packe das Geschenk schön ein."}	1	einpacken	t
137	Ein	{"to invite"}	{"Ich lade dich zu meiner Geburtstagsfeier ein.","Er hat seine Freunde zum Essen eingeladen."}	1	einladen	t
141	Um	{"to drive around","to run over"}	{"Ich umfahre das Hindernis vorsichtig.","Er hat das Verkehrsschild umgefahren."}	3	umfahren	t
138	Ein	{"to go shopping"}	{"Wir gehen heute Abend einkaufen.","Er hat viele Lebensmittel eingekauft."}	1	einkaufen	t
75	Er	{"to create","to construct","to build"}	{"Ich erstelle eine neue Webseite.","Er hat eine beeindruckende Skulptur erstellt."}	2	Erstellen	t
139	Über	{"to overlook","to ignore"}	{"Er hat den Fehler übersehen.","Ich übersehe manchmal kleine Details."}	3	übersehen	t
140	Über	{"to hand over","to vomit"}	{"Er übergab das Paket dem Kurier.","Nach dem Essen musste er sich übergeben."}	3	übergeben	t
142	Unter	{"to sink","to perish"}	{"Die Sonne geht langsam unter.","Das Schiff ist im Sturm untergegangen."}	3	untergehen	t
143	Unter	{"to interrupt"}	{"Bitte unterbrich mich nicht während der Präsentation.","Er unterbrach das Gespräch für eine wichtige Mitteilung."}	3	unterbrechen	t
144	Wider	{"to contradict","to object"}	{"Ich muss deiner Aussage widersprechen.","Er widersprach seiner Chefin nicht."}	3	widersprechen	t
145	Wieder	{"to repeat"}	{"Könntest du bitte deine Frage wiederholen?","Ich habe die Übung mehrmals wiederholt."}	3	wiederholen	t
146	Um	{"to look around"}	{"Ich schaue mich in der neuen Stadt um.","Er schaute sich neugierig um."}	3	umschauen	t
149	Er	{refreshing}	{"Das kühle Getränk war sehr erfrischend.","Das frische Wasser war ein Genuss."}	2	Erfrischend	f
150	Er	{event,incident}	{"Das Ereignis war ein großer Erfolg.","Wir haben das Ereignis aufmerksam verfolgt."}	2	Ereignis	f
151	Er	{"to awaken"}	{"Er erwachte aus einem tiefen Schlaf.","Die Sonne weckte sie früh am Morgen."}	2	Erwachen	t
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics (id, name) FROM stdin;
6	Fernsehen und Unterhaltung
7	So war das damals …
4	Ein Schulprojekt zum Umweltschutz
1	unknown
3	Liebe Nachbarn
5	Online einkaufen
2	Gute Reise!
8	Deutschland – zweite Heimat?
9	Ein neuer Arbeitsplatz
10	Büroalltag
11	Gesunde Ernährung
12	Gut versichert!
13	Chatten, mailen, sich informieren
14	Mit Bus und Bahn
15	Unsere neue Wohnung
16	Auf dem Amt
17	Schule, und dann?
18	Auf Arbeitssuche
19	Ein Einkaufsbummel
20	Bei der Arbeit
21	In der Schule
22	Gesund sein und gesund bleiben
23	Auf der Bank
24	Freizeitvergnügen
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, name, role, "needPasswordChange", status, "verificationToken", "createdAt", "updatedAt") FROM stdin;
ff6adb91-458c-4202-99a2-b3dfb479c32e	rumi.others@gmail.com	$2b$12$v7SCUrVoB9yQGwwOnx1jN.z8a2fC/9pETTRtsTfFoV2H.qidk/Egq	rumi	BASIC_USER	t	ACTIVE	\N	2025-03-15 11:30:35.542	2025-03-24 18:22:23.835
3964588d-00cf-480b-86df-3951b6e8dc12	arif.aust.eng1@gmail.com	$2b$12$XrGcRFFukXcDPwZtdiA30OLhSwtmaD3trbGDyosEW40mts3W/iHGO	Rahim	BASIC_USER	t	ACTIVE	fdce63b08c766736a6d0452a570eeeb604a4beda1b1df1cdb18a593803dda669	2025-03-22 21:32:53.562	2025-03-24 18:26:08.632
79669a3c-1fde-407d-9f89-f526dc98c7d3	sabbir.ziauddin@gmail.com	$2b$12$xEv5hYDDBWI1kkqs4iOYf.YczMZ.BdJlzndkGfNMEK4O9MIAZEizi	sabbir	BASIC_USER	t	ACTIVE	\N	2025-04-13 12:04:38.769	2025-05-01 18:58:12.317
d9a98059-2f81-4cfa-a9a3-04545a677972	arif.aust.eng@gmail.com	$2b$12$JsL7c2sw299.5EXem..4aOn5p4cRa3PnwfVHiYFjMTKZ0aeXcGcC.	Super Admin	SUPER_ADMIN	t	ACTIVE	\N	2025-02-24 00:12:02.922	2025-05-01 19:11:27.37
97cb74d9-eefd-40f7-8553-5d237a7ca491	almon.arif@gmail.com	$2b$12$kzh.CcPnEmikw12w7q7ny.aIXoimhof0A4HpmTeZAeC/66Hvp7s52	Md Arifur Rahman 	ADMIN	t	ACTIVE	\N	2025-03-23 16:36:15.189	2025-05-03 16:52:16.871
290b5077-a5ee-460c-8237-d48b3627ab79	ashiq.mamun10@gmail.com	$2b$12$48mh5yKxEmnySeyNiwInqeNbUgRz6bejMYgjnBeUNRbJRLsgseIyu	Md Ashiqur Rahman	BASIC_USER	t	ACTIVE	\N	2025-03-31 18:31:51.193	2025-03-31 18:34:40.851
7f195dc4-feb3-4adc-9269-9f178cb9dc3b	bhua14bhua@gmail.com	$2b$12$BJ5lbPUZVivpv0CnIxkDyeXurfbNsph3/3hN1AvlUsb6TMRNrDO/a	Tahsin	BASIC_USER	t	ACTIVE	\N	2025-05-03 17:41:45.147	2025-05-03 17:42:45.814
a9c3c486-1397-440a-883f-643cdd4cf819	riyadhbd2@gmail.com	$2b$12$bqoxjjVpedb5l/nDGBMxDe2QDrMfB/ggY2FgcjTt8xl5bsK..htpu	Easir Arafat	BASIC_USER	t	ACTIVE	\N	2025-04-06 21:08:27.813	2025-04-06 21:19:34.134
2772b6c8-0567-47ef-8576-fab77c8334bc	ibnaasif12@gmail.com	$2b$12$yX7kpMsPxa571ILbM5vLLOfXL4W9.6wpMtdSkK9ZZUGxuL4UYYEp.	Asif	BASIC_USER	t	ACTIVE	\N	2025-03-07 21:24:18.75	2025-04-13 12:08:45.221
\.


--
-- Data for Name: words_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.words_table (id, value, meaning, sentences, "levelId", "topicId", "articleId", "partOfSpeechId", "pluralForm") FROM stdin;
4864	besonders	{especially}	{"Mathe ist besonders schwer.","Das war ein besonders schöner Tag."}	2	17	\N	\N	\N
4865	bildungsweg	{"course of education"}	{"Mein Bildungsweg führt zur Universität.","Welchen Bildungsweg möchtest du wählen?"}	2	17	1	\N	\N
4866	bürororganisation	{"office administration"}	{"Bürororganisation ist Teil meines Jobs.","Ich lerne Bürororganisation in der Schule."}	2	17	2	\N	\N
4867	chaos	{chaos}	{"Im Klassenzimmer herrscht Chaos.","Chaos entsteht, wenn niemand aufräumt."}	2	17	3	\N	\N
4868	decke	{ceiling}	{"Die Decke im Klassenzimmer ist hoch.","An der Decke hängt eine Lampe."}	2	17	2	\N	\N
4869	ende	{end}	{"Das Ende des Schuljahres ist nah.","Am Ende der Straße ist die Schule."}	2	17	3	\N	\N
4870	energie	{energy}	{"Ich habe keine Energie mehr für Hausaufgaben.","Erneuerbare Energie ist wichtig."}	2	17	2	\N	\N
4871	enthalten	{"to contain"}	{"Das Buch enthält viele Übungen.","Der Kurs enthält praktische Beispiele."}	2	17	\N	\N	\N
4872	entscheiden	{"to decide"}	{"Ich entscheide mich für ein Studium.","Entscheide schnell, der Termin endet bald!"}	2	17	\N	\N	\N
4873	erforderlich	{required}	{"Mathe ist für den Abschluss erforderlich.","Welche Unterlagen sind erforderlich?"}	2	17	\N	\N	\N
4874	fitness	{fitness}	{"Fitness ist wichtig für die Gesundheit.","Ich trainiere im Fitnessstudio."}	2	17	2	\N	\N
4875	fliehen	{"to flee"}	{"Viele Menschen fliehen vor Krieg.","Die Tiere fliehen vor dem Feuer."}	2	17	\N	\N	\N
4876	fortgeschritten	{advanced}	{"Dieser Kurs ist für fortgeschrittene Lerner.","Mein Englisch ist fortgeschritten."}	2	17	\N	\N	\N
4877	frisör/in	{hairdresser}	{"Der Frisör schneidet meine Haare.","Die Frisörin arbeitet im Salon."}	2	17	5	\N	\N
4878	genial	{great}	{"Deine Idee ist genial!","Das war ein genialer Film."}	2	17	\N	\N	\N
4879	hoffentlich	{hopefully}	{"Hoffentlich bestehe ich die Prüfung.","Hoffentlich regnet es morgen nicht."}	2	17	\N	\N	\N
4880	jobben	{"to do casual/part-time work"}	{"Ich jobbe am Wochenende im Café.","Jobbst du während des Studiums?"}	2	17	\N	\N	\N
4881	kategorie	{category}	{"Wählen Sie eine Kategorie aus!","In welcher Kategorie bist du gut?"}	2	17	2	\N	Kategorien
4882	kaufmännisch	{business}	{"Ich mache eine kaufmännische Ausbildung.","Kaufmännische Kenntnisse sind gefragt."}	2	17	\N	\N	\N
4883	kenntnisse	{knowledge}	{"Meine Kenntnisse in Mathe sind gut.","Sprachkenntnisse sind wichtig."}	2	17	\N	\N	\N
4884	kommunikation	{communication}	{"Gute Kommunikation ist im Team wichtig.","Wir lernen Kommunikation im Kurs."}	2	17	2	\N	\N
4885	kompakt	{compact}	{"Der Kurs ist kompakt und effizient.","Das Handbuch ist kompakt gestaltet."}	2	17	\N	\N	\N
4886	kürzen	{"to shorten"}	{"Ich kürze den Text auf eine Seite.","Die Regierung kürzt das Budget."}	2	17	\N	\N	\N
4887	kurzgebühr	{"course fee"}	{"Die Kursgebühr beträgt 200 Euro.","Zahle die Kursgebühr bitte rechtzeitig!"}	2	17	2	\N	\N
4888	kurzprogramm	{"short program"}	{"Das Kurzprogramm dauert nur zwei Wochen.","Ich nehme am Kurzprogramm teil."}	2	17	3	\N	\N
4889	lebensweg	{"journey through life"}	{"Mein Lebensweg war nicht einfach.","Der Lebensweg jedes Menschen ist einzigartig."}	2	17	1	\N	Lebenswege
4890	lehre	{apprenticeship}	{"Er macht eine Lehre als Elektriker.","Die Lehre dauert drei Jahre."}	2	17	2	\N	\N
4891	lehrmaterial	{"teaching material"}	{"Das Lehrmaterial ist online verfügbar.","Wir verwenden modernes Lehrmaterial."}	2	17	3	\N	\N
4892	material	{material}	{"Das Material für den Kurs ist teuer.","Hast du das benötigte Material?"}	2	17	3	\N	\N
4893	miserabel	{miserable}	{"Die Prüfung war miserabel schwer.","Ich fühle mich miserabel."}	2	17	\N	\N	\N
4894	mittlere	{middle}	{"Die mittlere Stufe ist am beliebtesten.","Er hat einen mittleren Schulabschluss."}	2	17	\N	\N	\N
4895	prost	{Cheers!}	{"Prost! Auf deinen Erfolg!","Wir sagen Prost zum Abschluss."}	2	17	\N	\N	\N
4896	prüfung	{exam}	{"Die Prüfung war sehr schwer.","Ich lerne jeden Tag für die Prüfung."}	2	17	2	\N	\N
4859	beenden	{"to end"}	{"Wir beenden den Kurs im Juni.","Beende deine Hausaufgaben!"}	2	17	\N	\N	\N
4860	beratung	{counselling}	{"Die Beratung hilft bei der Studienwahl.","Hast du die Beratung besucht?"}	2	17	2	\N	\N
4861	bereich	{area}	{"Mein Bereich ist die Technik.","In welchem Bereich arbeitest du?"}	2	17	1	\N	\N
4862	berufsausbildung	{"professional training"}	{"Die Berufsausbildung dauert drei Jahre.","Er beginnt eine Berufsausbildung zum Koch."}	2	17	2	\N	\N
4863	berufsschule	{"vocational college"}	{"Die Berufsschule ist jeden Freitag.","In der Berufsschule lerne ich Theorie."}	2	17	2	\N	\N
4903	seit	{since}	{"Seit 2020 lerne ich Deutsch.","Seit dem Abitur arbeite ich."}	2	17	\N	\N	\N
4904	semester	{term}	{"Das Semester endet im Juli.","Im nächsten Semester studiere ich im Ausland."}	2	17	3	\N	Semester
4905	separat	{separate}	{"Die Prüfungen finden separat statt.","Bitte bezahle die Gebühren separat."}	2	17	\N	\N	\N
4906	situation	{situation}	{"Die Situation im Unterricht war stressig.","In schwierigen Situationen bleibe ich ruhig."}	2	17	2	\N	Situationen
4907	städtisch	{urban}	{"Die städtische Schule ist gut ausgestattet.","Städtische Verkehrsmittel sind praktisch."}	2	17	\N	\N	\N
4908	terminplanung	{scheduling}	{"Die Terminplanung für Prüfungen ist wichtig.","Meine Terminplanung hilft mir beim Lernen."}	2	17	2	\N	\N
4909	test	{test}	{"Der Test war einfacher als erwartet.","Wir schreiben nächste Woche einen Test."}	2	17	1	\N	Tests
4910	thema	{topic}	{"Das Thema des Aufsatzes ist interessant.","Welches Thema wählst du für die Präsentation?"}	2	17	3	\N	Themen
4911	theorie	{theory}	{"Die Theorie verstehe ich, aber die Praxis ist schwer.","Wir lernen viel Theorie in der Schule."}	2	17	2	\N	\N
4912	trainieren	{"to train"}	{"Ich trainiere jeden Tag für den Sporttest.","Trainiere deine Aussprache regelmäßig!"}	2	17	\N	\N	\N
4913	training	{training}	{"Das Training für die Prüfung beginnt morgen.","Ohne Training ist Erfolg schwer."}	2	17	3	\N	\N
4914	trick	{trick}	{"Kannst du mir einen Mathe-Trick zeigen?","Dieser Trick hilft beim Lernen."}	2	17	1	\N	Tricks
4916	überschrift	{heading}	{"Die Überschrift des Artikels ist fett gedruckt.","Schreibe eine klare Überschrift!"}	2	17	2	\N	Überschriften
4917	umschreiben	{"to re-write"}	{"Kannst du den Satz umschreiben?","Ich umschreibe meine Notizen für die Prüfung."}	2	17	\N	\N	\N
4918	verlieben	{"to fall in love"}	{"Er hat sich in seine Klassenkameradin verliebt.","Verlieben ist schön, aber manchmal kompliziert."}	2	17	\N	\N	\N
4919	verlieren	{"to lose"}	{"Ich verliere oft meine Stifte.","Verliere nicht die Motivation!"}	2	17	\N	\N	\N
4920	vorbereitung	{preparation}	{"Die Vorbereitung auf die Prüfung dauert Wochen.","Ohne Vorbereitung klappt es nicht."}	2	17	2	\N	\N
4921	vorkenntnisse	{"prior knowledge"}	{"Für diesen Kurs sind Vorkenntnisse erforderlich.","Ich habe keine Vorkenntnisse in Chemie."}	2	17	\N	\N	\N
4922	vorstellungsgespräch	{interview}	{"Das Vorstellungsgespräch war erfolgreich.","Übe für das Vorstellungsgespräch!"}	2	17	3	\N	\N
4923	weiterbildung	{"further training"}	{"Weiterbildung ist wichtig für den Job.","Ich mache eine Weiterbildung in Marketing."}	2	17	2	\N	Weiterbildungen
4924	yoga	{yoga}	{"Yoga hilft mir, mich zu entspannen.","Wir machen Yoga in der Schulpause."}	2	17	3	\N	\N
4925	zeitmanagement	{"time management"}	{"Gutes Zeitmanagement ist im Studium wichtig.","Ich lerne Zeitmanagement in einem Kurs."}	2	17	3	\N	\N
4926	zertifikat	{certificate}	{"Ich erhalte ein Zertifikat nach dem Kurs.","Das Zertifikat bestätigt meine Sprachkenntnisse."}	2	17	3	\N	\N
4927	zeugnis	{certificate}	{"Mein Zeugnis hat gute Noten.","Das Zeugnis wird am Ende des Jahres ausgehändigt."}	2	17	3	\N	\N
4928	zufrieden	{satisfied}	{"Ich bin mit meinen Noten zufrieden.","Der Lehrer ist mit unserer Arbeit zufrieden."}	2	17	\N	\N	\N
4929	ansprechpartner/in	{"contact person"}	{"Fragen Sie den Ansprechpartner im Büro!","Die Ansprechpartnerin hilft bei Problemen."}	2	18	5	\N	\N
4930	aushilfsjob	{"temporary job"}	{"Ich suche einen Aushilfsjob im Café.","Der Aushilfsjob ist perfekt für Studenten."}	2	18	1	\N	\N
4931	aussehen	{"to look"}	{"Du siehst heute müde aus.","Das Dokument sieht offiziell aus."}	2	18	\N	\N	\N
4932	auszubildende (azubi)	{trainee}	{"Der Azubi lernt schnell.","Die Auszubildende arbeitet in der Bäckerei."}	2	18	5	\N	\N
4933	bäckereifachverkäufer/in	{"baker's assistant"}	{"Die Bäckereifachverkäuferin bedient die Kunden.","Er arbeitet als Bäckereifachverkäufer."}	2	18	5	\N	\N
4934	bedanken	{"to thank"}	{"Ich bedanke mich für die Hilfe.","Bedanken Sie sich beim Team!"}	2	18	\N	\N	\N
4898	realschulabschluss	{"secondary school certificate"}	{"Sie hat den Realschulabschluss bestanden.","Ohne Realschulabschluss ist die Jobsuche schwer."}	2	17	1	\N	\N
4899	reisen	{"to travel"}	{"Nach der Schule möchte ich reisen.","Reisen bildet."}	2	17	\N	\N	\N
4900	rhythmisch	{rhythmical}	{"Die Musik ist sehr rhythmisch.","Rhythmische Bewegungen helfen beim Lernen."}	2	17	\N	\N	\N
4901	schaffen	{"to succeed"}	{"Ich schaffe die Prüfung bestimmt!","Schaffst du es morgen pünktlich?"}	2	17	\N	\N	\N
4902	schulzeit	{"school days"}	{"Meine Schulzeit war sehr schön.","In der Schulzeit habe ich viel gelernt."}	2	17	2	\N	\N
4941	bieten	{"to offer"}	{"Das Unternehmen bietet flexible Arbeitszeiten.","Kannst du mir einen Rat bieten?"}	2	18	\N	\N	\N
4942	eindecken	{"to inundate"}	{"Der Markt ist mit Angeboten eingedeckt.","Wir wurden mit Fragen eingedeckt."}	2	18	\N	\N	\N
4943	genug	{enough}	{"Ich habe genug Erfahrung für den Job.","Hast du genug Zeit?"}	2	18	\N	\N	\N
4944	grundschule	{"primary school"}	{"Meine Tochter geht in die Grundschule.","Die Grundschule liegt im Zentrum."}	2	18	2	\N	\N
4945	handwerklich	{manual}	{"Er hat handwerkliche Fähigkeiten.","Handwerkliche Berufe sind gefragt."}	2	18	\N	\N	\N
4946	holz	{wood}	{"Der Tisch ist aus Holz.","Holz ist ein natürliches Material."}	2	18	3	\N	\N
4947	informatiker/in	{"IT technician"}	{"Der Informatiker repariert Computer.","Die Informatikerin programmiert Software."}	2	18	5	\N	\N
4948	kneipe	{pub}	{"Wir treffen uns in der Kneipe.","Die Kneipe hat gute Atmosphäre."}	2	18	2	\N	\N
4949	kostenfrei	{"free of charge"}	{"Die Beratung ist kostenfrei.","Kostenfreie Parkplätze sind verfügbar."}	2	18	\N	\N	\N
4950	küchenhilfe	{"kitchen assistant"}	{"Die Küchenhilfe schält Gemüse.","Er sucht eine Stelle als Küchenhilfe."}	2	18	2	\N	\N
4951	laufbahn	{"career path"}	{"Meine Laufbahn begann in der Gastronomie.","Welche Laufbahn möchtest du einschlagen?"}	2	18	2	\N	\N
4952	lebenslauf	{CV}	{"Schick mir bitte deinen Lebenslauf!","Im Lebenslauf stehen alle Stationen."}	2	18	1	\N	Lebensläufe
4953	lückenlos	{seamless}	{"Sein Lebenslauf ist lückenlos.","Lückenlos dokumentierte Erfahrung ist wichtig."}	2	18	\N	\N	\N
4954	melden	{"to notify"}	{"Melden Sie sich bitte beim Personalbüro!","Ich melde den Fehler meinem Chef."}	2	18	\N	\N	\N
4956	modedesigner/in	{"fashion designer"}	{"Die Modedesignerin entwirft Kleider.","Er ist ein bekannter Modedesigner."}	2	18	5	\N	\N
4957	muster	{pattern}	{"Das Muster des Stoffes ist schön.","Laden Sie das Bewerbungsmuster herunter!"}	2	18	3	\N	\N
4958	nötig	{necessary}	{"Englischkenntnisse sind für den Job nötig.","Hast du die nötigen Unterlagen?"}	2	18	\N	\N	\N
4959	ob	{whether}	{"Ich weiß nicht, ob die Stelle frei ist.","Frag nach, ob sie noch suchen!"}	2	18	\N	\N	\N
4960	persönlich	{personal}	{"Das ist eine persönliche Entscheidung.","Persönliche Treffen sind effektiver."}	2	18	\N	\N	\N
4961	professionell	{professional}	{"Sein Auftreten ist sehr professionell.","Professionelle Kleidung ist Pflicht."}	2	18	\N	\N	\N
4962	reinigungsarbeiten	{"cleaning jobs"}	{"Reinigungsarbeiten sind anstrengend.","Sie sucht Reinigungsarbeiten in der Stadt."}	2	18	\N	\N	\N
4963	rente	{retirement}	{"Mein Vater geht nächstes Jahr in Rente.","Die Rente reicht kaum zum Leben."}	2	18	2	\N	Renten
4964	restaurantfachmann/-frau	{"restaurant specialist"}	{"Der Restaurantfachmann organisiert Events.","Die Restaurantfachfrau berät die Gäste."}	2	18	5	\N	\N
4965	spezial	{special}	{"Das ist ein spezial Angebot für Neukunden.","Er hat spezial Kenntnisse in IT."}	2	18	\N	\N	\N
4966	statt	{instead}	{"Statt zu arbeiten, geht er ins Kino.","Nimm die Bahn statt des Autos!"}	2	18	\N	\N	\N
4967	stelle	{position}	{"Die Stelle ist bereits vergeben.","Bewirb dich für die Stelle!"}	2	18	2	\N	\N
4968	stellenangebot	{"job offer"}	{"Das Stellenangebot klingt interessant.","Wo finde ich Stellenangebote?"}	2	18	3	\N	\N
4969	stellensuche	{"job search"}	{"Die Stellensuche dauert oft lange.","Online-Portale helfen bei der Stellensuche."}	2	18	2	\N	\N
4970	struktur	{structure}	{"Der Lebenslauf hat eine klare Struktur.","Die Struktur des Unternehmens ist komplex."}	2	18	2	\N	\N
4971	sympathisch	{kind}	{"Der Chef ist sehr sympathisch.","Sympathische Kollegen machen den Job leicht."}	2	18	\N	\N	\N
4972	teilzeit	{part-time}	{"Sie arbeitet in Teilzeit.","Teilzeit ist ideal für Eltern."}	2	18	\N	\N	\N
4973	teilzeitstelle	{"part-time position"}	{"Ich suche eine Teilzeitstelle im Einzelhandel.","Die Teilzeitstelle bietet flexible Stunden."}	2	18	2	\N	\N
4936	beeilen	{"to hurry"}	{"Beeil dich, wir sind spät dran!","Ich beeile mich, den Bus zu erreichen."}	2	18	\N	\N	\N
4937	begründen	{"to justify"}	{"Begründe bitte deine Entscheidung!","Sie begründete ihre Abwesenheit."}	2	18	\N	\N	\N
4938	beratungsgespräch	{consultation}	{"Das Beratungsgespräch war sehr hilfreich.","Vereinbaren Sie ein Beratungsgespräch!"}	2	18	3	\N	\N
4939	berufsfeld	{"field of work"}	{"Mein Berufsfeld ist die IT-Branche.","Welches Berufsfeld interessiert dich?"}	2	18	1	\N	Berufsfelder
4940	bewerber/in	{applicant}	{"Der Bewerber hat einen guten Lebenslauf.","Die Bewerberin wartet auf eine Antwort."}	2	18	5	\N	\N
4980	unsympathisch	{unkind}	{"Der Kunde war sehr unsympathisch.","Ein unsympathischer Kollege macht die Arbeit schwer."}	2	18	\N	\N	\N
4981	unzufrieden	{unsatisfied}	{"Der Chef ist mit den Ergebnissen unzufrieden.","Unzufriedene Mitarbeiter kündigen oft."}	2	18	\N	\N	\N
4982	verrückt	{crazy}	{"Die Arbeitszeiten sind manchmal verrückt.","Das ist eine verrückte Idee!"}	2	18	\N	\N	\N
4983	volleyball	{volleyball}	{"Wir spielen Volleyball im Park.","Volleyball macht Spaß im Team."}	2	18	3	\N	\N
4984	vollzeit	{full-time}	{"Er arbeitet in Vollzeit als Lehrer.","Vollzeitjobs sind oft stressig."}	2	18	\N	\N	\N
4986	voraussetzung	{requirement}	{"Sprachkenntnisse sind eine Voraussetzung.","Erfüllst du die Voraussetzungen?"}	2	18	2	\N	\N
4988	zuverlässig	{reliable}	{"Er ist ein zuverlässiger Mitarbeiter.","Zuverlässige Lieferungen sind wichtig."}	2	18	\N	\N	\N
4989	accessoires (pl)	{accessories}	{"Sie trägt schöne Accessoires.","Accessoires machen das Outfit perfekt."}	2	19	2	\N	Accessoires
4990	anhaben	{"to be wearing"}	{"Was hast du heute an?","Er hat einen blauen Pullover an."}	2	19	\N	\N	\N
4991	apfelschorle	{"apple spritzer"}	{"Ich trinke gerne Apfelschorle.","Apfelschorle ist erfrischend."}	2	19	2	\N	\N
4992	aubergine	{aubergine}	{"Die Aubergine liegt im Gemüseregal.","Auberginen sind gut für Ratatouille."}	2	19	2	\N	Auberginen
4993	ausrüstung	{equipment}	{"Wir brauchen neue Camping-Ausrüstung.","Die Ausrüstung ist sehr schwer."}	2	19	2	\N	\N
4994	babyartikel	{"baby items"}	{"Babyartikel sind im dritten Regal.","Sie kauft oft Babyartikel online."}	2	19	1	\N	Babyartikel
4995	badesachen (pl)	{swimwear}	{"Vergiss die Badesachen nicht!","Badesachen gibt es im Sportgeschäft."}	2	19	2	\N	Badesachen
5000	braten	{"to roast"}	{"Wir braten Hähnchen im Ofen.","Kartoffeln kann man auch braten."}	2	19	\N	\N	\N
5001	bummeln	{"to stroll"}	{"Wir bummeln durch die Stadt.","Am Sonntag bummeln viele Leute."}	2	19	\N	\N	\N
5002	bunt	{colourful}	{"Das Bild ist sehr bunt.","Bunte Blumen wachsen im Garten."}	2	19	\N	\N	\N
5003	camping	{camping}	{"Camping macht im Sommer Spaß.","Wir planen ein Camping-Wochenende."}	2	19	3	\N	\N
5004	champignon	{mushroom}	{"Champignons schmecken in der Suppe.","Kannst du Champignons schneiden?"}	2	19	1	\N	Champignons
5005	currywurst	{currywurst}	{"Currywurst esse ich mit Pommes.","Berlin ist berühmt für Currywurst."}	2	19	2	\N	\N
5006	dame	{lady}	{"Die Dame trägt einen Hut.","Damen kaufen oft Kleider."}	2	19	2	\N	Damen
5007	darin	{"in it"}	{"Was ist darin?","Das Buch liegt darin."}	2	19	\N	\N	\N
5008	dick	{fat}	{"Der Mantel ist dick.","Dickes Papier ist stabil."}	2	19	\N	\N	\N
5009	dieb/in	{thief}	{"Der Dieb wurde gefangen.","Die Polizei sucht den Dieb."}	2	19	5	\N	\N
5010	ding	{thing}	{"Was ist das für ein Ding?","Alte Dinge kann man verkaufen."}	2	19	3	\N	Dinge
5011	duft	{smell}	{"Der Duft von Blumen ist schön.","Der Kaffee hat einen starken Duft."}	2	19	1	\N	\N
5012	dünn	{thin}	{"Das Papier ist sehr dünn.","Dünne Kleidung ist im Sommer gut."}	2	19	\N	\N	\N
5013	duschgel	{"shower gel"}	{"Ich kaufe neues Duschgel.","Duschgel riecht nach Lavendel."}	2	19	3	\N	\N
5014	egal	{equal}	{"Das ist mir egal.","Egal, was du machst, sei vorsichtig."}	2	19	\N	\N	\N
4975	tippfehler	{"typing error"}	{"Der Tippfehler im Lebenslauf ist peinlich.","Korrigiere alle Tippfehler im Text!"}	2	18	1	\N	\N
4976	tischler/in	{carpenter}	{"Der Tischler baut Möbel.","Die Tischlerin repariert die Tür."}	2	18	5	\N	\N
4977	üben	{"to practice"}	{"Ich übe für das Vorstellungsgespräch.","Übe regelmäßig deine Präsentation!"}	2	18	\N	\N	\N
4978	übersiedlung	{relocation}	{"Die Übersiedlung ins Ausland ist geplant.","Die Übersiedlung des Büros dauert eine Woche."}	2	18	2	\N	\N
4979	unprofessionell	{unprofessional}	{"Sein Verhalten war unprofessionell.","Unprofessionelle E-Mails schaden dem Image."}	2	18	\N	\N	\N
5024	gepunktet	{spotty}	{"Das Kleid ist gepunktet.","Gepunktete Tücher sind trendy."}	2	19	\N	\N	\N
5027	glatt	{smooth}	{"Die Straße ist glatt.","Glatte Haare sind leicht zu kämmen."}	2	19	\N	\N	\N
5028	glatze	{"bald head"}	{"Er trägt eine Glatze.","Eine Glatze ist pflegeleicht."}	2	19	2	\N	\N
5030	griechisch	{Greek}	{"Griechisches Essen schmeckt gut.","Ich lerne griechisch."}	2	19	\N	\N	\N
5031	gulaschsuppe	{"goulash soup"}	{"Gulaschsuppe wärmt im Winter.","Wir essen Gulaschsuppe heute."}	2	19	2	\N	\N
5033	haarpflege	{"hair care"}	{"Haarpflege ist wichtig.","Ich kaufe Haarpflege im Drogeriemarkt."}	2	19	2	\N	\N
5034	hauptgericht	{"main meal"}	{"Das Hauptgericht ist Fleisch mit Kartoffeln.","Was ist das Hauptgericht heute?"}	2	19	3	\N	\N
5035	hautpflege	{"skin care"}	{"Hautpflege braucht Zeit.","Gute Hautpflege ist teuer."}	2	19	2	\N	\N
5036	hübsch	{pretty}	{"Sie trägt ein hübsches Kleid.","Das Bild ist sehr hübsch."}	2	19	\N	\N	\N
5037	kamera	{camera}	{"Die Kamera macht schöne Fotos.","Ich habe eine neue Kamera gekauft."}	2	19	2	\N	\N
5038	kariert	{checkered}	{"Das Hemd ist kariert.","Karierte Tischdecken sind praktisch."}	2	19	\N	\N	\N
5039	kompliment	{compliment}	{"Er macht mir ein Kompliment.","Komplimente sind nett."}	2	19	3	\N	\N
5044	laufen	{"to run"}	{"Laufen ist gesund.","Kinder laufen im Park."}	2	19	2	\N	\N
5045	lieblingsfarbe	{"favourite colour"}	{"Meine Lieblingsfarbe ist blau.","Was ist deine Lieblingsfarbe?"}	2	19	2	\N	\N
5046	lockig	{curly}	{"Sie hat lockiges Haar.","Lockige Haare sind schön."}	2	19	\N	\N	\N
5047	make-up	{"make up"}	{"Sie trägt kein Make-up.","Make-up kann teuer sein."}	2	19	3	\N	\N
5048	maus	{mouse}	{"Die Maus ist klein.","Eine Computermaus ist wichtig."}	2	19	2	\N	\N
5049	mineralwasser	{"mineral water"}	{"Mineralwasser ist gesund.","Ich trinke gerne Mineralwasser."}	2	19	3	\N	\N
5050	modegeschäft	{"fashion shop"}	{"Im Modegeschäft gibt es neue Kleider.","Das Modegeschäft ist teuer."}	2	19	3	\N	\N
5051	modeschmuck	{"fashion jewellery"}	{"Modeschmuck ist günstig.","Sie trägt oft Modeschmuck."}	2	19	1	\N	\N
5052	nachher	{afterwards}	{"Wir treffen uns nachher.","Nachher gehe ich einkaufen."}	2	19	2	\N	\N
5054	navigationsgerät (navi)	{"navigation device"}	{"Das Navi zeigt den Weg.","Ohne Navi fahre ich nicht."}	2	19	3	\N	\N
5055	ofen	{oven}	{"Der Ofen ist heiß.","Wir backen Brot im Ofen."}	2	19	1	\N	\N
5056	ohrring	{earring}	{"Sie trägt silberne Ohrringe.","Ohrringe können elegant sein."}	2	19	1	\N	Ohrringe
5016	einfarbig	{monochromatic}	{"Das Hemd ist einfarbig.","Einfarbige Wände sind modern."}	2	19	\N	\N	\N
5017	elektronik	{electronics}	{"Elektronik ist teuer.","Er repariert alte Elektronik."}	2	19	2	\N	\N
5018	fahrradhelm	{"cycle helmet"}	{"Trage immer einen Fahrradhelm!","Der Fahrradhelm passt gut."}	2	19	1	\N	\N
5020	fast food	{"fast food"}	{"Fast Food ist nicht gesund.","Manchmal esse ich Fast Food."}	2	19	3	\N	\N
5021	flipflops (pl)	{"flip flops"}	{"Im Sommer trage ich Flipflops.","Flipflops sind bequem."}	2	19	2	\N	Flipflops
5022	frittieren	{"to fry"}	{"Pommes werden frittiert.","Frittieren braucht viel Öl."}	2	19	\N	\N	\N
5023	gemüselasagne	{"vegetable lasagne"}	{"Gemüselasagne ist mein Lieblingsessen.","Wir kochen Gemüselasagne heute."}	2	19	2	\N	\N
5025	gericht	{meal}	{"Das Gericht ist sehr lecker.","Heute gibt es ein neues Gericht."}	2	19	3	\N	\N
5026	gestreift	{striped}	{"Das Hemd ist gestreift.","Gestreifte Kissen sind schön."}	2	19	\N	\N	\N
5029	gold	{gold}	{"Gold ist ein Edelmetall.","Sie trägt eine Goldkette."}	2	19	3	\N	\N
5032	gürtel	{belt}	{"Der Gürtel passt zur Hose.","Kannst du den Gürtel anziehen?"}	2	19	1	\N	\N
5053	naturkosmetik	{"natural cosmetics"}	{"Naturkosmetik ist beliebt.","Ich kaufe nur Naturkosmetik."}	2	19	2	\N	\N
5095	abfall	{rubbish}	{"Der Abfall muss getrennt werden, damit er recycelt werden kann.","Ich werfe den Abfall in den Mülleimer, weil ich die Umwelt schützen möchte."}	3	2	1	\N	abfälle
5096	abflug	{departure}	{"Der Abflug ist für 18 Uhr geplant, obwohl das Wetter unsicher aussieht.","Weil der Abflug sich verspätet, müssen wir länger am Flughafen warten."}	3	2	1	\N	\N
5097	absage	{cancellation}	{"Er hat eine Absage für den Job bekommen, obwohl er gut qualifiziert war.","Die Absage kam per E-Mail, sodass er sofort Bescheid wusste."}	3	2	2	\N	\N
5063	schauen	{"to look"}	{"Schau mal da drüben!","Kinder schauen gerne Filme."}	2	19	\N	\N	\N
5064	schaufenster	{"shop window"}	{"Das Schaufenster ist dekoriert.","Wir schauen ins Schaufenster."}	2	19	3	\N	\N
5065	schick	{chic}	{"Das Kleid ist sehr schick.","Schicke Schuhe sind teuer."}	2	19	\N	\N	\N
5066	schlank	{slim}	{"Sie ist schlank und sportlich.","Schlanke Jeans sind modern."}	2	19	\N	\N	\N
5067	schmuck	{jewellery}	{"Echter Schmuck ist wertvoll.","Sie sammelt alten Schmuck."}	2	19	1	\N	\N
5068	schnäppchen	{deal}	{"Ich habe ein Schnäppchen gemacht.","Schnäppchen findet man im Sale."}	2	19	3	\N	\N
5069	schnitzel	{schnitzel}	{"Schnitzel mit Pommes ist lecker.","Das Schnitzel ist knusprig."}	2	19	3	\N	\N
5070	schnurrbart	{moustache}	{"Er hat einen dicken Schnurrbart.","Schnurrbärte sind selten geworden."}	2	19	1	\N	\N
5071	schrei	{scream}	{"Ein lauter Schrei war zu hören.","Der Schrei erschreckte alle."}	2	19	1	\N	\N
5072	schulgröße	{"shoe size"}	{"Meine Schulgröße ist 38.","Welche Schulgröße hast du?"}	2	19	2	\N	\N
5073	shorts	{shorts}	{"Im Sommer trage ich Shorts.","Shorts sind bequem."}	2	19	2	\N	\N
5074	silber	{silver}	{"Silber glänzt schön.","Sie trägt einen Silberring."}	2	19	3	\N	\N
5075	snack	{snack}	{"Ein Snack zwischendurch ist gut.","Gesunde Snacks sind wichtig."}	2	19	1	\N	Snacks
5077	steak	{steak}	{"Das Steak ist medium gebraten.","Ein gutes Steak ist teuer."}	2	19	3	\N	\N
5078	stehlen	{"to steal"}	{"Man darf nicht stehlen.","Die Diebe stehlen Geld."}	2	19	\N	\N	\N
5079	stiefel	{boot}	{"Im Winter trage ich Stiefel.","Stiefel sind warm."}	2	19	1	\N	Stiefel
5080	süßigkeiten	{sweets}	{"Kinder essen gerne Süßigkeiten.","Zu viele Süßigkeiten sind ungesund."}	2	19	2	\N	\N
5081	tattoo	{tattoo}	{"Er hat ein Tattoo auf dem Arm.","Tattoos sind für immer."}	2	19	3	\N	Tattoos
5082	toaster	{toaster}	{"Der Toaster ist kaputt.","Toast aus dem Toaster schmeckt gut."}	2	19	1	\N	\N
5083	ungarisch	{Hungarian}	{"Ungarische Gerichte sind scharf.","Ich lerne ungarisch."}	2	19	\N	\N	\N
5084	unterwäsche	{underwear}	{"Unterwäsche kaufe ich online.","Frische Unterwäsche ist wichtig."}	2	19	2	\N	\N
5085	vanilleeis	{"vanilla ice cream"}	{"Vanilleeis ist mein Favorit.","Kinder essen gerne Vanilleeis."}	2	19	3	\N	\N
5086	vegetarier/in	{vegetarian}	{"Sie ist Vegetarierin.","Vegetarier essen kein Fleisch."}	2	19	5	\N	\N
5087	vegetarisch	{vegetarian}	{"Das Gericht ist vegetarisch.","Vegetarisches Essen ist gesund."}	2	19	\N	\N	\N
5088	wandern	{"to hike"}	{"Wir wandern im Gebirge.","Wandern macht Spaß."}	2	19	\N	\N	\N
5089	wanderschuh	{"hiking shoes"}	{"Gute Wanderschuhe sind wichtig.","Ich kaufe neue Wanderschuhe."}	2	19	1	\N	Wanderschuhe
5090	wecker	{alarm}	{"Der Wecker klingelt um sieben.","Ohne Wecker verschlafe ich."}	2	19	1	\N	\N
5091	wirklich	{really}	{"Das ist wirklich schön.","Bist du wirklich müde?"}	2	19	\N	\N	\N
5092	wunderbar	{wonderful}	{"Das Wetter ist wunderbar.","Ein wunderbarer Tag!"}	2	19	\N	\N	\N
5093	zubereiten	{"to prepare"}	{"Ich bereite das Essen zu.","Kannst du den Tee zubereiten?"}	2	19	\N	\N	\N
5094	zucchini	{zucchini}	{"Zucchini schmecken gut im Salat.","Wir pflanzen Zucchini im Garten."}	2	19	2	\N	\N
4519	aussuchen	{"to choose"}	{"Such dir ein Geschenk aus!","Wir haben einen Film ausgesucht."}	2	13	\N	\N	\N
5058	pfanne	{pan}	{"Die Pfanne ist aus Eisen.","In der Pfanne brate ich Eier."}	2	19	2	\N	\N
5059	plötzlich	{suddenly}	{"Plötzlich regnet es.","Er stand plötzlich auf."}	2	19	5	\N	\N
5060	polizist/in	{policeman}	{"Der Polizist hilft der Frau.","Polizisten arbeiten hart."}	2	19	5	\N	\N
5061	schafskäse	{"feta cheese"}	{"Schafskäse schmeckt salzig.","Ich esse Salat mit Schafskäse."}	2	19	1	\N	\N
5062	scharf	{spicy}	{"Das Essen ist zu scharf.","Scharfe Soßen mag ich."}	2	19	\N	\N	\N
5098	aktiv	{active}	{"Er ist sportlich und sehr aktiv, weil er jeden Tag trainiert.","Ich bleibe auch im Winter aktiv, indem ich Ski fahre oder schwimme."}	3	2	\N	\N	\N
5099	alkohol	{alcohol}	{"Alkohol ist in dieser Einrichtung verboten, weil er Probleme verursachen kann.","Er trinkt nur selten Alkohol, obwohl seine Freunde es oft tun."}	3	2	1	\N	\N
5100	angenehm	{pleasant}	{"Das Wetter ist heute sehr angenehm, sodass wir spazieren gehen können.","Ich wünsche Ihnen einen angenehmen Tag, obwohl es später regnen soll."}	3	2	\N	\N	\N
5101	annulliert	{cancelled}	{"Der Flug wurde annulliert, weil der Pilotenstreik andauert.","Die Buchung wurde vom Hotel annulliert, obwohl wir schon bezahlt hatten."}	3	2	\N	\N	\N
5102	anzeigetafel	{"bulletin board"}	{"Die Abfahrtszeiten stehen auf der Anzeigetafel, die im Bahnhof hängt.","Er schaut auf die Anzeigetafel, weil er seinen Zug sucht."}	3	2	2	\N	anzeigetafeln
5103	aufruf	{call}	{"Der Aufruf zur Teilnahme wurde ignoriert, obwohl er wichtig war.","Ein lauter Aufruf ertönte im Gebäude, sodass alle aufmerksam wurden."}	3	2	1	\N	\N
5104	ausgang	{exit}	{"Der Ausgang ist auf der linken Seite, wenn man vom Haupteingang kommt.","Bitte benutzen Sie den hinteren Ausgang, weil der vordere blockiert ist."}	3	2	1	\N	ausgänge
5105	ausstattung	{equipment}	{"Die Ausstattung des Zimmers ist modern, obwohl das Hotel alt aussieht.","Die Schule hat eine neue Ausstattung erhalten, damit die Schüler besser lernen können."}	3	2	2	\N	\N
5106	behälter	{container}	{"Ich fülle Wasser in den Behälter, der aus recyclebarem Material besteht.","Der Behälter ist aus Plastik, obwohl wir nachhaltige Alternativen suchen."}	3	2	1	\N	behälter
5107	betreten	{"to enter"}	{"Bitte nicht den Rasen betreten, weil er neu gepflanzt wurde.","Er durfte das Gebäude nicht betreten, obwohl er einen Termin hatte."}	3	2	\N	\N	\N
5108	bewohner/in	{resident}	{"Die Bewohner des Hauses sind freundlich, obwohl sie wenig Zeit haben.","Jede Bewohnerin hat ein eigenes Zimmer, damit Privatsphäre gewährleistet ist."}	3	2	5	\N	bewohner/innen
5109	bordkarte	{"boarding pass"}	{"Zeigen Sie bitte Ihre Bordkarte, die Sie online ausgedruckt haben.","Die Bordkarte ist beim Eingang nötig, weil sonst der Zutritt verweigert wird."}	3	2	2	\N	\N
5110	camper/in	{camper}	{"Die Camper genießen die Natur, obwohl es manchmal regnet.","Jeder Camper braucht einen Schlafsack, weil die Nächte kalt sind."}	3	2	5	\N	camper/innen
5111	campingplatz	{campsite}	{"Wir schlafen heute auf einem Campingplatz, der nah am See liegt.","Der Campingplatz ist gut ausgestattet, sodass wir nichts vermissen."}	3	2	1	\N	campingplätze
5112	check-in-schalter	{"check-in desk"}	{"Bitte gehen Sie zum Check-in-Schalter, der sich in Zone B befindet.","Der Check-in-Schalter ist geschlossen, weil die Mitarbeiter eine Pause machen."}	3	2	2	\N	\N
5113	container	{container}	{"Der Container ist sehr schwer, weil er voller Werkzeuge ist.","Wir lagern das Material im Container, damit es vor Regen geschützt ist."}	3	2	3	\N	container
5114	dienstreise	{"business trip"}	{"Ich bin nächste Woche auf Dienstreise, obwohl ich lieber im Büro bleibe.","Die Dienstreise dauert drei Tage, sodass ich viel organisieren muss."}	3	2	2	\N	\N
5115	doppelbett	{"double bed"}	{"Wir schlafen in einem Doppelbett, das sehr bequem ist.","Das Doppelbett ist sehr bequem, obwohl es etwas zu klein wirkt."}	3	2	3	\N	doppelbetten
5116	doppelzimmer	{"double room"}	{"Wir haben ein Doppelzimmer gebucht, weil wir zusammen reisen.","Das Doppelzimmer hat ein großes Fenster, durch das man die Berge sieht."}	3	2	3	\N	doppelzimmer
5117	einchecken	{"to check-in"}	{"Wir müssen vor 18 Uhr einchecken, sonst verfällt unsere Reservierung.","Bitte beim Hotel einchecken, indem Sie Ihren Ausweis vorzeigen."}	3	2	\N	\N	\N
5118	einsteigezeit	{"boarding time"}	{"Die Einsteigezeit ist um 15 Uhr, obwohl der Flug später startet.","Bitte beachten Sie die Einsteigezeit, damit es keine Verzögerungen gibt."}	3	2	2	\N	\N
5119	einzelzimmer	{"single room"}	{"Ich möchte ein Einzelzimmer reservieren, weil ich alleine reise.","Das Einzelzimmer kostet weniger, obwohl es genauso komfortabel ist."}	3	2	3	\N	einzelzimmer
5120	erleben	{"to experience"}	{"Ich möchte etwas Neues erleben, indem ich fremde Kulturen kennenlerne.","Auf der Reise kannst du viel erleben, wenn du offen für Abenteuer bist."}	3	2	\N	\N	\N
5121	flug	{flight}	{"Ich habe meinen Flug nach Berlin gebucht, obwohl ich Flugangst habe.","Der Flug von München nach Frankfurt dauert etwa eine Stunde, sodass wir schnell ankommen."}	3	2	1	\N	flüge
5122	flugbegleiter/in	{"flight attendant"}	{"Der Flugbegleiter hat uns die Sicherheitsvorkehrungen erklärt, weil es Pflicht ist.","Die Flugbegleiterin servierte das Essen während des Flugs, obwohl es Turbulenzen gab."}	3	2	5	\N	flugbegleiter/innen
5123	fluggast	{passenger}	{"Der Fluggast muss sich während des Fluges anschnallen, weil es sicherer ist.","Alle Fluggäste sollten ihren Pass bereit halten, damit der Check-in schneller geht."}	3	2	1	\N	fluggäste
5124	fluggesellschaft	{airline}	{"Wir fliegen mit einer internationalen Fluggesellschaft, die gute Bewertungen hat.","Die Fluggesellschaft bietet kostenfreie Mahlzeiten an, obwohl die Tickets günstig sind."}	3	2	2	\N	fluggesellschaften
5125	führen	{"to lead"}	{"Er führt die Gruppe zum Gate, das sich in Terminal B befindet.","Die Reiseleiterin führt uns durch die Sehenswürdigkeiten, weil sie die Stadt gut kennt."}	3	2	\N	\N	\N
5126	füttern	{"to feed"}	{"Er füttert die Tauben im Park, obwohl es verboten ist.","Die Flugbegleiterin fütterte die Passagiere mit Snacks, während der Flug ruhig verlief."}	3	2	\N	\N	\N
5127	gate	{gate}	{"Wir müssen noch zum Gate E8 gehen, das am Ende des Terminals liegt.","Das Gate für unseren Flug wurde geändert, deshalb laufen wir schnell."}	3	2	3	\N	\N
5128	gepäck	{luggage}	{"Mein Gepäck ist nach dem Flug noch nicht angekommen, obwohl ich es aufgegeben habe.","Vergiss nicht, dein Gepäck vom Band zu nehmen, bevor du den Flughafen verlässt."}	3	2	3	\N	\N
5129	gepäckausgabe	{"baggage reclaim"}	{"Die Gepäckausgabe befindet sich im Erdgeschoss, wo viele Menschen warten.","Wir warten seit zehn Minuten an der Gepäckausgabe, weil das Band defekt ist."}	3	2	2	\N	\N
5130	gepäckband	{"luggage belt"}	{"Das Gepäckband ist sehr voll heute, weil viele Flüge gelandet sind.","Schau nach deinem Gepäck auf dem Gepäckband, das sich langsam bewegt."}	3	2	3	\N	\N
5131	gestattet sein	{"to be permitted"}	{"Es ist gestattet, ein Handgepäckstück mitzunehmen, solange es die Größe nicht überschreitet.","Tiere sind auf diesem Flug nicht gestattet, weil es Allergiker gibt."}	3	2	\N	\N	\N
5132	halbpension	{half-board}	{"Wir haben Halbpension in unserem Hotel gebucht, damit wir flexibel sind.","Halbpension beinhaltet Frühstück und Abendessen, obwohl Mittagessen extra kostet."}	3	2	2	\N	(hp)
5133	handgepäck	{"hand luggage"}	{"Das Handgepäck muss unter dem Sitz verstaut werden, weil es sonst stört.","Achte darauf, dass dein Handgepäck die Gewichtsbeschränkung nicht überschreitet, sonst musst du zahlen."}	3	2	3	\N	\N
5134	historisch	{historical}	{"Das Schloss ist ein historisches Gebäude, das im 15. Jahrhundert gebaut wurde.","Berlin hat viele historische Sehenswürdigkeiten, die Touristen anziehen."}	3	2	\N	\N	\N
5135	hostel	{hostel}	{"Wir übernachten in einem Hostel in der Stadt, das günstige Preise anbietet.","Das Hostel bietet günstige Preise für junge Reisende, obwohl es sehr sauber ist."}	3	2	3	\N	\N
5136	hygienisch	{hygienic}	{"Die sanitären Einrichtungen im Hostel sind sehr hygienisch, weil sie täglich gereinigt werden.","Achte darauf, dass du beim Essen hygienisch vorgehst, um Krankheiten zu vermeiden."}	3	2	\N	\N	\N
5137	inlineskaten	{"inline skating"}	{"Inlineskaten macht im Sommer besonders viel Spaß, wenn die Wege trocken sind.","Sie fährt gerne Inlineskaten im Park, obwohl sie manchmal stürzt."}	3	2	3	\N	\N
5138	jugendherberge	{"youth hostel"}	{"Wir haben in einer Jugendherberge übernachtet, die nah am Stadtzentrum liegt.","Die Jugendherberge bietet günstige Zimmer für Studenten, weil sie gemeinnützig ist."}	3	2	2	\N	jugendherbergen
5139	katalog	{catalogue}	{"Ich habe den neuen Katalog für Ferienreisen erhalten, den ich durchblättere.","Im Katalog stehen viele verschiedene Urlaubsangebote, die alle im Preis enthalten sind."}	3	2	1	\N	kataloge
5140	klettern	{"to climb"}	{"Er möchte in den Alpen klettern, obwohl er noch Anfänger ist.","Klettern macht mir viel Spaß, besonders in den Bergen, wo die Aussicht toll ist."}	3	2	\N	\N	\N
5141	komfortabel	{comfortable}	{"Das Hotelzimmer ist sehr komfortabel, weil es einen großen Fernseher hat.","Der Stuhl im Flugzeug ist nicht sehr komfortabel, obwohl die Reise lang ist."}	3	2	\N	\N	\N
5142	lage	{site}	{"Die Lage des Hotels ist ideal für Touristen, weil es nah an den Sehenswürdigkeiten liegt.","Die Lage des Flughafens ist außerhalb der Stadt, sodass man ein Taxi nehmen muss."}	3	2	2	\N	\N
5143	lagerfeuer	{campfire}	{"Wir haben am Lagerfeuer gesessen und Lieder gesungen, während die Sterne leuchteten.","Das Lagerfeuer brannte die ganze Nacht, obwohl es windig war."}	3	2	3	\N	\N
5144	landen	{"to land"}	{"Das Flugzeug wird bald landen, weil der Pilot die Landung vorbereitet.","Wir landeten sicher am Flughafen, obwohl es stark regnete."}	3	2	\N	\N	\N
5145	lärm	{noise}	{"Der Lärm im Flughafen war unerträglich, weil viele Menschen gleichzeitig sprachen.","Es war viel Lärm während des Festivals, sodass ich Kopfschmerzen bekam."}	3	2	1	\N	\N
5146	lautsprecherdurchsage	{"tannoy announcement"}	{"Die Lautsprecherdurchsage informierte uns über die Verspätung, die wegen des Wetters entstand.","Wir hörten eine Lautsprecherdurchsage über den nächsten Flug, der gestrichen wurde."}	3	2	2	\N	lautsprecherdurchsagen
5147	lebhaft	{lively}	{"Die Stadt war lebhaft und voller Touristen, weil ein Festival stattfand.","Der Markt war sehr lebhaft mit vielen Menschen, die Obst und Gemüse kauften."}	3	2	\N	\N	\N
5148	leine	{rope}	{"Ich binde das Zelt mit einer Leine fest, damit es nicht wegfliegt.","Die Leine war stark genug, um das Boot zu sichern, obwohl der Sturm tobte."}	3	2	2	\N	\N
5149	leuchtturm	{lighthouse}	{"Der Leuchtturm auf der Insel ist sehr alt, aber immer noch in Betrieb.","Wir besuchten den Leuchtturm am Meer, weil er eine tolle Aussicht bietet."}	3	2	1	\N	leuchttürme
5150	meerblick	{seaview}	{"Das Hotelzimmer hat einen schönen Meerblick, der jeden Morgen beeindruckt.","Wir genießen den Meerblick vom Balkon aus, während die Sonne untergeht."}	3	2	1	\N	\N
5151	mitten	{middle}	{"Das Café liegt mitten in der Stadt, sodass es leicht zu finden ist.","Sie trafen sich mitten auf der Brücke, weil es ein romantischer Ort ist."}	3	2	\N	\N	\N
5152	nebel	{fog}	{"Der Nebel war heute Morgen sehr dicht, sodass man kaum etwas sehen konnte.","Im Nebel konnte man kaum etwas sehen, obwohl die Straßenlaternen brannten."}	3	2	1	\N	\N
5153	neblig	{foggy}	{"Das Wetter ist heute neblig und kühl, deshalb trage ich eine Jacke.","Die Straßen sind bei nebligem Wetter gefährlich, weil die Sicht schlecht ist."}	3	2	\N	\N	\N
5154	paradies	{paradise}	{"Die Insel ist ein wahres Paradies, weil die Natur unberührt ist.","Sie fühlte sich wie im Paradies, als sie den Strand sah."}	3	2	3	\N	\N
5155	passagier/in	{passenger}	{"Der Passagier hat sein Gepäck verloren, obwohl es markiert war.","Die Passagierin bat um eine Decke, weil ihr kalt war."}	3	2	5	\N	passagiere
5156	passkontrolle	{"passport control"}	{"Bei der Passkontrolle mussten wir warten, weil viele Reisende da waren.","Die Passkontrolle am Flughafen war streng, obwohl wir nichts Verbotenes dabeihatten."}	3	2	2	\N	\N
5157	pilotenstreik	{"pilot strike"}	{"Der Pilotenstreik hat viele Flüge gestrichen, sodass wir umbuchen mussten.","Wegen des Pilotenstreiks gab es Verspätungen, die unseren Urlaub verzögerten."}	3	2	1	\N	\N
5158	pool	{pool}	{"Der Pool im Hotel ist sehr sauber, weil er täglich gereinigt wird.","Kinder spielen gerne im Pool, obwohl das Wasser kalt ist."}	3	2	3	\N	\N
5159	rechtzeitig	{"on time"}	{"Wir sind rechtzeitig zum Meeting gekommen, weil wir früh losfuhren.","Bitte seid rechtzeitig am Bahnhof, damit wir den Zug nicht verpassen."}	3	2	\N	\N	\N
5160	reisebüro	{"travel agency"}	{"Das Reisebüro hat unsere Tour gebucht, die alle Sehenswürdigkeiten umfasst.","Im Reisebüro gibt es viele Angebote, weil die Saison bald beginnt."}	3	2	1	\N	\N
5161	reiseplan	{itinerary}	{"Unser Reiseplan ist sehr straff, weil wir viel sehen wollen.","Hast du den Reiseplan schon gesehen, der alle Aktivitäten auflistet?"}	3	2	1	\N	reisepläne
5162	reiseplanung	{"travel planning"}	{"Die Reiseplanung dauert lange, weil wir alles perfekt organisieren wollen.","Gute Reiseplanung vermeidet Probleme, die während der Reise auftreten könnten."}	3	2	2	\N	\N
5163	reiten	{"to ride"}	{"Sie reitet jeden Morgen, weil es ihr hilft, Stress abzubauen.","Kannst du reiten lernen, obwohl du Angst vor Pferden hast?"}	3	2	\N	\N	\N
5164	ruhezeit	{"rest period"}	{"In der Ruhezeit ist es leise, weil niemand laut sein darf.","Die Ruhezeit beginnt um 22 Uhr, sodass alle Gäste schlafen können."}	3	2	2	\N	ruhezeiten
5165	sauber	{clean}	{"Die Wohnung ist sauber und ordentlich, weil wir täglich putzen.","Bitte haltet die Küche sauber, damit es keine Schädlinge gibt."}	3	2	\N	\N	\N
5166	sauberkeit	{cleanliness}	{"Die Sauberkeit im Hotel war vorbildlich, weil das Personal sehr fleißig ist.","Sauberkeit ist sehr wichtig, besonders in Gemeinschaftsräumen."}	3	2	2	\N	\N
5167	schalter	{desk}	{"Am Schalter gab es Informationen, die uns weiterhalfen.","Der Schalter schließt um 18 Uhr, obwohl noch viele Kunden warten."}	3	2	1	\N	schalter
5168	schlange	{snake}	{"Eine Schlange kroch über den Weg, während wir wanderten.","Die Schlange ist ungiftig, obwohl sie gefährlich aussah."}	3	2	2	\N	\N
5169	sonnenschirm	{parasol}	{"Der Sonnenschirm schützt vor der Sonne, die heute sehr stark ist.","Wir brauchen einen neuen Sonnenschirm, weil der alte kaputt ist."}	3	2	1	\N	sonnenschirme
5170	sonnenterrasse	{"sun terrace"}	{"Die Sonnenterrasse ist beliebt, weil man dort gut entspannen kann.","Auf der Sonnenterrasse kann man relaxen, während man aufs Meer blickt."}	3	2	2	\N	sonnenterrassen
5171	sonnenuntergang	{sunset}	{"Der Sonnenuntergang war atemberaubend, weil der Himmel rot leuchtete.","Wir schauten den Sonnenuntergang an, während das Meer ruhig war."}	3	2	1	\N	sonnenuntergänge
5172	stern	{star}	{"Der Stern leuchtet hell am Himmel, obwohl die Stadtbeleuchtung stark ist.","Sie wünschte sich etwas beim Stern, den sie am Horizont sah."}	3	2	1	\N	sterne
5173	stören	{"to disturb"}	{"Bitte störe mich nicht, weil ich gerade an einem wichtigen Projekt arbeite.","Der Lärm, der aus der Nachbarwohnung kommt, stört die anderen Bewohner."}	3	2	\N	\N	\N
5174	streichholz	{match}	{"Obwohl ein Streichholz klein ist, reicht es aus, um das Lagerfeuer anzuzünden.","Das Streichholz, das auf dem nassen Boden lag, funktionierte nicht mehr."}	3	2	3	\N	streichhölzer
5175	streiken	{"to strike"}	{"Die Arbeiter wollen streiken, weil sie faire Löhne und bessere Arbeitsbedingungen fordern.","Die Busfahrer, die seit Wochen unzufrieden sind, streiken ab morgen."}	3	2	\N	\N	\N
5176	taschenlampe	{torch}	{"Die Taschenlampe, die ich im Campingladen gekauft habe, ist extrem hell.","Nimm die Taschenlampe mit, damit wir nachts den Weg finden können."}	3	2	2	\N	\N
5177	taschenmesser	{"pocket knife"}	{"Das Taschenmesser, das er immer in der Tasche trägt, ist sehr scharf und praktisch.","Er benutzte ein Taschenmesser, um die Verpackung des Proviants zu öffnen."}	3	2	3	\N	\N
5178	traumhaft	{wonderful}	{"Das Essen im Restaurant war so traumhaft lecker, dass wir beschlossen, es weiterzuempfehlen.","Obwohl es Winter war, hatten wir traumhaft schönes Wetter am Strand."}	3	2	\N	\N	\N
5179	übernachten	{"to stay overnight"}	{"Wir übernachten im Hotel, das direkt am See liegt und einen fantastischen Ausblick bietet.","Können wir hier übernachten, wenn wir keinen Campingplatz finden?"}	3	2	\N	\N	\N
5180	übernachtung	{"overnight stay"}	{"Die Übernachtung, die wir online gebucht hatten, war überraschend komfortabel und ruhig.","Die Übernachtung kostet 80 Euro, obwohl das Frühstück nicht enthalten ist."}	3	2	2	\N	übernachtungen
5181	übernachtung mit frühstück	{"overnight stay with breakfast"}	{"Die Übernachtung mit Frühstück, die wir gewählt haben, ist ideal für Reisende mit kleinem Budget.","Buchen Sie eine Übernachtung mit Frühstück, damit Sie sich morgens keine Sorgen machen müssen."}	3	2	2	\N	üf
5182	umgebung	{surroundings}	{"Die Umgebung, in der das Hotel liegt, ist ruhig und perfekt zum Entspannen.","Erkunde die Umgebung des Hotels, während du einen Morgenspaziergang machst."}	3	2	2	\N	\N
5183	umgehend	{immediately}	{"Bitte antworte umgehend, da die Reservierung sonst storniert wird.","Die Reparatur muss umgehend erfolgen, um größere Schäden am Gebäude zu vermeiden."}	3	2	\N	\N	\N
5184	verärgert	{annoyed}	{"Er war verärgert, weil der Flug wegen eines Streiks drei Stunden Verspätung hatte.","Sie schaute verärgert drein, obwohl sie versuchte, höflich zu bleiben."}	3	2	\N	\N	\N
5185	verreisen	{"to travel"}	{"Wir verreisen nächste Woche, obwohl das Wetter unbeständig sein soll.","Sie verreist gerne im Sommer, wenn die Tage lang und warm sind."}	3	2	\N	\N	\N
5186	verschieben	{"to postpone"}	{"Wir müssen den Termin verschieben, weil ein wichtiges Dokument fehlt.","Das Spiel, das für heute geplant war, wurde wegen starken Regens verschoben."}	3	2	\N	\N	\N
5187	wanderer	{hiker}	{"Der Wanderer, der alleine unterwegs war, verlor den Weg im dichten Wald.","Ein Wanderer, der die Gegend nicht kannte, fragte uns nach dem richtigen Pfad."}	3	2	1	\N	\N
5188	wandertour	{"walking tour"}	{"Die Wandertour, die wir gestern unternommen haben, war anstrengend aber lohnenswert.","Planen Sie eine Wandertour, obwohl das Wetterbericht Gewitter vorhersagt?"}	3	2	2	\N	wandertouren
5189	waschraum	{"laundry room"}	{"Der Waschraum, den alle Gäste nutzen können, befindet sich im Erdgeschoss des Hostels.","Die Waschräume, die täglich gereinigt werden, sind immer hygienisch und sauber."}	3	2	1	\N	waschräume
5190	wohnwagen	{caravan}	{"Der Wohnwagen, den sie gemietet haben, ist geräumig und modern ausgestattet.","Sie reisen mit einem Wohnwagen, um flexibel und unabhängig zu sein."}	3	2	1	\N	\N
5191	zelt	{tent}	{"Das Zelt, das wir letztes Jahr gekauft haben, steht bereits im Wald bereit.","Wir brauchen ein neues Zelt, weil das alte beim letzten Sturm kaputtgegangen ist."}	3	2	1	\N	\N
5192	zoll	{customs}	{"Der Zoll, der für die Einreisekontrolle zuständig ist, überprüfte unser Gepäck sehr genau.","Am Zoll gab es eine lange Verzögerung, weil viele Passagiere kontrolliert werden mussten."}	3	2	1	\N	\N
5193	zuschlag	{fees}	{"Der Zuschlag, den wir für die Expresslieferung zahlen mussten, betrug 15 Euro.","Für Gepäck über 20 kg gibt es einen Zuschlag, obwohl das selten kontrolliert wird."}	3	2	1	\N	zuschläge
5194	absprechen	{"to arrange"}	{"Lass uns den Termin absprechen, bevor der Chef ins Meeting geht.","Wir müssen die Zeit absprechen, weil sonst niemand Bescheid weiß."}	3	3	\N	\N	\N
5195	abstellplatz	{"parking space"}	{"Der Parkplatz ist voll, obwohl es früh am Morgen ist.","Hier ist ein Abstellplatz für Fahrräder, der überdacht und sicher ist."}	3	3	1	\N	abstellplätze
5196	akzeptieren	{"to accept"}	{"Kannst du meine Entschuldigung akzeptieren, obwohl ich zu spät kam?","Sie akzeptiert Kreditkarten, weil viele Kunden danach fragen."}	3	3	\N	\N	\N
5197	anstreichen	{"to paint"}	{"Wir streichen das Zimmer an, damit es frischer aussieht.","Er hat den Zaun grün angestrichen, obwohl die Nachbarn es hässlich finden."}	3	3	\N	\N	\N
5198	ärger	{trouble}	{"Das gibt Ärger mit dem Nachbarn, wenn wir weiterhin laut sind.","Warum hast du Ärger, obwohl du nichts falsch gemacht hast?"}	3	3	1	\N	\N
5199	ärgerlich	{annoying}	{"Das Warten ist ärgerlich, weil wir schon eine Stunde zu spät sind.","Seine Frage war ärgerlich, obwohl er es nicht böse meinte."}	3	3	\N	\N	\N
5200	aufregung	{commotion}	{"Warum gibt es so viel Aufregung, wenn doch alles geklappt hat?","Die Aufregung war unnötig, weil es nur ein Missverständnis war."}	3	3	2	\N	\N
5201	ausnahme	{exception}	{"Das ist eine seltene Ausnahme, die wir nur einmal genehmigen.","Keine Ausnahmen, bitte! Auch wenn es schwierig ist."}	3	3	2	\N	\N
5202	balkongeländer	{"balcony railing"}	{"Das Balkongeländer ist neu, weil das alte rostig war.","Vorsicht am Balkongeländer, wenn Kinder im Haus sind!"}	3	3	3	\N	\N
5203	befestigen	{"to secure"}	{"Befestige das Bild an der Wand, bevor es herunterfällt.","Der Schuh ist nicht befestigt, deshalb rutscht er immer ab."}	3	3	\N	\N	\N
5204	behalten	{"to keep"}	{"Darf ich den Stift behalten, wenn du ihn nicht mehr brauchst?","Sie behält immer Ruhe, auch wenn alle anderen stressen."}	3	3	\N	\N	\N
5205	beleidigen	{"to offend"}	{"Man soll niemanden beleidigen, auch wenn man wütend ist.","Warum beleidigst du mich, obwohl ich dir geholfen habe?"}	3	3	\N	\N	\N
5206	beleidigung	{insult}	{"Das war eine schlimme Beleidigung, die er nicht vergessen wird.","Beleidigungen tun weh, auch wenn sie nicht ernst gemeint sind."}	3	3	2	\N	beleidigungen
5207	berechtigt	{justified}	{"Deine Frage ist berechtigt, weil niemand die Regel versteht.","Sie ist berechtigt, sauer zu sein, nachdem man sie ignoriert hat."}	3	3	\N	\N	\N
5208	beschimpfen	{"to insult"}	{"Er beschimpft den Fahrer, obwohl er selbst Schuld am Stau ist.","Beschimpf mich nicht! Auch wenn du recht hast."}	3	3	\N	\N	\N
5209	beschimpfung	{swear}	{"Beschimpfungen sind verboten, weil sie das Klima vergiften.","Er hörte laute Beschimpfungen, als der Streit eskalierte."}	3	3	2	\N	beschimpfungen
5210	beschweren	{"to complain"}	{"Sie beschwert sich über das Essen, weil es zu kalt serviert wurde.","Ich möchte mich beschweren, obwohl ich normalerweise geduldig bin."}	3	3	\N	\N	\N
5211	blumentopf	{"flower pot"}	{"Der Blumentopf ist aus Ton, damit die Wurzeln atmen können.","Blumentöpfe brauchen Löcher, weil sonst das Wasser stehen bleibt."}	3	3	1	\N	blumentöpfe
5212	bohren	{"to drill"}	{"Er bohrt ein Loch in die Wand, obwohl es verboten ist.","Darf ich hier bohren, oder stört das die Nachbarn?"}	3	3	\N	\N	\N
5213	deswegen	{"that is why"}	{"Deswegen bin ich hier: um das Problem zu klären.","Ich mag deswegen keinen Kaffee, weil er mir Bauchschmerzen macht."}	3	3	\N	\N	\N
5214	dumm	{stupid}	{"Das war eine dumme Idee, weil niemand sie verstanden hat!","Ich fühle mich dumm, obwohl ich viel gelernt habe."}	3	3	\N	\N	\N
5215	eilig	{urgent}	{"Hast du es eilig, weil der Zug gleich fährt?","Die Sache ist sehr eilig, deshalb müssen wir jetzt handeln."}	3	3	\N	\N	\N
5216	einhalten	{"to comply"}	{"Wir müssen die Regeln einhalten, auch wenn sie streng sind.","Er hält die Versprechen nicht ein, obwohl er es versprochen hat."}	3	3	\N	\N	\N
5217	einlegen	{"to insert"}	{"Leg die Batterie ein, bevor das Gerät kaputt geht.","Sie legt eine Pause ein, weil sie müde ist."}	3	3	\N	\N	\N
5218	einstellen	{"to set up"}	{"Stell die Uhr richtig ein, damit wir pünktlich sind.","Wir stellen die Heizung ein, weil es zu kalt wird."}	3	3	\N	\N	\N
5219	enden	{"to end"}	{"Der Film endet um 20 Uhr, obwohl er länger dauern sollte.","Wann endet die Sitzung, wenn wir später anfangen?"}	3	3	\N	\N	\N
5220	entscheidung	{decision}	{"Das ist eine schwere Entscheidung, weil sie alles verändert.","Treffe eine Entscheidung, bevor es zu spät ist!"}	3	3	2	\N	entscheidungen
5221	entspannend	{relaxing}	{"Yoga ist sehr entspannend, weil es den Stress reduziert.","Ein entspannender Urlaub ist wichtig, obwohl er teuer sein kann."}	3	3	\N	\N	\N
5222	entsprechen	{"to correspond to"}	{"Das entspricht nicht der Wahrheit, auch wenn du es glaubst.","Entspricht es deinen Plänen, wenn wir morgen anfangen?"}	3	3	\N	\N	\N
5223	erhöhen	{"to increase"}	{"Die Preise erhöhen sich, obwohl die Qualität gleich bleibt.","Er erhöht die Lautstärke, weil er nichts hören kann."}	3	3	\N	\N	\N
5224	erleichtern	{"to relieve"}	{"Das erleichtert die Arbeit, weil es weniger Fehler gibt.","Es erleichtert mich sehr, dass alles geklappt hat."}	3	3	\N	\N	\N
5225	erwähnen	{"to mention"}	{"Erwähnst du meinen Namen, wenn du mit ihm sprichst?","Sie erwähnte das Problem, obwohl es unangenehm war."}	3	3	\N	\N	\N
5226	eskalieren	{"to escalate"}	{"Der Streit eskaliert schnell, weil niemand zuhört.","Die Lage könnte eskalieren, wenn wir nicht handeln."}	3	3	\N	\N	\N
5227	exotisch	{exotic}	{"Das Restaurant ist exotisch, weil es Gerichte aus aller Welt anbietet.","Exotische Tiere leben hier, obwohl das Klima nicht ideal ist."}	3	3	\N	\N	\N
5228	fair	{fair}	{"Das ist nicht fair, weil du alle Regeln ignorierst!","Sei fair zu allen, auch wenn es schwierig ist."}	3	3	\N	\N	\N
5229	festkleben	{"to stick"}	{"Kleb das Poster fest, bevor es herunterfällt.","Der Aufkleber klebt fest, obwohl er alt ist."}	3	3	\N	\N	\N
5230	freude	{joy}	{"Das macht mir Freude, weil ich gerne helfe.","Die Kinder lachen vor Freude, als sie das Geschenk sahen."}	3	3	2	\N	\N
5231	frist	{deadline}	{"Die Frist ist nächste Woche, deshalb müssen wir uns beeilen.","Halte die Frist ein, auch wenn es stressig ist!"}	3	3	2	\N	fristen
5232	fristgerecht	{punctual}	{"Die Aufgabe war fristgerecht, obwohl es Probleme gab.","Bitte liefer fristgerecht, weil wir sonst Strafen zahlen!"}	3	3	\N	\N	\N
5233	fristlos	{"without notice"}	{"Er bekam eine fristlose Kündigung, weil er gegen Regeln verstieß.","Fristlos entlassen zu werden, ist sehr belastend."}	3	3	\N	\N	\N
5234	gemeinschaftsraum	{"common room"}	{"Wir treffen uns im Gemeinschaftsraum, weil er groß und hell ist.","Der Gemeinschaftsraum ist groß, obwohl er selten genutzt wird."}	3	3	1	\N	gemeinschaftsräume
5235	gesetzlich	{legal}	{"Das ist gesetzlich erlaubt, auch wenn es seltsam erscheint.","Gesetzliche Regelungen beachten, weil sie sonst Ärger geben."}	3	3	\N	\N	\N
5236	hämmern	{"to hammer"}	{"Er hämmert an der Wand, obwohl es schon spät ist.","Kannst du nicht leiser hämmern, weil die Nachbarn schlafen?"}	3	3	\N	\N	\N
5237	heizen	{"to heat"}	{"Wir heizen mit Gas, weil es billiger ist als Strom.","Im Winter muss man heizen, obwohl es teuer ist."}	3	3	\N	\N	\N
5238	instandhaltung	{maintenance}	{"Die Instandhaltung ist teuer, weil das Haus alt ist.","Instandhaltung des Hauses ist wichtig, auch wenn es Zeit kostet."}	3	3	2	\N	\N
5239	klug	{clever}	{"Das war sehr klug, weil du alle Risiken bedacht hast!","Ein kluger Mensch fragt nach, wenn er etwas nicht versteht."}	3	3	\N	\N	\N
5240	konflikt	{conflict}	{"Der Konflikt wurde gelöst, obwohl es schwierig schien.","Konflikte vermeiden, indem man offen kommuniziert."}	3	3	1	\N	konflikte
5241	kündigung	{termination}	{"Sie erhielt die Kündigung, weil sie die Regeln nicht einhielt.","Die Kündigung ist schriftlich, auch wenn sie unfair erscheint."}	3	3	2	\N	\N
5242	lüften	{"to air"}	{"Bitte lüfte das Schlafzimmer, bevor du schlafen gehst.","Wir lüften die Wohnung, weil die Luft stickig ist."}	3	3	\N	\N	\N
5243	massiv	{solid}	{"Der Tisch ist massiv, obwohl er leicht aussieht.","Massive Holzmöbel halten länger, weil sie stabil sind."}	3	3	\N	\N	\N
5244	meckern	{"to whinge"}	{"Hör auf zu meckern, auch wenn etwas schiefgeht!","Sie meckert über das Wetter, obwohl es sonnig ist."}	3	3	\N	\N	\N
5245	meerschweinchen	{"guinea pig"}	{"Meerschweinchen sind niedlich, weil sie so neugierig sind.","Unser Meerschweinchen heißt Max, obwohl es eigentlich weiblich ist."}	3	3	3	\N	\N
5246	mieterhöhung	{"rent increase"}	{"Die Mieterhöhung ist unfair, weil das Einkommen nicht steigt.","Mieterhöhungen sind häufig, obwohl die Qualität nicht besser wird."}	3	3	2	\N	\N
5247	mietspiegel	{"rent index"}	{"Der Mietspiegel steigt jedes Jahr, weil die Nachfrage hoch ist.","Was steht im Mietspiegel, wenn die Preise unklar sind?"}	3	3	1	\N	\N
5248	mietvertrag	{"rental contract"}	{"Der Mietvertrag ist unterschrieben, obwohl ich Bedenken hatte.","Lies den Mietvertrag genau, bevor du unterschreibst!"}	3	3	1	\N	mietverträge
5249	modernisierung	{modernisation}	{"Die Modernisierung dauert lange, weil die Handwerker überlastet sind.","Modernisierung der Küche ist teuer, aber notwendig."}	3	3	2	\N	\N
5250	nachsehen	{"to check"}	{"Ich sehe im Kalender nach, ob der Termin noch frei ist.","Kannst du den Preis nachsehen, weil ich meine Brille vergessen habe?"}	3	3	\N	\N	\N
5251	neugierig	{curious}	{"Katzen sind neugierig, weil sie alles erkunden wollen.","Er ist neugierig auf die Antwort, obwohl sie unangenehm sein könnte."}	3	3	\N	\N	\N
5252	obwohl	{although}	{"Obwohl es regnet, gehen wir raus, weil wir frische Luft brauchen.","Sie lacht, obwohl sie traurig ist, um andere zu beruhigen."}	3	3	\N	\N	\N
5253	offenbar	{obvious}	{"Offenbar hat er vergessen, dass wir einen Termin hatten.","Das ist offenbar nicht möglich, weil die Technik fehlt."}	3	3	\N	\N	\N
5254	protestieren	{"to protest"}	{"Die Schüler protestieren laut, weil sie mehr Klimaschutz fordern.","Gegen was protestierst du, wenn du selbst nichts änderst?"}	3	3	\N	\N	\N
5255	richter/in	{judge}	{"Der Richter entscheidet heute, obwohl Beweise fehlen.","Die Richterin ist streng, weil sie Gerechtigkeit wichtig findet."}	3	3	5	\N	richter/innen
5256	rücksicht	{consideration}	{"Nimm Rücksicht auf andere, auch wenn du es eilig hast!","Rücksicht ist wichtig, weil wir alle zusammenleben."}	3	3	2	\N	\N
5257	sammeln	{"to collect"}	{"Er sammelt alte Münzen, weil sie historisch interessant sind.","Wir sammeln Geld für die Schule, obwohl es schwer ist."}	3	3	\N	\N	\N
5258	sauer	{sour}	{"Die Zitrone schmeckt sauer, obwohl sie reif ist.","Sauer macht lustig! Auch wenn es nicht jeder mag."}	3	3	\N	\N	\N
5259	schaden	{damages}	{"Der Sturm verursachte Schaden, weil niemand vorbereitet war.","Schäden am Auto sind teuer, auch wenn sie klein sind."}	3	3	1	\N	schäden
5260	schmutzig	{dirty}	{"Die Hände sind schmutzig, weil er im Garten gearbeitet hat.","Schmutzige Wäsche waschen ist notwendig, auch wenn es lästig ist."}	3	3	\N	\N	\N
5261	selbstverständlich	{"of course"}	{"Selbstverständlich helfe ich dir! Auch wenn ich wenig Zeit habe.","Das ist selbstverständlich, weil wir Freunde sind."}	3	3	\N	\N	\N
5262	sinnlos	{meaningless}	{"Das ist total sinnlos, weil es nichts ändert.","Sinnlose Diskussionen vermeiden, um Zeit zu sparen."}	3	3	\N	\N	\N
5263	sinnvoll	{meaningful}	{"Das ist eine sinnvolle Idee, weil sie Ressourcen spart.","Sinnvolle Arbeit suchen, auch wenn es lange dauert."}	3	3	\N	\N	\N
5264	sortieren	{"to sort"}	{"Sortiere die Bücher nach Farbe, wenn du Zeit hast.","Müll sortieren ist wichtig, weil es die Umwelt schützt."}	3	3	\N	\N	\N
5265	stinken	{"to stink"}	{"Der Fisch stinkt, obwohl er frisch gekauft wurde.","Hier stinkt es! Weil jemand den Müll nicht rausgebracht hat."}	3	3	\N	\N	\N
5266	streiten	{"to argue"}	{"Sie streiten sich oft, weil sie unterschiedliche Meinungen haben.","Warum streitet ihr euch, wenn ihr euch lieben solltet?"}	3	3	\N	\N	\N
5267	total	{totally}	{"Das ist total langweilig, weil nichts passiert.","Ich bin total müde, obwohl ich früh ins Bett gegangen bin."}	3	3	\N	\N	\N
5268	treu	{faithful}	{"Hunde sind treue Freunde, weil sie immer bei dir bleiben.","Er ist seiner Frau treu, obwohl sie oft streiten."}	3	3	\N	\N	\N
5269	überlegen	{"to think about"}	{"Ich muss mir das überlegen, bevor ich eine Entscheidung treffe.","Überleg es dir gut! Auch wenn es schwer ist."}	3	3	\N	\N	\N
5270	üblich	{normal}	{"Das ist hier üblich, weil es Tradition ist.","Ein übliches Problem, das viele kennen."}	3	3	\N	\N	\N
5271	unglaublich	{unbelievable}	{"Das ist unglaublich teuer! Obwohl die Qualität nicht passt.","Unglaublich, was passiert ist! Weil niemand es erwartet hatte."}	3	3	\N	\N	\N
5272	unrecht	{unjust}	{"Das ist einfach Unrecht! Auch wenn es legal ist.","Er hat Unrecht, weil er die Fakten ignoriert."}	3	3	3	\N	\N
5273	urteil	{judgement}	{"Das Urteil war fair, obwohl es hart erscheint.","Ein wichtiges Urteil, das die Gesellschaft verändert."}	3	3	3	\N	\N
5274	vergleichbar	{comparable}	{"Das ist nicht vergleichbar, weil die Umstände anders sind.","Vergleichbare Preise finden, wenn man online sucht."}	3	3	\N	\N	\N
5275	verpflichten	{"to compel"}	{"Ich fühle mich verpflichtet, weil ich es versprochen habe.","Das Gesetz verpflichtet uns, obwohl es unpraktisch ist."}	3	3	\N	\N	\N
5276	verständnis	{understanding}	{"Ich habe Verständnis für dich, auch wenn ich anderer Meinung bin.","Verständnis zeigen ist wichtig, weil es Konflikte löst."}	3	3	3	\N	\N
5277	verstoß	{violation}	{"Das ist ein Verstoß gegen Regeln, der bestraft werden muss.","Verstöße werden bestraft, auch wenn sie klein sind."}	3	3	1	\N	verstöße
5278	verstoßen	{"to violate"}	{"Er verstößt gegen das Gesetz, weil er keine Wahl hat.","Das verstößt nicht gegen Regeln, obwohl es unfair erscheint."}	3	3	\N	\N	\N
5279	völlig	{completely}	{"Das ist völlig normal, obwohl es am Anfang komisch aussah.","Ich bin völlig einverstanden, weil der Vorschlag sinnvoll ist."}	3	3	\N	\N	\N
5280	vorher	{before}	{"Was hast du vorher gemacht, bevor du hierher gekommen bist?","Vorher war alles einfacher, obwohl wir weniger Geld hatten."}	3	3	\N	\N	\N
5281	wegräumen	{"to clear away"}	{"Räum deine Sachen weg, bevor Gäste kommen!","Sie räumt den Tisch weg, weil das Essen fertig ist."}	3	3	\N	\N	\N
5282	widerspruch	{contradiction}	{"Das ist ein Widerspruch, weil du gestern etwas anderes gesagt hast.","Kein Widerspruch, bitte! Auch wenn du anderer Meinung bist."}	3	3	1	\N	widersprüche
5283	wütend	{angry}	{"Warum bist du so wütend, obwohl es nur ein Missverständnis war?","Er schlug die Tür wütend zu, weil niemand ihm zugehört hatte."}	3	3	\N	\N	\N
5284	zeitraum	{"time frame"}	{"Der Zeitraum ist zu kurz, um das Projekt abzuschließen.","Wähle einen Zeitraum aus, der für alle passt."}	3	3	1	\N	zeiträume
5285	ziemlich	{rather}	{"Das ist ziemlich gut, obwohl es noch verbessert werden kann.","Sie ist ziemlich müde, weil sie die ganze Nacht gearbeitet hat."}	3	3	\N	\N	\N
5286	zimmerlautstärke	{"room volume"}	{"Bitte Zimmerlautstärke, weil die Nachbarn sonst protestieren!","Musik auf Zimmerlautstärke hören, obwohl man lieber tanzen möchte."}	3	3	2	\N	\N
5287	zugeben	{"to admit"}	{"Er gibt seinen Fehler zu, obwohl es ihm schwerfällt.","Ich muss zugeben, ich lag falsch, weil ich nicht genug nachgedacht hatte."}	3	3	\N	\N	\N
5288	zurücklassen	{"to leave behind"}	{"Lass nichts zurück, weil wir später nicht zurückkommen können!","Sie ließ ihre Tasche zurück, obwohl sie es eigentlich nicht wollte."}	3	3	\N	\N	\N
5289	zusammenleben	{"life together"}	{"Das Zusammenleben ist friedlich, weil wir Rücksicht nehmen.","Zusammenleben erfordert Respekt, auch wenn man unterschiedliche Meinungen hat."}	3	3	3	\N	\N
5290	zustimmen	{"to agree"}	{"Ich stimme dir zu, weil deine Argumente überzeugend sind.","Stimmst du dem Plan zu, obwohl er einige Risiken hat?"}	3	3	\N	\N	\N
5291	zutritt	{access}	{"Zutritt verboten, weil die Baustelle gefährlich ist!","Hier ist kein Zutritt, obwohl das Schild fehlt."}	3	3	1	\N	\N
5292	abgas	{"exhaust gas"}	{"Moderne Autos produzieren weniger Abgase, obwohl sie immer noch die Umwelt belasten.","Weil Abgase schädlich sind, müssen Fabriken Filter verwenden."}	3	4	3	\N	abgase
5293	abwasser	{sewage}	{"Bevor Abwasser in Flüsse fließt, muss es gereinigt werden.","Der Fluss ist verschmutzt, weil Abwasser falsch entsorgt wurde."}	3	4	3	\N	\N
5294	altöl	{"waste oil"}	{"Altöl darf man nicht wegschütten, weil es das Grundwasser vergiftet.","Obwohl Altöl recycelbar ist, landet es oft im Hausmüll."}	3	4	3	\N	\N
5295	altpapier	{"waste paper"}	{"Wenn Altpapier recycelt wird, spart das Bäume.","Die blaue Tonne ist nur für Altpapier, das sauber sein muss."}	3	4	3	\N	\N
5296	aluminium	{aluminium}	{"Aluminium ist leicht, obwohl es sehr stabil ist.","Dosen aus Aluminium können recycelt werden, sodass Ressourcen gespart werden."}	3	4	3	\N	\N
5297	andauernd	{lasting}	{"Weil der Regen andauernd ist, gibt es Hochwasser.","Andauernder Lärm ist stressig, deshalb brauchen wir Ruhezeiten."}	3	4	\N	\N	\N
5298	ankündigen	{"to announce"}	{"Der Bürgermeister kündigt an, dass neue Radwege gebaut werden.","Bevor das Projekt startet, wird die Regierung es offiziell ankündigen."}	3	4	\N	\N	\N
5299	anstatt	{instead}	{"Anstatt Plastik zu nutzen, verwenden wir Stoffbeutel.","Sie geht zu Fuß, anstatt mit dem Auto zu fahren."}	3	4	\N	\N	\N
5300	begleitperson	{"accompanying person"}	{"Kinder brauchen eine Begleitperson, wenn sie allein reisen.","Weil sie unsicher war, nahm sie eine Begleitperson zur Veranstaltung mit."}	3	4	2	\N	\N
5301	belasten	{"to pollute"}	{"Fabriken belasten die Luft, indem sie Schadstoffe ausstoßen.","Wenn Plastik im Meer landet, belastet es die Ökosysteme."}	3	4	\N	\N	\N
5302	belastung	{pollution}	{"Die Belastung durch Plastik ist hoch, weil viele es wegwerfen.","Obwohl die Belastung bekannt ist, ändern viele ihr Verhalten nicht."}	3	4	2	\N	\N
5303	beobachten	{"to observe"}	{"Wir beobachten Vögel, die im Wald leben.","Weil er den Sternenhimmel liebt, beobachtet er ihn jede Nacht."}	3	4	\N	\N	\N
5304	beutel	{bag}	{"Anstatt Plastikbeutel zu kaufen, nehmen wir Stoffbeutel.","Der Beutel, den ich benutze, ist aus recyceltem Material."}	3	4	1	\N	beutel
5305	biologisch	{biological}	{"Biologisches Gemüse ist teurer, weil es ohne Chemikalien wächst.","Obwohl es teurer ist, kaufen viele biologisch angebaute Produkte."}	3	4	\N	\N	\N
5306	chemikalie	{chemicals}	{"Chemikalien, die in Reinigern sind, können gefährlich sein.","Weil Chemikalien die Umwelt schädigen, suchen wir Alternativen."}	3	4	2	\N	chemikalien
5307	deckel	{lid}	{"Der Deckel passt nicht, obwohl er die gleiche Größe hat.","Wenn du den Deckel verlierst, verdirbt das Essen schneller."}	3	4	1	\N	\N
5308	doof	{stupid}	{"Das ist eine doofe Idee, weil sie viel Müll produziert.","Obwohl er Mathe doof findet, muss er es lernen."}	3	4	\N	\N	\N
5309	eierkarton	{"egg box"}	{"Eierkartons aus Pappe können recycelt werden, wenn sie sauber sind.","Weil Eierkartons leicht sind, werden sie oft wiederverwendet."}	3	4	1	\N	eierkartons
5310	eierschale	{"egg shell"}	{"Eierschalen, die im Kompost landen, sind gut für den Boden.","Weil Eierschalen zerbrechlich sind, muss man vorsichtig sein."}	3	4	2	\N	eierschalen
5311	einfallen	{"to occur"}	{"Mir fällt kein Name ein, obwohl ich ihn gerade gehört habe.","Weil ihm nichts einfällt, fragt er um Hilfe."}	3	4	\N	\N	\N
5312	elektroauto	{"electric car"}	{"Elektroautos sind leise, obwohl sie manchmal teuer sind.","Weil Elektroautos umweltfreundlich sind, fördert die Regierung sie."}	3	4	3	\N	\N
5313	energiesparhaus	{"energy efficient house"}	{"Ein Energiesparhaus spart Geld, weil es weniger Strom verbraucht.","Obwohl es teurer ist, lohnt sich ein Energiesparhaus langfristig."}	3	4	3	\N	\N
5314	energiesparlampe	{"energy efficient bulb"}	{"Energiesparlampen halten länger, obwohl sie teurer sind.","Weil sie weniger Strom brauchen, sind sie umweltfreundlicher."}	3	4	2	\N	\N
5315	erdbeben	{earthquake}	{"Nachdem das Erdbeben stattfand, halfen viele Freiwillige.","Weil Erdbeben gefährlich sind, baut man erdbebensichere Häuser."}	3	4	3	\N	\N
5316	erde	{earth}	{"Pflanzen brauchen Erde, die nährstoffreich ist.","Weil die Erde trocken ist, müssen wir mehr gießen."}	3	4	2	\N	\N
5317	erderwärmung	{"global warming"}	{"Erderwärmung betrifft uns alle, weil sie das Klima verändert.","Obwohl die Erderwärmung bekannt ist, handeln viele Länder nicht."}	3	4	2	\N	\N
5318	erlaubnis	{permission}	{"Er braucht Erlaubnis, bevor er das Grundstück betritt.","Weil er keine Erlaubnis hatte, durfte er nicht parken."}	3	4	2	\N	\N
5319	förster/in	{woodsman}	{"Der Förster schützt den Wald, indem er Wilderer überwacht.","Weil Försterinnen die Natur lieben, arbeiten sie in diesem Beruf."}	3	4	5	\N	förster/innen
5320	gegenstand	{object}	{"Gegenstände aus Metall können recycelt werden, wenn sie sauber sind.","Weil der Gegenstand kaputt ist, werfen wir ihn weg."}	3	4	1	\N	gegenstände
5321	gegenvorschlag	{counterproposal}	{"Sie macht einen Gegenvorschlag, weil der erste Plan zu teuer ist.","Obwohl der Gegenvorschlag gut war, wurde er abgelehnt."}	3	4	1	\N	gegenvorschläge
5322	giftig	{toxic}	{"Diese Pilze sind giftig, obwohl sie lecker aussehen.","Weil die Chemikalien giftig sind, muss man Handschuhe tragen."}	3	4	\N	\N	\N
5323	haushalt	{household}	{"Im Haushalt sparen wir Energie, indem wir LED-Lampen nutzen.","Weil unser Haushalt groß ist, produzieren wir viel Müll."}	3	4	1	\N	\N
5324	hochwasser	{high-tide}	{"Nachdem das Hochwasser kam, mussten die Straßen gesperrt werden.","Weil Hochwasser gefährlich ist, baut man Dämme."}	3	4	3	\N	\N
5325	hörer/in	{listener}	{"Die Hörer, die anriefen, stellten viele Fragen.","Weil die Hörerin Feedback gab, verbesserte sich der Podcast."}	3	4	5	\N	hörer/innen
5326	kaffeefilter	{"coffee filter"}	{"Der Kaffeefilter, den wir benutzen, ist aus Papier.","Weil der Kaffeefilter voll war, lief das Wasser über."}	3	4	1	\N	\N
5327	klima	{climate}	{"Das Klima verändert sich, obwohl viele es nicht wahrhaben.","Weil das Klima wärmer wird, schmelzen die Gletscher."}	3	4	3	\N	\N
5328	klimawandel	{"climate change"}	{"Klimawandel betrifft uns alle, deshalb müssen wir handeln.","Obwohl der Klimawandel real ist, ignorieren ihn manche Politiker."}	3	4	1	\N	\N
5329	konservendose	{"preserving jars"}	{"Konservendosen aus Metall können recycelt werden, wenn sie leer sind.","Weil die Konservendose rostig war, warf er sie weg."}	3	4	2	\N	\N
5330	kunststoff	{"synthetic material"}	{"Kunststoff, der im Meer landet, schadet den Tieren.","Weil Kunststoff langlebig ist, bleibt er Jahrhunderte in der Natur."}	3	4	1	\N	kunststoffe
5331	luft	{air}	{"Frische Luft ist wichtig, obwohl viele Städte verschmutzt sind.","Weil die Luft sauberer wurde, gibt es wieder mehr Vögel."}	3	4	2	\N	\N
5332	matratze	{mattress}	{"Die Matratze, die wir kauften, ist aus recycelten Materialien.","Weil die Matratze zu hart war, konnte er nicht schlafen."}	3	4	2	\N	\N
5333	metall	{metal}	{"Metall, das recycelt wird, spart Energie und Ressourcen.","Weil Metall schwer ist, braucht man Maschinen zum Transport."}	3	4	3	\N	\N
5334	milchkarton	{"milk carton"}	{"Milchkartons aus Pappe gehören in die Altpapiertonne.","Weil der Milchkarton leer war, warf sie ihn weg."}	3	4	1	\N	milchkartons
5335	mülltonne	{"rubbish bin"}	{"Die Mülltonne ist voll, weil wir letzte Woche nicht entleert wurden.","Obwohl die Mülltonne voll ist, wirft er den Abfall hinein."}	3	4	2	\N	\N
5336	mülltrennung	{"waste separation"}	{"Mülltrennung ist wichtig, damit mehr recycelt werden kann.","Weil Mülltrennung kompliziert ist, machen viele Fehler."}	3	4	2	\N	\N
5337	naturkatastrophe	{"natural disaster"}	{"Naturkatastrophen wie Tsunamis werden durch den Klimawandel stärker.","Weil Naturkatastrophen unvorhersehbar sind, braucht man Notfallpläne."}	3	4	2	\N	\N
5338	naturprodukt	{"natural product"}	{"Naturprodukte, die ohne Chemie hergestellt werden, sind gesünder.","Weil Naturprodukte teurer sind, kaufen sie nicht alle."}	3	4	3	\N	naturprodukte
5339	obstschale	{"fruit skin"}	{"Obstschalen aus Holz sind umweltfreundlicher als Plastikschalen.","Weil die Obstschale kaputt war, kaufte sie eine neue."}	3	4	2	\N	obstschalen
4758	vereinbaren	{"to arrange"}	{"Wir vereinbaren einen Termin mit dem Vermieter.","Kannst du eine Zeit vereinbaren?"}	2	15	\N	\N	\N
4794	ausländeramt	{"immigration office"}	{"Das Ausländeramt ist heute geschlossen.","Termine beim Ausländeramt sind schwer zu bekommen."}	2	16	3	\N	\N
4796	ausweis	{"ID (identification document)"}	{"Zeigen Sie bitte Ihren Ausweis!","Mein Ausweis ist abgelaufen."}	2	16	1	\N	\N
4800	berufsberatung	{"career guidance"}	{"Die Berufsberatung hilft bei der Jobsuche.","Ich habe einen Termin bei der Berufsberatung."}	2	16	2	\N	\N
4857	ausland	{abroad}	{"Ich möchte im Ausland studieren.","Das Ausland bietet neue Erfahrungen."}	2	17	3	\N	\N
4858	autounfall	{"car accident"}	{"Der Autounfall blockiert die Straße.","Glücklicherweise war niemand verletzt."}	2	17	1	\N	Autounfälle
4897	prüfungstraining	{"exam training"}	{"Das Prüfungstraining hilft mir sehr.","Wir machen ein Prüfungstraining nächste Woche."}	2	17	3	\N	\N
4915	überraschung	{surprise}	{"Die Überraschungsparty war ein Erfolg!","Eine Überraschung erwartet dich nach der Prüfung."}	2	17	2	\N	Überraschungen
4935	bedienen	{"to serve"}	{"Der Kellner bedient die Gäste freundlich.","Kannst du die Maschine bedienen?"}	2	18	\N	\N	\N
4955	mittelschule	{"secondary school"}	{"Nach der Grundschule geht er auf die Mittelschule.","Die Mittelschule bereitet auf den Beruf vor."}	2	18	2	\N	\N
4974	tippen	{"to type"}	{"Ich tippe den Bericht schnell.","Kannst du ohne Fehler tippen?"}	2	18	\N	\N	\N
4985	vollzeitstelle	{"full-time position"}	{"Die Vollzeitstelle bietet ein gutes Gehalt.","Sie bewirbt sich auf eine Vollzeitstelle."}	2	18	2	\N	\N
5015	ehepaar	{"married couple"}	{"Das Ehepaar geht spazieren.","Ein glückliches Ehepaar wohnt hier."}	2	19	3	\N	\N
5057	parfümerie	{perfumery}	{"In der Parfümerie riecht es gut.","Ich kaufe Parfüm in der Parfümerie."}	2	19	2	\N	\N
5076	spielwaren (pl)	{toys}	{"Spielwaren sind im Keller.","Kinder lieben Spielwaren."}	2	19	2	\N	Spielwaren
6087	absetzen	{"to distribute"}	{"Wir müssen die Aufgaben absetzen.","Kannst du die Pakete absetzen?"}	2	20	\N	\N	\N
6088	abteilung	{department}	{"Die Abteilung ist im dritten Stock.","Wir haben viele Abteilungen in der Firma."}	2	20	2	\N	Abteilungen
6089	angeben	{"to indicate"}	{"Bitte gib deine Abteilung an.","Er hat den Fehler angegeben."}	2	20	\N	\N	\N
6090	anruf	{call}	{"Der Anruf kam von einem Kunden.","Ich habe drei Anrufe verpasst."}	2	20	1	\N	Anrufe
6091	anrufer/in	{caller}	{"Der Anruer hat keine Nachricht hinterlassen.","Die Anruferin möchte mit dem Chef sprechen."}	2	20	5	\N	\N
6092	arbeitgeber/in	{employer}	{"Mein Arbeitgeber ist sehr freundlich.","Die Arbeitgeberin sucht neue Mitarbeiter."}	2	20	5	\N	\N
6093	arbeitsauftrag	{"work order"}	{"Der Arbeitsauftrag muss bis Freitag fertig sein.","Sie hat einen neuen Arbeitsauftrag erhalten."}	2	20	1	\N	Arbeitsaufträge
6094	arbeitsbeginn	{"start of work"}	{"Der Arbeitsbeginn ist um 8 Uhr.","Sie freut sich auf den Arbeitsbeginn."}	2	20	1	\N	\N
6095	arbeitsschutz	{"occupational safety"}	{"Arbeitsschutz ist sehr wichtig.","Die Firma verbessert den Arbeitsschutz."}	2	20	1	\N	\N
6096	arbeitsvertrag	{"work contract"}	{"Der Arbeitsvertrag ist für zwei Jahre.","Sie unterschreibt den Arbeitsvertrag heute."}	2	20	1	\N	Arbeitsverträge
6097	aufzug	{lift}	{"Der Aufzug ist kaputt.","Wir nehmen den Aufzug in den dritten Stock."}	2	20	1	\N	\N
6098	außendienst	{"sales representatives"}	{"Der Außendienst macht 30% der Mitarbeiter aus.","Im Außendienst arbeitet man viel unterwegs."}	2	20	1	\N	\N
6099	ausmachen	{"to account for"}	{"Das macht 20% des Umsatzes aus.","Was macht den Erfolg aus?"}	2	20	\N	\N	\N
6100	beauftragte	{agent}	{"Die Beauftragte hilft bei den Unterlagen.","Der Beauftragte kommt morgen."}	2	20	5	\N	\N
6101	bereit	{ready}	{"Sind Sie bereit für die Präsentation?","Das Essen ist bereit."}	2	20	\N	\N	\N
4677	bedeuten	{"to mean"}	{"Was bedeutet dieses Wort?","Das Schild bedeutet „Vorsicht“."}	2	15	\N	\N	\N
4710	hausverwaltung	{"property management"}	{"Die Hausverwaltung ist für Reparaturen zuständig.","Ich rufe die Hausverwaltung an."}	2	15	2	\N	\N
4717	kinderwagen	{"baby buggy"}	{"Der Kinderwagen steht im Flur.","Wir kaufen einen neuen Kinderwagen."}	2	15	1	\N	\N
4744	spaziergang	{walk}	{"Nach dem Umzug machen wir einen Spaziergang.","Ein Spaziergang im Park entspannt."}	2	15	1	\N	\N
5340	papiermüll	{"paper waste"}	{"Papiermüll, der in der blauen Tonne landet, wird recycelt.","Weil wir viel Papiermüll produzieren, brauchen wir eine größere Tonne."}	3	4	1	\N	\N
5341	pappe	{cardboard}	{"Pappe, die nass wird, kann nicht mehr recycelt werden.","Weil Pappe leicht ist, nutzt man sie für Verpackungen."}	3	4	2	\N	\N
5342	picknick	{picnic}	{"Beim Picknick im Park nutzen wir Mehrweg-Geschirr, um Müll zu sparen.","Weil das Picknick im Regen stattfand, mussten wir früh aufhören."}	3	4	3	\N	\N
5343	planet	{planet}	{"Die Erde ist der einzige Planet, auf dem wir leben können.","Weil andere Planeten unwirtlich sind, müssen wir die Erde schützen."}	3	4	1	\N	planeten
5344	plastik	{plastic}	{"Plastik, das im Meer schwimmt, wird von Tieren gefressen.","Weil Plastik nicht verrottet, bleibt es Jahrhunderte in der Umwelt."}	3	4	3	\N	\N
5345	recyceln	{"to recycle"}	{"Wir recyceln Glas, weil es unendlich oft wiederverwendet werden kann.","Obwohl viele recyceln, landet noch zu viel im Restmüll."}	3	4	\N	\N	\N
5346	sack	{bag}	{"Säcke aus Jute sind umweltfreundlicher als Plastiksäcke.","Weil der Sack voll war, konnte er ihn kaum tragen."}	3	4	1	\N	säcke
5347	sammelstelle	{"collection point"}	{"Batterien müssen zur Sammelstelle gebracht werden, weil sie giftig sind.","Obwohl die Sammelstelle nah ist, werfen viele Elektroschrott in den Müll."}	3	4	2	\N	\N
5348	schädigen	{"to damage"}	{"Rauch schädigt die Lunge, weil er giftige Partikel enthält.","Weil Müll die Natur schädigt, müssen wir ihn richtig entsorgen."}	3	4	\N	\N	\N
5349	schädlich	{harmful}	{"Zigaretten sind schädlich, obwohl viele Menschen rauchen.","Weil Chemikalien schädlich sind, tragen wir Schutzhandschuhe."}	3	4	\N	\N	\N
5350	schadstoff	{"hazardous substance"}	{"Schadstoffe in der Luft verursachen Atemprobleme, besonders bei Kindern.","Weil Schadstoffe gefährlich sind, müssen sie kontrolliert werden."}	3	4	1	\N	schadstoffe
5351	schützen	{"to protect"}	{"Wir schützen die Umwelt, indem wir weniger Plastik verwenden.","Weil Bäume das Klima schützen, pflanzen wir mehr davon."}	3	4	\N	\N	\N
5352	solarenergie	{"solar energy"}	{"Solarenergie ist sauber, weil sie keine Abgase produziert.","Obwohl Solarenergie teuer ist, lohnt sie sich langfristig."}	3	4	2	\N	\N
5353	sondermüll	{"hazardous waste"}	{"Sondermüll muss getrennt werden, weil er gefährliche Stoffe enthält.","Weil Sondermüll giftig ist, darf er nicht in den Hausmüll."}	3	4	1	\N	\N
5354	sonnenschein	{sunshine}	{"Sonnenschein ist wichtig, weil er Solaranlagen antreibt.","Obwohl es viel Sonnenschein gab, war der Tag kühl."}	3	4	1	\N	\N
5355	sorge	{worry}	{"Ich mache mir Sorgen, weil die Umweltverschmutzung zunimmt.","Obwohl sie sich Sorgen macht, unternimmt sie nichts."}	3	4	2	\N	\N
5356	sparsam	{economical}	{"Sei sparsam mit Wasser, weil es eine wertvolle Ressource ist.","Weil sie sparsam lebt, hat sie niedrige Stromkosten."}	3	4	\N	\N	\N
5357	sperrmüll	{"bulky waste"}	{"Sperrmüll wird abgeholt, wenn man ihn vorher anmeldet.","Weil Sperrmüll viel Platz braucht, lagern wir ihn im Keller."}	3	4	1	\N	\N
5358	stattfinden	{"to take place"}	{"Das Festival findet statt, obwohl das Wetter schlecht ist.","Weil das Treffen regelmäßig stattfindet, kennen sich alle gut."}	3	4	\N	\N	\N
5359	tierschutz	{"animal protection"}	{"Tierschutz ist wichtig, weil Tiere Respekt verdienen.","Obwohl Tierschutz Gesetze hat, werden sie oft ignoriert."}	3	4	1	\N	\N
5360	trinkwasser	{"drinking water"}	{"Trinkwasser ist knapp, weil die Bevölkerung wächst.","Weil Trinkwasser kostbar ist, sollten wir es nicht verschwenden."}	3	4	3	\N	\N
5361	trüb	{gloomy}	{"Das Wasser ist trüb, weil Sedimente darin schwimmen.","Obwohl der Himmel trüb war, regnete es nicht."}	3	4	\N	\N	\N
5362	tsunami	{tsunami}	{"Ein Tsunami zerstörte die Stadt, weil sie nahe am Meer lag.","Weil Tsunamis gefährlich sind, gibt es Frühwarnsysteme."}	3	4	1	\N	\N
5363	turm	{tower}	{"Der Turm, den wir besteigen, bietet eine Aussicht über die Stadt.","Weil der Turm hoch ist, hat man einen weiten Blick."}	3	4	1	\N	\N
5364	umdrehen	{"to turn around"}	{"Dreh dich um, weil jemand hinter dir steht!","Weil er den Schlüssel umdreht, öffnet sich die Tür."}	3	4	\N	\N	\N
5365	umgehen	{"to go round"}	{"Wir umgehen das Hindernis, indem wir einen anderen Weg nehmen.","Weil die Straße gesperrt ist, müssen wir umgehen."}	3	4	\N	\N	\N
5366	umweltfreundlich	{"environmentally friendly"}	{"Umweltfreundliche Produkte sind teurer, aber besser für die Erde.","Weil wir umweltfreundlich leben, reduzieren wir unseren Müll."}	3	4	\N	\N	\N
5367	umweltschutz	{"environmental protection"}	{"Umweltschutz ist wichtig, weil er die Natur bewahrt.","Obwohl Umweltschutz teuer ist, investieren viele Länder darin."}	3	4	1	\N	\N
5368	umweltverschmutzung	{"environmental pollution"}	{"Umweltverschmutzung nimmt zu, weil die Industrie wächst.","Weil Umweltverschmutzung gefährlich ist, müssen wir handeln."}	3	4	2	\N	\N
5369	unwetter	{thunderstorm}	{"Nachdem das Unwetter vorbei war, sah man die Schäden.","Weil Unwetter gefährlich sind, bleiben viele zu Hause."}	3	4	3	\N	unwetter
5370	verändern	{"to change"}	{"Die Welt verändert sich, weil der Klimawandel voranschreitet.","Weil er seine Gewohnheiten verändert, lebt er gesünder."}	3	4	\N	\N	\N
5371	verlaufen	{"to continue"}	{"Die Diskussion verläuft gut, weil alle kooperativ sind.","Weil das Projekt positiv verläuft, sind wir optimistisch."}	3	4	\N	\N	\N
5372	verschmutzen	{"to contaminate"}	{"Müll verschmutzt den Fluss, weil Leute ihn hineinwerfen.","Weil Fabriken die Luft verschmutzen, gibt es Gesundheitsprobleme."}	3	4	\N	\N	\N
5374	verschwendung	{waste}	{"Verschwendung von Essen ist ein Problem, weil viele hungern.","Weil Verschwendung Ressourcen kostet, müssen wir sparsam sein."}	3	4	2	\N	\N
5375	versprechen	{"to promise"}	{"Ich verspreche dir, dass ich umweltfreundlicher leben werde.","Weil er es versprochen hat, trennt er jetzt den Müll."}	3	4	\N	\N	\N
5376	verwerten	{"to exploit"}	{"Wir verwerten Altglas, indem wir es zur Sammelstelle bringen.","Weil wir Abfälle verwerten, produzieren wir weniger Müll."}	3	4	\N	\N	\N
5377	voraussichtlich	{provisionally}	{"Voraussichtlich regnet es morgen, deshalb verschieben wir das Picknick.","Weil der Termin voraussichtlich später ist, können wir länger schlafen."}	3	4	\N	\N	\N
5378	vorhersagen	{"to predict"}	{"Experten vorhersagen einen heißen Sommer, weil der Klimawandel zunimmt.","Weil der Wetterbericht Regen vorhersagt, nehmen wir Regenschirme mit."}	3	4	\N	\N	\N
5379	wahrscheinlich	{probably}	{"Es wird wahrscheinlich regnen, obwohl die Sonne jetzt scheint.","Weil er krank ist, kommt er wahrscheinlich nicht zur Arbeit."}	3	4	\N	\N	\N
5380	wegschmeißen	{"to chuck out"}	{"Schmeiß den Müll nicht weg, weil er recycelt werden kann.","Weil sie alte Sachen wegschmeißt, hat sie mehr Platz."}	3	4	\N	\N	\N
5381	wegwerfen	{"to throw away"}	{"Wirf das Papier nicht weg, weil es noch verwendet werden kann.","Weil er Dinge schnell wegwirft, kauft er ständig neu."}	3	4	\N	\N	\N
5382	wertstoff	{"recyclable material"}	{"Wertstoffe wie Glas und Metall trennen wir sorgfältig.","Weil Wertstoffe wertvoll sind, werden sie recycelt."}	3	4	1	\N	wertstoffe
5383	wind	{wind}	{"Starker Wind weht, obwohl die Wettervorhersage Sonne versprach.","Weil der Wind die Turbinen antreibt, erzeugen wir saubere Energie."}	3	4	1	\N	\N
5384	windel	{nappy}	{"Windeln aus Stoff sind umweltfreundlicher als Einwegwindeln.","Weil die Windel voll war, weinte das Baby."}	3	4	2	\N	windeln
5385	wirbelsturm	{hurricane}	{"Ein Wirbelsturm zerstörte die Häuser, weil sie nicht stabil genug waren.","Weil Wirbelstürme gefährlich sind, evakuieren die Behörden die Küste."}	3	4	1	\N	wirbelstürme
5386	wolke	{cloud}	{"Dunkle Wolken, die am Himmel hängen, kündigen Regen an.","Weil die Wolken dick sind, scheint keine Sonne."}	3	4	2	\N	wolken
5387	zerstören	{"to destroy"}	{"Der Sturm zerstörte den Wald, weil die Bäume nicht standhielten.","Weil Feuer ganze Ökosysteme zerstören, sind sie gefährlich."}	3	4	\N	\N	\N
5388	zerstörung	{destruction}	{"Die Zerstörung der Natur schreitet voran, obwohl es Lösungen gibt.","Weil die Zerstörung groß war, dauert der Wiederaufbau Jahre."}	3	4	2	\N	\N
5389	zigarettenkippe	{"cigarette butts"}	{"Zigarettenkippen verschmutzen die Straßen, weil Raucher sie wegwerfen.","Weil Zigarettenkippen giftig sind, schaden sie der Umwelt."}	3	4	2	\N	zigarettenkippen
5390	zurückfahren	{"to go back"}	{"Wir fahren langsam zurück, weil die Straße vereist ist.","Weil er das Auto zurückfährt, passt es in die Parklücke."}	3	4	\N	\N	\N
5391	agb	{"General T&C","General terms and conditions"}	{"Bevor Sie bestellen, sollten Sie die AGB lesen, um Ihre Rechte zu kennen.","Die AGB enthalten wichtige Informationen, die Sie verstehen müssen."}	3	5	\N	\N	\N
5392	anfassen	{"to touch"}	{"Bitte fassen Sie die Ausstellung nicht an, da sie sehr empfindlich ist.","Kinder sollten scharfe Gegenstände nicht anfassen, um Verletzungen zu vermeiden."}	3	5	\N	\N	\N
5393	anprobe	{"fitting room"}	{"Die Anprobe befindet sich im ersten Stock, wo Sie die Kleidung in Ruhe anprobieren können.","Falls die Anprobe besetzt ist, können Sie kurz warten."}	3	5	2	\N	\N
5394	anprobieren	{"to try on"}	{"Sie können die Schuhe anprobieren, bevor Sie sie kaufen.","Ich probiere das Kleid an, obwohl ich es eher zu klein finde."}	3	5	\N	\N	\N
5395	art	{type}	{"Diese Art von Stoff ist besonders haltbar, weil er wasserabweisend ist.","Es gibt verschiedene Arten der Bezahlung, die Sie wählen können."}	3	5	2	\N	arten
5396	artikelnummer	{"item number"}	{"Geben Sie die Artikelnummer ein, damit wir den richtigen Artikel finden.","Ohne die Artikelnummer können wir Ihre Bestellung nicht bearbeiten."}	3	5	2	\N	artikelnummern
5397	atmung	{breathing}	{"Die Atmung wird schwierig, wenn man in einer stickigen Umgebung ist.","Yoga hilft, die Atmung zu kontrollieren und zu entspannen."}	3	5	2	\N	\N
5398	atmungsaktiv	{breathable}	{"Diese Jacke ist atmungsaktiv, sodass man sie auch beim Sport tragen kann.","Atmungsaktive Materialien sind angenehm, weil sie Schweiß ableiten."}	3	5	\N	\N	\N
5399	aufmerksam	{attentive}	{"Der Verkäufer war sehr aufmerksam, obwohl das Geschäft voller Kunden war.","Seien Sie aufmerksam, wenn Sie die Anweisungen lesen."}	3	5	\N	\N	\N
5400	auftrag	{order}	{"Der Auftrag wird bearbeitet, sobald die Zahlung bestätigt ist.","Wenn Sie einen Auftrag stornieren möchten, kontaktieren Sie uns bitte."}	3	5	1	\N	\N
6103	besprechen	{"to discuss"}	{"Wir besprechen das Projekt morgen.","Können wir das später besprechen?"}	2	20	\N	\N	\N
5401	auftragsnummer	{"order number"}	{"Ihre Auftragsnummer finden Sie in der Bestätigungsmail, die wir geschickt haben.","Ohne die Auftragsnummer können wir Ihre Lieferung nicht verfolgen."}	3	5	2	\N	\N
5402	ausliefern	{"to deliver"}	{"Wir liefern die Ware aus, sobald sie im Lager verfügbar ist.","Das Paket wird morgen ausgeliefert, falls keine Verzögerungen auftreten."}	3	5	\N	\N	\N
5403	auswahl	{selection}	{"Unsere Auswahl an Produkten ist groß, sodass Sie viele Optionen haben.","Je nach Auswahl können sich die Lieferkosten ändern."}	3	5	2	\N	\N
5404	bankeinzug	{"direct debit"}	{"Der Betrag wird per Bankeinzug abgebucht, sobald die Lieferung erfolgt ist.","Wenn Sie Bankeinzug wählen, müssen Sie Ihre Kontodaten angeben."}	3	5	1	\N	\N
5405	bereits	{already}	{"Die Bestellung wurde bereits versendet, obwohl sie erst gestern aufgegeben wurde.","Bereits nach einer Stunde erhielt ich die Bestätigung."}	3	5	\N	\N	\N
5406	beschädigt	{damaged}	{"Falls die Ware beschädigt ankommt, können Sie sie kostenlos zurückschicken.","Das Paket war beschädigt, weil es unsachgemäß verpackt wurde."}	3	5	\N	\N	\N
5407	bestellhotline	{"order hotline"}	{"Rufen Sie die Bestellhotline an, falls Sie Fragen zu Ihrem Kauf haben.","Die Bestellhotline ist rund um die Uhr erreichbar, um Kunden zu helfen."}	3	5	2	\N	\N
5408	betrag	{sum}	{"Der Betrag wird Ihrem Konto belastet, sobald die Lieferung beginnt.","Bitte überprüfen Sie den Betrag, bevor Sie die Zahlung bestätigen."}	3	5	1	\N	beträge
5409	bezahlvorgang	{"payment process"}	{"Während des Bezahlvorgangs müssen Sie Ihre Kreditkartendaten eingeben.","Der Bezahlvorgang wurde unterbrochen, weil die Verbindung fehlschlug."}	3	5	1	\N	bezahlvorgänge
5410	callcenter	{"call centre"}	{"Das Callcenter hilft Ihnen weiter, falls Probleme mit der Lieferung auftreten.","Obwohl das Callcenter busy war, wurde mein Anruf schnell beantwortet."}	3	5	3	\N	\N
5411	datenschutz	{"data protection"}	{"Der Datenschutz ist wichtig, damit Ihre persönlichen Informationen sicher bleiben.","Wir halten uns streng an den Datenschutz, um Vertrauen aufzubauen."}	3	5	1	\N	\N
5412	dicht	{thick}	{"Der Mantel ist sehr dicht, sodass er auch bei Kälte warm hält.","Da der Stoff zu dicht ist, fühlt er sich schwer an."}	3	5	\N	\N	\N
5413	durchlässig	{permeable}	{"Diese Jacke ist wasserdicht, aber trotzdem durchlässig für Luft.","Durchlässige Materialien sind angenehm, weil sie Feuchtigkeit abgeben."}	3	5	\N	\N	\N
5414	ebenso	{"as well"}	{"Sie können per Kreditkarte zahlen, ebenso wie mit PayPal.","Ebenso wie die Qualität ist auch der Preis wichtig."}	3	5	\N	\N	\N
5415	eher	{rather}	{"Ich würde eher Online-Shopping nutzen, weil es bequemer ist.","Dieses Modell ist eher für den Sommer geeignet, da es leicht ist."}	3	5	\N	\N	\N
5416	eigentum	{property}	{"Das Eigentum geht auf Sie über, sobald die Zahlung erfolgt ist.","Beschädigtes Eigentum muss dem Kundendienst gemeldet werden."}	3	5	3	\N	\N
5417	ergänzung	{addition}	{"Als Ergänzung zu Ihrer Bestellung empfehlen wir dieses Zubehör.","Die Ergänzung der AGB wurde notwendig, um neue Regelungen aufzunehmen."}	3	5	2	\N	ergänzungen
5418	erhältlich	{available}	{"Dieses Modell ist nur online erhältlich, obwohl es sehr beliebt ist.","Die Größe M ist leider nicht mehr erhältlich, aber Größe L ist vorrätig."}	3	5	\N	\N	\N
5419	eventuell	{possible}	{"Eventuell kommt die Lieferung später, falls es Lieferverzögerungen gibt.","Wir bieten eventuell Rabatte an, wenn Sie Großbestellungen aufgeben."}	3	5	\N	\N	\N
5420	falls	{"in case"}	{"Falls Sie unzufrieden sind, können Sie die Ware innerhalb von 14 Tagen zurückschicken.","Kontaktieren Sie uns, falls Fragen zur Rechnung auftreten."}	3	5	\N	\N	\N
5421	gutschein	{voucher}	{"Sie können den Gutschein einlösen, sobald Sie eine Bestellung aufgeben.","Falls der Gutschein abgelaufen ist, können wir ihn nicht akzeptieren."}	3	5	1	\N	\N
5422	herstellen	{"to manufacture"}	{"Wir stellen diese Produkte lokal her, um die Umwelt zu schonen.","Die Firma stellt hochwertige Möbel her, die lange halten."}	3	5	\N	\N	\N
5423	herstellung	{manufacture}	{"Die Herstellung dauert etwa zwei Wochen, da wir auf Qualität achten.","Während der Herstellung werden alle Materialien geprüft."}	3	5	2	\N	\N
5424	impressum	{imprint}	{"Das Impressum finden Sie unten auf der Website, wo alle Kontaktdaten stehen.","Laut Impressum ist die Firma in Berlin registriert."}	3	5	3	\N	\N
5425	innerhalb	{within}	{"Innerhalb von 24 Stunden erhalten Sie eine Bestätigungsmail.","Die Rücksendung muss innerhalb von 14 Tagen erfolgen."}	3	5	\N	\N	\N
5426	irgendwie	{somehow}	{"Irgendwie hat die Bestellung nicht funktioniert, obwohl ich alles richtig gemacht habe.","Wir werden das Problem irgendwie lösen, versprochen!"}	3	5	\N	\N	\N
5427	kauf	{purchase}	{"Nach dem Kauf erhalten Sie eine Rechnung per E-Mail.","Der Kauf wurde storniert, weil die Ware nicht verfügbar war."}	3	5	1	\N	\N
5428	kaufbestätigung	{"purchase confirmation"}	{"Die Kaufbestätigung wurde versendet, sobald die Zahlung bearbeitet wurde.","Ohne Kaufbestätigung können wir den Umtausch nicht durchführen."}	3	5	2	\N	\N
5429	käufer/in	{customer}	{"Käufer/innen haben das Recht, die Ware innerhalb von 14 Tagen zurückzugeben.","Als Käufer/in können Sie zwischen verschiedenen Zahlungsmethoden wählen."}	3	5	5	\N	käufer/innen
5430	kaufvertrag	{"sales contract"}	{"Der Kaufvertrag muss von beiden Parteien unterschrieben werden, bevor er gültig wird.","Im Kaufvertrag sind alle Lieferbedingungen genau festgelegt."}	3	5	1	\N	\N
5431	kosmetik	{cosmetics}	{"Diese Kosmetik ist vegan, sodass sie auch für sensible Haut geeignet ist.","Kosmetik darf nicht zurückgegeben werden, falls die Verpackung geöffnet wurde."}	3	5	2	\N	\N
5432	kundenbefragung	{"customer survey"}	{"Durch die Kundenbefragung wollen wir unseren Service verbessern, um zufriedenere Kunden zu haben.","Teilnehmer der Kundenbefragung erhalten einen Gutschein."}	3	5	2	\N	\N
5433	kundenfreundlich	{"customer friendly"}	{"Unser Service ist sehr kundenfreundlich, weil wir flexible Rückgaberegeln haben.","Eine kundenfreundliche Website ist einfach zu bedienen."}	3	5	\N	\N	\N
5434	lager	{warehouse}	{"Das Lager ist gut organisiert, sodass Bestellungen schnell bearbeitet werden können.","Falls der Artikel im Lager verfügbar ist, liefern wir sofort."}	3	5	3	\N	\N
5435	lieferbar	{"in stock"}	{"Dieses Produkt ist momentan lieferbar, obwohl es sehr gefragt ist.","Nur lieferbare Artikel werden im Onlineshop angezeigt."}	3	5	\N	\N	\N
5436	lieferbedingung	{"delivery conditions"}	{"Die Lieferbedingungen stehen im Kaufvertrag, den Sie unterschrieben haben.","Bitte lesen Sie die Lieferbedingungen, bevor Sie bestellen."}	3	5	2	\N	lieferbedingungen
5437	lieferung	{delivery}	{"Die Lieferung erfolgt innerhalb von 3 Werktagen, sobald die Zahlung bestätigt ist.","Falls die Lieferung verzögert ist, erhalten Sie eine E-Mail."}	3	5	2	\N	\N
5438	luftdurchlässig	{breathable}	{"luftdurchlässige Kleidung ist ideal für den Sommer, weil sie nicht schwitzen lässt.","Das Material ist luftdurchlässig, obwohl es wasserabweisend ist."}	3	5	\N	\N	\N
5439	mehrkosten	{"extra costs"}	{"Für Expresslieferung entstehen Mehrkosten, die im Voraus bezahlt werden müssen.","Eventuelle Mehrkosten werden in der Rechnung aufgeführt."}	3	5	2	\N	\N
5440	nachnahme	{"cash on delivery"}	{"Bei Nachnahme zahlen Sie das Paket beim Boten, wenn es geliefert wird.","Nachnahme ist möglich, verursacht aber zusätzliche Gebühren."}	3	5	2	\N	\N
5441	nachteil	{disadvantage}	{"Ein Nachteil der Nachnahme ist, dass Sie zu Hause sein müssen.","Trotz einiger Nachteile ist das Produkt sehr beliebt."}	3	5	1	\N	\N
5442	onlineeinkauf	{"online shopping"}	{"Beim Onlineeinkauf spart man Zeit, weil man nicht ins Geschäft gehen muss.","Der Onlineeinkauf ist einfach, aber man sollte die Bewertungen lesen."}	3	5	1	\N	\N
5443	onlineshop	{"online shop"}	{"Unser Onlineshop ist rund um die Uhr geöffnet, sodass Sie jederzeit bestellen können.","Im Onlineshop finden Sie alle Produkte, die wir anbieten."}	3	5	1	\N	\N
5444	onlineshopping	{"online shopping"}	{"Onlineshopping ist praktisch, obwohl man die Ware nicht anfassen kann.","Viele bevorzugen Onlineshopping, weil es bequemer ist."}	3	5	3	\N	\N
5445	paket	{parcel}	{"Das Paket wird morgen geliefert, falls es keine Verzögerungen gibt.","Bitte überprüfen Sie das Paket auf Schäden, bevor Sie es annehmen."}	3	5	3	\N	\N
5446	paketbote	{"parcel carrier"}	{"Der Paketbote klingelt zweimal, falls Sie nicht sofort öffnen.","Unser Paketbote ist immer freundlich, obwohl er unter Zeitdruck steht."}	3	5	1	\N	\N
5447	paketdienst	{"parcel service"}	{"Der Paketdienst liefert täglich, sodass Sie schnell Ihre Ware erhalten.","Falls der Paketdienst das Paket nicht zustellt, erhalten Sie eine Benachrichtigung."}	3	5	1	\N	\N
5448	porto	{postage}	{"Das Porto hängt vom Gewicht ab, weshalb schwere Pakete teurer sind.","Bei Retouren müssen Sie das Porto selbst tragen, falls kein Fehler vorliegt."}	3	5	3	\N	\N
5449	portofrei	{"postage paid"}	{"Bestellungen über 50 € sind portofrei, um Ihnen Kosten zu sparen.","Portofreie Lieferung gilt nur innerhalb Deutschlands."}	3	5	\N	\N	\N
5450	portokosten	{postage}	{"Die Portokosten werden berechnet, sobald Sie die Lieferadresse eingeben.","Bei Retouren übernehmen wir die Portokosten, falls ein Fehler unsererseits vorlag."}	3	5	2	\N	\N
5451	produzieren	{"to produce"}	{"Wir produzieren nachhaltig, um die Umweltbelastung zu reduzieren.","Die Firma produziert hauptsächlich in Europa, wo hohe Standards gelten."}	3	5	\N	\N	\N
5452	qualität	{quality}	{"Wir garantieren höchste Qualität, damit Sie lange Freude an den Produkten haben.","Obwohl die Qualität gut ist, ist der Preis angemessen."}	3	5	2	\N	\N
5453	reklamation	{complaint}	{"Bei einer Reklamation müssen Sie das Formular ausfüllen, das wir Ihnen schicken.","Reklamationen werden innerhalb von 5 Werktagen bearbeitet."}	3	5	2	\N	reklamationen
5454	retoure	{"return order"}	{"Die Retoure muss innerhalb von 14 Tagen erfolgen, damit wir sie bearbeiten können.","Für die Retoure benötigen Sie den beigefügten Retourenschein."}	3	5	2	\N	retouren
5455	retourenschein	{"return order slip"}	{"Der Retourenschein liegt der Lieferung bei, damit Sie ihn einfach nutzen können.","Ohne Retourenschein können wir die Rücksendung nicht bearbeiten."}	3	5	1	\N	\N
5456	rücksendung	{"return delivery"}	{"Die Rücksendung ist kostenlos, falls das Produkt defekt ist.","Bitte verpacken Sie die Rücksendung sorgfältig, um Beschädigungen zu vermeiden."}	3	5	2	\N	\N
5457	shopping	{shopping}	{"Online-Shopping spart Zeit, weil man nicht in die Stadt fahren muss.","Obwohl Shopping Spaß macht, sollte man ein Budget einhalten."}	3	5	3	\N	\N
5458	unverbindlich	{non-binding}	{"Sie können ein unverbindliches Angebot anfordern, um Preise zu vergleichen.","Die Beratung ist unverbindlich, sodass Sie keine Verpflichtung haben."}	3	5	\N	\N	\N
5459	verbraucher/in	{consumer}	{"Verbraucher/innen haben Rechte, die gesetzlich geschützt sind.","Als Verbraucher/in können Sie bei Mängeln die Ware reklamieren."}	3	5	5	\N	verbraucher/innen
5460	verpacken	{"to package"}	{"Wir verpacken die Ware sicher, damit sie nicht beschädigt ankommt.","Bitte verpacken Sie die Rücksendung in der Originalverpackung."}	3	5	\N	\N	\N
5461	versand	{shipping}	{"Der Versand erfolgt innerhalb von 24 Stunden, sobald die Zahlung bestätigt ist.","Bei Express-Versand erhalten Sie die Ware am nächsten Werktag."}	3	5	1	\N	\N
5462	versandkosten	{"shipping fee"}	{"Die Versandkosten hängen vom Gewicht und der Lieferadresse ab.","Bei Bestellungen über 100 € fallen keine Versandkosten an."}	3	5	2	\N	\N
5463	versandkostenfrei	{"free of shipping costs"}	{"Ab einem Einkaufswert von 50 € ist die Lieferung versandkostenfrei.","Versandkostenfrei bestellen können Sie nur innerhalb Deutschlands."}	3	5	\N	\N	\N
5464	versandkostenpauschale	{"flat shipping rate"}	{"Es gibt eine Versandkostenpauschale von 5 €, unabhängig von der Bestellmenge.","Die Versandkostenpauschale gilt nicht für internationale Lieferungen."}	3	5	2	\N	\N
5465	versenden	{"to send"}	{"Wir versenden weltweit, sodass Kunden aus allen Ländern bestellen können.","Die Ware wird versendet, sobald die Zahlung eingegangen ist."}	3	5	\N	\N	\N
5466	ware	{goods}	{"Die Ware wird sorgfältig geprüft, bevor sie versendet wird.","Bei beschädigter Ware können Sie eine Rückerstattung verlangen."}	3	5	2	\N	waren
5467	warenkorb	{basket}	{"Im Warenkorb sehen Sie alle Artikel, die Sie ausgewählt haben.","Sie können den Warenkorb jederzeit bearbeiten, bevor Sie bezahlen."}	3	5	1	\N	\N
5468	wasserdicht	{waterproof}	{"Diese Uhr ist wasserdicht, sodass Sie sie beim Schwimmen tragen können.","Obwohl die Jacke wasserdicht ist, ist sie atmungsaktiv."}	3	5	\N	\N	\N
5469	werktag	{"working day"}	{"Die Lieferung erfolgt innerhalb von 3 Werktagen, Samstage ausgenommen.","An Werktagen ist unser Kundendienst von 8 bis 18 Uhr erreichbar."}	3	5	1	\N	werktage
5470	wetterfest	{waterproof}	{"Das Material ist wetterfest, sodass es auch bei Regen genutzt werden kann.","Wetterfeste Schuhe sind ideal für Outdoor-Aktivitäten."}	3	5	\N	\N	\N
5471	widerrufen	{disclaimer}	{"Sie können den Kauf widerrufen, falls Sie innerhalb von 14 Tagen eine Retoure einleiten.","Das Widerrufsrecht erlaubt es Ihnen, den Vertrag zu widerrufen."}	3	5	\N	\N	\N
5472	widerrufsrecht	{"right of revocation"}	{"Das Widerrufsrecht gilt 14 Tage ab Erhalt der Ware, falls Sie online bestellt haben.","Im Impressum finden Sie Details zum Widerrufsrecht."}	3	5	3	\N	\N
5473	zahlung	{payment}	{"Die Zahlung muss innerhalb von 7 Tagen erfolgen, sonst wird die Bestellung storniert.","Bei erfolgreicher Zahlung erhalten Sie eine Bestätigungsmail."}	3	5	2	\N	\N
5474	zurückschicken	{"to send back"}	{"Sie können die Ware zurückschicken, falls sie nicht Ihren Erwartungen entspricht.","Bitte schicken Sie das Paket zurück, sobald Sie den Retourenschein erhalten."}	3	5	\N	\N	\N
5475	zurücksenden	{"to send back"}	{"Sie müssen das Produkt zurücksenden, um eine Rückerstattung zu erhalten.","Bevor Sie die Ware zurücksenden, kontaktieren Sie bitte den Kundendienst."}	3	5	\N	\N	\N
5476	zurücktreten	{"to withdraw"}	{"Sie können vom Kaufvertrag zurücktreten, falls die Ware defekt ist.","Der Käufer kann innerhalb von 14 Tagen ohne Angabe von Gründen zurücktreten."}	3	5	\N	\N	\N
5477	zustellen	{"to deliver"}	{"Wir stellen die Ware zu, sobald sie im Lager verfügbar ist.","Der Paketbote versucht dreimal zuzustellen, bevor das Paket zurückgeschickt wird."}	3	5	\N	\N	\N
5478	alter	{age}	{"Das Durchschnittsalter der Teilnehmer liegt bei 35 Jahren, wie die Umfrage zeigt.","Obwohl das Alter in vielen Sportarten eine Rolle spielt, gibt es Ausnahmen."}	3	6	1	\N	\N
5479	anschauen	{"to look at"}	{"Ich schaue mir oft Dokumentationen an, weil ich Neues lernen möchte.","Kannst du dir das Diagramm anschauen und mir erklären, was es bedeutet?"}	3	6	\N	\N	\N
5480	anstoß	{stimulus}	{"Die Diskussion gab den Anstoß für neue Regeln, die dem Team helfen sollen.","Der Trainer gab den Anstoß zum Training, das heute besonders intensiv war."}	3	6	1	\N	\N
5481	anstrengend	{tiring}	{"Das Handballspiel war anstrengend, obwohl wir nur eine halbe Stunde spielten.","Anstrengende Arbeit macht müde, aber sie kann auch befriedigend sein."}	3	6	\N	\N	\N
5482	autorennen	{"motor racing"}	{"Beim Autorennen im Stadion waren tausende Fans, die ihre Lieblingsfahrer anfeuerten.","Autorennen sind spannend, aber sie verursachen auch viel Lärm."}	3	6	3	\N	\N
5483	befragen	{"to consult"}	{"Wir befragen die Experten, bevor wir eine Entscheidung treffen.","Die Reporter befragten die Kandidaten, um mehr über ihre Pläne zu erfahren."}	3	6	\N	\N	\N
5484	begeistern	{"to inspire"}	{"Der Film begeisterte das Publikum, weil die Handlung voller Überraschungen war.","Kinder lassen sich leicht für neue Sportarten begeistern, wenn sie Spaß haben."}	3	6	\N	\N	\N
5485	beliebt	{popular}	{"Eishockey ist in Kanada sehr beliebt, während in Deutschland Fußball dominiert.","Beliebte Serien werden oft über viele Staffeln hinweg produziert."}	3	6	\N	\N	\N
5486	biergarten	{"beer garden"}	{"Im Biergarten treffen sich Freunde, um gemeinsam Zeit zu verbringen.","Der Biergarten war voll, obwohl das Wetter nicht perfekt war."}	3	6	1	\N	\N
5487	boxen	{boxing}	{"Boxen erfordert Disziplin, da die Sportler hart trainieren müssen.","Obwohl Boxen gefährlich sein kann, zieht es viele Zuschauer an."}	3	6	3	\N	\N
5488	chips	{crisps}	{"Chips sind zwar lecker, aber sie gelten als ungesunder Snack.","Wir kauften Chips und Limonade für den Filmabend, den wir planten."}	3	6	2	\N	\N
5489	demnächst	{soon}	{"Demnächst wird eine neue Staffel der Serie erscheinen, auf die viele Fans warten.","Die Mannschaft trainiert hart, denn demnächst steht ein wichtiges Spiel an."}	3	6	\N	\N	\N
5490	detektivgeschichte	{"detective story"}	{"Die Detektivgeschichte war so spannend, dass ich das Buch in einem Tag las.","In jeder Detektivgeschichte gibt es ein Rätsel, das gelöst werden muss."}	3	6	2	\N	\N
5491	diagramm	{diagram}	{"Das Diagramm zeigt deutlich, dass die Mehrheit für die neue Regel ist.","Um die Statistik zu verstehen, muss man das Diagramm genau analysieren."}	3	6	3	\N	\N
5492	diskussion	{discussion}	{"Die Diskussion dauerte Stunden, weil niemand eine Lösung fand.","In der Talkshow gab es hitzige Diskussionen über aktuelle Themen."}	3	6	2	\N	\N
5493	dokumentation	{documentary}	{"Die Dokumentation über Klimawandel war informativ, obwohl sie traurig machte.","Dokumentationen können helfen, komplexe Themen besser zu verstehen."}	3	6	2	\N	dokumentationen
5494	doppelt	{doubled}	{"Die Zuschauerzahl hat sich doppelt, seit die Sendung beliebter wurde.","Er arbeitet doppelt so hart, um sein Ziel zu erreichen."}	3	6	\N	\N	\N
5495	dramatisch	{dramatic}	{"Das Spielende war dramatisch, weil die Mannschaft in letzter Sekunde ein Tor schoss.","Die Handlung des Films wurde immer dramatischer, je länger er lief."}	3	6	\N	\N	\N
5496	durchschnitt	{average}	{"Im Durchschnitt verbringen Menschen zwei Stunden täglich mit Unterhaltung.","Die Durchschnittstemperatur stieg, was viele Wissenschaftler beunruhigt."}	3	6	1	\N	\N
5497	dvd	{DVD}	{"Ich kaufte die DVD der Komödie, weil ich sie mehrmals anschauen wollte.","Obwohl Streaming beliebt ist, sammeln einige Leute noch DVDs."}	3	6	2	\N	\N
5498	ehrlich	{honest}	{"Sei ehrlich: Hast du das letzte Tor im Spiel wirklich gesehen?","Ehrliche Kommentare sind wichtig, um eine Diskussion fair zu halten."}	3	6	\N	\N	\N
5499	einschlafen	{"to fall asleep"}	{"Ich kann nicht einschlafen, wenn ich vorher eine Horrorfilme anschaue.","Nach dem anstrengenden Training schlief er sofort ein."}	3	6	\N	\N	\N
5500	einsetzen	{"to use"}	{"Der Trainer setzt neue Spieler ein, um die Taktik zu verbessern.","In der Reportage wurden Drohnen eingesetzt, um spektakuläre Aufnahmen zu machen."}	3	6	\N	\N	\N
5501	eishockey	{"ice hockey"}	{"Eishockey ist in nordischen Ländern populär, weil das Klima passend ist.","Das Eishockey-Spiel wurde abgebrochen, als das Eis zu schmelzen begann."}	3	6	3	\N	\N
5502	eiskunstlauf	{"ice skating"}	{"Beim Eiskunstlauf bewerteten die Jury die Technik und die Kreativität.","Eiskunstlauf erfordert jahrelanges Training, um erfolgreich zu sein."}	3	6	1	\N	\N
5503	entstehen	{"to result"}	{"Durch den Mord in der Serie entstand eine spannende Detektivgeschichte.","Viele Missverständnisse entstehen, wenn man nicht klar kommuniziert."}	3	6	\N	\N	\N
5504	ereignis	{event}	{"Das Ereignis wurde live übertragen, damit Fans weltweit zuschauen konnten.","Historische Ereignisse prägen oft die Handlung von Dokumentationen."}	3	6	3	\N	ereignisse
5505	erfolgreich	{successful}	{"Erfolgreiche Sportler müssen diszipliniert sein, auch wenn es schwerfällt.","Die Serie war so erfolgreich, dass eine Fortsetzung geplant ist."}	3	6	\N	\N	\N
5506	ergebnis	{result}	{"Das Ergebnis der Wahl überraschte viele, da die Minderheit stärker war.","Ohne Fleiß gibt es keine guten Ergebnisse, sagt der Trainer."}	3	6	3	\N	ergebnisse
5507	experte/expertin	{expert}	{"Der Experte erklärte im Magazin, wie man gesünder lebt.","Expertinnen betonten in der Diskussion, wie wichtig objektive Daten sind."}	3	6	5	\N	experten/expertinnen
5508	fan	{fan}	{"Fans des Fußballclubs feierten die Niederlage der gegnerischen Mannschaft.","Obwohl er ein Fan von Actionfilmen ist, mag er auch romantische Komödien."}	3	6	1	\N	fans
5509	fußballclub	{"football club"}	{"Der Fußballclub sucht neue Spieler, um in der Rangliste aufzusteigen.","Fans des Fußballclubs reisten zum Auswärtsspiel, um ihre Mannschaft anzufeuern."}	3	6	1	\N	\N
5510	gewohnheit	{habit}	{"Gesunde Gewohnheiten können helfen, Langeweile im Alltag zu vermeiden.","Die Gewohnheit, täglich Sport zu treiben, fällt vielen Menschen schwer."}	3	6	2	\N	gewohnheiten
5511	golf	{golf}	{"Golf erfordert Geduld, weil jeder Schlag präzise sein muss.","Obwohl Golf als elitär gilt, wird es immer beliebter."}	3	6	3	\N	\N
5512	handball	{"hand ball"}	{"Handball ist ein Teamsport, bei dem Schnelligkeit und Taktik wichtig sind.","Die Handball-Weltmeisterschaft zieht Millionen von Zuschauern an."}	3	6	1	\N	\N
5513	herz	{heart}	{"Sport ist gut für das Herz, solange man es nicht übertreibt.","Der Film berührte ihr Herz, weshalb sie weinte."}	3	6	3	\N	\N
5514	horrorfilm	{"horror film"}	{"Horrorfilme sind nichts für mich, weil ich danach schlecht einschlafe.","Der Horrorfilm war so gruselig, dass einige Zuschauer den Saal verließen."}	3	6	1	\N	\N
5515	kandidat/in	{candidate}	{"Die Kandidatin überzeugte die Jury mit ihrer kreativen Idee.","Kandidaten müssen in der Quizshow unter Zeitdruck antworten."}	3	6	5	\N	kandidaten/kandidatinnen
5516	kommissar/in	{commissioner}	{"Der Kommissar löste den Mordfall, indem er jedes Detail überprüfte.","Kommissarinnen in Krimis sind oft besonders clever und entschlossen."}	3	6	5	\N	kommissare/kommissarinnen
5517	kommentator/in	{commentator}	{"Der Kommentator beschrieb das Spiel so lebhaft, als wäre man live dabei.","Kommentatorinnen analysierten die Statistiken nach dem Match."}	3	6	5	\N	kommentatoren/kommentatorinnen
5518	komödie	{comedy}	{"Die Komödie war so lustig, dass das Publikum die ganze Zeit lachte.","Komödien eignen sich gut, um nach einem anstrengenden Tag abzuschalten."}	3	6	2	\N	komödien
5519	krimi	{"crime thriller"}	{"Im Krimi ging es um einen Räuber, der nie gefasst wurde.","Krimis sind beliebt, weil sie Spannung und Logik kombinieren."}	3	6	1	\N	krimis
5520	kuscheln	{"to cuddle"}	{"Nach dem Film kuschelten wir uns auf die Couch und redeten über die Handlung.","Kuscheln mit Haustieren kann Stress reduzieren, sagen Experten."}	3	6	\N	\N	\N
5521	langeweile	{boredom}	{"Langeweile entsteht oft, wenn man keine Hobbys oder Interessen hat.","Um der Langeweile zu entkommen, schaltete er die Talkshow ein."}	3	6	2	\N	\N
5522	leichtathletik	{athletics}	{"Leichtathletik umfasst Disziplinen wie Laufen, Springen und Werfen.","Bei den Olympischen Spielen ist Leichtathletik eine der wichtigsten Sportarten."}	3	6	2	\N	\N
5523	lieblingsbeschäftigung	{"favourite pastime"}	{"Meine Lieblingsbeschäftigung ist Lesen, weil ich dabei in andere Welten eintauchen kann.","Sport ist für viele eine Lieblingsbeschäftigung, um fit zu bleiben."}	3	6	2	\N	\N
5524	magazin	{magazine}	{"Das Magazin veröffentlichte eine Reportage über gesunde Ernährung.","In einem Sportmagazin findet man Artikel über verschiedene Disziplinen."}	3	6	3	\N	\N
5525	mannschaft	{team}	{"Die Mannschaft trainierte hart, um bei der Weltmeisterschaft zu siegen.","Ohne Teamgeist kann eine Mannschaft keine großen Erfolge erzielen."}	3	6	2	\N	\N
5526	mehrheit	{majority}	{"Die Mehrheit der Zuschauer bevorzugt Spielfilme gegenüber Dokumentationen.","Laut Statistik ist die Mehrheit der Jugendlichen motiviert, Sport zu treiben."}	3	6	2	\N	\N
5527	minderheit	{minority}	{"Nur eine Minderheit der Fans war mit dem Ergebnis des Spiels zufrieden.","Minderheiten haben oft besondere Interessen, die berücksichtigt werden müssen."}	3	6	2	\N	\N
5528	mitreden	{"to have a say"}	{"Bei wichtigen Entscheidungen möchte ich mitreden, da es auch mich betrifft.","Nur wer sich informiert, kann bei komplexen Themen mitreden."}	3	6	\N	\N	\N
5529	mittelfeld	{mid-field}	{"Das Mittelfeld spielte ausgezeichnet, weshalb die Mannschaft das Spiel dominierte.","Ein starkes Mittelfeld ist entscheidend für die Kontrolle des Spiels."}	3	6	3	\N	\N
5530	moderation	{presentation}	{"Die Moderation der Sendung übernahm ein bekannter Reporter, der viel Erfahrung hat.","Eine gute Moderation macht selbst langweilige Themen interessant."}	3	6	2	\N	\N
5531	mord	{murder}	{"Der Mord in der Serie wurde nie aufgeklärt, was die Zuschauer frustrierte.","In vielen Krimis ist ein Mord der Ausgangspunkt der Handlung."}	3	6	1	\N	\N
5532	motiviert	{motivated}	{"Die Spieler waren hochmotiviert, nachdem der Trainer sie angefeuert hatte.","Motivierte Mitarbeiter sind der Schlüssel zum Erfolg eines Unternehmens."}	3	6	\N	\N	\N
5533	naschen	{"to snack"}	{"Kinder naschen gerne Süßigkeiten, obwohl sie wissen, dass es ungesund ist.","Statt zu naschen, könnte man Obst als gesunde Alternative wählen."}	3	6	\N	\N	\N
5534	niederlage	{defeat}	{"Die Niederlage war hart, aber die Mannschaft lernte daraus für die Zukunft.","Nach der Niederlage analysierte der Trainer die Fehler des Teams."}	3	6	2	\N	\N
5535	objektiv	{objective}	{"Ein guter Kommentator sollte objektiv bleiben, auch wenn er Fan einer Mannschaft ist.","Objektive Berichterstattung ist in den Medien unverzichtbar."}	3	6	\N	\N	\N
5536	quizshow	{"quiz show"}	{"In der Quizshow gewann der Kandidat, indem er alle Rätsel richtig löste.","Quizshows sind beliebt, weil sie Wissen und Unterhaltung kombinieren."}	3	6	2	\N	\N
5537	radrennen	{"cycling race"}	{"Das Radrennen fand bei Regen statt, was es besonders anspruchsvoll machte.","Fans des Radrennens verfolgten jede Etappe gespannt im Fernsehen."}	3	6	3	\N	\N
5538	rangliste	{"league table"}	{"Die Rangliste zeigt, welche Mannschaft aktuell die beste Leistung bringt.","Durch den Sieg stieg das Team in der Rangliste um drei Plätze."}	3	6	2	\N	\N
5539	rätsel	{puzzle}	{"Das Rätsel in der Detektivgeschichte war so schwer, dass niemand es löste.","Kinder lieben es, Rätsel zu lösen, weil es ihr Denken fördert."}	3	6	3	\N	rätsel
5540	reportage	{report}	{"Die Reportage über den Skisport zeigte atemberaubende Aufnahmen der Berge.","In der Reportage interviewten sie Experten zum Thema Klimawandel."}	3	6	2	\N	\N
5541	reporter/in	{reporter}	{"Die Reporterin befragte den Sieger unmittelbar nach dem Spiel.","Reporter müssen oft schnell reagieren, um aktuelle Ereignisse zu dokumentieren."}	3	6	5	\N	reporter/innen
5542	retten	{"to rescue"}	{"Der Torwart rettete das Spiel, indem er den entscheidenden Schuss abwehrte.","In der Serie rettete der Held die Stadt vor einer Katastrophe."}	3	6	\N	\N	\N
5543	romantisch	{romantic}	{"Der Film war so romantisch, dass einige Zuschauer vor Rührung weinten.","Romantische Komödien sind ideal für einen gemütlichen Abend zu zweit."}	3	6	\N	\N	\N
5544	runde	{round}	{"In der letzten Runde des Spiels schoss die Mannschaft das Siegtor.","Die Diskussionsrunde dauerte länger als geplant, weil viele mitreden wollten."}	3	6	2	\N	\N
5545	schalten	{"to switch"}	{"Viele Zuschauer schalten ein, wenn ihre Lieblingssendung läuft.","Er schaltete den Fernseher aus, weil er die Werbung nicht ertrug."}	3	6	\N	\N	\N
5546	schiedsrichter	{referee}	{"Der Schiedsrichter unterbrach das Spiel, weil ein Spieler verletzt war.","Ein fairer Schiedsrichter ist für den reibungslosen Ablauf des Spiels wichtig."}	3	6	1	\N	\N
5547	schießen	{"to shoot"}	{"Der Stürmer schoss das Tor in letzter Sekunde, was die Fans begeisterte.","In Actionfilmen wird oft geschossen, was nicht für Kinder geeignet ist."}	3	6	\N	\N	\N
5548	seifenoper	{"soap opera"}	{"Seifenopern haben viele Fans, obwohl die Handlung oft unrealistisch ist.","In der Seifenoper gab es dramatische Szenen, die die Zuschauer fesselten."}	3	6	2	\N	seifenopern
5549	sendung	{programme}	{"Die Sendung über gesunde Ernährung wurde von vielen Zuschauern positiv bewertet.","Jeden Montag läuft meine Lieblingssendung, die ich nie verpasse."}	3	6	2	\N	sendungen
5550	serie	{series}	{"Die Serie handelt von einem Mord, der eine ganze Familie betrifft.","Viele Serien setzen auf Spannung, um die Zuschauer bei Laune zu halten."}	3	6	2	\N	serien
5551	siegen	{"to win"}	{"Um zu siegen, muss die Mannschaft im Mittelfeld stärker werden.","Auch wenn man nicht immer siegt, sollte man stolz auf die Leistung sein."}	3	6	\N	\N	\N
5552	sieger/in	{winner}	{"Die Siegerin der Weltmeisterschaft wurde mit einer Goldmedaille geehrt.","Sieger/innen sollten auch lernen, mit Niederlagen umzugehen."}	3	6	5	\N	sieger/innen
5553	skisport	{"ski sport"}	{"Skisport ist im Winter beliebt, obwohl er teuer und wetterabhängig ist.","Im Skisport gibt es verschiedene Disziplinen wie Slalom oder Abfahrt."}	3	6	1	\N	\N
5554	soap	{"soap opera"}	{"Die Soap zeigt das Leben einer Familie, die viele Konflikte bewältigt.","Obwohl Soaps oft kritisiert werden, haben sie eine treue Fangemeinde."}	3	6	2	\N	\N
5555	spannend	{exciting}	{"Das Fußballspiel war spannend bis zur letzten Minute.","Spannende Bücher lassen einen oft die Zeit vergessen."}	3	6	\N	\N	\N
5556	spieler/in	{player}	{"Die Spielerin wurde ausgewechselt, nachdem sie ein Tor geschossen hatte.","Erfolgreiche Spieler/innen trainieren täglich, um ihre Fähigkeiten zu verbessern."}	3	6	5	\N	spieler/innen
5557	spielfilm	{"feature film"}	{"Der Spielfilm gewann mehrere Preise, darunter den für die beste Kamera.","Spielfilme bieten oft eine Mischung aus Unterhaltung und tiefgründigen Themen."}	3	6	1	\N	\N
5558	stadion	{stadium}	{"Das Stadion war ausverkauft, als die Mannschaft das entscheidende Spiel bestritt.","Moderne Stadien bieten nicht nur Sport, sondern auch Konzerte."}	3	6	3	\N	\N
5559	statistik	{statistics}	{"Laut Statistik verbringen Jugendliche mehr Zeit mit Serien als mit Sport.","Die Statistik zeigt, dass die Mehrheit für eine Regeländerung ist."}	3	6	2	\N	\N
5560	tagesablauf	{"daily routine"}	{"Ein strukturierter Tagesablauf hilft, Zeitverschwendung zu vermeiden.","In der Dokumentation wurde der Tagesablauf einer Profisportlerin gezeigt."}	3	6	1	\N	\N
5561	talkshow	{"talk show"}	{"In der Talkshow diskutierten Experten über die Zukunft des Sports.","Talkshows sind populär, weil sie aktuelle Themen lebhaft präsentieren."}	3	6	2	\N	\N
5562	tor	{goal}	{"Das Tor in der 89. Minute entschied das Spiel zugunsten unserer Mannschaft.","Tore zu schießen erfordert Präzision und schnelles Denken."}	3	6	3	\N	tore
5563	torwart/in	{goalie}	{"Die Torwartin rettete ihr Team mit einer spektakulären Parade.","Ein guter Torwart kann den Ausgang eines Spiels entscheidend beeinflussen."}	3	6	5	\N	torwarte/innen
5564	tote	{"dead people"}	{"Nach dem Krieg wurden viele Tote in Gedenkstätten beerdigt, um ihre Geschichte nicht zu vergessen.","In manchen Kulturen ehrt man die Tote mit besonderen Ritualen und Blumen."}	3	6	5	\N	toten
5565	übertragung	{transmission}	{"Die Übertragung des Fußballspiels wurde unterbrochen, weil das Wetter zu schlecht war.","Wissenschaftler untersuchten die Übertragung des Virus durch die Luft."}	3	6	2	\N	\N
5566	unentschieden	{undecided}	{"Das Spiel endete unentschieden, sodass beide Teams einen Punkt bekamen.","Ich bin noch unentschieden, ob ich heute ins Kino oder zu Hause bleiben soll."}	3	6	\N	\N	\N
5567	ungesund	{unhealthy}	{"Zu viel Fast Food ist ungesund, aber manchmal kann man nicht widerstehen.","Rauchen und wenig Schlaf sind genauso ungesund wie Stress im Beruf."}	3	6	\N	\N	\N
5568	unterhaltung	{entertainment}	{"Die Unterhaltung im Park war perfekt: Live-Musik, Theater und leckeres Essen.","Viele Menschen nutzen Streaming-Dienste zur Unterhaltung, weil sie bequem sind."}	3	6	2	\N	\N
5569	verlierer/in	{loser}	{"Der Verlierer des Wettbewerbs gratulierte der Gewinnerin trotzdem herzlich.","In der Politik gibt es immer Gewinner und Verlierer, je nach Entscheidung der Wähler."}	3	6	5	\N	verlierer/innen
5570	weltmeisterschaft	{"World cup"}	{"Die Weltmeisterschaft in Brasilien war voller Überraschungen und emotionaler Momente.","Viele Länder investieren Millionen, um die Weltmeisterschaft austragen zu können."}	3	6	2	\N	weltmeisterschaften
5571	weshalb	{"which is why"}	{"Es regnete stark, weshalb das Picknick im Park abgesagt werden musste.","Sie hatte kein Geld dabei, weshalb sie schnell nach Hause zurückging."}	3	6	\N	\N	\N
5572	zappen	{"to channel surf"}	{"Er zappte stundenlang durch die Fernsehkanäle, fand aber nichts Interessantes.","Wenn wir zappen, verpassen wir oft den Anfang der Filme, die wir suchen."}	3	6	\N	\N	\N
5573	zeichentrickfilm	{"animated film"}	{"Mein kleiner Bruder liebt japanische Zeichentrickfilme mehr als Realverfilmungen.","Disney hat viele berühmte Zeichentrickfilme produziert, die weltweit bekannt sind."}	3	6	1	\N	\N
5574	zeitverschwendung	{"waste of time"}	{"Social Media kann eine große Zeitverschwendung sein, wenn man nicht aufpasst.","Der Vortrag war reine Zeitverschwendung, weil keine neuen Informationen gegeben wurden."}	3	6	2	\N	\N
5575	zuschauer/in	{viewer}	{"Die Zuschauer im Stadion jubelten laut, als das Tor fiel.","Diese Serie hat Millionen von Zuschauern weltweit, die jede Folge diskutieren."}	3	6	5	\N	zuschauer/innen
5576	alliierte	{allies}	{"Die Alliierten beschlossen nach dem Krieg, Deutschland in vier Besatzungszonen aufzuteilen.","Ohne die Unterstützung der Alliierten hätte die Demokratie in Europa schwerer entstehen können."}	3	7	5	\N	alliierten
5577	amtssprache	{"official language"}	{"In Indien gibt es über 20 Amtssprachen, was die Kommunikation manchmal schwierig macht.","Wenn man in ein neues Land zieht, sollte man die Amtssprache möglichst schnell lernen."}	3	7	2	\N	amtssprachen
5578	anfangs	{initially}	{"Anfangs wollte sie Medizin studieren, aber später entschied sie sich für Politikwissenschaft.","Anfangs gab es viele Proteste gegen die Euroeinführung, doch heute akzeptieren die meisten Bürger den Euro."}	3	7	\N	\N	\N
5579	anheben	{"to raise"}	{"Die Regierung plant, das Mindestgehalt um 10% anzuheben, um die Arbeitskräfte zu unterstützen.","Er musste die schwere Kiste anheben, um sie in den LKW zu laden."}	3	7	\N	\N	\N
5580	arbeitskraft	{workforce}	{"Die Arbeitskraft in der Industrie wurde durch Maschinen ersetzt, was zu Arbeitslosigkeit führte.","Junge Arbeitskräfte wandern oft aus, um bessere Gehälter im Ausland zu erhalten."}	3	7	2	\N	arbeitskräfte
5581	arbeitslosigkeit	{unemployment}	{"Die Arbeitslosigkeit stieg nach der Wirtschaftskrise stark an, besonders unter Jugendlichen.","Die Regierung versucht, Arbeitslosigkeit durch neue Gesetze zu reduzieren."}	3	7	2	\N	\N
5582	astronaut/in	{astronaut}	{"Der Astronaut trainierte jahrelang, um ins Weltall fliegen zu können.","Sie war die erste Astronautin aus ihrem Land, die an einer internationalen Mission teilnahm."}	3	7	5	\N	astronauten/astronautinnen
5583	asyl	{asylum}	{"Viele Flüchtlinge suchten Asyl in Deutschland, nachdem der Bürgerkrieg in ihrer Heimat begann.","Das Recht auf Asyl ist in der Verfassung der Bundesrepublik festgeschrieben."}	3	7	3	\N	\N
5584	aufschreiben	{"to write down"}	{"Sie schrieb ihre Ideen schnell auf, um sie später nicht zu vergessen.","Der Lehrer bat die Schüler, die Regeln der Demokratie aufzuschreiben."}	3	7	\N	\N	\N
5585	aufteilen	{"to divide"}	{"Die Klasse wurde in Gruppen aufgeteilt, um das Projekt effizienter zu bearbeiten.","Nach dem Krieg wurde Berlin in vier Besatzungszonen aufgeteilt."}	3	7	\N	\N	\N
5586	auswanderer	{emigrant}	{"Im 19. Jahrhundert waren viele Auswanderer aus Deutschland in die USA gezogen.","Die Auswanderer vermissten ihre Heimat, hofften aber auf ein besseres Leben."}	3	7	1	\N	auswanderer
5587	auswanderung	{emigration}	{"Die Auswanderung aus Osteuropa nahm nach dem Mauerfall deutlich zu.","Wirtschaftliche Gründe sind oft der Auslöser für Auswanderung."}	3	7	2	\N	\N
5588	besatzungszone	{"occupied zone"}	{"Nach 1945 wurde Deutschland in vier Besatzungszonen der Alliierten aufgeteilt.","In der französischen Besatzungszone entwickelten sich eigene politische Strukturen."}	3	7	2	\N	besatzungszonen
5589	besiegen	{"to conquer"}	{"Die Armee konnte den Feind besiegen, aber der Krieg hinterließ große Zerstörung.","Im Sport ist es wichtig, nicht nur den Gegner, sondern auch eigene Zweifel zu besiegen."}	3	7	\N	\N	\N
5590	bundeskanzler/in	{"federal chancellor"}	{"Der erste Bundeskanzler der BRD, Konrad Adenauer, prägte die Nachkriegszeit entscheidend.","Die Bundeskanzlerin betonte in ihrer Rede die Bedeutung der EU für den Frieden."}	3	7	5	\N	bundeskanzler/innen
5591	bundesrepublik (brd)	{"federal republic (FRG)"}	{"Die Bundesrepublik wurde 1949 gegründet und entwickelte sich schnell zu einem demokratischen Staat.","Während der Teilung war die BRD eng mit der NATO verbunden."}	3	7	2	\N	\N
5592	bürger/in	{citizen}	{"Jeder Bürger hat das Recht, in freien Wahlen die Regierung zu bestimmen.","Die Bürger der DDR durften lange Zeit nicht in den Westen reisen."}	3	7	5	\N	bürger/innen
5593	bürgerkrieg	{"civil war"}	{"Der Bürgerkrieg zerstörte die Infrastruktur des Landes und trieb viele in die Auswanderung.","In einem Bürgerkrieg kämpfen oft Bürger desselben Staates gegeneinander."}	3	7	1	\N	\N
5594	demokratie	{democracy}	{"Eine funktionierende Demokratie erfordert informierte Bürger und freie Medien.","Nach dem Krieg wurde die Demokratie in Westdeutschland schrittweise eingeführt."}	3	7	2	\N	\N
5595	demokratisch	{democratic}	{"Die demokratischen Wahlen sorgten für Hoffnung auf politische Stabilität.","In einer demokratischen Republik haben alle Bürger gleiche Rechte."}	3	7	\N	\N	\N
5596	demonstration	{demonstration}	{"Die friedliche Demonstration forderte mehr Rechte für Migranten und Flüchtlinge.","Während der DDR-Zeit waren Demonstrationen gegen die Regierung verboten."}	3	7	2	\N	demonstrationen
5597	deutsche demokratische republik (ddr)	{"German democratic republic (GDR)"}	{"Die DDR wurde 1949 gegründet und existierte bis zur Wiedervereinigung 1990.","In der DDR kontrollierte die Regierung fast alle Bereiche des Lebens."}	3	7	2	\N	\N
5598	ehemalig	{former}	{"Der ehemalige Bundeskanzler sprach über die Herausforderungen der EU-Erweiterung.","Viele ehemalige Gastarbeiter blieben dauerhaft in Deutschland."}	3	7	\N	\N	\N
5599	einführen	{"to introduce"}	{"Die Regierung möchte ein neues Gesetz zur Förderung der Einwanderung einführen.","Die Euroeinführung war ein wichtiger Schritt für die europäische Integration."}	3	7	\N	\N	\N
5600	einsperren	{"to confine"}	{"Politische Gegner wurden während der Diktatur oft eingesperrt.","Man sollte Tiere nicht in kleinen Käfigen einsperren."}	3	7	\N	\N	\N
5601	einwanderung	{immigration}	{"Die Einwanderung nach Deutschland hat die Kultur des Landes vielfältiger gemacht.","Strenge Visumsregeln können legale Einwanderung erschweren."}	3	7	2	\N	\N
5602	emotional	{emotional}	{"Die Wiedervereinigung war ein emotionaler Moment für viele Deutsche.","In der Debatte wurde es sehr emotional, als es um Kindheitserinnerungen ging."}	3	7	\N	\N	\N
5603	entwickeln	{"to develop"}	{"Nach dem Krieg musste sich die Industrie komplett neu entwickeln.","Kinder entwickeln ihre Muttersprache natürlicherweise durch Zuhören."}	3	7	\N	\N	\N
5604	erinnern	{"to remember"}	{"Viele Zeitzeugen erinnern sich noch genau an den Mauerfall.","Ich kann mich kaum an meine ersten Jahre in der Krippe erinnern."}	3	7	\N	\N	\N
5605	erinnerung	{memory}	{"Die Erinnerung an den Krieg prägte die Generation meiner Großeltern.","In seinem Roman verarbeitete er Erinnerungen an seine Kindheit in der DDR."}	3	7	2	\N	erinnerungen
5606	ernähren	{"to feed"}	{"Viele Familien konnten sich nach dem Krieg kaum noch ernähren.","Eine ausgewogene Ernährung ist wichtig, um Kinder gesund zu ernähren."}	3	7	\N	\N	\N
5607	europäische union (eu)	{"European union"}	{"Die EU fördert die Zusammenarbeit zwischen ihren Mitgliedsstaaten.","Durch die EU können Bürger ohne Visum in viele Länder reisen."}	3	7	2	\N	\N
5608	euroeinführung	{"introduction of the Euro"}	{"Die Euroeinführung vereinfachte den Handel innerhalb der EU erheblich.","Anfangs gab es viele Kritiker der Euroeinführung, doch heute ist die Währung akzeptiert."}	3	7	2	\N	\N
5609	flüchtling	{refugee}	{"Viele Flüchtlinge fanden in Notunterkünften Schutz vor dem Bürgerkrieg.","Die Integration von Flüchtlingen ist eine wichtige Aufgabe für die Gesellschaft."}	3	7	1	\N	flüchtlinge
5610	fördern	{"to promote"}	{"Die Regierung fördert die Forschung im Bereich erneuerbarer Energien.","Sportvereine fördern nicht nur Talente, sondern auch Teamgeist."}	3	7	\N	\N	\N
5611	fremdsprache	{"foreign language"}	{"Englisch ist die meistgelernte Fremdsprache in deutschen Schulen.","Fremdsprachen zu beherrschen, eröffnet neue berufliche Möglichkeiten."}	3	7	2	\N	fremdsprachen
5612	friedlich	{peaceful}	{"Die Demonstration verlief friedlich, obwohl Tausende Menschen teilnahmen.","Nach dem Krieg sehnten sich alle nach einer friedlichen Zukunft."}	3	7	\N	\N	\N
5613	gastarbeiter/in	{"guest worker"}	{"In den 1960er Jahren kamen viele Gastarbeiter aus der Türkei nach Deutschland.","Die Gastarbeiter halfen, den Arbeitskräftemangel in der Industrie zu lösen."}	3	7	5	\N	gastarbeiter/innen
5614	gefühl	{feeling}	{"Beim Anblick der zerstörten Mauer hatte sie gemischte Gefühle.","Sein Gefühl sagte ihm, dass die Entscheidung falsch war."}	3	7	3	\N	gefühle
5615	gegner/in	{opponent}	{"Die politischen Gegner kritisierten die Pläne der Regierung scharf.","Im Sport respektierte er immer seine Gegner, auch wenn er verlor."}	3	7	5	\N	gegner/innen
5616	gehalt	{salary}	{"Das Gehalt in der IT-Branche ist oft höher als in anderen Bereichen.","Trotz des guten Gehalts verließ er den Job, weil er unzufrieden war."}	3	7	3	\N	gehälter
5617	gewürz	{spice}	{"Gewürze wie Pfeffer und Zimt waren früher sehr wertvoll und teuer.","Ohne die richtigen Gewürze schmeckt das Gericht fad."}	3	7	3	\N	gewürze
5618	grenze	{border}	{"Nach dem Mauerfall öffnete sich die Grenze zwischen Ost- und Westdeutschland.","Die Grenze zwischen Österreich und Deutschland ist für Reisende kaum sichtbar."}	3	7	2	\N	grenzen
5619	gründen	{"to establish"}	{"1949 wurde die Bundesrepublik Deutschland als demokratischer Staat gegründet.","Sie möchte ein Startup gründen, das nachhaltige Produkte herstellt."}	3	7	\N	\N	\N
5620	hart	{hard}	{"Die Arbeit in der Fabrik war hart, aber sie verdienten damit ihr Gehalt.","Nach Jahren der Diktatur war der Übergang zur Demokratie hart."}	3	7	\N	\N	\N
5621	hauptstadt	{"capital city"}	{"Berlin ist nicht nur die Hauptstadt Deutschlands, sondern auch ein kulturelles Zentrum.","Jede Hauptstadt spiegelt die Geschichte und Identität ihres Landes wider."}	3	7	2	\N	hauptstädte
5622	heimat	{"home country"}	{"Viele Russlanddeutsche kehrten in ihre Heimat zurück, nachdem die Sowjetunion zerfiel.","Heimat kann für Migranten sowohl das neue als auch das alte Land sein."}	3	7	2	\N	\N
5623	industrie	{industry}	{"Die deutsche Industrie spielte eine Schlüsselrolle im Wiederaufbau nach dem Krieg.","Durch Automatisierung verändert sich die Industrie weltweit rasch."}	3	7	2	\N	\N
5624	irgendwann	{"at some point"}	{"Irgendwann wird die Menschheit vielleicht Kolonien im Weltall gründen.","Jeder möchte irgendwann in seinem Leben die Hauptstadt seines Landes besuchen."}	3	7	\N	\N	\N
5625	jahrelang	{"for years"}	{"Jahrelang arbeitete er als Gastarbeiter in Deutschland, um seiner Familie zu helfen.","Die Forschung an der Medizin dauerte jahrelang, war aber erfolgreich."}	3	7	\N	\N	\N
5626	jahrhundert	{century}	{"Das 20. Jahrhundert war geprägt von zwei Weltkriegen und technischem Fortschritt.","In diesem Jahrhundert wird die Klimakrise eine große Herausforderung sein."}	3	7	3	\N	jahrhunderte
5627	jahrzehnt	{decade}	{"Ein Jahrzehnt nach dem Mauerfall war Deutschland wieder vereint.","In den letzten Jahrzehnten hat sich die Migration stark verändert."}	3	7	3	\N	jahrzehnte
5628	jude/jüdin	{jew}	{"Während des Nationalsozialismus wurden viele Juden und Jüdinnen verfolgt.","Heute leben in Deutschland wieder zahlreiche jüdische Gemeinden."}	3	7	5	\N	juden/jüdinnen
5629	kaum	{hardly}	{"Nach dem Krieg gab es kaum noch Industrie, die funktionsfähig war.","Sie konnte es kaum erwarten, ihre Heimat nach Jahren wiederzusehen."}	3	7	\N	\N	\N
5630	kindheit	{childhood}	{"Ihre Kindheit verbrachte sie in einer kleinen Stadt nahe der Grenze.","In der Nachkriegszeit war die Kindheit vieler Menschen von Armut geprägt."}	3	7	2	\N	\N
5631	krieg	{war}	{"Der Krieg zerstörte nicht nur Städte, sondern auch Familien und Träume.","Viele Staaten versuchen heute, Konflikte ohne Krieg zu lösen."}	3	7	1	\N	kriege
5632	kriegsende	{"end of war"}	{"Das Kriegsende 1945 brachte Erleichterung, aber auch neue Herausforderungen.","Veteranen erinnern sich oft emotional an das Kriegsende."}	3	7	3	\N	\N
5633	krippe	{crib}	{"In der Krippe im Dorf wurden Kinder von berufstätigen Eltern betreut.","Die Krippe war aus Holz und stand seit Generationen in der Familie."}	3	7	2	\N	krippen
5634	kritiker/in	{critic}	{"Kritiker der Regierung warnten vor den Folgen der neuen Gesetze.","Auch wenn er ein Kritiker der EU ist, unterstützt er die Idee der Zusammenarbeit."}	3	7	5	\N	kritiker/innen
5635	mauer	{wall}	{"Die Berliner Mauer trennte die Stadt fast drei Jahrzehnte lang.","Heute sind nur noch kleine Teile der Mauer als Denkmal erhalten."}	3	7	2	\N	mauern
5636	mauerbau	{"building of the wall"}	{"Der Mauerbau 1961 verschärfte die Spannungen zwischen Ost und West.","Viele Familien wurden durch den Mauerbau getrennt."}	3	7	1	\N	\N
5637	mauerfall	{"fall of the Berlin wall"}	{"Der Mauerfall 1989 markierte den Beginn der deutschen Wiedervereinigung.","Menschen auf der ganzen Welt feierten den Mauerfall als Symbol der Freiheit."}	3	7	1	\N	\N
5638	medizin	{medicine}	{"Die moderne Medizin hat viele Krankheiten besiegt, die früher tödlich waren.","Er studierte Medizin, um später in Entwicklungsländern zu helfen."}	3	7	2	\N	\N
5639	merken	{"to realise"}	{"Er merkte erst spät, dass sein Visum abgelaufen war.","Die Regierung merkte schnell, dass die Reformen nicht ausreichten."}	3	7	\N	\N	\N
5640	migration	{migration}	{"Migration hat viele Ursachen, wie Kriege, Armut oder Hoffnung auf Bildung.","Die EU versucht, gemeinsame Regeln für Migration zu entwickeln."}	3	7	2	\N	\N
5641	miteinander	{together}	{"Nach der Wiedervereinigung mussten Ost und West lernen, miteinander zu leben.","In der Demokratie geht es darum, Konflikte friedlich miteinander zu lösen."}	3	7	\N	\N	\N
5642	miterleben	{"to experience with"}	{"Sie durfte miterleben, wie ihr Land nach Jahren des Krieges wieder aufgebaut wurde.","Kinder, die den Mauerfall miterlebten, erinnern sich noch genau daran."}	3	7	\N	\N	\N
5643	musikalisch	{musical}	{"Die Stadt ist bekannt für ihr musikalisches Erbe und viele Konzerte.","Schon in der Kindheit zeigte er musikalisches Talent."}	3	7	\N	\N	\N
5644	muttersprache	{"native language"}	{"Seine Muttersprache ist Deutsch, aber er spricht fließend drei Fremdsprachen.","In vielen Ländern ist die Muttersprache der Minderheiten geschützt."}	3	7	2	\N	muttersprachen
5645	nachkriegszeit	{"post-war years"}	{"In der Nachkriegszeit herrschte in Deutschland große Armut und Arbeitslosigkeit.","Viele Gebäude aus der Nachkriegszeit sind heute denkmalgeschützt."}	3	7	2	\N	\N
5646	nationalsozialismus	{"national socialism"}	{"Der Nationalsozialismus führte zu einer der dunkelsten Phasen der deutschen Geschichte.","Über den Nationalsozialismus wird in Schulen ausführlich aufgeklärt."}	3	7	1	\N	\N
5647	nato	{NATO}	{"Die NATO wurde gegründet, um die Sicherheit der Mitgliedsstaaten zu gewährleisten.","Nach dem Kriegsende trat Deutschland der NATO bei."}	3	7	2	\N	\N
5648	notunterkunft	{"emergency accommodation"}	{"Die Flüchtlinge wurden vorübergehend in einer Notunterkunft untergebracht.","Nach dem Erdbeben fehlte es an ausreichend Notunterkünften."}	3	7	2	\N	notunterkünfte
5649	öffnung	{opening}	{"Die Öffnung der Grenzen ermöglichte vielen Familien die Wiedervereinigung.","Die Öffnung der EU für neue Mitglieder ist ein kontroverses Thema."}	3	7	2	\N	\N
5650	phase	{phase}	{"In der ersten Phase des Projekts wurden die Grundlagen erforscht.","Jede politische Reform durchläuft mehrere Phasen der Diskussion."}	3	7	2	\N	phasen
5651	politisch	{political}	{"Die politische Lage in vielen Ländern ist instabil, was Migration verstärkt.","Er engagiert sich politisch, um demokratische Werte zu fördern."}	3	7	\N	\N	\N
5652	protest	{protest}	{"Der Protest gegen die Arbeitslosigkeit führte zu neuen Gesetzen.","Friedliche Proteste sind ein Grundrecht in demokratischen Staaten."}	3	7	1	\N	proteste
5653	regierung	{government}	{"Die Regierung beschloss, die Steuern für Familien zu senken.","In der DDR kontrollierte die Regierung fast alle Medien."}	3	7	2	\N	regierungen
5654	republik	{republic}	{"Deutschland ist eine parlamentarische Republik mit einem Bundespräsidenten.","Viele Republiken kämpfen um die Balance zwischen Freiheit und Sicherheit."}	3	7	2	\N	republiken
5655	russlanddeutsche	{German-Russian}	{"Viele Russlanddeutsche kehrten nach Deutschland zurück, nachdem die Sowjetunion zerfiel.","Die Kultur der Russlanddeutschen ist eine Mischung aus deutschen und russischen Traditionen."}	3	7	5	\N	russlanddeutschen
5656	staat	{state}	{"Jeder Staat hat eigene Gesetze, die die Bürger befolgen müssen.","Kleine Staaten haben oft weniger Einfluss in internationalen Organisationen."}	3	7	1	\N	staaten
5657	staatsgründung	{"formation of a state"}	{"Die Staatsgründung Israels 1948 war ein historischer Moment für das jüdische Volk.","Die Staatsgründung der BRD markierte einen Neuanfang nach dem Krieg."}	3	7	2	\N	\N
5658	stipendium	{scholarship}	{"Dank eines Stipendiums konnte sie ihr Studium im Ausland finanzieren.","Stipendien fördern begabte Studenten, unabhängig von ihrem Einkommen."}	3	7	3	\N	stipendien
5659	tatsächlich	{actual}	{"Tatsächlich war die Arbeitslosigkeit niedriger als erwartet.","Viele glaubten nicht, dass die Wiedervereinigung tatsächlich passieren würde."}	3	7	\N	\N	\N
5660	teilung	{division}	{"Die Teilung Deutschlands prägte die Politik des 20. Jahrhunderts.","Die Teilung der Aufgaben im Team führte zum Erfolg des Projekts."}	3	7	2	\N	teilungen
5661	verdrängen	{"to suppress"}	{"Viele verdrängten die Erinnerungen an den Krieg, um weiterleben zu können.","Große Konzerne verdrängen oft kleine Unternehmen vom Markt."}	3	7	\N	\N	\N
5662	vereinigen	{"to unite"}	{"1990 gelang es, Ost- und Westdeutschland wieder zu vereinigen.","Die EU versucht, verschiedene Kulturen unter gemeinsamen Werten zu vereinigen."}	3	7	\N	\N	\N
5663	verfolgen	{"to follow"}	{"Die Polizei verfolgte den Verdächtigen, bis sie ihn verhaften konnte.","Sie verfolgt seit Jahren das Ziel, als Astronautin ins Weltall zu fliegen."}	3	7	\N	\N	\N
5664	verhaften	{"to arrest"}	{"Während der Diktatur wurden viele Regierungskritiker verhaftet.","Die Polizei konnte den Dieb schnell verhaften, nachdem Zeugen ihn erkannt hatten."}	3	7	\N	\N	\N
5665	verlängern	{"to extend"}	{"Das Visum wurde um sechs Monate verlängert, sodass er länger bleiben konnte.","Die Regierung beschloss, die Arbeitslosengeld-Zahlungen zu verlängern."}	3	7	\N	\N	\N
5666	verlassen	{"to leave"}	{"Viele Auswanderer verließen ihre Heimat, um in einem neuen Staat zu leben.","Man kann sich in einer Demokratie darauf verlassen, dass Wahlen fair sind."}	3	7	\N	\N	\N
5667	vermischen	{"to mix"}	{"In großen Städten vermischen sich oft Kulturen und Sprachen.","Die Gewürze wurden sorgfältig vermischt, um den perfekten Geschmack zu erreichen."}	3	7	\N	\N	\N
5668	visum	{visa}	{"Ohne gültiges Visum durfte er nicht in die USA einreisen.","Das Visum für Studenten ermöglichte ihm, zwei Jahre im Ausland zu studieren."}	3	7	3	\N	visa
5669	weltall	{space}	{"Die Erforschung des Weltalls ist ein Traum vieler Wissenschaftler.","Astronauten berichten oft von ihrem emotionalen Erlebnis im Weltall."}	3	7	3	\N	\N
5670	wiedervereinigen	{"to re-unify"}	{"Es dauerte Jahrzehnte, bis sich die beiden Staaten wiedervereinigen konnten.","Die Hoffnung, Familien wiederzuvereinigen, trieb viele politische Entscheidungen an."}	3	7	\N	\N	\N
5671	wiedervereinigung	{reunification}	{"Die deutsche Wiedervereinigung 1990 war ein historisches Ereignis für Europa.","Die Feier zur Wiedervereinigung fand vor dem Brandenburger Tor statt."}	3	7	2	\N	\N
5672	zerschlagen	{"to destroy"}	{"Der Konflikt zerschlug die Hoffnung auf eine friedliche Lösung.","Nach dem Krieg wurde die Industrie des Landes fast vollständig zerschlagen."}	3	7	\N	\N	\N
5673	zurückkehren	{"to return"}	{"Nach Jahren im Ausland kehrte sie in ihre Heimat zurück, um ihre Familie zu sehen.","Viele Flüchtlinge hoffen, irgendwann sicher in ihr Land zurückzukehren."}	3	7	\N	\N	\N
5674	abschicken	{"to submit"}	{"Sie muss das Antragsformular bis morgen abschicken, sonst verpasst sie die Frist.","Nachdem er den Brief abgeschickt hatte, fühlte er sich erleichtert."}	3	8	\N	\N	\N
5675	abwicklung	{settlement}	{"Die Abwicklung des Vertrags dauerte länger als erwartet, weil Dokumente fehlten.","Für die Abwicklung des Erbes benötigt man oft einen Anwalt."}	3	8	2	\N	\N
5676	amtlich	{official}	{"Die amtliche Bestätigung muss beglaubigt sein, um gültig zu sein.","Er trug einen amtlichen Ausweis, um sich bei der Behörde auszuweisen."}	3	8	\N	\N	\N
5677	anerkennen	{"to recognise"}	{"Die Universität erkennt sein ausländisches Diplom leider nicht an.","Seine Leistungen wurden endlich von der Firma anerkannt."}	3	8	\N	\N	\N
5678	anerkennung	{recognition}	{"Für ihre Arbeit erhielt sie eine öffentliche Anerkennung vom Bürgermeister.","Anerkennung im Beruf ist genauso wichtig wie ein gutes Gehalt."}	3	8	2	\N	\N
5679	anfang	{beginning}	{"Am Anfang des Kurses waren alle nervös, aber jetzt fühlen sie sich wohl.","Die Anfänge des Projekts waren chaotisch, doch jetzt läuft alles reibungslos."}	3	8	1	\N	anfänge
5680	ansteckend	{infectious}	{"Seine gute Laune war so ansteckend, dass alle im Raum lächelten.","Die Krankheit ist hoch ansteckend, deshalb muss man vorsichtig sein."}	3	8	\N	\N	\N
5681	ausstellen	{"to issue"}	{"Das Bürgeramt wird Ihnen einen neuen Pass innerhalb von zwei Wochen ausstellen.","Das Gesundheitszeugnis kann nur von einem Arzt ausgestellt werden."}	3	8	\N	\N	\N
5682	bearbeitung	{processing}	{"Die Bearbeitung Ihres Visums kann bis zu sechs Wochen dauern.","Während der Bearbeitung des Antrags können keine Änderungen vorgenommen werden."}	3	8	2	\N	\N
5683	beglaubigen	{"to certify"}	{"Die Unterschrift muss von einem Notar beglaubigt werden, um gültig zu sein.","Er ließ seine Zeugnisse beglaubigen, bevor er sie einreichte."}	3	8	\N	\N	\N
5684	beglaubigung	{certification}	{"Ohne die Beglaubigung der Kopie wird das Dokument nicht akzeptiert.","Die Beglaubigung durch die Botschaft kostet 30 Euro."}	3	8	2	\N	\N
5685	bekannte	{acquaintance}	{"Eine Bekannte aus meinem Sprachkurs hat mir beim Übersetzen geholfen.","Er ist kein enger Freund, nur ein Bekannter von der Arbeit."}	3	8	\N	\N	bekannten
5686	benötigen	{"to require"}	{"Für die Anmeldung benötigen Sie einen gültigen Ausweis und eine Meldebescheinigung.","Die Bearbeitung benötigt Geduld, da viele Anträge eingegangen sind."}	3	8	\N	\N	\N
5687	berufen	{"to appoint"}	{"Der Direktor wurde vom Vorstand berufen, um die Abteilung zu leiten.","Sie fühlte sich berufen, Pflegehelferin zu werden, um Menschen zu helfen."}	3	8	\N	\N	\N
5688	bescheinigen	{"to certify"}	{"Der Arzt bescheinigte ihm, dass er gesundheitlich für den Job geeignet ist.","Die Teilnahme am Kurs wird durch ein Zertifikat bescheinigt."}	3	8	\N	\N	\N
5689	dran sein	{"to be for it"}	{"Wenn du nicht dran bist, musst du warten, bis dein Name aufgerufen wird.","„Wer ist dran, die Dokumente abzuholen?“ – „Ich glaube, du bist dran!“"}	3	8	\N	\N	\N
5690	einreichen	{"to submit"}	{"Sie müssen alle Unterlagen bis Freitag einreichen, sonst verfällt der Anspruch.","Nachdem er die Steuererklärung eingereicht hatte, wartete er auf die Rückmeldung."}	3	8	\N	\N	\N
5691	enttäuschen	{"to disappoint"}	{"Es enttäuschte ihn sehr, dass sein Antrag abgelehnt wurde.","Sie wollte ihre Eltern nicht enttäuschen und arbeitete hart für das Stipendium."}	3	8	\N	\N	\N
5692	enttäuschung	{disappointment}	{"Die Absage des Jobs war eine große Enttäuschung für ihn.","Trotz der Enttäuschungen gab sie nicht auf und versuchte es erneut."}	3	8	2	\N	enttäuschungen
5693	erhalt	{receipt}	{"Bewahren Sie den Erhalt der Sendung gut auf, falls es Probleme gibt.","Nach dem Erhalt des Briefes kontaktierte sie sofort die Behörde."}	3	8	1	\N	\N
5694	erklärung	{explanation}	{"Die Sachbearbeiterin gab eine detaillierte Erklärung zum Ablauf des Verfahrens.","Ohne eine klare Erklärung verstand er die Formalitäten nicht."}	3	8	2	\N	erklärungen
5695	erkundigen	{"to enquire"}	{"Er erkundigte sich beim Amt, welche Dokumente er benötigte.","Bevor Sie den Antrag stellen, sollten Sie sich nach den Voraussetzungen erkundigen."}	3	8	\N	\N	\N
5696	fähigkeit	{ability}	{"Seine sprachlichen Fähigkeiten halfen ihm, schnell Freunde zu finden.","Die Fähigkeit, geduldig zu sein, ist in diesem Job sehr wichtig."}	3	8	2	\N	fähigkeiten
5697	fantasie	{phantasy}	{"Kinder haben eine lebhafte Fantasie, die man fördern sollte.","Ohne Fantasie wären viele Erfindungen nie entstanden."}	3	8	2	\N	\N
5698	formalität	{formality}	{"Die Formalitäten bei der Visa-Beantragung können sehr zeitaufwendig sein.","Es ist nur eine Formalität – unterschreiben Sie bitte hier."}	3	8	2	\N	formalitäten
5699	förmlich	{formal}	{"Die Einladung war förmlich verfasst, mit allen Titeln und Anreden.","In manchen Kulturen ist die Kommunikation sehr förmlich, in anderen locker."}	3	8	\N	\N	\N
5700	fotokopie	{photocopy}	{"Reichen Sie bitte eine Fotokopie Ihres Ausweises zusammen dem Original ein.","Die Fotokopien der Verträge wurden in einer Mappe zusammengestellt."}	3	8	2	\N	fotokopien
5701	frieden	{peace}	{"Nach langen Verhandlungen herrschte endlich Frieden zwischen den Nachbarländern.","Sie zog sich in die Natur zurück, um inneren Frieden zu finden."}	3	8	1	\N	\N
5702	führungszeugnis	{"certificate of good conduct"}	{"Für die Arbeitserlaubnis benötigen Sie ein aktuelles Führungszeugnis.","Das Führungszeugnis kann online beantragt und zugeschickt werden."}	3	8	3	\N	\N
5703	garantieren	{"to guarantee"}	{"Der Hersteller garantiert eine schnelle Reparatur innerhalb von 24 Stunden.","Wir können leider nicht garantieren, dass alle Unterlagen rechtzeitig bearbeitet werden."}	3	8	\N	\N	\N
5704	gedanke	{thought}	{"Der Gedanke an die Prüfung ließ ihn nachts nicht schlafen.","Plötzlich kam ihr der Gedanke, dass sie etwas Wichtiges vergessen hatte."}	3	8	1	\N	gedanken
5705	geduld	{patience}	{"Geduld ist eine Tugend, besonders wenn man auf Amtternminate wartet.","Ohne Geduld würde man bei so vielen Formalitäten schnell verzweifeln."}	3	8	2	\N	\N
5706	geduldig	{patient}	{"Die Sachbearbeiterin war sehr geduldig und erklärte alles Schritt für Schritt.","Sei geduldig – die Bearbeitung kann einige Tage dauern."}	3	8	\N	\N	\N
5707	gemeinsamkeit	{"common feature"}	{"Trotz ihrer unterschiedlichen Herkunftsländer fanden sie viele Gemeinsamkeiten.","Eine Gemeinsamkeit aller Kulturen ist der Wunsch nach Frieden."}	3	8	2	\N	gemeinsamkeiten
5708	geruch	{smell}	{"Der Geruch von frischem Kaffee erinnerte sie an ihre Kindheit.","Ein seltsamer Geruch im Flur ließ sie misstrauisch werden."}	3	8	1	\N	gerüche
5709	gesundheitszeugnis	{"health certificate"}	{"Für die Arbeit in der Küche braucht man ein gültiges Gesundheitszeugnis.","Das Gesundheitszeugnis muss alle zwei Jahre erneuert werden."}	3	8	3	\N	\N
5710	gewährleisten	{"to ensure"}	{"Die Firma gewährleistet, dass alle Daten sicher gespeichert werden.","Nur eine gute Vorbereitung kann den Erfolg des Projekts gewährleisten."}	3	8	\N	\N	\N
5711	häufig	{often}	{"Häufig kommt es zu Verzögerungen, wenn Dokumente unvollständig sind.","Sie besucht häufig das Übersetzungsbüro, um ihre Unterlagen zu beglaubigen."}	3	8	\N	\N	\N
5712	heimweh	{"home sickness"}	{"In den ersten Wochen im Ausland hatte sie starkes Heimweh nach ihrer Familie.","Sein Heimweh verschwand langsam, als er neue Freunde fand."}	3	8	3	\N	\N
5713	herkommen	{"to come from"}	{"„Woher kommst du eigentlich?“ – „Ich komme aus Syrien her.“","Viele der Pflegekräfte herkommen aus osteuropäischen Ländern."}	3	8	\N	\N	\N
5714	herkunftsland	{"country of origin"}	{"Im Herkunftsland der Familie gibt es viele kulturelle Traditionen.","Das Gericht ist typisch für mein Herkunftsland und schmeckt wunderbar."}	3	8	3	\N	herkunftsländer
5715	hierher	{here}	{"Wie bist du eigentlich hierher gekommen? Mit dem Zug oder dem Auto?","Sie lud ihre Bekannten hierher ein, um ihnen ihre neue Wohnung zu zeigen."}	3	8	\N	\N	\N
5716	hilfsbereit	{"ready to help"}	{"Die Kollegen sind sehr hilfsbereit und erklären alles geduldig.","In kleinen Dörfern sind die Menschen oft besonders hilfsbereit."}	3	8	\N	\N	\N
5717	inzwischen	{meanwhile}	{"Inzwischen hat sie gelernt, die Formalitäten selbstständig zu erledigen.","Er wartete auf die Antwort und las inzwischen ein Buch."}	3	8	\N	\N	\N
5718	kopie	{copy}	{"Bitte reichen Sie eine Kopie Ihres Abschlusszeugnisses ein.","Die Kopien der Verträge wurden alphabetisch sortiert."}	3	8	2	\N	kopien
5719	mentalität	{mentality}	{"Die Mentalität der Menschen hier ist sehr offen und freundlich.","Arbeitsmoral und Mentalität unterscheiden sich oft zwischen Kulturen."}	3	8	2	\N	mentalitäten
5720	nachdenklich	{thoughtful}	{"Die Absage machte ihn nachdenklich, aber er gab nicht auf.","Sie saß nachdenklich am Fenster und überlegte, was sie tun sollte."}	3	8	\N	\N	\N
5721	pflegehelfer/in	{"nursing assistant"}	{"Als Pflegehelferin unterstützt sie ältere Menschen im Alltag.","Pflegehelfer müssen einfühlsam und geduldig sein."}	3	8	5	\N	pflegehelfer/innen
5722	pflegekraft	{carer}	{"Die Pflegekräfte in diesem Krankenhaus sind sehr kompetent.","Aufgrund des Personalmangels werden dringend Pflegekräfte gesucht."}	3	8	2	\N	pflegekräfte
5723	reihe	{row}	{"In der Reihe vor dem Schalter warteten bereits zehn Menschen.","Die Dokumente lagen ordentlich in einer Reihe auf dem Tisch."}	3	8	2	\N	\N
5724	sachbearbeiter/in	{"administrative assistant"}	{"Der Sachbearbeiter prüfte die Unterlagen sorgfältig auf Vollständigkeit.","Die Sachbearbeiterin erklärte mir, welche Formulare ich benötige."}	3	8	5	\N	sachbearbeiter/innen
5725	sprachnachweis	{"language certificate"}	{"Für das Studium benötigen Sie einen offiziellen Sprachnachweis wie das Goethe-Zertifikat.","Ohne einen gültigen Sprachnachweis kann die Bewerbung nicht berücksichtigt werden."}	3	8	1	\N	\N
5726	übereinstimmen	{"to correspond"}	{"Die Angaben in den Dokumenten müssen genau übereinstimmen, sonst gibt es Probleme.","Seine Version der Geschichte stimmt nicht mit ihrer überein."}	3	8	\N	\N	\N
5727	überglücklich	{overjoyed}	{"Sie war überglücklich, als sie die Zusage für das Stipendium erhielt.","Überglücklich rief er seine Familie an, um die gute Nachricht mitzuteilen."}	3	8	\N	\N	\N
5728	übersetzen	{"to translate"}	{"Er übersetzte den Vertrag ins Deutsche, weil die Firma keinen Übersetzer hatte.","Können Sie diesen Satz für mich vom Englischen ins Arabische übersetzen?"}	3	8	\N	\N	\N
5729	übersetzung	{translation}	{"Die Übersetzung des Dokuments muss von einem zertifizierten Büro beglaubigt werden.","Fehler in der Übersetzung können zu Missverständnissen führen."}	3	8	2	\N	übersetzungen
5730	übersetzungsbüro	{"translation agency"}	{"Das Übersetzungsbüro garantierte eine schnelle Bearbeitung der Unterlagen.","Sie arbeitet in einem Übersetzungsbüro und übersetzt juristische Texte."}	3	8	3	\N	\N
5731	ungeduldig	{impatient}	{"Nach einer Stunde Wartezeit wurde er ungeduldig und fragte nach dem Status.","Ungeduldig tippte er mit den Fingern auf den Tisch."}	3	8	\N	\N	\N
5732	vermissen	{"to miss"}	{"Sie vermisste ihre Familie sehr, als sie zum ersten Mal im Ausland lebte.","Was vermisst du am meisten aus deinem Herkunftsland?"}	3	8	\N	\N	\N
5733	verurteilen	{"to judge"}	{"Der Richter verurteilte den Angeklagten zu einer Geldstrafe.","Man sollte niemanden vorschnell verurteilen, ohne die Fakten zu kennen."}	3	8	\N	\N	\N
5734	wahr	{true}	{"Es ist wahr, dass die Bearbeitungszeit manchmal sehr lang ist.","Sie konnte kaum glauben, dass die gute Nachricht wahr war."}	3	8	\N	\N	\N
5735	weitergehen	{"to continue"}	{"Nach der Pause ging die Sachbearbeiterin mit der Prüfung der Unterlagen weiter.","„Können wir bitte weitergehen? Wir haben noch viel zu erledigen.“"}	3	8	\N	\N	\N
5736	wohlfühlen	{"to feel comfortable"}	{"Er fühlte sich in der neuen Stadt schnell wohl, obwohl er Heimweh hatte.","In einer förmlichen Umgebung kann ich mich nicht richtig wohlfühlen."}	3	8	\N	\N	\N
5737	ziel	{aim}	{"Sein Ziel war es, ohne Hilfe alle Formalitäten zu bewältigen.","Das Hauptziel des Projekts ist die Vereinfachung der Abwicklung."}	3	8	3	\N	ziele
5738	zügig	{quick}	{"Die Bearbeitung des Antrags verlief zügig, sodass er schon nach drei Tagen eine Antwort erhielt.","Bitte arbeiten Sie zügig, wir haben nur begrenzt Zeit."}	3	8	\N	\N	\N
5739	zusammenstellen	{"to put together"}	{"Er stellte alle benötigten Dokumente in einer Mappe zusammen.","Das Übersetzungsbüro hilft dabei, die Unterlagen für die Visa-Beantragung zusammenzustellen."}	3	8	\N	\N	\N
5740	abhängig	{dependent}	{"Seine Anstellung ist abhängig von der erfolgreichen Absolvierung der Probezeit.","Die Software ist abhängig von regelmäßigen Updates, um effizient zu bleiben."}	3	9	\N	\N	\N
5741	absolvieren	{"to complete"}	{"Sie absolvierte ein Praktikum in der Betriebswirtschaft, um Berufserfahrung zu sammeln.","Nachdem er die Fortbildung absolviert hatte, konnte er sich für höhere Positionen bewerben."}	3	9	\N	\N	\N
5742	abteilungsleiter/in	{"division manager"}	{"Die Abteilungsleiterin organisierte eine Teamsitzung zur Verbesserung der Arbeitsweise.","Abteilungsleiter müssen sowohl kommunikativ als auch entscheidungsfreudig sein."}	3	9	5	\N	abteilungsleiter/innen
5743	abwechslungsreich	{varied}	{"Die Stelle als Projektmanagerin ist abwechslungsreich und fordert Kreativität.","Ein abwechslungsreicher Berufsalltag motiviert viele Mitarbeiter."}	3	9	\N	\N	\N
5744	altenpfleger/in	{"geriatric nurse"}	{"Altenpflegerinnen im Seniorenheim kümmern sich liebevoll um die Bewohner.","Der Beruf des Altenpflegers erfordert Geduld und Einfühlungsvermögen."}	3	9	5	\N	altenpfleger/innen
5745	anlage	{system}	{"Die technische Anlage im Maschinenbau muss regelmäßig gewartet werden.","In der Bewerbung fügte er eine Anlage mit seinen Zeugnissen bei."}	3	9	2	\N	\N
5746	annahme	{acceptance}	{"Die Annahme des Vertrags erfolgte nach einer ausführlichen Prüfung.","Die schnelle Annahme seines Angebots überraschte ihn positiv."}	3	9	2	\N	\N
5747	anrechnen	{"to charge"}	{"Seine Berufserfahrung wurde bei der Gehaltsverhandlung angerechnet.","Überstunden können als Urlaubstage angerechnet werden."}	3	9	\N	\N	\N
5748	anstellung	{employment}	{"Die unbefristete Anstellung gab ihm finanzielle Sicherheit.","Eine Festanstellung ist oft mit sozialen Leistungen verbunden."}	3	9	2	\N	\N
5749	arbeitsstelle	{position}	{"Sie sucht eine neue Arbeitsstelle in der Telekommunikationsbranche.","Die Arbeitsstelle als Sachbearbeiterin erfordert Genauigkeit."}	3	9	2	\N	\N
5750	arbeitsweise	{"working method"}	{"Seine strukturierte Arbeitsweise führt zu effizienten Ergebnissen.","Die agile Arbeitsweise des Teams fördert Innovationen."}	3	9	2	\N	\N
5751	arbeitszeit	{"working hours"}	{"Flexible Arbeitszeiten sind in vielen modernen Unternehmen üblich.","Die Arbeitszeiten im Schichtdienst können körperlich anstrengend sein."}	3	9	2	\N	arbeitszeiten
5752	assistenz	{assistance}	{"Die Assistenz der Geschäftsführung organisiert den täglichen Ablauf.","Ohne die Assistenz des Teams wäre das Projekt nicht möglich gewesen."}	3	9	2	\N	\N
5753	aufteilung	{allocation}	{"Die Aufteilung der Aufgaben im Team erfolgte nach Kompetenzen.","Eine klare Aufteilung der Verantwortung vermeidet Konflikte."}	3	9	2	\N	\N
5754	auszug	{extract}	{"Im Anschreiben fügte er einen Auszug seines Lebenslaufs bei.","Ein Auszug aus der Gehaltsabrechnung wurde angefordert."}	3	9	1	\N	auszüge
5755	bachelor	{"Bachelor's degree"}	{"Sie hat einen Bachelor in Betriebswirtschaft mit Schwerpunkt Finanzwesen.","Ein Bachelor-Abschluss ist oft die Grundlage für den Berufseinstieg."}	3	9	1	\N	\N
5756	beherrschen	{"to master"}	{"Er beherrscht die englische Sprache fließend, was im internationalen Geschäft wichtig ist.","Um erfolgreich zu sein, muss man die Arbeitsabläufe genau beherrschen."}	3	9	\N	\N	\N
5757	beilegen	{"to enclose"}	{"Bitte legen Sie Ihrer Bewerbung ein aktuelles Führungszeugnis bei.","Dem Schreiben wurde eine Kopie des Vertrags beigelegt."}	3	9	\N	\N	\N
5758	berufsbezeichnung	{"job description"}	{"In der Stellenanzeige war die Berufsbezeichnung nicht genau angegeben.","Seine offizielle Berufsbezeichnung lautet „Sales Manager“."}	3	9	2	\N	\N
5759	berufserfahrung	{"job experience"}	{"Berufserfahrung im Finanzwesen ist für diese Position unerlässlich.","Ohne praktische Berufserfahrung ist der Einstieg ins Berufsleben schwierig."}	3	9	2	\N	\N
5760	berufsleben	{"professional life"}	{"Das Berufsleben bringt sowohl Herausforderungen als auch Chancen mit sich.","Nach dem Studium startete sie voller Motivation ins Berufsleben."}	3	9	3	\N	\N
5761	betriebswirtschaft	{"business administration"}	{"Betriebswirtschaft ist ein beliebtes Studienfach mit vielen Spezialisierungen.","Kenntnisse in Betriebswirtschaft sind für Führungspositionen entscheidend."}	3	9	2	\N	\N
5762	beurteilen	{"to evaluate"}	{"Die Personalabteilung beurteilt die Bewerber nach ihren Qualifikationen.","Es ist wichtig, Leistungen fair und objektiv zu beurteilen."}	3	9	\N	\N	\N
5763	bewerbungsschreiben	{"letter of application"}	{"Im Bewerbungsschreiben betonte er seine Teamfähigkeit und Zuverlässigkeit.","Ein individuelles Bewerbungsschreiben erhöht die Chancen auf eine Einladung."}	3	9	3	\N	\N
5764	bilanzbuchhalter/in	{accountant}	{"Bilanzbuchhalter erstellen monatliche Berichte für die Geschäftsführung.","Die Bilanzbuchhalterin überprüfte die finanziellen Unterlagen sorgfältig."}	3	9	5	\N	bilanzbuchhalter/innen
5765	bisher	{"until now"}	{"Bisher gab es keine Beschwerden über die Arbeitsweise des Teams.","Er hat bisher alle Projekte termingerecht abgeschlossen."}	3	9	\N	\N	\N
5766	briefpapier	{"letter paper"}	{"Offizielle Schreiben werden auf dem Briefpapier der Firma verfasst.","Das Briefpapier enthielt das Logo und die Kontaktdaten des Unternehmens."}	3	9	3	\N	\N
5767	büromaterial	{"office stationary"}	{"Die Bestellung von Büromaterial erfolgt zentral über die Verwaltung.","Ohne ausreichend Büromaterial kann der Arbeitsalltag nicht reibungslos laufen."}	3	9	3	\N	\N
5768	bürozeit	{"office hours"}	{"Die Bürozeiten sind von 8:00 bis 17:00 Uhr, außer freitags.","Außerhalb der Bürozeiten ist das Gebäude geschlossen."}	3	9	2	\N	bürozeiten
5769	catering	{catering}	{"Das Catering für die Firmenfeier wurde von einem lokalen Anbieter organisiert.","Gutes Catering trägt zur Zufriedenheit der Konferenzteilnehmer bei."}	3	9	3	\N	\N
5770	daneben	{besides}	{"Daneben arbeitet er als freiberuflicher Übersetzer für ein Übersetzungsbüro.","Hauptberuflich ist sie Lehrerin, daneben schreibt sie Fachartikel."}	3	9	\N	\N	\N
5771	eigenverantwortlich	{independent}	{"In der Position arbeitet sie eigenverantwortlich und trifft eigene Entscheidungen.","Eigenverantwortliches Handeln wird in diesem Job vorausgesetzt."}	3	9	\N	\N	\N
5772	eingehen	{"to enter"}	{"Das Unternehmen geht eine strategische Partnerschaft mit einem Startup ein.","Auf die Bewerbung wird die Personalabteilung in Kürze eingehen."}	3	9	\N	\N	\N
5773	einschreiben	{"to inscribe"}	{"Wichtige Dokumente sollten per Einschreiben versendet werden.","Er ließ den Vertrag einschreiben, um den Erhalt nachzuweisen."}	3	9	\N	\N	\N
5774	eintrittsdatum	{"entry date"}	{"Das Eintrittsdatum im Arbeitsvertrag ist der 1. September.","Bitte bestätigen Sie Ihr gewünschtes Eintrittsdatum per E-Mail."}	3	9	3	\N	\N
5775	empfang	{reception}	{"Der Empfang der Kunden erfolgte im modernen Konferenzraum des Firmensitzes.","Am Empfang liegt der Terminkalender für Besprechungen aus."}	3	9	1	\N	\N
5776	empfangen	{"to receive"}	{"Die Personalabteilung empfängt täglich zahlreiche Bewerbungsschreiben.","Der Geschäftsführer empfing die internationalen Gäste persönlich."}	3	9	\N	\N	\N
5777	englischsprachig	{"in English"}	{"Die englischsprachige Stellenanzeige richtet sich an internationale Bewerber.","In globalen Unternehmen ist englischsprachige Kommunikation Standard."}	3	9	\N	\N	\N
5778	entnehmen	{"to take from"}	{"Die genauen Konditionen können Sie dem beigefügten Vertragsentwurf entnehmen.","Bitte entnehmen Sie die Details der Anlage im Schreiben."}	3	9	\N	\N	\N
5779	erstellung	{creation}	{"Die Erstellung des Geschäftsberichts dauerte mehrere Wochen.","Für die Erstellung der Bewerbungsunterlagen nutzte sie eine Vorlage."}	3	9	2	\N	\N
5780	färben	{"to colour"}	{"Sie färbte ihre Haare für ein professionelleres Erscheinungsbild.","In der Textilindustrie werden Stoffe mit umweltfreundlichen Farben gefärbt."}	3	9	\N	\N	\N
5781	fax	{fax}	{"Trotz moderner Technik wird in einigen Behörden noch per Fax kommuniziert.","Das Fax mit den Unterschriften wurde an die Geschäftsführung gesendet."}	3	9	3	\N	\N
5782	festanstellung	{"full-time position"}	{"Nach der erfolgreichen Probezeit erhielt er eine Festanstellung.","Eine Festanstellung bietet mehr Planungssicherheit als ein befristeter Vertrag."}	3	9	2	\N	\N
5783	festlegen	{"to determine"}	{"Die Geschäftsführung legte klare Ziele für das nächste Quartal fest.","Der genaue Zeitpunkt der Schulung muss noch festgelegt werden."}	3	9	\N	\N	\N
5784	finanziell	{financial}	{"Die finanzielle Vergütung entsprach seinen Gehaltsvorstellungen.","Ein stabiles Einkommen ist für viele eine wichtige finanzielle Sicherheit."}	3	9	\N	\N	\N
5785	finanzwesen	{finance}	{"Er arbeitet im Finanzwesen einer großen Bank und betreut Kundendepots.","Kenntnisse im Finanzwesen sind für Steuerberater unverzichtbar."}	3	9	3	\N	\N
5786	firmensitz	{"registered office"}	{"Der Firmensitz befindet sich in Berlin, aber die Niederlassungen sind weltweit.","Die Adresse des Firmensitzes ist auf dem Briefpapier vermerkt."}	3	9	1	\N	\N
5787	fließend	{fluent}	{"Sie spricht fließend Englisch und Spanisch, was im internationalen Handel vorteilhaft ist.","Fließende Deutschkenntnisse sind für die Stelle in der Verwaltung erforderlich."}	3	9	\N	\N	\N
5788	föhn	{hairdryer}	{"Im Hotelzimmer stehen den Gästen ein Föhn und weitere Hygieneartikel zur Verfügung.","Der Föhn im Badezimmer des Büros ist defekt und muss repariert werden."}	3	9	1	\N	\N
5789	fordern	{"to demand"}	{"Die Stelle fordert hohe Kommunikationsstärke und eigenverantwortliches Arbeiten.","Kunden fordern oft schnelle Lieferzeiten und qualitativ hochwertige Produkte."}	3	9	\N	\N	\N
5790	formulierung	{wording}	{"Die Formulierung im Arbeitsvertrag wurde juristisch geprüft.","Eine präzise Formulierung der E-Mails vermeidet Missverständnisse."}	3	9	2	\N	\N
5791	fortbildung	{"further education"}	{"Regelmäßige Fortbildungen sind im Berufsleben unerlässlich, um up-to-date zu bleiben.","Die Firma unterstützt ihre Mitarbeiter bei der Finanzierung von Fortbildungen."}	3	9	2	\N	\N
5792	frisur	{hairdresser}	{"Eine gepflegte Frisur hinterlässt im Vorstellungsgespräch einen positiven Eindruck.","Er änderte seine Frisur, um professioneller zu wirken."}	3	9	2	\N	\N
5793	gehaltsvorstellung	{"desired salary"}	{"In ihrem Bewerbungsschreiben nannte sie realistische Gehaltsvorstellungen.","Die Gehaltsvorstellung sollte immer an die Branche und Erfahrung angepasst sein."}	3	9	2	\N	\N
5794	geschäftsführer/in	{"managing director"}	{"Die Geschäftsführerin präsentierte die Jahresbilanz vor den Mitarbeitern.","Der Geschäftsführer traf die Entscheidung in Absprache mit dem Vorstand."}	3	9	5	\N	geschäftsführer/innen
5795	geschäftsführung	{management}	{"Die Geschäftsführung genehmigte das Budget für das neue Projekt.","Ein Treffen mit der Geschäftsführung ist für nächste Woche geplant."}	3	9	2	\N	\N
5796	gleichzeitig	{"at the same time"}	{"Gleichzeitig mit der E-Mail erhielt er eine schriftliche Einladung zum Vorstellungsgespräch.","Sie arbeitet gleichzeitig an zwei Projekten, was ihre Zeitmanagementfähigkeiten fordert."}	3	9	\N	\N	\N
5797	handlung	{conduct}	{"Seine professionelle Handlung in der Krise stärkte das Vertrauen der Kollegen.","Die Handlung des Mitarbeiters entsprach nicht den ethischen Richtlinien des Unternehmens."}	3	9	2	\N	\N
5798	herausforderung	{challenge}	{"Die Digitalisierung stellt viele Unternehmen vor neue Herausforderungen.","Herausforderungen im Berufsleben fördern die persönliche Entwicklung."}	3	9	2	\N	\N
5799	individuell	{individual}	{"Jeder Mitarbeiter erhält individuelle Fortbildungsmöglichkeiten.","Individuelle Arbeitszeitmodelle erhöhen die Zufriedenheit im Team."}	3	9	\N	\N	\N
5800	insofern	{provided}	{"Insofern alle Unterlagen vollständig sind, kann der Vertrag unterschrieben werden.","Die Zusage gilt insofern, als keine unvorhergesehenen Probleme auftreten."}	3	9	\N	\N	\N
5801	intern	{internal}	{"Die interne Kommunikation erfolgt über eine firmeneigene Plattform.","Interne Schulungen werden regelmäßig für neue Mitarbeiter angeboten."}	3	9	\N	\N	\N
5802	jobbezeichnung	{"job description"}	{"Die Jobbezeichnung „Sales Manager“ spiegelt die vielfältigen Aufgaben wider.","In der Stellenanzeige fehlte eine klare Jobbezeichnung, was Verwirrung stiftete."}	3	9	2	\N	\N
5803	kamm	{comb}	{"Im Badezimmer des Büros liegen Kamm und Handtücher für die Mitarbeiter bereit.","Er benutzte einen Kamm, um seine Haare vor dem Meeting zu richten."}	3	9	1	\N	\N
5804	kommunikationsstärke	{"strong communication skills"}	{"Kommunikationsstärke ist in Führungspositionen unverzichtbar.","Die Stellenausschreibung betont die Bedeutung von Kommunikationsstärke im Team."}	3	9	2	\N	\N
5805	kommunikativ	{communicative}	{"Ein kommunikativer Umgang mit Kunden stärkt die Geschäftsbeziehungen.","Sie ist sehr kommunikativ und überzeugt in Verhandlungen."}	3	9	\N	\N	\N
5806	konferenzraum	{"conference room"}	{"Der Konferenzraum ist mit moderner Präsentationstechnik ausgestattet.","Die monatliche Teamsitzung findet immer im großen Konferenzraum statt."}	3	9	1	\N	\N
5807	kontaktdaten	{"contact details"}	{"Bitte aktualisieren Sie Ihre Kontaktdaten im internen Mitarbeiterportal.","Die Kontaktdaten des Ansprechpartners stehen im Footer der E-Mail."}	3	9	2	\N	kontaktdaten (pl.)
5808	kümmern	{"to take care of"}	{"Die Assistenz kümmert sich um die Organisation von Dienstreisen.","Im Seniorenheim kümmern sich Pflegekräfte liebevoll um die Bewohner."}	3	9	\N	\N	\N
5809	leistungsgerecht	{performance-based}	{"Die leistungsgerechte Vergütung motiviert die Mitarbeiter zu Höchstleistungen.","Ein leistungsgerechtes Gehalt spiegelt die Verantwortung der Position wider."}	3	9	\N	\N	\N
5810	leiten	{"to lead"}	{"Er leitet die Abteilung für Maschinenbau und koordiniert alle Projekte.","Die erfahrene Managerin leitet das Team mit viel Empathie und Fachwissen."}	3	9	\N	\N	\N
5811	manager/in	{manager}	{"Der Manager organisierte ein Workshop zur Verbesserung der Teamfähigkeit.","Als Managerin trägt sie Verantwortung für die Erreichung der Quartalsziele."}	3	9	5	\N	manager/innen
5812	maschinenbau	{engineering}	{"Maschinenbau ist eine Schlüsselbranche für die industrielle Entwicklung.","Er arbeitet in der Forschungsabteilung eines Maschinenbauunternehmens."}	3	9	1	\N	\N
5813	meistern	{"to master"}	{"Sie meisterte die Herausforderungen der Probezeit mit Bravour.","Um komplexe Projekte zu meistern, ist Teamarbeit unerlässlich."}	3	9	\N	\N	\N
5814	millionär/in	{millionaire}	{"Durch den Erfolg seines Startups wurde er zum Millionär.","Nicht jeder Millionär lebt extravagant; manche investieren lieber in neue Projekte."}	3	9	\N	\N	\N
5815	mittelständisch	{middle-class}	{"Mittelständische Unternehmen sind das Rückgrat der deutschen Wirtschaft.","Das Familienunternehmen gehört zum mittelständischen Sektor und existiert seit drei Generationen."}	3	9	\N	\N	\N
5816	nachdem	{after}	{"Nachdem er den Bachelor abgeschlossen hatte, begann er im Finanzwesen zu arbeiten.","Nachdem die Bewerbungsfrist abgelaufen war, begann die Auswahlphase."}	3	9	\N	\N	\N
5817	niveau	{level}	{"Das fachliche Niveau der Bewerber wurde im Vorstellungsgespräch geprüft.","Die Diskussionen im Team zeichnen sich durch ein hohes intellektuelles Niveau aus."}	3	9	3	\N	\N
5818	original	{original}	{"Bitte reichen Sie das Original Ihres Abschlusszeugnisses zur Beglaubigung ein.","Das Originaldokument muss für die Vertragsunterzeichnung vorgelegt werden."}	3	9	3	\N	\N
5819	pc	{PC}	{"Jeder Arbeitsplatz ist mit einem leistungsstarken PC ausgestattet.","Die IT-Abteilung aktualisiert regelmäßig die Software auf allen PCs."}	3	9	1	\N	pcs
5820	posteingang	{inbox}	{"Täglich überprüft sie ihren Posteingang auf neue Bewerbungen.","Der Posteingang war voll mit unerledigten Anfragen von Kunden."}	3	9	1	\N	\N
5821	probezeit	{"probationary period"}	{"Während der sechsmonatigen Probezeit wird die Leistung des neuen Mitarbeiters bewertet.","Die Probezeit dient sowohl dem Arbeitgeber als auch dem Arbeitnehmer zur Orientierung."}	3	9	2	\N	\N
5822	qualifikation	{qualification}	{"Seine Qualifikationen im Bereich Projektmanagement machten ihn zum idealen Kandidaten.","Ohne die erforderlichen Qualifikationen ist eine Einstellung in dieser Position nicht möglich."}	3	9	2	\N	qualifikationen
5823	regeln	{"to control"}	{"Der Vertrag regelt die genauen Arbeitszeiten und Urlaubsansprüche.","Die Geschäftsführung regelt interne Konflikte durch klare Kommunikation."}	3	9	\N	\N	\N
5824	sales manager/in	{"sales manager"}	{"Der Sales Manager ist verantwortlich für die Akquise neuer Kunden.","Als Sales Managerin reist sie häufig zu internationalen Messen."}	3	9	5	\N	sales manager/innen
5825	schneiden	{"to cut"}	{"Er schnitt die überflüssigen Passagen aus dem Bericht heraus.","In der Probezeit muss man sich gut schneiden, um eine Festanstellung zu erhalten."}	3	9	\N	\N	\N
5826	schreiben	{correspondence}	{"Das Schreiben der Geschäftsführung wurde an alle Mitarbeiter verteilt.","Offizielle Schreiben müssen auf dem Firmenbriefpapier verfasst werden."}	3	9	3	\N	\N
5827	seitdem	{"since then"}	{"Seitdem er die Stelle angetreten hat, hat sich die Produktivität des Teams verbessert.","Seitdem sie die Fortbildung absolviert hat, übernimmt sie mehr Verantwortung."}	3	9	\N	\N	\N
5828	selbstständige	{"self-employed person"}	{"Selbstständige müssen sich eigenverantwortlich um ihre Altersvorsorge kümmern.","Viele Selbstständige schätzen die flexible Arbeitszeit, die der Beruf bietet."}	3	9	\N	\N	selbstständigen
5829	senden	{"to broadcast"}	{"Die Bewerbungsunterlagen wurden per E-Mail an die Personalabteilung gesendet.","Das Unternehmen sendet monatlich einen Newsletter mit internen Updates."}	3	9	\N	\N	\N
5830	seniorenheim	{"old people's home"}	{"Im Seniorenheim werden täglich Aktivitäten wie Gymnastik und Spiele angeboten.","Altenpflegerinnen im Seniorenheim arbeiten oft in Schichtdiensten."}	3	9	3	\N	\N
5831	soweit	{"so far as"}	{"Soweit alle Formalitäten erledigt sind, kann der Vertrag unterzeichnet werden.","Soweit ich weiß, ist die Stelle bereits intern besetzt worden."}	3	9	\N	\N	\N
5832	speise	{dish}	{"Das Catering bietet eine Auswahl an vegetarischen und veganen Speisen.","In der Firmenkantine gibt es täglich frische Speisen zum Mittagessen."}	3	9	2	\N	speisen
5833	spezialisieren	{"to specialise"}	{"Er spezialisierte sich auf Steuerberatung für mittelständische Unternehmen.","Das Unternehmen spezialisiert sich auf nachhaltige Produkte im Bereich Maschinenbau."}	3	9	\N	\N	\N
5834	stellenanzeige	{"job advertisement"}	{"Die Stellenanzeige für den Sales Manager wurde in mehreren Jobportalen geschaltet.","In der Stellenanzeige werden fließende Englischkenntnisse und Teamfähigkeit gefordert."}	3	9	2	\N	stellenanzeigen
5835	steuerberater	{"tax consultant"}	{"Der Steuerberater half bei der Erstellung der Jahresbilanz.","Steuerberater müssen sich regelmäßig über Gesetzesänderungen informieren."}	3	9	1	\N	\N
5836	steuerberatungsbüro	{"tax consultancy firm"}	{"Das Steuerberatungsbüro befindet sich im Zentrum der Stadt.","In einem Steuerberatungsbüro arbeitet sie als Assistentin und organisiert Termine."}	3	9	3	\N	\N
5837	teamfähigkeit	{"ability to work in a team"}	{"Teamfähigkeit ist eine der wichtigsten Soft Skills in modernen Arbeitsumgebungen.","In der Bewerbung betonte er seine Teamfähigkeit durch Beispiele aus vorherigen Projekten."}	3	9	2	\N	\N
5838	telekommunikation	{telecommunication}	{"Die Telekommunikationsbranche entwickelt sich rasant durch neue Technologien.","Er arbeitet in der Telekommunikation und ist für die Netzwerksicherheit zuständig."}	3	9	2	\N	\N
5839	terminkalender	{"appointment calendar"}	{"Der Terminkalender der Geschäftsführerin ist stets voll mit wichtigen Meetings.","Bitte tragen Sie den Workshop-Termin in Ihren digitalen Terminkalender ein."}	3	9	1	\N	\N
5840	traditionsreich	{"steeped in tradition"}	{"Das traditionsreiche Familienunternehmen feiert dieses Jahr sein 100-jähriges Jubiläum.","Trotz seiner traditionsreichen Geschichte setzt das Unternehmen auf Innovation."}	3	9	\N	\N	\N
5841	überstunde	{overtime}	{"Überstunden werden entweder finanziell vergütet oder als Freizeit ausgeglichen.","Regelmäßige Überstunden können zu Erschöpfung und Burnout führen."}	3	9	2	\N	überstunden
5842	umgang	{handling}	{"Der Umgang mit schwierigen Kunden erfordert viel Geduld und Diplomatie.","Sie hat langjährige Erfahrung im Umgang mit komplexen Projekten."}	3	9	1	\N	\N
5843	umschulung	{re-training}	{"Die Umschulung zum Fachinformatiker ermöglichte ihm einen Karrierewechsel.","Eine Umschulung kann neue Perspektiven eröffnen, wenn der bisherige Beruf nicht mehr passt."}	3	9	2	\N	\N
5844	unbefristet	{indefinite}	{"Er erhielt einen unbefristeten Arbeitsvertrag nach erfolgreicher Probezeit.","Unbefristete Stellen bieten mehr Sicherheit als befristete Verträge."}	3	9	\N	\N	\N
5845	urlaubstag	{"paid leave"}	{"Jeder Mitarbeiter hat Anspruch auf 30 Urlaubstage pro Jahr.","Urlaubstage müssen mindestens zwei Wochen im Voraus beantragt werden."}	3	9	1	\N	urlaubstage
5846	verabreden	{"to arrange"}	{"Sie verabredeten einen Termin für das Vorstellungsgespräch per E-Mail.","Die Teams verabreden wöchentliche Besprechungen, um den Fortschritt zu besprechen."}	3	9	\N	\N	\N
5847	vergütung	{remuneration}	{"Die Vergütung orientiert sich an der Berufserfahrung und den Qualifikationen.","Eine transparente Vergütungsstruktur steigert die Mitarbeiterzufriedenheit."}	3	9	2	\N	\N
5848	verstärkung	{enhancement}	{"Das Team sucht Verstärkung durch eine erfahrene Fachkraft im Bereich IT.","Die Verstärkung der Marketingabteilung führte zu einer Steigerung der Umsätze."}	3	9	2	\N	\N
5849	weiterhelfen	{"to help out"}	{"Kann mir jemand mit der Erstellung dieser Präsentation weiterhelfen?","Die Kollegen helfen sich gegenseitig weiter, um Deadlines einzuhalten."}	3	9	\N	\N	\N
5850	weiterleitung	{forwarding}	{"Die Weiterleitung der Bewerbung an die zuständige Abteilung erfolgte sofort.","Bitte bestätigen Sie die Weiterleitung der Unterlagen per E-Mail."}	3	9	2	\N	\N
5851	werkzeug	{"work tools"}	{"Qualitativ hochwertige Werkzeuge sind für präzise Arbeiten unverzichtbar.","Das Unternehmen stellt allen Mitarbeitern die notwendigen Werkzeuge zur Verfügung."}	3	9	3	\N	\N
5852	zaubern	{"to conjure"}	{"Mit kreativen Ideen zauberte das Team eine Lösung aus der Krise.","Der Designer zauberte aus einfachen Materialien ein beeindruckendes Kunstwerk."}	3	9	\N	\N	\N
5853	zeitlich	{"on time"}	{"Die Aufgabe muss zeitlich genau eingeplant werden, um Verzögerungen zu vermeiden.","Zeitliche Flexibilität ist in dieser Position aufgrund internationaler Kunden wichtig."}	3	9	\N	\N	\N
5854	zeitpunkt	{"point in time"}	{"Der optimale Zeitpunkt für die Bewerbung ist nach Abschluss des Studiums.","Bitte teilen Sie uns Ihren gewünschten Zeitpunkt für das Vorstellungsgespräch mit."}	3	9	1	\N	\N
4582	unternehmen	{"to undertake"}	{"Was unternehmen wir am Wochenende?","Wir unternehmen eine Reise."}	2	13	\N	\N	\N
5855	zusätzlich	{additional}	{"Zusätzlich zum Gehalt erhalten Mitarbeiter eine leistungsabhängige Prämie.","Für diese Aufgabe sind zusätzliche Qualifikationen im Projektmanagement erforderlich."}	3	9	\N	\N	\N
5856	zusatzqualifikation	{"additional qualifications"}	{"Eine Zusatzqualifikation in Datenanalyse erhöht die Berufschancen deutlich.","Er erwarb Zusatzqualifikationen durch Fortbildungen in Kommunikationstechniken."}	3	9	2	\N	\N
5857	zuverlässigkeit	{reliability}	{"Zuverlässigkeit ist eine Grundvoraussetzung für die Arbeit in verantwortungsvollen Positionen.","Seine Zuverlässigkeit macht ihn zu einem geschätzten Kollegen im Team."}	3	9	2	\N	\N
5858	abdrehen	{"to change course"}	{"Der Kapitän beschloss, den Kurs abzudrehen, um dem Sturm auszuweichen.","Wir müssen unsere Strategie abdrehen, um langfristig erfolgreich zu sein."}	3	10	\N	\N	\N
5859	abheften	{"to file away"}	{"Nach dem Meeting heftete sie die Unterlagen im Ordner ab.","Bitte heften Sie die Rechnungen korrekt ab, damit wir sie später finden."}	3	10	\N	\N	\N
5860	allerdings	{however}	{"Ich würde gerne helfen, allerdings habe ich heute keine Zeit.","Das Projekt ist gut geplant, allerdings fehlen noch die Genehmigungen."}	3	10	\N	\N	\N
5861	anmachen	{"to turn on"}	{"Kannst du bitte das Licht anmachen? Es ist zu dunkel hier.","Er machte den Computer an, um mit der Arbeit zu beginnen."}	3	10	\N	\N	\N
5862	ansehen	{"to look at"}	{"Sie sah sich das Gemälde genau an, um die Details zu erkennen.","Kannst du dir bitte dieses Problem ansehen? Ich finde keine Lösung."}	3	10	\N	\N	\N
5863	aufdrehen	{"to open"}	{"Dreh bitte den Wasserhahn auf, ich möchte mir die Hände waschen.","Im Winter sollte man die Heizung nicht zu stark aufdrehen, um Kosten zu sparen."}	3	10	\N	\N	\N
5864	aufmachen	{"to open"}	{"Kannst du das Fenster aufmachen? Es ist stickig hier.","Die Läden machen um 9 Uhr morgens auf."}	3	10	\N	\N	\N
5865	ausschalten	{"to turn off"}	{"Vergiss nicht, den Fernseher auszuschalten, bevor du gehst.","Nach der Arbeit schaltet sie immer den Computer aus."}	3	10	\N	\N	\N
5866	ausschlafen	{"to sleep in"}	{"Am Wochenende schlafe ich gerne aus, um mich zu erholen.","Heute konnte ich endlich mal ausschlafen, weil ich frei habe."}	3	10	\N	\N	\N
5867	besprechungszimmer	{"meeting room"}	{"Das Besprechungszimmer ist bereits für die Präsentation vorbereitet.","Wir haben das Besprechungszimmer reserviert, um über das Projekt zu diskutieren."}	3	10	3	\N	\N
5868	büroalltag	{"office life"}	{"Der Büroalltag kann manchmal monoton sein, aber Teamarbeit hilft.","Im Büroalltag ist es wichtig, Pausen einzulegen."}	3	10	1	\N	\N
5869	büroassistent/in	{"office assistant"}	{"Die Büroassistentin organisierte die Termine des Managers.","Ein guter Büroassistent muss multitaskingfähig sein."}	3	10	5	\N	büroassistenten/büroassistentinnen
5870	büroraum	{"office space"}	{"Die Firma mietet zusätzliche Büroräume für das neue Team.","Der Büroraum ist modern eingerichtet und hat viel Tageslicht."}	3	10	1	\N	büroräume
5871	dienstleistung	{service}	{"Unser Unternehmen bietet digitale Dienstleistungen für kleine Firmen an.","Die Qualität der Dienstleistungen hat sich deutlich verbessert."}	3	10	2	\N	dienstleistungen
5872	drinnen	{inside}	{"Es regnet stark, also bleiben wir lieber drinnen.","Drinnen ist es viel wärmer als draußen im Winter."}	3	10	\N	\N	\N
5873	einschalten	{"to turn on"}	{"Schalt bitte die Kaffeemaschine ein, ich brauche einen Kaffee.","Er schaltete das Radio ein, um die Nachrichten zu hören."}	3	10	\N	\N	\N
5874	energiekosten	{"energy costs"}	{"Die Energiekosten sind dieses Jahr um 15% gestiegen.","Wir senken die Energiekosten, indem wir LED-Lampen verwenden."}	3	10	2	\N	(pl.)
5875	energieverschwendung	{"waste of energy"}	{"Geräte im Standby-Modus sind reine Energieverschwendung.","Energieverschwendung zu reduzieren, schont die Umwelt und das Budget."}	3	10	2	\N	\N
5876	handwerker/in	{workman}	{"Der Handwerker reparierte das kaputte Fenster in nur einer Stunde.","Handwerkerinnen sind in technischen Berufen immer noch unterrepräsentiert."}	3	10	5	\N	handwerker/innen
5877	heizkosten	{"heating costs"}	{"Die Heizkosten können durch richtiges Lüften gesenkt werden.","Im Winter machen die Heizkosten einen großen Teil der Nebenkosten aus."}	3	10	2	\N	(pl.)
5878	indem	{by}	{"Man spart Strom, indem man unnötige Lichter ausschaltet.","Indem wir recyceln, tragen wir zum Umweltschutz bei."}	3	10	\N	\N	\N
5879	kippen	{"to tilt"}	{"Der Stuhl kippte nach hinten, als er sich zurücklehnte.","Bitte kippe den Mülleimer nicht, sonst fällt alles heraus."}	3	10	\N	\N	\N
5880	könig/in	{king}	{"Der König hielt eine Rede vor dem versammelten Volk.","In Märchen rettet oft eine Königin oder ein König das Land."}	3	10	5	\N	könige/königinnen
5881	kopierer	{"copying machine"}	{"Der Kopierer im Büro ist schon wieder kaputt – wir müssen ihn reparieren lassen.","Kannst du mir zeigen, wie man den neuen Kopierer bedient?"}	3	10	1	\N	kopierer
5882	langfristig	{long-term}	{"Langfristig wollen wir unsere CO2-Emissionen auf Null reduzieren.","Eine langfristige Planung gibt dem Team Sicherheit."}	3	10	\N	\N	\N
5883	mehrmals	{"multiple times"}	{"Ich habe mehrmals versucht, dich anzurufen, aber es ging niemand ran.","Mehrmals pro Woche geht sie nach der Arbeit joggen."}	3	10	\N	\N	\N
5884	million	{million}	{"Die Stadt hat über eine Million Einwohner und wächst weiter.","Das Startup erhielt eine Investition in Höhe von zwei Millionen Euro."}	3	10	2	\N	millionen
5885	mitdenken	{"to follow a thought"}	{"In einem guten Team sollte jeder mitdenken und Ideen einbringen.","Wenn du im Unterricht mitdenkst, verstehst du den Stoff besser."}	3	10	\N	\N	\N
5886	offen	{open}	{"Die Tür steht offen, du kannst direkt reingehen.","Wir sind für Vorschläge offen – erzähl uns deine Idee!"}	3	10	\N	\N	\N
5887	privatnummer	{"private number"}	{"Gib niemals deine Privatnummer an unbekannte Personen weiter.","Die Kollegin bat darum, ihre Privatnummer nicht im Team zu teilen."}	3	10	2	\N	\N
5888	rasieren	{"to shave"}	{"Er rasiert sich jeden Morgen vor dem Frühstück.","Vergiss nicht, dich vor dem Vorstellungsgespräch zu rasieren."}	3	10	\N	\N	\N
5889	reinigungsfirma	{"cleaning basicUser"}	{"Die Reinigungsfirma kommt dreimal pro Woche, um das Büro zu säubern.","Wir haben eine neue Reinigungsfirma engagiert, die umweltfreundliche Produkte verwendet."}	3	10	2	\N	\N
5890	reinigungsvertrag	{"cleaning contract"}	{"Der Reinigungsvertrag läuft noch ein Jahr und kann dann verlängert werden.","Im Reinigungsvertrag sind die genauen Aufgaben festgehalten."}	3	10	1	\N	\N
5891	senken	{"to reduce"}	{"Um Kosten zu senken, haben wir auf LED-Beleuchtung umgestellt.","Die Regierung will die Steuern für Familien senken."}	3	10	\N	\N	\N
5892	stinksauer	{furious}	{"Sie war stinksauer, weil ihr Projekt ohne Absprache abgesagt wurde.","Der Chef war stinksauer über die ständigen Verspätungen des Teams."}	3	10	\N	\N	\N
5893	strom	{electricity}	{"Während des Sturms fiel der Strom für mehrere Stunden aus.","Unser Strom kommt zu 100% aus erneuerbaren Energien."}	3	10	1	\N	\N
5894	stromanbieter	{"electricity provider"}	{"Wir haben den Stromanbieter gewechselt, um Geld zu sparen.","Unser Stromanbieter bietet attraktive Tarife für Ökostrom an."}	3	10	1	\N	\N
5895	stromkosten	{"electricity costs"}	{"Die Stromkosten machen einen großen Teil unserer monatlichen Ausgaben aus.","Durch sparsame Geräte können die Stromkosten deutlich reduziert werden."}	3	10	2	\N	(pl.)
5896	tropfen	{"to drip"}	{"Der Wasserhahn tropft seit Tagen – wir sollten einen Handwerker rufen.","Nach dem Regen tropfte das Wasser von den Bäumen."}	3	10	\N	\N	\N
5897	übergeben	{"to be sick"}	{"Ihm wurde so schlecht, dass er sich auf der Toilette übergeben musste.","Nach der langen Autofahrt hatte sie das Gefühl, sich gleich zu übergeben."}	3	10	\N	\N	\N
5898	unnötig	{unnecessary}	{"Diese Diskussion ist unnötig – wir haben bereits eine Entscheidung getroffen.","Vermeide unnötige Ausgaben, um das Budget einzuhalten."}	3	10	\N	\N	\N
5899	verbrauch	{use}	{"Der Stromverbrauch im Büro ist seit der Umstellung auf LEDs gesunken.","Unser Wasserverbrauch ist im Sommer höher wegen des Gartens."}	3	10	1	\N	\N
5373	verschwenden	{"to disappear"}	{"Verschwende keine Zeit mit unwichtigen Aufgaben – konzentriere dich auf das Wesentliche.","Es ist schade, so viel Papier zu verschwenden."}	3	4	\N	\N	\N
5900	vertragsende	{"contract end"}	{"Zum Vertragsende müssen wir entscheiden, ob wir verlängern oder kündigen.","Das Vertragsende des Mieters ist am 30. Juni."}	3	10	3	\N	\N
5901	vertragsnummer	{"contract number"}	{"Bitte nennen Sie uns Ihre Vertragsnummer, damit wir Sie schnell finden können.","Die Vertragsnummer finden Sie oben rechts auf der Rechnung."}	3	10	2	\N	\N
5902	wärme	{warmth}	{"Die Wärme des Kaminfeuers machte den Abend gemütlich.","Im Winter sehne ich mich nach der Wärme des Sommers."}	3	10	2	\N	\N
5903	wasserhahn	{tap}	{"Der Wasserhahn in der Küche tropft – wir sollten ihn reparieren lassen.","Dreh bitte den Wasserhahn zu, sonst läuft das Becken über."}	3	10	1	\N	\N
5904	weise	{manner}	{"Auf höfliche Weise bat er um eine Gehaltserhöhung.","Die Art und Weise, wie sie das Problem löste, beeindruckte alle."}	3	10	2	\N	\N
5905	zudrehen	{"to turn off"}	{"Vergiss nicht, den Gashahn nach dem Kochen zuzudrehen!","Kannst du bitte den Wasserhahn zudrehen? Das Geräusch stört mich."}	3	10	\N	\N	\N
5906	zumachen	{"to close"}	{"Mach bitte die Tür zu, es zieht hier stark.","Die Läden machen um 18 Uhr zu, also beeil dich!"}	3	10	\N	\N	\N
5907	zusammenarbeit	{cooperation}	{"Die Zusammenarbeit zwischen den Abteilungen funktioniert reibungslos.","Gute Zusammenarbeit ist der Schlüssel zum Erfolg jedes Projekts."}	3	10	2	\N	\N
5908	zusammenarbeiten	{"to work together"}	{"Wir arbeiten eng mit externen Partnern zusammen, um Innovationen voranzutreiben.","Im Team zusammenzuarbeiten erfordert Respekt und Kommunikation."}	3	10	\N	\N	\N
5909	abnehmen	{"to lose weight"}	{"Sie möchte abnehmen, indem sie mehr Gemüse isst und regelmäßig Sport treibt.","Der Arzt riet ihm, langsam abzunehmen, um gesund zu bleiben."}	3	11	\N	\N	\N
5910	achten	{"to be careful"}	{"Achte auf die Zutatenliste, um versteckten Zucker zu vermeiden.","Wir sollten alle darauf achten, weniger Plastik zu verwenden."}	3	11	\N	\N	\N
5911	allergie	{allergy}	{"Meine Allergie gegen Nüsse macht das Essen im Restaurant manchmal schwierig.","Im Frühling leiden viele Menschen unter einer Pollenallergie."}	3	11	2	\N	\N
5912	allergisch	{allergic}	{"Sie ist allergisch auf Milchprodukte und trinkt deshalb laktosefreie Milch.","Er reagiert allergisch auf Erdbeeren, deshalb meidet er sie."}	3	11	\N	\N	\N
5913	anbau	{cultivation}	{"Der ökologische Anbau von Gemüse schont die Umwelt.","In dieser Region ist der Anbau von Weizen sehr verbreitet."}	3	11	1	\N	\N
5914	angewöhnen	{"to get used to"}	{"Ich habe mir angewöhnt, jeden Morgen ein gesundes Frühstück zuzubereiten.","Sie will sich das Rauchen abgewöhnen, um fitter zu werden."}	3	11	\N	\N	\N
5915	auseinandersetzen	{"to discuss"}	{"In der Schule setzen wir uns mit den Folgen von Fast Food auseinander.","Er möchte sich mehr mit veganer Ernährung auseinandersetzen."}	3	11	\N	\N	\N
5916	ausgewogen	{balanced}	{"Eine ausgewogene Ernährung enthält Vitamine, Proteine und Kohlenhydrate.","Sie versucht, sich ausgewogen zu ernähren, um fit zu bleiben."}	3	11	\N	\N	\N
5917	ausprobieren	{"to try"}	{"Ich möchte neue glutenfreie Rezepte ausprobieren, weil ich Zöliakie habe.","Hast du schon mal vegetarische Alternativen zu Fleisch ausprobiert?"}	3	11	\N	\N	\N
5918	bedenklich	{questionable}	{"Der hohe Zusatzstoffgehalt in Fertiggerichten ist bedenklich.","Es ist bedenklich, wie viel Zucker in Kindergetränken steckt."}	3	11	\N	\N	\N
5919	bedingung	{condition}	{"Eine Bedingung für die Teilnahme am Kurs ist der Verzicht auf Alkohol.","Unter welchen Bedingungen wird Bio-Gemüse angebaut?"}	3	11	2	\N	bedingungen
5920	behaupten	{"to claim"}	{"Viele Studien behaupten, dass vegane Ernährung nachhaltiger ist.","Er behauptet, dass er durch Intervallfasten abgenommen hat."}	3	11	\N	\N	\N
5921	berufstätigkeit	{"professional activity"}	{"Wegen ihrer Berufstätigkeit hat sie wenig Zeit zum Kochen.","Eine ausgewogene Work-Life-Balance ist bei stressiger Berufstätigkeit wichtig."}	3	11	2	\N	\N
5922	bevölkerung	{population}	{"Ein Großteil der Bevölkerung leidet unter Bewegungsmangel.","Die ältere Bevölkerung achtet oft stärker auf gesunde Ernährung."}	3	11	2	\N	\N
5923	bewusst	{conscious}	{"Er kauft bewusst regionale Produkte, um die Umwelt zu schonen.","Bewusstes Essen hilft, Heißhunger zu vermeiden."}	3	11	\N	\N	\N
5924	bio	{organic}	{"Bio-Eier kommen von Hühnern, die artgerecht gehalten werden.","Immer mehr Menschen kaufen bio, obwohl es teurer ist."}	3	11	\N	\N	\N
5925	bioprodukt	{"organic produce"}	{"Bioprodukte erkennt man am EU-Bio-Siegel auf der Verpackung.","Der Markt verkauft frische Bioprodukte aus der Region."}	3	11	3	\N	bioprodukte
5926	bloß	{purely}	{"Bloß kein Fleisch! Sie ernährt sich ausschließlich vegan.","Das Gericht besteht bloß aus drei Zutaten, schmeckt aber fantastisch."}	3	11	\N	\N	\N
5927	diabetiker/in	{diabetic}	{"Diabetiker müssen ihren Blutzuckerspiegel regelmäßig überprüfen.","Als Diabetikerin verzichtet sie auf zuckerhaltige Getränke."}	3	11	5	\N	diabetiker/innen
5928	döner	{kebab}	{"Ein Döner mit viel Salat und Joghurtsauce ist sein Lieblingsfastfood.","In Berlin gibt es die besten Döner-Buden der Stadt."}	3	11	1	\N	\N
5929	durchschnittlich	{average}	{"Der durchschnittliche Kalorienbedarf eines Erwachsenen liegt bei 2000 kcal.","Durchschnittlich isst jeder Deutsche 60 kg Fleisch pro Jahr."}	3	11	\N	\N	\N
5930	einkommen	{income}	{"Mit einem geringen Einkommen ist gesunde Ernährung oft schwierig.","Das Durchschnittseinkommen beeinflusst die Ernährungsgewohnheiten."}	3	11	3	\N	\N
5931	einseitig	{one-sided}	{"Eine einseitige Ernährung kann zu Vitaminmangel führen.","Er kritisiert die einseitige Berichterstattung über vegane Ernährung."}	3	11	\N	\N	\N
5932	eiweiß	{protein}	{"Eiweiß ist wichtig für den Muskelaufbau und die Regeneration.","Hülsenfrüchte sind eine gute pflanzliche Eiweißquelle."}	3	11	3	\N	\N
5933	erkennen	{"to recognise"}	{"Man erkennt gesunde Lebensmittel oft an der kurzen Zutatenliste.","Sie erkannte sofort, dass das Brot glutenfrei war."}	3	11	\N	\N	\N
5934	ernährung	{nutrition}	{"Eine ausgewogene Ernährung ist die Grundlage für ein gesundes Leben.","In der Schule lernen Kinder viel über gesunde Ernährung."}	3	11	2	\N	\N
5935	esser/in	{eater}	{"Schnelle Esser nehmen oft mehr Kalorien zu sich, als sie brauchen.","Als Vegetarierin ist sie eine bewusste Esserin."}	3	11	5	\N	esser/innen
5936	fertiggericht	{"ready meal"}	{"Fertiggerichte sind praktisch, enthalten aber oft zu viel Salz.","Sie vermeidet Fertiggerichte, um Zusatzstoffe zu reduzieren."}	3	11	3	\N	\N
5937	fett	{fat}	{"Zu fettiges Essen kann zu Herzproblemen führen.","Avocados enthalten gesunde Fette, die der Körper braucht."}	3	11	\N	\N	\N
5938	fix	{quick}	{"Ein fix zubereiteter Salat ist ideal für die Mittagspause.","Fix fertige Smoothies sind eine schnelle Alternative zum Frühstück."}	3	11	\N	\N	\N
5939	fleischfrei	{meat-free}	{"Fleischfreie Montage sind eine gute Einführung in vegetarische Ernährung.","Immer mehr Restaurants bieten fleischfreie Optionen an."}	3	11	\N	\N	\N
5940	fleischlos	{vegetarian}	{"Fleischlose Gerichte wie Linseneintopf sind nahrhaft und lecker.","Sie lebt seit fünf Jahren fleischlos und fühlt sich besser."}	3	11	\N	\N	\N
5941	freundeskreis	{"circle of friends"}	{"In ihrem Freundeskreis kochen alle gerne gemeinsam vegane Gerichte.","Sein Freundeskreis motiviert ihn, gesünder zu leben."}	3	11	1	\N	\N
5942	frust	{frustration}	{"Aus Frust aß sie eine ganze Tafel Schokolade – danach bereute sie es.","Frust über die Diät führte dazu, dass er alles hinschmiss."}	3	11	1	\N	\N
5943	furchtbar	{terrible}	{"Das Essen schmeckte furchtbar, weil es stark versalzen war.","Sie hatte furchtbaren Durst, nachdem sie Sport gemacht hatte."}	3	11	\N	\N	\N
5944	gang	{course}	{"Das Menü bestand aus drei Gängen: Vorspeise, Hauptgericht und Dessert.","Beim Italiener bestellte sie nur einen Gang, um Kalorien zu sparen."}	3	11	1	\N	gänge
5945	gemüsehändler/in	{greengrocer}	{"Der Gemüsehändler auf dem Markt verkauft frische regionale Produkte.","Sie kauft lieber beim Gemüsehändler als im Supermarkt ein."}	3	11	5	\N	gemüsehändler/innen
5946	geschmack	{taste}	{"Der Geschmack von frischem Basilikum ist unvergleichlich.","Joghurt ohne Zucker hat einen etwas sauren Geschmack."}	3	11	1	\N	\N
5947	getreide	{grain}	{"Vollkorn-Getreide enthält mehr Ballaststoffe als Weißmehl.","Hafer ist ein Getreide, das oft im Müsli verwendet wird."}	3	11	3	\N	\N
5948	glutenfrei	{gluten-free}	{"Glutenfreies Brot ist für Menschen mit Zöliakie unverzichtbar.","Immer mehr Bäckereien bieten glutenfreie Backwaren an."}	3	11	\N	\N	\N
5949	grundsätzlich	{basically}	{"Grundsätzlich esse ich kein rotes Fleisch, nur manchmal Geflügel.","Sie ist grundsätzlich gegen Massentierhaltung."}	3	11	\N	\N	\N
5950	hartweizen	{"durum wheat"}	{"Hartweizen wird für die Herstellung von Pasta verwendet.","Die Qualität von Pasta hängt vom verwendeten Hartweizen ab."}	3	11	1	\N	\N
5951	haselnuss	{hazelnut}	{"Haselnüsse sind eine beliebte Zutat in Schokolade und Gebäck.","Aufgrund ihrer Allergie muss sie Haselnüsse strikt meiden."}	3	11	2	\N	haselnüsse
5952	hauptgrund	{"main reason"}	{"Der Hauptgrund für ihre vegane Ernährung ist Tierschutz.","Zeitmangel war der Hauptgrund, warum er oft Fast Food aß."}	3	11	1	\N	hauptgründe
5953	hülsenfrucht	{pulse}	{"Hülsenfrüchte wie Linsen und Bohnen sind reich an Eiweiß.","In der vegetarischen Küche sind Hülsenfrüchte ein Grundnahrungsmittel."}	3	11	2	\N	hülsenfrüchte
5954	industriell	{industrial}	{"Industriell verarbeitete Lebensmittel enthalten oft Konservierungsstoffe.","Die industrielle Landwirtschaft steht wegen Umweltschäden in der Kritik."}	3	11	\N	\N	\N
5955	institution	{institution}	{"Die Universität ist eine wichtige Institution für Ernährungsforschung.","Krankenhäuser sind Institutionen, die auf gesunde Verpflegung achten sollten."}	3	11	2	\N	institutionen
5956	irgendwelche	{any}	{"Hast du irgendwelche Lebensmittelallergien, die ich kennen sollte?","Gibt es irgendwelche Zutaten, die du nicht magst?"}	3	11	\N	\N	\N
5957	irgendwer	{anyone}	{"Irgendwer hat den letzten Joghurt gegessen – jetzt muss ich einkaufen.","Kann irgendwer mir sagen, wo der Bio-Laden ist?"}	3	11	\N	\N	\N
5958	kochbuch	{"cookery book"}	{"Im Kochbuch findet sie Inspiration für gesunde Mittagessen.","Dieses vegane Kochbuch enthält über 100 Rezepte ohne Tierprodukte."}	3	11	3	\N	kochbücher
5959	kulinarisch	{culinary}	{"Berlin bietet eine kulinarische Reise durch Kulturen aus aller Welt.","Die kulinarische Vielfalt Asiens fasziniert viele Food-Blogger."}	3	11	\N	\N	\N
5960	laktosefrei	{lactose-free}	{"Laktosefreie Milch ist für Menschen mit Laktoseintoleranz geeignet.","Immer mehr Cafés bieten laktosefreien Kaffee an."}	3	11	\N	\N	\N
5961	laune	{mood}	{"Bei schlechter Laune nascht sie oft Schokolade, um sich zu trösten.","Seine Laune verbesserte sich, als er das leckere Essen roch."}	3	11	2	\N	\N
5962	leiden	{"to suffer"}	{"Viele Menschen leiden unter Lebensmittelunverträglichkeiten wie Zöliakie.","Sie leidet darunter, dass es im Dorf keinen Bio-Laden gibt."}	3	11	\N	\N	\N
5963	massentierhaltung	{"livestock farming"}	{"Massentierhaltung ist ein großes ethisches und ökologisches Problem.","Viele Verbraucher lehnen Massentierhaltung aus moralischen Gründen ab."}	3	11	2	\N	\N
5964	milchzucker	{"milk sugar"}	{"Milchzucker (Laktose) kann bei manchen Menschen Verdauungsprobleme verursachen.","Laktosefreie Produkte enthalten keinen Milchzucker."}	3	11	1	\N	\N
5965	moralisch	{morally}	{"Aus moralischen Gründen verzichtet sie auf tierische Produkte.","Die Entscheidung für Bio-Fleisch ist für ihn eine moralische Pflicht."}	3	11	\N	\N	\N
5966	nährstoff	{nutrient}	{"Nährstoffe wie Eisen und Kalzium sind essenziell für den Körper.","Grünes Gemüse ist reich an wichtigen Nährstoffen."}	3	11	1	\N	nährstoffe
5967	nahrungsmittel	{foodstuff}	{"Frische Nahrungsmittel sind gesünder als konservierte Produkte.","In diesem Laden gibt es nur biologisch angebaute Nahrungsmittel."}	3	11	3	\N	\N
5968	nebenbei	{incidentally}	{"Nebenbei zu snacken, kann zu unkontrolliertem Essen führen.","Sie erwähnte nebenbei, dass sie jetzt vegan lebt."}	3	11	\N	\N	\N
5969	nuss	{nut}	{"Nüsse sind ein gesunder Snack, aber auch kalorienreich.","Aufgrund ihrer Allergie muss sie alle Nüsse meiden."}	3	11	2	\N	nüsse
5970	präsentieren	{"to present"}	{"Der Koch präsentierte das Gericht mit viel Kreativität auf dem Teller.","Auf der Messe wurden neue Bio-Produkte präsentiert."}	3	11	\N	\N	\N
5971	problemlos	{unproblematic}	{"Das Rezept ist problemlos und in 20 Minuten zubereitet.","Man kann problemlos vegan leben, wenn man sich informiert."}	3	11	\N	\N	\N
5972	quark	{quark}	{"Quark ist eine proteinreiche Zutat für Frühstück und Desserts.","Sie mischt Quark mit Früchten für ein gesundes Dessert."}	3	11	1	\N	\N
5973	reduzieren	{"to reduce"}	{"Sie reduziert ihren Fleischkonsum, um die Umwelt zu schonen.","Zucker in Rezepten kann man oft um die Hälfte reduzieren."}	3	11	\N	\N	\N
5974	studie	{study}	{"Eine Studie zeigte, dass mediterrane Ernährung herzgesund ist.","Laut neuer Studien ist zu viel Salz ungesund."}	3	11	2	\N	\N
5975	tiefkühlpizza	{"frozen pizza"}	{"Tiefkühlpizza ist praktisch, aber oft voller Zusatzstoffe.","Er isst selten Tiefkühlpizza, weil er frisch kocht."}	3	11	2	\N	tiefkühlpizzen
5976	tierisch	{animalistic}	{"Tierische Produkte wie Milch und Eier sind umstritten.","Vegane Ernährung verzichtet komplett auf tierische Inhaltsstoffe."}	3	11	\N	\N	\N
5977	trend	{trend}	{"Superfoods wie Chia-Samen sind ein aktueller Trend in der Ernährung.","Der Trend zu pflanzlicher Milch nimmt weltweit zu."}	3	11	1	\N	\N
5978	überzeugen	{"to convince"}	{"Die Geschmacksprobe überzeugte ihn, mehr Bio-Produkte zu kaufen.","Sie ließ sich vom Nutzen einer veganen Ernährung überzeugen."}	3	11	\N	\N	\N
5979	vegan	{vegan}	{"Vegane Ernährung erfordert Planung, um alle Nährstoffe abzudecken.","Immer mehr Restaurants bieten vegane Optionen an."}	3	11	\N	\N	\N
5980	veganer/in	{vegan}	{"Veganer verzichten nicht nur auf Fleisch, sondern auf alle Tierprodukte.","Als Veganerin kauft sie nur pflanzliche Lebensmittel ein."}	3	11	5	\N	veganer/innen
5981	vereinbar	{compatible}	{"Ist eine Low-Carb-Diät mit einem aktiven Lebensstil vereinbar?","Sein Beruf ist kaum mit seiner veganen Überzeugung vereinbar."}	3	11	\N	\N	\N
5982	versorgen	{"to provide for"}	{"Supermarktketten versorgen die Bevölkerung mit Grundnahrungsmitteln.","Sie versorgt ihre Familie täglich mit frisch gekochtem Essen."}	3	11	\N	\N	\N
5983	vertragen	{"to tolerate"}	{"Nicht jeder verträgt scharfes Essen gleich gut.","Sein Magen verträgt keine frittierten Speisen mehr."}	3	11	\N	\N	\N
5984	verzehr	{consumption}	{"Der Verzehr von rohem Fisch erfordert höchste Hygiene.","Übermäßiger Verzehr von Zucker kann zu Diabetes führen."}	3	11	1	\N	\N
5985	verzichten	{"to avoid"}	{"Sie verzichtet seit einem Jahr komplett auf Alkohol.","Auf Plastik zu verzichten, ist gut für die Umwelt."}	3	11	\N	\N	\N
5986	vorbeigehen	{"to walk past"}	{"Jeden Morgen geht sie am Bio-Bauernhof vorbei und kauft ein.","Er konnte nicht am Dönerstand vorbeigehen, ohne hungrig zu werden."}	3	11	\N	\N	\N
5987	wert	{value}	{"Der Nährwert von frischem Obst ist höher als der von Saft.","Sie legt großen Wert auf nachhaltig produzierte Lebensmittel."}	3	11	1	\N	werte
5988	wurst	{sausage}	{"Wurst enthält oft viel Fett und sollte in Maßen gegessen werden.","Vegetarische Wurst aus Soja ist eine beliebte Alternative."}	3	11	2	\N	würste
5989	zeitmangel	{"lack of time"}	{"Wegen Zeitmangel greift er oft zu Fertiggerichten.","Zeitmangel ist keine Ausrede für ungesunde Ernährung."}	3	11	1	\N	\N
5990	zeitungsbericht	{"report in the newspaper"}	{"Ein Zeitungsbericht enthüllte Skandale in der Lebensmittelindustrie.","Laut einem Zeitungsbericht ist Zucker schädlicher als gedacht."}	3	11	1	\N	\N
5991	zufällig	{incidentally}	{"Sie traf zufällig eine Freundin im Bio-Supermarkt.","Er entdeckte zufällig ein neues veganes Restaurant."}	3	11	\N	\N	\N
5992	zunehmen	{"to gain weight"}	{"In den Ferien nimmt er immer ein paar Kilo zu.","Wer viel Fast Food isst, wird schnell zunehmen."}	3	11	\N	\N	\N
5993	zusatzstoff	{additives}	{"Viele Zusatzstoffe in Lebensmitteln sind bedenklich.","Fertiggerichte enthalten oft unnötige Zusatzstoffe."}	3	11	1	\N	zusatzstoffe
5994	abdecken	{"to cover"}	{"Sie deckte das Auto mit einer Plane ab, um es vor Hagel zu schützen.","Die Versicherung deckt nicht alle Kosten ab, nur Sachschäden."}	3	12	\N	\N	\N
5995	absichtlich	{intentional}	{"Er hat den Parkplatz absichtlich blockiert, was zu einem Streit führte.","Absichtliches Beschädigen fremder Autos ist strafbar."}	3	12	\N	\N	\N
5996	anfahren	{"to bump into"}	{"Beim Rückwärtsfahren fuhr sie leicht gegen die Mauer an.","Der Lkw fuhr beim Abbiegen das kleinere Auto an."}	3	12	\N	\N	\N
5997	ärztlich	{medical}	{"Nach dem Unfall war ärztliche Behandlung notwendig.","Die Versicherung verlangt ein ärztliches Attest für den Schadensfall."}	3	12	\N	\N	\N
5998	aufkommen	{"to pay"}	{"Die Haftpflichtversicherung kommt für den Schaden am anderen Fahrzeug auf.","Wer muss für die Reparaturkosten aufkommen, wenn kein Versicherungsschutz besteht?"}	3	12	\N	\N	\N
5999	ausparken	{"to reverse out"}	{"Beim Ausparken übersah sie das Motorrad und es kam zu einer Kollision.","In engen Parklücken ist vorsichtiges Ausparken wichtig."}	3	12	\N	\N	\N
6000	außenspiegel	{"wing mirror"}	{"Der Außenspiegel brach ab, als das Auto zu nah am Laternenpfahl vorbeifuhr.","Ohne funktionierende Außenspiegel ist das Fahren gefährlich."}	3	12	1	\N	außenspiegel
6001	autofahrer/in	{"car driver"}	{"Die Autofahrerin blinkte rechtzeitig, um den Spurwechsel anzuzeigen.","Ein rücksichtsloser Autofahrer verursachte den Stau."}	3	12	5	\N	autofahrer/innen
6002	automarke	{"car make"}	{"Toyota ist eine japanische Automarke, die für Zuverlässigkeit bekannt ist.","Welche Automarke bevorzugst du – deutsche oder italienische?"}	3	12	2	\N	\N
6003	autoteil	{"car part"}	{"Ersatzteile für ältere Autoteile sind oft schwer zu finden.","Der Mechaniker tauschte das defekte Autoteil aus."}	3	12	3	\N	autoteile
6004	autoversicherung	{"car insurance"}	{"Ohne gültige Autoversicherung darf das Fahrzeug nicht angemeldet werden.","Sie verglich mehrere Autoversicherungen, um die günstigste zu finden."}	3	12	2	\N	\N
6005	benzin	{petrol}	{"Der Benzinpreis stieg wegen der globalen Krise stark an.","Elektroautos benötigen kein Benzin, sondern Strom."}	3	12	3	\N	\N
6006	beschädigen	{"to damage"}	{"Der Sturm beschädigte mehrere parkende Autos durch umherfliegende Äste.","Vorsicht – bei großer Hitze kann sich der Lack beschädigen."}	3	12	\N	\N	\N
6007	betrunken	{drunk}	{"Betrunken Auto zu führen kann zum Führerscheinentzug führen.","Die Polizei kontrollierte, ob der Fahrer betrunken war."}	3	12	\N	\N	\N
6008	blinker	{indicator}	{"Vergiss nicht, den Blinker zu setzen, bevor du die Spur wechselst!","Ein defekter Blinker muss sofort repariert werden."}	3	12	1	\N	blinker
6009	bremsen	{"to brake"}	{"Sie bremste abrupt, als ein Reh auf die Straße sprang.","Bei Glätte sollte man vorsichtig und frühzeitig bremsen."}	3	12	\N	\N	\N
6010	dach	{roof}	{"Das Dach des Cabriolets lässt sich elektrisch öffnen.","Nach dem Hagelsturm war das Autodach voller Dellen."}	3	12	3	\N	\N
6011	diebstahl	{theft}	{"Der Diebstahl des Fahrrads vom Autodach wurde angezeigt.","Eine Kaskoversicherung schützt vor Diebstahl des Fahrzeugs."}	3	12	1	\N	\N
6012	dorf	{village}	{"Im Dorf gibt es kaum Parkplätze, besonders an Markttagen.","Die engen Dorfstraßen sind für große SUVs ungeeignet."}	3	12	3	\N	\N
6013	einbrechen	{"to break in"}	{"Unbekannte brachen nachts in das Auto ein und stahlen das Radio.","In unsicheren Gegenden brechen Diebe häufiger in Autos ein."}	3	12	\N	\N	\N
6014	einbrecher/in	{burglar}	{"Die Einbrecher wurden von der Alarmanlage des Autos vertrieben.","Ein Einbrecher beschädigte die Tür, um an die Wertsachen zu kommen."}	3	12	5	\N	einbrecher/innen
6015	einbruch	{burglary}	{"Nach dem Einbruch ins Auto fehlten Laptop und Navigationsgerät.","Die Polizei untersuchte den Einbruch am Parkplatz."}	3	12	1	\N	\N
6016	einparken	{"to pull in"}	{"Das Einparken in der engen Garage gelang ihm erst beim dritten Versuch.","Mit Einparkhilfen fällt das Einparken in moderne Autos leichter."}	3	12	\N	\N	\N
6017	fahrerseite	{"driver's side"}	{"Die Tür auf der Fahrerseite klemmte nach dem Unfall.","Der Blinker auf der Fahrerseite war defekt."}	3	12	2	\N	\N
6018	freiwillige	{volunteer}	{"Freiwillige halfen nach dem Unfall, Glassplitter von der Straße zu entfernen.","Die Freiwilligen organisierten eine Verkehrssicherheitskampagne."}	3	12	\N	\N	freiwilligen
6019	frustriert	{frustrated}	{"Frustriert gab er das Einparken auf und suchte einen anderen Platz.","Die frustrierte Autofahrerin rief den Abschleppdienst."}	3	12	\N	\N	\N
6020	gebrauchtwagen	{"used vehicle"}	{"Er kaufte einen Gebrauchtwagen mit geringer Kilometerleistung.","Bei Gebrauchtwagen sollte man immer den Motor prüfen lassen."}	3	12	1	\N	gebrauchtwagen
6021	haftpflicht	{liability}	{"Die Haftpflicht deckt Schäden an Dritten, aber nicht am eigenen Auto.","Ohne Haftpflichtversicherung darf kein Auto zugelassen werden."}	3	12	2	\N	\N
6022	haftpflichtversicherung	{"liability insurance"}	{"Die Haftpflichtversicherung übernahm die Kosten für den Unfallgegner.","Jeder Autobesitzer muss eine Haftpflichtversicherung abschließen."}	3	12	2	\N	\N
6023	hagel	{hail}	{"Der Hagel beschädigte die Windschutzscheibe und die Motorhaube.","Nach dem Hagelsturm sahen viele Autos wie Siebe aus."}	3	12	1	\N	\N
6024	hügel	{hill}	{"Auf dem Hügel parkte ein Auto mit defekten Bremsen – es rollte zurück.","Die Serpentinenstraße führte steile Hügel hinauf."}	3	12	1	\N	\N
6025	kaskoversicherung	{"hull insurance"}	{"Die Kaskoversicherung ersetzt Schäden durch Naturereignisse wie Hagel.","Eine Vollkaskoversicherung ist teurer, aber umfassender."}	3	12	2	\N	\N
6026	kilometer	{kilometre}	{"Der Gebrauchtwagen hatte bereits 120.000 Kilometer auf dem Tacho.","Die nächste Tankstelle ist noch zehn Kilometer entfernt."}	3	12	1	\N	\N
6027	kofferraum	{"car boot"}	{"Im Kofferraum war kein Platz mehr für den großen Koffer.","Die Diebe durchsuchten den Kofferraum nach Wertgegenständen."}	3	12	1	\N	\N
6028	korrekt	{correct}	{"Korrektes Parken vermeidet Knöllchen und Ärger mit anderen Fahrern.","Er verhielt sich korrekt, indem er den Unfall sofort meldete."}	3	12	\N	\N	\N
6029	krachen	{"to crash"}	{"Es krachte laut, als der Lastwagen mit dem Auto kollidierte.","Das Geräusch des Krachens war im ganzen Viertel zu hören."}	3	12	\N	\N	\N
6030	kratzer	{scratch}	{"Ein tiefer Kratzer auf der Motorhaube entstand beim Parken.","Die Kratzer an der Stoßstange wurden lackiert."}	3	12	1	\N	kratzer
6031	lenken	{"to steer"}	{"Bei Glatteis lässt sich das Auto schwer lenken.","Er lenkte geschickt durch den dichten Verkehr."}	3	12	\N	\N	\N
6032	lohnen	{"to pay"}	{"Lohnt sich die Reparatur des alten Motors noch?","Es lohnt sich, frühzeitig eine gute Versicherung zu wählen."}	3	12	\N	\N	\N
6033	motor	{motor}	{"Der Motor des Neuwagens war extrem leise und effizient.","Bei Überhitzung kann der Motor ernsthaft beschädigt werden."}	3	12	1	\N	motoren
6034	motorhaube	{bonnet}	{"Die Motorhaube war nach dem Unfall verbogen und ließ sich nicht öffnen.","Er hob die Motorhaube an, um den Ölstand zu prüfen."}	3	12	2	\N	\N
6035	motorradfahrer/in	{motorcyclist}	{"Der Motorradfahrer trug eine reflektierende Weste für mehr Sichtbarkeit.","Motorradfahrerinnen sind im Straßenverkehr besonders gefährdet."}	3	12	5	\N	motorradfahrer/innen
6036	nachdenken	{"to think about"}	{"Er dachte lange nach, ob er die teure Reparatur in Kauf nehmen sollte.","Nachdenken über umweltfreundliche Alternativen zum Auto ist wichtig."}	3	12	\N	\N	\N
6037	neuwagen	{"new vehicle"}	{"Der Neuwagen roch nach Leder und moderner Technik.","Sie entschied sich für einen Neuwagen mit Hybridantrieb."}	3	12	1	\N	neuwagen
6038	nummernschild	{"number plate"}	{"Das Nummernschild war schmutzig und kaum lesbar.","Die Polizei notierte das Nummernschild des flüchtigen Fahrzeugs."}	3	12	3	\N	nummernschilder
6039	oldtimer	{"vintage car"}	{"Der Oldtimer aus den 1960er Jahren war auf der Ausstellung der Star.","Oldtimer benötigen spezielle Pflege und Versicherungen."}	3	12	1	\N	\N
6040	optimistisch	{optimistic}	{"Trotz des Motorschadens blieb der Fahrer optimistisch.","Sie war optimistisch, dass die Versicherung den Schaden decken würde."}	3	12	\N	\N	\N
6041	parken	{"to park"}	{"In der Innenstadt ist das Parken zwischen 8 und 18 Uhr kostenpflichtig.","Sie parkte rückwärts ein, um später leichter ausparken zu können."}	3	12	\N	\N	\N
6042	parklücke	{"parking space"}	{"Die Parklücke war so klein, dass nur ein Smart hineinpasste.","Nach 20 Minuten Suche fand er endlich eine freie Parklücke."}	3	12	2	\N	\N
6043	personenschaden	{"personal injury"}	{"Zum Glück gab es beim Auffahrunfall keinen Personenschaden.","Personenschäden müssen sofort der Polizei gemeldet werden."}	3	12	1	\N	personenschäden
6044	ps	{horsepower}	{"Der Sportwagen hat 450 PS und beschleunigt in wenigen Sekunden.","Mehr PS bedeutet nicht automatisch mehr Sicherheit auf der Straße."}	3	12	\N	\N	\N
6045	quietschen	{"to screech"}	{"Die Bremsen quietschten laut, als der Bus abrupt hielt.","Beim Lenken quietschte das alte Lenkrad unangenehm."}	3	12	\N	\N	\N
6046	regulieren	{"to regulate"}	{"Die Regierung will die Geschwindigkeit in Wohngebieten stärker regulieren.","Tempolimits regulieren den Verkehrsfluss und erhöhen die Sicherheit."}	3	12	\N	\N	\N
6047	regulierung	{regulation}	{"Strenge Regulierungen für Abgaswerte gelten seit diesem Jahr.","Die Regulierung von Versicherungsbedingungen schützt Verbraucher."}	3	12	2	\N	\N
6048	reifen	{tyre}	{"Winterreifen sind ab Oktober in vielen Regionen Pflicht.","Ein platter Reifen verzögerte die Reise um zwei Stunden."}	3	12	1	\N	reifen
6049	rücklicht	{"tail light"}	{"Das Rücklicht war defekt, weshalb das Auto zur Prüfung musste.","Bei Nebel sollten die Rücklichter immer sauber sein."}	3	12	3	\N	rücklichter
6050	rückscheibe	{"rear window"}	{"Die Rückscheibe war beschlagen, sodass er kaum etwas sah.","Ein Stein traf die Rückscheibe und verursachte einen Riss."}	3	12	2	\N	\N
6051	rückwärts	{backwards}	{"Rückwärts aus der Einfahrt zu fahren, erfordert Konzentration.","Der Lieferwagen fuhr rückwärts in eine Parklücke."}	3	12	\N	\N	\N
6052	rutschen	{"to slide"}	{"Das Auto rutschte auf dem vereisten Asphalt und prallte gegen den Baum.","Bei Nässe rutschen die Reifen leicht, besonders in Kurven."}	3	12	\N	\N	\N
6053	sachschaden	{"property damage"}	{"Der Sachschaden am geparkten Auto belief sich auf 2.000 Euro.","Die Kaskoversicherung übernimmt Sachschäden durch Naturereignisse."}	3	12	1	\N	sachschäden
6054	schadensfall	{"damage claim"}	{"Im Schadensfall muss die Polizei innerhalb von 24 Stunden informiert werden.","Die Versicherung prüfte den Schadensfall gründlich."}	3	12	1	\N	\N
6055	scheibe	{windscreen}	{"Ein Stein schlug gegen die Scheibe und hinterließ einen Sprung.","Die vereiste Scheibe musste erst freigekratzt werden."}	3	12	2	\N	scheiben
6056	scheinwerfer	{headlight}	{"Die Scheinwerfer des alten Wagens waren zu schwach für Nachtfahrten.","Moderne Scheinwerfer passen sich automatisch der Umgebung an."}	3	12	1	\N	scheinwerfer
6057	schläger	{bat}	{"Ein Schläger lag im Kofferraum für den geplanten Baseballausflug.","Der Dieb benutzte einen Schläger, um die Scheibe einzuschlagen."}	3	12	1	\N	\N
6058	schwingen	{"to swing"}	{"Er schwang das Auto elegant in die letzte Parklücke.","Die Tür schwang im Wind zu und klemmte den Schlüssel ein."}	3	12	\N	\N	\N
6059	sinn	{meaning}	{"Welchen Sinn hat es, bei Glatteis zu schnell zu fahren?","Der Sinn der Verkehrsregeln ist der Schutz aller."}	3	12	1	\N	\N
6060	sportwagen	{"sports car"}	{"Der rote Sportwagen zog alle Blicke auf der Autobahn auf sich.","Sportwagen verbrauchen oft mehr Benzin als normale Autos."}	3	12	1	\N	\N
6061	stoßstange	{bumper}	{"Die Stoßstange war nach dem kleinen Unfall leicht verzogen.","Moderne Stoßstangen sind aus Kunststoff und leichter reparierbar."}	3	12	2	\N	\N
6062	straßenrand	{roadside}	{"Sie hielt am Straßenrand, um die Reifen zu überprüfen.","Das Auto stand halb auf dem Straßenrand und blockierte den Radweg."}	3	12	1	\N	\N
6063	straßenverkehr	{traffic}	{"Im dichten Straßenverkehr ist vorausschauendes Fahren entscheidend.","Der Straßenverkehr nimmt in Ballungsräumen ständig zu."}	3	12	1	\N	\N
6064	sturm	{storm}	{"Der Sturm deckte Dächer ab und warf Bäume auf die Straßen.","Wegen des Sturms wurde empfohlen, Autos nicht unter Bäumen zu parken."}	3	12	1	\N	\N
6065	suv	{"sport utility vehicle"}	{"Der SUV war perfekt für die Fahrt auf unwegsamem Gelände.","Immer mehr Familien entscheiden sich für einen SUV als Alltagsauto."}	3	12	3	\N	\N
6066	teilkaskoversicherung	{"partial coverage insurance"}	{"Die Teilkaskoversicherung deckt Schäden durch Diebstahl und Feuer.","Im Vergleich zur Vollkasko ist die Teilkaskoversicherung günstiger."}	3	12	2	\N	\N
6067	überraschen	{"to surprise"}	{"Die Höhe der Reparaturrechnung überraschte den Autobesitzer.","Es überrascht nicht, dass betrunkenes Fahren oft zu Unfällen führt."}	3	12	\N	\N	\N
6068	überschwemmung	{flood}	{"Die Überschwemmung beschädigte zahlreiche Autos in der Tiefgarage.","Nach der Überschwemmung war der Motor des Wagens komplett zerstört."}	3	12	2	\N	\N
6069	umfallen	{"to fall over"}	{"Das Motorrad fiel um, als der Fahrer es auf unebenem Boden abstellte.","Der Lastwagen wäre fast umgefallen, als er scharf bremsen musste."}	3	12	\N	\N	\N
6070	umso	{"all the (more)"}	{"Je später der Unfall gemeldet wird, umso schwieriger ist die Regulierung.","Umso mehr PS ein Auto hat, desto höher ist oft der Spritverbrauch."}	3	12	\N	\N	\N
6071	unfall	{accident}	{"Der Unfall auf der Autobahn führte zu einem Stau von zehn Kilometern.","Bei dem Unfall wurden zwei Personen leicht verletzt."}	3	12	1	\N	unfälle
6072	unfallgefahr	{"risk of accident"}	{"Bei Nebel besteht erhöhte Unfallgefahr auf den Autobahnen.","Die Unfallgefahr steigt bei überhöhter Geschwindigkeit deutlich."}	3	12	2	\N	\N
6073	verletzen	{"to injure"}	{"Zum Glück wurde niemand bei dem Auffahrunfall verletzt.","Der Airbag verhinderte, dass sich der Fahrer schwer verletzte."}	3	12	\N	\N	\N
6074	versehentlich	{accidental}	{"Sie trat versehentlich aufs Gas statt auf die Bremse.","Er parkte versehentlich auf einem Behindertenparkplatz."}	3	12	\N	\N	\N
6075	versichern	{"to insure"}	{"Jeder Autobesitzer muss sein Fahrzeug gesetzlich versichern, bevor es zugelassen wird.","Sie versicherte den Oldtimer gegen Diebstahl und Hagelschäden."}	3	12	\N	\N	\N
6076	versicherungsberater/in	{"insurance advisor"}	{"Der Versicherungsberater erklärte die Unterschiede zwischen Teil- und Vollkasko.","Viele Versicherungsberaterinnen empfehlen eine Zusatzversicherung für teure Fahrzeuge."}	3	12	5	\N	versicherungsberater/innen
6077	versicherungsschutz	{"insurance cover"}	{"Ohne gültigen Versicherungsschutz darf das Auto nicht auf der Straße fahren.","Der Versicherungsschutz gilt erst ab dem Datum der Unterschrift."}	3	12	1	\N	\N
6078	verursachen	{"to cause"}	{"Der betrunkene Fahrer verursachte einen schweren Unfall auf der Autobahn.","Ein defekter Blinker kann Missverständnisse im Straßenverkehr verursachen."}	3	12	\N	\N	\N
6079	vollkaskoversicherung	{"full comprehensive insurance"}	{"Die Vollkaskoversicherung deckt auch Schäden am eigenen Fahrzeug, egal wer schuld ist.","Für Neuwagen lohnt sich eine Vollkaskoversicherung meistens."}	3	12	2	\N	\N
6080	vorschreiben	{"to stipulate"}	{"Das Gesetz schreibt vor, dass alle Autos eine Haftpflichtversicherung haben müssen.","Der Vertrag schreibt vor, dass Reparaturen nur in zertifizierten Werkstätten durchgeführt werden dürfen."}	3	12	\N	\N	\N
6081	vorsichtig	{careful}	{"Bei Glatteis sollte man besonders vorsichtig bremsen und lenken.","Der Fahrer war vorsichtig genug, um den Fußgänger rechtzeitig zu sehen."}	3	12	\N	\N	\N
6082	wegfahren	{"to drive away"}	{"Nach dem Tanken fuhr er schnell weg, ohne die Tankstelle zu bezahlen – das war ein Fehler.","Sie wollte gerade wegfahren, als sie das quietschende Geräusch am Motor hörte."}	3	12	\N	\N	\N
6083	windschutzscheibe	{windscreen}	{"Ein Stein schlug gegen die Windschutzscheibe und hinterließ einen langen Riss.","Die Windschutzscheibe war komplett vereist, sodass sie freigekratzt werden musste."}	3	12	2	\N	\N
6084	zulassen	{"to allow"}	{"Die Behörden lassen nur Fahrzeuge mit gültiger Versicherung und TÜV zu.","Es ist nicht erlaubt, Autos ohne Nummernschild zuzulassen."}	3	12	\N	\N	\N
6085	zusammenstoßen	{"to collide"}	{"Die beiden Autos stießen an der Kreuzung zusammen, weil keiner geblinkt hatte.","Glücklicherweise ist niemand verletzt worden, als die Fahrräder zusammenstießen."}	3	12	\N	\N	\N
6086	zusatzversicherung	{"additional insurance"}	{"Eine Zusatzversicherung für Mietwagen kann im Urlaub sinnvoll sein.","Er entschied sich für eine Zusatzversicherung, die auch Reifenpannen abdeckt."}	3	12	2	\N	\N
6114	brandschutz	{"fire prevention"}	{"Brandschutz ist gesetzlich vorgeschrieben.","Der Brandschutz wurde überprüft."}	2	20	1	\N	\N
6115	brennen	{"to burn"}	{"Das Licht brennt die ganze Nacht.","Das Holz brennt gut im Kamin."}	2	20	\N	\N	\N
6116	buchhaltung	{accountant}	{"Die Buchhaltung macht die Gehälter.","Er arbeitet in der Buchhaltung."}	2	20	2	\N	\N
6117	danken	{"to thank"}	{"Ich danke Ihnen für Ihre Hilfe.","Sie dankte dem Team für die Zusammenarbeit."}	2	20	\N	\N	\N
6118	deutlich	{clearly}	{"Bitte sprechen Sie deutlich.","Die Anweisungen waren deutlich."}	2	20	\N	\N	\N
6119	echt	{really}	{"Das ist echt schwierig!","Das Kleid ist aus echter Seide."}	2	20	\N	\N	\N
6120	einweisung	{instruction}	{"Neue Mitarbeiter bekommen eine Einweisung.","Die Einweisung dauert eine Stunde."}	2	20	2	\N	\N
6109	bildschirm	{screen}	{"Der Bildschirm ist zu klein.","Sie arbeitet den ganzen Tag vor dem Bildschirm."}	2	20	1	\N	\N
6110	brand	{fire}	{"Ein Brand brach im Lager aus.","Der Brand wurde schnell gelöscht."}	2	20	1	\N	\N
6112	brandfall	{"case of fire"}	{"Im Brandfall benutzen Sie den Notausgang.","Alle Mitarbeiter kennen die Regeln im Brandfall."}	2	20	1	\N	\N
6113	brandmelder	{"fire alarm"}	{"Der Brandmelder piept ständig.","Installieren Sie einen Brandmelder in der Küche."}	2	20	1	\N	\N
6134	unbürokratisch	{unbureaucratic}	{"Die Lösung war unbürokratisch.","Wir handeln unbürokratisch."}	2	20	\N	\N	\N
6135	unterstützen	{"to support"}	{"Wir unterstützen das Team.","Kannst du mich bei der Arbeit unterstützen?"}	2	20	\N	\N	\N
6136	verabschieden	{"to adopt"}	{"Das Gesetz wurde verabschiedet.","Wir verabschieden eine neue Regel."}	2	20	\N	\N	\N
6137	verbessern	{"to improve"}	{"Wir verbessern die Qualität.","Er hat seine Leistung verbessert."}	2	20	\N	\N	\N
6139	verhalten	{behaviour}	{"Sein Verhalten war unhöflich.","Das Verhalten der Mitarbeiter ist vorbildlich."}	2	20	3	\N	\N
6140	verlegen	{"to reschedule"}	{"Wir verlegen das Meeting auf morgen.","Der Termin wurde verlegt."}	2	20	\N	\N	\N
6141	vermeiden	{"to avoid"}	{"Bitte vermeiden Sie Fehler.","Wir vermeiden Stress im Büro."}	2	20	\N	\N	\N
6142	vermeidung	{avoidance}	{"Die Vermeidung von Risiken ist wichtig.","Vermeidung ist besser als Nachsicht."}	2	20	2	\N	\N
6144	vertrieb	{sales}	{"Der Vertrieb steigert den Umsatz.","Sie arbeitet im Vertrieb."}	2	20	1	\N	\N
6145	verwenden	{"to use"}	{"Wir verwenden umweltfreundliches Material.","Kannst du dieses Werkzeug verwenden?"}	2	20	\N	\N	\N
6146	vorbeikommen	{"to drop by"}	{"Kannst du morgen bei mir vorbeikommen?","Er kommt heute Nachmittag vorbei."}	2	20	\N	\N	\N
6147	vorbereiten	{"to prepare"}	{"Wir bereiten das Meeting vor.","Kannst du das Essen vorbereiten?"}	2	20	\N	\N	\N
6149	werbeflyer	{flyer}	{"Der Werbeflyer liegt auf dem Tisch.","Wir drucken neue Werbeflyer."}	2	20	1	\N	\N
6150	werbeagentur	{"marketing agency"}	{"Die Werbeagentur plant eine Kampagne.","Er arbeitet bei einer Werbeagentur."}	2	20	2	\N	\N
6151	werbetexter/in	{"copy writer"}	{"Der Werbetexter schreibt Slogans.","Die Werbetexterin arbeitet an einer Kampagne."}	2	20	5	\N	\N
6454	zahlungsempfänger/in	{payee}	{"Der Zahlungsempfänger bestätigte den Erhalt.","Die Zahlungsempfängerin ist im Ausland."}	2	23	5	\N	\N
6121	elektrik	{electrics}	{"Die Elektrik im Haus ist alt.","Ein Problem mit der Elektrik verursachte den Ausfall."}	2	20	2	\N	\N
6122	personalleiter/in	{"head of personnel"}	{"Der Personalleiter führt das Gespräch.","Die Personalleiterin ist sehr kompetent."}	2	20	5	\N	\N
6123	protokoll	{protocol}	{"Das Protokoll wird im Meeting geschrieben.","Lies bitte das Protokoll durch."}	2	20	3	\N	\N
6124	reagieren	{"to react"}	{"Wie reagierst du auf Stress?","Er reagierte schnell auf die Frage."}	2	20	\N	\N	\N
6125	regel	{rule}	{"Die Regel ist einfach zu verstehen.","Alle müssen die Regeln beachten."}	2	20	2	\N	Regeln
6126	rettungswagen	{ambulance}	{"Der Rettungswagen kam sofort.","Rufen Sie den Rettungswagen!"}	2	20	1	\N	\N
6127	rückfrage	{query}	{"Bei Rückfragen rufen Sie uns an.","Die Rückfrage wurde schnell beantwortet."}	2	20	2	\N	\N
6128	sekretariat	{"secretary's office"}	{"Das Sekretariat ist bis 17 Uhr geöffnet.","Frau Müller arbeitet im Sekretariat."}	2	20	3	\N	\N
6129	sicherheit	{security}	{"Sicherheit ist das Wichtigste.","Die Sicherheit der Daten ist gewährleistet."}	2	20	2	\N	\N
6130	steckdose	{socket}	{"Die Steckdose funktioniert nicht.","Hier gibt es keine Steckdose."}	2	20	2	\N	\N
6131	steuer	{tax}	{"Die Steuer muss bis Juli gezahlt werden.","Er berechnet die Steuer."}	2	20	2	\N	\N
6132	teelicht	{"tea light"}	{"Das Teelicht brennt auf dem Tisch.","Kaufen Sie bitte Teelichter für die Party."}	2	20	3	\N	Teelichter
6133	überlasten	{"to overload"}	{"Überlasten Sie den Stecker nicht!","Das Netzwerk ist überlastet."}	2	20	\N	\N	\N
6138	verboten	{"to forbid"}	{"Rauchen ist hier verboten.","Das Parken ist verboten."}	2	20	\N	\N	\N
6143	versicherung	{insurance}	{"Die Versicherung zahlt den Schaden.","Brauchen Sie eine neue Versicherung?"}	2	20	2	\N	Versicherungen
6148	vorschrift	{regulation}	{"Die Vorschrift muss eingehalten werden.","Neue Vorschriften gelten ab nächster Woche."}	2	20	2	\N	Vorschriften
6455	zeitungsartikel	{"newspaper article"}	{"Ich habe einen interessanten Zeitungsartikel gelesen.","Der Zeitungsartikel berichtet über ein wichtiges Ereignis."}	2	23	1	\N	Zeitungsartikel
6456	zeuge/zeugin	{witness}	{"Der Zeuge hat den Unfall genau beschrieben.","Die Zeugin hat alles gesehen und berichtet."}	2	23	5	\N	\N
6102	bereitstellen	{"to make ready"}	{"Bitte stellen Sie die Dokumente bereit.","Wir stellen die Stühle für das Meeting bereit."}	2	20	\N	\N	\N
6104	besprechung	{meeting}	{"Die Besprechung beginnt um 10 Uhr.","Wir haben eine wichtige Besprechung."}	2	20	2	\N	\N
6105	betätigen	{"to operate"}	{"Bitte betätigen Sie den Notausschalter.","Er betätigt die Maschine vorsichtig."}	2	20	\N	\N	\N
6106	betreffen	{"to relate to"}	{"Das betrifft alle Mitarbeiter.","Worum handelt es sich bei diesem Problem?"}	2	20	\N	\N	\N
6107	bewahren	{"to save from"}	{"Bitte bewahren Sie die Rechnung auf.","Wir bewahren die Dokumente im Ordner."}	2	20	\N	\N	\N
6108	bewegen	{"to move"}	{"Können Sie den Tisch bitte bewegen?","Die Kinder bewegen sich im Garten."}	2	20	\N	\N	\N
6152	entwurf	{draft}	{"Der Entwurf muss noch korrigiert werden.","Sie zeigte mir den Entwurf des Plans."}	2	20	1	\N	Entwürfe
6153	erlauben	{"to allow"}	{"Darf ich mir das erlauben?","Die Firma erlaubt Homeoffice."}	2	20	\N	\N	\N
6154	erwarten	{"to wait for"}	{"Wir erwarten einen wichtigen Gast.","Er erwartet ein Paket heute."}	2	20	\N	\N	\N
6155	erwischen	{"to catch"}	{"Die Polizei erwischte den Dieb.","Ich habe den letzten Zug noch erwischt."}	2	20	\N	\N	\N
6156	feuerlöscher	{"fire extinguisher"}	{"Der Feuerlöscher hängt an der Wand.","Jeder sollte wissen, wie man einen Feuerlöscher benutzt."}	2	20	1	\N	\N
6157	flamme	{flame}	{"Die Flamme ist zu hoch.","Sie zündete eine Kerze an und die Flamme brannte hell."}	2	20	2	\N	Flammen
6158	folgen	{"to follow"}	{"Bitte folgen Sie mir zum Büro.","Die Hunde folgen ihrem Herrchen."}	2	20	\N	\N	\N
6159	gefährden	{"to endanger"}	{"Rauchen gefährdet die Gesundheit.","Das Verhalten des Fahrers gefährdet alle."}	2	20	\N	\N	\N
6160	gestalten	{"to design"}	{"Wir gestalten die Website neu.","Der Raum wurde modern gestaltet."}	2	20	\N	\N	\N
6161	gesund	{healthy}	{"Obst und Gemüse sind gesund.","Er ist wieder gesund nach der Krankheit."}	2	20	\N	\N	\N
6162	grafik	{graphics}	{"Die Grafik zeigt die Ergebnisse.","Sie arbeitet in der Grafik-Abteilung."}	2	20	2	\N	Grafiken
6163	grafiker/in	{"graphic designer"}	{"Der Grafiker entwirft das Logo.","Unsere Grafikerin ist sehr kreativ."}	2	20	5	\N	\N
6164	hektik	{rush}	{"In der Hektik vergaß sie ihren Schlüssel.","Am Morgen herrscht immer viel Hektik."}	2	20	2	\N	\N
6165	heraussuchen	{"to pick out"}	{"Kannst du ein Kleid herausuchen?","Er suchte den besten Platz heraus."}	2	20	\N	\N	\N
6166	hinfahren	{"to go there"}	{"Wir fahren morgen zum Flughafen hin.","Kannst du mich zum Bahnhof hinfahren?"}	2	20	\N	\N	\N
6167	höflich	{polite}	{"Sei bitte höflich zum Kunden.","Sie hat höflich gefragt."}	2	20	\N	\N	\N
6168	internetzugang	{"internet access"}	{"Der Internetzugang ist heute gestört.","Brauchen Sie einen Internetzugang?"}	2	20	1	\N	\N
6169	kabelsalat	{"cable tangle"}	{"Der Kabelsalat unter dem Tisch ist gefährlich.","Bitte vermeide Kabelsalat!"}	2	20	1	\N	\N
6170	kennzeichnen	{"to mark"}	{"Bitte kennzeichnen Sie die Fehler.","Der Weg ist gut gekennzeichnet."}	2	20	\N	\N	\N
6171	kerze	{candle}	{"Die Kerze brennt auf dem Tisch.","Wir kaufen Kerzen für den Geburtstag."}	2	20	2	\N	Kerzen
6172	konto	{account}	{"Mein Konto ist bei der Sparkasse.","Eröffnen Sie ein neues Konto."}	2	20	3	\N	Konten
6173	kontoverbindung	{"account connection"}	{"Geben Sie bitte Ihre Kontoverbindung an.","Die Kontoverbindung ist falsch."}	2	20	2	\N	\N
6174	kopieren	{"to copy"}	{"Kannst du diese Seite kopieren?","Ich kopiere die Datei auf den USB-Stick."}	2	20	\N	\N	\N
6175	kraft	{power}	{"Er hat viel Kraft im Training.","Die Maschine verliert an Kraft."}	2	20	2	\N	Kräfte
6177	laptop	{laptop}	{"Mein Laptop ist kaputt.","Sie arbeitet immer am Laptop."}	2	20	1	\N	\N
6178	marketing	{marketing}	{"Das Marketing-Team plant eine Kampagne.","Marketing ist wichtig für den Erfolg."}	2	20	3	\N	\N
6179	mehrfachsteckdose	{"power strip"}	{"Die Mehrfachsteckdose ist überlastet.","Kaufen Sie eine neue Mehrfachsteckdose."}	2	20	2	\N	\N
6180	mitschreiben	{"to take notes"}	{"Können Sie mitschreiben?","Ich schreibe die Termine mit."}	2	20	\N	\N	\N
4637	reisemöglichkeit	{"travel option"}	{"Es gibt viele Reisemöglichkeiten nach Paris.","Welche Reisemöglichkeit ist die beste?"}	2	14	2	\N	Reisemöglichkeiten
4665	zeitschrift	{magazine}	{"Ich lese eine Zeitschrift im Zug.","Kaufst du die Zeitschrift am Kiosk?"}	2	14	2	\N	Zeitschriften
5019	fantastisch	{fantastic}	{"Das Essen schmeckt fantastisch.","Fantastisch! Das hast du gut gemacht."}	2	19	\N	\N	\N
6181	nachbereitung	{follow-up}	{"Die Nachbereitung des Meetings dauert lange.","Vergiss die Nachbereitung nicht!"}	2	20	2	\N	\N
6182	nennen	{"to name"}	{"Können Sie drei Städte nennen?","Sie nannte den Grund für die Verspätung."}	2	20	\N	\N	\N
6183	personalabteilung	{"personnel department"}	{"Die Personalabteilung ist im ersten Stock.","Melden Sie sich bei der Personalabteilung."}	2	20	2	\N	\N
6184	personalbüro	{"personnel office"}	{"Das Personalbüro ist heute geschlossen.","Gehen Sie bitte ins Personalbüro."}	2	20	3	\N	\N
6457	zurückgeben	{"to return"}	{"Ich muss das Buch morgen zurückgeben.","Hast du das Geld schon zurückgegeben?"}	2	23	\N	\N	\N
6519	schlüssel	{key}	{"Ich habe meinen Schlüssel verloren.","Der Schlüssel passt nicht ins Schloss."}	2	24	2	\N	\N
6520	segeln	{"to sail"}	{"Wir segeln am Wochenende auf dem See.","Segeln macht mir großen Spaß."}	2	24	\N	\N	\N
6521	sieg	{victory}	{"Der Sieg war hart erkämpft.","Wir feiern den Sieg unserer Mannschaft."}	2	24	1	\N	\N
6522	spielfeld	{"playing field"}	{"Das Spielfeld ist nass vom Regen.","Die Kinder rennen über das Spielfeld."}	2	24	3	\N	\N
6523	sportergebnis	{"sports result"}	{"Das Sportergebnis wurde live übertragen.","Die Sportergebnisse stehen in der Zeitung."}	2	24	3	\N	sportergebnisse
6524	sportplatz	{"sports field"}	{"Der Sportplatz ist beleuchtet.","Wir treffen uns am Sportplatz."}	2	24	1	\N	\N
6525	surfen	{"to surf"}	{"Im Urlaub surfen wir jeden Tag.","Er surft gerne im Internet."}	2	24	\N	\N	\N
6526	tango	{tango}	{"Sie tanzen leidenschaftlich Tango.","Tango ist ein schöner Tanz."}	2	24	1	\N	\N
6527	tänzer/in	{dancer}	{"Der Tänzer bewegt sich elegant.","Die Tänzerin tritt heute Abend auf."}	2	24	5	\N	\N
6528	tischdecke	{tablecloth}	{"Die Tischdecke ist aus Baumwolle.","Wir decken den Tisch mit einer neuen Tischdecke."}	2	24	2	\N	\N
6529	tischdekoration	{"table decoration"}	{"Die Tischdekoration ist sehr kreativ.","Wer macht die Tischdekoration für die Feier?"}	2	24	2	\N	\N
6530	trotzdem	{despite}	{"Es regnet, trotzdem gehen wir spazieren.","Trotzdem danke ich dir für deine Hilfe."}	2	24	\N	\N	\N
6531	umfangreich	{comprehensive}	{"Das Angebot ist sehr umfangreich.","Ein umfangreiches Programm erwartet uns."}	2	24	\N	\N	\N
6532	umfrage	{survey}	{"Die Umfrage dauert nur fünf Minuten.","Machen Sie bei unserer Umfrage mit!"}	2	24	2	\N	\N
6533	umkleide	{"changing room"}	{"Die Umkleide ist neben dem Pool.","In der Umkleide ist es eng."}	2	24	2	\N	\N
6534	unterhalten	{"to entertain"}	{"Wir unterhalten uns über Filme.","Der Clown unterhält die Kinder."}	2	24	\N	\N	\N
5042	krawatte	{tie}	{"Er trägt eine rote Krawatte.","Krawatten sind formell."}	2	19	2	\N	\N
5043	küchengerät	{"kitchen appliance"}	{"Das Küchengerät ist neu.","Küchengeräte erleichtern das Kochen."}	2	19	3	\N	Küchengeräte
6111	brandbekämpfung	{"fire fighting"}	{"Die Brandbekämpfung dauerte Stunden.","Die Feuerwehr ist für die Brandbekämpfung zuständig."}	2	20	2	\N	\N
6176	kundenbetreuung	{"customer support"}	{"Die Kundenbetreuung ist rund um die Uhr erreichbar.","Sie arbeitet in der Kundenbetreuung."}	2	20	2	\N	\N
6185	aggressiv	{aggressive}	{"Sein Verhalten war aggressiv.","Aggressives Spielen ist verboten."}	2	21	\N	\N	\N
6186	anders	{different}	{"Meine Meinung ist anders.","Andere Länder, andere Sitten."}	2	21	\N	\N	\N
6187	angst	{fear}	{"Sie hat Angst vor Prüfungen.","Kinder haben manchmal Angst im Dunkeln."}	2	21	2	\N	Ängste
6188	aufhören	{"to stop"}	{"Hör bitte mit dem Lärm auf!","Es hat aufgehört zu regnen."}	2	21	\N	\N	\N
6189	aufpassen	{"to watch out"}	{"Pass im Unterricht gut auf!","Pass auf die Straße auf!"}	2	21	\N	\N	\N
6190	ausreichend	{enough}	{"Das Essen ist für alle ausreichend.","Hast du ausreichend Zeit?"}	2	21	\N	\N	\N
6191	befriedigend	{satisfactory}	{"Die Note war befriedigend.","Seine Leistung ist befriedigend."}	2	21	\N	\N	\N
6192	begrüßung	{greeting}	{"Die Begrüßung war herzlich.","Wir üben Begrüßungen auf Deutsch."}	2	21	2	\N	Begrüßungen
6193	beraten	{"to advise"}	{"Der Lehrer berät die Schüler.","Wir beraten dich gerne."}	2	21	\N	\N	\N
6194	bericht	{report}	{"Schreibe einen Bericht über das Thema.","Der Bericht war sehr lang."}	2	21	1	\N	Berichte
6195	berufskolleg	{"vocational college"}	{"Sie studiert am Berufskolleg.","Das Berufskolleg bietet viele Kurse."}	2	21	1	\N	\N
6196	berufswunsch	{"career aspiration"}	{"Was ist dein Berufswunsch?","Ihr Berufswunsch ist Pilotin."}	2	21	2	\N	\N
6197	biologie	{biology}	{"Biologie ist mein Lieblingsfach.","Wir lernen Pflanzen in Biologie."}	2	21	3	\N	\N
6198	bundesland	{"federal state"}	{"Bayern ist ein Bundesland.","In welchem Bundesland wohnst du?"}	2	21	3	\N	\N
6199	chemie	{chemistry}	{"Chemie ist manchmal schwer.","Wir machen Experimente in Chemie."}	2	21	3	\N	\N
6200	damals	{"back then"}	{"Damals war die Schule strenger.","Wir haben uns damals oft getroffen."}	2	21	\N	\N	\N
6201	dieselbe	{"the same"}	{"Wir haben dieselbe Lehrerin.","Das ist dieselbe Aufgabe wie gestern."}	2	21	\N	\N	\N
6202	diplom	{diploma}	{"Er hat ein Diplom in Mathematik.","Das Diplom hängt an der Wand."}	2	21	3	\N	\N
6203	elternabend	{"parent's evening"}	{"Der Elternabend ist nächste Woche.","Meine Mutter geht zum Elternabend."}	2	21	1	\N	\N
6205	englischlehrer/in	{"English teacher"}	{"Unser Englischlehrer ist sehr nett.","Die Englischlehrerin kommt aus London."}	2	21	5	\N	\N
6206	erdkunde	{geography}	{"In Erdkunde lernen wir Länder.","Erdkunde ist interessant."}	2	21	3	\N	\N
6207	etwa	{around}	{"Wie alt bist du etwa?","Das dauert etwa eine Stunde."}	2	21	\N	\N	\N
6208	fach	{subject}	{"Mathe ist mein bestes Fach.","Welches Fach magst du am meisten?"}	2	21	3	\N	Fächer
6209	fachhochschule	{"technical college"}	{"Sie studiert an der Fachhochschule.","Die Fachhochschule ist in Berlin."}	2	21	2	\N	\N
6210	fachhochschulreife	{"technical college certificate"}	{"Er hat die Fachhochschulreife.","Die Fachhochschulreife ermöglicht ein Studium."}	2	21	2	\N	\N
6211	fluss	{river}	{"Der Fluss ist sehr lang.","Wir lernen Flüsse in Europa."}	2	21	1	\N	Flüsse
6212	formell	{formal}	{"Die Einladung war formell.","Formelle Kleidung ist erwünscht."}	2	21	\N	\N	\N
6213	fotograf/in	{photographer}	{"Der Fotograf macht Klassenfotos.","Die Fotografin arbeitet für eine Zeitung."}	2	21	5	\N	\N
6214	freiwillig	{voluntary}	{"Die Arbeit ist freiwillig.","Er hilft freiwillig im Unterricht."}	2	21	\N	\N	\N
6215	gesamtschule	{"comprehensive school"}	{"Die Gesamtschule hat viele Schüler.","Sie geht zur Gesamtschule."}	2	21	2	\N	\N
6216	geschichte	{history}	{"Geschichte ist mein Lieblingsfach.","Wir lernen über alte Kulturen in Geschichte."}	2	21	3	\N	\N
6217	gipsbein	{"leg in plaster"}	{"Er hat ein Gipsbein nach dem Unfall.","Mit einem Gipsbein kann man nicht laufen."}	2	21	3	\N	\N
5040	kopfhörer	{headphones}	{"Ich höre Musik mit Kopfhörern.","Die Kopfhörer sind kaputt."}	2	19	1	\N	\N
5041	kosmetiklasche	{"cosmetic bag"}	{"Die Kosmetiklasche ist klein.","Ich packe meine Kosmetiklasche ein."}	2	19	2	\N	\N
6221	hauptschule	{"secondary school"}	{"Die Hauptschule endet nach der 9. Klasse.","Er wechselt zur Hauptschule."}	2	21	2	\N	\N
6222	hinfallen	{"to fall over"}	{"Pass auf, dass du nicht hinfällst!","Das Kind ist hingefallen."}	2	21	\N	\N	\N
6224	jugendliche	{youth}	{"Jugendliche treffen sich hier.","Viele Jugendliche spielen Fußball."}	2	21	5	\N	Jugendlichen
6225	junge	{boy}	{"Der Junge liest ein Buch.","Zwei Jungen spielen im Hof."}	2	21	1	\N	Jungen
6226	kindertagesstätte (kita)	{"nursery school"}	{"Die Kita öffnet um 7 Uhr.","Meine Schwester geht in die Kita."}	2	21	2	\N	Kindertagesstätten (Kitas)
6227	klasse	{class}	{"Unsere Klasse hat 25 Schüler.","Die Klasse 8a ist laut."}	2	21	2	\N	\N
6228	klassenarbeit	{classwork}	{"Die Klassenarbeit war schwer.","Wir schreiben eine Klassenarbeit in Mathe."}	2	21	2	\N	\N
6229	klassenlehrer/in	{"class teacher"}	{"Der Klassenlehrer ist sehr hilfsbereit.","Die Klassenlehrerin organisiert die Ausflüge."}	2	21	5	\N	\N
6230	knöchel	{knuckle}	{"Er hat sich den Knöchel verletzt.","Mein Knöchel tut weh."}	2	21	1	\N	\N
6231	korb	{basket}	{"Der Korb ist voll mit Büchern.","Wir werfen Papier in den Korb."}	2	21	1	\N	\N
6232	kunst	{art}	{"In Kunst malen wir Bilder.","Kunst macht Spaß!"}	2	21	2	\N	\N
6233	lieblingsfach	{"favourite subject"}	{"Mein Lieblingsfach ist Sport.","Was ist dein Lieblingsfach?"}	2	21	3	\N	Lieblingsfächer
6234	lösen	{"to solve"}	{"Kannst du diese Aufgabe lösen?","Wir lösen die Matheprobleme zusammen."}	2	21	\N	\N	\N
6235	lust	{desire}	{"Ich habe Lust auf Eis.","Hast du Lust zu spielen?"}	2	21	2	\N	\N
6236	mädchen	{girl}	{"Das Mädchen liest ein Buch.","Drei Mädchen spielen im Park."}	2	21	3	\N	Mädchen
6237	mangelhaft	{unsatisfactory}	{"Die Note war mangelhaft.","Mangelhafte Leistungen müssen verbessert werden."}	2	21	\N	\N	\N
6238	mathearbeit	{"maths test"}	{"Die Mathearbeit war sehr schwer.","Morgen schreiben wir eine Mathearbeit."}	2	21	2	\N	\N
6239	meinung	{opinion}	{"Was ist deine Meinung dazu?","Meine Meinung ist anders."}	2	21	2	\N	Meinungen
6240	nachhilfe	{"private tuition"}	{"Sie gibt Nachhilfe in Englisch.","Ich brauche Nachhilfe in Chemie."}	2	21	2	\N	\N
6241	normal	{normal}	{"Das ist ganz normal.","Heute ist ein normaler Schultag."}	2	21	\N	\N	\N
6242	note	{mark}	{"Sie hat eine gute Note bekommen.","Die Note steht im Zeugnis."}	2	21	2	\N	Noten
6243	oberschule	{"secondary school"}	{"Die Oberschule geht bis zur 10. Klasse.","Er wechselt zur Oberschule."}	2	21	2	\N	\N
6244	olympisch	{olympic}	{"Wir lernen über olympische Spiele.","Das ist eine olympische Disziplin."}	2	21	\N	\N	\N
6245	pflicht	{duty}	{"Hausaufgaben sind eine Pflicht.","Es ist meine Pflicht zu helfen."}	2	21	2	\N	\N
6246	physik	{physics}	{"Physik ist manchmal kompliziert.","In Physik lernen wir über Energie."}	2	21	3	\N	\N
6247	pilot/in	{pilot}	{"Der Pilot fliegt das Flugzeug.","Sie will Pilotin werden."}	2	21	5	\N	\N
6248	planung	{schedule}	{"Die Planung des Ausflugs dauert lange.","Gute Planung ist wichtig."}	2	21	2	\N	\N
6249	realschule	{"secondary modern school"}	{"Die Realschule endet nach der 10. Klasse.","Sie geht zur Realschule."}	2	21	2	\N	\N
6250	rede	{speech}	{"Die Rede war sehr lang.","Er hält eine Rede vor der Klasse."}	2	21	2	\N	\N
6251	religion	{"religious studies"}	{"In Religion lernen wir über Feste.","Religion ist ein Pflichtfach."}	2	21	3	\N	\N
6252	schaubild	{diagram}	{"Das Schaubild erklärt den Prozess.","Zeichne ein Schaubild zur Aufgabe."}	2	21	3	\N	\N
6253	schrecklich	{terrible}	{"Der Unfall war schrecklich.","Das Essen schmeckt schrecklich."}	2	21	\N	\N	\N
6254	schulform	{"type of school"}	{"Welche Schulform besuchst du?","Es gibt verschiedene Schulformen."}	2	21	2	\N	\N
6255	schulleiter/in	{headteacher}	{"Der Schulleiter hielt eine Ansprache.","Die Schulleiterin ist sehr streng."}	2	21	5	\N	\N
6256	schulpflicht	{"compulsory school attendance"}	{"In Deutschland gibt es Schulpflicht.","Die Schulpflicht gilt bis 16 Jahre."}	2	21	2	\N	\N
6257	schulsystem	{"school system"}	{"Das Schulsystem ist komplex.","Wir vergleichen Schulsysteme."}	2	21	3	\N	\N
6258	selbst	{even}	{"Selbst der Lehrer war überrascht.","Das kannst du selbst machen."}	2	21	\N	\N	\N
6219	gymnasium	{"Grammar school"}	{"Sie besucht das Gymnasium.","Das Gymnasium bereitet auf die Uni vor."}	2	21	3	\N	\N
6220	halbjahr	{half-year}	{"Das Halbjahr endet im Januar.","Im ersten Halbjahr haben wir viel gelernt."}	2	21	3	\N	\N
6270	umknicken	{"to fold over"}	{"Pass auf, dass du nicht umknickst!","Er ist umgeknickt und hat Schmerzen."}	2	21	\N	\N	\N
6271	unfair	{unfair}	{"Das war unfair von dir!","Die Regel ist unfair."}	2	21	\N	\N	\N
4599	anschlusszug	{"connecting train"}	{"Der Anschlusszug fährt in fünf Minuten.","Wir müssen den Anschlusszug erreichen."}	2	14	1	\N	Anschlusszüge
4987	vorlage	{template}	{"Benutze diese Vorlage für deinen Lebenslauf!","Die Vorlage vereinfacht die Arbeit."}	2	18	2	\N	\N
6259	sozialpädagoge/-pädagogin	{"social education worker"}	{"Der Sozialpädagoge hilft den Schülern.","Die Sozialpädagogin organisiert Projekte."}	2	21	5	\N	\N
6260	sportunterricht	{"sports lessons"}	{"Sportunterricht macht Spaß!","Wir haben heute Sportunterricht."}	2	21	1	\N	\N
6261	streng	{strict}	{"Der Lehrer ist sehr streng.","Strege Regeln gelten hier."}	2	21	\N	\N	\N
6262	tagesordnung	{"daily schedule"}	{"Die Tagesordnung steht an der Tafel.","Wir besprechen die Tagesordnung."}	2	21	2	\N	\N
6263	teenager	{teenager}	{"Teenager haben viele Hobbys.","Sie ist eine typische Teenagerin."}	2	21	1	\N	Teenager
6264	teilnehmen	{"to take part"}	{"Wir nehmen am Wettbewerb teil.","Möchtest du teilnehmen?"}	2	21	\N	\N	\N
6265	tier	{animal}	{"Im Zoo gibt es viele Tiere.","Wir lernen über Tiere in Biologie."}	2	21	3	\N	Tiere
6266	tierpfleger/in	{zookeeper}	{"Der Tierpfleger füttert die Löwen.","Die Tierpflegerin arbeitet im Zoo."}	2	21	5	\N	\N
6267	träumen	{"to dream"}	{"Ich träume von Ferien.","Träumst du manchmal im Unterricht?"}	2	21	\N	\N	\N
6268	traurig	{sad}	{"Warum bist du so traurig?","Die Geschichte ist traurig."}	2	21	\N	\N	\N
6269	turnen	{"to do gymnastics"}	{"Wir turnen in der Sporthalle.","Sie turnt jeden Montag."}	2	21	\N	\N	\N
6272	ungenügend	{unsatisfactory}	{"Die Note ist ungenügend.","Ungenügende Leistungen müssen wiederholt werden."}	2	21	\N	\N	\N
6273	uniform	{uniform}	{"Die Schüler tragen eine Uniform.","Die Uniform ist blau und weiß."}	2	21	2	\N	\N
6274	unten	{under}	{"Das Buch liegt unten im Regal.","Unten im Erdgeschoss ist die Cafeteria."}	2	21	\N	\N	\N
6275	unterschied	{difference}	{"Was ist der Unterschied?","Es gibt große Unterschiede."}	2	21	1	\N	Unterschiede
6276	variante	{alternative}	{"Gibt es eine andere Variante?","Diese Variante ist besser."}	2	21	2	\N	Varianten
6277	vergangenheit	{past}	{"Wir lernen über die Vergangenheit.","In der Vergangenheit war alles anders."}	2	21	2	\N	\N
6278	vokabeltest	{"vocabulary test"}	{"Der Vokabeltest war einfach.","Wir schreiben einen Vokabeltest."}	2	21	1	\N	Vokabeltests
6279	vortrag	{presentation}	{"Mein Vortrag ist über Tiere.","Der Vortrag dauert 10 Minuten."}	2	21	1	\N	\N
6280	werfen	{"to throw"}	{"Wirf den Ball zu mir!","Er wirft Papier in den Müll."}	2	21	\N	\N	\N
4561	programm	{programme}	{"Das Fernsehprogramm ist langweilig.","Welches Programm siehst du gerne?"}	2	13	3	\N	Programme
6535	veranstalten	{"to organise"}	{"Wir veranstalten ein Sommerfest.","Der Verein veranstaltet einen Marathon."}	2	24	\N	\N	\N
6536	veranstaltungshinweis	{"event information"}	{"Der Veranstaltungshinweis hängt am Brett.","Alle Veranstaltungshinweise findest du online."}	2	24	1	\N	veranstaltungshinweise
6537	verbringen	{"to spend time"}	{"Wir verbringen den Tag am See.","Wie verbringst du deine Freizeit?"}	2	24	\N	\N	\N
6538	verpackung	{packaging}	{"Die Verpackung ist umweltfreundlich.","Wir reduzieren Plastikverpackungen."}	2	24	2	\N	verpackungen
6223	integrationsverein	{"integration association"}	{"Der Integrationsverein hilft Schülern.","Wir besuchen den Integrationsverein."}	2	21	1	\N	\N
6281	akupunktur	{acupuncture}	{"Die Akupunktur hilft bei Schmerzen.","Er hat Akupunktur ausprobiert."}	2	22	2	\N	\N
6282	alternative	{alternative}	{"Gibt es eine Alternative?","Wir suchen eine gesunde Alternative."}	2	22	2	\N	\N
6283	anerkannt	{recognised}	{"Die Methode ist wissenschaftlich anerkannt.","Er ist ein anerkannter Arzt."}	2	22	\N	\N	\N
6285	auflistung	{list}	{"Die Auflistung enthält alle Medikamente.","Erstellt eine Auflistung der Zutaten."}	2	22	2	\N	\N
6286	behandlung	{treatment}	{"Die Behandlung dauert eine Stunde.","Er sucht eine natürliche Behandlung."}	2	22	2	\N	Behandlungen
6287	belegen	{"to prove"}	{"Kannst du das mit Fakten belegen?","Die Studie belegt den Erfolg."}	2	22	\N	\N	\N
6288	bescheinigung	{certificate}	{"Die Bescheinigung liegt beim Arzt.","Brauchst du eine ärztliche Bescheinigung?"}	2	22	2	\N	Bescheinigungen
6289	boden	{floor}	{"Der Boden ist glatt.","Das Kind spielt auf dem Boden."}	2	22	1	\N	Böden
6290	dagegen	{"in contrast"}	{"Ich habe nichts dagegen.","Dagegen kann man nichts tun."}	2	22	\N	\N	\N
6291	damit	{"so that"}	{"Damit du gesund bleibst, iss Gemüse.","Er trinkt Tee, damit er schläft."}	2	22	\N	\N	\N
6292	eiswürfel	{"ice cube"}	{"Die Eiswürfel sind im Gefrierfach.","Gib zwei Eiswürfel ins Wasser."}	2	22	1	\N	Eiswürfel
6293	empfindlich	{sensitive}	{"Meine Haut ist empfindlich.","Sei vorsichtig, das Gerät ist empfindlich."}	2	22	\N	\N	\N
6294	engagieren	{"to engage"}	{"Er engagiert sich im Sportverein.","Wir engagieren Freiwillige für das Projekt."}	2	22	\N	\N	\N
6295	entspannen	{"to relax"}	{"Ich entspanne mich im Garten.","Yoga hilft, zu entspannen."}	2	22	\N	\N	\N
6296	entspannung	{relaxation}	{"Entspannung ist wichtig für die Gesundheit.","Wir üben Entspannungstechniken."}	2	22	2	\N	\N
6297	erfahren	{"to find out"}	{"Wir erfahren morgen das Ergebnis.","Sie möchte mehr über die Behandlung erfahren."}	2	22	\N	\N	\N
6298	erstatten	{"to compensate"}	{"Die Kosten werden erstattet.","Kann ich das Geld erstatten?"}	2	22	\N	\N	\N
6299	fit	{fit}	{"Er ist sehr fit durch Sport.","Fit bleiben ist wichtig."}	2	22	\N	\N	\N
6300	gesamt	{whole}	{"Die gesamte Familie ist gesund.","Das Projekt dauert einen gesamten Monat."}	2	22	\N	\N	\N
6301	gesundheitlich	{hygienic}	{"Das ist gesundheitlich unbedenklich.","Gesundheitliche Probleme sollten ernst genommen werden."}	2	22	\N	\N	\N
6302	gymnastik	{gymnastics}	{"Wir machen Gymnastik am Morgen.","Gymnastik stärkt die Muskeln."}	2	22	2	\N	\N
6303	handgelenk	{wrist}	{"Mein Handgelenk tut weh.","Sie trägt eine Uhr am Handgelenk."}	2	22	3	\N	\N
6304	hausmittel	{"home remedy"}	{"Honig ist ein gutes Hausmittel.","Wir verwenden Hausmittel gegen Husten."}	2	22	3	\N	Hausmittel
6305	haut	{skin}	{"Die Haut braucht Pflege.","Sonnencreme schützt die Haut."}	2	22	2	\N	\N
6306	hiermit	{herewith}	{"Hiermit bestätige ich den Empfang.","Hiermit erkläre ich das Meeting für eröffnet."}	2	22	\N	\N	\N
6307	hierzu	{hereto}	{"Hierzu gibt es keine Alternative.","Ich habe hierzu eine Frage."}	2	22	\N	\N	\N
6308	hochlegen	{"to elevate"}	{"Leg das Bein hoch, um die Schwellung zu reduzieren.","Sie legt den Arm nach der Verletzung hoch."}	2	22	\N	\N	\N
6309	holen	{"to fetch"}	{"Kannst du die Medizin holen?","Ich hole Hilfe."}	2	22	\N	\N	\N
6310	klagen	{"to sue"}	{"Sie klagt über Kopfschmerzen.","Er klagt gegen die Firma."}	2	22	\N	\N	\N
6311	kommunizieren	{"to communicate"}	{"Ärzte müssen gut kommunizieren.","Wir kommunizieren per E-Mail."}	2	22	\N	\N	\N
6204	elternsprechtag	{"parent-teacher day"}	{"Am Elternsprechtag gibt es Gespräche.","Der Elternsprechtag dauert zwei Stunden."}	2	21	1	\N	\N
6218	glück	{luck}	{"Viel Glück bei der Prüfung!","Glück ist manchmal wichtig."}	2	21	3	\N	\N
6284	anweisung	{instruction}	{"Bitte folgen Sie den Anweisungen.","Die Anweisung war unklar."}	2	22	2	\N	Anweisungen
6325	reizen	{"to irritate"}	{"Die Creme reizt die Haut.","Lautes Geräusch reizt die Ohren."}	2	22	\N	\N	\N
6326	rückenmuskulatur	{"back muscles"}	{"Stärke deine Rückenmuskulatur mit Übungen.","Die Rückenmuskulatur ist verspannt."}	2	22	2	\N	\N
6327	schlafengehen	{"to go to sleep"}	{"Ich gehe um 22 Uhr schlafen.","Die Kinder müssen früh schlafengehen."}	2	22	\N	\N	\N
6328	schlagen	{"to hit"}	{"Er schlägt den Ball weit.","Schlag nicht auf den Tisch!"}	2	22	\N	\N	\N
6329	schmerztablette	{"pain medication"}	{"Nimm eine Schmerztablette gegen Kopfweh.","Schmerztabletten helfen schnell."}	2	22	2	\N	\N
6330	schwellung	{swelling}	{"Die Schwellung geht mit Eis zurück.","Nach dem Sturz gab es eine Schwellung."}	2	22	2	\N	\N
6331	selber	{"by oneself"}	{"Das kannst du selber machen.","Er hat das Problem selber gelöst."}	2	22	\N	\N	\N
6332	speziell	{special}	{"Dieses Öl ist speziell für die Haut.","Brauchst du spezielles Training?"}	2	22	\N	\N	\N
6333	sportart	{"type of sport"}	{"Welche Sportart magst du am liebsten?","Schwimmen ist eine gesunde Sportart."}	2	22	2	\N	\N
6334	sportverein	{"sports club"}	{"Sie trainiert im Sportverein.","Unser Sportverein hat viele Mitglieder."}	2	22	1	\N	\N
6335	ständig	{constant}	{"Er hat ständig Kopfschmerzen.","Ständiger Stress ist ungesund."}	2	22	\N	\N	\N
6336	stärken	{"to strengthen"}	{"Yoga stärkt die Muskeln.","Vitamine stärken das Immunsystem."}	2	22	\N	\N	\N
6337	tanzkurs	{"dance class"}	{"Der Tanzkurs beginnt nächste Woche.","Sie besucht einen Tanzkurs im Verein."}	2	22	1	\N	\N
6338	teilnahme	{participation}	{"Die Teilnahme am Kurs ist kostenlos.","Vielen Dank für Ihre Teilnahme!"}	2	22	2	\N	\N
6339	teilnahmebescheinigung	{"participation certificate"}	{"Nach dem Kurs erhalten Sie eine Teilnahmebescheinigung.","Die Teilnahmebescheinigung liegt bereit."}	2	22	2	\N	\N
6340	telefonisch	{"by telephone"}	{"Bitte melden Sie sich telefonisch an.","Die Beratung ist auch telefonisch möglich."}	2	22	\N	\N	\N
6341	therapie	{therapy}	{"Die Therapie hilft bei der Genesung.","Er macht eine physikalische Therapie."}	2	22	2	\N	\N
6342	trainer/in	{trainer}	{"Der Trainer zeigt die Übungen.","Die Trainerin ist sehr geduldig."}	2	22	5	\N	\N
6343	treiben	{"to do"}	{"Sie treibt regelmäßig Sport.","Was treibst du in deiner Freizeit?"}	2	22	\N	\N	\N
6344	tüte	{bag}	{"Die Medizin ist in der Tüte.","Kannst du eine Tüte für den Müll holen?"}	2	22	2	\N	\N
6345	übelkeit	{nausea}	{"Sie hat Übelkeit nach der Operation.","Übelkeit kann ein Nebenwirkung sein."}	2	22	2	\N	\N
6346	übersenden	{"to send"}	{"Wir übersenden die Unterlagen per Post.","Bitte übersenden Sie mir die Rechnung."}	2	22	\N	\N	\N
6347	überweisen	{"to transfer"}	{"Überweisen Sie das Geld an die Klinik.","Der Arzt überweist den Patienten ins Krankenhaus."}	2	22	\N	\N	\N
6348	übrigens	{"by the way"}	{"Übrigens, vergiss die Tabletten nicht!","Übrigens, der Termin wurde verschoben."}	2	22	\N	\N	\N
6349	verabschiedung	{approval}	{"Die Verabschiedung des Gesetzes dauert.","Die Verabschiedung des Plans erfolgte einstimmig."}	2	22	2	\N	\N
6350	vermitteln	{"to procure"}	{"Die Apotheke vermittelt Medikamente.","Er vermittelt einen Termin beim Facharzt."}	2	22	\N	\N	\N
6351	verschreiben	{"to prescribe"}	{"Der Arzt verschreibt Antibiotika.","Dieses Medikament darf nur der Arzt verschreiben."}	2	22	\N	\N	\N
6352	versicherungsnehmer/in	{"policy holder"}	{"Der Versicherungsnehmer muss unterschreiben.","Die Versicherungsnehmerin hat Fragen zur Police."}	2	22	5	\N	\N
6353	versicherungstarif	{"insurance tariff"}	{"Der Versicherungstarif ist günstig.","Vergleichen Sie die Versicherungstarife."}	2	22	1	\N	\N
6354	verspannung	{tension}	{"Die Verspannung im Nacken ist schmerzhaft.","Massagen lösen Verspannungen."}	2	22	2	\N	Verspannungen
6355	während	{during}	{"Während der Behandlung bitte stillhalten.","Während des Essens nicht sprechen."}	2	22	\N	\N	\N
6323	pilates	{pilates}	{"Pilates stärkt die Rückenmuskulatur.","Sie macht Pilates im Fitnessstudio."}	2	22	3	\N	\N
6324	rat	{advice}	{"Kannst du mir Rat geben?","Der Arzt gab einen guten Rat."}	2	22	1	\N	\N
4996	bart	{beard}	{"Sein Bart ist sehr lang.","Männer rasieren oft den Bart."}	2	19	1	\N	Bärte
4997	bekleidung	{clothing}	{"Bekleidung kaufe ich im Kaufhaus.","Die Bekleidung ist aus Baumwolle."}	2	19	2	\N	\N
4998	bestimmt	{surely}	{"Das Kleid ist bestimmt teuer.","Bestimmt regnet es morgen."}	2	19	\N	\N	\N
4999	blond	{blond}	{"Sie hat blondes Haar.","Blond steht dir gut."}	2	19	\N	\N	\N
6312	kompliziert	{complicated}	{"Die Anweisung ist kompliziert.","Das Verfahren ist sehr kompliziert."}	2	22	\N	\N	\N
6313	kostenerstattung	{"reimbursement of costs"}	{"Die Kostenerstattung dauert zwei Wochen.","Beantragen Sie die Kostenerstattung."}	2	22	2	\N	\N
6356	wärmflasche	{"hot water bottle"}	{"Die Wärmflasche hilft bei Bauchschmerzen.","Sie füllt die Wärmflasche mit heißem Wasser."}	2	22	2	\N	\N
6357	weggehen	{"to go away"}	{"Der Schmerz wird bald weggehen.","Kannst du nicht einfach weggehen?"}	2	22	\N	\N	\N
6358	zwischendurch	{occasionally}	{"Trink zwischendurch viel Wasser.","Zwischendurch braucht man Pausen."}	2	22	\N	\N	\N
6389	formulieren	{"to formulate"}	{"Formulieren Sie Ihre Anfrage klar.","Er formulierte einen Antrag."}	2	23	\N	\N	\N
6398	hufeisen	{horseshoe}	{"Das Hufeisen bringt Glück.","Ein goldenes Hufeisen hängt an der Tür."}	2	23	3	\N	\N
6453	weglaufen	{"to run away"}	{"Der Dieb wollte weglaufen.","Vor Problemen kann man nicht weglaufen."}	2	23	\N	\N	\N
6458	abschalten	{"to switch off"}	{"Ich schalte den Computer ab.","Abends schalte ich gerne ab."}	2	24	\N	\N	\N
6459	appetit	{appetite}	{"Ich habe großen Appetit auf Pizza.","Nach dem Sport kommt der Appetit."}	2	24	1	\N	\N
6460	ärgern	{"to annoy"}	{"Er ärgert seinen Bruder immer.","Ärgere dich nicht über Kleinigkeiten!"}	2	24	\N	\N	\N
6461	asiatisch	{Asian}	{"Wir essen gerne asiatisch.","Asiatische Kultur ist faszinierend."}	2	24	\N	\N	\N
6462	ausflug	{excursion}	{"Am Wochenende machen wir einen Ausflug.","Der Ausflug in die Berge war toll."}	2	24	1	\N	ausflüge
6463	ausgezeichnet	{excellent}	{"Das Essen schmeckt ausgezeichnet!","Sie hat eine ausgezeichnete Idee."}	2	24	\N	\N	\N
6464	ausgleich	{balance}	{"Sport ist ein guter Ausgleich zum Alltag.","Sie sucht einen Ausgleich zwischen Arbeit und Freizeit."}	2	24	1	\N	\N
6465	außer	{"apart from"}	{"Außer mir kommt niemand.","Wir machen alles außer Schwimmen."}	2	24	\N	\N	\N
6466	aussicht	{prospect}	{"Die Aussicht vom Berg ist wunderschön.","Wir haben keine Aussicht auf Erfolg."}	2	24	2	\N	\N
6467	babysitter/in	{babysitter}	{"Der Babysitter kommt heute Abend.","Die Babysitterin ist sehr zuverlässig."}	2	24	5	\N	\N
6468	band	{band}	{"Die Band spielt live im Park.","Meine Lieblingsband kommt aus Berlin."}	2	24	2	\N	\N
6469	basketball	{basketball}	{"Wir spielen Basketball im Park.","Basketball macht viel Spaß."}	2	24	3	\N	\N
6470	basteln	{"to do crafts"}	{"Kinder basteln gerne mit Papier.","Wir basteln Weihnachtsschmuck."}	2	24	\N	\N	\N
6471	besteck	{cutlery}	{"Das Besteck liegt auf dem Tisch.","Kannst du das Besteck holen?"}	2	24	3	\N	\N
6472	chor	{choir}	{"Der Chor singt im Gemeindesaal.","Sie ist Mitglied im Schulchor."}	2	24	1	\N	\N
6473	daheim	{"at home"}	{"Ich bleibe heute daheim.","Daheim ist es am schönsten."}	2	24	\N	\N	\N
6474	daumen	{thumb}	{"Er hat sich den Daumen verletzt.","Drück mir die Daumen für die Prüfung!"}	2	24	1	\N	\N
6475	einlass	{admission}	{"Der Einlass beginnt um 19 Uhr.","Ohne Ticket gibt es keinen Einlass."}	2	24	1	\N	\N
6476	entlang	{along}	{"Wir gehen den Fluss entlang.","Fahren Sie die Straße entlang."}	2	24	\N	\N	\N
6477	event	{event}	{"Das Event findet im Park statt.","Wir planen ein großes Event."}	2	24	3	\N	\N
6478	feuerzeug	{lighter}	{"Hast du ein Feuerzeug dabei?","Das Feuerzeug ist leer."}	2	24	3	\N	\N
6479	freizeit	{"free time"}	{"In meiner Freizeit lese ich Bücher.","Freizeit ist wichtig für Erholung."}	2	24	2	\N	\N
6480	freizeitaktivität	{"free time activities"}	{"Welche Freizeitaktivitäten magst du?","Freizeitaktivitäten machen Spaß."}	2	24	2	\N	freizeitaktivitäten
4529	empfehlung	{recommendation}	{"Danke für deine Empfehlung!","Die Empfehlung des Lehrers war hilfreich."}	2	13	2	\N	Empfehlungen
6481	freizeitangebot	{"leisure opportunities"}	{"Die Stadt hat viele Freizeitangebote.","Schau dir das Freizeitangebot online an."}	2	24	3	\N	freizeitangebote
6482	freizeitvergnügen	{pastime}	{"Angeln ist sein liebstes Freizeitvergnügen.","Freizeitvergnügen sind vielfältig."}	2	24	3	\N	\N
6483	gabel	{fork}	{"Die Gabel liegt links vom Teller.","Kannst du mir eine Gabel geben?"}	2	24	2	\N	gabeln
6484	gastronomie	{gastronomy}	{"Die Gastronomie in der Stadt ist vielfältig.","Er arbeitet in der Gastronomie."}	2	24	2	\N	\N
6485	gedicht	{poem}	{"Sie schreibt ein romantisches Gedicht.","Gedichte sind manchmal schwer zu verstehen."}	2	24	3	\N	gedichte
6486	gegensatz	{contrast}	{"Schwarz und Weiß sind Gegensätze.","Im Gegensatz zu dir mag ich Kaffee."}	2	24	1	\N	\N
6487	geiger/in	{violinist}	{"Der Geiger spielt im Orchester.","Die Geigerin übt täglich."}	2	24	5	\N	\N
6488	gemischt	{mixed}	{"Die Gruppe ist gemischt aus Jung und Alt.","Gemischte Salate sind gesund."}	2	24	\N	\N	\N
6489	geschirr	{crockery}	{"Das Geschirr muss gespült werden.","Neues Geschirr sieht schön aus."}	2	24	3	\N	\N
6490	grill	{barbecue}	{"Wir kaufen einen neuen Grill.","Am Wochenende machen wir Grillen."}	2	24	1	\N	\N
6491	grillkohle	{"barbecue coal"}	{"Die Grillkohle ist fast verbraucht.","Kannst du Grillkohle mitbringen?"}	2	24	2	\N	\N
6492	grillplatz	{"barbecue area"}	{"Der Grillplatz ist reserviert.","Am See gibt es einen Grillplatz."}	2	24	1	\N	\N
6493	grillsoße	{"barbecue sauce"}	{"Die Grillsoße schmeckt würzig.","Hast du Grillsoße gekauft?"}	2	24	2	\N	\N
6494	grillzange	{"barbecue tong"}	{"Die Grillzange liegt neben dem Grill.","Pass auf, die Grillzange ist heiß!"}	2	24	2	\N	\N
6495	herrlich	{delightful}	{"Das Wetter ist herrlich!","Ein herrlicher Tag am Strand."}	2	24	\N	\N	\N
6496	herum	{around}	{"Die Kinder laufen im Garten herum.","Wir sitzen um das Feuer herum."}	2	24	\N	\N	\N
6497	interessieren	{"to interest"}	{"Das Thema interessiert mich nicht.","Interessierst du dich für Kunst?"}	2	24	\N	\N	\N
6498	interviewpartner/in	{"interview partner"}	{"Der Interviewpartner kommt gleich.","Die Interviewpartnerin antwortet offen."}	2	24	5	\N	\N
6499	irgendwo	{somewhere}	{"Ich habe mein Handy irgendwo verloren.","Lass uns irgendwo hingehen!"}	2	24	\N	\N	\N
6500	jährlich	{annually}	{"Das Festival findet jährlich statt.","Wir zahlen jährlich einen Beitrag."}	2	24	\N	\N	\N
6501	jeweils	{respectively}	{"Die Gruppen treffen sich jeweils montags.","Jeweils zwei Personen arbeiten zusammen."}	2	24	\N	\N	\N
6502	knackig	{crispy}	{"Das Brot ist frisch und knackig.","Knackiges Gemüse ist gesund."}	2	24	\N	\N	\N
6503	konzentrieren	{"to concentrate"}	{"Konzentrier dich auf deine Arbeit!","Ich kann mich hier nicht konzentrieren."}	2	24	\N	\N	\N
6504	kumpel	{mate}	{"Mein Kumpel hilft mir immer.","Wir treffen uns mit alten Kumpels."}	2	24	1	\N	\N
6505	leidenschaft	{passion}	{"Tanzen ist ihre größte Leidenschaft.","Er verfolgt seine Leidenschaft für Musik."}	2	24	2	\N	\N
6506	löffel	{spoon}	{"Der Löffel fällt auf den Boden.","Brauchst du einen Löffel für die Suppe?"}	2	24	1	\N	löffel
6507	malen	{"to paint"}	{"Kinder malen gerne mit Wasserfarben.","Er malt ein Bild für die Ausstellung."}	2	24	\N	\N	\N
6508	meist	{most}	{"Meist gehe ich früh ins Bett.","Das ist die meist gestellte Frage."}	2	24	\N	\N	\N
6509	messer	{knife}	{"Das Messer ist scharf.","Kannst du das Messer reichen?"}	2	24	3	\N	messer
6510	mitfahren	{"to travel with"}	{"Kann ich mit dir mitfahren?","Wir fahren mit dem Zug mit."}	2	24	\N	\N	\N
6511	nähen	{"to sew"}	{"Sie näht ein Kleid für die Party.","Ich lerne gerade nähen."}	2	24	\N	\N	\N
6512	normalerweise	{normally}	{"Normalerweise gehe ich um 7 Uhr aus dem Haus.","Normalerweise regnet es hier im April."}	2	24	\N	\N	\N
6513	open-air-konzert	{"open air concert"}	{"Das Open-Air-Konzert war fantastisch.","Wir besuchen ein Open-Air-Konzert im Park."}	2	24	3	\N	\N
6514	poetry-slam	{"poetry slam"}	{"Der Poetry-Slam beginnt um 20 Uhr.","Sie tritt beim Poetry-Slam auf."}	2	24	1	\N	\N
6515	regie	{management}	{"Die Regie des Films war hervorragend.","Er übernimmt die Regie für das Theaterstück."}	2	24	2	\N	\N
6516	saal	{hall}	{"Der Saal ist gut gefüllt.","Wir mieten einen Saal für die Feier."}	2	24	1	\N	säle
6517	schach	{chess}	{"Schach spielen trainiert das Gehirn.","Wir spielen jeden Abend Schach."}	2	24	3	\N	\N
6518	schnupperkurs	{"taster course"}	{"Der Schnupperkurs ist kostenlos.","Ich mache einen Schnupperkurs in Yoga."}	2	24	1	\N	\N
6314	kostenübernahme	{"cost transfer"}	{"Die Kostenübernahme wurde genehmigt.","Die Krankenkasse prüft die Kostenübernahme."}	2	22	2	\N	\N
6315	kühlen	{"to cool"}	{"Kühle die Verletzung mit Eis.","Die Creme kühlt die Haut."}	2	22	\N	\N	\N
6316	leihen	{"to lend"}	{"Kannst du mir dein Buch leihen?","Die Bibliothek leiht Bücher aus."}	2	22	\N	\N	\N
6317	manche	{some}	{"Manche Menschen sind allergisch.","Manche Medikamente haben Nebenwirkungen."}	2	22	\N	\N	\N
6318	massage	{massage}	{"Die Massage entspannt die Muskeln.","Er bucht eine Massage."}	2	22	2	\N	\N
6319	massieren	{"to massage"}	{"Der Physiotherapeut massiert den Rücken.","Kannst du meine Schultern massieren?"}	2	22	\N	\N	\N
6320	meditation	{meditation}	{"Meditation hilft gegen Stress.","Wir üben täglich Meditation."}	2	22	2	\N	\N
6321	muskel	{muscle}	{"Der Muskel tut nach dem Training weh.","Starke Muskeln sind wichtig."}	2	22	1	\N	Muskeln
6322	nebenwirkung	{"side effect"}	{"Das Medikament hat Nebenwirkungen.","Übelkeit ist eine häufige Nebenwirkung."}	2	22	2	\N	Nebenwirkungen
6359	abheben	{"to withdraw"}	{"Kann ich Geld am Automaten abheben?","Sie möchte 100 Euro abheben."}	2	23	\N	\N	\N
6360	aktivität	{activity}	{"Die Aktivität am Geldautomaten ist hoch.","Welche Aktivitäten bietet die Bank an?"}	2	23	2	\N	Aktivitäten
6361	anfordern	{"to request"}	{"Bitte fordern Sie eine neue Karte an.","Er fordert eine Kontoauszug an."}	2	23	\N	\N	\N
6362	armut	{poverty}	{"Armut ist ein globales Problem.","Die Bank unterstützt Projekte gegen Armut."}	2	23	2	\N	\N
6363	aufheben	{"to cancel"}	{"Kann ich den Vertrag aufheben?","Die Bank hebt die Gebühr auf."}	2	23	\N	\N	\N
6364	ausdrucken	{"to print"}	{"Drucken Sie die Rechnung aus.","Ich drucke den Kontoauszug aus."}	2	23	\N	\N	\N
6365	bankkarte	{"bank card"}	{"Meine Bankkarte ist gesperrt.","Haben Sie Ihre Bankkarte dabei?"}	2	23	2	\N	\N
6366	bankkaufmann/bankkauffrau	{banker}	{"Der Bankkaufmann berät Kunden.","Die Bankkauffrau arbeitet in der Filiale."}	2	23	5	\N	\N
6367	bankleitzahl	{"sort code"}	{"Die Bankleitzahl steht auf der Karte.","Geben Sie die Bankleitzahl an."}	2	23	2	\N	\N
6368	bankschalter	{"bank counter"}	{"Am Bankschalter wird bar ausgezahlt.","Der Bankschalter öffnet um 9 Uhr."}	2	23	1	\N	\N
6369	bar	{"in cash"}	{"Zahlen Sie bar oder mit Karte?","Ich habe nur bar dabei."}	2	23	\N	\N	\N
6370	bargeld	{cash}	{"Ich brauche mehr Bargeld.","Bargeld ist nicht immer notwendig."}	2	23	3	\N	\N
6371	bargeldlos	{cashless}	{"Bargeldloses Bezahlen ist modern.","Die Welt wird immer bargeldloser."}	2	23	\N	\N	\N
6372	basis	{basis}	{"Die Basis des Kontos ist sicher.","Auf dieser Basis arbeiten wir."}	2	23	2	\N	\N
6373	begleichen	{"to settle"}	{"Bitte begleichen Sie die Rechnung.","Er begleicht seine Schulden."}	2	23	\N	\N	\N
6374	berechnen	{"to calculate"}	{"Die Bank berechnet Gebühren.","Kannst du die Zinsen berechnen?"}	2	23	\N	\N	\N
6375	bestellnummer	{"order number"}	{"Geben Sie die Bestellnummer an.","Die Bestellnummer steht auf der Rechnung."}	2	23	2	\N	\N
6376	bestellung	{order}	{"Die Bestellung wurde storniert.","Bestellungen können online getätigt werden."}	2	23	2	\N	\N
6377	bic	{BIC}	{"Der BIC ist für Überweisungen nötig.","Wo finde ich den BIC der Bank?"}	2	23	1	\N	\N
6378	blick	{view}	{"Der Blick aufs Konto zeigt den Saldo.","Ein schneller Blick genügt."}	2	23	1	\N	\N
6379	broschüre	{brochure}	{"Die Broschüre erklärt die Kontotypen.","Holen Sie sich eine Broschüre am Schalter."}	2	23	2	\N	\N
6380	drücken	{"to press"}	{"Drücken Sie den grünen Knopf.","Zum Bestätigen bitte drücken."}	2	23	\N	\N	\N
6381	eigen	{own}	{"Das ist mein eigenes Konto.","Er verwaltet seine eigenen Finanzen."}	2	23	\N	\N	\N
6382	eingabe	{input}	{"Die Eingabe des PINs ist erforderlich.","Überprüfen Sie Ihre Eingabe."}	2	23	2	\N	Eingaben
6383	eingeben	{"to input"}	{"Geben Sie Ihre Daten ein.","Er gibt den Betrag in das System ein."}	2	23	\N	\N	\N
6384	einzahlen	{"to pay in"}	{"Ich zahle Geld auf mein Konto ein.","Kann ich hier Schecks einzahlen?"}	2	23	\N	\N	\N
6385	erledigen	{"to manage to"}	{"Ich erledige meine Bankgeschäfte online.","Kannst du das heute erledigen?"}	2	23	\N	\N	\N
6386	eröffnen	{"to open"}	{"Ich möchte ein Konto eröffnen.","Er eröffnete ein Sparkonto."}	2	23	\N	\N	\N
6387	filiale	{branch}	{"Die Filiale ist am Wochenende geschlossen.","Besuchen Sie unsere Filiale in der Innenstadt."}	2	23	2	\N	\N
6388	folgend	{following}	{"Im Folgenden erklären wir die Schritte.","Die folgende Woche ist wichtig."}	2	23	\N	\N	\N
6390	gebühr	{fee}	{"Die Gebühr beträgt 5 Euro.","Gibt es versteckte Gebühren?"}	2	23	2	\N	Gebühren
6391	geldautomat	{"cash machine"}	{"Der Geldautomat ist defekt.","Wo ist der nächste Geldautomat?"}	2	23	1	\N	\N
6392	geldbörse	{purse}	{"Meine Geldbörse ist leer.","Sie verlor ihre Geldbörse."}	2	23	2	\N	\N
6393	geldstück	{coin}	{"Ein Geldstück fiel auf den Boden.","Geldstücke sind schwer zu tragen."}	2	23	3	\N	Geldstücke
6394	genießen	{"to enjoy"}	{"Kunden genießen kostenlose Beratung.","Ich genieße das Online-Banking."}	2	23	\N	\N	\N
6395	gewinnen	{"to win"}	{"Er gewann einen Preis bei der Bank.","Gewinnen Sie Zinsen mit dem Konto."}	2	23	\N	\N	\N
6396	girocard	{girocard}	{"Die Girocard wird weltweit akzeptiert.","Haben Sie eine Girocard?"}	2	23	2	\N	\N
6397	girokonto	{"current account"}	{"Ich eröffne ein Girokonto.","Das Girokonto hat keine Gebühren."}	2	23	3	\N	\N
6399	iban	{IBAN}	{"Die IBAN steht auf der Karte.","Geben Sie die IBAN des Empfängers an."}	2	23	2	\N	\N
6400	indirekt	{indirect}	{"Die indirekten Kosten sind hoch.","Es gibt indirekte Zuschläge."}	2	23	\N	\N	\N
6401	innenstadt	{"city centre"}	{"Die Bank liegt in der Innenstadt.","In der Innenstadt gibt es viele Filialen."}	2	23	2	\N	\N
6402	jederzeit	{anytime}	{"Online-Banking ist jederzeit verfügbar.","Sie können uns jederzeit kontaktieren."}	2	23	\N	\N	\N
6403	kleeblatt	{cloverleaf}	{"Das Kleeblatt symbolisiert Glück.","Ein vierblättriges Kleeblatt ist selten."}	2	23	3	\N	\N
6404	kleingeld	{"small change"}	{"Hast du Kleingeld für den Automaten?","Kleingeld ist im Alltag praktisch."}	2	23	3	\N	\N
6405	kontoauszug	{"account statement"}	{"Der Kontoauszug zeigt alle Transaktionen.","Laden Sie den Kontoauszug herunter."}	2	23	1	\N	Kontoauszüge
6406	kontoinhaber/in	{"account holder"}	{"Der Kontoinhaber muss unterschreiben.","Die Kontoinhaberin hat zwei Konten."}	2	23	5	\N	\N
6407	kontonummer	{"account number"}	{"Ihre Kontonummer ist 12-stellig.","Geben Sie die Kontonummer an."}	2	23	2	\N	Kontonummern
6408	kontostand	{balance}	{"Der Kontostand ist zu niedrig.","Überprüfen Sie Ihren Kontostand online."}	2	23	1	\N	\N
6409	kontrollieren	{"to monitor"}	{"Kontrollieren Sie regelmäßig Ihr Konto.","Die Bank kontrolliert die Transaktionen."}	2	23	\N	\N	\N
6410	kreditinstitut	{"credit institute"}	{"Das Kreditinstitut vergibt Darlehen.","Wir vertrauen dem Kreditinstitut."}	2	23	3	\N	Kreditinstitute
6411	kreditkarte	{"credit card"}	{"Die Kreditkarte ist abgelaufen.","Bezahlen Sie mit Kreditkarte?"}	2	23	2	\N	Kreditkarten
6412	kundennummer	{"customer number"}	{"Ihre Kundennummer finden Sie oben rechts.","Die Kundennummer ist einzigartig."}	2	23	2	\N	Kundennummern
6413	kundenreferenz	{"customer reference"}	{"Die Kundenreferenz erleichtert die Zuordnung.","Vergessen Sie die Kundenreferenz nicht."}	2	23	2	\N	\N
6414	laden	{premises}	{"Der Laden der Bank ist modern.","In diesem Laden gibt es einen Schalter."}	2	23	1	\N	Läden
6415	leistung	{service}	{"Die Bank bietet viele Leistungen an.","Diese Leistung ist kostenpflichtig."}	2	23	2	\N	Leistungen
6416	menge	{amount}	{"Die Menge des Geldes ist begrenzt.","Eine große Menge wurde überwiesen."}	2	23	2	\N	\N
6417	mobil	{portable}	{"Mobiles Bezahlen ist einfach.","Die App ist mobil nutzbar."}	2	23	\N	\N	\N
6418	monatlich	{monthly}	{"Die monatliche Gebühr beträgt 5 Euro.","Er zahlt monatlich einen Betrag ein."}	2	23	\N	\N	\N
6419	münze	{coin}	{"Die Münze ist aus Silber.","Münzen sammeln ist ein Hobby."}	2	23	2	\N	Münzen
6420	niemand	{nobody}	{"Niemand kennt die PIN außer mir.","Niemand darf das Konto nutzen."}	2	23	\N	\N	\N
6421	nulltarif	{"zero tariff rate"}	{"Das Konto hat einen Nulltarif für Studenten.","Der Nulltarif gilt nur im ersten Jahr."}	2	23	1	\N	\N
6422	nutzen	{usage}	{"Nutzen Sie die Online-Funktionen.","Die Nutzen des Kontos sind vielfältig."}	2	23	\N	\N	\N
6423	online-banking	{"online banking"}	{"Online-Banking ist sicher und schnell.","Ich nutze täglich Online-Banking."}	2	23	3	\N	\N
6424	pfennig	{penny}	{"Der Pfennig ist eine alte Währung.","Ein Pfennig hat wenig Wert."}	2	23	1	\N	Pfennige
6425	pin	{PIN}	{"Geben Sie Ihre PIN ein.","Die PIN muss geheim bleiben."}	2	23	1	\N	\N
6426	quatsch	{rubbish}	{"Das ist doch Quatsch!","Er erzählt nur Quatsch."}	2	23	1	\N	\N
6427	rechnung	{bill}	{"Die Rechnung ist überfällig.","Bezahlen Sie die Rechnung online."}	2	23	2	\N	\N
6428	rechnungsbetrag	{"invoice amount"}	{"Der Rechnungsbetrag ist korrekt.","Überprüfen Sie den Rechnungsbetrag."}	2	23	1	\N	\N
4513	abendkasse	{"box office"}	{"Wir kaufen die Tickets an der Abendkasse.","Die Abendkasse öffnet um 18 Uhr."}	2	13	2	\N	\N
4514	abholen	{"to collect"}	{"Kannst du mich vom Bahnhof abholen?","Ich hole das Paket morgen ab."}	2	13	\N	\N	\N
4515	aktuell	{current}	{"Die aktuellen Nachrichten sind wichtig.","Was ist dein aktuelles Projekt?"}	2	13	\N	\N	\N
4516	alle	{all}	{"Alle Schüler sind im Klassenzimmer.","Ich habe alle Bücher gelesen."}	2	13	\N	\N	\N
4517	anklicken	{"to click"}	{"Klicke den Link an, um weiterzugehen.","Ich habe das Symbol angeklickt."}	2	13	\N	\N	\N
4518	app	{app}	{"Diese App hilft beim Deutschlernen.","Lade die App herunter, um Musik zu hören."}	2	13	2	\N	\N
6429	rechnungsnummer	{"invoice number"}	{"Die Rechnungsnummer finden Sie oben.","Geben Sie die Rechnungsnummer an."}	2	23	2	\N	\N
6430	reich	{rich}	{"Er ist sehr reich.","Reiche Leute haben oft mehrere Konten."}	2	23	\N	\N	\N
6431	reichtum	{wealth}	{"Reichtum bringt Verantwortung.","Sein Reichtum ist legendär."}	2	23	1	\N	\N
6432	respekt	{respect}	{"Respekt vor dem Geld anderer ist wichtig.","Er hat großen Respekt vor der Bank."}	2	23	1	\N	\N
4525	diskutieren	{"to discuss"}	{"Wir diskutieren über das neue Projekt.","Lass uns das Problem diskutieren."}	2	13	\N	\N	\N
4526	drucken	{"to print"}	{"Drucke das Dokument bitte aus.","Der Drucker funktioniert nicht."}	2	13	\N	\N	\N
4527	eintritt	{entry}	{"Der Eintritt ins Museum ist kostenlos.","Wir bezahlen den Eintritt an der Tür."}	2	13	1	\N	Eintritte
4528	empfehlen	{"to recommend"}	{"Kannst du einen guten Film empfehlen?","Ich empfehle dieses Restaurant."}	2	13	\N	\N	\N
4530	flirten	{"to flirt"}	{"Er flirtet oft im Café.","Flirten macht Spaß!"}	2	13	\N	\N	\N
4531	flohmarkt	{"flea market"}	{"Wir kaufen alte Bücher auf dem Flohmarkt.","Der Flohmarkt findet sonntags statt."}	2	13	1	\N	Flohmärkte
4532	forum	{forum}	{"Ich stelle meine Frage im Forum.","Das Forum ist sehr aktiv."}	2	13	3	\N	\N
4533	funktionieren	{"to work"}	{"Mein Handy funktioniert nicht mehr.","Funktioniert der Fernseher?"}	2	13	\N	\N	\N
4534	gebraucht	{used}	{"Ich kaufe ein gebrauchtes Fahrrad.","Gebrauchte Bücher sind günstiger."}	2	13	\N	\N	\N
4535	googeln	{"to google"}	{"Ich google die Adresse des Restaurants.","Kannst du das Wort googeln?"}	2	13	\N	\N	\N
4536	herausfinden	{"to find out"}	{"Wir finden die Lösung heraus.","Kannst du den Preis herausfinden?"}	2	13	\N	\N	\N
4537	herunterladen	{"to download"}	{"Lade die App herunter!","Ich habe das Video heruntergeladen."}	2	13	\N	\N	\N
4538	hochladen	{"to upload"}	{"Lade die Fotos auf den Computer hoch!","Ich habe das Dokument hochgeladen."}	2	13	\N	\N	\N
4539	informieren	{"to inform"}	{"Bitte informiere mich über die Änderungen.","Wir informieren uns online."}	2	13	\N	\N	\N
4540	international	{international}	{"Die Universität hat internationale Studenten.","Das Essen ist international."}	2	13	\N	\N	\N
4541	internet	{Internet}	{"Ohne Internet geht nichts mehr.","Surfe nicht zu lange im Internet."}	2	13	3	\N	\N
4542	kennwort	{password}	{"Gib dein Kennwort ein!","Ich habe mein Kennwort vergessen."}	2	13	3	\N	Kenwörter
4543	kinokarte	{"cinema ticket"}	{"Kaufen wir die Kinokarten online?","Die Kinokarte kostet 10 Euro."}	2	13	2	\N	\N
4544	klicken	{"to click"}	{"Klicke auf den Button!","Ich klicke das Foto an."}	2	13	\N	\N	\N
4545	kommentar	{comment}	{"Schreib einen Kommentar unter das Video!","Dein Kommentar ist hilfreich."}	2	13	1	\N	Kommentare
4546	kostenlos	{"free of charge"}	{"Das Wasser ist hier kostenlos.","Die App ist kostenlos."}	2	13	\N	\N	\N
4547	kulturcafé	{"culture café"}	{"Treffen wir uns im Kulturcafé?","Das Kulturcafé hat gute Musik."}	2	13	3	\N	\N
4548	leser/in	{reader}	{"Die Leser schreiben viele E-Mails.","Der Leser mag das Buch sehr."}	2	13	5	\N	\N
4549	löschen	{"to delete"}	{"Lösche die alte Datei!","Ich habe die Nachricht gelöscht."}	2	13	\N	\N	\N
4550	mailen	{"to mail"}	{"Maile mir die Informationen!","Ich maile dir morgen."}	2	13	\N	\N	\N
4551	mich	{me}	{"Kannst du mich sehen?","Er ruft mich jeden Tag an."}	2	13	\N	\N	\N
4552	mitkommen	{"to come along"}	{"Kommst du mit ins Kino?","Mein Hund möchte immer mitkommen."}	2	13	\N	\N	\N
4553	mitmachen	{"to participate"}	{"Machst du beim Wettbewerb mit?","Ich mache beim Sportkurs mit."}	2	13	\N	\N	\N
4554	nachschauen	{"to look up"}	{"Schau die Uhrzeit im Internet nach!","Ich schaue den Zugfahrplan nach."}	2	13	\N	\N	\N
4555	neffe	{nephew}	{"Mein Neffe ist 10 Jahre alt.","Der Neffe spielt Fußball."}	2	13	1	\N	\N
4556	nervös	{nervous}	{"Ich bin vor der Prüfung nervös.","Warum bist du so nervös?"}	2	13	\N	\N	\N
4557	newsletter	{newsletter}	{"Abonniere unseren Newsletter!","Der Newsletter kommt jeden Montag."}	2	13	\N	\N	\N
4558	oben	{"at the top"}	{"Das Bild hängt oben an der Wand.","Die Antwort steht oben auf der Seite."}	2	13	\N	\N	\N
4559	politik	{politics}	{"Politik interessiert mich nicht.","Wir diskutieren über Politik."}	2	13	2	\N	\N
4560	prima	{great}	{"Das Essen schmeckt prima!","Prima, dass du kommen kannst!"}	2	13	\N	\N	\N
4520	benutzername	{"user name"}	{"Gib deinen Benutzername ein.","Mein Benutzername ist leicht zu merken."}	2	13	1	\N	\N
4521	bestellen	{"to order"}	{"Ich bestelle Pizza zum Abendessen.","Hast du das Buch online bestellt?"}	2	13	\N	\N	\N
4522	chatten	{"to chat"}	{"Wir chatten jeden Abend online.","Kannst du mit mir chatten?"}	2	13	\N	\N	\N
4523	datei	{file}	{"Speichere die Datei auf dem Computer.","Die Datei ist zu groß für eine E-Mail."}	2	13	2	\N	Dateien
4524	dich	{you}	{"Ich sehe dich im Park.","Kennst du dich hier aus?"}	2	13	\N	\N	\N
4566	reservieren	{"to book"}	{"Ich reserviere einen Tisch im Restaurant.","Hast du das Hotelzimmer reserviert?"}	2	13	\N	\N	\N
4567	reservierung	{booking}	{"Die Reservierung ist bestätigt.","Hast du eine Reservierung?"}	2	13	2	\N	\N
4565	reihenfolge	{order}	{"Die Reihenfolge ist wichtig.","Merke dir die Reihenfolge der Zahlen."}	2	13	2	\N	\N
4564	regenschirm	{umbrella}	{"Nimm den Regenschirm mit!","Mein Regenschirm ist blau."}	2	13	1	\N	\N
4568	rolle	{role}	{"Sie spielt die Hauptrolle im Film.","Welche Rolle hast du im Projekt?"}	2	13	2	\N	Rollen
4569	sinken	{"to decrease"}	{"Die Temperatur sinkt nachts.","Die Preise sinken im Sommer."}	2	13	\N	\N	\N
4570	smartphone	{smartphone}	{"Mein Smartphone ist kaputt.","Lade dein Smartphone auf!"}	2	13	3	\N	\N
4571	speichern	{"to save"}	{"Speichere das Dokument regelmäßig!","Ich habe das Foto gespeichert."}	2	13	\N	\N	\N
4572	spielzeug	{toy}	{"Das Kind spielt mit dem Spielzeug.","Wo ist das Spielzeug?"}	2	13	3	\N	\N
4573	starten	{"to begin"}	{"Das Konzert startet um 20 Uhr.","Starte den Computer neu!"}	2	13	\N	\N	\N
4574	startseite	{homepage}	{"Die Startseite der Website ist übersichtlich.","Gehe zurück zur Startseite!"}	2	13	2	\N	\N
4575	steigen	{"to increase"}	{"Die Preise steigen jedes Jahr.","Die Temperatur steigt langsam."}	2	13	\N	\N	\N
4576	straßenfest	{"street party"}	{"Das Straßenfest ist sehr laut.","Besuchen wir das Straßenfest am Samstag!"}	2	13	3	\N	\N
4577	symbol	{symbol}	{"Das Herz ist ein Symbol für Liebe.","Klicke auf das Symbol!"}	2	13	3	\N	Symbole
4578	tauschen	{"to swap"}	{"Wir tauschen unsere Bücher.","Möchtest du die Plätze tauschen?"}	2	13	\N	\N	\N
4579	temperatur	{temperature}	{"Die Temperatur ist heute hoch.","Misst du die Temperatur im Zimmer?"}	2	13	2	\N	Temperaturen
4580	theater	{theatre}	{"Wir gehen heute ins Theater.","Das Theaterstück war langweilig."}	2	13	3	\N	\N
4581	treffpunkt	{venue}	{"Der Treffpunkt ist am Bahnhof.","Wo ist unser Treffpunkt?"}	2	13	1	\N	\N
4583	verabredung	{"meet up"}	{"Ich habe eine Verabredung mit Freunden.","Unsere Verabredung ist um 15 Uhr."}	2	13	2	\N	Verabredungen
4584	veranstaltung	{event}	{"Die Veranstaltung beginnt um 19 Uhr.","Welche Veranstaltung besuchst du?"}	2	13	2	\N	Veranstaltungen
4585	veranstaltungstipp	{"event tip"}	{"Hast du einen Veranstaltungstipp?","Der Veranstaltungstipp war super!"}	2	13	1	\N	Veranstaltungstipps
4586	vorschlag	{suggestion}	{"Dein Vorschlag ist gut.","Machen wir einen Vorschlag!"}	2	13	1	\N	Vorschläge
4587	welt	{world}	{"Die Welt ist groß und schön.","Reisen öffnet die Welt."}	2	13	2	\N	\N
4588	wettervorhersage	{"weather forecast"}	{"Die Wettervorhersage sagt Regen voraus.","Schau die Wettervorhersage im Fernsehen!"}	2	13	2	\N	\N
4589	wirtschaft	{economy}	{"Die Wirtschaft des Landes wächst.","Wir lernen über die globale Wirtschaft."}	2	13	2	\N	\N
4590	würstchen	{sausage}	{"Ich esse ein Würstchen mit Brot.","Die Würstchen sind heiß."}	2	13	3	\N	\N
4591	zeitweise	{occasionally}	{"Es regnet zeitweise.","Ich arbeite zeitweise von zu Hause."}	2	13	\N	\N	\N
4592	zuhören	{"to listen"}	{"Hör mir bitte zu!","Ich höre gerne Musik zu."}	2	13	\N	\N	\N
4593	zuschauen	{"to watch"}	{"Schau dem Spiel zu!","Ich schaue den Kindern beim Spielen zu."}	2	13	\N	\N	\N
4594	abfahren	{"to depart"}	{"Der Zug fährt um 9 Uhr ab.","Wann fährt der nächste Bus ab?"}	2	14	\N	\N	\N
4595	abfahrt	{departure}	{"Die Abfahrt des Zuges ist um 15:30 Uhr.","Überprüfe die Abfahrt auf dem Bildschirm."}	2	14	2	\N	\N
4596	ankommen	{"to arrive"}	{"Wir kommen pünktlich am Bahnhof an.","Wann kommt der Flug aus Berlin an?"}	2	14	\N	\N	\N
4597	ankunft	{arrival}	{"Die Ankunft des Zuges ist um 18:45 Uhr.","Die Ankunft im Hotel war spät."}	2	14	1	\N	Ankünfte
4598	anschluss	{connection}	{"Wir verpassen den Anschlusszug!","Der Anschluss an das Internet ist langsam."}	2	14	1	\N	\N
4601	aussteigen	{"to get off"}	{"Wir steigen an der nächsten Haltestelle aus.","Bitte vorsichtig aussteigen!"}	2	14	\N	\N	\N
4600	ausfallen	{"to be cancelled"}	{"Der Zug fällt heute aus.","Das Konzert ist wegen Regen ausgefallen."}	2	14	\N	\N	\N
6433	schein	{"bank note"}	{"Ein 50-Euro-Schein liegt auf dem Tisch.","Haben Sie kleinere Scheine?"}	2	23	1	\N	Scheine
4562	radtour	{"cycling tour"}	{"Am Wochenende machen wir eine Radtour.","Die Radtour war anstrengend."}	2	13	2	\N	Radtouren
4563	regen	{rain}	{"Heute gibt es starken Regen.","Ohne Regen wird der Garten trocken."}	2	13	1	\N	\N
4611	deshalb	{hence}	{"Der Zug ist voll, deshalb stehen wir.","Es regnet, deshalb bleiben wir zu Hause."}	2	14	\N	\N	\N
4603	automat	{"vending machine"}	{"Der Automat gibt kein Wechselgeld.","Kauf dir einen Kaffee am Automaten."}	2	14	1	\N	\N
4626	hinfahrt	{"journey there"}	{"Die Hinfahrt dauert zwei Stunden.","Die Hinfahrt war sehr angenehm."}	2	14	2	\N	Hinfahrten
4612	drehen	{"to turn"}	{"Drehen Sie den Schlüssel nach rechts.","Der Film dreht sich um Abenteuer."}	2	14	\N	\N	\N
4609	dauer	{duration}	{"Die Dauer der Fahrt beträgt zwei Stunden.","Wie lange ist die Dauer des Films?"}	2	14	2	\N	\N
4604	ausblenden	{"to fade out"}	{"Bitte blenden Sie das Licht aus.","Kannst du den Text ausblenden?"}	2	14	\N	\N	\N
4610	defekt	{defective}	{"Der Automat ist defekt.","Mein Handy-Akku ist defekt."}	2	14	\N	\N	\N
4613	drüben	{"over there"}	{"Das Café ist drüben an der Ecke.","Unser Sitzplatz ist drüben."}	2	14	\N	\N	\N
4614	einfahrt	{entry}	{"Die Einfahrt ist für Lieferwagen verboten.","Die Einfahrt zum Bahnhof ist blockiert."}	2	14	2	\N	Einfahrten
4615	einsteigen	{"to board"}	{"Bitte erst einsteigen, dann Türen schließen.","Wir steigen in den Bus ein."}	2	14	\N	\N	\N
4616	erhalten	{"to receive"}	{"Ich habe eine Bestätigung erhalten.","Sie erhielt eine Fahrkarte per E-Mail."}	2	14	\N	\N	\N
4617	erreichen	{"to reach"}	{"Wir erreichen den Bahnhof pünktlich.","Kannst du mich unter dieser Nummer erreichen?"}	2	14	\N	\N	\N
4618	fahrkartenschalter	{"ticket office"}	{"Der Fahrkartenschalter schließt um 20 Uhr.","Kaufen Sie die Karte am Fahrkartenschalter."}	2	14	1	\N	\N
4619	fahrplan	{schedule}	{"Der Fahrplan hängt am Brett.","Prüfe den Fahrplan für Verspätungen."}	2	14	1	\N	Fahrpläne
4620	grund	{ground}	{"Der Zug steht ohne Grund still.","Aus Sicherheitsgründen bleibt die Tür zu."}	2	14	1	\N	\N
4605	bahnfahren	{"rail travel"}	{"Bahnfahren ist umweltfreundlich.","Ich mag Bahnfahren im Sommer."}	2	14	3	\N	\N
4621	fernbus	{"long-distance bus"}	{"Der Fernbus nach München ist günstig.","Fernbusse haben oft Wi-Fi."}	2	14	1	\N	\N
4622	fliegen	{"to fly"}	{"Wir fliegen morgen nach Spanien.","Vögel fliegen über das Feld."}	2	14	\N	\N	\N
4623	flugzeug	{plane}	{"Das Flugzeug startet in 10 Minuten.","Flugzeuge sind schneller als Züge."}	2	14	3	\N	Flugzeuge
4624	halt	{stop}	{"Der Bus macht keinen Halt hier.","Der nächste Halt ist am Marktplatz."}	2	14	1	\N	\N
4625	hin	{there}	{"Fährst du hin oder zurück?","Gehen wir hin oder bleiben wir hier?"}	2	14	\N	\N	\N
4627	mitarbeiter/in	{employee}	{"Die Mitarbeiter helfen gerne.","Fragen Sie einen Mitarbeiter am Schalter!"}	2	14	5	\N	\N
4628	mitnehmen	{"to take with"}	{"Nimm bitte den Regenschirm mit!","Kann ich das Buch mitnehmen?"}	2	14	\N	\N	\N
4629	nah	{close}	{"Der Bahnhof ist nah am Hotel.","Ist der Supermarkt nah oder weit?"}	2	14	\N	\N	\N
4630	nämlich	{namely}	{"Ich komme später, nämlich um 20 Uhr.","Er ist nicht hier, nämlich im Büro."}	2	14	\N	\N	\N
4631	nummer	{number}	{"Die Nummer des Busses ist 45.","Schreib deine Telefonnummer auf!"}	2	14	2	\N	\N
4632	option	{option}	{"Wir haben zwei Optionen für die Reise.","Welche Option bevorzugst du?"}	2	14	2	\N	\N
4633	passieren	{"to happen"}	{"Was ist hier passiert?","So etwas passiert selten."}	2	14	\N	\N	\N
4634	pech	{"bad luck"}	{"Heute habe ich echt Pech!","Pech im Spiel, Glück in der Liebe."}	2	14	3	\N	\N
4635	planmäßig	{"on schedule"}	{"Der Zug kommt planmäßig um 14 Uhr an.","Alles läuft planmäßig."}	2	14	\N	\N	\N
4636	preiswert	{inexpensive}	{"Das Hotel ist preiswert und sauber.","Suche preiswertes Essen in der Stadt."}	2	14	\N	\N	\N
6434	schieben	{"to shut"}	{"Schieben Sie die Tür zu.","Er schob den Riegel vor."}	2	23	\N	\N	\N
4602	autofahren	{"to drive a car"}	{"Autofahren macht mir Spaß.","Sie lernt Autofahren in der Fahrschule."}	2	14	3	\N	\N
4606	bahnsteig	{platform}	{"Der Zug steht am Bahnsteig 5.","Wir warten auf dem Bahnsteig."}	2	14	1	\N	\N
4607	bitten	{"to ask"}	{"Darf ich dich um Hilfe bitten?","Sie bittet um eine Fahrkarte."}	2	14	\N	\N	\N
4608	buchen	{"to book"}	{"Ich buche eine Zugfahrkarte online.","Wir haben ein Hotelzimmer gebucht."}	2	14	\N	\N	\N
6435	schlachten	{"to rob"}	{"Die Bank wurde schlachtet ausgeraubt.","Schlachten ist eine Straftat."}	2	23	\N	\N	\N
6436	schornsteinfeger/in	{"chimney sweep"}	{"Der Schornsteinfeger prüft die Heizung.","Die Schornsteinfegerin arbeitet selbstständig."}	2	23	5	\N	\N
6437	sparkonto	{"savings account"}	{"Eröffnen Sie ein Sparkonto für Zinsen.","Das Sparkonto ist sicher."}	2	23	3	\N	Sparkonten
4643	schwarzfahren	{"to fare-dodge"}	{"Schwarzfahren ist illegal.","Er wurde beim Schwarzfahren erwischt."}	2	14	\N	\N	\N
4644	schwierig	{difficult}	{"Die Prüfung war sehr schwierig.","Es ist schwierig, den Zug zu finden."}	2	14	\N	\N	\N
4645	senior/in	{senior}	{"Senioren fahren oft kostenlos mit dem Bus.","Die Seniorin braucht einen Sitzplatz."}	2	14	5	\N	\N
4646	serviceschalter	{"service counter"}	{"Fragen Sie am Serviceschalter nach Hilfe!","Der Serviceschalter ist geschlossen."}	2	14	1	\N	\N
4647	sondern	{but}	{"Nicht heute, sondern morgen.","Er ist nicht müde, sondern hungrig."}	2	14	\N	\N	\N
4648	sparen	{"to save"}	{"Wir sparen Geld für die Reise.","Spare Energie, wo du kannst!"}	2	14	\N	\N	\N
4649	station	{station}	{"Die nächste Station ist der Hauptbahnhof.","An welcher Station steigen wir aus?"}	2	14	2	\N	\N
4650	störung	{disruption}	{"Es gibt eine Störung auf der Strecke.","Die Störung wird bald behoben."}	2	14	2	\N	Störungen
4651	strafe	{penalty}	{"Schwarzfahren führt zu einer Strafe.","Die Strafe beträgt 60 Euro."}	2	14	2	\N	Strafen
4652	strecke	{route}	{"Die Strecke nach Hamburg ist lang.","Die Zugstrecke ist gesperrt."}	2	14	2	\N	Strecken
4653	umsteigen	{"to change trains"}	{"Wir müssen in Frankfurt umsteigen.","Wo steige ich um?"}	2	14	\N	\N	\N
4654	umwelt	{environment}	{"Bahnfahren schont die Umwelt.","Schütze die Umwelt!"}	2	14	2	\N	\N
4655	unterwegs	{"en route"}	{"Wir sind gerade unterwegs zum Bahnhof.","Unterwegs habe ich einen Freund getroffen."}	2	14	\N	\N	\N
4656	verbindung	{connection}	{"Die Zugverbindung ist sehr gut.","Gibt es eine direkte Verbindung?"}	2	14	2	\N	Verbindungen
4657	verehrt, verehrte	{“dear”}	{"Verehrte Gäste, herzlich willkommen!","Sehr verehrte Damen und Herren..."}	2	14	\N	\N	\N
4658	verpassen	{"to miss"}	{"Wir verpassen den Zug!","Ich habe den Anruf verpasst."}	2	14	\N	\N	\N
4659	verschlafen	{"to oversleep"}	{"Ich habe verschlafen und den Bus verpasst.","Verschiebst du nie?"}	2	14	\N	\N	\N
4660	verspätet	{late}	{"Der Zug ist 20 Minuten verspätet.","Warum bist du verspätet?"}	2	14	\N	\N	\N
4661	verspätung	{delay}	{"Die Verspätung beträgt eine Stunde.","Entschuldigung für die Verspätung!"}	2	14	2	\N	Verspätungen
4662	vorsicht	{caution}	{"Vorsicht bei der Abfahrt des Zuges!","Vorsicht, die Tür schließt automatisch!"}	2	14	2	\N	\N
4663	wenig	{little}	{"Es gibt wenig Platz im Bus.","Ich habe wenig Zeit."}	2	14	\N	\N	\N
4664	wohl	{probably}	{"Der Zug ist wohl schon abgefahren.","Du bist wohl müde?"}	2	14	\N	\N	\N
4666	zoo	{zoo}	{"Der Zoo hat viele Tiere.","Besuchen wir den Zoo am Wochenende!"}	2	14	1	\N	\N
4667	ablesen	{"to read from"}	{"Ich lese den Zählerstand ab.","Der Techniker liest die Daten vom Gerät ab."}	2	15	\N	\N	\N
4668	ablesung	{reading}	{"Die Ablesung des Stromzählers erfolgt monatlich.","Die Ablesung war fehlerhaft."}	2	15	2	\N	\N
4669	abstellen	{"to park","to put down"}	{"Stell das Fahrrad im Hof ab!","Wir stellen die Möbel vorübergehend ab."}	2	15	\N	\N	\N
4670	afrikanisch	{African}	{"Die afrikanische Kunst ist sehr farbenfroh.","Wir kochen ein afrikanisches Gericht."}	2	15	\N	\N	\N
4671	altglas	{"waste glass"}	{"Wir werfen Altglas in den Glascontainer.","Altglas wird recycelt."}	2	15	3	\N	\N
4672	aufschließen	{"to unlock"}	{"Kannst du die Tür bitte aufschließen?","Ich schließe den Schrank mit dem Schlüssel auf."}	2	15	\N	\N	\N
4673	ausführen	{"to execute"}	{"Der Hund muss täglich ausgeführt werden.","Wir führen den Plan wie besprochen aus."}	2	15	\N	\N	\N
4674	ausgeben	{"to spend"}	{"Ich gebe zu viel Geld für Möbel aus.","Gib den Schlüssel beim Nachbarn aus!"}	2	15	\N	\N	\N
4675	ausziehen	{"to move out"}	{"Er zieht nächsten Monat aus der Wohnung aus.","Wann ziehst du aus?"}	2	15	\N	\N	\N
4676	beachten	{"to consider"}	{"Beachte die Hausordnung!","Wir beachten die Hinweise des Vermieters."}	2	15	\N	\N	\N
4638	reiseziel	{"travel destination"}	{"Unser Reiseziel ist die Nordsee.","Was ist dein Traum-Reiseziel?"}	2	14	3	\N	\N
4639	richtung	{direction}	{"Der Bus fährt in Richtung Zentrum.","In welche Richtung gehen wir?"}	2	14	2	\N	Richtungen
4640	rückfahrt	{"return journey"}	{"Die Rückfahrt war sehr entspannt.","Wann beginnt die Rückfahrt?"}	2	14	2	\N	Rückfahrten
4641	schaffner/in	{conductor}	{"Der Schaffner kontrolliert die Tickets.","Fragen Sie den Schaffner nach der Haltestelle!"}	2	14	5	\N	\N
4642	schild	{sign}	{"Das Schild zeigt den Weg zum Bahnhof.","Lies das Schild bitte vor!"}	2	14	3	\N	Schilder
4683	biomüll	{biowaste}	{"Biomüll kommt in die braune Tonne.","Der Biomüll riecht nicht gut."}	2	15	1	\N	\N
4684	biotonne	{"biowaste container"}	{"Stell die Biotonne bitte raus!","Die Biotonne ist voll."}	2	15	2	\N	\N
4685	brett	{board}	{"Das Brett ist kaputt.","Häng das Brett an die Wand!"}	2	15	3	\N	\N
4686	briefkasten	{mailbox}	{"Der Briefkasten ist am Eingang.","Wirft du die Post in den Briefkasten?"}	2	15	1	\N	Briefkästen
4687	darum	{therefore}	{"Es regnet, darum bleiben wir zu Hause.","Ich bin müde, darum gehe ich früh ins Bett."}	2	15	\N	\N	\N
4688	dass	{that}	{"Ich hoffe, dass du kommst.","Er sagt, dass er krank ist."}	2	15	\N	\N	\N
4689	ecke	{corner}	{"Das Sofa steht in der Ecke.","An der Ecke gibt es einen Supermarkt."}	2	15	2	\N	\N
4690	einbauküche	{"built-in kitchen"}	{"Die Wohnung hat eine moderne Einbauküche.","Eine Einbauküche ist praktisch."}	2	15	2	\N	\N
4691	einrichten	{"to furnish"}	{"Wir richten die neue Wohnung ein.","Kannst du das Zimmer einrichten?"}	2	15	\N	\N	\N
4692	einweihungsparty	{"housewarming party"}	{"Wir feiern eine Einweihungsparty am Samstag.","Lädst du Nachbarn zur Einweihungsparty ein?"}	2	15	2	\N	\N
4693	einwurfzeit	{"time slot for putting out rubbish"}	{"Die Einwurfzeit für Müll ist morgens.","Beachte die Einwurfzeiten der Tonnen!"}	2	15	2	\N	Einwurfzeiten
4694	einziehen	{"to move in"}	{"Wann ziehst du in die neue Wohnung ein?","Sie zieht nächste Woche ein."}	2	15	\N	\N	\N
4695	einzug	{"move in"}	{"Der Einzug war stressig.","Wir feiern den Einzug mit Freunden."}	2	15	1	\N	\N
4696	entsorgen	{"to dispose of"}	{"Wie entsorge ich Elektroschrott?","Der Müll wird jeden Dienstag entsorgt."}	2	15	\N	\N	\N
4697	erfolgen	{"to take place"}	{"Die Reparatur erfolgt nächste Woche.","Die Zahlung erfolgt per Überweisung."}	2	15	\N	\N	\N
4698	fahrradständer	{"bicycle stand"}	{"Stell das Fahrrad am Fahrradständer ab!","Der Fahrradständer ist voll."}	2	15	1	\N	\N
4699	fernwärme	{"remote heating"}	{"Unsere Wohnung hat Fernwärme.","Fernwärme ist umweltfreundlich."}	2	15	2	\N	\N
4700	gas	{gas}	{"Die Heizung läuft mit Gas.","Gas ist teurer geworden."}	2	15	3	\N	\N
4701	gassi gehen	{"to walk the dog"}	{"Ich gehe mit dem Hund Gassi.","Gehst du heute Abend Gassi?"}	2	15	\N	\N	\N
4702	gehören	{"to belong"}	{"Das Haus gehört meinem Onkel.","Wem gehört dieser Schlüssel?"}	2	15	\N	\N	\N
4703	gesondert	{separate}	{"Bitte entsorge Glas gesondert.","Die Dokumente werden gesondert aufbewahrt."}	2	15	\N	\N	\N
4704	glascontainer	{"bottle bank"}	{"Wir werfen Altglas in den Glascontainer.","Der Glascontainer ist voll."}	2	15	1	\N	\N
4705	hausbewohner/in	{"house resident"}	{"Alle Hausbewohner sind freundlich.","Der Hausbewohner hilft beim Umzug."}	2	15	5	\N	\N
4706	hausmeister/in	{caretaker}	{"Der Hausmeister repariert die Tür.","Fragen Sie den Hausmeister nach dem Schlüssel!"}	2	15	5	\N	\N
4707	hausordnung	{"house rules"}	{"Die Hausordnung steht im Treppenhaus.","Beachte die Hausordnung!"}	2	15	2	\N	\N
4708	hausregel	{"house rule"}	{"Laut Hausregel ist Lärm nach 22 Uhr verboten.","Welche Hausregeln gibt es hier?"}	2	15	2	\N	\N
4709	hausreinigung	{"house cleaning"}	{"Die Hausreinigung findet wöchentlich statt.","Wer macht die Hausreinigung?"}	2	15	2	\N	\N
4711	herzlich	{warm}	{"Herzlich willkommen in unserer neuen Wohnung!","Die Nachbarn sind herzlich."}	2	15	\N	\N	\N
4712	hoch	{high}	{"Die Miete ist sehr hoch.","Das Regal ist zu hoch für mich."}	2	15	\N	\N	\N
4713	hof	{yard}	{"Die Kinder spielen im Hof.","Unser Hof hat einen Garten."}	2	15	1	\N	\N
4714	hoffen	{"to hope"}	{"Ich hoffe, die Wohnung gefällt dir.","Wir hoffen auf schnellen Einzug."}	2	15	\N	\N	\N
4715	jemand	{someone}	{"Ist jemand zu Hause?","Kann jemand helfen?"}	2	15	\N	\N	\N
4716	kellerzugang	{"cellar entrance"}	{"Der Kellerzugang ist neben der Treppe.","Wo ist der Kellerzugang?"}	2	15	1	\N	\N
4678	beinbruch	{"leg fracture"}	{"Nach dem Unfall hatte er einen Beinbruch.","Ein Beinbruch braucht Zeit zum Heilen."}	2	15	1	\N	\N
4679	berufstätig	{employed}	{"Meine Mutter ist berufstätig.","Berufstätige Eltern brauchen oft Hilfe."}	2	15	\N	\N	\N
4680	beschwerde	{complaint}	{"Ich habe eine Beschwerde beim Vermieter eingereicht.","Die Beschwerde wurde bearbeitet."}	2	15	2	\N	Beschwerden
4681	besichtigen	{"to visit"}	{"Wir besichtigen die neue Wohnung.","Können wir das Haus morgen besichtigen?"}	2	15	\N	\N	\N
4682	bezirk	{district}	{"Wir wohnen im Bezirk Mitte.","Dieser Bezirk ist sehr ruhig."}	2	15	1	\N	\N
4723	lieferant/in	{supplier}	{"Der Lieferant bringt das Paket.","Die Lieferantin kommt um 10 Uhr."}	2	15	5	\N	\N
4724	liefern	{"to supply"}	{"Der Supermarkt liefert Lebensmittel.","Wann liefern Sie die Möbel?"}	2	15	\N	\N	\N
4725	makler/in	{broker}	{"Der Makler zeigt uns die Wohnung.","Die Maklerin ist sehr freundlich."}	2	15	5	\N	\N
4726	mieter/in	{tenant}	{"Der Mieter zahlt pünktlich die Miete.","Die Mieterin hat einen Hund."}	2	15	5	\N	\N
4727	mitbewohner/in	{roommate}	{"Mein Mitbewohner kocht gerne.","Die Mitbewohnerin ist sehr ordentlich."}	2	15	5	\N	\N
4728	mitteilung	{notification}	{"An der Tür hängt eine Mitteilung.","Die Mitteilung ist wichtig."}	2	15	2	\N	\N
4729	müllabfuhr	{"garbage disposal"}	{"Die Müllabfuhr kommt jeden Dienstag.","Warum ist die Müllabfuhr heute nicht gekommen?"}	2	15	2	\N	\N
4730	nachbarschaft	{neighbourhood}	{"Die Nachbarschaft ist sehr ruhig.","In unserer Nachbarschaft gibt es einen Park."}	2	15	2	\N	\N
4731	nachricht	{message}	{"Hast du die Nachricht vom Vermieter gelesen?","Ich schreibe eine Nachricht an den Hausmeister."}	2	15	2	\N	\N
4732	nachtisch	{dessert}	{"Zum Nachtisch gibt es Eis.","Der Nachtisch war köstlich."}	2	15	1	\N	\N
4733	nähe	{proximity}	{"Die Wohnung liegt in der Nähe des Bahnhofs.","In der Nähe gibt es einen Supermarkt."}	2	15	2	\N	\N
4734	ordnungsgemäß	{proper}	{"Entsorge den Müll ordnungsgemäß!","Die Reparatur erfolgte ordnungsgemäß."}	2	15	\N	\N	\N
4735	privat	{private}	{"Das ist ein privater Parkplatz.","Der Garten ist privat."}	2	15	\N	\N	\N
4736	reichlich	{abundant}	{"Es gibt reichlich Platz im Keller.","Wir haben reichlich Zeit."}	2	15	\N	\N	\N
4737	restmüll	{"residual waste"}	{"Restmüll kommt in die schwarze Tonne.","Die Restmülltonne ist voll."}	2	15	1	\N	\N
4738	schließlich	{finally}	{"Schließlich haben wir die Wohnung gefunden.","Schließlich war alles erledigt."}	2	15	\N	\N	\N
4739	schonen	{"to treat with care"}	{"Schone die Möbel beim Umzug!","Wir schonen die Umwelt."}	2	15	\N	\N	\N
4740	setzen	{"to sit"}	{"Setz dich aufs Sofa!","Ich setze mich an den Tisch."}	2	15	\N	\N	\N
4741	sogar	{even}	{"Sogar der Vermieter war überrascht.","Es war sogar billiger als erwartet."}	2	15	\N	\N	\N
4742	sorgen	{"to care"}	{"Ich sorge für die Pflanzen.","Wer sorgt für den Hund?"}	2	15	\N	\N	\N
4743	sorgfältig	{thoroughly}	{"Arbeite sorgfältig!","Die Reinigung war sehr sorgfältig."}	2	15	\N	\N	\N
4745	spiegel	{mirror}	{"Der Spiegel hängt im Badezimmer.","Kannst du den Spiegel aufhängen?"}	2	15	1	\N	\N
4746	stellplatz	{"parking space"}	{"Die Wohnung hat einen Stellplatz für das Auto.","Der Stellplatz ist vermietet."}	2	15	1	\N	\N
4747	tiefgarage	{"underground garage"}	{"Die Tiefgarage ist sicher.","Unser Auto steht in der Tiefgarage."}	2	15	2	\N	\N
4748	tonne	{barrel}	{"Die Mülltonne steht draußen.","Die Tonne ist schwer."}	2	15	2	\N	\N
4749	trennen	{"to separate"}	{"Trenne den Müll nach Material!","Wir trennen Papier und Plastik."}	2	15	\N	\N	\N
4750	treppe	{stairs}	{"Die Treppe ist steil.","Wir gehen die Treppe hoch."}	2	15	2	\N	\N
4751	treppenhaus	{stairway}	{"Das Treppenhaus muss sauber bleiben.","Im Treppenhaus hängen Informationen."}	2	15	3	\N	\N
4752	übernehmen	{"to assume"}	{"Ich übernehme die Verantwortung.","Wer übernimmt die Kosten?"}	2	15	\N	\N	\N
4753	umziehen	{"to move"}	{"Wir ziehen nächsten Monat um.","Wann ziehst du um?"}	2	15	\N	\N	\N
4754	umzug	{move}	{"Der Umzug war anstrengend.","Wir planen den Umzug sorgfältig."}	2	15	1	\N	\N
4755	umzugskarton	{"moving box"}	{"Die Umzugskartons sind schwer.","Wir brauchen mehr Umzugskartons."}	2	15	1	\N	Umzugskartons
4756	vase	{vase}	{"Die Vase steht auf dem Tisch.","Die Vase ist aus Glas."}	2	15	2	\N	Vasen
4757	verbraucherzähler	{"consumption meter"}	{"Der Verbraucherzähler zeigt den Stromverbrauch.","Lies den Verbraucherzähler ab!"}	2	15	1	\N	\N
4718	kleinmöbel	{"small pieces of furniture"}	{"Kleinmöbel machen die Wohnung gemütlich.","Wir kaufen neue Kleinmöbel."}	2	15	2	\N	Kleinmöbel
4719	kommode	{dresser}	{"Die Kommode steht im Schlafzimmer.","In der Kommode liegen die Socken."}	2	15	2	\N	\N
4720	kündigen	{"to terminate"}	{"Ich kündige den Mietvertrag.","Der Mieter hat gekündigt."}	2	15	\N	\N	\N
4721	legen	{"to lay"}	{"Leg die Schlüssel auf den Tisch!","Ich lege die Decke aufs Sofa."}	2	15	\N	\N	\N
4722	leidtun	{"to be sorry"}	{"Es tut mir leid, ich habe dich geweckt.","Das tut mir wirklich leid."}	2	15	\N	\N	\N
4764	weiterhin	{still}	{"Weiterhin viel Erfolg in der neuen Wohnung!","Wir bleiben weiterhin in Kontakt."}	2	15	\N	\N	\N
4765	wohngemeinschaft	{"flat share"}	{"Ich lebe in einer Wohngemeinschaft.","Die Wohngemeinschaft sucht einen neuen Mitbewohner."}	2	15	2	\N	\N
4766	wohnungsbesichtigung	{"flat viewing"}	{"Die Wohnungsbesichtigung ist um 15 Uhr.","Wie war die Wohnungsbesichtigung?"}	2	15	2	\N	\N
4767	wunsch	{wish}	{"Hast du einen Wunsch für die neue Wohnung?","Mein Wunsch ist ein Balkon."}	2	15	1	\N	Wünsche
4768	zähler	{meter}	{"Der Zähler muss monatlich abgelesen werden.","Wo ist der Stromzähler?"}	2	15	1	\N	\N
4769	zugang	{entry}	{"Der Zugang zur Wohnung ist gesichert.","Hast du einen Zugang zum Keller?"}	2	15	1	\N	Zugänge
4770	zuletzt	{recently}	{"Zuletzt haben wir die Möbel aufgebaut.","Wann warst du zuletzt im Supermarkt?"}	2	15	\N	\N	\N
4771	zuzüglich	{plus}	{"Die Miete beträgt 800 Euro zuzüglich Nebenkosten.","Der Preis ist zuzüglich Versandkosten."}	2	15	\N	\N	\N
4772	abgeben	{"to submit"}	{"Ich gebe das Formular beim Amt ab.","Kannst du den Müll abgeben?"}	2	16	\N	\N	\N
4773	ablehnen	{"to refuse"}	{"Der Antrag wurde abgelehnt.","Sie lehnt das Angebot ab."}	2	16	\N	\N	\N
4774	abmelden	{"to deregister"}	{"Ich melde mich beim Einwohnermeldeamt ab.","Vergiss nicht, den Hund abzumelden!"}	2	16	\N	\N	\N
4775	abmeldung	{deregistration}	{"Die Abmeldung dauert nur fünf Minuten.","Wo ist das Formular für die Abmeldung?"}	2	16	2	\N	\N
4776	ähnlich	{similar}	{"Die Unterschriften sehen ähnlich aus.","Das Problem ist ähnlich wie letztes Jahr."}	2	16	\N	\N	\N
4777	amt	{office}	{"Das Amt öffnet um 8 Uhr.","Ich gehe heute zum Amt."}	2	16	3	\N	\N
4778	amtsdeutsch	{"official German"}	{"Amtsdeutsch ist manchmal schwer zu verstehen.","Der Brief ist in Amtsdeutsch geschrieben."}	2	16	3	\N	\N
4779	ändern	{"to change"}	{"Ich ändere meine Adresse beim Amt.","Kannst du den Termin ändern?"}	2	16	\N	\N	\N
4780	angehörige	{relative}	{"Angehörige müssen das Formular unterschreiben.","Sind Angehörige im Ausland?"}	2	16	5	\N	Angehörigen
4781	ankreuzen	{"to mark with a cross"}	{"Kreuze das richtige Feld an!","Ich habe die Antwort angekreuzt."}	2	16	\N	\N	\N
4782	anschrift	{address}	{"Gib bitte deine aktuelle Anschrift an!","Die Anschrift ist unleserlich."}	2	16	2	\N	\N
4783	antrag	{application}	{"Fülle den Antrag sorgfältig aus!","Der Antrag liegt auf dem Tisch."}	2	16	1	\N	Anträge
4784	antragsteller/in	{applicant}	{"Der Antragsteller wartet auf eine Antwort.","Die Antragstellerin hat alle Unterlagen eingereicht."}	2	16	5	\N	\N
4785	arbeitsagentur	{"employment agency"}	{"Ich gehe zur Arbeitsagentur, um einen Job zu suchen.","Die Arbeitsagentur hilft bei der Stellensuche."}	2	16	2	\N	\N
4786	arbeitserlaubnis	{"work permit"}	{"Ich beantrage eine Arbeitserlaubnis.","Ohne Arbeitserlaubnis darf man nicht arbeiten."}	2	16	2	\N	\N
4787	arbeitslosengeld	{"unemployment benefit"}	{"Er bezieht Arbeitslosengeld.","Das Arbeitslosengeld wird monatlich überwiesen."}	2	16	3	\N	\N
4788	arbeitsplatz	{workplace}	{"Mein Arbeitsplatz ist in der Innenstadt.","Der Arbeitsplatz muss sicher sein."}	2	16	1	\N	Arbeitsplätze
4789	arbeitsvermittlung	{"employment service"}	{"Die Arbeitsvermittlung findet passende Jobs.","Ich bin bei der Arbeitsvermittlung registriert."}	2	16	2	\N	\N
4790	aufenthalt	{stay}	{"Mein Aufenthalt in Deutschland ist befristet.","Der Aufenthalt im Ausland war spannend."}	2	16	1	\N	\N
4791	aufenthaltserlaubnis	{"residence permit"}	{"Ich verlängere meine Aufenthaltserlaubnis.","Die Aufenthaltserlaubnis ist abgelaufen."}	2	16	2	\N	\N
4792	aufrufen	{"to call up"}	{"Bitte rufen Sie die Website auf!","Die Behörde ruft Ihre Daten auf."}	2	16	\N	\N	\N
4793	ausbildungsplatz	{"training place"}	{"Ich suche einen Ausbildungsplatz als Mechaniker.","Der Ausbildungsplatz ist sehr gefragt."}	2	16	1	\N	\N
4795	ausländerbehörde	{"immigration authorities"}	{"Die Ausländerbehörde bearbeitet meinen Antrag.","Wo ist die Ausländerbehörde?"}	2	16	2	\N	\N
4759	vermieter/in	{landlord}	{"Der Vermieter repariert die Heizung.","Die Vermieterin ist sehr nett."}	2	15	5	\N	\N
4760	vermieten	{"to let"}	{"Wir vermieten die Wohnung ab nächsten Monat.","Vermietest du das Zimmer?"}	2	15	\N	\N	\N
4761	vorhanden	{available}	{"Ist ein Parkplatz vorhanden?","Die Dokumente sind vorhanden."}	2	15	\N	\N	\N
4762	wegen	{"due to"}	{"Wegen des Regens bleiben wir zu Hause.","Der Termin fällt wegen Krankheit aus."}	2	15	\N	\N	\N
4763	weil	{because}	{"Ich bin müde, weil ich spät gearbeitet habe.","Wir bleiben hier, weil es regnet."}	2	15	\N	\N	\N
4803	dabei	{thereby}	{"Das Formular liegt dabei.","Ich helfe dir dabei."}	2	16	\N	\N	\N
4804	dokument	{document}	{"Bringe alle Dokumente zum Amt!","Das Dokument ist unterschrieben."}	2	16	3	\N	\N
4805	ehepartner/in	{spouse}	{"Mein Ehepartner kommt mit zum Termin.","Der Ehepartner muss ebenfalls unterschreiben."}	2	16	5	\N	\N
4806	eheschließung	{marriage}	{"Die Eheschließung findet im Standesamt statt.","Wir planen unsere Eheschließung."}	2	16	2	\N	Eheschließungen
4807	einwohnermeldeamt	{"registration office"}	{"Melde dich beim Einwohnermeldeamt an!","Das Einwohnermeldeamt ist überfüllt."}	2	16	3	\N	\N
4808	enkel/in	{grandson/granddaughter}	{"Mein Enkel besucht mich jeden Sommer.","Die Enkelin lebt in Frankreich."}	2	16	5	\N	\N
4809	enkelkind	{grandchild}	{"Das Enkelkind geht noch zur Schule.","Meine Enkelkinder sind süß."}	2	16	3	\N	Enkelkinder
4810	entschuldigen	{"to excuse"}	{"Entschuldigen Sie die Verspätung!","Ich entschuldige mich für den Fehler."}	2	16	\N	\N	\N
4811	familienbuch	{"family register"}	{"Das Familienbuch liegt beim Standesamt.","Überprüfe das Familienbuch für die Daten."}	2	16	3	\N	\N
4812	familienkasse	{"family fund"}	{"Die Familienkasse zahlt das Kindergeld.","Antrag bei der Familienkasse stellen!"}	2	16	2	\N	\N
4813	familienmitglied	{"family member"}	{"Alle Familienmitglieder sind eingeladen.","Ein Familienmitglied hilft beim Umzug."}	2	16	3	\N	Familienmitglieder
4814	fehlen	{"to miss"}	{"Ein Dokument fehlt in den Unterlagen.","Warum fehlst du heute?"}	2	16	\N	\N	\N
4815	finanzamt	{"tax office"}	{"Das Finanzamt prüft meine Steuererklärung.","Ich schreibe dem Finanzamt einen Brief."}	2	16	3	\N	\N
4816	geburt	{birth}	{"Die Geburt des Kindes wurde registriert.","Die Geburt war im Krankenhaus."}	2	16	2	\N	Geburten
4817	geburtsdatum	{"date of birth"}	{"Gib dein Geburtsdatum an!","Das Geburtsdatum steht im Pass."}	2	16	3	\N	Geburtsdaten
4818	geburtsland	{"country of birth"}	{"Mein Geburtsland ist Italien.","Das Geburtsland wird im Formular abgefragt."}	2	16	3	\N	\N
4819	geburtsname	{"name at birth"}	{"Der Geburtsname der Mutter ist erforderlich.","Mein Geburtsname steht in der Urkunde."}	2	16	1	\N	\N
4820	geburtsort	{"place of birth"}	{"Mein Geburtsort ist München.","Der Geburtsort wird im Ausweis angegeben."}	2	16	1	\N	\N
4821	geburtsurkunde	{"birth certificate"}	{"Die Geburtsurkunde muss beglaubigt werden.","Wo ist deine Geburtsurkunde?"}	2	16	2	\N	\N
4822	genehmigen	{"to approve"}	{"Der Antrag wurde genehmigt.","Die Behörde genehmigt den Aufenthalt."}	2	16	\N	\N	\N
4823	geschlecht	{gender}	{"Das Geschlecht wird im Formular abgefragt.","Bitte geben Sie Ihr Geschlecht an!"}	2	16	3	\N	Geschlechter
4824	herein	{within}	{"Kommen Sie herein!","Herein, bitte!"}	2	16	\N	\N	\N
4825	hingehen	{"to go there"}	{"Ich gehe morgen zum Amt hingehen.","Wann gehst du zur Behörde hingehen?"}	2	16	\N	\N	\N
4826	integration	{integration}	{"Integration ist wichtig für die Gesellschaft.","Der Kurs fördert die Integration."}	2	16	2	\N	\N
4827	integrationskurs	{"integration course"}	{"Ich besuche einen Integrationskurs.","Der Integrationskurs hilft beim Deutschlernen."}	2	16	1	\N	\N
4828	kindergeld	{"child allowance"}	{"Das Kindergeld wird monatlich überwiesen.","Beantrage das Kindergeld frühzeitig!"}	2	16	3	\N	\N
4829	lebenspartner/in	{"life partner"}	{"Mein Lebenspartner unterstützt mich.","Die Lebenspartnerin arbeitet im Ausland."}	2	16	5	\N	\N
4830	lichtbildausweis	{"photo ID"}	{"Ein Lichtbildausweis ist erforderlich.","Hast du einen Lichtbildausweis dabei?"}	2	16	1	\N	\N
4831	losfahren	{"to drive away"}	{"Wir fahren um 8 Uhr los.","Der Bus ist schon losgefahren."}	2	16	\N	\N	\N
4832	männlich	{male}	{"Das Geschlecht ist männlich.","Der Antragsteller ist männlich."}	2	16	\N	\N	\N
4833	nichte	{niece}	{"Meine Nichte wohnt in Hamburg.","Die Nichte besucht uns nächste Woche."}	2	16	2	\N	Nichten
4834	notieren	{"to note"}	{"Notiere dir den Termin!","Ich notiere die Adresse des Amts."}	2	16	\N	\N	\N
4797	beantragen	{"to apply for"}	{"Ich beantrage einen neuen Pass.","Hast du die Erlaubnis beantragt?"}	2	16	\N	\N	\N
4798	bearbeiten	{"to edit"}	{"Das Amt bearbeitet meinen Antrag.","Kannst du das Dokument bearbeiten?"}	2	16	\N	\N	\N
4799	behörde	{authorities}	{"Die Behörde antwortet langsam.","Welche Behörde ist zuständig?"}	2	16	2	\N	\N
4801	berufsinformationszentrum	{"career information centre"}	{"Das Berufsinformationszentrum bietet viele Ressourcen.","Besuche das Berufsinformationszentrum!"}	2	16	3	\N	\N
4802	cousin/e	{cousin}	{"Mein Cousin wohnt in Berlin.","Die Cousine kommt aus Spanien."}	2	16	5	\N	\N
6438	sparschwein	{"piggy bank"}	{"Das Sparschwein ist voller Münzen.","Kinder lieben Sparschweine."}	2	23	3	\N	Sparschweine
4844	vollständig	{complete}	{"Die Unterlagen sind vollständig.","Bist du vollständig gesund?"}	2	16	\N	\N	\N
4845	webseite	{website}	{"Die Webseite der Behörde ist informativ.","Besuche die offizielle Webseite!"}	2	16	2	\N	Webseiten
4846	weiblich	{female}	{"Das Geschlecht ist weiblich.","Die Antragstellerin ist weiblich."}	2	16	\N	\N	\N
4847	wiederholen	{"to repeat"}	{"Wiederholen Sie bitte Ihre Adresse!","Ich wiederhole den Antrag nächste Woche."}	2	16	\N	\N	\N
4848	zulassungsstelle	{"admission office"}	{"Die Zulassungsstelle ist heute geschlossen.","Ich gehe zur Zulassungsstelle für mein Auto."}	2	16	2	\N	\N
4849	zuständig	{responsible}	{"Welche Behörde ist zuständig?","Der zuständige Mitarbeiter hilft weiter."}	2	16	\N	\N	\N
4835	personalausweis	{"personal ID"}	{"Mein Personalausweis ist gültig bis 2030.","Zeigen Sie bitte Ihren Personalausweis!"}	2	16	1	\N	\N
4836	reisepass	{passport}	{"Mein Reisepass muss verlängert werden.","Hast du den Reisepass dabei?"}	2	16	1	\N	Reisepässe
4837	schwiegereltern	{parents-in-law}	{"Meine Schwiegereltern wohnen in Österreich.","Die Schwiegereltern kommen zu Besuch."}	2	16	2	\N	\N
4838	staatsangehörigkeit	{nationality}	{"Meine Staatsangehörigkeit ist deutsch.","Die Staatsangehörigkeit steht im Pass."}	2	16	2	\N	\N
4839	team	{team}	{"Das Team der Behörde ist freundlich.","Unser Team hilft bei Fragen."}	2	16	3	\N	\N
4840	teil	{part}	{"Ein Teil der Unterlagen fehlt.","Der schwierige Teil ist geschafft."}	2	16	1	\N	\N
4841	unterlagen	{documents}	{"Bringen Sie alle Unterlagen mit!","Die Unterlagen sind vollständig."}	2	16	\N	\N	\N
4842	unterschreiben	{"to sign"}	{"Unterschreiben Sie hier, bitte!","Ich unterschreibe den Vertrag morgen."}	2	16	\N	\N	\N
4850	abitur (abi)	{A-level}	{"Mein Bruder macht dieses Jahr Abitur.","Nach dem Abitur möchte ich studieren."}	2	17	3	\N	\N
4851	ablegen	{"to take (an exam)"}	{"Ich lege morgen eine Prüfung ab.","Sie hat das Abitur erfolgreich abgelegt."}	2	17	\N	\N	\N
4852	abschließen	{"to complete"}	{"Ich schließe mein Studium nächsten Monat ab.","Hast du die Aufgabe abgeschlossen?"}	2	17	\N	\N	\N
4853	abschluss	{degree}	{"Mein Abschluss ist in Informatik.","Der Abschluss eröffnet viele Möglichkeiten."}	2	17	1	\N	Abschlüsse
4854	anbieten	{"to offer"}	{"Die Schule bietet Sprachkurse an.","Kannst du mir Hilfe anbieten?"}	2	17	\N	\N	\N
4855	anfänger/in	{beginner}	{"Der Anfänger lernt schnell Deutsch.","Die Anfängerin besucht einen Kurs."}	2	17	5	\N	\N
4856	architektur	{architecture}	{"Ich studiere Architektur.","Die Architektur des Gebäudes ist modern."}	2	17	2	\N	\N
4843	urkunde	{certificate}	{"Die Urkunde wird per Post verschickt.","Die Geburtsurkunde liegt im Safe."}	2	16	2	\N	Urkunden
6439	spätestens	{"at the latest"}	{"Zahlen Sie spätestens bis Freitag.","Spätestens morgen ist das Geld da."}	2	23	\N	\N	\N
6440	stecken	{"to put"}	{"Stecken Sie die Karte in den Automaten.","Er steckt Geld in die Tasche."}	2	23	\N	\N	\N
6441	stoßen	{"to encounter"}	{"Er stieß auf ein Problem beim Überweisen.","Wir stoßen oft auf technische Schwierigkeiten."}	2	23	\N	\N	\N
6442	tan	{TAN}	{"Die TAN ist eine Transaktionsnummer.","Geben Sie die TAN ein."}	2	23	2	\N	\N
6443	taste	{button}	{"Drücken Sie die grüne Taste.","Die Tasten am Automaten sind verschmutzt."}	2	23	2	\N	Tasten
6444	täter/in	{culprit}	{"Der Täter wurde gefasst.","Die Täterin gestand den Betrug."}	2	23	5	\N	\N
6445	überfall	{robbery}	{"Der Überfall auf die Bank schockierte alle.","Überfälle sind selten geworden."}	2	23	1	\N	Überfälle
6446	überfallen	{"to rob"}	{"Die Bank wurde überfallen.","Überfallen ist eine schwere Tat."}	2	23	\N	\N	\N
6447	überwachungskamera	{CCTV}	{"Überwachungskameras schützen die Bank.","Die Überwachungskamera zeichnet alles auf."}	2	23	2	\N	Überwachungskameras
6448	überweisung	{transfer}	{"Die Überweisung dauert einen Tag.","Machen Sie eine Online-Überweisung."}	2	23	2	\N	Überweisungen
6449	überweisungsformular	{"bank transfer form"}	{"Füllen Sie das Überweisungsformular aus.","Das Überweisungsformular liegt bereit."}	2	23	3	\N	\N
6450	versuch	{attempt}	{"Der Versuch, Geld abzuheben, scheiterte.","Ein weiterer Versuch ist nötig."}	2	23	1	\N	Versuche
6451	verwendungszweck	{purpose}	{"Geben Sie den Verwendungszweck an.","Der Verwendungszweck ist Pflicht."}	2	23	1	\N	Verwendungszwecke
6452	vorteil	{advantage}	{"Der Vorteil des Online-Bankings ist die Schnelligkeit.","Vorteile für Studenten sind verfügbar."}	2	23	1	\N	Vorteile
6539	verteilen	{"to distribute"}	{"Wir verteilen Flyer in der Stadt.","Die Geschenke werden an die Kinder verteilt."}	2	24	\N	\N	\N
6540	volleyballspiel	{"volley ball game"}	{"Das Volleyballspiel war spannend.","Wir schauen ein Volleyballspiel im Stadion."}	2	24	3	\N	\N
6541	vorlesung	{lecture}	{"Die Vorlesung beginnt um 10 Uhr.","Er hält eine Vorlesung über Geschichte."}	2	24	2	\N	vorlesungen
6542	wundervoll	{wonderful}	{"Das Konzert war wundervoll!","Ein wundervoller Abend mit Freunden."}	2	24	\N	\N	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-01-29 16:53:06
20211116045059	2025-01-29 16:53:07
20211116050929	2025-01-29 16:53:07
20211116051442	2025-01-29 16:53:07
20211116212300	2025-01-29 16:53:07
20211116213355	2025-01-29 16:53:07
20211116213934	2025-01-29 16:53:08
20211116214523	2025-01-29 16:53:08
20211122062447	2025-01-29 16:53:08
20211124070109	2025-01-29 16:53:08
20211202204204	2025-01-29 16:53:08
20211202204605	2025-01-29 16:53:09
20211210212804	2025-01-29 16:53:09
20211228014915	2025-01-29 16:53:09
20220107221237	2025-01-29 16:53:10
20220228202821	2025-01-29 16:53:10
20220312004840	2025-01-29 16:53:10
20220603231003	2025-01-29 16:53:10
20220603232444	2025-01-29 16:53:10
20220615214548	2025-01-29 16:53:11
20220712093339	2025-01-29 16:53:11
20220908172859	2025-01-29 16:53:11
20220916233421	2025-01-29 16:53:11
20230119133233	2025-01-29 16:53:11
20230128025114	2025-01-29 16:53:12
20230128025212	2025-01-29 16:53:12
20230227211149	2025-01-29 16:53:12
20230228184745	2025-01-29 16:53:12
20230308225145	2025-01-29 16:53:12
20230328144023	2025-01-29 16:53:13
20231018144023	2025-01-29 16:53:13
20231204144023	2025-01-29 16:53:13
20231204144024	2025-01-29 16:53:13
20231204144025	2025-01-29 16:53:13
20240108234812	2025-01-29 16:53:14
20240109165339	2025-01-29 16:53:14
20240227174441	2025-01-29 16:53:14
20240311171622	2025-01-29 16:53:14
20240321100241	2025-01-29 16:53:15
20240401105812	2025-01-29 16:53:15
20240418121054	2025-01-29 16:53:16
20240523004032	2025-01-29 16:53:16
20240618124746	2025-01-29 16:53:16
20240801235015	2025-01-29 16:53:17
20240805133720	2025-01-29 16:53:17
20240827160934	2025-01-29 16:53:17
20240919163303	2025-01-29 16:53:17
20240919163305	2025-01-29 16:53:17
20241019105805	2025-01-29 16:53:17
20241030150047	2025-01-29 16:53:18
20241108114728	2025-01-29 16:53:18
20241121104152	2025-01-29 16:53:19
20241130184212	2025-01-29 16:53:19
20241220035512	2025-01-29 16:53:19
20241220123912	2025-01-29 16:53:19
20241224161212	2025-01-29 16:53:19
20250107150512	2025-01-29 16:53:20
20250110162412	2025-01-29 16:53:20
20250123174212	2025-01-29 16:53:20
20250128220012	2025-01-29 16:53:20
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-01-17 14:48:45.532873
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-01-17 14:48:45.565621
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-01-17 14:48:45.57524
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-01-17 14:48:45.606364
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-01-17 14:48:45.640612
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-01-17 14:48:45.651244
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-01-17 14:48:45.662351
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-01-17 14:48:45.672906
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-01-17 14:48:45.684302
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-01-17 14:48:45.694983
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-01-17 14:48:45.706471
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-01-17 14:48:45.716945
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-01-17 14:48:45.728784
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-01-17 14:48:45.740604
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-01-17 14:48:45.751124
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-01-17 14:48:45.783329
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-01-17 14:48:45.793163
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-01-17 14:48:45.80299
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-01-17 14:48:45.813037
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-01-17 14:48:45.824098
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-01-17 14:48:45.834345
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-01-17 14:48:45.852021
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-01-17 14:48:45.892656
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-01-17 14:48:45.925682
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-01-17 14:48:45.936248
25	custom-metadata	67eb93b7e8d401cafcdc97f9ac779e71a79bfe03	2025-01-17 14:48:45.947078
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: Conversation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Conversation_id_seq"', 36, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 5, true);


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.levels_id_seq', 9, true);


--
-- Name: parts_of_speech_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parts_of_speech_id_seq', 4, true);


--
-- Name: prefix_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prefix_types_id_seq', 4, true);


--
-- Name: prefixes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prefixes_id_seq', 151, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 26, true);


--
-- Name: words_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_table_id_seq', 6542, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: Conversation Conversation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conversation"
    ADD CONSTRAINT "Conversation_pkey" PRIMARY KEY (id);


--
-- Name: _AntonymRelation _AntonymRelation_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_AntonymRelation"
    ADD CONSTRAINT "_AntonymRelation_AB_pkey" PRIMARY KEY ("A", "B");


--
-- Name: _SimilarWordRelation _SimilarWordRelation_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_SimilarWordRelation"
    ADD CONSTRAINT "_SimilarWordRelation_AB_pkey" PRIMARY KEY ("A", "B");


--
-- Name: _SynonymRelation _SynonymRelation_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_SynonymRelation"
    ADD CONSTRAINT "_SynonymRelation_AB_pkey" PRIMARY KEY ("A", "B");


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: basic_users basic_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_users
    ADD CONSTRAINT basic_users_pkey PRIMARY KEY (id);


--
-- Name: favorite_words favorite_words_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_words
    ADD CONSTRAINT favorite_words_pkey PRIMARY KEY ("userId", "wordId");


--
-- Name: levels levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: parts_of_speech parts_of_speech_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts_of_speech
    ADD CONSTRAINT parts_of_speech_pkey PRIMARY KEY (id);


--
-- Name: prefix_types prefix_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prefix_types
    ADD CONSTRAINT prefix_types_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: words_table words_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words_table
    ADD CONSTRAINT words_table_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: _AntonymRelation_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_AntonymRelation_B_index" ON public."_AntonymRelation" USING btree ("B");


--
-- Name: _SimilarWordRelation_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_SimilarWordRelation_B_index" ON public."_SimilarWordRelation" USING btree ("B");


--
-- Name: _SynonymRelation_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_SynonymRelation_B_index" ON public."_SynonymRelation" USING btree ("B");


--
-- Name: admins_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX admins_email_key ON public.admins USING btree (email);


--
-- Name: articles_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX articles_name_key ON public.articles USING btree (name);


--
-- Name: basic_users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX basic_users_email_key ON public.basic_users USING btree (email);


--
-- Name: basic_users_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX basic_users_id_key ON public.basic_users USING btree (id);


--
-- Name: levels_level_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX levels_level_key ON public.levels USING btree (level);


--
-- Name: parts_of_speech_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX parts_of_speech_name_key ON public.parts_of_speech USING btree (name);


--
-- Name: prefix_types_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX prefix_types_name_key ON public.prefix_types USING btree (name);


--
-- Name: prefixes_prefixWord_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "prefixes_prefixWord_key" ON public.prefixes USING btree ("prefixWord");


--
-- Name: topics_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX topics_name_key ON public.topics USING btree (name);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: words_table_value_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX words_table_value_key ON public.words_table USING btree (value);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: Conversation Conversation_levelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conversation"
    ADD CONSTRAINT "Conversation_levelId_fkey" FOREIGN KEY ("levelId") REFERENCES public.levels(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _AntonymRelation _AntonymRelation_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_AntonymRelation"
    ADD CONSTRAINT "_AntonymRelation_A_fkey" FOREIGN KEY ("A") REFERENCES public.words_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _AntonymRelation _AntonymRelation_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_AntonymRelation"
    ADD CONSTRAINT "_AntonymRelation_B_fkey" FOREIGN KEY ("B") REFERENCES public.words_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _SimilarWordRelation _SimilarWordRelation_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_SimilarWordRelation"
    ADD CONSTRAINT "_SimilarWordRelation_A_fkey" FOREIGN KEY ("A") REFERENCES public.words_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _SimilarWordRelation _SimilarWordRelation_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_SimilarWordRelation"
    ADD CONSTRAINT "_SimilarWordRelation_B_fkey" FOREIGN KEY ("B") REFERENCES public.words_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _SynonymRelation _SynonymRelation_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_SynonymRelation"
    ADD CONSTRAINT "_SynonymRelation_A_fkey" FOREIGN KEY ("A") REFERENCES public.words_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _SynonymRelation _SynonymRelation_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_SynonymRelation"
    ADD CONSTRAINT "_SynonymRelation_B_fkey" FOREIGN KEY ("B") REFERENCES public.words_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: admins admins_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: basic_users basic_users_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_users
    ADD CONSTRAINT basic_users_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: favorite_words favorite_words_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_words
    ADD CONSTRAINT "favorite_words_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: favorite_words favorite_words_wordId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_words
    ADD CONSTRAINT "favorite_words_wordId_fkey" FOREIGN KEY ("wordId") REFERENCES public.words_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: words_table fk_word_article; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words_table
    ADD CONSTRAINT fk_word_article FOREIGN KEY ("articleId") REFERENCES public.articles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: words_table fk_word_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words_table
    ADD CONSTRAINT fk_word_level FOREIGN KEY ("levelId") REFERENCES public.levels(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: words_table fk_word_part_of_speech; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words_table
    ADD CONSTRAINT fk_word_part_of_speech FOREIGN KEY ("partOfSpeechId") REFERENCES public.parts_of_speech(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: words_table fk_word_topic; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words_table
    ADD CONSTRAINT fk_word_topic FOREIGN KEY ("topicId") REFERENCES public.topics(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: prefixes prefixes_prefixTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prefixes
    ADD CONSTRAINT "prefixes_prefixTypeId_fkey" FOREIGN KEY ("prefixTypeId") REFERENCES public.prefix_types(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.try_cast_double(inp text) FROM postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_decode(data text) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_encode(data bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

