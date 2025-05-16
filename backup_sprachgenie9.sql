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
    "levelId" integer NOT NULL,
    "createdBy" text NOT NULL
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
    name text NOT NULL,
    "levelId" integer NOT NULL
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
-- Name: user_change_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_change_logs (
    id text NOT NULL,
    "targetUserId" text NOT NULL,
    "performedById" text NOT NULL,
    field text NOT NULL,
    "oldValue" text NOT NULL,
    "newValue" text NOT NULL,
    "changedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.user_change_logs OWNER TO postgres;

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
-- Name: word_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.word_history (
    id integer NOT NULL,
    "wordId" integer NOT NULL,
    "userId" text NOT NULL,
    value text,
    meaning text[],
    sentences text[],
    "modifiedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "modifiedFields" text[],
    "newData" jsonb NOT NULL,
    "oldData" jsonb,
    "pluralForm" text
);


ALTER TABLE public.word_history OWNER TO postgres;

--
-- Name: word_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.word_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.word_history_id_seq OWNER TO postgres;

--
-- Name: word_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.word_history_id_seq OWNED BY public.word_history.id;


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
    "pluralForm" text,
    "modifiedFields" text[],
    "createdBy" text NOT NULL
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
-- Name: word_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_history ALTER COLUMN id SET DEFAULT nextval('public.word_history_id_seq'::regclass);


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

COPY public."Conversation" (id, topic, text, "levelId", "createdBy") FROM stdin;
37	Heimatland	[{"message": "Hallo Max! Schön, dich zu sehen. Wie war dein Wochenende?", "speaker": "Lena"}, {"message": "Hallo Lena! Mein Wochenende war ruhig. Ich habe mit meiner Familie telefoniert. Und deins?", "speaker": "Max"}, {"message": "Ich war spazieren und habe alte Fotos aus meiner Heimat angeschaut. Das hat viele Erinnerungen geweckt.", "speaker": "Lena"}, {"message": "Oh, das klingt schön. Wo ist eigentlich deine Heimat?", "speaker": "Max"}, {"message": "Ich komme aus einem kleinen Dorf in Süddeutschland, in der Nähe von Freiburg. Und du?", "speaker": "Lena"}, {"message": "Ich komme aus der Steiermark in Österreich. Dort gibt es viele grüne Hügel und ruhige Orte.", "speaker": "Max"}, {"message": "Das klingt idyllisch. Was vermisst du am meisten an deinem Heimatland?", "speaker": "Lena"}, {"message": "Ich vermisse die Natur, die frische Luft und natürlich das Essen, vor allem die traditionellen Gerichte meiner Mutter.", "speaker": "Max"}, {"message": "Das kann ich gut verstehen. Ich vermisse die gemeinsame Zeit mit meiner Familie und die langen Abende im Garten.", "speaker": "Lena"}, {"message": "Ja, solche Erinnerungen bleiben im Herzen. Besuchst du deine Heimat oft?", "speaker": "Max"}, {"message": "Leider nicht so oft, wie ich möchte. Meistens fahre ich nur einmal im Jahr, aber ich telefoniere regelmäßig mit meinen Eltern.", "speaker": "Lena"}, {"message": "Bei mir ist es ähnlich. Ich versuche, mindestens zweimal im Jahr zu fahren, besonders zu Feiertagen.", "speaker": "Max"}, {"message": "Ich finde, es ist wichtig, den Kontakt zur Heimat zu behalten, auch wenn man woanders lebt.", "speaker": "Lena"}, {"message": "Ja, das sehe ich genauso. Heimat bedeutet für mich Geborgenheit und schöne Kindheitserinnerungen.", "speaker": "Max"}, {"message": "Genau! Heimat ist nicht nur ein Ort, sondern auch ein Gefühl.", "speaker": "Lena"}, {"message": "Danke für das schöne Gespräch, Lena. Es hat gutgetan, über die Heimat zu sprechen.", "speaker": "Max"}, {"message": "Mir auch, Max. Vielleicht zeigen wir uns beim nächsten Mal Fotos aus unserer Heimat.", "speaker": "Lena"}, {"message": "Gute Idee! Ich freue mich schon darauf. Bis bald!", "speaker": "Max"}, {"message": "Bis bald, Max! Hab einen schönen Tag noch.", "speaker": "Lena"}]	3	d9a98059-2f81-4cfa-a9a3-04545a677972
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
1c0967c1-b4ad-484b-b7ed-08c49d5c241d	1f09d361989afe01975048b254b4982bbce8015f622495ddd5f921374ebfa974	2025-05-13 14:18:55.404581+00	20250223170112_add_prefix_conversation	\N	\N	2025-05-13 14:18:55.133859+00	1
fe2ba231-2c29-473e-8d12-bc25d24d3c1a	dc3ad2e3d4236b894e06617acb3bcd7f21808c4f63f1ff5ef1078105b6985668	2025-05-13 14:18:57.085373+00	20250513131914_userhistory	\N	\N	2025-05-13 14:18:56.986227+00	1
c7d9504f-e905-4494-be49-2fddc1ba46c1	048421eac9471e9d6d9759480c57206e466d9085ae9d502ed7441a1308825e65	2025-05-13 14:18:55.536669+00	20250224040917_add_prefix	\N	\N	2025-05-13 14:18:55.439734+00	1
848608d0-1bac-42dc-b675-a2e2aa670f84	42c6ac5c603c585cab4c1949fec9ceac692ef9a9e3662968e2691986251fc5b6	2025-05-13 14:18:55.665927+00	20250225165146_boolean_added	\N	\N	2025-05-13 14:18:55.571624+00	1
87453dec-3293-4877-92d4-7a70310f5b56	971f330643d71b03e3074c8fc517d22348baaf8a4d4b4236cbdfe558f5a79e0b	2025-05-13 14:18:55.794903+00	20250322153240_add_reset_token_used	\N	\N	2025-05-13 14:18:55.702294+00	1
54380aff-80f5-4ca9-9301-af063bb9d41c	e61a0e6b250045356209ebcf43f7115e621873b48ec367ac32d78476c09b8a30	2025-05-13 14:18:57.208799+00	20250513135326_add_user_change_log	\N	\N	2025-05-13 14:18:57.119414+00	1
32a7906c-8736-48d3-9f3a-974299816e40	b8100f7704775eed8b9a9c009edce54355653ae9114a04c4727e58ff5789be1b	2025-05-13 14:18:55.920502+00	20250322163946_add_reset_token_used	\N	\N	2025-05-13 14:18:55.830314+00	1
a0f9f5ac-bc11-4880-b582-c7c32fbeb4a2	1f09d361989afe01975048b254b4982bbce8015f622495ddd5f921374ebfa974	2025-05-11 18:52:31.436437+00	20250223170112_add_prefix_conversation	\N	\N	2025-05-11 18:52:31.176112+00	1
2a867bdd-9ffa-4749-8009-113e2f815c18	3876daabcb7fff4060844e388cbf334bb1e6af00902607f762c1ef30a16973dd	2025-05-13 14:18:56.04449+00	20250505152751_add_level_topic_relation	\N	\N	2025-05-13 14:18:55.955796+00	1
5dd06ec3-9263-41ae-9f94-0c845ad10be3	048421eac9471e9d6d9759480c57206e466d9085ae9d502ed7441a1308825e65	2025-05-11 18:52:31.58903+00	20250224040917_add_prefix	\N	\N	2025-05-11 18:52:31.470698+00	1
42f4851e-0975-4033-ba05-21cbff9328a3	ab0a0db9ecf7205319127f3ead38891909fa9b938f763776f2aa1036e297cf3d	2025-05-13 14:18:56.180023+00	20250511134000_word_history_added	\N	\N	2025-05-13 14:18:56.078939+00	1
2492190e-82be-45e0-b1eb-df5c08e8feae	42c6ac5c603c585cab4c1949fec9ceac692ef9a9e3662968e2691986251fc5b6	2025-05-11 18:52:31.712366+00	20250225165146_boolean_added	\N	\N	2025-05-11 18:52:31.621135+00	1
de8f08e3-df88-4543-9a52-cd06383f1778	d51b0091f8d82be575d1a7de4d7a260444671823359353ae2e938cc44ea75450	2025-05-13 14:18:56.311906+00	20250511134614_modification_history_added	\N	\N	2025-05-13 14:18:56.217599+00	1
d5d09295-cb3f-4d76-aa40-d1ebd5960c6d	971f330643d71b03e3074c8fc517d22348baaf8a4d4b4236cbdfe558f5a79e0b	2025-05-11 18:52:31.83507+00	20250322153240_add_reset_token_used	\N	\N	2025-05-11 18:52:31.755132+00	1
4602cd71-1ef9-4003-8c2e-8203f8983f7d	00999d2e148a6b7c096e83536afcabd62f1e39f1f70a588d38fe1da971ec780f	2025-05-13 14:18:56.443503+00	20250511140201_cretedby_added	\N	\N	2025-05-13 14:18:56.347867+00	1
4f225cbf-7e85-4be8-9c74-21505b1b1c81	b8100f7704775eed8b9a9c009edce54355653ae9114a04c4727e58ff5789be1b	2025-05-11 18:52:31.947311+00	20250322163946_add_reset_token_used	\N	\N	2025-05-11 18:52:31.866995+00	1
ebfa119c-1748-4873-94ad-9ecb8ea1aa41	87a50e44965baad7b02b31cf3d8fdd86aa67c97853f3bbcc5114442c1230592f	2025-05-13 14:18:56.570608+00	20250511161739_added	\N	\N	2025-05-13 14:18:56.479225+00	1
3ebcc39d-f74d-4edb-881a-38f20fac28b0	3876daabcb7fff4060844e388cbf334bb1e6af00902607f762c1ef30a16973dd	2025-05-11 18:52:32.060118+00	20250505152751_add_level_topic_relation	\N	\N	2025-05-11 18:52:31.979006+00	1
d0ebe2b5-ffbb-4519-a189-9f6fc854f7d0	c518b7b6744cb8edb28379e29cd9a41d39f109574a444c0a986ce7d9df92f143	2025-05-13 14:18:56.696071+00	20250511164034_add_level_topic_relation	\N	\N	2025-05-13 14:18:56.605929+00	1
eb569bad-bd3f-4650-b767-596f1b2efeb1	ab0a0db9ecf7205319127f3ead38891909fa9b938f763776f2aa1036e297cf3d	2025-05-11 18:52:32.181983+00	20250511134000_word_history_added	\N	\N	2025-05-11 18:52:32.09135+00	1
cb069610-80f1-4bed-93ba-e39a7680b28a	afca5916313b0b3ed6cd2bf900903fa407b52cbc4da18358167ef3603ba9eda5	2025-05-13 14:18:56.82191+00	20250511164530_add_level_topic_relation	\N	\N	2025-05-13 14:18:56.732194+00	1
b06c7c4b-f72c-4308-95a5-7f681f09710e	d51b0091f8d82be575d1a7de4d7a260444671823359353ae2e938cc44ea75450	2025-05-11 18:52:32.297098+00	20250511134614_modification_history_added	\N	\N	2025-05-11 18:52:32.214721+00	1
1b4c7f7d-50da-41c8-9540-547fa3b87016	58bdc31e4df4a29af3f4e1532f2ae35f2183345415024f0ac2eecbd83c82ac44	2025-05-13 14:18:56.946759+00	20250511165649_dsg	\N	\N	2025-05-13 14:18:56.855901+00	1
393e2627-366e-4fd2-8e3f-357ebf76cbb1	00999d2e148a6b7c096e83536afcabd62f1e39f1f70a588d38fe1da971ec780f	2025-05-11 18:52:32.412953+00	20250511140201_cretedby_added	\N	\N	2025-05-11 18:52:32.329433+00	1
28fa1653-f0f7-42af-a36d-3e098962e8fa	87a50e44965baad7b02b31cf3d8fdd86aa67c97853f3bbcc5114442c1230592f	2025-05-11 18:52:32.544866+00	20250511161739_added	\N	\N	2025-05-11 18:52:32.445422+00	1
00d68201-98e2-412f-aeb3-43aa7c75059a	c518b7b6744cb8edb28379e29cd9a41d39f109574a444c0a986ce7d9df92f143	2025-05-11 18:52:32.659934+00	20250511164034_add_level_topic_relation	\N	\N	2025-05-11 18:52:32.577434+00	1
557da82c-db6c-4506-8895-17eea10fe431	afca5916313b0b3ed6cd2bf900903fa407b52cbc4da18358167ef3603ba9eda5	2025-05-11 18:52:32.781217+00	20250511164530_add_level_topic_relation	\N	\N	2025-05-11 18:52:32.692138+00	1
203817b4-8826-490e-a2d5-3c72b1fe5465	58bdc31e4df4a29af3f4e1532f2ae35f2183345415024f0ac2eecbd83c82ac44	2025-05-11 18:52:32.896002+00	20250511165649_dsg	\N	\N	2025-05-11 18:52:32.813996+00	1
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
1bcf3db0-cae1-4f60-8960-77f646d4f540	Super Admin	arif.aust.eng@gmail.com	\N	01234567890	f	2025-05-13 14:46:56.907	2025-05-13 14:46:56.907
0ffb1867-6241-4050-bab8-afd493ca644c	Md Arifur Rahman 	almon.arif@gmail.com	\N		f	2025-05-15 08:01:45.964	2025-05-15 08:01:45.964
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, name) FROM stdin;
1	der
2	die
3	das
5	der/die
4	
\.


--
-- Data for Name: basic_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basic_users (id, email, name, "profilePhoto", "contactNumber", address, "isDeleted", "createdAt", "updatedAt") FROM stdin;
b1d1c387-62b7-4de2-96e1-1c889b47f5ca	Bhua14bhua@gmail.com	Tahsin	\N			f	2025-05-15 16:33:29.903	2025-05-15 16:33:29.903
\.


--
-- Data for Name: favorite_words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_words ("userId", "wordId") FROM stdin;
be85ed54-eba3-4ece-a62d-2fc59b1469bf	8503
be85ed54-eba3-4ece-a62d-2fc59b1469bf	9170
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7990
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7912
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7806
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7807
be85ed54-eba3-4ece-a62d-2fc59b1469bf	8785
be85ed54-eba3-4ece-a62d-2fc59b1469bf	9436
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7897
be85ed54-eba3-4ece-a62d-2fc59b1469bf	9265
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7911
be85ed54-eba3-4ece-a62d-2fc59b1469bf	9989
be85ed54-eba3-4ece-a62d-2fc59b1469bf	9281
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7922
be85ed54-eba3-4ece-a62d-2fc59b1469bf	9332
be85ed54-eba3-4ece-a62d-2fc59b1469bf	8232
be85ed54-eba3-4ece-a62d-2fc59b1469bf	8682
be85ed54-eba3-4ece-a62d-2fc59b1469bf	9336
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7992
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7991
be85ed54-eba3-4ece-a62d-2fc59b1469bf	7296
\.


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.levels (id, level, "deletedAt") FROM stdin;
1	A1	\N
2	A2	\N
3	B1	\N
4	B2	\N
6	Unknown	\N
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

COPY public.topics (id, name, "levelId") FROM stdin;
1	Unknown	6
2	Gute Reise!	3
3	Liebe Nachbarn …	3
4	Ein Schulprojekt zum Umweltschutz	3
5	Online einkaufen	3
6	Fernsehen und Unterhaltung	3
7	So war das damals …	3
8	Deutschland – zweite Heimat?	3
9	Ein neuer Arbeitsplatz	3
10	Büroalltag	3
11	Gesunde Ernährung	3
12	Gut versichert!	3
13	Chatten, mailen, sich informieren	2
14	Mit Bus und Bahn	2
15	Unsere neue Wohnung	2
16	Auf dem Amt	2
17	Schule, und dann?	2
18	Auf Arbeitssuche	2
19	Ein Einkaufsbummel	2
20	Bei der Arbeit	2
21	In der Schule	2
22	Gesund sein und gesund bleiben	2
23	Auf der Bank	2
24	Freizeitvergnügen	2
25	Hallo! Wie geht‘s?	1
26	Meine Familie und ich	1
27	Im Deutschkurs	1
28	Im Supermarkt	1
29	Von morgens bis abends	1
30	Auf Wohnungssuche	1
31	In der Stadt unterwegs	1
32	Mein Beruf	1
33	Beim Arzt	1
34	Gestern und heute	1
35	Wir gehen shoppen!	1
36	Endlich Frühling!	1
37	Ein neuer Beruf	4
38	Bei der Berufsberatung	4
39	Auf Jobsuche	4
40	Stellenangebote und Bewerbungen	4
41	Im Gespräch mit Kollegen	4
42	Kontakte mit Kunden	4
43	Berufsalltag in Deutschland	4
44	Bewerbungsunterlagen	4
45	Arbeit und Familie	4
46	Beruflich unterwegs	4
47	Verkaufsgespräche und Small Talk	4
48	Angebote und Verhandlungen	4
49	Bestellen und bezahlen	4
50	Konflikte und Beschwerden	4
51	Eine Besprechung planen	4
52	Bestimmungen am Arbeitsplatz	4
53	Rund um den Arbeitsvertrag	4
\.


--
-- Data for Name: user_change_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_change_logs (id, "targetUserId", "performedById", field, "oldValue", "newValue", "changedAt") FROM stdin;
409ac64e-f2ac-40a1-8a97-e34b53eed9d4	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	BASIC_USER	ADMIN	2025-05-13 17:44:17.36
571f6fcf-e165-4b8e-8063-75dcdaa53c44	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	status	ACTIVE	BLOCKED	2025-05-13 17:44:21.837
97b1229f-0f13-48a3-913e-1f30ead395dc	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	ADMIN	BASIC_USER	2025-05-13 17:44:40.793
444ea84e-34cc-4995-9d99-0a9b2b5341ff	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	BASIC_USER	ADMIN	2025-05-13 17:48:00.419
d798aa80-86ee-4e0c-a60b-ed7b6d79e499	56b3d5d9-bbfa-4e29-a194-8fd766a41fa4	be85ed54-eba3-4ece-a62d-2fc59b1469bf	status	ACTIVE	BLOCKED	2025-05-13 18:07:13.517
0b632442-e026-482f-a7ed-a8b8ed85b8ca	56b3d5d9-bbfa-4e29-a194-8fd766a41fa4	be85ed54-eba3-4ece-a62d-2fc59b1469bf	status	BLOCKED	ACTIVE	2025-05-13 18:07:21.339
0aaa6a1d-64f2-49ef-b319-cd84819c99a6	56b3d5d9-bbfa-4e29-a194-8fd766a41fa4	be85ed54-eba3-4ece-a62d-2fc59b1469bf	status	ACTIVE	DELETED	2025-05-13 18:08:41.956
b8e2e314-4314-4186-af33-833c8982abd6	56b3d5d9-bbfa-4e29-a194-8fd766a41fa4	be85ed54-eba3-4ece-a62d-2fc59b1469bf	status	DELETED	ACTIVE	2025-05-13 18:08:55.08
7f4f34da-5898-4300-8e10-059c1c71f018	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	ADMIN	BASIC_USER	2025-05-13 18:11:35.046
f7d043fa-4444-4e9a-9f4c-14b001e7bc5f	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	BASIC_USER	ADMIN	2025-05-13 18:11:49.082
8eb689dc-44fe-4ad4-8945-337064459142	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	ADMIN	BASIC_USER	2025-05-15 08:00:51.857
b831d09e-df09-42d1-b346-53b72833e976	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	BASIC_USER	ADMIN	2025-05-15 08:00:56.275
613103cd-8aa7-4a91-92ac-e79d72cd33a4	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	ADMIN	BASIC_USER	2025-05-15 08:01:08.971
db016ff0-0607-4133-bf6d-0d35b3a679d0	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	BASIC_USER	ADMIN	2025-05-15 08:01:13.678
36a39eb7-acd6-40ae-a678-94a54319083b	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	ADMIN	BASIC_USER	2025-05-15 08:01:37.678
ad45bb03-7bbf-4016-91e2-abe7b9abc422	be85ed54-eba3-4ece-a62d-2fc59b1469bf	d9a98059-2f81-4cfa-a9a3-04545a677972	role	BASIC_USER	ADMIN	2025-05-15 08:01:45.967
6e1a91a2-9636-4295-b0de-7daef7cb0ac6	56b3d5d9-bbfa-4e29-a194-8fd766a41fa4	d9a98059-2f81-4cfa-a9a3-04545a677972	role	BASIC_USER	ADMIN	2025-05-15 16:33:25.335
12c3fcee-4f99-4ee4-9a24-43c1341ccb7c	56b3d5d9-bbfa-4e29-a194-8fd766a41fa4	d9a98059-2f81-4cfa-a9a3-04545a677972	role	ADMIN	BASIC_USER	2025-05-15 16:33:29.911
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, name, role, "needPasswordChange", status, "verificationToken", "createdAt", "updatedAt") FROM stdin;
be85ed54-eba3-4ece-a62d-2fc59b1469bf	almon.arif@gmail.com	$2b$12$rcevrokCNVz8XZiU0MGEb.5zsdJ3uOwXXpGzcY1pV7Crz1f4DLQMK	Md Arifur Rahman 	ADMIN	t	ACTIVE	\N	2025-05-13 17:43:34.948	2025-05-15 08:01:45.961
56b3d5d9-bbfa-4e29-a194-8fd766a41fa4	Bhua14bhua@gmail.com	$2b$12$9a/LVsZICmG8xihfpt0Bbebw.GLYxEhm0E0BaoVOvL7vRU92zraWG	Tahsin	BASIC_USER	t	ACTIVE	\N	2025-05-13 17:48:25.009	2025-05-15 16:33:29.898
d9a98059-2f81-4cfa-a9a3-04545a677972	arif.aust.eng@gmail.com	$2b$12$tgkWq4hpUtAiFnNrzoDmxumPSJiJJU4OF.haV9Aen1d3iovpuvd4W	Super Admin	SUPER_ADMIN	t	ACTIVE	\N	2025-05-13 14:46:56.907	2025-05-13 15:12:47.433
\.


--
-- Data for Name: word_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.word_history (id, "wordId", "userId", value, meaning, sentences, "modifiedAt", "modifiedFields", "newData", "oldData", "pluralForm") FROM stdin;
\.


--
-- Data for Name: words_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.words_table (id, value, meaning, sentences, "levelId", "topicId", "articleId", "partOfSpeechId", "pluralForm", "modifiedFields", "createdBy") FROM stdin;
8685	wundervoll	{wonderful}	{"Das Konzert war wundervoll!","Ein wundervoller Abend mit Freunden."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6545	abend	{evening}	{"Guten Abend!","Am Abend lese ich ein Buch."}	1	25	1	\N	abende	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6546	alles	{everything}	{"Alles ist fertig.","Ich verstehe alles."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6547	antworten	{answer}	{"Kannst du antworten?","Sie antwortet schnell."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6548	auch	{also/too}	{"Ich bin auch müde.","Das ist auch mein Stift."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6549	auf	{on}	{"Das Buch liegt auf dem Tisch.","Wir treffen uns auf dem Platz."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6550	aus	{from}	{"Ich komme aus Syrien.","Das Glas ist aus China."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6551	aussage	{statement}	{"Das ist eine wichtige Aussage.","Die Aussagen sind klar."}	1	25	2	\N	aussagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6552	bisschen	{"a little/a bit"}	{"Ein bisschen Wasser, bitte.","Er spricht ein bisschen Deutsch."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6553	bitte	{"please/thank you"}	{"Bitte schließen Sie die Tür!","Ein Kaffee, bitte."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6554	danke	{"thank you"}	{"Danke für die Hilfe!","Danke, es geht mir gut."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6555	dann	{then}	{"Dann gehen wir nach Hause.","Was machst du dann?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6556	das	{"the (neuter noun)"}	{"Das Kind spielt.","Das ist mein Auto."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6557	der	{"the (masculine noun)"}	{"Der Mann arbeitet.","Der Hund ist braun."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6558	deutsch	{German}	{"Ich spreche Deutsch.","Deutsch lernen ist spannend."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6559	dialog	{dialogue}	{"Lest den Dialog!","Der Dialog ist einfach."}	1	25	1	\N	dialoge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6560	die	{"the (feminine noun)"}	{"Die Frau lacht.","Die Katze schläft."}	1	25	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6561	dir	{"(to) you"}	{"Wie geht es dir?","Ich gebe dir das Buch."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6562	du	{you}	{"Bist du aus Polen?","Du bist sehr nett."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6563	ein	{a/one}	{"Ein Apfel, bitte.","Das ist ein Haus."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6564	entschuldigung	{apology}	{"Entschuldigung, wo ist die Toilette?","Das war keine Entschuldigung."}	1	25	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6565	er	{he}	{"Er kommt aus Spanien.","Er spricht schnell."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6566	es	{it}	{"Es regnet heute.","Es ist mein Hund."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6567	form	{form/type}	{"Füllen Sie das Formular aus!","Diese Form ist rund."}	1	25	2	\N	formen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6568	frage	{question}	{"Hast du eine Frage?","Die Frage ist einfach."}	1	25	2	\N	fragen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6570	frau	{woman/Mrs}	{"Die Frau liest ein Buch.","Frau Müller ist hier."}	1	25	2	\N	frauen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6571	ganz	{quite}	{"Es ist ganz einfach.","Ich bin ganz zufrieden."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6573	grammatik	{grammar}	{"Grammatik ist wichtig.","Ich übe Grammatik."}	1	25	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6574	gut	{good}	{"Das Essen schmeckt gut!","Mir geht es gut."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6575	hallo	{hello}	{"Hallo, wie geht es dir?","Hallo, ich bin Anna."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6576	heißen	{"to be called"}	{"Ich heiße Peter.","Wie heißt du?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6577	herr	{Mr/man}	{"Herr Schmidt ist da.","Der Herr trinkt Kaffee."}	1	25	1	\N	herren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6578	hören	{hear}	{"Ich höre Musik.","Hörst du das Geräusch?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6579	ich	{I/me}	{"Ich bin Student.","Ich habe Hunger."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6580	ihnen	{"(to) you (formal)"}	{"Wie geht es Ihnen?","Kann ich Ihnen helfen?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6569	fragen	{ask}	{"Ich frage den Lehrer.","Darf ich etwas fragen?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6581	ihr	{her/their}	{"Ihr Buch liegt hier.","Ist das euer Klassenzimmer?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6572	gehen	{go}	{"Ich gehe zur Arbeit.","Wohin gehst du jetzt?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6582	im	{in}	{"Wir sind im Park.","Im Sommer ist es warm."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6583	ja	{yes}	{"Ja, ich verstehe.","Ja, das stimmt."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6584	klar	{"of course"}	{"Klar, mache ich!","Das ist klar."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6585	kommen	{come}	{"Woher kommst du?","Er kommt später."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6586	kurs	{course}	{"Der Kurs beginnt heute.","Ich besuche einen Deutschkurs."}	1	25	1	\N	kurse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6588	wort	{word}	{"Das Wort ist neu.","Wie schreibt man dieses Wort?"}	1	25	3	\N	wörter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6589	wie	{how}	{"Wie heißt du?","Wie geht es dir?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6590	wissen	{"to know"}	{"Ich weiß die Antwort.","Weißt du die Uhrzeit?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6591	wo	{where}	{"Wo wohnst du?","Wo ist der Bahnhof?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6592	woher	{"where ... from"}	{"Woher kommst du?","Woher ist das Paket?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6593	kursteilnehmer	{"course participant (male)"}	{"Der Kursteilnehmer lernt Deutsch.","Wo ist der Kursteilnehmer?"}	1	25	1	\N	kursteilnehmer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6594	kursteilnehmerin	{"course participant (female)"}	{"Die Kursteilnehmerin schreibt schnell.","Sie ist eine neue Kursteilnehmerin."}	1	25	2	\N	kursteilnehmerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6587	land	{country}	{"Deutschland ist ein schönes Land.","Viele Länder sind groß."}	1	25	3	\N	Länder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6596	mann	{man}	{"Der Mann arbeitet im Büro.","Männer spielen Fußball."}	1	25	1	\N	männer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6597	mein	{my/mine}	{"Das ist mein Hund.","Mein Name ist Anna."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6598	mit	{with}	{"Ich gehe mit dir.","Trinkst du Tee mit Zucker?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6600	nacht	{night}	{"Gute Nacht!","In der Nacht schlafe ich."}	1	25	2	\N	nächte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6601	name	{name}	{"Wie ist dein Name?","Der Name steht auf dem Schild."}	1	25	1	\N	namen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6602	nein	{no}	{"Nein, danke.","Nein, das ist falsch."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6603	neu	{new}	{"Das ist ein neues Auto.","Ich habe neue Freunde."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6604	nicht	{not}	{"Das ist nicht richtig.","Ich verstehe nicht."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6605	oder	{or}	{"Kaffee oder Tee?","Heute oder morgen?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6606	person	{person}	{"Eine Person fehlt.","Viele Personen sind hier."}	1	25	2	\N	personen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6607	richtig	{correct}	{"Das ist richtig!","Die Antwort ist richtig."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6608	satz	{sentence}	{"Schreib einen Satz!","Der Satz ist kurz."}	1	25	1	\N	sätze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6610	sehr	{very}	{"Das ist sehr gut.","Ich bin sehr müde."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6612	sie	{they}	{"Wie heißen Sie?","Kommen Sie aus Deutschland?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6613	so	{so}	{"Das ist so einfach.","Warum bist du so müde?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6614	sprache	{language}	{"Deutsch ist eine Sprache.","Welche Sprachen sprichst du?"}	1	25	2	\N	sprachen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6615	sprechen	{"(I speak – you speak – he speaks)"}	{"Ich spreche Deutsch.","Sprichst du Arabisch?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6616	supergut	{"very good"}	{"Das Essen ist supergut!","Dein Deutsch ist supergut."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6617	tag	{day}	{"Guten Tag, Herr Maier!","Heute ist ein schöner Tag."}	1	25	1	\N	tage	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6595	lesen	{"read (you read)"}	{"Ich lese einen Text.","Liest du gerne Bücher?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6599	morgen	{tomorrow}	{"Guten Morgen!","Der Morgen ist schön."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6611	sein	{"(I am – you are – he is – they/you are)"}	{"Sein Arm ist verletzt.","Sein Termin ist heute."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8686	abfall	{rubbish}	{"Der Abfall muss getrennt werden, damit er recycelt werden kann.","Ich werfe den Abfall in den Mülleimer, weil ich die Umwelt schützen möchte."}	3	2	1	\N	abfälle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6618	tschüss	{bye}	{"Tschüss, bis bald!","Tschüss, wir sehen uns morgen."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6619	und	{and}	{"Ich und du.","Brot und Wasser."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6620	was	{what}	{"Was machst du morgen?","Was ist das?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6621	welche	{which}	{"Welche Sprachen sprichst du?","Welche Farbe magst du?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6622	wer	{who}	{"Wer ist das?","Wer kommt mit?"}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6623	wiedersehen	{goodbye}	{"Auf Wiedersehen!","Bis zum Wiedersehen!"}	1	25	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6624	aber	{but}	{"Ich bin müde, aber ich arbeite.","Er ist klein, aber stark."}	1	26	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6625	adresse	{address}	{"Wie ist deine Adresse?","Die Adresse ist falsch."}	1	26	2	\N	adressen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6626	alt	{old}	{"Mein Bruder ist alt.","Das Auto ist sehr alt."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6627	anmelden	{register}	{"Ich melde mich im Kurs an.","Wo kann ich mein Kind anmelden?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6628	anmeldung	{registration}	{"Die Anmeldung ist online.","Wo ist die Anmeldung?"}	1	26	2	\N	anmeldungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6629	arbeiten	{work}	{"Ich arbeite im Büro.","Arbeiten Sie heute?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6630	bild	{image/photo}	{"Das Bild hängt an der Wand.","Zeig mir dein Familienbild!"}	1	26	3	\N	bilder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6631	bruder	{brother}	{"Mein Bruder heißt Tom.","Wo ist dein Bruder?"}	1	26	1	\N	brüder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6632	buchstabieren	{"to spell"}	{"Buchstabieren Sie Ihren Namen!","Kannst du das Wort buchstabieren?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6633	dein	{your/yours}	{"Dein Buch liegt hier.","Ist das dein Handy?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6634	einmal	{"once again"}	{"Noch einmal, bitte!","Einmal Pizza, bitte."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6635	eltern	{parents}	{"Meine Eltern wohnen in Berlin.","Wo arbeiten deine Eltern?"}	1	26	2	\N	eltern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6636	falsch	{wrong}	{"Die Antwort ist falsch.","Das ist die falsche Adresse."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6637	familie	{family}	{"Meine Familie ist groß.","Wie viele Personen sind in deiner Familie?"}	1	26	2	\N	familien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6638	familienname	{surname}	{"Wie ist Ihr Familienname?","Der Familienname steht im Pass."}	1	26	1	\N	familiennamen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6639	familienstand	{"marital status"}	{"Was ist Ihr Familienstand?","Der Familienstand ist verheiratet."}	1	26	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6640	formular	{form}	{"Füllen Sie das Formular aus!","Wo ist das Formular?"}	1	26	3	\N	formulare	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6641	geschieden	{divorced}	{"Sie ist geschieden.","Meine Eltern sind geschieden."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6642	geschwister	{siblings}	{"Hast du Geschwister?","Meine Geschwister sind jung."}	1	26	2	\N	geschwister	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6643	haben	{"to have"}	{"Ich habe einen Bruder.","Hast du Kinder?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6644	handynummer	{"mobile number"}	{"Wie ist deine Handynummer?","Die Handynummer ist falsch."}	1	26	2	\N	handynummern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6645	hausnummer	{"house number"}	{"Die Hausnummer ist 12.","Wo steht die Hausnummer?"}	1	26	2	\N	hausnummern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6646	heimatland	{"home country"}	{"Mein Heimatland ist Syrien.","Welches ist dein Heimatland?"}	1	26	3	\N	heimatländer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6647	hier	{here}	{"Ich wohne hier.","Hier ist mein Pass."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6648	ihr/ihre	{"your (formal)/yours (formal)"}	{"Wie ist Ihre Adresse?","Ist das Ihre Tasche?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6649	in	{in}	{"Ich wohne in Berlin.","Das Buch ist in der Tasche."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6650	information	{information}	{"Brauchen Sie weitere Informationen?","Die Information ist wichtig."}	1	26	2	\N	informationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6651	jahr	{year}	{"Ich bin 30 Jahre alt.","Das Jahr 2023 ist heiß."}	1	26	3	\N	jahre	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6652	jetzt	{now}	{"Jetzt bin ich müde.","Was machst du jetzt?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6653	kein/keine	{no/none}	{"Ich habe keine Geschwister.","Kein Problem!"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6654	kind	{child}	{"Das Kind spielt im Park.","Ich habe zwei Kinder."}	1	26	3	\N	kinder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6655	kindergarten	{nursery}	{"Mein Sohn geht in den Kindergarten.","Der Kindergarten ist geschlossen."}	1	26	1	\N	kindergarten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6656	kontakt	{contact}	{"Hast du Kontakt zu deiner Familie?","Meine Kontakte sind im Handy."}	1	26	1	\N	kontakte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6657	leben	{"to live"}	{"Ich lebe in Deutschland.","Wo lebst du?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6658	ledig	{single}	{"Ich bin ledig.","Sein Familienstand ist ledig."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6659	e-mail	{email}	{"Schreib mir eine E-Mail!","Meine E-Mail-Adresse ist..."}	1	26	2	\N	e-mails	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6660	möchten	{"to like (polite)"}	{"Was möchten Sie trinken?","Ich möchte Kaffee."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6661	mutter	{mother}	{"Meine Mutter kocht gut.","Wo arbeitet deine Mutter?"}	1	26	2	\N	mütter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6662	nach	{after}	{"Nach dem Essen gehe ich schlafen.","Nach der Arbeit treffe ich Freunde."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6663	nachname	{"last name"}	{"Wie ist Ihr Nachname?","Der Nachname steht im Pass."}	1	26	1	\N	nachnamen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6664	noch	{also/still}	{"Noch eine Frage, bitte.","Hast du noch Geschwister?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6665	postleitzahl	{postcode}	{"Wie ist die Postleitzahl?","Die Postleitzahl ist 10115."}	1	26	2	\N	postleitzahlen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6666	schwester	{sister}	{"Meine Schwester ist Lehrerin.","Wo wohnt deine Schwester?"}	1	26	2	\N	schwestern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6667	schwägerin	{sister-in-law}	{"Meine Schwägerin heißt Anna.","Die Schwägerin kommt aus Polen."}	1	26	2	\N	schwägerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6668	schwiegertochter	{step-daughter}	{"Meine Schwiegertochter ist nett.","Die Schwiegertochter hilft im Haus."}	1	26	2	\N	schwiegertöchter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6669	schwiegervater	{step-father}	{"Mein Schwiegervater arbeitet im Krankenhaus.","Der Schwiegervater ist streng."}	1	26	1	\N	schwiegerväter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6670	sohn	{son}	{"Mein Sohn geht zur Schule.","Wie alt ist dein Sohn?"}	1	26	1	\N	söhne	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6671	straße	{street}	{"Ich wohne in der Goethestraße.","Die Straße ist laut."}	1	26	2	\N	straßen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6672	telefonnummer	{"telephone number"}	{"Wie ist deine Telefonnummer?","Die Telefonnummer ist falsch."}	1	26	2	\N	telefonnummern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6673	tochter	{daughter}	{"Meine Tochter ist 5 Jahre alt.","Die Tochter spielt im Garten."}	1	26	2	\N	töchter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6674	über	{about/via/over}	{"Das Buch ist über Tiere.","Der Zug fährt über Köln."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6675	väter	{fathers}	{"Die Väter spielen mit den Kindern.","Viele Väter arbeiten hier."}	1	26	1	\N	väter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6676	vergleichen	{compare}	{"Vergleichen Sie die Preise!","Ich vergleiche die Adressen."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6677	verheiratet	{married}	{"Sind Sie verheiratet?","Meine Eltern sind verheiratet."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6678	verwitwet	{widowed}	{"Sie ist verwitwet.","Sein Familienstand ist verwitwet."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6679	viel/viele	{many}	{"Ich habe viele Freunde.","Es gibt viel Arbeit."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6680	vorname	{forename}	{"Wie ist Ihr Vorname?","Der Vorname steht im Pass."}	1	26	1	\N	vornamen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6681	vorstellen	{introduce}	{"Darf ich mich vorstellen?","Stell mir deine Familie vor!"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6682	welcher/welche/welches	{which}	{"Welche Sprache sprichst du?","Welcher Tag ist heute?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6683	willkommen	{welcome}	{"Herzlich willkommen!","Du bist hier willkommen."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6684	wir	{we}	{"Wir wohnen in München.","Wir lernen Deutsch."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9696	master	{"master’s degree"}	{"Sie macht einen Master in BWL.","Der Master vertieft das Fachwissen."}	4	37	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6686	wohnort	{"place of residence"}	{"Mein Wohnort ist Hamburg.","Wie ist Ihr Wohnort?"}	1	26	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6687	zahl	{number}	{"Die Zahl 5 ist klein.","Schreiben Sie die Zahl!"}	1	26	2	\N	zahlen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6688	zu	{too}	{"Das ist zu teuer.","Ich bin zu müde."}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6689	also	{well}	{"Also, fangen wir an!","Also, was machen wir heute?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6690	an	{on}	{"Das Bild hängt an der Wand.","Am Montag habe ich Unterricht."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6691	andere	{other}	{"Hast du andere Stifte?","Das ist eine andere Übung."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6692	benutzen	{use}	{"Benutzen Sie bitte einen Bleistift!","Ich benutze mein Handy."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6693	blatt	{"sheet (of paper)"}	{"Gib mir ein Blatt Papier!","Die Blätter sind weiß."}	1	27	3	\N	blätter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6694	bleistift	{pencil}	{"Der Bleistift ist neu.","Wo sind die Bleistifte?"}	1	27	1	\N	bleistifte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6695	buch	{book}	{"Das Buch ist schwer.","Ich lese ein deutsches Buch."}	1	27	3	\N	bücher	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6696	da	{there}	{"Da ist mein Heft!","Da steht der Lehrer."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6697	deutschkurs	{"German course"}	{"Der Deutschkurs beginnt um 9 Uhr.","Wo ist der Deutschkurs?"}	1	27	1	\N	deutschkurse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6698	dienstag	{Tuesday}	{"Am Dienstag haben wir Prüfung.","Dienstag ist mein Lieblingstag."}	1	27	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6699	doch	{"indeed (positive confirmation)"}	{"Doch, ich verstehe!","Doch, das ist richtig!"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6700	donnerstag	{Thursday}	{"Donnerstag ist der vierte Tag.","Am Donnerstag lernen wir Grammatik."}	1	27	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6701	endlich	{finally}	{"Endlich Ferien!","Endlich verstehe ich das!"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6702	erklären	{explain}	{"Kannst du das erklären?","Der Lehrer erklärt die Regel."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6703	erzählen	{"explain (you explain)"}	{"Erzählen Sie von Ihrem Tag!","Ich erzähle eine Geschichte."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6704	familienfoto	{"family photo"}	{"Zeig mir dein Familienfoto!","Das Familienfoto hängt an der Wand."}	1	27	3	\N	familienfotos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6705	feiertag	{"public holiday"}	{"Morgen ist ein Feiertag.","An Feiertagen ist die Schule geschlossen."}	1	27	1	\N	feiertage	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6706	fenster	{window}	{"Das Fenster ist offen.","Schließ bitte das Fenster!"}	1	27	3	\N	fenster	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6707	foto	{photo}	{"Das Foto ist schön.","Mach ein Foto von uns!"}	1	27	3	\N	fotos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6708	freitag	{Friday}	{"Freitag ist mein letzter Arbeitstag.","Am Freitag feiern wir!"}	1	27	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6709	freund	{"friend (male)"}	{"Mein Freund hilft mir.","Hast du Freunde im Kurs?"}	1	27	1	\N	freunde	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6710	für	{for}	{"Das Geschenk ist für dich.","Für heute ist Schluss."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6711	genau	{exactly}	{"Genau, das ist richtig!","Die Uhrzeit ist genau 10 Uhr."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6712	gestern	{yesterday}	{"Gestern war ich müde.","Was hast du gestern gemacht?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6713	groß	{big}	{"Das Klassenzimmer ist groß.","Ich habe einen großen Rucksack."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6714	gruß	{greeting}	{"Viele Grüße an deine Familie!","Der Gruß war freundlich."}	1	27	1	\N	grüße	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6715	hausaufgabe	{homework}	{"Die Hausaufgabe ist leicht.","Hast du die Hausaufgaben gemacht?"}	1	27	2	\N	hausaufgaben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6716	heft	{booklet}	{"Schreib ins Heft!","Wo ist mein Heft?"}	1	27	3	\N	hefte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6717	heute	{today}	{"Heute lernen wir neue Wörter.","Was machst du heute?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6718	immer	{always}	{"Ich bin immer pünktlich.","Warum fragst du immer?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6719	karte	{card/map}	{"Zeig mir die Landkarte!","Die Karte ist alt."}	1	27	2	\N	karten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6720	klein	{small}	{"Das Heft ist klein.","Ich habe einen kleinen Fehler gemacht."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6721	knifflig	{tricky}	{"Die Aufgabe ist knifflig.","Das war eine knifflige Frage."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6722	kugelschreiber	{"ball-point pen"}	{"Der Kugelschreiber ist blau.","Hast du einen Kugelschreiber?"}	1	27	1	\N	kugelschreiber	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6723	kurssbuch	{"course book"}	{"Das Kurssbuch liegt auf dem Tisch.","Öffnet das Kurssbuch!"}	1	27	3	\N	kurssbücher	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6724	kurstaum	{classroom}	{"Der Kurstaum ist groß.","Wo ist der Kurstaum?"}	1	27	1	\N	kursträume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6725	lampe	{lamp}	{"Die Lampe ist kaputt.","Schalte die Lampe an!"}	1	27	2	\N	lampen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6726	landkarte	{map}	{"Die Landkarte zeigt Deutschland.","Wo ist die Landkarte?"}	1	27	2	\N	landkarten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6727	langsam	{slowly}	{"Sprich bitte langsam!","Ich gehe langsam."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6728	lehrer	{"teacher (male)"}	{"Der Lehrer erklärt die Grammatik.","Wo ist der Lehrer?"}	1	27	1	\N	lehrer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6729	lehrerin	{"teacher (female)"}	{"Die Lehrerin ist nett.","Die Lehrerin korrigiert die Fehler."}	1	27	2	\N	lehrerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6730	lernen	{learn}	{"Wir lernen Deutsch.","Lernst du gerne?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6731	liebe	{dear}	{"Liebe Grüße!","Liebe Anna, wie geht es dir?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6732	lieber	{"dear (preference)"}	{"Ich trinke lieber Tee.","Lieber Herr Müller, ..."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6733	liste	{list}	{"Schreib die Wörter auf die Liste!","Die Liste ist lang."}	1	27	2	\N	listen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6734	machen	{make}	{"Wir machen eine Pause.","Was machst du jetzt?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6735	mir	{"(to) me"}	{"Gib mir das Buch!","Mir ist kalt."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6736	mittwoch	{Wednesday}	{"Am Mittwoch haben wir Prüfung.","Mittwoch ist der dritte Tag."}	1	27	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6737	montag	{Monday}	{"Montag ist der erste Tag.","Am Montag beginnt der Kurs."}	1	27	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6738	natürlich	{"of course"}	{"Natürlich verstehe ich das!","Natürlich kommst du mit!"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6739	nett	{nice}	{"Die Lehrerin ist nett.","Das war sehr nett von dir!"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6740	papier	{paper}	{"Gib mir ein Blatt Papier!","Das Papier ist weiß."}	1	27	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6741	papierkorb	{"waste paper bin"}	{"Wirf das Papier in den Papierkorb!","Der Papierkorb ist voll."}	1	27	1	\N	papierkörbe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6742	pause	{break}	{"Wir machen jetzt Pause.","Die Pause dauert 15 Minuten."}	1	27	2	\N	pausen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6743	problem	{problem}	{"Das Problem ist leicht.","Hast du ein Problem?"}	1	27	3	\N	probleme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6744	projektor	{projector}	{"Der Projektor funktioniert nicht.","Schalte den Projektor an!"}	1	27	1	\N	projektoren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6745	radiergummi	{eraser}	{"Kann ich deinen Radiergummi benutzen?","Der Radiergummi ist klein."}	1	27	1	\N	radiergummis	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6746	raum	{room}	{"Der Raum ist hell.","Wo ist der Kursraum?"}	1	27	1	\N	räume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6747	rucksack	{backpack}	{"Mein Rucksack ist schwer.","Pack deinen Rucksack!"}	1	27	1	\N	rucksäcke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6748	sache	{thing}	{"Das ist meine Sache!","Wo sind deine Sachen?"}	1	27	2	\N	sachen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6749	sagen	{say}	{"Was sagst du?","Sag es laut!"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6750	samstag	{Saturday}	{"Samstag ist frei!","Am Samstag gehe ich einkaufen."}	1	27	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6751	sehen	{see}	{"Ich sehe das Wort nicht.","Siehst du den Fehler?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6752	seite	{page}	{"Öffne das Buch auf Seite 10!","Die Seite ist leer."}	1	27	2	\N	seiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8687	abflug	{departure}	{"Der Abflug ist für 18 Uhr geplant, obwohl das Wetter unsicher aussieht.","Weil der Abflug sich verspätet, müssen wir länger am Flughafen warten."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6754	schnell	{fast}	{"Lauf schnell!","Er spricht zu schnell."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6755	sonntag	{Sunday}	{"Sonntag ist Ruhetag.","Am Sonntag schlafe ich lang."}	1	27	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6756	spaß	{fun}	{"Das macht Spaß!","Hast du Spaß im Kurs?"}	1	27	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6757	spielen	{play}	{"Spielen wir ein Spiel!","Er spielt den Dialog."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6758	spitzer	{"pencil sharpener"}	{"Wo ist der Spitzer?","Der Spitzer ist kaputt."}	1	27	1	\N	spitzer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6759	stuhl	{chair}	{"Setz dich auf den Stuhl!","Die Stühle sind bequem."}	1	27	1	\N	stühle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6760	tabelle	{"table (chart)"}	{"Füll die Tabelle aus!","Die Tabelle ist unvollständig."}	1	27	2	\N	tabellen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6761	tafel	{blackboard/whiteboard}	{"Schreib an die Tafel!","Die Tafel ist schmutzig."}	1	27	2	\N	tafeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6762	tasche	{bag}	{"Meine Tasche ist schwer.","Wo ist deine Schultasche?"}	1	27	2	\N	taschen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6763	text	{text}	{"Lies den Text laut!","Der Text ist lang."}	1	27	1	\N	texte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6764	tisch	{table}	{"Der Tisch ist voller Bücher.","Setz dich an den Tisch!"}	1	27	1	\N	tische	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6765	tür	{door}	{"Die Tür ist geschlossen.","Mach die Tür zu!"}	1	27	2	\N	türen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6766	übermorgen	{"the day after tomorrow"}	{"Übermorgen haben wir Ferien.","Was machst du übermorgen?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6767	übung	{exercise}	{"Die Übung ist leicht.","Mach die Übung alleine!"}	1	27	2	\N	übungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6768	übungsbuch	{"exercise book"}	{"Das Übungsbuch liegt hier.","Kaufe ein Übungsbuch!"}	1	27	3	\N	übungsbücher	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6769	verstehen	{understand}	{"Verstehst du die Frage?","Ich verstehe alles."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6770	vorgestern	{"the day before yesterday"}	{"Vorgestern war ich krank.","Was hast du vorgestern gemacht?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6771	wand	{wall}	{"An der Wand hängt eine Karte.","Die Wand ist weiß."}	1	27	2	\N	wände	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6772	woche	{week}	{"Nächste Woche haben wir Prüfung.","Die Woche hat sieben Tage."}	1	27	2	\N	wochen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6773	wochenende	{weekend}	{"Am Wochenende schlafe ich lang.","Was machst du am Wochenende?"}	1	27	3	\N	wochenenden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6774	wörterbuch	{dictionary}	{"Benutze das Wörterbuch!","Das Wörterbuch ist dick."}	1	27	3	\N	wörterbücher	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6775	zeigen	{show}	{"Zeig mir dein Heft!","Ich zeige dir den Weg."}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6776	zettel	{note}	{"Schreib es auf den Zettel!","Wo ist der Zettel?"}	1	27	1	\N	zettel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6777	zusammen	{together}	{"Wir arbeiten zusammen.","Lernen wir zusammen?"}	1	27	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6778	angebot	{offer}	{"Das Angebot ist heute gut.","Wir nutzen die Angebote im Supermarkt."}	1	28	3	\N	angebote	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6779	antwort	{answer}	{"Die Antwort ist richtig.","Hast du die Antworten gelernt?"}	1	28	2	\N	antworten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6780	äpfel	{apple}	{"Die Äpfel sind frisch.","Kaufst du rote oder grüne Äpfel?"}	1	28	1	\N	äpfel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6781	apfelsaft	{"apple juice"}	{"Ich trinke gern Apfelsaft.","Der Apfelsaft ist kalt."}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6782	aufgabe	{task}	{"Die Aufgabe ist einfach.","Erledige bitte diese Aufgabe!"}	1	28	2	\N	aufgaben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6783	babynahrung	{"baby food"}	{"Die Babynahrung ist im Regal.","Brauchst du Babynahrung?"}	1	28	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6784	banane	{banana}	{"Die Bananen sind reif.","Kannst du eine Banane schälen?"}	1	28	2	\N	bananen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6785	becher	{container}	{"Ein Becher Joghurt, bitte.","Die Becher sind aus Plastik."}	1	28	1	\N	becher	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6786	beispiel	{example}	{"Gib mir ein Beispiel!","Die Beispiele sind klar."}	1	28	3	\N	beispiele	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6787	bier	{beer}	{"Ein Bier, bitte.","Das Bier ist kalt."}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6788	birne	{pear}	{"Die Birnen sind süß.","Kaufst du Birnen oder Äpfel?"}	1	28	2	\N	birnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6789	bistro	{bistro/café}	{"Das Bistro ist geschlossen.","Treffen wir uns im Bistro?"}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6790	blaubeere	{blueberry}	{"Die Blaubeeren sind lecker.","Magst du Blaubeeren?"}	1	28	2	\N	blaubeeren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6791	bohne	{bean}	{"Die Bohnen sind trocken.","Kochst du grüne Bohnen?"}	1	28	2	\N	bohnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6792	brauchen	{"to need"}	{"Ich brauche Milch.","Brauchst du Hilfe?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6793	brot	{bread}	{"Das Brot ist frisch.","Kannst du Brot kaufen?"}	1	28	3	\N	brote	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6794	brötchen	{"bread roll"}	{"Ein Brötchen mit Käse, bitte.","Die Brötchen sind knusprig."}	1	28	3	\N	brötchen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6795	cent	{cent}	{"Das kostet 99 Cent.","Hast du Cent-Münzen?"}	1	28	1	\N	cent	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6796	cola	{cola}	{"Eine Cola, bitte.","Cola ist süß."}	1	28	2	\N	colas	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6797	couscous	{couscous}	{"Couscous schmeckt gut.","Kochst du Couscous?"}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6798	denn	{because}	{"Warum kommst du denn spät?","Was möchtest du denn kaufen?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6799	diese	{this}	{"Diese Tomaten sind rot.","Welche dieser Bananen möchtest du?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6875	pro	{per}	{"2 Euro pro Kilo.","Der Preis pro Liter ist gut."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6800	dose	{jar}	{"Eine Dose Mais, bitte.","Die Dosen sind im Regal."}	1	28	2	\N	dosen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6801	durch	{through}	{"Geh durch den Eingang!","Der Weg führt durch den Supermarkt."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6802	ei	{egg}	{"Ein Ei kostet 20 Cent.","Die Eier sind frisch."}	1	28	3	\N	eier	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6803	einkaufszettel	{"shopping list"}	{"Schreib es auf den Einkaufszettel!","Hast du den Einkaufszettel?"}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6804	einige	{"a few"}	{"Kaufe einige Äpfel!","Einige Bananen sind noch grün."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6805	erbse	{pea}	{"Die Erbsen sind tiefgefroren.","Magst du Erbsen?"}	1	28	2	\N	erbsen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6806	erdbeere	{strawberry}	{"Erdbeeren sind meine Lieblingsfrüchte.","Die Erdbeeren sind süß."}	1	28	2	\N	erdbeeren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6807	essen	{"to eat"}	{"Ich esse gerne Obst.","Was isst du zum Frühstück?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6808	etwas	{something}	{"Möchtest du etwas trinken?","Etwas Salz, bitte."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6809	fertig	{finished}	{"Ich bin fertig mit Einkaufen.","Das Essen ist fertig."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6810	fisch	{fish}	{"Der Fisch ist frisch.","Kaufst du Fisch oder Fleisch?"}	1	28	1	\N	fische	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6811	flasche	{bottle}	{"Eine Flasche Wasser, bitte.","Die Flaschen sind leer."}	1	28	2	\N	flaschen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6812	fleisch	{meat}	{"Das Fleisch ist teuer.","Magst du rotes Fleisch?"}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6813	frisch	{fresh}	{"Das Brot ist frisch.","Die Milch ist nicht mehr frisch."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6814	frühstück	{breakfast}	{"Das Frühstück ist wichtig.","Was isst du zum Frühstück?"}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6815	frühstücken	{"to breakfast"}	{"Ich frühstücke um 7 Uhr.","Frühstückst du zu Hause?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6816	gemeinsam	{together}	{"Wir kaufen gemeinsam ein.","Gemeinsam kochen macht Spaß!"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6817	gemüse	{vegetables}	{"Gemüse ist gesund.","Kaufst du frisches Gemüse?"}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6818	gern	{"very much"}	{"Ich esse gern Pizza.","Trinkst du gern Kaffee?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6819	getränk	{drink}	{"Ein kaltes Getränk, bitte.","Die Getränke sind im Kühlschrank."}	1	28	3	\N	getränke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6820	glas	{glass}	{"Ein Glas Saft, bitte.","Die Gläser sind sauber."}	1	28	3	\N	gläser	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6822	gramm	{gram}	{"200 Gramm Käse, bitte.","Wie viel Gramm kostet das?"}	1	28	3	\N	gramm	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6823	himbeere	{raspberry}	{"Himbeeren sind süß.","Kaufst du frische Himbeeren?"}	1	28	2	\N	himbeeren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6824	honig	{honey}	{"Honig ist gesund.","Ein Glas Honig, bitte."}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6825	joghurt	{yoghurt}	{"Ein Becher Joghurt, bitte.","Die Joghurts sind im Kühlregal."}	1	28	1	\N	joghurts	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6826	kaffee	{coffee}	{"Eine Tasse Kaffee, bitte.","Der Kaffee ist heiß."}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6827	kartoffel	{potato}	{"Die Kartoffeln sind bio.","Kochst du Kartoffeln?"}	1	28	2	\N	kartoffeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6828	käse	{cheese}	{"Der Käse ist lecker.","Brauchst du geriebenen Käse?"}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6829	kaufen	{"to buy"}	{"Ich kaufe Brot und Milch.","Kaufst du Obst?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6830	keks	{biscuit}	{"Ein Keks zum Kaffee, bitte.","Die Kekse sind süß."}	1	28	1	\N	kekse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6831	kichererbse	{chickpea}	{"Kichererbsen sind gesund.","Brauchst du Kichererbsen?"}	1	28	2	\N	kichererbsen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6832	kilo	{kilo}	{"Ein Kilo Äpfel, bitte.","Wie viel Kilo Kartoffeln?"}	1	28	3	\N	kilos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6833	kirsche	{cherry}	{"Die Kirschen sind saftig.","Magst du süße Kirschen?"}	1	28	2	\N	kirschen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6834	kiwi	{kiwi}	{"Die Kiwis sind reif.","Kaufst du grüne Kiwis?"}	1	28	2	\N	kiwis	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6835	kontrolle	{control}	{"Die Kontrolle ist streng.","Wann ist die nächste Kontrolle?"}	1	28	2	\N	kontrollen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6836	kosten	{"to cost"}	{"Was kostet das Brot?","Die Äpfel kosten 2 Euro."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6837	kuchen	{cake}	{"Ein Stück Kuchen, bitte.","Der Kuchen ist frisch."}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6838	kunde	{"customer (male)"}	{"Der Kunde sucht Hilfe.","Viele Kunden warten."}	1	28	1	\N	kunden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6839	kundin	{"customer (female)"}	{"Die Kundin hat eine Frage.","Die Kundinnen sind zufrieden."}	1	28	2	\N	kundinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6840	kurz	{short}	{"Die Warteschlange ist kurz.","Kurz und knapp, bitte!"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6841	lammfleisch	{"lamb meat"}	{"Lammfleisch ist teuer.","Kochst du Lammfleisch?"}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6842	lebensmittel	{groceries}	{"Die Lebensmittel sind bio.","Wo sind die Lebensmittel?"}	1	28	3	\N	lebensmittel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6843	limonade	{lemonade}	{"Eine Limonade, bitte.","Die Limonade ist kalt."}	1	28	2	\N	limonaden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6844	liter	{litre}	{"Ein Liter Milch, bitte.","Der Saft kostet 3 Euro pro Liter."}	1	28	1	\N	liter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6845	man	{one/you}	{"Hier kann man alles finden.","Man braucht Geduld."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6846	mandarinen	{mandarine}	{"Die Mandarinen sind süß.","Kaufst du Mandarinen?"}	1	28	2	\N	mandarinen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6847	mango	{mango}	{"Die Mangos sind reif.","Magst du Mangos?"}	1	28	2	\N	mangos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6848	markt	{market}	{"Der Markt hat frisches Obst.","Gehst du zum Markt?"}	1	28	1	\N	märkte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6849	marmelade	{jam}	{"Marmelade aufs Brot!","Die Marmelade ist selbstgemacht."}	1	28	2	\N	marmeladen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6850	mehl	{flour}	{"Ein Kilo Mehl, bitte.","Das Mehl ist im Regal."}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6851	meistens	{mostly}	{"Ich kaufe meistens bio.","Meistens ist der Markt voll."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6852	mengenangabe	{amount}	{"Die Mengenangabe steht auf der Packung.","Überprüfe die Mengenangabe!"}	1	28	2	\N	mengenangaben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6853	melone	{melon}	{"Die Melone ist schwer.","Kaufst du Wassermelone?"}	1	28	2	\N	melonen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6854	milch	{milk}	{"Ein Liter Milch, bitte.","Die Milch ist frisch."}	1	28	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6855	milchprodukt	{"dairy product"}	{"Joghurt ist ein Milchprodukt.","Kaufst du Milchprodukte?"}	1	28	3	\N	milchprodukte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6856	mögen	{"to like"}	{"Ich mag Schokolade.","Magst du Käse?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6857	möhre	{carrot}	{"Die Möhren sind frisch.","Brauchst du Möhren?"}	1	28	2	\N	möhren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6858	müssen	{"to have to"}	{"Ich muss einkaufen.","Müssen wir bezahlen?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6859	nehmen	{"to take"}	{"Nimm zwei Äpfel!","Ich nehme die Milch."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6860	nudeln	{pasta/noodles}	{"Nudeln mit Tomatensoße, bitte.","Die Nudeln sind al dente."}	1	28	2	\N	nudeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6861	nur	{only}	{"Ich kaufe nur Brot.","Nur ein Stück, bitte."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6862	obst	{fruit}	{"Obst ist gesund.","Kaufst du frisches Obst?"}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6863	obstsalat	{"fruit salad"}	{"Der Obstsalat ist lecker.","Mache ich einen Obstsalat?"}	1	28	1	\N	obstsalate	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6864	olivenöl	{"olive oil"}	{"Olivenöl ist gesund.","Brauchst du Olivenöl?"}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6865	orange	{orange}	{"Eine Orange, bitte.","Die Orangen sind süß."}	1	28	2	\N	orangen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6866	ordnen	{"to order"}	{"Ordne die Produkte!","Die Regale sind ordentlich."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6867	packung	{packaging}	{"Eine Packung Reis, bitte.","Die Packungen sind schwer."}	1	28	2	\N	packungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6868	paprika	{pepper}	{"Die Paprika ist rot.","Brauchst du Paprika?"}	1	28	2	\N	paprikas	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6869	partner	{"partner (male)"}	{"Mein Partner hilft beim Einkaufen.","Die Partner arbeiten zusammen."}	1	28	1	\N	partner	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6870	partnerin	{"partner (female)"}	{"Meine Partnerin sucht Gemüse.","Die Partnerinnen sind schnell."}	1	28	2	\N	partnerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6871	pfund	{pound}	{"Ein Pfund Äpfel, bitte.","Wie viel Pfund Kartoffeln?"}	1	28	3	\N	pfund	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6872	pilz	{mushroom}	{"Die Pilze sind frisch.","Kochst du Pilze?"}	1	28	1	\N	pilze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6873	planen	{"to plan"}	{"Ich plane den Einkauf.","Planen wir eine Liste?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6874	preis	{price}	{"Der Preis ist hoch.","Die Preise steigen."}	1	28	1	\N	preise	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6876	pudding	{pudding}	{"Ein Pudding zum Dessert.","Der Pudding ist cremig."}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6877	reis	{rice}	{"Reis mit Gemüse, bitte.","Der Reis ist trocken."}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6878	rindfleisch	{beef}	{"Rindfleisch ist teuer.","Kochst du Rindfleisch?"}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6879	saft	{juice}	{"Ein Glas Saft, bitte.","Die Säfte sind frisch."}	1	28	1	\N	säfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6880	sahne	{cream}	{"Sahne zum Kuchen, bitte.","Die Sahne ist dick."}	1	28	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6881	salat	{salad}	{"Ein Salat zum Mittagessen.","Die Salate sind frisch."}	1	28	3	\N	salate	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6882	salz	{salt}	{"Etwas Salz, bitte.","Das Salz ist im Regal."}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6883	sich	{oneself}	{"Kannst du dich entscheiden?","Ich freue mich auf das Essen."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6884	schmecken	{"to taste"}	{"Das schmeckt gut!","Schmeckt dir der Käse?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6885	schokolade	{chocolate}	{"Schokolade macht glücklich.","Magst du dunkle Schokolade?"}	1	28	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6886	schön	{beautiful}	{"Das Obst sieht schön aus.","Ein schöner Tag zum Einkaufen!"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6887	schweinefleisch	{pork}	{"Schweinefleisch ist günstig.","Kochst du Schweinefleisch?"}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6888	sonst	{otherwise}	{"Sonst noch etwas?","Sonst gehe ich nach Hause."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6889	stehen	{"to stand"}	{"Die Milch steht im Kühlschrank.","Stehst du schon lange?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6890	streichen	{"to paint"}	{"Streiche Butter aufs Brot!","Ich streiche die Wand."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6891	stück	{piece}	{"Ein Stück Kuchen, bitte.","Die Stücke sind gleich groß."}	1	28	3	\N	stücke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6892	tasse	{cup}	{"Eine Tasse Tee, bitte.","Die Tassen sind sauber."}	1	28	2	\N	tassen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6893	tee	{tea}	{"Tee mit Honig, bitte.","Der Tee ist heiß."}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6894	teuer	{expensive}	{"Das Fleisch ist teuer.","Warum ist das so teuer?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6895	tipp	{tip}	{"Ein Tipp: Kauf Bio!","Die Tipps sind hilfreich."}	1	28	1	\N	tipps	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6896	tomate	{tomato}	{"Die Tomaten sind rot.","Brauchst du Tomaten?"}	1	28	2	\N	tomaten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6897	traube	{grape}	{"Die Trauben sind süß.","Kaufst du rote oder grüne Trauben?"}	1	28	2	\N	trauben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6898	trinken	{"to drink"}	{"Ich trinke Wasser.","Trinkst du Kaffee?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6899	unterstreichen	{"to emphasize"}	{"Unterstreiche wichtige Wörter!","Ich unterstreiche die Liste."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6900	verbinden	{"to connect"}	{"Verbinde die Produkte!","Wir verbinden Einkaufen mit Spaß."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6901	verkäufer	{"salesperson (male)"}	{"Der Verkäufer hilft mir.","Die Verkäufer sind freundlich."}	1	28	1	\N	verkäufer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6902	verkäuferin	{"salesperson (female)"}	{"Die Verkäuferin gibt mir die Rechnung.","Die Verkäuferinnen kennen mich."}	1	28	2	\N	verkäuferinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6903	von	{from}	{"Das Brot ist von gestern.","Von welchem Markt kommst du?"}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6904	wasser	{water}	{"Ein Glas Wasser, bitte.","Das Wasser ist still."}	1	28	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6905	wein	{wine}	{"Ein Glas Wein, bitte.","Der Wein ist trocken."}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6906	zitrone	{lemon}	{"Die Zitrone ist sauer.","Brauchst du Zitronen?"}	1	28	2	\N	zitronen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6907	zucker	{sugar}	{"Ein Kilo Zucker, bitte.","Der Zucker ist im Regal."}	1	28	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6908	zwiebel	{onion}	{"Die Zwiebeln sind scharf.","Brauchst du Zwiebeln?"}	1	28	2	\N	zwiebeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6909	abends	{"in the evenings"}	{"Abends sehe ich fern.","Wir essen abends um 19 Uhr."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6910	alltag	{everyday}	{"Mein Alltag ist stressig.","Wie sieht dein Alltag aus?"}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6911	anrufen	{"to call"}	{"Ich rufe dich später an.","Kannst du meine Mutter anrufen?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6912	arbeit	{work}	{"Meine Arbeit beginnt um 8 Uhr.","Wo ist deine Arbeit?"}	1	29	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6913	aufstehen	{"to get up"}	{"Ich stehe um 6 Uhr auf.","Wann stehst du auf?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6914	beginnen	{"to start"}	{"Der Film beginnt um 20 Uhr.","Wann beginnt der Kurs?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6915	beide	{both}	{"Beide Kinder spielen im Park.","Beide Bücher sind interessant."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6916	bett	{bed}	{"Das Bett ist gemütlich.","Ich mache das Bett."}	1	29	3	\N	betten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6917	bis	{until}	{"Ich arbeite bis 17 Uhr.","Bis wann bleibst du?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6918	büro	{office}	{"Mein Büro ist im Zentrum.","Wann gehst du ins Büro?"}	1	29	3	\N	büros	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6919	computer	{computer}	{"Der Computer ist langsam.","Brauchst du einen Computer?"}	1	29	1	\N	computer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6920	computerspiel	{"computer game"}	{"Mein Bruder spielt Computerspiele.","Das Computerspiel ist spannend."}	1	29	3	\N	computerspiele	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6921	erst	{first}	{"Erst putze ich, dann koche ich.","Erst um 10 Uhr bin ich fertig."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6922	fernsehen	{"to watch television"}	{"Abends sehe ich fern.","Was siehst du gerne im Fernsehen?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6923	film	{film}	{"Der Film ist lustig.","Schauen wir einen Film?"}	1	29	1	\N	filme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6924	freundin	{"friend (female)"}	{"Meine Freundin kommt zu Besuch.","Hast du eine Freundin hier?"}	1	29	2	\N	freundinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6925	früh	{early}	{"Ich stehe früh auf.","Es ist noch früh am Morgen."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6926	fußball	{football}	{"Samstags spiele ich Fußball.","Siehst du gerne Fußball?"}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6927	geöffnet	{open}	{"Der Supermarkt ist bis 22 Uhr geöffnet.","Wann ist die Bank geöffnet?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6928	grillen	{"to grill/barbeque"}	{"Am Wochenende grillen wir.","Magst du grillen?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6929	halb	{"half past"}	{"Es ist halb zehn.","Wir treffen uns um halb acht."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6930	hunger	{hunger}	{"Ich habe Hunger!","Hast du Hunger?"}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6931	idee	{idea}	{"Das ist eine gute Idee!","Hast du eine Idee?"}	1	29	2	\N	ideen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6932	interview	{interview}	{"Ich habe ein Interview heute.","Das Interview war spannend."}	1	29	3	\N	interviews	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6933	kochen	{"to cook"}	{"Ich koche Abendessen.","Kochst du gerne?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6934	können	{"to be able to"}	{"Ich kann gut schwimmen.","Kannst du morgen kommen?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6935	lecker	{delicious}	{"Das Essen ist lecker!","Der Kuchen schmeckt lecker."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6936	leider	{unfortunately}	{"Leider habe ich keine Zeit.","Leider ist der Laden geschlossen."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6937	manchmal	{sometimes}	{"Manchmal gehe ich ins Kino.","Manchmal bin ich müde."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6938	mehr	{more}	{"Ich möchte mehr lernen.","Brauchst du mehr Zeit?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6939	mittag	{midday}	{"Um Mittag esse ich zu Hause.","Der Mittag ist heiß."}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6940	mittags	{"at midday"}	{"Mittags mache ich Pause.","Was machst du mittags?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6941	mittagspause	{lunchtime}	{"Ich mache eine Stunde Mittagspause.","Wann ist deine Mittagspause?"}	1	29	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6942	morgens	{"in the mornings"}	{"Morgens trinke ich Kaffee.","Was machst du morgens?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6943	müde	{tired}	{"Ich bin müde.","Bist du müde?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6944	musik	{music}	{"Ich höre gerne Musik.","Welche Musik magst du?"}	1	29	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6945	nachmittag	{afternoon}	{"Am Nachmittag lerne ich.","Guten Nachmittag!"}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6946	nachmittags	{"in the afternoons"}	{"Nachmittags gehe ich spazieren.","Was machst du nachmittags?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6947	nachts	{"at night"}	{"Nachts schlafe ich.","Warum bist du nachts wach?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6948	nie	{never}	{"Ich esse nie Fleisch.","Warum kommst du nie pünktlich?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6949	notizzettel	{note}	{"Schreib es auf den Notizzettel!","Wo ist mein Notizzettel?"}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6950	oft	{often}	{"Ich gehe oft ins Kino.","Wie oft trainierst du?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6951	pizza	{pizza}	{"Ich bestelle eine Pizza.","Magst du Pizza?"}	1	29	2	\N	pizzas	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6952	putzen	{"to clean"}	{"Ich putze das Bad.","Putzt du die Zähne?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6953	schade	{shame}	{"Schade, du kannst nicht kommen!","Das ist wirklich schade."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6954	schlafen	{"to sleep"}	{"Ich schlafe acht Stunden.","Schläfst du gut?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6955	schluss	{end}	{"Der Schluss des Films war traurig.","Um 17 Uhr ist Schluss."}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6956	schule	{school}	{"Meine Schule ist groß.","Gehst du zur Schule?"}	1	29	2	\N	schulen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6957	spät	{late}	{"Es ist schon spät!","Warum kommst du spät?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6958	spazieren	{"to walk"}	{"Wir gehen im Park spazieren.","Spazierst du gerne?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6959	spiel	{game}	{"Das Spiel macht Spaß!","Kannst du das Spiel erklären?"}	1	29	3	\N	spiele	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6960	sport	{sport}	{"Ich treibe gerne Sport.","Welchen Sport magst du?"}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6961	stunde	{hour}	{"Eine Stunde dauert der Kurs.","Wie viele Stunden arbeitest du?"}	1	29	2	\N	stunden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6962	stundenplan	{schedule}	{"Mein Stundenplan ist voll.","Zeig mir deinen Stundenplan!"}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6963	supermarkt	{supermarket}	{"Ich gehe zum Supermarkt.","Der Supermarkt ist geöffnet."}	1	29	1	\N	supermärkte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6964	telefonieren	{"to telephone"}	{"Ich telefoniere mit meiner Mutter.","Kannst du später telefonieren?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6965	tun	{"to do"}	{"Was tust du gerade?","Ich tue mein Bestes."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6966	uhr	{clock}	{"Die Uhr hängt an der Wand.","Wie spät ist es laut Uhr?"}	1	29	2	\N	uhren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6967	uhrzeit	{time}	{"Die Uhrzeit steht auf dem Handy.","Wie ist die Uhrzeit?"}	1	29	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6968	um	{at}	{"Wir treffen uns um 15 Uhr.","Um wie viel Uhr beginnt der Film?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6969	unterricht	{lesson}	{"Der Unterricht ist interessant.","Wann hast du Unterricht?"}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6971	vor	{before}	{"Vor dem Essen wasche ich meine Hände.","10 Minuten vor der Zeit."}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6972	vormittag	{morning}	{"Am Vormittag arbeite ich.","Der Vormittag ist ruhig."}	1	29	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6973	vormittags	{"in the morning"}	{"Vormittags lerne ich Deutsch.","Was machst du vormittags?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6974	wann	{when}	{"Wann kommst du?","Wann beginnt der Film?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6975	wohnung	{flat}	{"Meine Wohnung ist klein.","Wo ist deine Wohnung?"}	1	29	2	\N	wohnungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6976	zeichnen	{"to draw"}	{"Ich zeichne gerne.","Kannst du ein Haus zeichnen?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6977	zeit	{time}	{"Ich habe keine Zeit.","Wie viel Zeit brauchst du?"}	1	29	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6978	zu hause	{"at home"}	{"Ich bin heute zu Hause.","Bleibst du zu Hause?"}	1	29	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6979	ab	{from}	{"Die Wohnung ist ab morgen frei.","Ab nächster Woche suchen wir eine neue Wohnung."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6980	altbau	{"old building"}	{"Der Altbau hat hohe Decken.","Wir bevorzugen einen Altbau mit Stuck."}	1	30	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6981	angabe	{detail}	{"Bitte überprüfen Sie Ihre Angaben.","Die Angaben im Formular sind unvollständig."}	1	30	2	\N	angaben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6982	anzeige	{advert}	{"Ich habe eine Anzeige für eine Wohnung gelesen.","Die Anzeige in der Zeitung ist schon alt."}	1	30	2	\N	anzeigen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6983	arbeitszimmer	{workroom}	{"Das Arbeitszimmer ist sehr hell.","Er braucht ein ruhiges Arbeitszimmer."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6984	bad	{bathroom}	{"Das Bad ist neu renoviert.","Die Wohnung hat zwei Bäder."}	1	30	3	\N	bäder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6985	baden	{"to bathe"}	{"Die Kinder baden gerne im See.","Er badet jeden Morgen."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6986	badewanne	{bathtub}	{"Die Badewanne ist sehr groß.","Eine neue Badewanne kostet viel Geld."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6987	badezimmer	{bathroom}	{"Das Badezimmer hat kein Fenster.","Wir putzen das Badezimmer jeden Samstag."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6988	balkon	{balcony}	{"Der Balkon ist sonnig.","Wir frühstücken oft auf dem Balkon."}	1	30	1	\N	balkone	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6989	bauernhof	{farm}	{"Der Bauernhof liegt außerhalb der Stadt.","Kinder lieben den großen Bauernhof."}	1	30	1	\N	bauernhöfe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6990	bei	{at}	{"Die Wohnung liegt bei der Schule.","Bei Regen ist der Hof nass."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6991	bekommen	{"to receive"}	{"Wir bekommen bald die Schlüssel.","Sie bekommt viele Anfragen."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6992	besichtigungstermin	{appointment}	{"Der Besichtigungstermin ist um 15 Uhr.","Hast du einen Besichtigungstermin vereinbart?"}	1	30	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8688	absage	{cancellation}	{"Er hat eine Absage für den Job bekommen, obwohl er gut qualifiziert war.","Die Absage kam per E-Mail, sodass er sofort Bescheid wusste."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6994	billig	{cheap}	{"Die Miete ist hier sehr billig.","Billige Wohnungen sind selten."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6995	breit	{wide}	{"Der Flur ist breit und hell.","Ein breiter Balkon ist praktisch."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6996	circa	{around}	{"Die Wohnung kostet circa 800 Euro.","Circa 50 Quadratmeter reichen uns."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6997	dazu	{"in addition"}	{"Dazu kommt noch die Kaution.","Die Küche ist dazu voll ausgestattet."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6998	diele	{hallway}	{"Die Diele ist mit Holz ausgelegt.","In der Diele steht ein großer Schrank."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6999	direkt	{direct}	{"Die Wohnung liegt direkt am Park.","Direkt nebenan ist ein Supermarkt."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7000	dort	{there}	{"Dort ist die neue Wohnung.","Wir treffen uns dort morgen."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7001	draußen	{outside}	{"Draußen ist ein kleiner Garten.","Die Kinder spielen draußen."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7002	dringend	{urgent}	{"Wir suchen dringend eine Wohnung.","Die Reparatur ist dringend nötig."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7003	dunkel	{dark}	{"Das Zimmer ist zu dunkel.","Dunkle Farben machen den Raum kleiner."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7004	dusche	{shower}	{"Die Dusche ist kaputt.","Eine moderne Dusche ist wichtig."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7005	einfamilienhaus	{"detached house"}	{"Das Einfamilienhaus hat einen Garten.","Ein Einfamilienhaus ist teuer."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7006	einkaufen	{"to shop"}	{"Wir gehen im Supermarkt einkaufen.","Sie kauft online ein."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7007	elektrogerät	{"electronic device"}	{"Neue Elektrogeräte sind energieeffizient.","Der Herd ist ein wichtiges Elektrogerät."}	1	30	3	\N	elektrogeräte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7008	erdgeschoss	{"ground floor"}	{"Die Wohnung liegt im Erdgeschoss.","Das Erdgeschoss ist barrierearm."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7009	ersetzen	{"to replace"}	{"Wir müssen die Fenster ersetzen.","Der Vermieter ersetzt die kaputte Heizung."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7010	euro	{euro}	{"Die Miete beträgt 750 Euro.","Ein Euro ist etwa ein Dollar wert."}	1	30	1	\N	euros	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7011	fernseher	{television}	{"Der Fernseher ist zu laut.","Im Wohnzimmer steht ein großer Fernseher."}	1	30	1	\N	fernseher	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7012	finden	{"to find"}	{"Wir finden keine passende Wohnung.","Er findet den Schlüssel nicht."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7013	firma	{company}	{"Die Firma sucht neue Mitarbeiter.","Er arbeitet bei einer großen Firma."}	1	30	2	\N	firmen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7014	flur	{corridor}	{"Der Flur ist schmal und lang.","Im Flur hängen viele Bilder."}	1	30	1	\N	flure	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7015	frei	{free}	{"Die Wohnung ist ab sofort frei.","Ist dieser Platz noch frei?"}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7016	garage	{garage}	{"Die Garage ist groß genug für zwei Autos.","Eine Garage ist praktisch im Winter."}	1	30	2	\N	garagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7017	garten	{garden}	{"Der Garten ist sehr gepflegt.","Kinder spielen gerne im Garten."}	1	30	1	\N	gärten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7018	gast	{guest}	{"Wir haben oft Gäste zu Besuch.","Der Gast schläft im Gästezimmer."}	1	30	1	\N	gäste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7019	geld	{money}	{"Die Kaution kostet viel Geld.","Wir sparen Geld für die neue Wohnung."}	1	30	3	\N	gelder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7020	gemütlich	{comfortable}	{"Das Wohnzimmer ist sehr gemütlich.","Gemütliche Möbel sind wichtig."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7021	gepflegt	{"looked after"}	{"Der Garten ist gut gepflegt.","Eine gepflegte Wohnung findet man schnell."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7022	gerät	{appliance}	{"Das Gerät ist kaputt.","Neue Geräte sparen Energie."}	1	30	3	\N	geräte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7023	geschäft	{business}	{"Das Geschäft liegt im Erdgeschoss.","Ein eigenes Geschäft zu führen, ist schwer."}	1	30	3	\N	geschäfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7024	gespräch	{interview}	{"Das Gespräch mit dem Vermieter war gut.","Ein wichtiges Gespräch steht an."}	1	30	3	\N	gespräche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7025	größe	{size}	{"Die Größe der Wohnung passt perfekt.","Welche Größe hat das Schlafzimmer?"}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7026	grün	{green}	{"Die grünen Wände sind beruhigend.","Ein grüner Teppich liegt im Flur."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7027	hängen	{"to hang"}	{"Die Bilder hängen schief.","Wir hängen neue Vorhänge auf."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7028	hässlich	{ugly}	{"Die Farbe ist wirklich hässlich.","Ein hässlicher Teppich liegt im Flur."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7029	hauptsache	{"main thing"}	{"Die Hauptsache ist, die Wohnung ist sauber.","Hauptsache, die Heizung funktioniert."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7030	haus	{house}	{"Das Haus hat drei Stockwerke.","Ein altes Haus hat Charme."}	1	30	3	\N	häuser	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7031	haustier	{pet}	{"Haustiere sind in dieser Wohnung erlaubt.","Unser Haustier ist eine Katze."}	1	30	3	\N	haustiere	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7032	heizung	{heating}	{"Die Heizung ist im Winter wichtig.","Die Heizung macht seltsame Geräusche."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7033	helfen	{"to help"}	{"Kannst du mir beim Umzug helfen?","Der Nachbar hilft gerne."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7034	hell	{light}	{"Das Zimmer ist hell und freundlich.","Helle Farben machen den Raum größer."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7035	herd	{stove}	{"Der Herd ist elektrisch.","Ein neuer Herd kostet viel Geld."}	1	30	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7036	hilfe	{help}	{"Brauchen Sie Hilfe beim Tragen?","Hilfe bei Reparaturen ist willkommen."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7037	hinten	{behind}	{"Hinten ist ein kleiner Garten.","Das Bad liegt hinten im Flur."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7038	hochhaus	{"high-rise building"}	{"Das Hochhaus hat 20 Stockwerke.","In einem Hochhaus wohnen viele Menschen."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7039	immobilie	{property}	{"Die Immobilie ist gut erhalten.","Er kauft eine teure Immobilie."}	1	30	2	\N	immobilien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7040	insgesamt	{"in total"}	{"Insgesamt kostet die Wohnung 1000 Euro.","Insgesamt sind drei Zimmer vorhanden."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7041	interessant	{interesting}	{"Die Wohnung ist sehr interessant.","Interessante Angebote sind selten."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7042	jeder	{every}	{"Jeder Raum hat ein Fenster.","Jede Wohnung hat Vor- und Nachteile."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7043	juni	{June}	{"Im Juni ziehen wir um.","Der Juni ist ein guter Monat für den Umzug."}	1	30	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7044	kaffeemaschine	{"coffee machine"}	{"Die Kaffeemaschine ist kaputt.","Eine neue Kaffeemaschine steht in der Küche."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7045	kalt	{cold}	{"Im Winter ist das Zimmer kalt.","Kalte Räume brauchen gute Heizungen."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7046	kaution	{deposit}	{"Die Kaution beträgt drei Monatsmieten.","Die Kaution bekommt man beim Auszug zurück."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7047	keller	{cellar}	{"Der Keller ist trocken und groß.","Im Keller lagern wir alte Möbel."}	1	30	1	\N	keller	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7048	kinderzimmer	{"child's room"}	{"Das Kinderzimmer ist bunt gestrichen.","Ein eigenes Kinderzimmer ist wichtig."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7049	kleiderschrank	{wardrobe}	{"Der Kleiderschrank ist voll.","Ein großer Kleiderschrank passt nicht ins Zimmer."}	1	30	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7050	küche	{kitchen}	{"Die Küche ist modern eingerichtet.","Eine offene Küche ist praktisch."}	1	30	2	\N	küchen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7051	kühlschrank	{fridge}	{"Der Kühlschrank ist laut.","Ein neuer Kühlschrank spart Energie."}	1	30	1	\N	kühlschränke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7052	lang	{long}	{"Der Flur ist sehr lang.","Lange Wartezeiten sind frustrierend."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7053	lassen	{"to let"}	{"Wir lassen die Reparatur machen.","Der Vermieter lässt uns den Garten nutzen."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7054	laut	{loud}	{"Die Nachbarn sind zu laut.","Lauter Verkehr stört die Ruhe."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7055	liebsten	{favourite}	{"Am liebsten wohne ich in der Stadt.","Wir möchten am liebsten einen Balkon."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7056	liegen	{"to lie"}	{"Die Wohnung liegt zentral.","Der Schlüssel liegt auf dem Tisch."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7057	maximal	{maximal}	{"Die Miete ist maximal 800 Euro.","Maximal zwei Personen können hier wohnen."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7058	mehrfamilienhaus	{"apartment building"}	{"Das Mehrfamilienhaus hat acht Parteien.","In einem Mehrfamilienhaus gibt es Nachbarn."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7059	miete	{rent}	{"Die Miete ist jeden Monat fällig.","Hohe Mieten sind ein Problem."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7061	möbel	{furniture}	{"Die Möbel sind schon alt.","Neue Möbel passen nicht ins Budget."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7062	möbliert	{furnished}	{"Die Wohnung ist möbliert.","Möblierte Wohnungen sind teurer."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7063	modern	{modern}	{"Die Küche ist modern ausgestattet.","Moderne Fenster isolieren gut."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7064	monat	{month}	{"Der Monat hat 30 Tage.","Die Miete pro Monat ist hoch."}	1	30	1	\N	monate	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7065	monatsmiete	{"monthly rent"}	{"Die Monatsmiete beträgt 900 Euro.","Drei Monatsmieten sind als Kaution fällig."}	1	30	2	\N	monatsmieten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7066	müll	{rubbish}	{"Der Müll wird zweimal pro Woche abgeholt.","Müll trennen ist wichtig."}	1	30	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7067	neben	{"next to"}	{"Neben dem Haus ist ein Park.","Die Garage steht neben dem Eingang."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7068	nebenkosten	{"additional costs"}	{"Die Nebenkosten sind nicht inklusive.","Hohe Nebenkosten überraschen oft."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7069	ohne	{without}	{"Ohne Kaution geht es nicht.","Eine Wohnung ohne Balkon kommt nicht in Frage."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7070	obergeschoss	{"upper floor"}	{"Das Schlafzimmer liegt im Obergeschoss.","Im Obergeschoss ist es ruhiger."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7071	ort	{place}	{"Der Ort ist sehr ruhig.","Ein guter Ort zum Wohnen ist wichtig."}	1	30	1	\N	orte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7072	pflanze	{plant}	{"Die Pflanze im Wohnzimmer ist groß.","Pflanzen machen die Wohnung gemütlich."}	1	30	2	\N	pflanzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7073	plan	{plan}	{"Der Plan zeigt die Zimmeraufteilung.","Ein guter Plan hilft beim Umzug."}	1	30	1	\N	pläne	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7074	platz	{"place, space"}	{"Hier ist genug Platz für einen Tisch.","Ein Parkplatz ist schwer zu finden."}	1	30	1	\N	plätze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7075	quadratmeter	{"square metre"}	{"Die Wohnung hat 80 Quadratmeter.","Pro Quadratmeter kostet es 15 Euro."}	1	30	1	\N	quadratmeter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7076	regal	{shelves}	{"Das Regal ist voller Bücher.","Ein großes Regal passt an die Wand."}	1	30	3	\N	regale	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7077	reihenhaus	{"terraced house"}	{"Das Reihenhaus hat einen kleinen Garten.","Reihenhäuser sind oft günstiger."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7078	ruhig	{peaceful}	{"Die Wohnung liegt in einer ruhigen Straße.","Ein ruhiger Ort zum Schlafen ist wichtig."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8689	aktiv	{active}	{"Er ist sportlich und sehr aktiv, weil er jeden Tag trainiert.","Ich bleibe auch im Winter aktiv, indem ich Ski fahre oder schwimme."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7080	schlafzimmer	{bedroom}	{"Das Schlafzimmer ist im ersten Stock.","Ein großes Schlafzimmer ist ein Luxus."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7081	schmal	{narrow}	{"Der Flur ist zu schmal.","Ein schmaler Balkon ist nicht nutzbar."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7082	schrank	{cupboard}	{"Der Schrank ist aus Holz.","Ein neuer Schrank passt nicht ins Zimmer."}	1	30	1	\N	schränke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7083	sessel	{chair}	{"Der Sessel ist sehr bequem.","Zwei Sessel stehen im Wohnzimmer."}	1	30	1	\N	sessel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7084	singen	{"to sing"}	{"Die Nachbarn singen laut.","Beim Putzen singe ich gerne."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7085	sitzen	{"to sit"}	{"Wir sitzen gerne auf dem Balkon.","Im Wohnzimmer sitzen wir gemütlich."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7086	sofa	{sofa}	{"Das Sofa ist neu und bequem.","Ein rotes Sofa steht im Wohnzimmer."}	1	30	3	\N	sofas	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7087	sofort	{"straight away"}	{"Die Wohnung muss sofort bezogen werden.","Sofortige Reparaturen sind nötig."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7088	sollen	{"to be supposed to"}	{"Sollen wir den Vertrag unterschreiben?","Was sollen wir als Nächstes tun?"}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7156	fallen	{"to fall"}	{"Der Schnee fällt langsam.","Pass auf, dass du nicht fällst!"}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7089	sonderangebot	{"special offer"}	{"Das Sonderangebot ist nur heute gültig.","Ein Sonderangebot für Studenten."}	1	30	3	\N	sonderangebote	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7090	sonne	{sun}	{"Die Sonne scheint ins Wohnzimmer.","Viel Sonne macht die Wohnung hell."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7091	sonstiges	{other}	{"Sonstige Kosten sind nicht enthalten.","Gibt es sonstiges Interesse?"}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7092	sprachschule	{"language school"}	{"Die Sprachschule ist in der Nähe.","Eine gute Sprachschule ist wichtig."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7093	spülen	{"to rinse"}	{"Wir spülen das Geschirr in der Spülmaschine.","Die Spüle in der Küche ist neu."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7094	spülmaschine	{dishwasher}	{"Die Spülmaschine ist defekt.","Eine Spülmaschine spart Zeit."}	1	30	2	\N	spülmaschinen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7095	stadt	{city}	{"Die Stadt ist laut und lebendig.","In der Stadt sind die Mieten hoch."}	1	30	2	\N	städte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7096	suchen	{"to look for"}	{"Wir suchen eine Dreizimmerwohnung.","Er sucht dringend einen Mitbewohner."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7097	super	{super}	{"Die Wohnung ist super gelegen.","Ein super Angebot für Studenten."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7098	teppich	{carpet}	{"Der Teppich ist aus Wolle.","Ein weicher Teppich liegt im Wohnzimmer."}	1	30	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7099	terrasse	{terrace}	{"Die Terrasse ist überdacht.","Auf der Terrasse steht ein Tisch."}	1	30	2	\N	terrassen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7100	toilette	{toilet}	{"Die Toilette ist separat.","Eine saubere Toilette ist wichtig."}	1	30	2	\N	toiletten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7101	toll	{great}	{"Die Wohnung ist wirklich toll.","Ein toller Ausblick vom Balkon."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7102	traumwohnung	{"dream flat"}	{"Endlich haben wir unsere Traumwohnung gefunden.","Eine Traumwohnung mit Garten."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7103	unbedingt	{definitely}	{"Wir wollen unbedingt einen Balkon.","Unbedingt vor dem Einzug renovieren."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7104	ungemütlich	{uncomfortable}	{"Das Zimmer ist ungemütlich dunkel.","Ungemütliche Möbel machen den Raum kalt."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7105	unser	{our}	{"Unser neuer Nachbar ist nett.","Unsere Wohnung hat viel Licht."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7106	warum	{why}	{"Warum ist die Miete so hoch?","Warum haben Sie diese Wohnung gewählt?"}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7107	waschen	{"to wash"}	{"Wir waschen die Kleidung in der Waschmaschine.","Die Badewanne muss gewaschen werden."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7108	waschmaschine	{"washing machine"}	{"Die Waschmaschine ist kaputt.","Eine neue Waschmaschine ist teuer."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7109	wc	{WC/toilet}	{"Das WC ist im Flur.","Ein separates WC ist praktisch."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7110	wegziehen	{"to move away"}	{"Wir müssen leider wegziehen.","Warum ziehst du weg?"}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7111	weiter	{further}	{"Weiter hinten ist ein Parkplatz.","Weitere Informationen sind nötig."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7112	wenn	{if/when}	{"Wenn die Wohnung frei ist, melden Sie sich.","Wenn es regnet, ist der Balkon nass."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7113	werden	{"to become"}	{"Die Miete wird nächsten Monat erhöht.","Was wird aus der alten Wohnung?"}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7114	wichtig	{important}	{"Ein ruhiges Zimmer ist mir wichtig.","Wichtige Dokumente müssen unterschrieben werden."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6685	wohnen	{"to live"}	{"Wir wohnen seit fünf Jahren hier.","Wo möchtest du wohnen?"}	1	26	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7115	wohnungsanzeige	{"flat advertisement"}	{"Die Wohnungsanzeige ist online.","Eine gute Wohnungsanzeige enthält Fotos."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7116	wohnungssuche	{"search for housing"}	{"Die Wohnungssuche ist stressig.","Viel Erfolg bei der Wohnungssuche!"}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7117	wohnzimmer	{"living room"}	{"Das Wohnzimmer ist groß und hell.","Im Wohnzimmer steht ein großer Tisch."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7118	wunderschön	{"very beautiful"}	{"Die Aussicht ist wunderschön.","Ein wunderschöner Garten gehört dazu."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7119	wünschen	{"to wish"}	{"Wir wünschen uns einen Garten.","Was wünschst du dir für die neue Wohnung?"}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7120	zahlen	{"to count"}	{"Wir zahlen die Miete pünktlich.","Die Nebenkosten werden monatlich gezahlt."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7121	zeitung	{newspaper}	{"Die Zeitung hat viele Wohnungsanzeigen.","Ich lese die Zeitung jeden Morgen."}	1	30	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7122	zentrum	{centre}	{"Die Wohnung liegt im Zentrum.","Das Zentrum ist laut, aber praktisch."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7123	zimmer	{room}	{"Die Wohnung hat drei Zimmer.","Ein helles Zimmer ist wichtig."}	1	30	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7124	zu fuß	{"on foot"}	{"Die Schule ist zu Fuß erreichbar.","Zu Fuß zum Supermarkt sind es fünf Minuten."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7125	ampel	{"traffic lights"}	{"Die Ampel zeigt jetzt Rot.","An der Ampel müssen wir warten."}	1	31	2	\N	ampeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7126	ankunftszeit	{"arrival time"}	{"Die Ankunftszeit des Zuges ist 15 Uhr.","Die Ankunftszeit steht auf dem Schild."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7127	ansage	{announcement}	{"Die Ansage im Bahnhof war laut.","Hast du die Ansage verstanden?"}	1	31	2	\N	ansagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7128	apotheke	{pharmacy}	{"Die Apotheke ist um die Ecke.","In der Apotheke kaufe ich Medikamente."}	1	31	2	\N	apotheken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7129	arzt	{doctor}	{"Der Arzt arbeitet im Krankenhaus.","Ich habe einen Termin beim Arzt."}	1	31	1	\N	ärzte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7130	ärztin	{"female doctor"}	{"Die Ärztin ist sehr freundlich.","Meine Ärztin heißt Frau Müller."}	1	31	2	\N	ärztinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7131	auskunft	{information}	{"Die Auskunft am Bahnhof hilft mir.","Ich frage nach einer Auskunft."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7132	außerdem	{also}	{"Außerdem brauche ich noch eine Fahrkarte.","Das Café ist schön, außerdem günstig."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7133	außerplanmäßig	{unscheduled}	{"Der Zug hält außerplanmäßig hier.","Es gibt eine außerplanmäßige Verspätung."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7134	auto	{car}	{"Das Auto parkt vor dem Haus.","Wir fahren mit dem Auto in die Stadt."}	1	31	3	\N	autos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7135	bahn	{train}	{"Die Bahn fährt pünktlich ab.","Ich nehme die Bahn zur Arbeit."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7136	bahnhof	{"train station"}	{"Der Bahnhof ist sehr groß.","Wir treffen uns am Bahnhof."}	1	31	1	\N	bahnhöfe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7137	ball	{ball}	{"Der Ball rollt auf die Straße.","Kinder spielen mit einem Ball."}	1	31	1	\N	bälle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7138	bank	{bank}	{"Die Bank öffnet um 9 Uhr.","Ich gehe zur Bank, um Geld abzuheben."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7139	bezahlen	{"to pay"}	{"Ich bezahle mit Karte.","Wir müssen noch die Rechnung bezahlen."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7140	bibliothek	{library}	{"Die Bibliothek hat viele Bücher.","In der Bibliothek ist es ruhig."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7141	bürgerbüro	{"local city office"}	{"Im Bürgerbüro beantrage ich einen Ausweis.","Das Bürgerbüro ist heute geschlossen."}	1	31	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7142	bus	{bus}	{"Der Bus kommt in fünf Minuten.","Ich fahre mit dem Bus zur Schule."}	1	31	1	\N	busse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7143	bushaltestelle	{"bus stop"}	{"An der Bushaltestelle warten viele Menschen.","Die Bushaltestelle ist neben dem Supermarkt."}	1	31	2	\N	bushaltestellen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7144	café	{café}	{"Im Café trinke ich einen Kaffee.","Das Café hat leckeren Kuchen."}	1	31	3	\N	cafés	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7145	dafür	{"for that"}	{"Dafür brauche ich mehr Zeit.","Ich habe kein Geld dafür."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7146	dritte	{third}	{"Die dritte Straße links führt zum Park.","Er wohnt im dritten Stock."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7147	durchsage	{announcement}	{"Die Durchsage war leise.","Es gab eine wichtige Durchsage im Zug."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7148	einfach	{easy}	{"Die Aufgabe ist einfach.","Einfach geradeaus gehen!"}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7149	einzelfahrkarte	{"single ticket"}	{"Ich kaufe eine Einzelfahrkarte.","Die Einzelfahrkarte gilt für eine Stunde."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7150	erste	{first}	{"Die erste Haltestelle ist am Markt.","Erste Hilfe leisten ist wichtig."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7151	erwachsene	{adult}	{"Erwachsene zahlen mehr Eintritt.","Kinder und Erwachsene sind willkommen."}	1	31	1	\N	erwachsenen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7152	fahren	{"to travel"}	{"Wir fahren mit dem Zug.","Er fährt jeden Tag zur Arbeit."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7153	fahrgast	{passenger}	{"Der Fahrgast verließ den Bus.","Alle Fahrgäste müssen aussteigen."}	1	31	1	\N	fahrgäste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7154	fahrkarte	{"travel ticket"}	{"Die Fahrkarte kostet 2,50 Euro.","Hast du deine Fahrkarte dabei?"}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7155	fahrrad	{bicycle}	{"Das Fahrrad steht vor dem Haus.","Ich fahre gerne mit dem Fahrrad."}	1	31	3	\N	fahrräder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7157	fast	{nearly}	{"Es ist fast 12 Uhr.","Ich habe fast keine Zeit mehr."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7158	flughafen	{airport}	{"Der Flughafen ist weit entfernt.","Wir fahren zum Flughafen mit dem Taxi."}	1	31	1	\N	flughäfen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7159	gebäude	{building}	{"Das Gebäude hat zehn Stockwerke.","Das rote Gebäude ist ein Museum."}	1	31	3	\N	gebäude	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7160	geben	{"to give"}	{"Kannst du mir die Fahrkarte geben?","Er gibt mir einen Stadtplan."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7161	gegenüber	{opposite}	{"Das Café ist gegenüber der Bank.","Gegenüber dem Park steht ein Hotel."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7162	geradeaus	{"straight ahead"}	{"Gehen Sie geradeaus bis zur Ampel.","Geradeaus findest du den Bahnhof."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7163	gleis	{platform}	{"Der Zug fährt von Gleis 3 ab.","Auf welchem Gleis ist der ICE?"}	1	31	3	\N	gleise	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7164	gültig	{valid}	{"Die Fahrkarte ist noch gültig.","Der Ausweis ist nicht mehr gültig."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7165	halten	{"to stop"}	{"Der Bus hält an der nächsten Haltestelle.","Bitte halten Sie hier an."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7166	haltestelle	{stop/station}	{"An der Haltestelle warten viele Leute.","Die nächste Haltestelle ist der Markt."}	1	31	2	\N	haltestellen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7167	hauptbahnhof	{"main train station"}	{"Der Hauptbahnhof ist sehr groß.","Vom Hauptbahnhof fahren Züge in alle Richtungen."}	1	31	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7168	hinter	{behind}	{"Das Auto steht hinter dem Haus.","Hinter dem Bahnhof ist ein Park."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7169	hotel	{hotel}	{"Das Hotel liegt in der Innenstadt.","Wir übernachten in einem Hotel."}	1	31	3	\N	hotels	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7170	informationsschalter	{"information desk"}	{"Am Informationsschalter bekomme ich Hilfe.","Der Informationsschalter ist besetzt."}	1	31	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7171	intercity (ic)	{intercity}	{"Der Intercity fährt schneller als Regionalzüge.","Ich nehme den IC nach Berlin."}	1	31	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7172	jobcenter	{"job centre"}	{"Das Jobcenter hilft bei der Arbeitssuche.","Ich habe einen Termin im Jobcenter."}	1	31	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7173	kino	{cinema}	{"Das Kino zeigt einen neuen Film.","Wir gehen heute Abend ins Kino."}	1	31	3	\N	kinos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7174	kirche	{church}	{"Die Kirche hat einen hohen Turm.","Die Kirche ist 500 Jahre alt."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7175	krankenhaus	{hospital}	{"Das Krankenhaus ist rund um die Uhr geöffnet.","Sie arbeitet im Krankenhaus als Pflegerin."}	1	31	3	\N	krankenhäuser	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7176	krankenkasse	{"health insurance"}	{"Meine Krankenkasse übernimmt die Kosten.","Die Krankenkasse schickt eine Bestätigung."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7177	kreuzung	{crossroads}	{"An der Kreuzung ist eine Ampel.","Die Kreuzung ist sehr gefährlich."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7178	kurzstrecke	{short-haul}	{"Die Kurzstrecke kostet weniger.","Für die Kurzstrecke brauche ich kein Ticket."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7179	linie	{line}	{"Die Linie 5 fährt zum Zentrum.","Welche Linie geht zum Flughafen?"}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7180	links	{left}	{"Biegen Sie links ab.","Das Museum ist auf der linken Seite."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7181	lösung	{solution}	{"Die Lösung des Problems ist einfach.","Hast du eine Lösung für den Weg?"}	1	31	2	\N	lösungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7182	meter	{metre}	{"Der Weg ist 100 Meter lang.","Der Tisch ist einen Meter breit."}	1	31	1	\N	meter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7183	metzger	{butcher}	{"Der Metzger verkauft frisches Fleisch.","Beim Metzger kaufe ich Wurst."}	1	31	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7184	minute	{minute}	{"Der Bus kommt in fünf Minuten.","Eine Minute hat sechzig Sekunden."}	1	31	2	\N	minuten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7185	mobilität	{mobility}	{"Mobilität ist in der Stadt wichtig.","Öffentliche Verkehrsmittel fördern die Mobilität."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7186	motorrad	{motorcycle}	{"Das Motorrad ist laut.","Er fährt gerne mit dem Motorrad."}	1	31	3	\N	motorräder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7188	nächster	{next}	{"Der nächste Bus kommt um 10 Uhr.","Die nächste Haltestelle ist der Markt."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7189	nichts	{nothing}	{"Hier gibt es nichts zu sehen.","Ich habe nichts vergessen."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7190	öffentlich	{public}	{"Öffentliche Verkehrsmittel sind praktisch.","Der Park ist öffentlich zugänglich."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7224	voll	{full}	{"Der Bus ist voll.","Der Parkplatz ist voll."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7191	orientierung	{orientation}	{"Eine Karte hilft bei der Orientierung.","Ich habe keine gute Orientierung."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7192	park	{park}	{"Der Park ist grün und ruhig.","Im Park spielen viele Kinder."}	1	31	1	\N	parks	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7193	parkgebühr	{"parking fee"}	{"Die Parkgebühr beträgt 2 Euro pro Stunde.","Parkgebühren sind hier teuer."}	1	31	2	\N	parkgebühren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7194	parkplatz	{"car park"}	{"Der Parkplatz ist voll.","Ich suche einen freien Parkplatz."}	1	31	1	\N	parkplätze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7195	polizei	{police}	{"Die Polizei hilft bei Unfällen.","Rufen Sie die Polizei im Notfall!"}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7196	position	{position}	{"Meine Position auf der Karte ist hier.","Die genaue Position finde ich nicht."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7197	post	{"post office"}	{"Die Post schließt um 18 Uhr.","Ich gehe zur Post, um ein Paket abzuholen."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7198	praktisch	{practical}	{"Das ist eine praktische Tasche.","Öffentliche Verkehrsmittel sind praktisch."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7199	rechts	{right}	{"Biegen Sie rechts ab.","Das Café ist auf der rechten Seite."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7200	rathaus	{"city hall"}	{"Das Rathaus ist im Stadtzentrum.","Vor dem Rathaus findet ein Markt statt."}	1	31	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7201	regionalbahn	{"regional train"}	{"Die Regionalbahn hält an kleinen Bahnhöfen.","Die Regionalbahn ist langsamer als der ICE."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7202	restaurant	{restaurant}	{"Das Restaurant serviert italienisches Essen.","Wir essen heute im Restaurant."}	1	31	3	\N	restaurants	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7203	ruhe	{quiet}	{"Im Park herrscht Ruhe.","Bitte Ruhe im Wartezimmer!"}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7204	schienenersatzverkehr	{"replacement bus service"}	{"Wegen Bauarbeiten gibt es Schienenersatzverkehr.","Der Schienenersatzverkehr hält am Bahnhof."}	1	31	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7205	schwimmbad	{"swimming pool"}	{"Das Schwimmbad ist im Sommer beliebt.","Wir gehen heute ins Schwimmbad."}	1	31	3	\N	schwimmbäder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7206	selten	{rarely}	{"Busse fahren hier selten.","Ich komme selten in die Stadt."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7207	sowieso	{anyway}	{"Ich gehe sowieso in die Stadt.","Das ist sowieso zu teuer."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7208	später	{later}	{"Wir treffen uns später am Bahnhof.","Später habe ich mehr Zeit."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7209	stadtplan	{"city map"}	{"Der Stadtplan zeigt alle Sehenswürdigkeiten.","Kannst du mir einen Stadtplan geben?"}	1	31	1	\N	stadtpläne	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7210	stadtwald	{"city forest"}	{"Der Stadtwald ist ein beliebtes Ausflugsziel.","Im Stadtwald kann man gut spazieren gehen."}	1	31	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8690	alkohol	{alcohol}	{"Alkohol ist in dieser Einrichtung verboten, weil er Probleme verursachen kann.","Er trinkt nur selten Alkohol, obwohl seine Freunde es oft tun."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7212	straßenbahn	{tram}	{"Die Straßenbahn fährt durch die Innenstadt.","Die Straßenbahnlinie 10 ist neu."}	1	31	2	\N	straßenbahnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7213	tageskarte	{"day ticket"}	{"Eine Tageskarte ist günstiger.","Mit der Tageskarte kann man den ganzen Tag fahren."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7214	taxi	{taxi}	{"Das Taxi wartet vor dem Hotel.","Ich nehme ein Taxi zum Flughafen."}	1	31	3	\N	taxis	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7215	überall	{everywhere}	{"In der Stadt gibt es überall Läden.","Überall liegt Müll herum."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7218	unter	{under}	{"Die U-Bahn fährt unter der Erde.","Unter der Brücke ist ein Fluss."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7216	umsteigen	{"to change"}	{"Wir müssen in Frankfurt umsteigen.","Wo steige ich um?"}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7217	ungefähr	{around}	{"Die Kosten betragen ungefähr 5.000 Euro.","Das Meeting dauert ungefähr zwei Stunden."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7219	verfügung	{availability}	{"Das Auto steht zur Verfügung.","Steht ein Fahrplan zur Verfügung?"}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7220	verkehrsmittel	{"means of transport"}	{"Bus und Bahn sind umweltfreundliche Verkehrsmittel.","Welches Verkehrsmittel nutzt du?"}	1	31	3	\N	verkehrsmittel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7221	verstanden	{understood}	{"Haben Sie alles verstanden?","Ich habe die Ansage nicht verstanden."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7222	verzögern	{"to hesitate"}	{"Der Zug verzögert sich um zehn Minuten.","Bitte verzögern Sie nicht die Abfahrt."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7223	volkshochschule (vhs)	{"adult education centre"}	{"Die Volkshochschule bietet Sprachkurse an.","Ich lerne Deutsch an der VHS."}	1	31	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7225	vorbei	{past/over}	{"Gehen Sie an der Kirche vorbei.","Die Zeit ist schnell vorbei."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7226	vorne	{"at the front"}	{"Vorne sitzen ältere Menschen.","Der Eingang ist vorne links."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8691	angenehm	{pleasant}	{"Das Wetter ist heute sehr angenehm, sodass wir spazieren gehen können.","Ich wünsche Ihnen einen angenehmen Tag, obwohl es später regnen soll."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7228	weg	{path}	{"Der Weg zum Bahnhof ist kurz.","Ein schmaler Weg führt durch den Park."}	1	31	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7229	winter	{winter}	{"Im Winter ist es früh dunkel.","Der Winter in Deutschland ist kalt."}	1	31	1	\N	winter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7230	wochenmarkt	{"weekly market"}	{"Auf dem Wochenmarkt kaufe ich Obst.","Der Wochenmarkt findet jeden Samstag statt."}	1	31	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7231	wohin	{"where to"}	{"Wohin fährt dieser Bus?","Wohin gehst du jetzt?"}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7232	wollen	{"to want"}	{"Wir wollen mit dem Zug fahren.","Was wollen Sie kaufen?"}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7233	zug	{train}	{"Der Zug nach München fährt ab Gleis 5.","Der Zug hat Verspätung."}	1	31	1	\N	züge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7234	zweimal	{twice}	{"Ich fahre zweimal pro Woche in die Stadt.","Zweimal links abbiegen, dann sind Sie da."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7235	zweite	{second}	{"Die zweite Haltestelle ist der Marktplatz.","Er wohnt im zweiten Stock."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7236	zwischen	{between}	{"Der Park liegt zwischen dem Bahnhof und dem Rathaus.","Zwischen den Häusern gibt es einen kleinen Weg."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7237	anfangen	{"to start"}	{"Wir fangen um 9 Uhr mit der Arbeit an.","Wann fängt der Kurs an?"}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7238	arbeitstag	{"work day"}	{"Mein Arbeitstag endet um 17 Uhr.","Ein langer Arbeitstag ist anstrengend."}	1	32	1	\N	arbeitstage	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7240	ausfüllen	{"to fill out"}	{"Bitte füllen Sie das Formular aus.","Ich muss noch den Antrag ausfüllen."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7241	aushilfe	{"temporary worker"}	{"Sie arbeitet als Aushilfe im Café.","Aushilfen werden im Sommer gesucht."}	1	32	2	\N	aushilfen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7242	automechaniker	{"car mechanic (male)"}	{"Der Automechaniker repariert Motoren.","Automechaniker brauchen Werkzeuge."}	1	32	1	\N	automechaniker	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7243	automechanikerin	{"car mechanic (female)"}	{"Die Automechanikerin ist sehr geschickt.","Sie ist die beste Automechanikerin hier."}	1	32	2	\N	automechanikerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7244	backen	{"to bake"}	{"Wir backen Brot für das Frühstück.","Sie backt gerne Plätzchen."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7245	bäcker	{"baker (male)"}	{"Der Bäcker verkauft frische Brötchen.","Bäcker arbeiten oft nachts."}	1	32	1	\N	bäcker	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7246	bäckerin	{"baker (female)"}	{"Die Bäckerin macht leckere Kuchen.","Sie ist eine bekannte Bäckerin."}	1	32	2	\N	bäckerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7247	bald	{soon}	{"Ich beginne bald meine neue Stelle.","Bald gibt es eine Besprechung."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7248	berichten	{"to report"}	{"Er berichtet über das Projekt.","Die Journalistin berichtet live."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7249	beruf	{profession}	{"Mein Beruf ist sehr abwechslungsreich.","Welchen Beruf übst du aus?"}	1	32	1	\N	berufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7250	beruflich	{professional}	{"Das ist eine berufliche Weiterbildung.","Beruflich bin ich viel unterwegs."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7251	bürokauffrau	{"office clerk (female)"}	{"Die Bürokauffrau organisiert die Post.","Sie arbeitet als Bürokauffrau."}	1	32	2	\N	bürokauffrauen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7252	bürokaufmann	{"office clerk (male)"}	{"Der Bürokaufmann schreibt Rechnungen.","Bürokaufmänner arbeiten im Büro."}	1	32	1	\N	bürokaufmänner	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7253	chef	{"boss (male)"}	{"Der Chef ist heute nicht da.","Unser Chef ist sehr fair."}	1	32	1	\N	chefs	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7254	chefin	{"boss (female)"}	{"Die Chefin leitet das Meeting.","Unsere Chefin ist sehr kompetent."}	1	32	2	\N	chefinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7255	computerprogramm	{"computer program"}	{"Das Computerprogramm lädt langsam.","Er entwickelt ein neues Computerprogramm."}	1	32	3	\N	computerprogramme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7256	computersystem	{"computer system"}	{"Das Computersystem ist sicher.","Wir modernisieren das Computersystem."}	1	32	3	\N	computersysteme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7257	dauern	{"to last"}	{"Die Sitzung dauert eine Stunde.","Wie lange dauert der Kurs?"}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7258	dreimal	{"three times"}	{"Ich rufe dreimal täglich Kunden an.","Dreimal pro Woche gehe ich ins Fitnessstudio."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7259	fahrer	{driver}	{"Der Fahrer liefert Pakete aus.","Busfahrer haben einen anstrengenden Job."}	1	32	1	\N	fahrer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7260	fangen	{"to catch"}	{"Wir fangen um 7 Uhr an.","Der Hund fängt den Ball."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7261	feierabend	{"end of workday"}	{"Um 18 Uhr habe ich Feierabend.","Nach Feierabend gehe ich einkaufen."}	1	32	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7263	fotografieren	{"to photograph"}	{"Ich fotografiere für eine Zeitschrift.","Er fotografiert gerne Landschaften."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8692	annulliert	{cancelled}	{"Der Flug wurde annulliert, weil der Pilotenstreik andauert.","Die Buchung wurde vom Hotel annulliert, obwohl wir schon bezahlt hatten."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7265	führerschein	{"driver's license"}	{"Ich habe meinen Führerschein bestanden.","Ohne Führerschein darf man nicht fahren."}	1	32	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7266	fußballspieler	{"football player"}	{"Der Fußballspieler trainiert täglich.","Fußballspieler verdienen viel Geld."}	1	32	1	\N	fußballspieler	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7267	gitarre	{guitar}	{"Er spielt Gitarre in einer Band.","Die Gitarre ist sein Hobby."}	1	32	2	\N	gitarren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7268	halbtags	{part-time}	{"Sie arbeitet halbtags im Büro.","Halbtags zu arbeiten ist entspannter."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7269	hausfrau	{housewife}	{"Die Hausfrau kocht für die Familie.","Sie ist gerne Hausfrau."}	1	32	2	\N	hausfrauen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7270	hausmann	{househusband}	{"Der Hausmann kümmert sich um die Kinder.","Er ist stolzer Hausmann."}	1	32	1	\N	hausmänner	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7271	hund	{dog}	{"Der Hund begleitet den Postboten.","Hunde sind treue Tiere."}	1	32	1	\N	hunde	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7272	installieren	{"to install"}	{"Wir installieren neue Software.","Der Techniker installiert die Maschine."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7274	kaputt	{broken}	{"Der Drucker ist kaputt.","Mein Auto ist leider kaputt."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7275	kasse	{"cash register"}	{"Die Kasse schließt um 20 Uhr.","An der Kasse bezahle ich."}	1	32	2	\N	kassen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7276	kassierer	{"cashier (male)"}	{"Der Kassierer scannt die Artikel.","Kassierer arbeiten im Supermarkt."}	1	32	1	\N	kassierer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7277	kassiererin	{"cashier (female)"}	{"Die Kassiererin ist schnell.","Sie arbeitet als Kassiererin."}	1	32	2	\N	kassiererinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7278	kauffrau	{businesswoman}	{"Die Kauffrau verhandelt mit Kunden.","Sie ist eine erfolgreiche Kauffrau."}	1	32	2	\N	kauffrauen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7279	kellner	{waiter}	{"Der Kellner bringt die Speisekarte.","Kellner verdienen oft Trinkgeld."}	1	32	1	\N	kellner	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7280	kellnerin	{waitress}	{"Die Kellnerin serviert das Essen.","Sie arbeitet als Kellnerin im Restaurant."}	1	32	2	\N	kellnerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7281	klingeln	{"to ring"}	{"Das Telefon klingelt ständig.","Es klingelt an der Tür."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7282	koch	{"chef (male)"}	{"Der Koch bereitet das Menü zu.","Köche arbeiten in der Küche."}	1	32	1	\N	köche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7283	köchin	{"chef (female)"}	{"Die Köchin kreiert neue Gerichte.","Sie ist eine berühmte Köchin."}	1	32	2	\N	köchinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7284	kollege	{"colleague (male)"}	{"Mein Kollege hilft mir oft.","Die Kollegen feiern zusammen."}	1	32	1	\N	kollegen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7285	kollegin	{"colleague (female)"}	{"Meine Kollegin ist sehr nett.","Die Kolleginnen trinken Kaffee."}	1	32	2	\N	kolleginnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7286	konzert	{concert}	{"Das Konzert beginnt um 20 Uhr.","Wir besuchen ein Rockkonzert."}	1	32	3	\N	konzerte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7287	korrigieren	{"to correct"}	{"Der Lehrer korrigiert die Tests.","Bitte korrigieren Sie den Fehler."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7288	kraftfahrzeug (kfz)	{"motor vehicle"}	{"Das Kraftfahrzeug muss repariert werden.","KFZ-Mechaniker arbeiten an Autos."}	1	32	3	\N	kraftfahrzeuge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7289	krankenpfleger	{"nurse (male)"}	{"Der Krankenpfleger hilft den Patienten.","Krankenpfleger arbeiten im Schichtdienst."}	1	32	1	\N	krankenpfleger	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7290	krankenschwester	{"nurse (female)"}	{"Die Krankenschwester gibt Medikamente.","Sie ist eine erfahrene Krankenschwester."}	1	32	2	\N	krankenschwestern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7292	langweilig	{boring}	{"Der Vortrag war langweilig.","Langweilige Aufgaben mag niemand."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7293	leute (pl)	{people}	{"Viele Leute arbeiten im Büro.","Die Leute hier sind freundlich."}	1	32	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7294	mathematik	{mathematics}	{"Mathematik ist mein Lieblingsfach.","Er studiert Mathematik an der Uni."}	1	32	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7295	mechaniker	{mechanic}	{"Der Mechaniker repariert Maschinen.","Mechaniker tragen Arbeitskleidung."}	1	32	1	\N	mechaniker	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7296	mensch	{person}	{"Jeder Mensch hat Stärken und Schwächen.","Menschen arbeiten in verschiedenen Berufen."}	1	32	1	\N	menschen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7297	mittagessen	{lunch}	{"Das Mittagessen ist um 12:30 Uhr.","Wir essen in der Kantine zu Mittag."}	1	32	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7298	moment	{moment}	{"Einen Moment, ich bin gleich fertig.","Im Moment habe ich viel zu tun."}	1	32	1	\N	momente	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7299	musiklehrer	{"music teacher (male)"}	{"Der Musiklehrer unterrichtet Klavier.","Musiklehrer arbeiten an Schulen."}	1	32	1	\N	musiklehrer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7300	musiklehrerin	{"music teacher (female)"}	{"Die Musiklehrerin singt mit den Schülern.","Sie ist eine talentierte Musiklehrerin."}	1	32	2	\N	musiklehrerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7301	nachtdienst	{"night shift"}	{"Der Nachtdienst beginnt um 22 Uhr.","Ärzte haben manchmal Nachtdienst."}	1	32	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7302	organisieren	{"to organize"}	{"Wir organisieren eine Firmenfeier.","Sie organisiert den Terminkalender."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7303	pizzafahrer	{"pizza delivery person (male)"}	{"Der Pizzafahrer liefert schnell.","Pizzafahrer brauchen ein Fahrrad."}	1	32	1	\N	pizzafahrer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7304	pizzeria	{pizzeria}	{"Die Pizzeria ist sehr beliebt.","In der Pizzeria gibt es leckere Pizza."}	1	32	2	\N	pizzerien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7305	pflege	{care}	{"Die Pflege von Patienten ist anspruchsvoll.","Er arbeitet in der Altenpflege."}	1	32	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7306	prüfen	{"to check"}	{"Der Lehrer prüft die Hausaufgaben.","Bitte prüfen Sie die Daten."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7307	pünktlich	{"on time"}	{"Pünktlich sein ist wichtig im Beruf.","Der Zug ist heute pünktlich."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7308	radio	{radio}	{"Im Auto höre ich Radio.","Das Radio spielt aktuelle Hits."}	1	32	3	\N	radios	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7309	rechnen	{"to calculate"}	{"Wir rechnen die Kosten aus.","Kaufleute müssen gut rechnen können."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7310	rentner	{"retiree (male)"}	{"Der Rentner genießt seine Freizeit.","Viele Rentner arbeiten ehrenamtlich."}	1	32	1	\N	rentner	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7311	reparatur	{repair}	{"Die Reparatur dauert zwei Tage.","Die Reparatur des Autos ist teuer."}	1	32	2	\N	reparaturen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7312	reparieren	{"to repair"}	{"Der Techniker repariert den Computer.","Ich repariere mein Fahrrad selbst."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7313	reporter	{reporter}	{"Der Reporter interviewt den Politiker.","Reporter berichten aus aller Welt."}	1	32	1	\N	reporter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7314	roman	{novel}	{"Der Autor schreibt einen neuen Roman.","Ich lese gerne historische Romane."}	1	32	1	\N	romane	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7315	schlimm	{bad}	{"Der Unfall war sehr schlimm.","Schlimme Fehler können teuer werden."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7316	schüler	{"student (male)"}	{"Der Schüler lernt für die Prüfung.","Schüler tragen Schuluniformen."}	1	32	1	\N	schüler	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7485	bequem	{comfortable}	{"Die Hose ist sehr bequem.","Bequeme Schuhe sind wichtig."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7317	schülerin	{"student (female)"}	{"Die Schülerin schreibt einen Aufsatz.","Schülerinnen und Schüler arbeiten zusammen."}	1	32	2	\N	schülerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7318	servieren	{"to serve"}	{"Der Kellner serviert das Essen.","Wir servieren Kaffee und Kuchen."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7319	stress	{stress}	{"Zu viel Stress ist ungesund.","Im Beruf gibt es oft Stress."}	1	32	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7320	student	{"student (male)"}	{"Der Student studiert Medizin.","Studenten wohnen oft in WGs."}	1	32	1	\N	studenten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7321	studentin	{"student (female)"}	{"Die Studentin schreibt ihre Thesis.","Viele Studentinnen arbeiten nebenbei."}	1	32	2	\N	studentinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7322	studieren	{"to study (university)"}	{"Ich studiere Wirtschaftswissenschaften.","Er studiert an einer renommierten Uni."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7323	taxifahrer	{"taxi driver (male)"}	{"Der Taxifahrer kennt die Stadt gut.","Taxifahrer arbeiten Tag und Nacht."}	1	32	1	\N	taxifahrer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7324	taxifahrerin	{"taxi driver (female)"}	{"Die Taxifahrerin fährt sicher.","Sie ist eine der wenigen Taxifahrerinnen."}	1	32	2	\N	taxifahrerinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7325	techniker	{technician}	{"Der Techniker repariert die Heizung.","Techniker sind gefragte Fachkräfte."}	1	32	1	\N	techniker	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7326	telefon	{telephone}	{"Das Telefon klingelt ständig.","Ich rufe dich später am Telefon an."}	1	32	3	\N	telefone	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7327	traumberuf	{"dream job"}	{"Mein Traumberuf ist Pilot.","Kinder haben oft ungewöhnliche Traumberufe."}	1	32	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7328	treffen	{"to meet"}	{"Wir treffen uns im Konferenzraum.","Ich treffe morgen einen Kunden."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7329	universität	{university}	{"Die Universität bietet viele Kurse an.","Er studiert an der Universität Berlin."}	1	32	2	\N	universitäten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7330	unterrichten	{"to teach"}	{"Sie unterrichtet Mathematik an einer Schule.","Lehrer unterrichten verschiedene Fächer."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7331	vielleicht	{maybe}	{"Vielleicht finde ich einen neuen Job.","Vielleicht kommt der Chef später."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7332	wählen	{"to choose"}	{"Wir wählen einen neuen Teamleiter.","Sie wählt einen Beruf im Gesundheitswesen."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7333	werkstatt	{workshop}	{"In der Werkstatt werden Autos repariert.","Die Werkstatt hat moderne Geräte."}	1	32	2	\N	werkstätten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7334	wiederhören	{"goodbye (on the phone)"}	{"Auf Wiederhören!","Sie verabschiedete sich mit Wiederhören."}	1	32	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7335	zuerst	{first}	{"Zuerst müssen wir das Problem lösen.","Zuerst kommt die Theorie, dann die Praxis."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7336	altenpflegeheim	{"old people's home"}	{"Meine Oma wohnt im Altenpflegeheim.","Das Altenpflegeheim ist sehr modern."}	1	33	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7337	anbei	{attached}	{"Bitte finden Sie die Dokumente anbei.","Ich habe die Fotos anbei gesendet."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7338	anrede	{speech}	{"Die Anrede im Brief war höflich.","Kennen Sie die richtige Anrede für Emails?"}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7339	arm	{arm}	{"Mein Arm tut weh.","Er hat sich den Arm gebrochen."}	1	33	1	\N	arme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7340	atmen	{"to breathe"}	{"Tief atmen hilft bei Stress.","Der Patient kann schwer atmen."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7341	auge	{eye}	{"Mein Auge juckt.","Der Arzt untersucht das Auge."}	1	33	3	\N	augen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7342	bauch	{stomach}	{"Ich habe Bauchschmerzen.","Der Bauch tut nach dem Essen weh."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7343	bein	{leg}	{"Mein Bein ist müde.","Sie hat sich am Bein verletzt."}	1	33	3	\N	beine	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7344	bauchschmerzen	{"stomach ache"}	{"Das Kind hat Bauchschmerzen.","Bei Bauchschmerzen trinke Tee."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7345	bescheid	{notice}	{"Sagen Sie mir Bescheid, wenn Sie Hilfe brauchen.","Ich gebe dir gleich Bescheid."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7346	besserung	{recovery}	{"Gute Besserung wünscht der Arzt.","Sie wünscht ihm schnelle Besserung."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7347	betreff	{"subject line"}	{"Der Betreff der Email ist wichtig.","Schreiben Sie den Betreff bitte kurz."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7348	bevor	{before}	{"Bevor Sie gehen, trinken Sie Wasser.","Bevor ich schlafe, lese ich."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7349	bleiben	{"to stay"}	{"Bleiben Sie bitte sitzen.","Ich bleibe heute zu Hause."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7350	brief	{letter}	{"Der Brief kommt per Post.","Ich schreibe einen Brief an den Arzt."}	1	33	1	\N	briefe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7351	briefteil	{"part of letter"}	{"Dieser Briefteil fehlt.","Der letzte Briefteil ist unterschrieben."}	1	33	1	\N	briefteile	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7352	brust	{chest}	{"Die Brust schmerzt beim Atmen.","Der Arzt hört die Brust ab."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7353	danach	{after}	{"Danach gehen wir nach Hause.","Was machst du danach?"}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7354	datum	{date}	{"Das Datum heute ist der 10. Mai.","Schreiben Sie das Datum auf den Brief."}	1	33	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7355	dürfen	{"to be allowed to"}	{"Darf ich hier sitzen?","Patienten dürfen nicht rauchen."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7356	ellbogen	{elbow}	{"Mein Ellbogen ist geschwollen.","Pass auf deinen Ellbogen auf!"}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7357	empfänger	{recipient}	{"Der Empfänger unterschreibt hier.","Wer ist der Empfänger des Pakets?"}	1	33	1	\N	empfänger	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7358	entschuldigungsschreiben	{"letter of apology"}	{"Das Entschuldigungsschreiben ist fertig.","Brauchen Sie ein Entschuldigungsschreiben?"}	1	33	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7359	erkälten	{"to get a cold"}	{"Ich habe mich erkältet.","Im Winter erkälte ich mich leicht."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7360	erkältung	{cold/flu}	{"Eine Erkältung dauert eine Woche.","Bei Erkältung viel trinken."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7361	euer	{"your (informal)/yours"}	{"Ist das euer Hausarzt?","Euer Termin ist morgen."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7362	fieber	{fever}	{"Das Kind hat hohes Fieber.","Bei Fieber muss man ruhen."}	1	33	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7363	finger	{finger}	{"Mein Finger blutet.","Der Arzt verbindet den Finger."}	1	33	1	\N	finger	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7264	freundlich	{friendly}	{"Der Arzt ist sehr freundlich.","Schreiben Sie eine freundliche Email."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7364	geehrter	{dear}	{"Sehr geehrter Herr Doktor.","Geehrte Patienten, bitte warten."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7365	gesicht	{face}	{"Das Gesicht ist gerötet.","Wasch dein Gesicht mit Wasser."}	1	33	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7366	gesundheit	{health}	{"Gesundheit ist wichtig.","Zum Geburtstag wünsche ich Gesundheit."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7367	gesundheitskarte	{"health insurance card"}	{"Vergessen Sie die Gesundheitskarte nicht!","Die Gesundheitskarte liegt im Portemonnaie."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7368	grippe	{flu}	{"Die Grippe ist ansteckend.","Impfungen schützen vor der Grippe."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7369	gruppe	{group}	{"Die Gruppe wartet im Wartezimmer.","In der Gruppe sind fünf Patienten."}	1	33	2	\N	gruppen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7370	haar	{hair}	{"Ein Haar liegt auf dem Kissen.","Die Haare sind grau geworden."}	1	33	3	\N	haare	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7371	hals	{throat}	{"Mein Hals tut weh beim Schlucken.","Der Hals ist entzündet."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7372	hals-nasen-ohren-arzt	{"throat-nose-mouth doctor"}	{"Der Hals-Nasen-Ohren-Arzt hilft bei Schnupfen.","Brauche ich einen Termin beim HNO-Arzt?"}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7373	halsweh	{"sore throat"}	{"Bei Halsweh trinke Tee.","Halsweh kann von einer Erkältung kommen."}	1	33	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7374	hand	{hand}	{"Die Hand ist geschwollen.","Waschen Sie Ihre Hände bitte."}	1	33	2	\N	hände	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7375	hausarzt	{"GP (general practitioner)"}	{"Mein Hausarzt ist sehr nett.","Der Hausarzt überweist zum Spezialisten."}	1	33	1	\N	hausärzte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7376	heiß	{hot}	{"Die Stirn ist heiß.","Vorsicht, der Tee ist heiß!"}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7377	husten	{cough}	{"Der Husten ist trocken.","Bei Husten hilft Hustensaft."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7378	hustensaft	{"cough syrup"}	{"Der Hustensaft schmeckt süß.","Nehmen Sie dreimal täglich Hustensaft."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7379	knie	{knee}	{"Mein Knie tut beim Laufen weh.","Das Knie ist geschwollen."}	1	33	3	\N	knie	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7380	kopf	{head}	{"Der Kopf schmerzt stark.","Legen Sie den Kopf auf das Kissen."}	1	33	1	\N	köpfe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7381	kopfschmerzen	{headache}	{"Ich habe starke Kopfschmerzen.","Bei Kopfschmerzen hilft Ruhe."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7382	körper	{body}	{"Der Körper braucht Schlaf.","Untersuchen Sie den ganzen Körper."}	1	33	1	\N	körper	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7383	körperteil	{"body part"}	{"Welcher Körperteil tut weh?","Jeder Körperteil wird geprüft."}	1	33	1	\N	körperteile	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7384	krank	{ill}	{"Ich bin heute krank.","Der Kollege ist krankgeschrieben."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7385	krankheit	{illness}	{"Die Krankheit ist ansteckend.","Schwere Krankheiten brauchen Behandlung."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7387	märz	{March}	{"Im März beginnt der Frühling.","Der Termin ist am 15. März."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7388	medikament	{medicine}	{"Nehmen Sie das Medikament dreimal täglich.","Das Medikament hilft gegen Schmerzen."}	1	33	3	\N	medikamente	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7389	mund	{mouth}	{"Öffnen Sie bitte den Mund.","Der Mund ist trocken."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7390	nacken	{neck}	{"Mein Nacken ist verspannt.","Massieren Sie den Nacken sanft."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7391	nase	{nose}	{"Die Nase läuft bei Erkältung.","Putzen Sie die Nase vorsichtig."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7392	notfallsprechstunde	{"emergency consultation"}	{"Die Notfallsprechstunde ist abends.","Gehen Sie zur Notfallsprechstunde bei Schmerzen."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7393	ohr	{ear}	{"Das Ohr tut weh.","Der Arzt untersucht das Ohr."}	1	33	3	\N	ohren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7394	orthopäde	{orthopaedist}	{"Der Orthopäde behandelt den Rücken.","Brauche ich eine Überweisung zum Orthopäden?"}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7464	packen	{"to pack"}	{"Ich packe meine Sachen für die Reise.","Kannst du den Koffer packen?"}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7395	patient	{"patient (male)"}	{"Der Patient wartet im Zimmer.","Jeder Patient bekommt eine Nummer."}	1	33	1	\N	patienten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7396	patientin	{"patient (female)"}	{"Die Patientin hat Fieber.","Die Patientin braucht Ruhe."}	1	33	2	\N	patientinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7397	per	{by}	{"Schicken Sie das per Post.","Die Antwort kommt per Email."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7398	pflaster	{plaster}	{"Das Pflaster ist auf der Wunde.","Brauchen Sie ein Pflaster?"}	1	33	3	\N	pflaster	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7399	praktikum	{internship}	{"Das Praktikum im Krankenhaus beginnt bald.","Während des Praktikums lernt man viel."}	1	33	3	\N	praktika	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7400	praktikumsbetreuerin	{"internship supervisor"}	{"Die Praktikumsbetreuerin erklärt die Aufgaben.","Fragen Sie die Praktikumsbetreuerin."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7401	praxis	{practice}	{"Die Praxis hat heute geschlossen.","In der Praxis gibt es viele Ärzte."}	1	33	2	\N	praxen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7402	praxisgemeinschaft	{"joint practice"}	{"Die Praxisgemeinschaft hat drei Ärzte.","In der Praxisgemeinschaft arbeiten Spezialisten."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7403	rauchen	{"to smoke"}	{"Rauchen ist ungesund.","Darf man hier rauchen?"}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7404	regelmäßig	{regularly}	{"Nehmen Sie die Tabletten regelmäßig.","Regelmäßige Bewegung ist gesund."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7405	rezept	{recipe}	{"Das Rezept ist vom Arzt.","Kaufen Sie die Medikamente mit dem Rezept."}	1	33	3	\N	rezepte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7406	rot	{red}	{"Die Wunde ist rot.","Der Ausschlag ist rot und juckt."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7407	rücken	{back}	{"Mein Rücken schmerzt beim Sitzen.","Der Arzt untersucht den Rücken."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7408	rund	{round}	{"Die Tablette ist rund.","Der rote Fleck ist rund."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7409	salbe	{ointment}	{"Tragen Sie die Salbe auf die Haut auf.","Die Salbe hilft gegen Juckreiz."}	1	33	2	\N	salben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7410	schicken	{"to send"}	{"Schicken Sie das Rezept per Post.","Ich schicke Ihnen die Unterlagen."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7411	schmerz	{pain}	{"Der Schmerz ist unerträglich.","Bei Schmerzen sofort den Arzt rufen."}	1	33	1	\N	schmerzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7412	schnupfen	{"to sniff"}	{"Schnupfen ist lästig.","Bei Schnupfen braucht man Taschentücher."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7413	schulter	{shoulder}	{"Meine Schulter ist steif.","Die Schulter tut nach dem Sport weh."}	1	33	2	\N	schultern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7414	schwanger	{pregnant}	{"Sie ist im siebten Monat schwanger.","Schwangeren Frauen wird besondere Betreuung angeboten."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7415	sprechstunde	{"consultation hours"}	{"Die Sprechstunde endet um 12 Uhr.","Wann ist die nächste Sprechstunde?"}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7416	sprechstundenhilfe	{receptionist}	{"Die Sprechstundenhilfe gibt Ihnen den Termin.","Fragen Sie die Sprechstundenhilfe."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7417	sprechzimmer	{"consultation room"}	{"Im Sprechzimmer wartet der Arzt.","Gehen Sie bitte ins Sprechzimmer."}	1	33	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7418	stark	{strong}	{"Der Schmerz ist stark.","Das Medikament wirkt stark."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7419	stirn	{forehead}	{"Die Stirn ist heiß.","Er hat Schweiß auf der Stirn."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7420	tablette	{tablet}	{"Nehmen Sie eine Tablette mit Wasser.","Die Tablette hilft gegen Fieber."}	1	33	2	\N	tabletten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7421	termin	{appointment}	{"Der Termin ist um 10 Uhr.","Haben Sie einen Termin vereinbart?"}	1	33	1	\N	termine	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7423	unterschrift	{signature}	{"Die Unterschrift fehlt auf dem Formular.","Bitte geben Sie Ihre Unterschrift hier."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7424	untersuchung	{examination}	{"Die Untersuchung dauert eine Stunde.","Bei der Untersuchung wird Blut abgenommen."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7425	verband	{association}	{"Der Verband muss gewechselt werden.","Der Verband ist blutig."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7426	verschieden	{different}	{"Es gibt verschiedene Behandlungen.","Die Patienten haben verschiedene Symptome."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7427	vorsorge	{provision}	{"Vorsorge ist besser als Nachsorge.","Zur Vorsorge gehen Sie regelmäßig zum Arzt."}	1	33	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7428	wartezimmer	{"waiting room"}	{"Im Wartezimmer sitzen viele Patienten.","Das Wartezimmer ist voll."}	1	33	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7500	gegenseitig	{mutual}	{"Wir helfen uns gegenseitig.","Gegenseitige Rücksicht ist wichtig."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7429	wechsel	{change}	{"Der Wechsel der Verbände ist wichtig.","Ein Wechsel der Ernährung kann helfen."}	1	33	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7430	wechseln	{"to change"}	{"Wir müssen den Verband wechseln.","Der Arzt wechselt die Medikamente."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7431	wehtun	{"to hurt"}	{"Es tut weh, wenn ich atme.","Der Bauch tut weh nach dem Essen."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7432	wieder	{again}	{"Kommen Sie bitte wieder morgen.","Der Schmerz kommt wieder."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7433	wiederkommen	{"to come again"}	{"Sie müssen in einer Woche wiederkommen.","Wann soll ich wiederkommen?"}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7434	zahn	{tooth}	{"Der Zahn muss gezogen werden.","Mein Zahn schmerzt beim Kauen."}	1	33	1	\N	zähne	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7435	zeh	{toe}	{"Der große Zeh ist gebrochen.","Der Zeh tut nach dem Stoß weh."}	1	33	1	\N	zehen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7436	zurzeit	{currently}	{"Zurzeit bin ich krankgeschrieben.","Der Arzt ist zurzeit im Urlaub."}	1	33	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7437	aufwachsen	{"to grow up"}	{"Ich bin in Berlin aufgewachsen.","Kinder wachsen schnell auf."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7438	beantworten	{"to answer"}	{"Kannst du die Frage beantworten?","Sie beantwortet alle Emails schnell."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7439	besuch	{visit}	{"Gestern hatte ich Besuch von meiner Tante.","Der Besuch im Museum war spannend."}	1	34	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7440	bewegung	{movement}	{"Regelmäßige Bewegung ist gesund.","Die Bewegung der Wellen beruhigt mich."}	1	34	2	\N	bewegungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7441	bilden	{"to form"}	{"Wolken bilden sich am Himmel.","Wir bilden eine Gruppe für das Projekt."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7442	blume	{flower}	{"Die Blume im Garten blüht schön.","Sie schenkt mir eine rote Blume."}	1	34	2	\N	blumen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7443	dienst	{service}	{"Er arbeitet im öffentlichen Dienst.","Der Kundendienst hilft schnell."}	1	34	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7444	extra	{extra}	{"Ich habe extra Brot gekauft.","Mach dir keine extra Arbeit."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7445	ferienhaus	{"holiday home"}	{"Unser Ferienhaus liegt am Meer.","Im Ferienhaus gibt es viel Platz."}	1	34	3	\N	ferienhäuser	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7446	früher	{earlier}	{"Früher habe ich in Köln gewohnt.","Wir sind früher angekommen."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7447	geboren sein	{"to be born"}	{"Ich bin 1990 geboren.","Wo bist du geboren?"}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7448	gerade	{"at the moment"}	{"Ich bin gerade beschäftigt.","Gerade regnet es stark."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7449	gucken	{"to watch"}	{"Guck mal, das Flugzeug!","Wir gucken einen Film."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7450	hausflur	{corridor}	{"Im Hausflur stehen Schuhe.","Der Hausflur ist hell beleuchtet."}	1	34	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7451	heiraten	{"to marry"}	{"Sie wollen nächsten Sommer heiraten.","Meine Eltern heiraten im Garten."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7452	hobby	{hobby}	{"Mein Hobby ist Fotografieren.","Hast du ein neues Hobby?"}	1	34	3	\N	hobbys	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7453	ingenieur	{engineer}	{"Er ist ein guter Ingenieur.","Die Ingenieurin plant Brücken."}	1	34	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7454	insel	{island}	{"Wir fahren zur Insel Sylt.","Die Insel ist klein und schön."}	1	34	2	\N	inseln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7455	inselrundfahrt	{"island tour"}	{"Die Inselrundfahrt dauert zwei Stunden.","Bei der Inselrundfahrt sehen wir viel."}	1	34	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7456	kennen	{"to know (somebody)"}	{"Ich kenne ihn seit der Schule.","Kennst du diese Straße?"}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7457	koffer	{suitcase}	{"Mein Koffer ist sehr schwer.","Wir packen den Koffer für den Urlaub."}	1	34	1	\N	koffer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7458	letzte	{last}	{"Das ist der letzte Zug.","Die letzte Woche war stressig."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7459	meer	{ocean}	{"Das Meer ist heute ruhig.","Wir spazieren am Meer entlang."}	1	34	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7460	mond	{moon}	{"Der Mond scheint hell.","Heute Nacht ist Vollmond."}	1	34	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7461	nachbar	{"neighbour (male)"}	{"Mein Nachbar hilft mir oft.","Der Nachbar hat einen Hund."}	1	34	1	\N	nachbarn	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7462	nachbarin	{"neighbour (female)"}	{"Die Nachbarin backt Kuchen.","Meine Nachbarin ist sehr freundlich."}	1	34	2	\N	nachbarinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7463	natur	{nature}	{"Wir wandern in der Natur.","Die Natur hier ist wunderschön."}	1	34	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7465	postkarte	{postcard}	{"Ich schicke dir eine Postkarte.","Die Postkarte zeigt den Strand."}	1	34	2	\N	postkarten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7466	reise	{journey}	{"Die Reise nach Italien war toll.","Planst du eine lange Reise?"}	1	34	2	\N	reisen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7467	schiff	{ship}	{"Das Schiff fährt nach Griechenland.","Auf dem Schiff gibt es ein Restaurant."}	1	34	3	\N	schiffe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7468	seehund	{seal}	{"Wir sehen Seehunde am Strand.","Der Seehund schwimmt im Wasser."}	1	34	1	\N	seehunde	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7469	ski	{ski}	{"Im Winter fahre ich Ski.","Die Ski liegen im Keller."}	1	34	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7470	strand	{beach}	{"Am Strand liegen viele Menschen.","Der Strand ist sauber und lang."}	1	34	1	\N	strände	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7471	stressig	{stressful}	{"Die Arbeit war heute stressig.","Ein stressiger Tag braucht Entspannung."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7472	studium	{"course of study"}	{"Mein Studium dauert drei Jahre.","Das Studium der Medizin ist schwer."}	1	34	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7473	stundenlang	{"for hours"}	{"Wir haben stundenlang gewartet.","Stundenlang Regen macht müde."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7474	suppe	{soup}	{"Die Suppe ist heiß und lecker.","Mama kocht Gemüsesuppe."}	1	34	2	\N	suppen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7475	süß	{sweet}	{"Der Kuchen ist zu süß.","Das Baby lächelt süß."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7476	tennis	{tennis}	{"Wir spielen jeden Samstag Tennis.","Tennis macht viel Spaß."}	1	34	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7477	tourist	{tourist}	{"Viele Touristen besuchen die Stadt.","Der Tourist fragt nach dem Weg."}	1	34	1	\N	touristen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7478	unregelmäßig	{infrequent}	{"Der Bus fährt unregelmäßig.","Mein Schlaf ist unregelmäßig."}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7479	urlaub	{holiday}	{"Im Urlaub fahren wir ans Meer.","Der Urlaub war zu kurz."}	1	34	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7480	verdienen	{"to earn"}	{"Er verdient gut in seinem Job.","Wie viel verdienst du im Monat?"}	1	34	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7227	warten	{"to wait"}	{"Wir warten auf den Bus.","Bitte warten Sie einen Moment."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7481	wetter	{weather}	{"Das Wetter ist heute sonnig.","Schlechtes Wetter ruiniert die Pläne."}	1	34	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7482	anziehen	{"to dress"}	{"Ich ziehe mich schnell an.","Kannst du das Kleid anziehen?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7483	anzug	{suit}	{"Er trägt einen schicken Anzug.","Der Anzug passt perfekt."}	1	35	1	\N	anzüge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7484	beige	{beige}	{"Die Tasche ist beige.","Beige Schuhe sind praktisch."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6993	besser	{better}	{"Dieses Hemd ist besser.","Ich fühle mich heute besser."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7486	besten (am besten)	{"best (the best)"}	{"Das ist am besten so.","Am besten kaufst du jetzt ein."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8693	anzeigetafel	{"bulletin board"}	{"Die Abfahrtszeiten stehen auf der Anzeigetafel, die im Bahnhof hängt.","Er schaut auf die Anzeigetafel, weil er seinen Zug sucht."}	3	2	2	\N	anzeigetafeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7488	blau	{blue}	{"Das blaue Kleid ist schön.","Seine Augen sind blau."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7489	blöd	{stupid}	{"Das ist eine blöde Idee.","Ich finde das nicht blöd."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7490	bluse	{blouse}	{"Die Bluse passt zur Hose.","Kaufst du die rote Bluse?"}	1	35	2	\N	blusen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7491	braun	{brown}	{"Braune Schuhe sind klassisch.","Der Tisch ist braun."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7492	bringen	{"to bring"}	{"Kannst du mir das bringen?","Ich bringe die Einkäufe nach Hause."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7493	denken	{"to think"}	{"Ich denke an den Urlaub.","Was denkst du darüber?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7494	einkaufsbummel	{"shopping spree"}	{"Wir machen einen Einkaufsbummel.","Der Einkaufsbummel war lang."}	1	35	1	\N	einkaufsbummel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7495	eng	{tight}	{"Die Jeans ist zu eng.","Eng anliegende Kleidung ist modern."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7496	euch	{"you (informal)"}	{"Das passt euch gut.","Ich helfe euch beim Einkauf."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7497	farbe	{colour}	{"Welche Farbe gefällt dir?","Die Farbe ist zu hell."}	1	35	2	\N	farben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7499	gefallen	{"to please"}	{"Das Kleid gefällt mir.","Gefällt dir die Jacke?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7501	gelb	{yellow}	{"Gelbe Blumen sind schön.","Die gelbe Tasche ist neu."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7502	genauso	{equally}	{"Ich möchte genauso einen Rock.","Genauso gut wie früher."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7503	glauben	{"to believe"}	{"Ich glaube, das passt.","Glaubst du an den Sale?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7504	grau	{grey}	{"Graue Hosen sind praktisch.","Der Himmel ist grau."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7505	günstig	{"good value"}	{"Das Angebot ist günstig.","Günstige Preise finden."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7506	hemd	{shirt}	{"Das Hemd ist aus Baumwolle.","Kaufst du ein neues Hemd?"}	1	35	3	\N	hemden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7507	hose	{trousers}	{"Die Hose ist zu lang.","Hosen in Größe 38 sind da."}	1	35	2	\N	hosen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7508	ihm	{him}	{"Das passt ihm gut.","Ich gebe ihm die Tasche."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7509	jacke	{jacket}	{"Die Jacke ist wasserdicht.","Brauchst du eine neue Jacke?"}	1	35	2	\N	jacken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7510	jeans	{jeans}	{"Jeans sind immer praktisch.","Die blaue Jeans gefällt mir."}	1	35	2	\N	jeans	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7511	jogginganzug	{tracksuit}	{"Der Jogginganzug ist bequem.","Er trägt einen grauen Jogginganzug."}	1	35	1	\N	jogginganzüge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7512	kassenbon	{receipt}	{"Bitte den Kassenbon aufbewahren.","Der Kassenbon ist wichtig für Umtausch."}	1	35	1	\N	kassenbons	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7513	kaufhaus	{"department store"}	{"Im Kaufhaus gibt es alles.","Das Kaufhaus schließt um 20 Uhr."}	1	35	3	\N	kaufhäuser	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7514	klamotten (pl)	{clothes}	{"Neue Klamotten kaufen.","Meine Klamotten sind in der Wäsche."}	1	35	2	\N	klamotten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7516	kleid	{dress}	{"Das Kleid steht dir gut.","Kleider sind im Angebot."}	1	35	3	\N	kleider	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7517	kleidung	{clothing}	{"Kleidung muss passen.","Moderne Kleidung ist teuer."}	1	35	2	\N	kleidung	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7518	kleidungsstück	{"item of clothing"}	{"Jedes Kleidungsstück einzeln prüfen.","Ein neues Kleidungsstück kaufen."}	1	35	3	\N	kleidungsstücke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7519	lila	{purple}	{"Lila Schuhe sind auffällig.","Die Bluse ist lila."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7520	mantel	{coat}	{"Der Mantel ist warm.","Im Winter trage ich einen Mantel."}	1	35	1	\N	mäntel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7515	klasse	{great}	{"Unsere Klasse hat 25 Schüler.","Die Klasse 8a ist laut."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7521	meisten (am meisten)	{"most (the most)"}	{"Am meisten gefällt mir das Hemd.","Die meisten Kunden sind zufrieden."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7522	mode	{fashion}	{"Moderne Mode ist bunt.","Die Mode ändert sich schnell."}	1	35	2	\N	moden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7523	modell	{model}	{"Dieses Modell gibt es in Rot.","Das neue Modell ist da."}	1	35	3	\N	modelle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7524	mütze	{hat}	{"Die Mütze schützt vor Kälte.","Kaufst du eine Wollmütze?"}	1	35	2	\N	mützen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7525	online	{online}	{"Ich kaufe oft online ein.","Online shoppen ist bequem."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7527	paar	{pair}	{"Ein Paar Handschuhe kaufen.","Das Paar Schuhe ist reduziert."}	1	35	3	\N	paare	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7528	passen	{"to fit"}	{"Die Schuhe passen nicht.","Passt dir die Größe?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7529	positiv	{positive}	{"Das ist eine positive Überraschung.","Positiv denken hilft."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7530	probieren	{"to try"}	{"Probier das Kleid an!","Ich probiere die Schuhe."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7531	prospekt	{prospect}	{"Im Prospekt stehen Angebote.","Der Prospekt liegt aus."}	1	35	1	\N	prospekte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7532	pullover	{jumper}	{"Der Pullover ist aus Wolle.","Ein dicker Pullover für den Winter."}	1	35	1	\N	pullover	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7533	raten	{"to advise"}	{"Ich rate zu diesem Modell.","Kannst du mir raten?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7534	rock	{skirt}	{"Der Rock ist zu kurz.","Ein langer Rock ist elegant."}	1	35	1	\N	röcke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7535	schal	{scarf}	{"Der Schal ist aus Seide.","Ein bunter Schal passt gut."}	1	35	1	\N	schals	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7536	schuh	{shoe}	{"Der Schuh drückt.","Neue Schuhe kaufen."}	1	35	1	\N	schuhe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7537	schwarz	{black}	{"Schwarze Kleidung ist schick.","Die Tasche ist schwarz."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7538	sicher	{secure}	{"Sicher ist sicher, kauf lieber zwei.","Bist du sicher mit der Gröze?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7539	socke	{sock}	{"Eine Socke fehlt.","Wolle Socken sind warm."}	1	35	2	\N	socken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7540	sportschuh	{trainer}	{"Sportschuhe sind bequem.","Neue Sportschuhe für das Training."}	1	35	1	\N	sportschuhe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7541	strickjacke	{cardigan}	{"Die Strickjacke ist handgemacht.","Eine warme Strickjacke kaufen."}	1	35	2	\N	strickjacken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7542	strumpf	{stocking}	{"Ein Strumpf hat ein Loch.","Dünne Strümpfe für den Sommer."}	1	35	1	\N	strümpfe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7543	tragen	{"to wear"}	{"Ich trage gerne Röcke.","Kannst du das Paket tragen?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7544	t-shirt	{tshirt}	{"Das T-Shirt ist aus Baumwolle.","Ein weißes T-Shirt kaufen."}	1	35	3	\N	t-shirts	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7545	typisch	{typical}	{"Typisch, schon wieder ausverkauft.","Das ist typisch für diesen Laden."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7546	überhaupt	{"at all"}	{"Gefällt dir das überhaupt?","Überhaupt nicht mein Stil."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7547	umtauschen	{"to exchange"}	{"Kann ich die Hose umtauschen?","Umtauschen ohne Kassenbon geht nicht."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7548	uns	{us}	{"Das gefällt uns gut.","Könnt ihr uns helfen?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7549	vergessen	{"to forget"}	{"Ich habe den Bon vergessen.","Vergiss nicht, den Prospekt mitzunehmen."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7550	wintermantel	{"winter coat"}	{"Der Wintermantel ist dick.","Ein neuer Wintermantel für die Kälte."}	1	35	1	\N	wintermäntel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7551	zurück	{return}	{"Ich komme gleich zurück.","Kann ich das Kleid zurückgeben?"}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7552	achtung	{caution}	{"Achtung! Die Straße ist glatt.","Achtung, hier ist es gefährlich."}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7553	april	{April}	{"Im April blühen die Blumen.","Der April hat viel Regen."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7554	aufregen	{"to get excited/upset"}	{"Reg dich nicht auf!","Sie regt sich über das Wetter auf."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7555	august	{August}	{"Im August ist es oft heiß.","Der August ist mein Lieblingsmonat."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7556	bauen	{"to build"}	{"Die Kinder bauen ein Sandburg.","Wir bauen ein neues Haus."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7557	baum	{tree}	{"Der Baum hat grüne Blätter.","Wir pflanzen einen neuen Baum."}	1	36	1	\N	bäume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7558	besuchen	{"to visit"}	{"Wir besuchen die Großeltern.","Kann ich dich morgen besuchen?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7559	bewölkt	{cloudy}	{"Der Himmel ist heute bewölkt.","Bei bewölktem Wetter bleiben wir zu Hause."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7560	braut	{bride}	{"Die Braut trägt ein weißes Kleid.","Die Braut und der Bräutigam lächeln."}	1	36	2	\N	bräute	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7561	dank	{thanks}	{"Vielen Dank für deine Hilfe!","Dank des Regens wachsen die Pflanzen."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7562	darüber	{about}	{"Wir sprechen darüber morgen.","Was denkst du darüber?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7563	deutschlandkarte	{"map of Germany"}	{"Auf der Deutschlandkarte suchen wir Städte.","Die Deutschlandkarte hängt an der Wand."}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7564	dezember	{December}	{"Im Dezember schneit es oft.","Der Dezember ist der letzte Monat."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7565	eben	{just}	{"Das ist eben so!","Ich bin eben angekommen."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7566	einladen	{"to invite"}	{"Ich lade dich zum Essen ein.","Kannst du mich zur Feier einladen?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7567	einladung	{invitation}	{"Die Einladung ist per Post gekommen.","Hast du die Einladung gesehen?"}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7568	einverstanden	{agreed}	{"Bist du damit einverstanden?","Wir sind alle einverstanden."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7569	eis	{"ice cream"}	{"Ich esse gerne Eis.","Das Eis schmilzt in der Sonne."}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7570	februar	{February}	{"Im Februar ist Karneval.","Der Februar hat 28 Tage."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7571	feier	{celebration}	{"Die Feier beginnt um 19 Uhr.","Wir planen eine große Feier."}	1	36	2	\N	feiern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7572	feiern	{"to celebrate"}	{"Wir feiern Geburtstag.","Was feiern wir heute?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7573	fest	{party}	{"Das Fest war lustig.","Wir organisieren ein Sommerfest."}	1	36	3	\N	feste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7574	freuen	{"to be happy"}	{"Ich freue mich auf den Urlaub.","Wir freuen uns über das Geschenk."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7575	froh	{glad}	{"Ich bin froh, dich zu sehen.","Frohe Ostern!"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7576	frühling	{spring}	{"Im Frühling blühen die Blumen.","Der Frühling ist meine Lieblingsjahreszeit."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7577	fühlen	{"to feel"}	{"Ich fühle mich müde.","Wie fühlst du dich heute?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7578	gartenparty	{"garden party"}	{"Die Gartenparty war toll.","Wir laden viele Freunde zur Gartenparty ein."}	1	36	2	\N	gartenpartys	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7579	geburtstag	{birthday}	{"Herzlichen Glückwunsch zum Geburtstag!","Wann ist dein Geburtstag?"}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7580	geburtstagstorte	{"birthday cake"}	{"Die Geburtstagstorte schmeckt lecker.","Wir backen eine Schokoladentorte."}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7581	geschenk	{present}	{"Das Geschenk ist toll verpackt.","Was für ein schönes Geschenk!"}	1	36	3	\N	geschenke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7582	glücklich	{happy}	{"Sie ist sehr glücklich.","Glücklich sein ist wichtig."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7583	glückstag	{"lucky day"}	{"Heute ist mein Glückstag!","Jeder braucht einen Glückstag."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7584	grad	{degrees}	{"Es sind 20 Grad warm.","Das Wasser hat null Grad."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7585	hageln	{hail}	{"Es hagelt heute Nachmittag.","Bei Gewitter kann es hageln."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7586	handschuh	{glove}	{"Im Winter trage ich Handschuhe.","Wo ist mein zweiter Handschuh?"}	1	36	1	\N	handschuhe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7587	hase	{rabbit}	{"Der Hase hoppelt im Garten.","Kinder liegen den Osterhasen."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7588	herbst	{autumn}	{"Im Herbst fallen die Blätter.","Der Herbst ist bunt und kühl."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7589	himmelsrichtung	{"compass point"}	{"Die Himmelsrichtungen sind Norden, Süden, Osten, Westen.","Welche Himmelsrichtung ist das?"}	1	36	2	\N	himmelsrichtungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7590	hochzeit	{wedding}	{"Die Hochzeit findet im Juni statt.","Wir laden euch zur Hochzeit ein."}	1	36	2	\N	hochzeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7591	hochzeitsfeier	{"wedding party"}	{"Die Hochzeitsfeier war unvergesslich.","Nach der Trauung beginnt die Hochzeitsfeier."}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7592	jahreszahl	{year}	{"Die Jahreszahl 2023 steht auf dem Kalender.","Welche Jahreszahl haben wir?"}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7593	jahreszeit	{season}	{"Der Frühling ist meine liebste Jahreszeit.","Es gibt vier Jahreszeiten."}	1	36	2	\N	jahreszeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7594	januar	{January}	{"Im Januar ist es oft kalt.","Der Januar ist der erste Monat."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7595	juli	{July}	{"Im Juli haben wir Sommerferien.","Der Juli ist meistens heiß."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7596	kalender	{calendar}	{"Der Kalender hängt an der Wand.","Ich trage Termine in den Kalender ein."}	1	36	1	\N	kalender	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7597	lieben	{"to love"}	{"Ich liebe den Frühling.","Katzen lieben es zu schlafen."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7598	luftballon	{"air balloon"}	{"Der Luftballon fliegt hoch.","Kinder spielen mit Luftballons."}	1	36	1	\N	luftballons	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7599	lustig	{funny}	{"Der Clown ist sehr lustig.","Das war ein lustiger Witz."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7600	mai	{May}	{"Im Mai blühen die Bäume.","Der Mai ist oft mild."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7601	mama	{mum}	{"Meine Mama kocht das Essen.","Mama, kannst du mir helfen?"}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7603	mitbringen	{"to bring with"}	{"Kannst du etwas zu essen mitbringen?","Ich bringe meinen Hund mit."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7604	nass	{wet}	{"Die Kleidung ist nass vom Regen.","Nach dem Schwimmen bin ich nass."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7605	nebelig	{foggy}	{"Heute Morgen war es nebelig.","Bei nebeligem Wetter fahre vorsichtig."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7606	norden	{north}	{"Der Norden ist kühler.","Wir fahren in den Norden."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7607	november	{November}	{"Im November wird es dunkel.","Der November ist oft trüb."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7608	nun	{now}	{"Nun ist es Zeit zu gehen.","Was machen wir nun?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7609	oktober	{October}	{"Im Oktober fallen die Blätter.","Der Oktober ist golden."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7610	oktoberfest	{Octoberfest}	{"Das Oktoberfest ist in München.","Wir trinken Bier auf dem Oktoberfest."}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7611	oma	{Grandma}	{"Meine Oma backt Kuchen.","Oma erzählt Geschichten."}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7612	osten	{east}	{"Die Sonne geht im Osten auf.","Wir reisen in den Osten."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7613	osterei	{"easter egg"}	{"Die Kinder suchen Ostereier.","Das Osterei ist bunt bemalt."}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7614	osterfest	{Easter}	{"Das Osterfest ist im Frühling.","Wir feiern das Osterfest mit der Familie."}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7615	osterhase	{"easter bunny"}	{"Der Osterhase versteckt Eier.","Kinder glauben an den Osterhasen."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7616	ostern	{Easter}	{"Frohe Ostern!","Ostern ist ein fröhliches Fest."}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7617	papa	{dad}	{"Mein Papa repariert das Auto.","Papa, kommst du mit?"}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7618	räumen	{"to clear"}	{"Ich räume mein Zimmer auf.","Kannst du den Tisch räumen?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7619	reden	{"to talk"}	{"Wir reden über das Wetter.","Kann ich mit dir reden?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7620	regnen	{"to rain"}	{"Es regnet den ganzen Tag.","Morgen soll es regnen."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7621	samstags	{"on Saturdays"}	{"Samstags schlafe ich lange.","Wir gehen samstags einkaufen."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7622	schatz	{treasure}	{"Der Schatz ist vergraben.","Mein Schatz, ich liebe dich."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7623	scheinen	{"to shine"}	{"Die Sonne scheint hell.","Der Mond scheint in der Nacht."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7624	schenken	{"to gift"}	{"Ich schenke dir ein Buch.","Was schenkst du zum Geburtstag?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7625	schlecht	{bad}	{"Das Wetter ist schlecht.","Mir geht es heute schlecht."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7626	schnee	{snow}	{"Im Winter liegt viel Schnee.","Der Schnee ist weiß und kalt."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7627	schneemann	{snowman}	{"Wir bauen einen Schneemann.","Der Schneemann hat eine Möhrennase."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7628	schneien	{"to snow"}	{"Es schneit seit dem Morgen.","Wird es morgen schneien?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7629	schokoladenkuchen	{"chocolate cake"}	{"Der Schokoladenkuchen ist lecker.","Wir backen einen Schokoladenkuchen."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7630	sekt	{"sparkling wine"}	{"Wir trinken Sekt zum Anstoßen.","Sekt gibt es im Supermarkt."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7631	september	{September}	{"Im September beginnt die Schule.","Der September ist noch warm."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7632	sommer	{summer}	{"Im Sommer gehen wir baden.","Der Sommer ist heiß und sonnig."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7633	sonnig	{sunny}	{"Heute ist es sonnig und warm.","Ein sonniger Tag macht glücklich."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7634	spezialität	{speciality}	{"Das ist eine regionale Spezialität.","Probier die Spezialität des Hauses!"}	1	36	2	\N	spezialitäten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7635	standesamt	{"registry office"}	{"Sie heiraten auf dem Standesamt.","Das Standesamt ist geschlossen."}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7636	stellen	{"to set"}	{"Stell den Wecker auf 7 Uhr.","Kannst du das Glas stellen?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7637	süden	{south}	{"Im Süden ist es wärmer.","Wir fahren in den Süden."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7638	tanzen	{"to dance"}	{"Wir tanzen auf der Feier.","Kannst du Salsa tanzen?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7639	teller	{plate}	{"Der Teller ist sauber.","Stell die Teller auf den Tisch."}	1	36	1	\N	teller	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7640	torte	{cake}	{"Die Torte ist mit Früchten dekoriert.","Wir essen Torte zum Kaffee."}	1	36	2	\N	torten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7641	trocken	{dry}	{"Die Wäsche ist trocken.","Im Sommer ist die Luft trocken."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7642	unglücklich	{unhappy}	{"Warum bist du so unglücklich?","Ein unglücklicher Tag."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7643	unglückstag	{"unlucky day"}	{"Heute ist ein Unglückstag.","Alles geht schief am Unglückstag."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7644	warm	{warm}	{"Der Tee ist noch warm.","Im Sommer ist es warm."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7645	weihnachten	{Christmas}	{"Frohe Weihnachten!","Weihnachten feiern wir mit der Familie."}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7646	weihnachtsbaum	{"Christmas tree"}	{"Der Weihnachtsbaum ist geschmückt.","Wir kaufen einen Weihnachtsbaum."}	1	36	1	\N	weihnachtsbäume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7647	weihnachtsfeier	{"Christmas party"}	{"Die Weihnachtsfeier ist im Büro.","Auf der Weihnachtsfeier gibt es Geschenke."}	1	36	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7648	weihnachtsgeschenk	{"Christmas present"}	{"Das Weihnachtsgeschenk ist verpackt.","Was wünschst du dir zum Weihnachtsgeschenk?"}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7649	weihnachtsmann	{"Santa Claus"}	{"Der Weihnachtsmann bringt Geschenke.","Kinder schreiben dem Weihnachtsmann."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7650	westdeutschland	{"West Germany"}	{"Westdeutschland hat viele Städte.","Wir reisen durch Westdeutschland."}	1	36	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7651	westen	{west}	{"Die Sonne geht im Westen unter.","Im Westen liegt Frankreich."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7652	wetterbericht	{"weather report"}	{"Der Wetterbericht sagt Regen voraus.","Ich höre den Wetterbericht im Radio."}	1	36	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7653	wieso	{why}	{"Wieso bist du traurig?","Wieso regnet es heute?"}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7654	abendkasse	{"box office"}	{"Wir kaufen die Tickets an der Abendkasse.","Die Abendkasse öffnet um 18 Uhr."}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7655	abholen	{"to collect"}	{"Kannst du mich vom Bahnhof abholen?","Ich hole das Paket morgen ab."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7656	aktuell	{current}	{"Die aktuellen Nachrichten sind wichtig.","Was ist dein aktuelles Projekt?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7657	alle	{all}	{"Alle Schüler sind im Klassenzimmer.","Ich habe alle Bücher gelesen."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7658	anklicken	{"to click"}	{"Klicke den Link an, um weiterzugehen.","Ich habe das Symbol angeklickt."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7659	app	{app}	{"Diese App hilft beim Deutschlernen.","Lade die App herunter, um Musik zu hören."}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7660	aussuchen	{"to choose"}	{"Such dir ein Geschenk aus!","Wir haben einen Film ausgesucht."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7661	benutzername	{"user name"}	{"Gib deinen Benutzername ein.","Mein Benutzername ist leicht zu merken."}	2	13	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7662	bestellen	{"to order"}	{"Ich bestelle Pizza zum Abendessen.","Hast du das Buch online bestellt?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7663	chatten	{"to chat"}	{"Wir chatten jeden Abend online.","Kannst du mit mir chatten?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7664	datei	{file}	{"Speichere die Datei auf dem Computer.","Die Datei ist zu groß für eine E-Mail."}	2	13	2	\N	dateien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7665	dich	{you}	{"Ich sehe dich im Park.","Kennst du dich hier aus?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7666	diskutieren	{"to discuss"}	{"Wir diskutieren über das neue Projekt.","Lass uns das Problem diskutieren."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7667	drucken	{"to print"}	{"Drucke das Dokument bitte aus.","Der Drucker funktioniert nicht."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7668	eintritt	{entry}	{"Der Eintritt ins Museum ist kostenlos.","Wir bezahlen den Eintritt an der Tür."}	2	13	1	\N	eintritte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7669	empfehlen	{"to recommend"}	{"Kannst du einen guten Film empfehlen?","Ich empfehle dieses Restaurant."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7670	empfehlung	{recommendation}	{"Danke für deine Empfehlung!","Die Empfehlung des Lehrers war hilfreich."}	2	13	2	\N	empfehlungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7671	flirten	{"to flirt"}	{"Er flirtet oft im Café.","Flirten macht Spaß!"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7672	flohmarkt	{"flea market"}	{"Wir kaufen alte Bücher auf dem Flohmarkt.","Der Flohmarkt findet sonntags statt."}	2	13	1	\N	flohmärkte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7673	forum	{forum}	{"Ich stelle meine Frage im Forum.","Das Forum ist sehr aktiv."}	2	13	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7674	funktionieren	{"to work"}	{"Mein Handy funktioniert nicht mehr.","Funktioniert der Fernseher?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7675	gebraucht	{used}	{"Ich kaufe ein gebrauchtes Fahrrad.","Gebrauchte Bücher sind günstiger."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7676	googeln	{"to google"}	{"Ich google die Adresse des Restaurants.","Kannst du das Wort googeln?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7677	herausfinden	{"to find out"}	{"Wir finden die Lösung heraus.","Kannst du den Preis herausfinden?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7679	hochladen	{"to upload"}	{"Lade die Fotos auf den Computer hoch!","Ich habe das Dokument hochgeladen."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7680	informieren	{"to inform"}	{"Bitte informiere mich über die Änderungen.","Wir informieren uns online."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7681	international	{international}	{"Die Universität hat internationale Studenten.","Das Essen ist international."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7682	internet	{Internet}	{"Ohne Internet geht nichts mehr.","Surfe nicht zu lange im Internet."}	2	13	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7683	kennwort	{password}	{"Gib dein Kennwort ein!","Ich habe mein Kennwort vergessen."}	2	13	3	\N	kenwörter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7684	kinokarte	{"cinema ticket"}	{"Kaufen wir die Kinokarten online?","Die Kinokarte kostet 10 Euro."}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7685	klicken	{"to click"}	{"Klicke auf den Button!","Ich klicke das Foto an."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7686	kommentar	{comment}	{"Schreib einen Kommentar unter das Video!","Dein Kommentar ist hilfreich."}	2	13	1	\N	kommentare	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7687	kostenlos	{"free of charge"}	{"Das Wasser ist hier kostenlos.","Die App ist kostenlos."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7688	kulturcafé	{"culture café"}	{"Treffen wir uns im Kulturcafé?","Das Kulturcafé hat gute Musik."}	2	13	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7689	leser/in	{reader}	{"Die Leser schreiben viele E-Mails.","Der Leser mag das Buch sehr."}	2	13	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7690	löschen	{"to delete"}	{"Lösche die alte Datei!","Ich habe die Nachricht gelöscht."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7691	mailen	{"to mail"}	{"Maile mir die Informationen!","Ich maile dir morgen."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7692	mich	{me}	{"Kannst du mich sehen?","Er ruft mich jeden Tag an."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7693	mitkommen	{"to come along"}	{"Kommst du mit ins Kino?","Mein Hund möchte immer mitkommen."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7694	mitmachen	{"to participate"}	{"Machst du beim Wettbewerb mit?","Ich mache beim Sportkurs mit."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7695	nachschauen	{"to look up"}	{"Schau die Uhrzeit im Internet nach!","Ich schaue den Zugfahrplan nach."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7696	neffe	{nephew}	{"Mein Neffe ist 10 Jahre alt.","Der Neffe spielt Fußball."}	2	13	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7697	nervös	{nervous}	{"Ich bin vor der Prüfung nervös.","Warum bist du so nervös?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7698	newsletter	{newsletter}	{"Abonniere unseren Newsletter!","Der Newsletter kommt jeden Montag."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7699	oben	{"at the top"}	{"Das Bild hängt oben an der Wand.","Die Antwort steht oben auf der Seite."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7700	politik	{politics}	{"Politik interessiert mich nicht.","Wir diskutieren über Politik."}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7701	prima	{great}	{"Das Essen schmeckt prima!","Prima, dass du kommen kannst!"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7702	programm	{programme}	{"Das Fernsehprogramm ist langweilig.","Welches Programm siehst du gerne?"}	2	13	3	\N	programme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7703	radtour	{"cycling tour"}	{"Am Wochenende machen wir eine Radtour.","Die Radtour war anstrengend."}	2	13	2	\N	radtouren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7704	regen	{rain}	{"Heute gibt es starken Regen.","Ohne Regen wird der Garten trocken."}	2	13	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7705	regenschirm	{umbrella}	{"Nimm den Regenschirm mit!","Mein Regenschirm ist blau."}	2	13	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7706	reihenfolge	{order}	{"Die Reihenfolge ist wichtig.","Merke dir die Reihenfolge der Zahlen."}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7707	reservieren	{"to book"}	{"Ich reserviere einen Tisch im Restaurant.","Hast du das Hotelzimmer reserviert?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7708	reservierung	{booking}	{"Die Reservierung ist bestätigt.","Hast du eine Reservierung?"}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7709	rolle	{role}	{"Sie spielt die Hauptrolle im Film.","Welche Rolle hast du im Projekt?"}	2	13	2	\N	rollen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7710	sinken	{"to decrease"}	{"Die Temperatur sinkt nachts.","Die Preise sinken im Sommer."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7711	smartphone	{smartphone}	{"Mein Smartphone ist kaputt.","Lade dein Smartphone auf!"}	2	13	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7712	speichern	{"to save"}	{"Speichere das Dokument regelmäßig!","Ich habe das Foto gespeichert."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7713	spielzeug	{toy}	{"Das Kind spielt mit dem Spielzeug.","Wo ist das Spielzeug?"}	2	13	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7714	starten	{"to begin"}	{"Das Konzert startet um 20 Uhr.","Starte den Computer neu!"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7715	startseite	{homepage}	{"Die Startseite der Website ist übersichtlich.","Gehe zurück zur Startseite!"}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7211	steigen	{"to climb"}	{"Die Preise steigen jedes Jahr.","Die Temperatur steigt langsam."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7716	straßenfest	{"street party"}	{"Das Straßenfest ist sehr laut.","Besuchen wir das Straßenfest am Samstag!"}	2	13	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7717	symbol	{symbol}	{"Das Herz ist ein Symbol für Liebe.","Klicke auf das Symbol!"}	2	13	3	\N	symbole	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7718	tauschen	{"to swap"}	{"Wir tauschen unsere Bücher.","Möchtest du die Plätze tauschen?"}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7719	temperatur	{temperature}	{"Die Temperatur ist heute hoch.","Misst du die Temperatur im Zimmer?"}	2	13	2	\N	temperaturen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7720	theater	{theatre}	{"Wir gehen heute ins Theater.","Das Theaterstück war langweilig."}	2	13	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7721	treffpunkt	{venue}	{"Der Treffpunkt ist am Bahnhof.","Wo ist unser Treffpunkt?"}	2	13	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7723	verabredung	{"meet up"}	{"Ich habe eine Verabredung mit Freunden.","Unsere Verabredung ist um 15 Uhr."}	2	13	2	\N	verabredungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7724	veranstaltung	{event}	{"Die Veranstaltung beginnt um 19 Uhr.","Welche Veranstaltung besuchst du?"}	2	13	2	\N	veranstaltungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7725	veranstaltungstipp	{"event tip"}	{"Hast du einen Veranstaltungstipp?","Der Veranstaltungstipp war super!"}	2	13	1	\N	veranstaltungstipps	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7726	vorschlag	{suggestion}	{"Dein Vorschlag ist gut.","Machen wir einen Vorschlag!"}	2	13	1	\N	vorschläge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7727	welt	{world}	{"Die Welt ist groß und schön.","Reisen öffnet die Welt."}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7728	wettervorhersage	{"weather forecast"}	{"Die Wettervorhersage sagt Regen voraus.","Schau die Wettervorhersage im Fernsehen!"}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7729	wirtschaft	{economy}	{"Die Wirtschaft des Landes wächst.","Wir lernen über die globale Wirtschaft."}	2	13	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7730	würstchen	{sausage}	{"Ich esse ein Würstchen mit Brot.","Die Würstchen sind heiß."}	2	13	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7731	zeitweise	{occasionally}	{"Es regnet zeitweise.","Ich arbeite zeitweise von zu Hause."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7732	zuhören	{"to listen"}	{"Hör mir bitte zu!","Ich höre gerne Musik zu."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7733	zuschauen	{"to watch"}	{"Schau dem Spiel zu!","Ich schaue den Kindern beim Spielen zu."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7734	abfahren	{"to depart"}	{"Der Zug fährt um 9 Uhr ab.","Wann fährt der nächste Bus ab?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7735	abfahrt	{departure}	{"Die Abfahrt des Zuges ist um 15:30 Uhr.","Überprüfe die Abfahrt auf dem Bildschirm."}	2	14	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7736	ankommen	{"to arrive"}	{"Wir kommen pünktlich am Bahnhof an.","Wann kommt der Flug aus Berlin an?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7737	ankunft	{arrival}	{"Die Ankunft des Zuges ist um 18:45 Uhr.","Die Ankunft im Hotel war spät."}	2	14	1	\N	ankünfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7738	anschluss	{connection}	{"Wir verpassen den Anschlusszug!","Der Anschluss an das Internet ist langsam."}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7739	anschlusszug	{"connecting train"}	{"Der Anschlusszug fährt in fünf Minuten.","Wir müssen den Anschlusszug erreichen."}	2	14	1	\N	Anschlusszüge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7744	ausblenden	{"to fade out"}	{"Bitte blenden Sie das Licht aus.","Kannst du den Text ausblenden?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7740	ausfallen	{"to be cancelled"}	{"Der Zug fällt heute aus.","Das Konzert ist wegen Regen ausgefallen."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7741	aussteigen	{"to get off"}	{"Wir steigen an der nächsten Haltestelle aus.","Bitte vorsichtig aussteigen!"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7742	autofahren	{"to drive a car"}	{"Autofahren macht mir Spaß.","Sie lernt Autofahren in der Fahrschule."}	2	14	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7743	automat	{"vending machine"}	{"Der Automat gibt kein Wechselgeld.","Kauf dir einen Kaffee am Automaten."}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7747	bitten	{"to ask"}	{"Darf ich dich um Hilfe bitten?","Sie bittet um eine Fahrkarte."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7748	buchen	{"to book"}	{"Ich buche eine Zugfahrkarte online.","Wir haben ein Hotelzimmer gebucht."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7749	dauer	{duration}	{"Die Dauer der Fahrt beträgt zwei Stunden.","Wie lange ist die Dauer des Films?"}	2	14	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7750	defekt	{defective}	{"Der Automat ist defekt.","Mein Handy-Akku ist defekt."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7751	deshalb	{hence}	{"Der Zug ist voll, deshalb stehen wir.","Es regnet, deshalb bleiben wir zu Hause."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7752	drehen	{"to turn"}	{"Drehen Sie den Schlüssel nach rechts.","Der Film dreht sich um Abenteuer."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7753	drüben	{"over there"}	{"Das Café ist drüben an der Ecke.","Unser Sitzplatz ist drüben."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7754	einfahrt	{entry}	{"Die Einfahrt ist für Lieferwagen verboten.","Die Einfahrt zum Bahnhof ist blockiert."}	2	14	2	\N	einfahrten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7755	einsteigen	{"to board"}	{"Bitte erst einsteigen, dann Türen schließen.","Wir steigen in den Bus ein."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7756	erhalten	{"to receive"}	{"Ich habe eine Bestätigung erhalten.","Sie erhielt eine Fahrkarte per E-Mail."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7757	erreichen	{"to reach"}	{"Wir erreichen den Bahnhof pünktlich.","Kannst du mich unter dieser Nummer erreichen?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7745	bahnfahren	{"rail travel"}	{"Bahnfahren ist umweltfreundlich.","Ich mag Bahnfahren im Sommer."}	2	14	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7746	bahnsteig	{platform}	{"Der Zug steht am Bahnsteig 5.","Wir warten auf dem Bahnsteig."}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7892	umziehen	{"to move"}	{"Wir ziehen nächsten Monat um.","Wann ziehst du um?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7893	umzug	{move}	{"Der Umzug war anstrengend.","Wir planen den Umzug sorgfältig."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7894	umzugskarton	{"moving box"}	{"Die Umzugskartons sind schwer.","Wir brauchen mehr Umzugskartons."}	2	15	1	\N	umzugskartons	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7895	vase	{vase}	{"Die Vase steht auf dem Tisch.","Die Vase ist aus Glas."}	2	15	2	\N	vasen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8694	aufruf	{call}	{"Der Aufruf zur Teilnahme wurde ignoriert, obwohl er wichtig war.","Ein lauter Aufruf ertönte im Gebäude, sodass alle aufmerksam wurden."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9697	mehr als	{"more than"}	{"Mehr als 50 Bewerber kamen.","Das Projekt kostet mehr als erwartet."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7758	fahrkartenschalter	{"ticket office"}	{"Der Fahrkartenschalter schließt um 20 Uhr.","Kaufen Sie die Karte am Fahrkartenschalter."}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7759	fahrplan	{schedule}	{"Der Fahrplan hängt am Brett.","Prüfe den Fahrplan für Verspätungen."}	2	14	1	\N	fahrpläne	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7760	grund	{ground}	{"Der Zug steht ohne Grund still.","Aus Sicherheitsgründen bleibt die Tür zu."}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7761	fernbus	{"long-distance bus"}	{"Der Fernbus nach München ist günstig.","Fernbusse haben oft Wi-Fi."}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7762	fliegen	{"to fly"}	{"Wir fliegen morgen nach Spanien.","Vögel fliegen über das Feld."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7763	flugzeug	{plane}	{"Das Flugzeug startet in 10 Minuten.","Flugzeuge sind schneller als Züge."}	2	14	3	\N	flugzeuge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7764	halt	{stop}	{"Der Bus macht keinen Halt hier.","Der nächste Halt ist am Marktplatz."}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7765	hin	{there}	{"Fährst du hin oder zurück?","Gehen wir hin oder bleiben wir hier?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7766	hinfahrt	{"journey there"}	{"Die Hinfahrt dauert zwei Stunden.","Die Hinfahrt war sehr angenehm."}	2	14	2	\N	hinfahrten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7767	mitarbeiter/in	{employee}	{"Die Mitarbeiter helfen gerne.","Fragen Sie einen Mitarbeiter am Schalter!"}	2	14	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7768	mitnehmen	{"to take with"}	{"Nimm bitte den Regenschirm mit!","Kann ich das Buch mitnehmen?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7769	nah	{close}	{"Der Bahnhof ist nah am Hotel.","Ist der Supermarkt nah oder weit?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7770	nämlich	{namely}	{"Ich komme später, nämlich um 20 Uhr.","Er ist nicht hier, nämlich im Büro."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7771	nummer	{number}	{"Die Nummer des Busses ist 45.","Schreib deine Telefonnummer auf!"}	2	14	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7772	option	{option}	{"Wir haben zwei Optionen für die Reise.","Welche Option bevorzugst du?"}	2	14	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7773	passieren	{"to happen"}	{"Was ist hier passiert?","So etwas passiert selten."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7774	pech	{"bad luck"}	{"Heute habe ich echt Pech!","Pech im Spiel, Glück in der Liebe."}	2	14	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7775	planmäßig	{"on schedule"}	{"Der Zug kommt planmäßig um 14 Uhr an.","Alles läuft planmäßig."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7776	preiswert	{inexpensive}	{"Das Hotel ist preiswert und sauber.","Suche preiswertes Essen in der Stadt."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7777	reisemöglichkeit	{"travel option"}	{"Es gibt viele Reisemöglichkeiten nach Paris.","Welche Reisemöglichkeit ist die beste?"}	2	14	2	\N	reisemöglichkeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7778	reiseziel	{"travel destination"}	{"Unser Reiseziel ist die Nordsee.","Was ist dein Traum-Reiseziel?"}	2	14	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7779	richtung	{direction}	{"Der Bus fährt in Richtung Zentrum.","In welche Richtung gehen wir?"}	2	14	2	\N	richtungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7780	rückfahrt	{"return journey"}	{"Die Rückfahrt war sehr entspannt.","Wann beginnt die Rückfahrt?"}	2	14	2	\N	rückfahrten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7781	schaffner/in	{conductor}	{"Der Schaffner kontrolliert die Tickets.","Fragen Sie den Schaffner nach der Haltestelle!"}	2	14	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7783	schwarzfahren	{"to fare-dodge"}	{"Schwarzfahren ist illegal.","Er wurde beim Schwarzfahren erwischt."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7784	schwierig	{difficult}	{"Die Prüfung war sehr schwierig.","Es ist schwierig, den Zug zu finden."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7785	senior/in	{senior}	{"Senioren fahren oft kostenlos mit dem Bus.","Die Seniorin braucht einen Sitzplatz."}	2	14	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7786	serviceschalter	{"service counter"}	{"Fragen Sie am Serviceschalter nach Hilfe!","Der Serviceschalter ist geschlossen."}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7787	sondern	{but}	{"Nicht heute, sondern morgen.","Er ist nicht müde, sondern hungrig."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7788	sparen	{"to save"}	{"Wir sparen Geld für die Reise.","Spare Energie, wo du kannst!"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7789	station	{station}	{"Die nächste Station ist der Hauptbahnhof.","An welcher Station steigen wir aus?"}	2	14	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7790	störung	{disruption}	{"Es gibt eine Störung auf der Strecke.","Die Störung wird bald behoben."}	2	14	2	\N	störungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7791	strafe	{penalty}	{"Schwarzfahren führt zu einer Strafe.","Die Strafe beträgt 60 Euro."}	2	14	2	\N	strafen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7792	strecke	{route}	{"Die Strecke nach Hamburg ist lang.","Die Zugstrecke ist gesperrt."}	2	14	2	\N	strecken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7793	umwelt	{environment}	{"Bahnfahren schont die Umwelt.","Schütze die Umwelt!"}	2	14	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7794	unterwegs	{"en route"}	{"Wir sind gerade unterwegs zum Bahnhof.","Unterwegs habe ich einen Freund getroffen."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7795	verbindung	{connection}	{"Die Zugverbindung ist sehr gut.","Gibt es eine direkte Verbindung?"}	2	14	2	\N	verbindungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7796	verehrt, verehrte	{“dear”}	{"Verehrte Gäste, herzlich willkommen!","Sehr verehrte Damen und Herren..."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7797	verpassen	{"to miss"}	{"Wir verpassen den Zug!","Ich habe den Anruf verpasst."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7798	verschlafen	{"to oversleep"}	{"Ich habe verschlafen und den Bus verpasst.","Verschiebst du nie?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7799	verspätet	{late}	{"Der Zug ist 20 Minuten verspätet.","Warum bist du verspätet?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7800	verspätung	{delay}	{"Die Verspätung beträgt eine Stunde.","Entschuldigung für die Verspätung!"}	2	14	2	\N	verspätungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7801	vorsicht	{caution}	{"Vorsicht bei der Abfahrt des Zuges!","Vorsicht, die Tür schließt automatisch!"}	2	14	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7802	wenig	{little}	{"Es gibt wenig Platz im Bus.","Ich habe wenig Zeit."}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7803	wohl	{probably}	{"Der Zug ist wohl schon abgefahren.","Du bist wohl müde?"}	2	14	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7804	zeitschrift	{magazine}	{"Ich lese eine Zeitschrift im Zug.","Kaufst du die Zeitschrift am Kiosk?"}	2	14	2	\N	zeitschriften	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7805	zoo	{zoo}	{"Der Zoo hat viele Tiere.","Besuchen wir den Zoo am Wochenende!"}	2	14	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7806	ablesen	{"to read from"}	{"Ich lese den Zählerstand ab.","Der Techniker liest die Daten vom Gerät ab."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7807	ablesung	{reading}	{"Die Ablesung des Stromzählers erfolgt monatlich.","Die Ablesung war fehlerhaft."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7808	abstellen	{"to park","to put down"}	{"Stell das Fahrrad im Hof ab!","Wir stellen die Möbel vorübergehend ab."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7809	afrikanisch	{African}	{"Die afrikanische Kunst ist sehr farbenfroh.","Wir kochen ein afrikanisches Gericht."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7810	altglas	{"waste glass"}	{"Wir werfen Altglas in den Glascontainer.","Altglas wird recycelt."}	2	15	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7811	aufschließen	{"to unlock"}	{"Kannst du die Tür bitte aufschließen?","Ich schließe den Schrank mit dem Schlüssel auf."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7812	ausführen	{"to execute"}	{"Der Hund muss täglich ausgeführt werden.","Wir führen den Plan wie besprochen aus."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7813	ausgeben	{"to spend"}	{"Ich gebe zu viel Geld für Möbel aus.","Gib den Schlüssel beim Nachbarn aus!"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7814	ausziehen	{"to move out"}	{"Er zieht nächsten Monat aus der Wohnung aus.","Wann ziehst du aus?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7815	beachten	{"to consider"}	{"Beachte die Hausordnung!","Wir beachten die Hinweise des Vermieters."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7816	bedeuten	{"to mean"}	{"Was bedeutet dieses Wort?","Das Schild bedeutet „Vorsicht“."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7817	beinbruch	{"leg fracture"}	{"Nach dem Unfall hatte er einen Beinbruch.","Ein Beinbruch braucht Zeit zum Heilen."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7818	berufstätig	{employed}	{"Meine Mutter ist berufstätig.","Berufstätige Eltern brauchen oft Hilfe."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7819	beschwerde	{complaint}	{"Ich habe eine Beschwerde beim Vermieter eingereicht.","Die Beschwerde wurde bearbeitet."}	2	15	2	\N	beschwerden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7820	besichtigen	{"to visit"}	{"Wir besichtigen die neue Wohnung.","Können wir das Haus morgen besichtigen?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7821	bezirk	{district}	{"Wir wohnen im Bezirk Mitte.","Dieser Bezirk ist sehr ruhig."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7822	biomüll	{biowaste}	{"Biomüll kommt in die braune Tonne.","Der Biomüll riecht nicht gut."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7823	biotonne	{"biowaste container"}	{"Stell die Biotonne bitte raus!","Die Biotonne ist voll."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7824	brett	{board}	{"Das Brett ist kaputt.","Häng das Brett an die Wand!"}	2	15	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7825	briefkasten	{mailbox}	{"Der Briefkasten ist am Eingang.","Wirft du die Post in den Briefkasten?"}	2	15	1	\N	briefkästen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7826	darum	{therefore}	{"Es regnet, darum bleiben wir zu Hause.","Ich bin müde, darum gehe ich früh ins Bett."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7827	dass	{that}	{"Ich hoffe, dass du kommst.","Er sagt, dass er krank ist."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7828	ecke	{corner}	{"Das Sofa steht in der Ecke.","An der Ecke gibt es einen Supermarkt."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7829	einbauküche	{"built-in kitchen"}	{"Die Wohnung hat eine moderne Einbauküche.","Eine Einbauküche ist praktisch."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7831	einweihungsparty	{"housewarming party"}	{"Wir feiern eine Einweihungsparty am Samstag.","Lädst du Nachbarn zur Einweihungsparty ein?"}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7832	einwurfzeit	{"time slot for putting out rubbish"}	{"Die Einwurfzeit für Müll ist morgens.","Beachte die Einwurfzeiten der Tonnen!"}	2	15	2	\N	einwurfzeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7833	einziehen	{"to move in"}	{"Wann ziehst du in die neue Wohnung ein?","Sie zieht nächste Woche ein."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7834	einzug	{"move in"}	{"Der Einzug war stressig.","Wir feiern den Einzug mit Freunden."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7835	entsorgen	{"to dispose of"}	{"Wie entsorge ich Elektroschrott?","Der Müll wird jeden Dienstag entsorgt."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7836	erfolgen	{"to take place"}	{"Die Reparatur erfolgt nächste Woche.","Die Zahlung erfolgt per Überweisung."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7837	fahrradständer	{"bicycle stand"}	{"Stell das Fahrrad am Fahrradständer ab!","Der Fahrradständer ist voll."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7838	fernwärme	{"remote heating"}	{"Unsere Wohnung hat Fernwärme.","Fernwärme ist umweltfreundlich."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7839	gas	{gas}	{"Die Heizung läuft mit Gas.","Gas ist teurer geworden."}	2	15	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7840	gassi gehen	{"to walk the dog"}	{"Ich gehe mit dem Hund Gassi.","Gehst du heute Abend Gassi?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7841	gehören	{"to belong"}	{"Das Haus gehört meinem Onkel.","Wem gehört dieser Schlüssel?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7842	gesondert	{separate}	{"Bitte entsorge Glas gesondert.","Die Dokumente werden gesondert aufbewahrt."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7843	glascontainer	{"bottle bank"}	{"Wir werfen Altglas in den Glascontainer.","Der Glascontainer ist voll."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7844	hausbewohner/in	{"house resident"}	{"Alle Hausbewohner sind freundlich.","Der Hausbewohner hilft beim Umzug."}	2	15	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7845	hausmeister/in	{caretaker}	{"Der Hausmeister repariert die Tür.","Fragen Sie den Hausmeister nach dem Schlüssel!"}	2	15	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7846	hausordnung	{"house rules"}	{"Die Hausordnung steht im Treppenhaus.","Beachte die Hausordnung!"}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7847	hausregel	{"house rule"}	{"Laut Hausregel ist Lärm nach 22 Uhr verboten.","Welche Hausregeln gibt es hier?"}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7848	hausreinigung	{"house cleaning"}	{"Die Hausreinigung findet wöchentlich statt.","Wer macht die Hausreinigung?"}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7849	hausverwaltung	{"property management"}	{"Die Hausverwaltung ist für Reparaturen zuständig.","Ich rufe die Hausverwaltung an."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7850	herzlich	{warm}	{"Herzlich willkommen in unserer neuen Wohnung!","Die Nachbarn sind herzlich."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7851	hoch	{high}	{"Die Miete ist sehr hoch.","Das Regal ist zu hoch für mich."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7852	hof	{yard}	{"Die Kinder spielen im Hof.","Unser Hof hat einen Garten."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7853	hoffen	{"to hope"}	{"Ich hoffe, die Wohnung gefällt dir.","Wir hoffen auf schnellen Einzug."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7854	jemand	{someone}	{"Ist jemand zu Hause?","Kann jemand helfen?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7855	kellerzugang	{"cellar entrance"}	{"Der Kellerzugang ist neben der Treppe.","Wo ist der Kellerzugang?"}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7856	kinderwagen	{"baby buggy"}	{"Der Kinderwagen steht im Flur.","Wir kaufen einen neuen Kinderwagen."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7857	kleinmöbel	{"small pieces of furniture"}	{"Kleinmöbel machen die Wohnung gemütlich.","Wir kaufen neue Kleinmöbel."}	2	15	2	\N	kleinmöbel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7858	kommode	{dresser}	{"Die Kommode steht im Schlafzimmer.","In der Kommode liegen die Socken."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7859	kündigen	{"to terminate"}	{"Ich kündige den Mietvertrag.","Der Mieter hat gekündigt."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7860	legen	{"to lay"}	{"Leg die Schlüssel auf den Tisch!","Ich lege die Decke aufs Sofa."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7861	leidtun	{"to be sorry"}	{"Es tut mir leid, ich habe dich geweckt.","Das tut mir wirklich leid."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7862	lieferant/in	{supplier}	{"Der Lieferant bringt das Paket.","Die Lieferantin kommt um 10 Uhr."}	2	15	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7863	liefern	{"to supply"}	{"Der Supermarkt liefert Lebensmittel.","Wann liefern Sie die Möbel?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7864	makler/in	{broker}	{"Der Makler zeigt uns die Wohnung.","Die Maklerin ist sehr freundlich."}	2	15	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7865	mieter/in	{tenant}	{"Der Mieter zahlt pünktlich die Miete.","Die Mieterin hat einen Hund."}	2	15	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7866	mitbewohner/in	{roommate}	{"Mein Mitbewohner kocht gerne.","Die Mitbewohnerin ist sehr ordentlich."}	2	15	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7867	mitteilung	{notification}	{"An der Tür hängt eine Mitteilung.","Die Mitteilung ist wichtig."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7868	müllabfuhr	{"garbage disposal"}	{"Die Müllabfuhr kommt jeden Dienstag.","Warum ist die Müllabfuhr heute nicht gekommen?"}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7869	nachbarschaft	{neighbourhood}	{"Die Nachbarschaft ist sehr ruhig.","In unserer Nachbarschaft gibt es einen Park."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7870	nachricht	{message}	{"Hast du die Nachricht vom Vermieter gelesen?","Ich schreibe eine Nachricht an den Hausmeister."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7871	nachtisch	{dessert}	{"Zum Nachtisch gibt es Eis.","Der Nachtisch war köstlich."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7872	nähe	{proximity}	{"Die Wohnung liegt in der Nähe des Bahnhofs.","In der Nähe gibt es einen Supermarkt."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7873	ordnungsgemäß	{proper}	{"Entsorge den Müll ordnungsgemäß!","Die Reparatur erfolgte ordnungsgemäß."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7874	privat	{private}	{"Das ist ein privater Parkplatz.","Der Garten ist privat."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7875	reichlich	{abundant}	{"Es gibt reichlich Platz im Keller.","Wir haben reichlich Zeit."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7876	restmüll	{"residual waste"}	{"Restmüll kommt in die schwarze Tonne.","Die Restmülltonne ist voll."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7877	schließlich	{finally}	{"Schließlich haben wir die Wohnung gefunden.","Schließlich war alles erledigt."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7878	schonen	{"to treat with care"}	{"Schone die Möbel beim Umzug!","Wir schonen die Umwelt."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7879	setzen	{"to sit"}	{"Setz dich aufs Sofa!","Ich setze mich an den Tisch."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7880	sogar	{even}	{"Sogar der Vermieter war überrascht.","Es war sogar billiger als erwartet."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7881	sorgen	{"to care"}	{"Ich sorge für die Pflanzen.","Wer sorgt für den Hund?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7882	sorgfältig	{thoroughly}	{"Arbeite sorgfältig!","Die Reinigung war sehr sorgfältig."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7883	spaziergang	{walk}	{"Nach dem Umzug machen wir einen Spaziergang.","Ein Spaziergang im Park entspannt."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7884	spiegel	{mirror}	{"Der Spiegel hängt im Badezimmer.","Kannst du den Spiegel aufhängen?"}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7885	stellplatz	{"parking space"}	{"Die Wohnung hat einen Stellplatz für das Auto.","Der Stellplatz ist vermietet."}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7887	tonne	{barrel}	{"Die Mülltonne steht draußen.","Die Tonne ist schwer."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7888	trennen	{"to separate"}	{"Trenne den Müll nach Material!","Wir trennen Papier und Plastik."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7889	treppe	{stairs}	{"Die Treppe ist steil.","Wir gehen die Treppe hoch."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7890	treppenhaus	{stairway}	{"Das Treppenhaus muss sauber bleiben.","Im Treppenhaus hängen Informationen."}	2	15	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7891	übernehmen	{"to assume"}	{"Ich übernehme die Verantwortung.","Wer übernimmt die Kosten?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7896	verbraucherzähler	{"consumption meter"}	{"Der Verbraucherzähler zeigt den Stromverbrauch.","Lies den Verbraucherzähler ab!"}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7897	vereinbaren	{"to arrange"}	{"Wir vereinbaren einen Termin mit dem Vermieter.","Kannst du eine Zeit vereinbaren?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7898	vermieter/in	{landlord}	{"Der Vermieter repariert die Heizung.","Die Vermieterin ist sehr nett."}	2	15	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7899	vermieten	{"to let"}	{"Wir vermieten die Wohnung ab nächsten Monat.","Vermietest du das Zimmer?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7900	vorhanden	{available}	{"Ist ein Parkplatz vorhanden?","Die Dokumente sind vorhanden."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7901	wegen	{"due to"}	{"Wegen des Regens bleiben wir zu Hause.","Der Termin fällt wegen Krankheit aus."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7902	weil	{because}	{"Ich bin müde, weil ich spät gearbeitet habe.","Wir bleiben hier, weil es regnet."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7903	weiterhin	{still}	{"Weiterhin viel Erfolg in der neuen Wohnung!","Wir bleiben weiterhin in Kontakt."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7904	wohngemeinschaft	{"flat share"}	{"Ich lebe in einer Wohngemeinschaft.","Die Wohngemeinschaft sucht einen neuen Mitbewohner."}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7905	wohnungsbesichtigung	{"flat viewing"}	{"Die Wohnungsbesichtigung ist um 15 Uhr.","Wie war die Wohnungsbesichtigung?"}	2	15	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7906	wunsch	{wish}	{"Hast du einen Wunsch für die neue Wohnung?","Mein Wunsch ist ein Balkon."}	2	15	1	\N	wünsche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7907	zähler	{meter}	{"Der Zähler muss monatlich abgelesen werden.","Wo ist der Stromzähler?"}	2	15	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7908	zugang	{entry}	{"Der Zugang zur Wohnung ist gesichert.","Hast du einen Zugang zum Keller?"}	2	15	1	\N	zugänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7909	zuletzt	{recently}	{"Zuletzt haben wir die Möbel aufgebaut.","Wann warst du zuletzt im Supermarkt?"}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7910	zuzüglich	{plus}	{"Die Miete beträgt 800 Euro zuzüglich Nebenkosten.","Der Preis ist zuzüglich Versandkosten."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7911	abgeben	{"to submit"}	{"Ich gebe das Formular beim Amt ab.","Kannst du den Müll abgeben?"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7912	ablehnen	{"to refuse"}	{"Der Antrag wurde abgelehnt.","Sie lehnt das Angebot ab."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7913	abmelden	{"to deregister"}	{"Ich melde mich beim Einwohnermeldeamt ab.","Vergiss nicht, den Hund abzumelden!"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7914	abmeldung	{deregistration}	{"Die Abmeldung dauert nur fünf Minuten.","Wo ist das Formular für die Abmeldung?"}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7915	ähnlich	{similar}	{"Die Unterschriften sehen ähnlich aus.","Das Problem ist ähnlich wie letztes Jahr."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7916	amt	{office}	{"Das Amt öffnet um 8 Uhr.","Ich gehe heute zum Amt."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7917	amtsdeutsch	{"official German"}	{"Amtsdeutsch ist manchmal schwer zu verstehen.","Der Brief ist in Amtsdeutsch geschrieben."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7918	ändern	{"to change"}	{"Ich ändere meine Adresse beim Amt.","Kannst du den Termin ändern?"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7919	angehörige	{relative}	{"Angehörige müssen das Formular unterschreiben.","Sind Angehörige im Ausland?"}	2	16	5	\N	angehörigen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7920	ankreuzen	{"to mark with a cross"}	{"Kreuze das richtige Feld an!","Ich habe die Antwort angekreuzt."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7921	anschrift	{address}	{"Gib bitte deine aktuelle Anschrift an!","Die Anschrift ist unleserlich."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7923	antragsteller/in	{applicant}	{"Der Antragsteller wartet auf eine Antwort.","Die Antragstellerin hat alle Unterlagen eingereicht."}	2	16	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7924	arbeitsagentur	{"employment agency"}	{"Ich gehe zur Arbeitsagentur, um einen Job zu suchen.","Die Arbeitsagentur hilft bei der Stellensuche."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7925	arbeitserlaubnis	{"work permit"}	{"Ich beantrage eine Arbeitserlaubnis.","Ohne Arbeitserlaubnis darf man nicht arbeiten."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7926	arbeitslosengeld	{"unemployment benefit"}	{"Er bezieht Arbeitslosengeld.","Das Arbeitslosengeld wird monatlich überwiesen."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7927	arbeitsplatz	{workplace}	{"Mein Arbeitsplatz ist in der Innenstadt.","Der Arbeitsplatz muss sicher sein."}	2	16	1	\N	arbeitsplätze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7993	anbieten	{"to offer"}	{"Die Schule bietet Sprachkurse an.","Kannst du mir Hilfe anbieten?"}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7928	arbeitsvermittlung	{"employment service"}	{"Die Arbeitsvermittlung findet passende Jobs.","Ich bin bei der Arbeitsvermittlung registriert."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7929	aufenthalt	{stay}	{"Mein Aufenthalt in Deutschland ist befristet.","Der Aufenthalt im Ausland war spannend."}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7930	aufenthaltserlaubnis	{"residence permit"}	{"Ich verlängere meine Aufenthaltserlaubnis.","Die Aufenthaltserlaubnis ist abgelaufen."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7931	aufrufen	{"to call up"}	{"Bitte rufen Sie die Website auf!","Die Behörde ruft Ihre Daten auf."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7932	ausbildungsplatz	{"training place"}	{"Ich suche einen Ausbildungsplatz als Mechaniker.","Der Ausbildungsplatz ist sehr gefragt."}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7933	ausländeramt	{"immigration office"}	{"Das Ausländeramt ist heute geschlossen.","Termine beim Ausländeramt sind schwer zu bekommen."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7934	ausländerbehörde	{"immigration authorities"}	{"Die Ausländerbehörde bearbeitet meinen Antrag.","Wo ist die Ausländerbehörde?"}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7935	ausweis	{"ID (identification document)"}	{"Zeigen Sie bitte Ihren Ausweis!","Mein Ausweis ist abgelaufen."}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7936	beantragen	{"to apply for"}	{"Ich beantrage einen neuen Pass.","Hast du die Erlaubnis beantragt?"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7937	bearbeiten	{"to edit"}	{"Das Amt bearbeitet meinen Antrag.","Kannst du das Dokument bearbeiten?"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7938	behörde	{authorities}	{"Die Behörde antwortet langsam.","Welche Behörde ist zuständig?"}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7939	berufsberatung	{"career guidance"}	{"Die Berufsberatung hilft bei der Jobsuche.","Ich habe einen Termin bei der Berufsberatung."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7940	berufsinformationszentrum	{"career information centre"}	{"Das Berufsinformationszentrum bietet viele Ressourcen.","Besuche das Berufsinformationszentrum!"}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7941	cousin/e	{cousin}	{"Mein Cousin wohnt in Berlin.","Die Cousine kommt aus Spanien."}	2	16	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7942	dabei	{thereby}	{"Das Formular liegt dabei.","Ich helfe dir dabei."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7943	dokument	{document}	{"Bringe alle Dokumente zum Amt!","Das Dokument ist unterschrieben."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7944	ehepartner/in	{spouse}	{"Mein Ehepartner kommt mit zum Termin.","Der Ehepartner muss ebenfalls unterschreiben."}	2	16	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7945	eheschließung	{marriage}	{"Die Eheschließung findet im Standesamt statt.","Wir planen unsere Eheschließung."}	2	16	2	\N	eheschließungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7946	einwohnermeldeamt	{"registration office"}	{"Melde dich beim Einwohnermeldeamt an!","Das Einwohnermeldeamt ist überfüllt."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7947	enkel/in	{grandson/granddaughter}	{"Mein Enkel besucht mich jeden Sommer.","Die Enkelin lebt in Frankreich."}	2	16	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7948	enkelkind	{grandchild}	{"Das Enkelkind geht noch zur Schule.","Meine Enkelkinder sind süß."}	2	16	3	\N	enkelkinder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7949	entschuldigen	{"to excuse"}	{"Entschuldigen Sie die Verspätung!","Ich entschuldige mich für den Fehler."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7950	familienbuch	{"family register"}	{"Das Familienbuch liegt beim Standesamt.","Überprüfe das Familienbuch für die Daten."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7951	familienkasse	{"family fund"}	{"Die Familienkasse zahlt das Kindergeld.","Antrag bei der Familienkasse stellen!"}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7952	familienmitglied	{"family member"}	{"Alle Familienmitglieder sind eingeladen.","Ein Familienmitglied hilft beim Umzug."}	2	16	3	\N	familienmitglieder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7953	fehlen	{"to miss"}	{"Ein Dokument fehlt in den Unterlagen.","Warum fehlst du heute?"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7954	finanzamt	{"tax office"}	{"Das Finanzamt prüft meine Steuererklärung.","Ich schreibe dem Finanzamt einen Brief."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7955	geburt	{birth}	{"Die Geburt des Kindes wurde registriert.","Die Geburt war im Krankenhaus."}	2	16	2	\N	geburten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7956	geburtsdatum	{"date of birth"}	{"Gib dein Geburtsdatum an!","Das Geburtsdatum steht im Pass."}	2	16	3	\N	geburtsdaten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7957	geburtsland	{"country of birth"}	{"Mein Geburtsland ist Italien.","Das Geburtsland wird im Formular abgefragt."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7958	geburtsname	{"name at birth"}	{"Der Geburtsname der Mutter ist erforderlich.","Mein Geburtsname steht in der Urkunde."}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7959	geburtsort	{"place of birth"}	{"Mein Geburtsort ist München.","Der Geburtsort wird im Ausweis angegeben."}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7960	geburtsurkunde	{"birth certificate"}	{"Die Geburtsurkunde muss beglaubigt werden.","Wo ist deine Geburtsurkunde?"}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7961	genehmigen	{"to approve"}	{"Der Antrag wurde genehmigt.","Die Behörde genehmigt den Aufenthalt."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7962	geschlecht	{gender}	{"Das Geschlecht wird im Formular abgefragt.","Bitte geben Sie Ihr Geschlecht an!"}	2	16	3	\N	geschlechter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7963	herein	{within}	{"Kommen Sie herein!","Herein, bitte!"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7964	hingehen	{"to go there"}	{"Ich gehe morgen zum Amt hingehen.","Wann gehst du zur Behörde hingehen?"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7966	integrationskurs	{"integration course"}	{"Ich besuche einen Integrationskurs.","Der Integrationskurs hilft beim Deutschlernen."}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7967	kindergeld	{"child allowance"}	{"Das Kindergeld wird monatlich überwiesen.","Beantrage das Kindergeld frühzeitig!"}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7968	lebenspartner/in	{"life partner"}	{"Mein Lebenspartner unterstützt mich.","Die Lebenspartnerin arbeitet im Ausland."}	2	16	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7969	lichtbildausweis	{"photo ID"}	{"Ein Lichtbildausweis ist erforderlich.","Hast du einen Lichtbildausweis dabei?"}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7970	losfahren	{"to drive away"}	{"Wir fahren um 8 Uhr los.","Der Bus ist schon losgefahren."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7971	männlich	{male}	{"Das Geschlecht ist männlich.","Der Antragsteller ist männlich."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7972	nichte	{niece}	{"Meine Nichte wohnt in Hamburg.","Die Nichte besucht uns nächste Woche."}	2	16	2	\N	nichten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7973	notieren	{"to note"}	{"Notiere dir den Termin!","Ich notiere die Adresse des Amts."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7974	personalausweis	{"personal ID"}	{"Mein Personalausweis ist gültig bis 2030.","Zeigen Sie bitte Ihren Personalausweis!"}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7975	reisepass	{passport}	{"Mein Reisepass muss verlängert werden.","Hast du den Reisepass dabei?"}	2	16	1	\N	reisepässe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7976	schwiegereltern	{parents-in-law}	{"Meine Schwiegereltern wohnen in Österreich.","Die Schwiegereltern kommen zu Besuch."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7977	staatsangehörigkeit	{nationality}	{"Meine Staatsangehörigkeit ist deutsch.","Die Staatsangehörigkeit steht im Pass."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7978	team	{team}	{"Das Team der Behörde ist freundlich.","Unser Team hilft bei Fragen."}	2	16	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7979	teil	{part}	{"Ein Teil der Unterlagen fehlt.","Der schwierige Teil ist geschafft."}	2	16	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7980	unterlagen	{documents}	{"Bringen Sie alle Unterlagen mit!","Die Unterlagen sind vollständig."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7981	unterschreiben	{"to sign"}	{"Unterschreiben Sie hier, bitte!","Ich unterschreibe den Vertrag morgen."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7982	urkunde	{certificate}	{"Die Urkunde wird per Post verschickt.","Die Geburtsurkunde liegt im Safe."}	2	16	2	\N	urkunden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7983	vollständig	{complete}	{"Die Unterlagen sind vollständig.","Bist du vollständig gesund?"}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7984	webseite	{website}	{"Die Webseite der Behörde ist informativ.","Besuche die offizielle Webseite!"}	2	16	2	\N	webseiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7985	weiblich	{female}	{"Das Geschlecht ist weiblich.","Die Antragstellerin ist weiblich."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7986	wiederholen	{"to repeat"}	{"Wiederholen Sie bitte Ihre Adresse!","Ich wiederhole den Antrag nächste Woche."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7987	zulassungsstelle	{"admission office"}	{"Die Zulassungsstelle ist heute geschlossen.","Ich gehe zur Zulassungsstelle für mein Auto."}	2	16	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7988	zuständig	{responsible}	{"Welche Behörde ist zuständig?","Der zuständige Mitarbeiter hilft weiter."}	2	16	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7989	abitur (abi)	{A-level}	{"Mein Bruder macht dieses Jahr Abitur.","Nach dem Abitur möchte ich studieren."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7990	ablegen	{"to take (an exam)"}	{"Ich lege morgen eine Prüfung ab.","Sie hat das Abitur erfolgreich abgelegt."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7991	abschließen	{"to complete"}	{"Ich schließe mein Studium nächsten Monat ab.","Hast du die Aufgabe abgeschlossen?"}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7992	abschluss	{degree}	{"Mein Abschluss ist in Informatik.","Der Abschluss eröffnet viele Möglichkeiten."}	2	17	1	\N	abschlüsse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7994	anfänger/in	{beginner}	{"Der Anfänger lernt schnell Deutsch.","Die Anfängerin besucht einen Kurs."}	2	17	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7995	architektur	{architecture}	{"Ich studiere Architektur.","Die Architektur des Gebäudes ist modern."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7996	ausland	{abroad}	{"Ich möchte im Ausland studieren.","Das Ausland bietet neue Erfahrungen."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7997	autounfall	{"car accident"}	{"Der Autounfall blockiert die Straße.","Glücklicherweise war niemand verletzt."}	2	17	1	\N	autounfälle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7998	beenden	{"to end"}	{"Wir beenden den Kurs im Juni.","Beende deine Hausaufgaben!"}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8000	bereich	{area}	{"Mein Bereich ist die Technik.","In welchem Bereich arbeitest du?"}	2	17	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8002	berufsschule	{"vocational college"}	{"Die Berufsschule ist jeden Freitag.","In der Berufsschule lerne ich Theorie."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8003	besonders	{especially}	{"Mathe ist besonders schwer.","Das war ein besonders schöner Tag."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8004	bildungsweg	{"course of education"}	{"Mein Bildungsweg führt zur Universität.","Welchen Bildungsweg möchtest du wählen?"}	2	17	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8005	bürororganisation	{"office administration"}	{"Bürororganisation ist Teil meines Jobs.","Ich lerne Bürororganisation in der Schule."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8006	chaos	{chaos}	{"Im Klassenzimmer herrscht Chaos.","Chaos entsteht, wenn niemand aufräumt."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8007	decke	{ceiling}	{"Die Decke im Klassenzimmer ist hoch.","An der Decke hängt eine Lampe."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8008	ende	{end}	{"Das Ende des Schuljahres ist nah.","Am Ende der Straße ist die Schule."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8009	energie	{energy}	{"Ich habe keine Energie mehr für Hausaufgaben.","Erneuerbare Energie ist wichtig."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8010	enthalten	{"to contain"}	{"Das Buch enthält viele Übungen.","Der Kurs enthält praktische Beispiele."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8011	entscheiden	{"to decide"}	{"Ich entscheide mich für ein Studium.","Entscheide schnell, der Termin endet bald!"}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8012	erforderlich	{required}	{"Mathe ist für den Abschluss erforderlich.","Welche Unterlagen sind erforderlich?"}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8013	fitness	{fitness}	{"Fitness ist wichtig für die Gesundheit.","Ich trainiere im Fitnessstudio."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8014	fliehen	{"to flee"}	{"Viele Menschen fliehen vor Krieg.","Die Tiere fliehen vor dem Feuer."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8015	fortgeschritten	{advanced}	{"Dieser Kurs ist für fortgeschrittene Lerner.","Mein Englisch ist fortgeschritten."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8016	frisör/in	{hairdresser}	{"Der Frisör schneidet meine Haare.","Die Frisörin arbeitet im Salon."}	2	17	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8017	genial	{great}	{"Deine Idee ist genial!","Das war ein genialer Film."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8018	hoffentlich	{hopefully}	{"Hoffentlich bestehe ich die Prüfung.","Hoffentlich regnet es morgen nicht."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8020	kategorie	{category}	{"Wählen Sie eine Kategorie aus!","In welcher Kategorie bist du gut?"}	2	17	2	\N	kategorien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8021	kaufmännisch	{business}	{"Ich mache eine kaufmännische Ausbildung.","Kaufmännische Kenntnisse sind gefragt."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8022	kenntnisse	{knowledge}	{"Meine Kenntnisse in Mathe sind gut.","Sprachkenntnisse sind wichtig."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8023	kommunikation	{communication}	{"Gute Kommunikation ist im Team wichtig.","Wir lernen Kommunikation im Kurs."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8024	kompakt	{compact}	{"Der Kurs ist kompakt und effizient.","Das Handbuch ist kompakt gestaltet."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8025	kürzen	{"to shorten"}	{"Ich kürze den Text auf eine Seite.","Die Regierung kürzt das Budget."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8026	kurzgebühr	{"course fee"}	{"Die Kursgebühr beträgt 200 Euro.","Zahle die Kursgebühr bitte rechtzeitig!"}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8001	berufsausbildung	{"professional training"}	{"Die Berufsausbildung dauert drei Jahre.","Eine Berufsausbildung kombiniert Praxis und Theorie."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8019	jobben	{"to do casual/part-time work"}	{"Während des Studiums jobbt er in einem Supermarkt.","Viele Schüler jobben in den Ferien."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8027	kurzprogramm	{"short program"}	{"Das Kurzprogramm dauert nur zwei Wochen.","Ich nehme am Kurzprogramm teil."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8028	lebensweg	{"journey through life"}	{"Mein Lebensweg war nicht einfach.","Der Lebensweg jedes Menschen ist einzigartig."}	2	17	1	\N	lebenswege	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8029	lehre	{apprenticeship}	{"Er macht eine Lehre als Elektriker.","Die Lehre dauert drei Jahre."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8030	lehrmaterial	{"teaching material"}	{"Das Lehrmaterial ist online verfügbar.","Wir verwenden modernes Lehrmaterial."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8031	material	{material}	{"Das Material für den Kurs ist teuer.","Hast du das benötigte Material?"}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8032	miserabel	{miserable}	{"Die Prüfung war miserabel schwer.","Ich fühle mich miserabel."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8033	mittlere	{middle}	{"Die mittlere Stufe ist am beliebtesten.","Er hat einen mittleren Schulabschluss."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8034	prost	{Cheers!}	{"Prost! Auf deinen Erfolg!","Wir sagen Prost zum Abschluss."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8035	prüfung	{exam}	{"Die Prüfung war sehr schwer.","Ich lerne jeden Tag für die Prüfung."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8036	prüfungstraining	{"exam training"}	{"Das Prüfungstraining hilft mir sehr.","Wir machen ein Prüfungstraining nächste Woche."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8037	realschulabschluss	{"secondary school certificate"}	{"Sie hat den Realschulabschluss bestanden.","Ohne Realschulabschluss ist die Jobsuche schwer."}	2	17	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8038	reisen	{"to travel"}	{"Nach der Schule möchte ich reisen.","Reisen bildet."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8039	rhythmisch	{rhythmical}	{"Die Musik ist sehr rhythmisch.","Rhythmische Bewegungen helfen beim Lernen."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8040	schaffen	{"to succeed"}	{"Ich schaffe die Prüfung bestimmt!","Schaffst du es morgen pünktlich?"}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8041	schulzeit	{"school days"}	{"Meine Schulzeit war sehr schön.","In der Schulzeit habe ich viel gelernt."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8042	seit	{since}	{"Seit 2020 lerne ich Deutsch.","Seit dem Abitur arbeite ich."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8043	semester	{term}	{"Das Semester endet im Juli.","Im nächsten Semester studiere ich im Ausland."}	2	17	3	\N	semester	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8044	separat	{separate}	{"Die Prüfungen finden separat statt.","Bitte bezahle die Gebühren separat."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8045	situation	{situation}	{"Die Situation im Unterricht war stressig.","In schwierigen Situationen bleibe ich ruhig."}	2	17	2	\N	situationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8046	städtisch	{urban}	{"Die städtische Schule ist gut ausgestattet.","Städtische Verkehrsmittel sind praktisch."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8047	terminplanung	{scheduling}	{"Die Terminplanung für Prüfungen ist wichtig.","Meine Terminplanung hilft mir beim Lernen."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8048	test	{test}	{"Der Test war einfacher als erwartet.","Wir schreiben nächste Woche einen Test."}	2	17	1	\N	tests	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8049	thema	{topic}	{"Das Thema des Aufsatzes ist interessant.","Welches Thema wählst du für die Präsentation?"}	2	17	3	\N	themen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8050	theorie	{theory}	{"Die Theorie verstehe ich, aber die Praxis ist schwer.","Wir lernen viel Theorie in der Schule."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8151	duschgel	{"shower gel"}	{"Ich kaufe neues Duschgel.","Duschgel riecht nach Lavendel."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8051	trainieren	{"to train"}	{"Ich trainiere jeden Tag für den Sporttest.","Trainiere deine Aussprache regelmäßig!"}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8052	training	{training}	{"Das Training für die Prüfung beginnt morgen.","Ohne Training ist Erfolg schwer."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8053	trick	{trick}	{"Kannst du mir einen Mathe-Trick zeigen?","Dieser Trick hilft beim Lernen."}	2	17	1	\N	tricks	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8054	überraschung	{surprise}	{"Die Überraschungsparty war ein Erfolg!","Eine Überraschung erwartet dich nach der Prüfung."}	2	17	2	\N	überraschungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8055	überschrift	{heading}	{"Die Überschrift des Artikels ist fett gedruckt.","Schreibe eine klare Überschrift!"}	2	17	2	\N	überschriften	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8056	umschreiben	{"to re-write"}	{"Kannst du den Satz umschreiben?","Ich umschreibe meine Notizen für die Prüfung."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8057	verlieben	{"to fall in love"}	{"Er hat sich in seine Klassenkameradin verliebt.","Verlieben ist schön, aber manchmal kompliziert."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8058	verlieren	{"to lose"}	{"Ich verliere oft meine Stifte.","Verliere nicht die Motivation!"}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8292	laptop	{laptop}	{"Mein Laptop ist kaputt.","Sie arbeitet immer am Laptop."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8059	vorbereitung	{preparation}	{"Die Vorbereitung auf die Prüfung dauert Wochen.","Ohne Vorbereitung klappt es nicht."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8060	vorkenntnisse	{"prior knowledge"}	{"Für diesen Kurs sind Vorkenntnisse erforderlich.","Ich habe keine Vorkenntnisse in Chemie."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8061	vorstellungsgespräch	{interview}	{"Das Vorstellungsgespräch war erfolgreich.","Übe für das Vorstellungsgespräch!"}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8063	yoga	{yoga}	{"Yoga hilft mir, mich zu entspannen.","Wir machen Yoga in der Schulpause."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8064	zeitmanagement	{"time management"}	{"Gutes Zeitmanagement ist im Studium wichtig.","Ich lerne Zeitmanagement in einem Kurs."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8067	zufrieden	{satisfied}	{"Ich bin mit meinen Noten zufrieden.","Der Lehrer ist mit unserer Arbeit zufrieden."}	2	17	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8068	ansprechpartner/in	{"contact person"}	{"Fragen Sie den Ansprechpartner im Büro!","Die Ansprechpartnerin hilft bei Problemen."}	2	18	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8070	aussehen	{"to look"}	{"Du siehst heute müde aus.","Das Dokument sieht offiziell aus."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8071	auszubildende (azubi)	{trainee}	{"Der Azubi lernt schnell.","Die Auszubildende arbeitet in der Bäckerei."}	2	18	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8072	bäckereifachverkäufer/in	{"baker's assistant"}	{"Die Bäckereifachverkäuferin bedient die Kunden.","Er arbeitet als Bäckereifachverkäufer."}	2	18	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8073	bedanken	{"to thank"}	{"Ich bedanke mich für die Hilfe.","Bedanken Sie sich beim Team!"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8074	bedienen	{"to serve"}	{"Der Kellner bedient die Gäste freundlich.","Kannst du die Maschine bedienen?"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8075	beeilen	{"to hurry"}	{"Beeil dich, wir sind spät dran!","Ich beeile mich, den Bus zu erreichen."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8076	begründen	{"to justify"}	{"Begründe bitte deine Entscheidung!","Sie begründete ihre Abwesenheit."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8077	beratungsgespräch	{consultation}	{"Das Beratungsgespräch war sehr hilfreich.","Vereinbaren Sie ein Beratungsgespräch!"}	2	18	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8079	bewerber/in	{applicant}	{"Der Bewerber hat einen guten Lebenslauf.","Die Bewerberin wartet auf eine Antwort."}	2	18	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8080	bieten	{"to offer"}	{"Das Unternehmen bietet flexible Arbeitszeiten.","Kannst du mir einen Rat bieten?"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8081	eindecken	{"to inundate"}	{"Der Markt ist mit Angeboten eingedeckt.","Wir wurden mit Fragen eingedeckt."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8082	genug	{enough}	{"Ich habe genug Erfahrung für den Job.","Hast du genug Zeit?"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8085	holz	{wood}	{"Der Tisch ist aus Holz.","Holz ist ein natürliches Material."}	2	18	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8086	informatiker/in	{"IT technician"}	{"Der Informatiker repariert Computer.","Die Informatikerin programmiert Software."}	2	18	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8087	kneipe	{pub}	{"Wir treffen uns in der Kneipe.","Die Kneipe hat gute Atmosphäre."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8088	kostenfrei	{"free of charge"}	{"Die Beratung ist kostenfrei.","Kostenfreie Parkplätze sind verfügbar."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8152	egal	{equal}	{"Das ist mir egal.","Egal, was du machst, sei vorsichtig."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8089	küchenhilfe	{"kitchen assistant"}	{"Die Küchenhilfe schält Gemüse.","Er sucht eine Stelle als Küchenhilfe."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8090	laufbahn	{"career path"}	{"Meine Laufbahn begann in der Gastronomie.","Welche Laufbahn möchtest du einschlagen?"}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8083	grundschule	{"primary school"}	{"Die Grundschule beginnt um 8 Uhr.","Kinder lernen Lesen in der Grundschule."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8065	zertifikat	{certificate}	{"Das Zertifikat bestätigt die Sprachkenntnisse.","Er erhielt ein Zertifikat für den Kurs."}	2	17	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8062	weiterbildung	{"further training"}	{"Die Weiterbildung dauert sechs Wochen.","Viele Arbeitgeber fördern berufliche Weiterbildungen."}	2	17	2	\N	Weiterbildungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8066	zeugnis	{certificate}	{"Das Schulzeugnis enthält alle Noten.","Ein gutes Arbeitszeugnis ist wichtig."}	2	17	3	\N	Zeugnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8078	berufsfeld	{"field of work"}	{"Das Berufsfeld der Pflege ist sehr vielfältig.","Er wechselte in ein technisches Berufsfeld."}	2	18	1	\N	Berufsfelder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8069	aushilfsjob	{"temporary job"}	{"Während des Studiums hatte sie einen Aushilfsjob im Café.","Aushilfsjobs sind oft befristet."}	2	18	1	\N	Aushilfsjobs	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8092	lückenlos	{seamless}	{"Sein Lebenslauf ist lückenlos.","Lückenlos dokumentierte Erfahrung ist wichtig."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8093	melden	{"to notify"}	{"Melden Sie sich bitte beim Personalbüro!","Ich melde den Fehler meinem Chef."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8095	modedesigner/in	{"fashion designer"}	{"Die Modedesignerin entwirft Kleider.","Er ist ein bekannter Modedesigner."}	2	18	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8097	nötig	{necessary}	{"Englischkenntnisse sind für den Job nötig.","Hast du die nötigen Unterlagen?"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8098	ob	{whether}	{"Ich weiß nicht, ob die Stelle frei ist.","Frag nach, ob sie noch suchen!"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8099	persönlich	{personal}	{"Das ist eine persönliche Entscheidung.","Persönliche Treffen sind effektiver."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8100	professionell	{professional}	{"Sein Auftreten ist sehr professionell.","Professionelle Kleidung ist Pflicht."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8101	reinigungsarbeiten	{"cleaning jobs"}	{"Reinigungsarbeiten sind anstrengend.","Sie sucht Reinigungsarbeiten in der Stadt."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8102	rente	{retirement}	{"Mein Vater geht nächstes Jahr in Rente.","Die Rente reicht kaum zum Leben."}	2	18	2	\N	renten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8103	restaurantfachmann/-frau	{"restaurant specialist"}	{"Der Restaurantfachmann organisiert Events.","Die Restaurantfachfrau berät die Gäste."}	2	18	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8104	spezial	{special}	{"Das ist ein spezial Angebot für Neukunden.","Er hat spezial Kenntnisse in IT."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8105	statt	{instead}	{"Statt zu arbeiten, geht er ins Kino.","Nimm die Bahn statt des Autos!"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8106	stelle	{position}	{"Die Stelle ist bereits vergeben.","Bewirb dich für die Stelle!"}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8107	stellenangebot	{"job offer"}	{"Das Stellenangebot klingt interessant.","Wo finde ich Stellenangebote?"}	2	18	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8108	stellensuche	{"job search"}	{"Die Stellensuche dauert oft lange.","Online-Portale helfen bei der Stellensuche."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8109	struktur	{structure}	{"Der Lebenslauf hat eine klare Struktur.","Die Struktur des Unternehmens ist komplex."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8110	sympathisch	{kind}	{"Der Chef ist sehr sympathisch.","Sympathische Kollegen machen den Job leicht."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8112	teilzeitstelle	{"part-time position"}	{"Ich suche eine Teilzeitstelle im Einzelhandel.","Die Teilzeitstelle bietet flexible Stunden."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8113	tippen	{"to type"}	{"Ich tippe den Bericht schnell.","Kannst du ohne Fehler tippen?"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8114	tippfehler	{"typing error"}	{"Der Tippfehler im Lebenslauf ist peinlich.","Korrigiere alle Tippfehler im Text!"}	2	18	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8115	tischler/in	{carpenter}	{"Der Tischler baut Möbel.","Die Tischlerin repariert die Tür."}	2	18	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8116	üben	{"to practice"}	{"Ich übe für das Vorstellungsgespräch.","Übe regelmäßig deine Präsentation!"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8117	übersiedlung	{relocation}	{"Die Übersiedlung ins Ausland ist geplant.","Die Übersiedlung des Büros dauert eine Woche."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8118	unprofessionell	{unprofessional}	{"Sein Verhalten war unprofessionell.","Unprofessionelle E-Mails schaden dem Image."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8119	unsympathisch	{unkind}	{"Der Kunde war sehr unsympathisch.","Ein unsympathischer Kollege macht die Arbeit schwer."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8120	unzufrieden	{unsatisfied}	{"Der Chef ist mit den Ergebnissen unzufrieden.","Unzufriedene Mitarbeiter kündigen oft."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8121	verrückt	{crazy}	{"Die Arbeitszeiten sind manchmal verrückt.","Das ist eine verrückte Idee!"}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8122	volleyball	{volleyball}	{"Wir spielen Volleyball im Park.","Volleyball macht Spaß im Team."}	2	18	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8091	lebenslauf	{CV}	{"Der Lebenslauf muss lückenlos sein.","Sie hat ihren Lebenslauf aktualisiert."}	2	18	1	\N	Lebensläufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8111	teilzeit	{part-time}	{"Sie arbeitet in Teilzeit, um Familie und Beruf zu vereinen.","Teilzeitstellen sind in diesem Bereich selten."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8096	muster	{pattern}	{"Das Muster kann kostenlos angefordert werden.","Muster helfen Kunden bei der Entscheidung."}	2	18	3	\N	Muster	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8124	vollzeitstelle	{"full-time position"}	{"Die Vollzeitstelle bietet ein gutes Gehalt.","Sie bewirbt sich auf eine Vollzeitstelle."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8125	voraussetzung	{requirement}	{"Sprachkenntnisse sind eine Voraussetzung.","Erfüllst du die Voraussetzungen?"}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8126	vorlage	{template}	{"Benutze diese Vorlage für deinen Lebenslauf!","Die Vorlage vereinfacht die Arbeit."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8128	accessoires (pl)	{accessories}	{"Sie trägt schöne Accessoires.","Accessoires machen das Outfit perfekt."}	2	19	2	\N	accessoires	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8129	anhaben	{"to be wearing"}	{"Was hast du heute an?","Er hat einen blauen Pullover an."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8130	apfelschorle	{"apple spritzer"}	{"Ich trinke gerne Apfelschorle.","Apfelschorle ist erfrischend."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8131	aubergine	{aubergine}	{"Die Aubergine liegt im Gemüseregal.","Auberginen sind gut für Ratatouille."}	2	19	2	\N	auberginen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8132	ausrüstung	{equipment}	{"Wir brauchen neue Camping-Ausrüstung.","Die Ausrüstung ist sehr schwer."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8133	babyartikel	{"baby items"}	{"Babyartikel sind im dritten Regal.","Sie kauft oft Babyartikel online."}	2	19	1	\N	babyartikel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8134	badesachen (pl)	{swimwear}	{"Vergiss die Badesachen nicht!","Badesachen gibt es im Sportgeschäft."}	2	19	2	\N	badesachen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8135	bart	{beard}	{"Sein Bart ist sehr lang.","Männer rasieren oft den Bart."}	2	19	1	\N	bärte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8136	bekleidung	{clothing}	{"Bekleidung kaufe ich im Kaufhaus.","Die Bekleidung ist aus Baumwolle."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7487	bestimmt	{certainly}	{"Das Kleid ist bestimmt teuer.","Bestimmt regnet es morgen."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8137	blond	{blond}	{"Sie hat blondes Haar.","Blond steht dir gut."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8138	braten	{"to roast"}	{"Wir braten Hähnchen im Ofen.","Kartoffeln kann man auch braten."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8139	bummeln	{"to stroll"}	{"Wir bummeln durch die Stadt.","Am Sonntag bummeln viele Leute."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8140	bunt	{colourful}	{"Das Bild ist sehr bunt.","Bunte Blumen wachsen im Garten."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8141	camping	{camping}	{"Camping macht im Sommer Spaß.","Wir planen ein Camping-Wochenende."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8142	champignon	{mushroom}	{"Champignons schmecken in der Suppe.","Kannst du Champignons schneiden?"}	2	19	1	\N	champignons	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8143	currywurst	{currywurst}	{"Currywurst esse ich mit Pommes.","Berlin ist berühmt für Currywurst."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8144	dame	{lady}	{"Die Dame trägt einen Hut.","Damen kaufen oft Kleider."}	2	19	2	\N	damen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8145	darin	{"in it"}	{"Was ist darin?","Das Buch liegt darin."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8146	dick	{fat}	{"Der Mantel ist dick.","Dickes Papier ist stabil."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8147	dieb/in	{thief}	{"Der Dieb wurde gefangen.","Die Polizei sucht den Dieb."}	2	19	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8148	ding	{thing}	{"Was ist das für ein Ding?","Alte Dinge kann man verkaufen."}	2	19	3	\N	dinge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8149	duft	{smell}	{"Der Duft von Blumen ist schön.","Der Kaffee hat einen starken Duft."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8150	dünn	{thin}	{"Das Papier ist sehr dünn.","Dünne Kleidung ist im Sommer gut."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8153	ehepaar	{"married couple"}	{"Das Ehepaar geht spazieren.","Ein glückliches Ehepaar wohnt hier."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8154	einfarbig	{monochromatic}	{"Das Hemd ist einfarbig.","Einfarbige Wände sind modern."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8155	elektronik	{electronics}	{"Elektronik ist teuer.","Er repariert alte Elektronik."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8156	fahrradhelm	{"cycle helmet"}	{"Trage immer einen Fahrradhelm!","Der Fahrradhelm passt gut."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8157	fantastisch	{fantastic}	{"Das Essen schmeckt fantastisch.","Fantastisch! Das hast du gut gemacht."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8158	fast food	{"fast food"}	{"Fast Food ist nicht gesund.","Manchmal esse ich Fast Food."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8159	flipflops (pl)	{"flip flops"}	{"Im Sommer trage ich Flipflops.","Flipflops sind bequem."}	2	19	2	\N	flipflops	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8160	frittieren	{"to fry"}	{"Pommes werden frittiert.","Frittieren braucht viel Öl."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8161	gemüselasagne	{"vegetable lasagne"}	{"Gemüselasagne ist mein Lieblingsessen.","Wir kochen Gemüselasagne heute."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8162	gepunktet	{spotty}	{"Das Kleid ist gepunktet.","Gepunktete Tücher sind trendy."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8163	gericht	{meal}	{"Das Gericht ist sehr lecker.","Heute gibt es ein neues Gericht."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8164	gestreift	{striped}	{"Das Hemd ist gestreift.","Gestreifte Kissen sind schön."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8165	glatt	{smooth}	{"Die Straße ist glatt.","Glatte Haare sind leicht zu kämmen."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8166	glatze	{"bald head"}	{"Er trägt eine Glatze.","Eine Glatze ist pflegeleicht."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8167	gold	{gold}	{"Gold ist ein Edelmetall.","Sie trägt eine Goldkette."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8168	griechisch	{Greek}	{"Griechisches Essen schmeckt gut.","Ich lerne griechisch."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8169	gulaschsuppe	{"goulash soup"}	{"Gulaschsuppe wärmt im Winter.","Wir essen Gulaschsuppe heute."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8170	gürtel	{belt}	{"Der Gürtel passt zur Hose.","Kannst du den Gürtel anziehen?"}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8171	haarpflege	{"hair care"}	{"Haarpflege ist wichtig.","Ich kaufe Haarpflege im Drogeriemarkt."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8172	hauptgericht	{"main meal"}	{"Das Hauptgericht ist Fleisch mit Kartoffeln.","Was ist das Hauptgericht heute?"}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8173	hautpflege	{"skin care"}	{"Hautpflege braucht Zeit.","Gute Hautpflege ist teuer."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8174	hübsch	{pretty}	{"Sie trägt ein hübsches Kleid.","Das Bild ist sehr hübsch."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8175	kamera	{camera}	{"Die Kamera macht schöne Fotos.","Ich habe eine neue Kamera gekauft."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8176	kariert	{checkered}	{"Das Hemd ist kariert.","Karierte Tischdecken sind praktisch."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8177	kompliment	{compliment}	{"Er macht mir ein Kompliment.","Komplimente sind nett."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8178	kopfhörer	{headphones}	{"Ich höre Musik mit Kopfhörern.","Die Kopfhörer sind kaputt."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8179	kosmetiklasche	{"cosmetic bag"}	{"Die Kosmetiklasche ist klein.","Ich packe meine Kosmetiklasche ein."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8180	krawatte	{tie}	{"Er trägt eine rote Krawatte.","Krawatten sind formell."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8181	küchengerät	{"kitchen appliance"}	{"Das Küchengerät ist neu.","Küchengeräte erleichtern das Kochen."}	2	19	3	\N	küchengeräte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8182	laufen	{"to run"}	{"Laufen ist gesund.","Kinder laufen im Park."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8183	lieblingsfarbe	{"favourite colour"}	{"Meine Lieblingsfarbe ist blau.","Was ist deine Lieblingsfarbe?"}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8184	lockig	{curly}	{"Sie hat lockiges Haar.","Lockige Haare sind schön."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8185	make-up	{"make up"}	{"Sie trägt kein Make-up.","Make-up kann teuer sein."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8186	maus	{mouse}	{"Die Maus ist klein.","Eine Computermaus ist wichtig."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8187	mineralwasser	{"mineral water"}	{"Mineralwasser ist gesund.","Ich trinke gerne Mineralwasser."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8188	modegeschäft	{"fashion shop"}	{"Im Modegeschäft gibt es neue Kleider.","Das Modegeschäft ist teuer."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8189	modeschmuck	{"fashion jewellery"}	{"Modeschmuck ist günstig.","Sie trägt oft Modeschmuck."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8190	nachher	{afterwards}	{"Wir treffen uns nachher.","Nachher gehe ich einkaufen."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8191	naturkosmetik	{"natural cosmetics"}	{"Naturkosmetik ist beliebt.","Ich kaufe nur Naturkosmetik."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8192	navigationsgerät (navi)	{"navigation device"}	{"Das Navi zeigt den Weg.","Ohne Navi fahre ich nicht."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8193	ofen	{oven}	{"Der Ofen ist heiß.","Wir backen Brot im Ofen."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8194	ohrring	{earring}	{"Sie trägt silberne Ohrringe.","Ohrringe können elegant sein."}	2	19	1	\N	ohrringe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8195	parfümerie	{perfumery}	{"In der Parfümerie riecht es gut.","Ich kaufe Parfüm in der Parfümerie."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8196	pfanne	{pan}	{"Die Pfanne ist aus Eisen.","In der Pfanne brate ich Eier."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8197	plötzlich	{suddenly}	{"Plötzlich regnet es.","Er stand plötzlich auf."}	2	19	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8198	polizist/in	{policeman}	{"Der Polizist hilft der Frau.","Polizisten arbeiten hart."}	2	19	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8199	schafskäse	{"feta cheese"}	{"Schafskäse schmeckt salzig.","Ich esse Salat mit Schafskäse."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8200	scharf	{spicy}	{"Das Essen ist zu scharf.","Scharfe Soßen mag ich."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7079	schauen	{"to look"}	{"Schau mal da drüben!","Kinder schauen gerne Filme."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8201	schaufenster	{"shop window"}	{"Das Schaufenster ist dekoriert.","Wir schauen ins Schaufenster."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8202	schick	{chic}	{"Das Kleid ist sehr schick.","Schicke Schuhe sind teuer."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8203	schlank	{slim}	{"Sie ist schlank und sportlich.","Schlanke Jeans sind modern."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8204	schmuck	{jewellery}	{"Echter Schmuck ist wertvoll.","Sie sammelt alten Schmuck."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8205	schnäppchen	{deal}	{"Ich habe ein Schnäppchen gemacht.","Schnäppchen findet man im Sale."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8206	schnitzel	{schnitzel}	{"Schnitzel mit Pommes ist lecker.","Das Schnitzel ist knusprig."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8207	schnurrbart	{moustache}	{"Er hat einen dicken Schnurrbart.","Schnurrbärte sind selten geworden."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8208	schrei	{scream}	{"Ein lauter Schrei war zu hören.","Der Schrei erschreckte alle."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8209	schulgröße	{"shoe size"}	{"Meine Schulgröße ist 38.","Welche Schulgröße hast du?"}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8210	shorts	{shorts}	{"Im Sommer trage ich Shorts.","Shorts sind bequem."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8211	silber	{silver}	{"Silber glänzt schön.","Sie trägt einen Silberring."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8212	snack	{snack}	{"Ein Snack zwischendurch ist gut.","Gesunde Snacks sind wichtig."}	2	19	1	\N	snacks	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8213	spielwaren (pl)	{toys}	{"Spielwaren sind im Keller.","Kinder lieben Spielwaren."}	2	19	2	\N	spielwaren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8214	steak	{steak}	{"Das Steak ist medium gebraten.","Ein gutes Steak ist teuer."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8215	stehlen	{"to steal"}	{"Man darf nicht stehlen.","Die Diebe stehlen Geld."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8216	stiefel	{boot}	{"Im Winter trage ich Stiefel.","Stiefel sind warm."}	2	19	1	\N	stiefel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8217	süßigkeiten	{sweets}	{"Kinder essen gerne Süßigkeiten.","Zu viele Süßigkeiten sind ungesund."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8218	tattoo	{tattoo}	{"Er hat ein Tattoo auf dem Arm.","Tattoos sind für immer."}	2	19	3	\N	tattoos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8219	toaster	{toaster}	{"Der Toaster ist kaputt.","Toast aus dem Toaster schmeckt gut."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8220	ungarisch	{Hungarian}	{"Ungarische Gerichte sind scharf.","Ich lerne ungarisch."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8221	unterwäsche	{underwear}	{"Unterwäsche kaufe ich online.","Frische Unterwäsche ist wichtig."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8222	vanilleeis	{"vanilla ice cream"}	{"Vanilleeis ist mein Favorit.","Kinder essen gerne Vanilleeis."}	2	19	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8223	vegetarier/in	{vegetarian}	{"Sie ist Vegetarierin.","Vegetarier essen kein Fleisch."}	2	19	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8224	vegetarisch	{vegetarian}	{"Das Gericht ist vegetarisch.","Vegetarisches Essen ist gesund."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8225	wandern	{"to hike"}	{"Wir wandern im Gebirge.","Wandern macht Spaß."}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8394	rede	{speech}	{"Die Rede war sehr lang.","Er hält eine Rede vor der Klasse."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8226	wanderschuh	{"hiking shoes"}	{"Gute Wanderschuhe sind wichtig.","Ich kaufe neue Wanderschuhe."}	2	19	1	\N	wanderschuhe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8227	wecker	{alarm}	{"Der Wecker klingelt um sieben.","Ohne Wecker verschlafe ich."}	2	19	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8228	wirklich	{really}	{"Das ist wirklich schön.","Bist du wirklich müde?"}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8229	wunderbar	{wonderful}	{"Das Wetter ist wunderbar.","Ein wunderbarer Tag!"}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8230	zubereiten	{"to prepare"}	{"Ich bereite das Essen zu.","Kannst du den Tee zubereiten?"}	2	19	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8231	zucchini	{zucchini}	{"Zucchini schmecken gut im Salat.","Wir pflanzen Zucchini im Garten."}	2	19	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8232	absetzen	{"to distribute"}	{"Wir müssen die Aufgaben absetzen.","Kannst du die Pakete absetzen?"}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8233	abteilung	{department}	{"Die Abteilung ist im dritten Stock.","Wir haben viele Abteilungen in der Firma."}	2	20	2	\N	abteilungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8234	angeben	{"to indicate"}	{"Bitte gib deine Abteilung an.","Er hat den Fehler angegeben."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8235	anruf	{call}	{"Der Anruf kam von einem Kunden.","Ich habe drei Anrufe verpasst."}	2	20	1	\N	anrufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8236	anrufer/in	{caller}	{"Der Anruer hat keine Nachricht hinterlassen.","Die Anruferin möchte mit dem Chef sprechen."}	2	20	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8237	arbeitgeber/in	{employer}	{"Mein Arbeitgeber ist sehr freundlich.","Die Arbeitgeberin sucht neue Mitarbeiter."}	2	20	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8238	arbeitsauftrag	{"work order"}	{"Der Arbeitsauftrag muss bis Freitag fertig sein.","Sie hat einen neuen Arbeitsauftrag erhalten."}	2	20	1	\N	arbeitsaufträge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8239	arbeitsbeginn	{"start of work"}	{"Der Arbeitsbeginn ist um 8 Uhr.","Sie freut sich auf den Arbeitsbeginn."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8240	arbeitsschutz	{"occupational safety"}	{"Arbeitsschutz ist sehr wichtig.","Die Firma verbessert den Arbeitsschutz."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8241	arbeitsvertrag	{"work contract"}	{"Der Arbeitsvertrag ist für zwei Jahre.","Sie unterschreibt den Arbeitsvertrag heute."}	2	20	1	\N	arbeitsverträge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8242	aufzug	{lift}	{"Der Aufzug ist kaputt.","Wir nehmen den Aufzug in den dritten Stock."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8243	außendienst	{"sales representatives"}	{"Der Außendienst macht 30% der Mitarbeiter aus.","Im Außendienst arbeitet man viel unterwegs."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8244	ausmachen	{"to account for"}	{"Das macht 20% des Umsatzes aus.","Was macht den Erfolg aus?"}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8245	beauftragte	{agent}	{"Die Beauftragte hilft bei den Unterlagen.","Der Beauftragte kommt morgen."}	2	20	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8246	bereit	{ready}	{"Sind Sie bereit für die Präsentation?","Das Essen ist bereit."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8247	bereitstellen	{"to make ready"}	{"Bitte stellen Sie die Dokumente bereit.","Wir stellen die Stühle für das Meeting bereit."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8248	besprechen	{"to discuss"}	{"Wir besprechen das Projekt morgen.","Können wir das später besprechen?"}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8250	betätigen	{"to operate"}	{"Bitte betätigen Sie den Notausschalter.","Er betätigt die Maschine vorsichtig."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8251	betreffen	{"to relate to"}	{"Das betrifft alle Mitarbeiter.","Worum handelt es sich bei diesem Problem?"}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8252	bewahren	{"to save from"}	{"Bitte bewahren Sie die Rechnung auf.","Wir bewahren die Dokumente im Ordner."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8253	bewegen	{"to move"}	{"Können Sie den Tisch bitte bewegen?","Die Kinder bewegen sich im Garten."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8254	bildschirm	{screen}	{"Der Bildschirm ist zu klein.","Sie arbeitet den ganzen Tag vor dem Bildschirm."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8255	brand	{fire}	{"Ein Brand brach im Lager aus.","Der Brand wurde schnell gelöscht."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8256	brandbekämpfung	{"fire fighting"}	{"Die Brandbekämpfung dauerte Stunden.","Die Feuerwehr ist für die Brandbekämpfung zuständig."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8257	brandfall	{"case of fire"}	{"Im Brandfall benutzen Sie den Notausgang.","Alle Mitarbeiter kennen die Regeln im Brandfall."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8258	brandmelder	{"fire alarm"}	{"Der Brandmelder piept ständig.","Installieren Sie einen Brandmelder in der Küche."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8259	brandschutz	{"fire prevention"}	{"Brandschutz ist gesetzlich vorgeschrieben.","Der Brandschutz wurde überprüft."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8260	brennen	{"to burn"}	{"Das Licht brennt die ganze Nacht.","Das Holz brennt gut im Kamin."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8261	buchhaltung	{accountant}	{"Die Buchhaltung macht die Gehälter.","Er arbeitet in der Buchhaltung."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8262	danken	{"to thank"}	{"Ich danke Ihnen für Ihre Hilfe.","Sie dankte dem Team für die Zusammenarbeit."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8263	deutlich	{clearly}	{"Bitte sprechen Sie deutlich.","Die Anweisungen waren deutlich."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8264	echt	{really}	{"Das ist echt schwierig!","Das Kleid ist aus echter Seide."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8265	einweisung	{instruction}	{"Neue Mitarbeiter bekommen eine Einweisung.","Die Einweisung dauert eine Stunde."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8266	elektrik	{electrics}	{"Die Elektrik im Haus ist alt.","Ein Problem mit der Elektrik verursachte den Ausfall."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8267	entwurf	{draft}	{"Der Entwurf muss noch korrigiert werden.","Sie zeigte mir den Entwurf des Plans."}	2	20	1	\N	entwürfe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8268	erlauben	{"to allow"}	{"Darf ich mir das erlauben?","Die Firma erlaubt Homeoffice."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8269	erwarten	{"to wait for"}	{"Wir erwarten einen wichtigen Gast.","Er erwartet ein Paket heute."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8270	erwischen	{"to catch"}	{"Die Polizei erwischte den Dieb.","Ich habe den letzten Zug noch erwischt."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8271	feuerlöscher	{"fire extinguisher"}	{"Der Feuerlöscher hängt an der Wand.","Jeder sollte wissen, wie man einen Feuerlöscher benutzt."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8272	flamme	{flame}	{"Die Flamme ist zu hoch.","Sie zündete eine Kerze an und die Flamme brannte hell."}	2	20	2	\N	flammen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8273	folgen	{"to follow"}	{"Bitte folgen Sie mir zum Büro.","Die Hunde folgen ihrem Herrchen."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8274	gefährden	{"to endanger"}	{"Rauchen gefährdet die Gesundheit.","Das Verhalten des Fahrers gefährdet alle."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8275	gestalten	{"to design"}	{"Wir gestalten die Website neu.","Der Raum wurde modern gestaltet."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8276	gesund	{healthy}	{"Obst und Gemüse sind gesund.","Er ist wieder gesund nach der Krankheit."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8277	grafik	{graphics}	{"Die Grafik zeigt die Ergebnisse.","Sie arbeitet in der Grafik-Abteilung."}	2	20	2	\N	grafiken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8278	grafiker/in	{"graphic designer"}	{"Der Grafiker entwirft das Logo.","Unsere Grafikerin ist sehr kreativ."}	2	20	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8279	hektik	{rush}	{"In der Hektik vergaß sie ihren Schlüssel.","Am Morgen herrscht immer viel Hektik."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8280	heraussuchen	{"to pick out"}	{"Kannst du ein Kleid herausuchen?","Er suchte den besten Platz heraus."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8281	hinfahren	{"to go there"}	{"Wir fahren morgen zum Flughafen hin.","Kannst du mich zum Bahnhof hinfahren?"}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8282	höflich	{polite}	{"Sei bitte höflich zum Kunden.","Sie hat höflich gefragt."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8284	kabelsalat	{"cable tangle"}	{"Der Kabelsalat unter dem Tisch ist gefährlich.","Bitte vermeide Kabelsalat!"}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8285	kennzeichnen	{"to mark"}	{"Bitte kennzeichnen Sie die Fehler.","Der Weg ist gut gekennzeichnet."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8286	kerze	{candle}	{"Die Kerze brennt auf dem Tisch.","Wir kaufen Kerzen für den Geburtstag."}	2	20	2	\N	kerzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8287	konto	{account}	{"Mein Konto ist bei der Sparkasse.","Eröffnen Sie ein neues Konto."}	2	20	3	\N	konten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8288	kontoverbindung	{"account connection"}	{"Geben Sie bitte Ihre Kontoverbindung an.","Die Kontoverbindung ist falsch."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8289	kopieren	{"to copy"}	{"Kannst du diese Seite kopieren?","Ich kopiere die Datei auf den USB-Stick."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8290	kraft	{power}	{"Er hat viel Kraft im Training.","Die Maschine verliert an Kraft."}	2	20	2	\N	kräfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8283	internetzugang	{"internet access"}	{"Der Internetzugang im Tagungsraum ist kostenlos.","Ohne Internetzugang können wir das Meeting nicht durchführen."}	2	20	1	\N	Internetzugänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8293	marketing	{marketing}	{"Das Marketing-Team plant eine Kampagne.","Marketing ist wichtig für den Erfolg."}	2	20	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8294	mehrfachsteckdose	{"power strip"}	{"Die Mehrfachsteckdose ist überlastet.","Kaufen Sie eine neue Mehrfachsteckdose."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8295	mitschreiben	{"to take notes"}	{"Können Sie mitschreiben?","Ich schreibe die Termine mit."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8296	nachbereitung	{follow-up}	{"Die Nachbereitung des Meetings dauert lange.","Vergiss die Nachbereitung nicht!"}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8297	nennen	{"to name"}	{"Können Sie drei Städte nennen?","Sie nannte den Grund für die Verspätung."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8299	personalbüro	{"personnel office"}	{"Das Personalbüro ist heute geschlossen.","Gehen Sie bitte ins Personalbüro."}	2	20	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8300	personalleiter/in	{"head of personnel"}	{"Der Personalleiter führt das Gespräch.","Die Personalleiterin ist sehr kompetent."}	2	20	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8301	protokoll	{protocol}	{"Das Protokoll wird im Meeting geschrieben.","Lies bitte das Protokoll durch."}	2	20	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8302	reagieren	{"to react"}	{"Wie reagierst du auf Stress?","Er reagierte schnell auf die Frage."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8303	regel	{rule}	{"Die Regel ist einfach zu verstehen.","Alle müssen die Regeln beachten."}	2	20	2	\N	regeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8305	rückfrage	{query}	{"Bei Rückfragen rufen Sie uns an.","Die Rückfrage wurde schnell beantwortet."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8306	sekretariat	{"secretary's office"}	{"Das Sekretariat ist bis 17 Uhr geöffnet.","Frau Müller arbeitet im Sekretariat."}	2	20	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8307	sicherheit	{security}	{"Sicherheit ist das Wichtigste.","Die Sicherheit der Daten ist gewährleistet."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8308	steckdose	{socket}	{"Die Steckdose funktioniert nicht.","Hier gibt es keine Steckdose."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8309	steuer	{tax}	{"Die Steuer muss bis Juli gezahlt werden.","Er berechnet die Steuer."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8310	teelicht	{"tea light"}	{"Das Teelicht brennt auf dem Tisch.","Kaufen Sie bitte Teelichter für die Party."}	2	20	3	\N	teelichter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8311	überlasten	{"to overload"}	{"Überlasten Sie den Stecker nicht!","Das Netzwerk ist überlastet."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8312	unbürokratisch	{unbureaucratic}	{"Die Lösung war unbürokratisch.","Wir handeln unbürokratisch."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8313	unterstützen	{"to support"}	{"Wir unterstützen das Team.","Kannst du mich bei der Arbeit unterstützen?"}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8314	verabschieden	{"to adopt"}	{"Das Gesetz wurde verabschiedet.","Wir verabschieden eine neue Regel."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8315	verbessern	{"to improve"}	{"Wir verbessern die Qualität.","Er hat seine Leistung verbessert."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8316	verboten	{"to forbid"}	{"Rauchen ist hier verboten.","Das Parken ist verboten."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8317	verhalten	{behaviour}	{"Sein Verhalten war unhöflich.","Das Verhalten der Mitarbeiter ist vorbildlich."}	2	20	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8318	verlegen	{"to reschedule"}	{"Wir verlegen das Meeting auf morgen.","Der Termin wurde verlegt."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8319	vermeiden	{"to avoid"}	{"Bitte vermeiden Sie Fehler.","Wir vermeiden Stress im Büro."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8320	vermeidung	{avoidance}	{"Die Vermeidung von Risiken ist wichtig.","Vermeidung ist besser als Nachsicht."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8321	versicherung	{insurance}	{"Die Versicherung zahlt den Schaden.","Brauchen Sie eine neue Versicherung?"}	2	20	2	\N	versicherungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8322	vertrieb	{sales}	{"Der Vertrieb steigert den Umsatz.","Sie arbeitet im Vertrieb."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8323	verwenden	{"to use"}	{"Wir verwenden umweltfreundliches Material.","Kannst du dieses Werkzeug verwenden?"}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8325	vorbereiten	{"to prepare"}	{"Wir bereiten das Meeting vor.","Kannst du das Essen vorbereiten?"}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8298	personalabteilung	{"personnel department"}	{"Die Personalabteilung organisiert Schulungen.","Bewerbungen sind an die Personalabteilung zu richten."}	2	20	2	\N	Personalabteilungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8304	rettungswagen	{ambulance}	{"Der Rettungswagen traf nach fünf Minuten ein.","Rufen Sie bei schweren Verletzungen den Rettungswagen."}	2	20	1	\N	Rettungswagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8326	vorschrift	{regulation}	{"Die Vorschrift muss eingehalten werden.","Neue Vorschriften gelten ab nächster Woche."}	2	20	2	\N	vorschriften	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8327	werbeflyer	{flyer}	{"Der Werbeflyer liegt auf dem Tisch.","Wir drucken neue Werbeflyer."}	2	20	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8328	werbeagentur	{"marketing agency"}	{"Die Werbeagentur plant eine Kampagne.","Er arbeitet bei einer Werbeagentur."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8329	werbetexter/in	{"copy writer"}	{"Der Werbetexter schreibt Slogans.","Die Werbetexterin arbeitet an einer Kampagne."}	2	20	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8330	aggressiv	{aggressive}	{"Sein Verhalten war aggressiv.","Aggressives Spielen ist verboten."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8331	anders	{different}	{"Meine Meinung ist anders.","Andere Länder, andere Sitten."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8332	angst	{fear}	{"Sie hat Angst vor Prüfungen.","Kinder haben manchmal Angst im Dunkeln."}	2	21	2	\N	ängste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8333	aufhören	{"to stop"}	{"Hör bitte mit dem Lärm auf!","Es hat aufgehört zu regnen."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8334	aufpassen	{"to watch out"}	{"Pass im Unterricht gut auf!","Pass auf die Straße auf!"}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8335	ausreichend	{enough}	{"Das Essen ist für alle ausreichend.","Hast du ausreichend Zeit?"}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8336	befriedigend	{satisfactory}	{"Die Note war befriedigend.","Seine Leistung ist befriedigend."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8337	begrüßung	{greeting}	{"Die Begrüßung war herzlich.","Wir üben Begrüßungen auf Deutsch."}	2	21	2	\N	begrüßungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8338	beraten	{"to advise"}	{"Der Lehrer berät die Schüler.","Wir beraten dich gerne."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8341	berufswunsch	{"career aspiration"}	{"Was ist dein Berufswunsch?","Ihr Berufswunsch ist Pilotin."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8342	biologie	{biology}	{"Biologie ist mein Lieblingsfach.","Wir lernen Pflanzen in Biologie."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8343	bundesland	{"federal state"}	{"Bayern ist ein Bundesland.","In welchem Bundesland wohnst du?"}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8344	chemie	{chemistry}	{"Chemie ist manchmal schwer.","Wir machen Experimente in Chemie."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8345	damals	{"back then"}	{"Damals war die Schule strenger.","Wir haben uns damals oft getroffen."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8346	dieselbe	{"the same"}	{"Wir haben dieselbe Lehrerin.","Das ist dieselbe Aufgabe wie gestern."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8347	diplom	{diploma}	{"Er hat ein Diplom in Mathematik.","Das Diplom hängt an der Wand."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8348	elternabend	{"parent's evening"}	{"Der Elternabend ist nächste Woche.","Meine Mutter geht zum Elternabend."}	2	21	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8349	elternsprechtag	{"parent-teacher day"}	{"Am Elternsprechtag gibt es Gespräche.","Der Elternsprechtag dauert zwei Stunden."}	2	21	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8350	englischlehrer/in	{"English teacher"}	{"Unser Englischlehrer ist sehr nett.","Die Englischlehrerin kommt aus London."}	2	21	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8351	erdkunde	{geography}	{"In Erdkunde lernen wir Länder.","Erdkunde ist interessant."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8352	etwa	{around}	{"Wie alt bist du etwa?","Das dauert etwa eine Stunde."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8353	fach	{subject}	{"Mathe ist mein bestes Fach.","Welches Fach magst du am meisten?"}	2	21	3	\N	fächer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8354	fachhochschule	{"technical college"}	{"Sie studiert an der Fachhochschule.","Die Fachhochschule ist in Berlin."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8355	fachhochschulreife	{"technical college certificate"}	{"Er hat die Fachhochschulreife.","Die Fachhochschulreife ermöglicht ein Studium."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8356	fluss	{river}	{"Der Fluss ist sehr lang.","Wir lernen Flüsse in Europa."}	2	21	1	\N	flüsse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8357	formell	{formal}	{"Die Einladung war formell.","Formelle Kleidung ist erwünscht."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8358	fotograf/in	{photographer}	{"Der Fotograf macht Klassenfotos.","Die Fotografin arbeitet für eine Zeitung."}	2	21	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8359	freiwillig	{voluntary}	{"Die Arbeit ist freiwillig.","Er hilft freiwillig im Unterricht."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8361	geschichte	{history}	{"Geschichte ist mein Lieblingsfach.","Wir lernen über alte Kulturen in Geschichte."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8362	gipsbein	{"leg in plaster"}	{"Er hat ein Gipsbein nach dem Unfall.","Mit einem Gipsbein kann man nicht laufen."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8363	glück	{luck}	{"Viel Glück bei der Prüfung!","Glück ist manchmal wichtig."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8365	halbjahr	{half-year}	{"Das Halbjahr endet im Januar.","Im ersten Halbjahr haben wir viel gelernt."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8367	hinfallen	{"to fall over"}	{"Pass auf, dass du nicht hinfällst!","Das Kind ist hingefallen."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8368	integrationsverein	{"integration association"}	{"Der Integrationsverein hilft Schülern.","Wir besuchen den Integrationsverein."}	2	21	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8369	jugendliche	{youth}	{"Jugendliche treffen sich hier.","Viele Jugendliche spielen Fußball."}	2	21	5	\N	jugendlichen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8370	junge	{boy}	{"Der Junge liest ein Buch.","Zwei Jungen spielen im Hof."}	2	21	1	\N	jungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8371	kindertagesstätte (kita)	{"nursery school"}	{"Die Kita öffnet um 7 Uhr.","Meine Schwester geht in die Kita."}	2	21	2	\N	kindertagesstätten (kitas)	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8372	klassenarbeit	{classwork}	{"Die Klassenarbeit war schwer.","Wir schreiben eine Klassenarbeit in Mathe."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8373	klassenlehrer/in	{"class teacher"}	{"Der Klassenlehrer ist sehr hilfsbereit.","Die Klassenlehrerin organisiert die Ausflüge."}	2	21	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8374	knöchel	{knuckle}	{"Er hat sich den Knöchel verletzt.","Mein Knöchel tut weh."}	2	21	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8375	korb	{basket}	{"Der Korb ist voll mit Büchern.","Wir werfen Papier in den Korb."}	2	21	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8376	kunst	{art}	{"In Kunst malen wir Bilder.","Kunst macht Spaß!"}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8377	lieblingsfach	{"favourite subject"}	{"Mein Lieblingsfach ist Sport.","Was ist dein Lieblingsfach?"}	2	21	3	\N	lieblingsfächer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8378	lösen	{"to solve"}	{"Kannst du diese Aufgabe lösen?","Wir lösen die Matheprobleme zusammen."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8379	lust	{desire}	{"Ich habe Lust auf Eis.","Hast du Lust zu spielen?"}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8380	mädchen	{girl}	{"Das Mädchen liest ein Buch.","Drei Mädchen spielen im Park."}	2	21	3	\N	mädchen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8381	mangelhaft	{unsatisfactory}	{"Die Note war mangelhaft.","Mangelhafte Leistungen müssen verbessert werden."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8382	mathearbeit	{"maths test"}	{"Die Mathearbeit war sehr schwer.","Morgen schreiben wir eine Mathearbeit."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8383	meinung	{opinion}	{"Was ist deine Meinung dazu?","Meine Meinung ist anders."}	2	21	2	\N	meinungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8384	nachhilfe	{"private tuition"}	{"Sie gibt Nachhilfe in Englisch.","Ich brauche Nachhilfe in Chemie."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8385	normal	{normal}	{"Das ist ganz normal.","Heute ist ein normaler Schultag."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8386	note	{mark}	{"Sie hat eine gute Note bekommen.","Die Note steht im Zeugnis."}	2	21	2	\N	noten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8387	oberschule	{"secondary school"}	{"Die Oberschule geht bis zur 10. Klasse.","Er wechselt zur Oberschule."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8388	olympisch	{olympic}	{"Wir lernen über olympische Spiele.","Das ist eine olympische Disziplin."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8389	pflicht	{duty}	{"Hausaufgaben sind eine Pflicht.","Es ist meine Pflicht zu helfen."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8390	physik	{physics}	{"Physik ist manchmal kompliziert.","In Physik lernen wir über Energie."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8391	pilot/in	{pilot}	{"Der Pilot fliegt das Flugzeug.","Sie will Pilotin werden."}	2	21	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8392	planung	{schedule}	{"Die Planung des Ausflugs dauert lange.","Gute Planung ist wichtig."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8393	realschule	{"secondary modern school"}	{"Die Realschule endet mit der Mittleren Reife.","Realschulen bieten praktische Fächer an."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8364	gymnasium	{"Grammar school"}	{"Das Gymnasium bereitet auf das Abitur vor.","Gymnasien haben einen akademischen Fokus."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8395	religion	{"religious studies"}	{"In Religion lernen wir über Feste.","Religion ist ein Pflichtfach."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8396	schaubild	{diagram}	{"Das Schaubild erklärt den Prozess.","Zeichne ein Schaubild zur Aufgabe."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8397	schrecklich	{terrible}	{"Der Unfall war schrecklich.","Das Essen schmeckt schrecklich."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8398	schulform	{"type of school"}	{"Welche Schulform besuchst du?","Es gibt verschiedene Schulformen."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8399	schulleiter/in	{headteacher}	{"Der Schulleiter hielt eine Ansprache.","Die Schulleiterin ist sehr streng."}	2	21	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8400	schulpflicht	{"compulsory school attendance"}	{"In Deutschland gibt es Schulpflicht.","Die Schulpflicht gilt bis 16 Jahre."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8401	schulsystem	{"school system"}	{"Das Schulsystem ist komplex.","Wir vergleichen Schulsysteme."}	2	21	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8402	selbst	{even}	{"Selbst der Lehrer war überrascht.","Das kannst du selbst machen."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8403	sozialpädagoge/-pädagogin	{"social education worker"}	{"Der Sozialpädagoge hilft den Schülern.","Die Sozialpädagogin organisiert Projekte."}	2	21	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8404	sportunterricht	{"sports lessons"}	{"Sportunterricht macht Spaß!","Wir haben heute Sportunterricht."}	2	21	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8405	streng	{strict}	{"Der Lehrer ist sehr streng.","Strege Regeln gelten hier."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8406	tagesordnung	{"daily schedule"}	{"Die Tagesordnung steht an der Tafel.","Wir besprechen die Tagesordnung."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8407	teenager	{teenager}	{"Teenager haben viele Hobbys.","Sie ist eine typische Teenagerin."}	2	21	1	\N	teenager	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8408	teilnehmen	{"to take part"}	{"Wir nehmen am Wettbewerb teil.","Möchtest du teilnehmen?"}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8409	tier	{animal}	{"Im Zoo gibt es viele Tiere.","Wir lernen über Tiere in Biologie."}	2	21	3	\N	tiere	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8410	tierpfleger/in	{zookeeper}	{"Der Tierpfleger füttert die Löwen.","Die Tierpflegerin arbeitet im Zoo."}	2	21	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8411	träumen	{"to dream"}	{"Ich träume von Ferien.","Träumst du manchmal im Unterricht?"}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8412	traurig	{sad}	{"Warum bist du so traurig?","Die Geschichte ist traurig."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8413	turnen	{"to do gymnastics"}	{"Wir turnen in der Sporthalle.","Sie turnt jeden Montag."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8414	umknicken	{"to fold over"}	{"Pass auf, dass du nicht umknickst!","Er ist umgeknickt und hat Schmerzen."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8415	unfair	{unfair}	{"Das war unfair von dir!","Die Regel ist unfair."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8416	ungenügend	{unsatisfactory}	{"Die Note ist ungenügend.","Ungenügende Leistungen müssen wiederholt werden."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8417	uniform	{uniform}	{"Die Schüler tragen eine Uniform.","Die Uniform ist blau und weiß."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8418	unten	{under}	{"Das Buch liegt unten im Regal.","Unten im Erdgeschoss ist die Cafeteria."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8419	unterschied	{difference}	{"Was ist der Unterschied?","Es gibt große Unterschiede."}	2	21	1	\N	unterschiede	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8420	variante	{alternative}	{"Gibt es eine andere Variante?","Diese Variante ist besser."}	2	21	2	\N	varianten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8421	vergangenheit	{past}	{"Wir lernen über die Vergangenheit.","In der Vergangenheit war alles anders."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8422	vokabeltest	{"vocabulary test"}	{"Der Vokabeltest war einfach.","Wir schreiben einen Vokabeltest."}	2	21	1	\N	vokabeltests	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8423	vortrag	{presentation}	{"Mein Vortrag ist über Tiere.","Der Vortrag dauert 10 Minuten."}	2	21	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8424	werfen	{"to throw"}	{"Wirf den Ball zu mir!","Er wirft Papier in den Müll."}	2	21	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8425	akupunktur	{acupuncture}	{"Die Akupunktur hilft bei Schmerzen.","Er hat Akupunktur ausprobiert."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8426	alternative	{alternative}	{"Gibt es eine Alternative?","Wir suchen eine gesunde Alternative."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8427	anerkannt	{recognised}	{"Die Methode ist wissenschaftlich anerkannt.","Er ist ein anerkannter Arzt."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8429	auflistung	{list}	{"Die Auflistung enthält alle Medikamente.","Erstellt eine Auflistung der Zutaten."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8430	behandlung	{treatment}	{"Die Behandlung dauert eine Stunde.","Er sucht eine natürliche Behandlung."}	2	22	2	\N	behandlungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8431	belegen	{"to prove"}	{"Kannst du das mit Fakten belegen?","Die Studie belegt den Erfolg."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8432	bescheinigung	{certificate}	{"Die Bescheinigung liegt beim Arzt.","Brauchst du eine ärztliche Bescheinigung?"}	2	22	2	\N	bescheinigungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8433	boden	{floor}	{"Der Boden ist glatt.","Das Kind spielt auf dem Boden."}	2	22	1	\N	böden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8434	dagegen	{"in contrast"}	{"Ich habe nichts dagegen.","Dagegen kann man nichts tun."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8435	damit	{"so that"}	{"Damit du gesund bleibst, iss Gemüse.","Er trinkt Tee, damit er schläft."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8436	eiswürfel	{"ice cube"}	{"Die Eiswürfel sind im Gefrierfach.","Gib zwei Eiswürfel ins Wasser."}	2	22	1	\N	eiswürfel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8437	empfindlich	{sensitive}	{"Meine Haut ist empfindlich.","Sei vorsichtig, das Gerät ist empfindlich."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8438	engagieren	{"to engage"}	{"Er engagiert sich im Sportverein.","Wir engagieren Freiwillige für das Projekt."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8439	entspannen	{"to relax"}	{"Ich entspanne mich im Garten.","Yoga hilft, zu entspannen."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8440	entspannung	{relaxation}	{"Entspannung ist wichtig für die Gesundheit.","Wir üben Entspannungstechniken."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8441	erfahren	{"to find out"}	{"Wir erfahren morgen das Ergebnis.","Sie möchte mehr über die Behandlung erfahren."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8442	erstatten	{"to compensate"}	{"Die Kosten werden erstattet.","Kann ich das Geld erstatten?"}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8443	fit	{fit}	{"Er ist sehr fit durch Sport.","Fit bleiben ist wichtig."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8444	gesamt	{whole}	{"Die gesamte Familie ist gesund.","Das Projekt dauert einen gesamten Monat."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8445	gesundheitlich	{hygienic}	{"Das ist gesundheitlich unbedenklich.","Gesundheitliche Probleme sollten ernst genommen werden."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8446	gymnastik	{gymnastics}	{"Wir machen Gymnastik am Morgen.","Gymnastik stärkt die Muskeln."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8447	handgelenk	{wrist}	{"Mein Handgelenk tut weh.","Sie trägt eine Uhr am Handgelenk."}	2	22	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8448	hausmittel	{"home remedy"}	{"Honig ist ein gutes Hausmittel.","Wir verwenden Hausmittel gegen Husten."}	2	22	3	\N	hausmittel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8449	haut	{skin}	{"Die Haut braucht Pflege.","Sonnencreme schützt die Haut."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8450	hiermit	{herewith}	{"Hiermit bestätige ich den Empfang.","Hiermit erkläre ich das Meeting für eröffnet."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8451	hierzu	{hereto}	{"Hierzu gibt es keine Alternative.","Ich habe hierzu eine Frage."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8452	hochlegen	{"to elevate"}	{"Leg das Bein hoch, um die Schwellung zu reduzieren.","Sie legt den Arm nach der Verletzung hoch."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8453	holen	{"to fetch"}	{"Kannst du die Medizin holen?","Ich hole Hilfe."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8454	klagen	{"to sue"}	{"Sie klagt über Kopfschmerzen.","Er klagt gegen die Firma."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8455	kommunizieren	{"to communicate"}	{"Ärzte müssen gut kommunizieren.","Wir kommunizieren per E-Mail."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8456	kompliziert	{complicated}	{"Die Anweisung ist kompliziert.","Das Verfahren ist sehr kompliziert."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8457	kostenerstattung	{"reimbursement of costs"}	{"Die Kostenerstattung dauert zwei Wochen.","Beantragen Sie die Kostenerstattung."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8458	kostenübernahme	{"cost transfer"}	{"Die Kostenübernahme wurde genehmigt.","Die Krankenkasse prüft die Kostenübernahme."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8459	kühlen	{"to cool"}	{"Kühle die Verletzung mit Eis.","Die Creme kühlt die Haut."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8460	leihen	{"to lend"}	{"Kannst du mir dein Buch leihen?","Die Bibliothek leiht Bücher aus."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8461	manche	{some}	{"Manche Menschen sind allergisch.","Manche Medikamente haben Nebenwirkungen."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8462	massage	{massage}	{"Die Massage entspannt die Muskeln.","Er bucht eine Massage."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8463	massieren	{"to massage"}	{"Der Physiotherapeut massiert den Rücken.","Kannst du meine Schultern massieren?"}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8464	meditation	{meditation}	{"Meditation hilft gegen Stress.","Wir üben täglich Meditation."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8465	muskel	{muscle}	{"Der Muskel tut nach dem Training weh.","Starke Muskeln sind wichtig."}	2	22	1	\N	muskeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8466	nebenwirkung	{"side effect"}	{"Das Medikament hat Nebenwirkungen.","Übelkeit ist eine häufige Nebenwirkung."}	2	22	2	\N	nebenwirkungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8467	pilates	{pilates}	{"Pilates stärkt die Rückenmuskulatur.","Sie macht Pilates im Fitnessstudio."}	2	22	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8468	rat	{advice}	{"Kannst du mir Rat geben?","Der Arzt gab einen guten Rat."}	2	22	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8469	reizen	{"to irritate"}	{"Die Creme reizt die Haut.","Lautes Geräusch reizt die Ohren."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8470	rückenmuskulatur	{"back muscles"}	{"Stärke deine Rückenmuskulatur mit Übungen.","Die Rückenmuskulatur ist verspannt."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8471	schlafengehen	{"to go to sleep"}	{"Ich gehe um 22 Uhr schlafen.","Die Kinder müssen früh schlafengehen."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8472	schlagen	{"to hit"}	{"Er schlägt den Ball weit.","Schlag nicht auf den Tisch!"}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8473	schmerztablette	{"pain medication"}	{"Nimm eine Schmerztablette gegen Kopfweh.","Schmerztabletten helfen schnell."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8474	schwellung	{swelling}	{"Die Schwellung geht mit Eis zurück.","Nach dem Sturz gab es eine Schwellung."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8475	selber	{"by oneself"}	{"Das kannst du selber machen.","Er hat das Problem selber gelöst."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8476	speziell	{special}	{"Dieses Öl ist speziell für die Haut.","Brauchst du spezielles Training?"}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8477	sportart	{"type of sport"}	{"Welche Sportart magst du am liebsten?","Schwimmen ist eine gesunde Sportart."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8478	sportverein	{"sports club"}	{"Sie trainiert im Sportverein.","Unser Sportverein hat viele Mitglieder."}	2	22	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8479	ständig	{constant}	{"Er hat ständig Kopfschmerzen.","Ständiger Stress ist ungesund."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8480	stärken	{"to strengthen"}	{"Yoga stärkt die Muskeln.","Vitamine stärken das Immunsystem."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8481	tanzkurs	{"dance class"}	{"Der Tanzkurs beginnt nächste Woche.","Sie besucht einen Tanzkurs im Verein."}	2	22	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8482	teilnahme	{participation}	{"Die Teilnahme am Kurs ist kostenlos.","Vielen Dank für Ihre Teilnahme!"}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8483	teilnahmebescheinigung	{"participation certificate"}	{"Nach dem Kurs erhalten Sie eine Teilnahmebescheinigung.","Die Teilnahmebescheinigung liegt bereit."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8484	telefonisch	{"by telephone"}	{"Bitte melden Sie sich telefonisch an.","Die Beratung ist auch telefonisch möglich."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8485	therapie	{therapy}	{"Die Therapie hilft bei der Genesung.","Er macht eine physikalische Therapie."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8486	trainer/in	{trainer}	{"Der Trainer zeigt die Übungen.","Die Trainerin ist sehr geduldig."}	2	22	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8487	treiben	{"to do"}	{"Sie treibt regelmäßig Sport.","Was treibst du in deiner Freizeit?"}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8488	tüte	{bag}	{"Die Medizin ist in der Tüte.","Kannst du eine Tüte für den Müll holen?"}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8490	übersenden	{"to send"}	{"Wir übersenden die Unterlagen per Post.","Bitte übersenden Sie mir die Rechnung."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8491	überweisen	{"to transfer"}	{"Überweisen Sie das Geld an die Klinik.","Der Arzt überweist den Patienten ins Krankenhaus."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8492	übrigens	{"by the way"}	{"Übrigens, vergiss die Tabletten nicht!","Übrigens, der Termin wurde verschoben."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8493	verabschiedung	{approval}	{"Die Verabschiedung des Gesetzes dauert.","Die Verabschiedung des Plans erfolgte einstimmig."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8494	vermitteln	{"to procure"}	{"Die Apotheke vermittelt Medikamente.","Er vermittelt einen Termin beim Facharzt."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8495	verschreiben	{"to prescribe"}	{"Der Arzt verschreibt Antibiotika.","Dieses Medikament darf nur der Arzt verschreiben."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8496	versicherungsnehmer/in	{"policy holder"}	{"Der Versicherungsnehmer muss unterschreiben.","Die Versicherungsnehmerin hat Fragen zur Police."}	2	22	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8497	versicherungstarif	{"insurance tariff"}	{"Der Versicherungstarif ist günstig.","Vergleichen Sie die Versicherungstarife."}	2	22	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8498	verspannung	{tension}	{"Die Verspannung im Nacken ist schmerzhaft.","Massagen lösen Verspannungen."}	2	22	2	\N	verspannungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8499	während	{during}	{"Während der Behandlung bitte stillhalten.","Während des Essens nicht sprechen."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8500	wärmflasche	{"hot water bottle"}	{"Die Wärmflasche hilft bei Bauchschmerzen.","Sie füllt die Wärmflasche mit heißem Wasser."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8501	weggehen	{"to go away"}	{"Der Schmerz wird bald weggehen.","Kannst du nicht einfach weggehen?"}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8502	zwischendurch	{occasionally}	{"Trink zwischendurch viel Wasser.","Zwischendurch braucht man Pausen."}	2	22	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8503	abheben	{"to withdraw"}	{"Kann ich Geld am Automaten abheben?","Sie möchte 100 Euro abheben."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8504	aktivität	{activity}	{"Die Aktivität am Geldautomaten ist hoch.","Welche Aktivitäten bietet die Bank an?"}	2	23	2	\N	aktivitäten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8505	anfordern	{"to request"}	{"Bitte fordern Sie eine neue Karte an.","Er fordert eine Kontoauszug an."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8506	armut	{poverty}	{"Armut ist ein globales Problem.","Die Bank unterstützt Projekte gegen Armut."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8507	aufheben	{"to cancel"}	{"Kann ich den Vertrag aufheben?","Die Bank hebt die Gebühr auf."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8508	ausdrucken	{"to print"}	{"Drucken Sie die Rechnung aus.","Ich drucke den Kontoauszug aus."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8509	bankkarte	{"bank card"}	{"Meine Bankkarte ist gesperrt.","Haben Sie Ihre Bankkarte dabei?"}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8510	bankkaufmann/bankkauffrau	{banker}	{"Der Bankkaufmann berät Kunden.","Die Bankkauffrau arbeitet in der Filiale."}	2	23	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8511	bankleitzahl	{"sort code"}	{"Die Bankleitzahl steht auf der Karte.","Geben Sie die Bankleitzahl an."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8512	bankschalter	{"bank counter"}	{"Am Bankschalter wird bar ausgezahlt.","Der Bankschalter öffnet um 9 Uhr."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8513	bar	{"in cash"}	{"Zahlen Sie bar oder mit Karte?","Ich habe nur bar dabei."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8514	bargeld	{cash}	{"Ich brauche mehr Bargeld.","Bargeld ist nicht immer notwendig."}	2	23	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8515	bargeldlos	{cashless}	{"Bargeldloses Bezahlen ist modern.","Die Welt wird immer bargeldloser."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8516	basis	{basis}	{"Die Basis des Kontos ist sicher.","Auf dieser Basis arbeiten wir."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8517	begleichen	{"to settle"}	{"Bitte begleichen Sie die Rechnung.","Er begleicht seine Schulden."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8518	berechnen	{"to calculate"}	{"Die Bank berechnet Gebühren.","Kannst du die Zinsen berechnen?"}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8520	bestellung	{order}	{"Die Bestellung wurde storniert.","Bestellungen können online getätigt werden."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8521	bic	{BIC}	{"Der BIC ist für Überweisungen nötig.","Wo finde ich den BIC der Bank?"}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8522	blick	{view}	{"Der Blick aufs Konto zeigt den Saldo.","Ein schneller Blick genügt."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8524	drücken	{"to press"}	{"Drücken Sie den grünen Knopf.","Zum Bestätigen bitte drücken."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8525	eigen	{own}	{"Das ist mein eigenes Konto.","Er verwaltet seine eigenen Finanzen."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8526	eingabe	{input}	{"Die Eingabe des PINs ist erforderlich.","Überprüfen Sie Ihre Eingabe."}	2	23	2	\N	eingaben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8527	eingeben	{"to input"}	{"Geben Sie Ihre Daten ein.","Er gibt den Betrag in das System ein."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8528	einzahlen	{"to pay in"}	{"Ich zahle Geld auf mein Konto ein.","Kann ich hier Schecks einzahlen?"}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8519	bestellnummer	{"order number"}	{"Die Bestellnummer wird nach der Buchung per E-Mail versendet.","Für Rückfragen benötigen wir Ihre Bestellnummer."}	2	23	2	\N	Bestellnummern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8529	erledigen	{"to manage to"}	{"Ich erledige meine Bankgeschäfte online.","Kannst du das heute erledigen?"}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8530	eröffnen	{"to open"}	{"Ich möchte ein Konto eröffnen.","Er eröffnete ein Sparkonto."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8532	folgend	{following}	{"Im Folgenden erklären wir die Schritte.","Die folgende Woche ist wichtig."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8533	formulieren	{"to formulate"}	{"Formulieren Sie Ihre Anfrage klar.","Er formulierte einen Antrag."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8534	gebühr	{fee}	{"Die Gebühr beträgt 5 Euro.","Gibt es versteckte Gebühren?"}	2	23	2	\N	gebühren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8535	geldautomat	{"cash machine"}	{"Der Geldautomat ist defekt.","Wo ist der nächste Geldautomat?"}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8536	geldbörse	{purse}	{"Meine Geldbörse ist leer.","Sie verlor ihre Geldbörse."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8537	geldstück	{coin}	{"Ein Geldstück fiel auf den Boden.","Geldstücke sind schwer zu tragen."}	2	23	3	\N	geldstücke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8538	genießen	{"to enjoy"}	{"Kunden genießen kostenlose Beratung.","Ich genieße das Online-Banking."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8539	gewinnen	{"to win"}	{"Er gewann einen Preis bei der Bank.","Gewinnen Sie Zinsen mit dem Konto."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8540	girocard	{girocard}	{"Die Girocard wird weltweit akzeptiert.","Haben Sie eine Girocard?"}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8541	girokonto	{"current account"}	{"Ich eröffne ein Girokonto.","Das Girokonto hat keine Gebühren."}	2	23	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8542	hufeisen	{horseshoe}	{"Das Hufeisen bringt Glück.","Ein goldenes Hufeisen hängt an der Tür."}	2	23	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8543	iban	{IBAN}	{"Die IBAN steht auf der Karte.","Geben Sie die IBAN des Empfängers an."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8544	indirekt	{indirect}	{"Die indirekten Kosten sind hoch.","Es gibt indirekte Zuschläge."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8545	innenstadt	{"city centre"}	{"Die Bank liegt in der Innenstadt.","In der Innenstadt gibt es viele Filialen."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8546	jederzeit	{anytime}	{"Online-Banking ist jederzeit verfügbar.","Sie können uns jederzeit kontaktieren."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8547	kleeblatt	{cloverleaf}	{"Das Kleeblatt symbolisiert Glück.","Ein vierblättriges Kleeblatt ist selten."}	2	23	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8548	kleingeld	{"small change"}	{"Hast du Kleingeld für den Automaten?","Kleingeld ist im Alltag praktisch."}	2	23	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8549	kontoauszug	{"account statement"}	{"Der Kontoauszug zeigt alle Transaktionen.","Laden Sie den Kontoauszug herunter."}	2	23	1	\N	kontoauszüge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8550	kontoinhaber/in	{"account holder"}	{"Der Kontoinhaber muss unterschreiben.","Die Kontoinhaberin hat zwei Konten."}	2	23	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8551	kontonummer	{"account number"}	{"Ihre Kontonummer ist 12-stellig.","Geben Sie die Kontonummer an."}	2	23	2	\N	kontonummern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8552	kontostand	{balance}	{"Der Kontostand ist zu niedrig.","Überprüfen Sie Ihren Kontostand online."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8553	kontrollieren	{"to monitor"}	{"Kontrollieren Sie regelmäßig Ihr Konto.","Die Bank kontrolliert die Transaktionen."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8554	kreditinstitut	{"credit institute"}	{"Das Kreditinstitut vergibt Darlehen.","Wir vertrauen dem Kreditinstitut."}	2	23	3	\N	kreditinstitute	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8555	kreditkarte	{"credit card"}	{"Die Kreditkarte ist abgelaufen.","Bezahlen Sie mit Kreditkarte?"}	2	23	2	\N	kreditkarten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8557	kundenreferenz	{"customer reference"}	{"Die Kundenreferenz erleichtert die Zuordnung.","Vergessen Sie die Kundenreferenz nicht."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8558	laden	{premises}	{"Der Laden der Bank ist modern.","In diesem Laden gibt es einen Schalter."}	2	23	1	\N	läden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8559	leistung	{service}	{"Die Bank bietet viele Leistungen an.","Diese Leistung ist kostenpflichtig."}	2	23	2	\N	leistungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8560	menge	{amount}	{"Die Menge des Geldes ist begrenzt.","Eine große Menge wurde überwiesen."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8561	mobil	{portable}	{"Mobiles Bezahlen ist einfach.","Die App ist mobil nutzbar."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8556	kundennummer	{"customer number"}	{"Ihre Kundennummer finden Sie auf der Rechnung.","Bitte nennen Sie uns Ihre Kundennummer."}	2	23	2	\N	Kundennummern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8562	monatlich	{monthly}	{"Die monatliche Gebühr beträgt 5 Euro.","Er zahlt monatlich einen Betrag ein."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8563	münze	{coin}	{"Die Münze ist aus Silber.","Münzen sammeln ist ein Hobby."}	2	23	2	\N	münzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8564	niemand	{nobody}	{"Niemand kennt die PIN außer mir.","Niemand darf das Konto nutzen."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8565	nulltarif	{"zero tariff rate"}	{"Das Konto hat einen Nulltarif für Studenten.","Der Nulltarif gilt nur im ersten Jahr."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8566	nutzen	{usage}	{"Nutzen Sie die Online-Funktionen.","Die Nutzen des Kontos sind vielfältig."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8567	online-banking	{"online banking"}	{"Online-Banking ist sicher und schnell.","Ich nutze täglich Online-Banking."}	2	23	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8568	pfennig	{penny}	{"Der Pfennig ist eine alte Währung.","Ein Pfennig hat wenig Wert."}	2	23	1	\N	pfennige	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8569	pin	{PIN}	{"Geben Sie Ihre PIN ein.","Die PIN muss geheim bleiben."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8570	quatsch	{rubbish}	{"Das ist doch Quatsch!","Er erzählt nur Quatsch."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8571	rechnung	{bill}	{"Die Rechnung ist überfällig.","Bezahlen Sie die Rechnung online."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8572	rechnungsbetrag	{"invoice amount"}	{"Der Rechnungsbetrag ist korrekt.","Überprüfen Sie den Rechnungsbetrag."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8573	rechnungsnummer	{"invoice number"}	{"Die Rechnungsnummer finden Sie oben.","Geben Sie die Rechnungsnummer an."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8574	reich	{rich}	{"Er ist sehr reich.","Reiche Leute haben oft mehrere Konten."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8575	reichtum	{wealth}	{"Reichtum bringt Verantwortung.","Sein Reichtum ist legendär."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8576	respekt	{respect}	{"Respekt vor dem Geld anderer ist wichtig.","Er hat großen Respekt vor der Bank."}	2	23	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8577	schein	{"bank note"}	{"Ein 50-Euro-Schein liegt auf dem Tisch.","Haben Sie kleinere Scheine?"}	2	23	1	\N	scheine	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8578	schieben	{"to shut"}	{"Schieben Sie die Tür zu.","Er schob den Riegel vor."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8579	schlachten	{"to rob"}	{"Die Bank wurde schlachtet ausgeraubt.","Schlachten ist eine Straftat."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8580	schornsteinfeger/in	{"chimney sweep"}	{"Der Schornsteinfeger prüft die Heizung.","Die Schornsteinfegerin arbeitet selbstständig."}	2	23	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8581	sparkonto	{"savings account"}	{"Eröffnen Sie ein Sparkonto für Zinsen.","Das Sparkonto ist sicher."}	2	23	3	\N	sparkonten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8582	sparschwein	{"piggy bank"}	{"Das Sparschwein ist voller Münzen.","Kinder lieben Sparschweine."}	2	23	3	\N	sparschweine	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8584	stecken	{"to put"}	{"Stecken Sie die Karte in den Automaten.","Er steckt Geld in die Tasche."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8585	stoßen	{"to encounter"}	{"Er stieß auf ein Problem beim Überweisen.","Wir stoßen oft auf technische Schwierigkeiten."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8586	tan	{TAN}	{"Die TAN ist eine Transaktionsnummer.","Geben Sie die TAN ein."}	2	23	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8587	taste	{button}	{"Drücken Sie die grüne Taste.","Die Tasten am Automaten sind verschmutzt."}	2	23	2	\N	tasten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8588	täter/in	{culprit}	{"Der Täter wurde gefasst.","Die Täterin gestand den Betrug."}	2	23	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8589	überfall	{robbery}	{"Der Überfall auf die Bank schockierte alle.","Überfälle sind selten geworden."}	2	23	1	\N	überfälle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8590	überfallen	{"to rob"}	{"Die Bank wurde überfallen.","Überfallen ist eine schwere Tat."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8591	überwachungskamera	{CCTV}	{"Überwachungskameras schützen die Bank.","Die Überwachungskamera zeichnet alles auf."}	2	23	2	\N	überwachungskameras	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8592	überweisung	{transfer}	{"Die Überweisung dauert einen Tag.","Machen Sie eine Online-Überweisung."}	2	23	2	\N	überweisungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8593	überweisungsformular	{"bank transfer form"}	{"Füllen Sie das Überweisungsformular aus.","Das Überweisungsformular liegt bereit."}	2	23	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8594	versuch	{attempt}	{"Der Versuch, Geld abzuheben, scheiterte.","Ein weiterer Versuch ist nötig."}	2	23	1	\N	versuche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8595	verwendungszweck	{purpose}	{"Geben Sie den Verwendungszweck an.","Der Verwendungszweck ist Pflicht."}	2	23	1	\N	verwendungszwecke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8596	vorteil	{advantage}	{"Der Vorteil des Online-Bankings ist die Schnelligkeit.","Vorteile für Studenten sind verfügbar."}	2	23	1	\N	vorteile	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8597	weglaufen	{"to run away"}	{"Der Dieb wollte weglaufen.","Vor Problemen kann man nicht weglaufen."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8598	zahlungsempfänger/in	{payee}	{"Der Zahlungsempfänger bestätigte den Erhalt.","Die Zahlungsempfängerin ist im Ausland."}	2	23	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8599	zeitungsartikel	{"newspaper article"}	{"Ich habe einen interessanten Zeitungsartikel gelesen.","Der Zeitungsartikel berichtet über ein wichtiges Ereignis."}	2	23	1	\N	zeitungsartikel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8600	zeuge/zeugin	{witness}	{"Der Zeuge hat den Unfall genau beschrieben.","Die Zeugin hat alles gesehen und berichtet."}	2	23	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8601	zurückgeben	{"to return"}	{"Ich muss das Buch morgen zurückgeben.","Hast du das Geld schon zurückgegeben?"}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8602	abschalten	{"to switch off"}	{"Ich schalte den Computer ab.","Abends schalte ich gerne ab."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8603	appetit	{appetite}	{"Ich habe großen Appetit auf Pizza.","Nach dem Sport kommt der Appetit."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8604	ärgern	{"to annoy"}	{"Er ärgert seinen Bruder immer.","Ärgere dich nicht über Kleinigkeiten!"}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8605	asiatisch	{Asian}	{"Wir essen gerne asiatisch.","Asiatische Kultur ist faszinierend."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8606	ausflug	{excursion}	{"Am Wochenende machen wir einen Ausflug.","Der Ausflug in die Berge war toll."}	2	24	1	\N	ausflüge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8607	ausgezeichnet	{excellent}	{"Das Essen schmeckt ausgezeichnet!","Sie hat eine ausgezeichnete Idee."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8608	ausgleich	{balance}	{"Sport ist ein guter Ausgleich zum Alltag.","Sie sucht einen Ausgleich zwischen Arbeit und Freizeit."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8609	außer	{"apart from"}	{"Außer mir kommt niemand.","Wir machen alles außer Schwimmen."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8610	aussicht	{prospect}	{"Die Aussicht vom Berg ist wunderschön.","Wir haben keine Aussicht auf Erfolg."}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8611	babysitter/in	{babysitter}	{"Der Babysitter kommt heute Abend.","Die Babysitterin ist sehr zuverlässig."}	2	24	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8612	band	{band}	{"Die Band spielt live im Park.","Meine Lieblingsband kommt aus Berlin."}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8613	basketball	{basketball}	{"Wir spielen Basketball im Park.","Basketball macht viel Spaß."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8614	basteln	{"to do crafts"}	{"Kinder basteln gerne mit Papier.","Wir basteln Weihnachtsschmuck."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8615	besteck	{cutlery}	{"Das Besteck liegt auf dem Tisch.","Kannst du das Besteck holen?"}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8616	chor	{choir}	{"Der Chor singt im Gemeindesaal.","Sie ist Mitglied im Schulchor."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8617	daheim	{"at home"}	{"Ich bleibe heute daheim.","Daheim ist es am schönsten."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8618	daumen	{thumb}	{"Er hat sich den Daumen verletzt.","Drück mir die Daumen für die Prüfung!"}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8619	einlass	{admission}	{"Der Einlass beginnt um 19 Uhr.","Ohne Ticket gibt es keinen Einlass."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8620	entlang	{along}	{"Wir gehen den Fluss entlang.","Fahren Sie die Straße entlang."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8621	event	{event}	{"Das Event findet im Park statt.","Wir planen ein großes Event."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8622	feuerzeug	{lighter}	{"Hast du ein Feuerzeug dabei?","Das Feuerzeug ist leer."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8623	freizeit	{"free time"}	{"In meiner Freizeit lese ich Bücher.","Freizeit ist wichtig für Erholung."}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8624	freizeitaktivität	{"free time activities"}	{"Welche Freizeitaktivitäten magst du?","Freizeitaktivitäten machen Spaß."}	2	24	2	\N	freizeitaktivitäten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8625	freizeitangebot	{"leisure opportunities"}	{"Die Stadt hat viele Freizeitangebote.","Schau dir das Freizeitangebot online an."}	2	24	3	\N	freizeitangebote	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8626	freizeitvergnügen	{pastime}	{"Angeln ist sein liebstes Freizeitvergnügen.","Freizeitvergnügen sind vielfältig."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8627	gabel	{fork}	{"Die Gabel liegt links vom Teller.","Kannst du mir eine Gabel geben?"}	2	24	2	\N	gabeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8629	gedicht	{poem}	{"Sie schreibt ein romantisches Gedicht.","Gedichte sind manchmal schwer zu verstehen."}	2	24	3	\N	gedichte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8630	gegensatz	{contrast}	{"Schwarz und Weiß sind Gegensätze.","Im Gegensatz zu dir mag ich Kaffee."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8631	geiger/in	{violinist}	{"Der Geiger spielt im Orchester.","Die Geigerin übt täglich."}	2	24	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8632	gemischt	{mixed}	{"Die Gruppe ist gemischt aus Jung und Alt.","Gemischte Salate sind gesund."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8633	geschirr	{crockery}	{"Das Geschirr muss gespült werden.","Neues Geschirr sieht schön aus."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8634	grill	{barbecue}	{"Wir kaufen einen neuen Grill.","Am Wochenende machen wir Grillen."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8635	grillkohle	{"barbecue coal"}	{"Die Grillkohle ist fast verbraucht.","Kannst du Grillkohle mitbringen?"}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8636	grillplatz	{"barbecue area"}	{"Der Grillplatz ist reserviert.","Am See gibt es einen Grillplatz."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8637	grillsoße	{"barbecue sauce"}	{"Die Grillsoße schmeckt würzig.","Hast du Grillsoße gekauft?"}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8638	grillzange	{"barbecue tong"}	{"Die Grillzange liegt neben dem Grill.","Pass auf, die Grillzange ist heiß!"}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8639	herrlich	{delightful}	{"Das Wetter ist herrlich!","Ein herrlicher Tag am Strand."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8640	herum	{around}	{"Die Kinder laufen im Garten herum.","Wir sitzen um das Feuer herum."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8641	interessieren	{"to interest"}	{"Das Thema interessiert mich nicht.","Interessierst du dich für Kunst?"}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8642	interviewpartner/in	{"interview partner"}	{"Der Interviewpartner kommt gleich.","Die Interviewpartnerin antwortet offen."}	2	24	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8643	irgendwo	{somewhere}	{"Ich habe mein Handy irgendwo verloren.","Lass uns irgendwo hingehen!"}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8644	jährlich	{annually}	{"Das Festival findet jährlich statt.","Wir zahlen jährlich einen Beitrag."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8645	jeweils	{respectively}	{"Die Gruppen treffen sich jeweils montags.","Jeweils zwei Personen arbeiten zusammen."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8646	knackig	{crispy}	{"Das Brot ist frisch und knackig.","Knackiges Gemüse ist gesund."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8647	konzentrieren	{"to concentrate"}	{"Konzentrier dich auf deine Arbeit!","Ich kann mich hier nicht konzentrieren."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8648	kumpel	{mate}	{"Mein Kumpel hilft mir immer.","Wir treffen uns mit alten Kumpels."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8649	leidenschaft	{passion}	{"Tanzen ist ihre größte Leidenschaft.","Er verfolgt seine Leidenschaft für Musik."}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8650	löffel	{spoon}	{"Der Löffel fällt auf den Boden.","Brauchst du einen Löffel für die Suppe?"}	2	24	1	\N	löffel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8651	malen	{"to paint"}	{"Kinder malen gerne mit Wasserfarben.","Er malt ein Bild für die Ausstellung."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8652	meist	{most}	{"Meist gehe ich früh ins Bett.","Das ist die meist gestellte Frage."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8653	messer	{knife}	{"Das Messer ist scharf.","Kannst du das Messer reichen?"}	2	24	3	\N	messer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8654	mitfahren	{"to travel with"}	{"Kann ich mit dir mitfahren?","Wir fahren mit dem Zug mit."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8655	nähen	{"to sew"}	{"Sie näht ein Kleid für die Party.","Ich lerne gerade nähen."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8656	normalerweise	{normally}	{"Normalerweise gehe ich um 7 Uhr aus dem Haus.","Normalerweise regnet es hier im April."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8657	open-air-konzert	{"open air concert"}	{"Das Open-Air-Konzert war fantastisch.","Wir besuchen ein Open-Air-Konzert im Park."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8658	poetry-slam	{"poetry slam"}	{"Der Poetry-Slam beginnt um 20 Uhr.","Sie tritt beim Poetry-Slam auf."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8659	regie	{management}	{"Die Regie des Films war hervorragend.","Er übernimmt die Regie für das Theaterstück."}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8660	saal	{hall}	{"Der Saal ist gut gefüllt.","Wir mieten einen Saal für die Feier."}	2	24	1	\N	säle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8661	schach	{chess}	{"Schach spielen trainiert das Gehirn.","Wir spielen jeden Abend Schach."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8662	schnupperkurs	{"taster course"}	{"Der Schnupperkurs ist kostenlos.","Ich mache einen Schnupperkurs in Yoga."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6753	schlüssel	{key}	{"Ich habe meinen Schlüssel verloren.","Der Schlüssel passt nicht ins Schloss."}	1	27	1	\N	schlüssel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8663	segeln	{"to sail"}	{"Wir segeln am Wochenende auf dem See.","Segeln macht mir großen Spaß."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8664	sieg	{victory}	{"Der Sieg war hart erkämpft.","Wir feiern den Sieg unserer Mannschaft."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8665	spielfeld	{"playing field"}	{"Das Spielfeld ist nass vom Regen.","Die Kinder rennen über das Spielfeld."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8666	sportergebnis	{"sports result"}	{"Das Sportergebnis wurde live übertragen.","Die Sportergebnisse stehen in der Zeitung."}	2	24	3	\N	sportergebnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8667	sportplatz	{"sports field"}	{"Der Sportplatz ist beleuchtet.","Wir treffen uns am Sportplatz."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8668	surfen	{"to surf"}	{"Im Urlaub surfen wir jeden Tag.","Er surft gerne im Internet."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8669	tango	{tango}	{"Sie tanzen leidenschaftlich Tango.","Tango ist ein schöner Tanz."}	2	24	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8670	tänzer/in	{dancer}	{"Der Tänzer bewegt sich elegant.","Die Tänzerin tritt heute Abend auf."}	2	24	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8671	tischdecke	{tablecloth}	{"Die Tischdecke ist aus Baumwolle.","Wir decken den Tisch mit einer neuen Tischdecke."}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8672	tischdekoration	{"table decoration"}	{"Die Tischdekoration ist sehr kreativ.","Wer macht die Tischdekoration für die Feier?"}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8673	trotzdem	{despite}	{"Es regnet, trotzdem gehen wir spazieren.","Trotzdem danke ich dir für deine Hilfe."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8674	umfangreich	{comprehensive}	{"Das Angebot ist sehr umfangreich.","Ein umfangreiches Programm erwartet uns."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8675	umfrage	{survey}	{"Die Umfrage dauert nur fünf Minuten.","Machen Sie bei unserer Umfrage mit!"}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8676	umkleide	{"changing room"}	{"Die Umkleide ist neben dem Pool.","In der Umkleide ist es eng."}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8677	unterhalten	{"to entertain"}	{"Wir unterhalten uns über Filme.","Der Clown unterhält die Kinder."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8678	veranstalten	{"to organise"}	{"Wir veranstalten ein Sommerfest.","Der Verein veranstaltet einen Marathon."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8679	veranstaltungshinweis	{"event information"}	{"Der Veranstaltungshinweis hängt am Brett.","Alle Veranstaltungshinweise findest du online."}	2	24	1	\N	veranstaltungshinweise	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8680	verbringen	{"to spend time"}	{"Wir verbringen den Tag am See.","Wie verbringst du deine Freizeit?"}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8681	verpackung	{packaging}	{"Die Verpackung ist umweltfreundlich.","Wir reduzieren Plastikverpackungen."}	2	24	2	\N	verpackungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8682	verteilen	{"to distribute"}	{"Wir verteilen Flyer in der Stadt.","Die Geschenke werden an die Kinder verteilt."}	2	24	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8683	volleyballspiel	{"volley ball game"}	{"Das Volleyballspiel war spannend.","Wir schauen ein Volleyballspiel im Stadion."}	2	24	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8684	vorlesung	{lecture}	{"Die Vorlesung beginnt um 10 Uhr.","Er hält eine Vorlesung über Geschichte."}	2	24	2	\N	vorlesungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8695	ausgang	{exit}	{"Der Ausgang ist auf der linken Seite, wenn man vom Haupteingang kommt.","Bitte benutzen Sie den hinteren Ausgang, weil der vordere blockiert ist."}	3	2	1	\N	ausgänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8696	ausstattung	{equipment}	{"Die Ausstattung des Zimmers ist modern, obwohl das Hotel alt aussieht.","Die Schule hat eine neue Ausstattung erhalten, damit die Schüler besser lernen können."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8697	behälter	{container}	{"Ich fülle Wasser in den Behälter, der aus recyclebarem Material besteht.","Der Behälter ist aus Plastik, obwohl wir nachhaltige Alternativen suchen."}	3	2	1	\N	behälter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8698	betreten	{"to enter"}	{"Bitte nicht den Rasen betreten, weil er neu gepflanzt wurde.","Er durfte das Gebäude nicht betreten, obwohl er einen Termin hatte."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8699	bewohner/in	{resident}	{"Die Bewohner des Hauses sind freundlich, obwohl sie wenig Zeit haben.","Jede Bewohnerin hat ein eigenes Zimmer, damit Privatsphäre gewährleistet ist."}	3	2	5	\N	bewohner/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8700	bordkarte	{"boarding pass"}	{"Zeigen Sie bitte Ihre Bordkarte, die Sie online ausgedruckt haben.","Die Bordkarte ist beim Eingang nötig, weil sonst der Zutritt verweigert wird."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8701	camper/in	{camper}	{"Die Camper genießen die Natur, obwohl es manchmal regnet.","Jeder Camper braucht einen Schlafsack, weil die Nächte kalt sind."}	3	2	5	\N	camper/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8702	campingplatz	{campsite}	{"Wir schlafen heute auf einem Campingplatz, der nah am See liegt.","Der Campingplatz ist gut ausgestattet, sodass wir nichts vermissen."}	3	2	1	\N	campingplätze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8703	check-in-schalter	{"check-in desk"}	{"Bitte gehen Sie zum Check-in-Schalter, der sich in Zone B befindet.","Der Check-in-Schalter ist geschlossen, weil die Mitarbeiter eine Pause machen."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8704	container	{container}	{"Der Container ist sehr schwer, weil er voller Werkzeuge ist.","Wir lagern das Material im Container, damit es vor Regen geschützt ist."}	3	2	3	\N	container	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8705	dienstreise	{"business trip"}	{"Ich bin nächste Woche auf Dienstreise, obwohl ich lieber im Büro bleibe.","Die Dienstreise dauert drei Tage, sodass ich viel organisieren muss."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8706	doppelbett	{"double bed"}	{"Wir schlafen in einem Doppelbett, das sehr bequem ist.","Das Doppelbett ist sehr bequem, obwohl es etwas zu klein wirkt."}	3	2	3	\N	doppelbetten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8808	einlegen	{"to insert"}	{"Leg die Batterie ein, bevor das Gerät kaputt geht.","Sie legt eine Pause ein, weil sie müde ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8707	doppelzimmer	{"double room"}	{"Wir haben ein Doppelzimmer gebucht, weil wir zusammen reisen.","Das Doppelzimmer hat ein großes Fenster, durch das man die Berge sieht."}	3	2	3	\N	doppelzimmer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8708	einchecken	{"to check-in"}	{"Wir müssen vor 18 Uhr einchecken, sonst verfällt unsere Reservierung.","Bitte beim Hotel einchecken, indem Sie Ihren Ausweis vorzeigen."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8709	einsteigezeit	{"boarding time"}	{"Die Einsteigezeit ist um 15 Uhr, obwohl der Flug später startet.","Bitte beachten Sie die Einsteigezeit, damit es keine Verzögerungen gibt."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8710	einzelzimmer	{"single room"}	{"Ich möchte ein Einzelzimmer reservieren, weil ich alleine reise.","Das Einzelzimmer kostet weniger, obwohl es genauso komfortabel ist."}	3	2	3	\N	einzelzimmer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8711	erleben	{"to experience"}	{"Ich möchte etwas Neues erleben, indem ich fremde Kulturen kennenlerne.","Auf der Reise kannst du viel erleben, wenn du offen für Abenteuer bist."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8712	flug	{flight}	{"Ich habe meinen Flug nach Berlin gebucht, obwohl ich Flugangst habe.","Der Flug von München nach Frankfurt dauert etwa eine Stunde, sodass wir schnell ankommen."}	3	2	1	\N	flüge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8713	flugbegleiter/in	{"flight attendant"}	{"Der Flugbegleiter hat uns die Sicherheitsvorkehrungen erklärt, weil es Pflicht ist.","Die Flugbegleiterin servierte das Essen während des Flugs, obwohl es Turbulenzen gab."}	3	2	5	\N	flugbegleiter/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8714	fluggast	{passenger}	{"Der Fluggast muss sich während des Fluges anschnallen, weil es sicherer ist.","Alle Fluggäste sollten ihren Pass bereit halten, damit der Check-in schneller geht."}	3	2	1	\N	fluggäste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8715	fluggesellschaft	{airline}	{"Wir fliegen mit einer internationalen Fluggesellschaft, die gute Bewertungen hat.","Die Fluggesellschaft bietet kostenfreie Mahlzeiten an, obwohl die Tickets günstig sind."}	3	2	2	\N	fluggesellschaften	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8716	führen	{"to lead"}	{"Er führt die Gruppe zum Gate, das sich in Terminal B befindet.","Die Reiseleiterin führt uns durch die Sehenswürdigkeiten, weil sie die Stadt gut kennt."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8717	füttern	{"to feed"}	{"Er füttert die Tauben im Park, obwohl es verboten ist.","Die Flugbegleiterin fütterte die Passagiere mit Snacks, während der Flug ruhig verlief."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8718	gate	{gate}	{"Wir müssen noch zum Gate E8 gehen, das am Ende des Terminals liegt.","Das Gate für unseren Flug wurde geändert, deshalb laufen wir schnell."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8719	gepäck	{luggage}	{"Mein Gepäck ist nach dem Flug noch nicht angekommen, obwohl ich es aufgegeben habe.","Vergiss nicht, dein Gepäck vom Band zu nehmen, bevor du den Flughafen verlässt."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8720	gepäckausgabe	{"baggage reclaim"}	{"Die Gepäckausgabe befindet sich im Erdgeschoss, wo viele Menschen warten.","Wir warten seit zehn Minuten an der Gepäckausgabe, weil das Band defekt ist."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8721	gepäckband	{"luggage belt"}	{"Das Gepäckband ist sehr voll heute, weil viele Flüge gelandet sind.","Schau nach deinem Gepäck auf dem Gepäckband, das sich langsam bewegt."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8722	gestattet sein	{"to be permitted"}	{"Es ist gestattet, ein Handgepäckstück mitzunehmen, solange es die Größe nicht überschreitet.","Tiere sind auf diesem Flug nicht gestattet, weil es Allergiker gibt."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8723	halbpension	{half-board}	{"Wir haben Halbpension in unserem Hotel gebucht, damit wir flexibel sind.","Halbpension beinhaltet Frühstück und Abendessen, obwohl Mittagessen extra kostet."}	3	2	2	\N	(hp)	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8724	handgepäck	{"hand luggage"}	{"Das Handgepäck muss unter dem Sitz verstaut werden, weil es sonst stört.","Achte darauf, dass dein Handgepäck die Gewichtsbeschränkung nicht überschreitet, sonst musst du zahlen."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8725	historisch	{historical}	{"Das Schloss ist ein historisches Gebäude, das im 15. Jahrhundert gebaut wurde.","Berlin hat viele historische Sehenswürdigkeiten, die Touristen anziehen."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8726	hostel	{hostel}	{"Wir übernachten in einem Hostel in der Stadt, das günstige Preise anbietet.","Das Hostel bietet günstige Preise für junge Reisende, obwohl es sehr sauber ist."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8727	hygienisch	{hygienic}	{"Die sanitären Einrichtungen im Hostel sind sehr hygienisch, weil sie täglich gereinigt werden.","Achte darauf, dass du beim Essen hygienisch vorgehst, um Krankheiten zu vermeiden."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8728	inlineskaten	{"inline skating"}	{"Inlineskaten macht im Sommer besonders viel Spaß, wenn die Wege trocken sind.","Sie fährt gerne Inlineskaten im Park, obwohl sie manchmal stürzt."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8729	jugendherberge	{"youth hostel"}	{"Wir haben in einer Jugendherberge übernachtet, die nah am Stadtzentrum liegt.","Die Jugendherberge bietet günstige Zimmer für Studenten, weil sie gemeinnützig ist."}	3	2	2	\N	jugendherbergen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8731	klettern	{"to climb"}	{"Er möchte in den Alpen klettern, obwohl er noch Anfänger ist.","Klettern macht mir viel Spaß, besonders in den Bergen, wo die Aussicht toll ist."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8732	komfortabel	{comfortable}	{"Das Hotelzimmer ist sehr komfortabel, weil es einen großen Fernseher hat.","Der Stuhl im Flugzeug ist nicht sehr komfortabel, obwohl die Reise lang ist."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8733	lage	{site}	{"Die Lage des Hotels ist ideal für Touristen, weil es nah an den Sehenswürdigkeiten liegt.","Die Lage des Flughafens ist außerhalb der Stadt, sodass man ein Taxi nehmen muss."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8734	lagerfeuer	{campfire}	{"Wir haben am Lagerfeuer gesessen und Lieder gesungen, während die Sterne leuchteten.","Das Lagerfeuer brannte die ganze Nacht, obwohl es windig war."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8735	landen	{"to land"}	{"Das Flugzeug wird bald landen, weil der Pilot die Landung vorbereitet.","Wir landeten sicher am Flughafen, obwohl es stark regnete."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8736	lärm	{noise}	{"Der Lärm im Flughafen war unerträglich, weil viele Menschen gleichzeitig sprachen.","Es war viel Lärm während des Festivals, sodass ich Kopfschmerzen bekam."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8737	lautsprecherdurchsage	{"tannoy announcement"}	{"Die Lautsprecherdurchsage informierte uns über die Verspätung, die wegen des Wetters entstand.","Wir hörten eine Lautsprecherdurchsage über den nächsten Flug, der gestrichen wurde."}	3	2	2	\N	lautsprecherdurchsagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8738	lebhaft	{lively}	{"Die Stadt war lebhaft und voller Touristen, weil ein Festival stattfand.","Der Markt war sehr lebhaft mit vielen Menschen, die Obst und Gemüse kauften."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8739	leine	{rope}	{"Ich binde das Zelt mit einer Leine fest, damit es nicht wegfliegt.","Die Leine war stark genug, um das Boot zu sichern, obwohl der Sturm tobte."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8740	leuchtturm	{lighthouse}	{"Der Leuchtturm auf der Insel ist sehr alt, aber immer noch in Betrieb.","Wir besuchten den Leuchtturm am Meer, weil er eine tolle Aussicht bietet."}	3	2	1	\N	leuchttürme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8741	meerblick	{seaview}	{"Das Hotelzimmer hat einen schönen Meerblick, der jeden Morgen beeindruckt.","Wir genießen den Meerblick vom Balkon aus, während die Sonne untergeht."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8742	mitten	{middle}	{"Das Café liegt mitten in der Stadt, sodass es leicht zu finden ist.","Sie trafen sich mitten auf der Brücke, weil es ein romantischer Ort ist."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8743	nebel	{fog}	{"Der Nebel war heute Morgen sehr dicht, sodass man kaum etwas sehen konnte.","Im Nebel konnte man kaum etwas sehen, obwohl die Straßenlaternen brannten."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8744	neblig	{foggy}	{"Das Wetter ist heute neblig und kühl, deshalb trage ich eine Jacke.","Die Straßen sind bei nebligem Wetter gefährlich, weil die Sicht schlecht ist."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8745	paradies	{paradise}	{"Die Insel ist ein wahres Paradies, weil die Natur unberührt ist.","Sie fühlte sich wie im Paradies, als sie den Strand sah."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8746	passagier/in	{passenger}	{"Der Passagier hat sein Gepäck verloren, obwohl es markiert war.","Die Passagierin bat um eine Decke, weil ihr kalt war."}	3	2	5	\N	passagiere	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8747	passkontrolle	{"passport control"}	{"Bei der Passkontrolle mussten wir warten, weil viele Reisende da waren.","Die Passkontrolle am Flughafen war streng, obwohl wir nichts Verbotenes dabeihatten."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8748	pilotenstreik	{"pilot strike"}	{"Der Pilotenstreik hat viele Flüge gestrichen, sodass wir umbuchen mussten.","Wegen des Pilotenstreiks gab es Verspätungen, die unseren Urlaub verzögerten."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8749	pool	{pool}	{"Der Pool im Hotel ist sehr sauber, weil er täglich gereinigt wird.","Kinder spielen gerne im Pool, obwohl das Wasser kalt ist."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8750	rechtzeitig	{"on time"}	{"Wir sind rechtzeitig zum Meeting gekommen, weil wir früh losfuhren.","Bitte seid rechtzeitig am Bahnhof, damit wir den Zug nicht verpassen."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8751	reisebüro	{"travel agency"}	{"Das Reisebüro hat unsere Tour gebucht, die alle Sehenswürdigkeiten umfasst.","Im Reisebüro gibt es viele Angebote, weil die Saison bald beginnt."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8752	reiseplan	{itinerary}	{"Unser Reiseplan ist sehr straff, weil wir viel sehen wollen.","Hast du den Reiseplan schon gesehen, der alle Aktivitäten auflistet?"}	3	2	1	\N	reisepläne	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8753	reiseplanung	{"travel planning"}	{"Die Reiseplanung dauert lange, weil wir alles perfekt organisieren wollen.","Gute Reiseplanung vermeidet Probleme, die während der Reise auftreten könnten."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8754	reiten	{"to ride"}	{"Sie reitet jeden Morgen, weil es ihr hilft, Stress abzubauen.","Kannst du reiten lernen, obwohl du Angst vor Pferden hast?"}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8755	ruhezeit	{"rest period"}	{"In der Ruhezeit ist es leise, weil niemand laut sein darf.","Die Ruhezeit beginnt um 22 Uhr, sodass alle Gäste schlafen können."}	3	2	2	\N	ruhezeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8756	sauber	{clean}	{"Die Wohnung ist sauber und ordentlich, weil wir täglich putzen.","Bitte haltet die Küche sauber, damit es keine Schädlinge gibt."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8757	sauberkeit	{cleanliness}	{"Die Sauberkeit im Hotel war vorbildlich, weil das Personal sehr fleißig ist.","Sauberkeit ist sehr wichtig, besonders in Gemeinschaftsräumen."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8758	schalter	{desk}	{"Am Schalter gab es Informationen, die uns weiterhalfen.","Der Schalter schließt um 18 Uhr, obwohl noch viele Kunden warten."}	3	2	1	\N	schalter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8759	schlange	{snake}	{"Eine Schlange kroch über den Weg, während wir wanderten.","Die Schlange ist ungiftig, obwohl sie gefährlich aussah."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8760	sonnenschirm	{parasol}	{"Der Sonnenschirm schützt vor der Sonne, die heute sehr stark ist.","Wir brauchen einen neuen Sonnenschirm, weil der alte kaputt ist."}	3	2	1	\N	sonnenschirme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8761	sonnenterrasse	{"sun terrace"}	{"Die Sonnenterrasse ist beliebt, weil man dort gut entspannen kann.","Auf der Sonnenterrasse kann man relaxen, während man aufs Meer blickt."}	3	2	2	\N	sonnenterrassen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8762	sonnenuntergang	{sunset}	{"Der Sonnenuntergang war atemberaubend, weil der Himmel rot leuchtete.","Wir schauten den Sonnenuntergang an, während das Meer ruhig war."}	3	2	1	\N	sonnenuntergänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8763	stern	{star}	{"Der Stern leuchtet hell am Himmel, obwohl die Stadtbeleuchtung stark ist.","Sie wünschte sich etwas beim Stern, den sie am Horizont sah."}	3	2	1	\N	sterne	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8764	stören	{"to disturb"}	{"Bitte störe mich nicht, weil ich gerade an einem wichtigen Projekt arbeite.","Der Lärm, der aus der Nachbarwohnung kommt, stört die anderen Bewohner."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8765	streichholz	{match}	{"Obwohl ein Streichholz klein ist, reicht es aus, um das Lagerfeuer anzuzünden.","Das Streichholz, das auf dem nassen Boden lag, funktionierte nicht mehr."}	3	2	3	\N	streichhölzer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8766	streiken	{"to strike"}	{"Die Arbeiter wollen streiken, weil sie faire Löhne und bessere Arbeitsbedingungen fordern.","Die Busfahrer, die seit Wochen unzufrieden sind, streiken ab morgen."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8767	taschenlampe	{torch}	{"Die Taschenlampe, die ich im Campingladen gekauft habe, ist extrem hell.","Nimm die Taschenlampe mit, damit wir nachts den Weg finden können."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8768	taschenmesser	{"pocket knife"}	{"Das Taschenmesser, das er immer in der Tasche trägt, ist sehr scharf und praktisch.","Er benutzte ein Taschenmesser, um die Verpackung des Proviants zu öffnen."}	3	2	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8769	traumhaft	{wonderful}	{"Das Essen im Restaurant war so traumhaft lecker, dass wir beschlossen, es weiterzuempfehlen.","Obwohl es Winter war, hatten wir traumhaft schönes Wetter am Strand."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8770	übernachten	{"to stay overnight"}	{"Wir übernachten im Hotel, das direkt am See liegt und einen fantastischen Ausblick bietet.","Können wir hier übernachten, wenn wir keinen Campingplatz finden?"}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8771	übernachtung	{"overnight stay"}	{"Die Übernachtung, die wir online gebucht hatten, war überraschend komfortabel und ruhig.","Die Übernachtung kostet 80 Euro, obwohl das Frühstück nicht enthalten ist."}	3	2	2	\N	übernachtungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8772	übernachtung mit frühstück	{"overnight stay with breakfast"}	{"Die Übernachtung mit Frühstück, die wir gewählt haben, ist ideal für Reisende mit kleinem Budget.","Buchen Sie eine Übernachtung mit Frühstück, damit Sie sich morgens keine Sorgen machen müssen."}	3	2	2	\N	üf	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8773	umgebung	{surroundings}	{"Die Umgebung, in der das Hotel liegt, ist ruhig und perfekt zum Entspannen.","Erkunde die Umgebung des Hotels, während du einen Morgenspaziergang machst."}	3	2	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8774	umgehend	{immediately}	{"Bitte antworte umgehend, da die Reservierung sonst storniert wird.","Die Reparatur muss umgehend erfolgen, um größere Schäden am Gebäude zu vermeiden."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8775	verärgert	{annoyed}	{"Er war verärgert, weil der Flug wegen eines Streiks drei Stunden Verspätung hatte.","Sie schaute verärgert drein, obwohl sie versuchte, höflich zu bleiben."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8776	verreisen	{"to travel"}	{"Wir verreisen nächste Woche, obwohl das Wetter unbeständig sein soll.","Sie verreist gerne im Sommer, wenn die Tage lang und warm sind."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8777	verschieben	{"to postpone"}	{"Wir müssen den Termin verschieben, weil ein wichtiges Dokument fehlt.","Das Spiel, das für heute geplant war, wurde wegen starken Regens verschoben."}	3	2	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8778	wanderer	{hiker}	{"Der Wanderer, der alleine unterwegs war, verlor den Weg im dichten Wald.","Ein Wanderer, der die Gegend nicht kannte, fragte uns nach dem richtigen Pfad."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8779	wandertour	{"walking tour"}	{"Die Wandertour, die wir gestern unternommen haben, war anstrengend aber lohnenswert.","Planen Sie eine Wandertour, obwohl das Wetterbericht Gewitter vorhersagt?"}	3	2	2	\N	wandertouren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8780	waschraum	{"laundry room"}	{"Der Waschraum, den alle Gäste nutzen können, befindet sich im Erdgeschoss des Hostels.","Die Waschräume, die täglich gereinigt werden, sind immer hygienisch und sauber."}	3	2	1	\N	waschräume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8781	wohnwagen	{caravan}	{"Der Wohnwagen, den sie gemietet haben, ist geräumig und modern ausgestattet.","Sie reisen mit einem Wohnwagen, um flexibel und unabhängig zu sein."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8782	zelt	{tent}	{"Das Zelt, das wir letztes Jahr gekauft haben, steht bereits im Wald bereit.","Wir brauchen ein neues Zelt, weil das alte beim letzten Sturm kaputtgegangen ist."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8783	zoll	{customs}	{"Der Zoll, der für die Einreisekontrolle zuständig ist, überprüfte unser Gepäck sehr genau.","Am Zoll gab es eine lange Verzögerung, weil viele Passagiere kontrolliert werden mussten."}	3	2	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8784	zuschlag	{fees}	{"Der Zuschlag, den wir für die Expresslieferung zahlen mussten, betrug 15 Euro.","Für Gepäck über 20 kg gibt es einen Zuschlag, obwohl das selten kontrolliert wird."}	3	2	1	\N	zuschläge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8785	absprechen	{"to arrange"}	{"Lass uns den Termin absprechen, bevor der Chef ins Meeting geht.","Wir müssen die Zeit absprechen, weil sonst niemand Bescheid weiß."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8786	abstellplatz	{"parking space"}	{"Der Parkplatz ist voll, obwohl es früh am Morgen ist.","Hier ist ein Abstellplatz für Fahrräder, der überdacht und sicher ist."}	3	3	1	\N	abstellplätze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8787	akzeptieren	{"to accept"}	{"Kannst du meine Entschuldigung akzeptieren, obwohl ich zu spät kam?","Sie akzeptiert Kreditkarten, weil viele Kunden danach fragen."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8788	anstreichen	{"to paint"}	{"Wir streichen das Zimmer an, damit es frischer aussieht.","Er hat den Zaun grün angestrichen, obwohl die Nachbarn es hässlich finden."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8789	ärger	{trouble}	{"Das gibt Ärger mit dem Nachbarn, wenn wir weiterhin laut sind.","Warum hast du Ärger, obwohl du nichts falsch gemacht hast?"}	3	3	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8790	ärgerlich	{annoying}	{"Das Warten ist ärgerlich, weil wir schon eine Stunde zu spät sind.","Seine Frage war ärgerlich, obwohl er es nicht böse meinte."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8791	aufregung	{commotion}	{"Warum gibt es so viel Aufregung, wenn doch alles geklappt hat?","Die Aufregung war unnötig, weil es nur ein Missverständnis war."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8792	ausnahme	{exception}	{"Das ist eine seltene Ausnahme, die wir nur einmal genehmigen.","Keine Ausnahmen, bitte! Auch wenn es schwierig ist."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8793	balkongeländer	{"balcony railing"}	{"Das Balkongeländer ist neu, weil das alte rostig war.","Vorsicht am Balkongeländer, wenn Kinder im Haus sind!"}	3	3	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8794	befestigen	{"to secure"}	{"Befestige das Bild an der Wand, bevor es herunterfällt.","Der Schuh ist nicht befestigt, deshalb rutscht er immer ab."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8795	behalten	{"to keep"}	{"Darf ich den Stift behalten, wenn du ihn nicht mehr brauchst?","Sie behält immer Ruhe, auch wenn alle anderen stressen."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8796	beleidigen	{"to offend"}	{"Man soll niemanden beleidigen, auch wenn man wütend ist.","Warum beleidigst du mich, obwohl ich dir geholfen habe?"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8797	beleidigung	{insult}	{"Das war eine schlimme Beleidigung, die er nicht vergessen wird.","Beleidigungen tun weh, auch wenn sie nicht ernst gemeint sind."}	3	3	2	\N	beleidigungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8798	berechtigt	{justified}	{"Deine Frage ist berechtigt, weil niemand die Regel versteht.","Sie ist berechtigt, sauer zu sein, nachdem man sie ignoriert hat."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8799	beschimpfen	{"to insult"}	{"Er beschimpft den Fahrer, obwohl er selbst Schuld am Stau ist.","Beschimpf mich nicht! Auch wenn du recht hast."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8800	beschimpfung	{swear}	{"Beschimpfungen sind verboten, weil sie das Klima vergiften.","Er hörte laute Beschimpfungen, als der Streit eskalierte."}	3	3	2	\N	beschimpfungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8801	beschweren	{"to complain"}	{"Sie beschwert sich über das Essen, weil es zu kalt serviert wurde.","Ich möchte mich beschweren, obwohl ich normalerweise geduldig bin."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8802	blumentopf	{"flower pot"}	{"Der Blumentopf ist aus Ton, damit die Wurzeln atmen können.","Blumentöpfe brauchen Löcher, weil sonst das Wasser stehen bleibt."}	3	3	1	\N	blumentöpfe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8803	bohren	{"to drill"}	{"Er bohrt ein Loch in die Wand, obwohl es verboten ist.","Darf ich hier bohren, oder stört das die Nachbarn?"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8804	deswegen	{"that is why"}	{"Deswegen bin ich hier: um das Problem zu klären.","Ich mag deswegen keinen Kaffee, weil er mir Bauchschmerzen macht."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8805	dumm	{stupid}	{"Das war eine dumme Idee, weil niemand sie verstanden hat!","Ich fühle mich dumm, obwohl ich viel gelernt habe."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8806	eilig	{urgent}	{"Hast du es eilig, weil der Zug gleich fährt?","Die Sache ist sehr eilig, deshalb müssen wir jetzt handeln."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8807	einhalten	{"to comply"}	{"Wir müssen die Regeln einhalten, auch wenn sie streng sind.","Er hält die Versprechen nicht ein, obwohl er es versprochen hat."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8809	einstellen	{"to set up"}	{"Stell die Uhr richtig ein, damit wir pünktlich sind.","Wir stellen die Heizung ein, weil es zu kalt wird."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8810	enden	{"to end"}	{"Der Film endet um 20 Uhr, obwohl er länger dauern sollte.","Wann endet die Sitzung, wenn wir später anfangen?"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8811	entscheidung	{decision}	{"Das ist eine schwere Entscheidung, weil sie alles verändert.","Treffe eine Entscheidung, bevor es zu spät ist!"}	3	3	2	\N	entscheidungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8812	entspannend	{relaxing}	{"Yoga ist sehr entspannend, weil es den Stress reduziert.","Ein entspannender Urlaub ist wichtig, obwohl er teuer sein kann."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8813	entsprechen	{"to correspond to"}	{"Das entspricht nicht der Wahrheit, auch wenn du es glaubst.","Entspricht es deinen Plänen, wenn wir morgen anfangen?"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8814	erhöhen	{"to increase"}	{"Die Preise erhöhen sich, obwohl die Qualität gleich bleibt.","Er erhöht die Lautstärke, weil er nichts hören kann."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8815	erleichtern	{"to relieve"}	{"Das erleichtert die Arbeit, weil es weniger Fehler gibt.","Es erleichtert mich sehr, dass alles geklappt hat."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8816	erwähnen	{"to mention"}	{"Erwähnst du meinen Namen, wenn du mit ihm sprichst?","Sie erwähnte das Problem, obwohl es unangenehm war."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8817	eskalieren	{"to escalate"}	{"Der Streit eskaliert schnell, weil niemand zuhört.","Die Lage könnte eskalieren, wenn wir nicht handeln."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8818	exotisch	{exotic}	{"Das Restaurant ist exotisch, weil es Gerichte aus aller Welt anbietet.","Exotische Tiere leben hier, obwohl das Klima nicht ideal ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8819	fair	{fair}	{"Das ist nicht fair, weil du alle Regeln ignorierst!","Sei fair zu allen, auch wenn es schwierig ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8820	festkleben	{"to stick"}	{"Kleb das Poster fest, bevor es herunterfällt.","Der Aufkleber klebt fest, obwohl er alt ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8821	freude	{joy}	{"Das macht mir Freude, weil ich gerne helfe.","Die Kinder lachen vor Freude, als sie das Geschenk sahen."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8822	frist	{deadline}	{"Die Frist ist nächste Woche, deshalb müssen wir uns beeilen.","Halte die Frist ein, auch wenn es stressig ist!"}	3	3	2	\N	fristen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8823	fristgerecht	{punctual}	{"Die Aufgabe war fristgerecht, obwohl es Probleme gab.","Bitte liefer fristgerecht, weil wir sonst Strafen zahlen!"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8824	fristlos	{"without notice"}	{"Er bekam eine fristlose Kündigung, weil er gegen Regeln verstieß.","Fristlos entlassen zu werden, ist sehr belastend."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8825	gemeinschaftsraum	{"common room"}	{"Wir treffen uns im Gemeinschaftsraum, weil er groß und hell ist.","Der Gemeinschaftsraum ist groß, obwohl er selten genutzt wird."}	3	3	1	\N	gemeinschaftsräume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8826	gesetzlich	{legal}	{"Das ist gesetzlich erlaubt, auch wenn es seltsam erscheint.","Gesetzliche Regelungen beachten, weil sie sonst Ärger geben."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8827	hämmern	{"to hammer"}	{"Er hämmert an der Wand, obwohl es schon spät ist.","Kannst du nicht leiser hämmern, weil die Nachbarn schlafen?"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8828	heizen	{"to heat"}	{"Wir heizen mit Gas, weil es billiger ist als Strom.","Im Winter muss man heizen, obwohl es teuer ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8829	instandhaltung	{maintenance}	{"Die Instandhaltung ist teuer, weil das Haus alt ist.","Instandhaltung des Hauses ist wichtig, auch wenn es Zeit kostet."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8830	klug	{clever}	{"Das war sehr klug, weil du alle Risiken bedacht hast!","Ein kluger Mensch fragt nach, wenn er etwas nicht versteht."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8831	konflikt	{conflict}	{"Der Konflikt wurde gelöst, obwohl es schwierig schien.","Konflikte vermeiden, indem man offen kommuniziert."}	3	3	1	\N	konflikte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8832	kündigung	{termination}	{"Sie erhielt die Kündigung, weil sie die Regeln nicht einhielt.","Die Kündigung ist schriftlich, auch wenn sie unfair erscheint."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8833	lüften	{"to air"}	{"Bitte lüfte das Schlafzimmer, bevor du schlafen gehst.","Wir lüften die Wohnung, weil die Luft stickig ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8834	massiv	{solid}	{"Der Tisch ist massiv, obwohl er leicht aussieht.","Massive Holzmöbel halten länger, weil sie stabil sind."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8835	meckern	{"to whinge"}	{"Hör auf zu meckern, auch wenn etwas schiefgeht!","Sie meckert über das Wetter, obwohl es sonnig ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8836	meerschweinchen	{"guinea pig"}	{"Meerschweinchen sind niedlich, weil sie so neugierig sind.","Unser Meerschweinchen heißt Max, obwohl es eigentlich weiblich ist."}	3	3	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8837	mieterhöhung	{"rent increase"}	{"Die Mieterhöhung ist unfair, weil das Einkommen nicht steigt.","Mieterhöhungen sind häufig, obwohl die Qualität nicht besser wird."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8838	mietspiegel	{"rent index"}	{"Der Mietspiegel steigt jedes Jahr, weil die Nachfrage hoch ist.","Was steht im Mietspiegel, wenn die Preise unklar sind?"}	3	3	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8839	mietvertrag	{"rental contract"}	{"Der Mietvertrag ist unterschrieben, obwohl ich Bedenken hatte.","Lies den Mietvertrag genau, bevor du unterschreibst!"}	3	3	1	\N	mietverträge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8840	modernisierung	{modernisation}	{"Die Modernisierung dauert lange, weil die Handwerker überlastet sind.","Modernisierung der Küche ist teuer, aber notwendig."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8841	nachsehen	{"to check"}	{"Ich sehe im Kalender nach, ob der Termin noch frei ist.","Kannst du den Preis nachsehen, weil ich meine Brille vergessen habe?"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8842	neugierig	{curious}	{"Katzen sind neugierig, weil sie alles erkunden wollen.","Er ist neugierig auf die Antwort, obwohl sie unangenehm sein könnte."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8843	obwohl	{although}	{"Obwohl es regnet, gehen wir raus, weil wir frische Luft brauchen.","Sie lacht, obwohl sie traurig ist, um andere zu beruhigen."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8844	offenbar	{obvious}	{"Offenbar hat er vergessen, dass wir einen Termin hatten.","Das ist offenbar nicht möglich, weil die Technik fehlt."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8845	protestieren	{"to protest"}	{"Die Schüler protestieren laut, weil sie mehr Klimaschutz fordern.","Gegen was protestierst du, wenn du selbst nichts änderst?"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8846	richter/in	{judge}	{"Der Richter entscheidet heute, obwohl Beweise fehlen.","Die Richterin ist streng, weil sie Gerechtigkeit wichtig findet."}	3	3	5	\N	richter/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8847	rücksicht	{consideration}	{"Nimm Rücksicht auf andere, auch wenn du es eilig hast!","Rücksicht ist wichtig, weil wir alle zusammenleben."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8848	sammeln	{"to collect"}	{"Er sammelt alte Münzen, weil sie historisch interessant sind.","Wir sammeln Geld für die Schule, obwohl es schwer ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8849	sauer	{sour}	{"Die Zitrone schmeckt sauer, obwohl sie reif ist.","Sauer macht lustig! Auch wenn es nicht jeder mag."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8850	schaden	{damages}	{"Der Sturm verursachte Schaden, weil niemand vorbereitet war.","Schäden am Auto sind teuer, auch wenn sie klein sind."}	3	3	1	\N	schäden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8851	schmutzig	{dirty}	{"Die Hände sind schmutzig, weil er im Garten gearbeitet hat.","Schmutzige Wäsche waschen ist notwendig, auch wenn es lästig ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8852	selbstverständlich	{"of course"}	{"Selbstverständlich helfe ich dir! Auch wenn ich wenig Zeit habe.","Das ist selbstverständlich, weil wir Freunde sind."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8853	sinnlos	{meaningless}	{"Das ist total sinnlos, weil es nichts ändert.","Sinnlose Diskussionen vermeiden, um Zeit zu sparen."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8854	sinnvoll	{meaningful}	{"Das ist eine sinnvolle Idee, weil sie Ressourcen spart.","Sinnvolle Arbeit suchen, auch wenn es lange dauert."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8855	sortieren	{"to sort"}	{"Sortiere die Bücher nach Farbe, wenn du Zeit hast.","Müll sortieren ist wichtig, weil es die Umwelt schützt."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8856	stinken	{"to stink"}	{"Der Fisch stinkt, obwohl er frisch gekauft wurde.","Hier stinkt es! Weil jemand den Müll nicht rausgebracht hat."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8857	streiten	{"to argue"}	{"Sie streiten sich oft, weil sie unterschiedliche Meinungen haben.","Warum streitet ihr euch, wenn ihr euch lieben solltet?"}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8858	total	{totally}	{"Das ist total langweilig, weil nichts passiert.","Ich bin total müde, obwohl ich früh ins Bett gegangen bin."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8859	treu	{faithful}	{"Hunde sind treue Freunde, weil sie immer bei dir bleiben.","Er ist seiner Frau treu, obwohl sie oft streiten."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8860	überlegen	{"to think about"}	{"Ich muss mir das überlegen, bevor ich eine Entscheidung treffe.","Überleg es dir gut! Auch wenn es schwer ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8861	üblich	{normal}	{"Das ist hier üblich, weil es Tradition ist.","Ein übliches Problem, das viele kennen."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8862	unglaublich	{unbelievable}	{"Das ist unglaublich teuer! Obwohl die Qualität nicht passt.","Unglaublich, was passiert ist! Weil niemand es erwartet hatte."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8863	unrecht	{unjust}	{"Das ist einfach Unrecht! Auch wenn es legal ist.","Er hat Unrecht, weil er die Fakten ignoriert."}	3	3	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8864	urteil	{judgement}	{"Das Urteil war fair, obwohl es hart erscheint.","Ein wichtiges Urteil, das die Gesellschaft verändert."}	3	3	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8865	vergleichbar	{comparable}	{"Das ist nicht vergleichbar, weil die Umstände anders sind.","Vergleichbare Preise finden, wenn man online sucht."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8866	verpflichten	{"to compel"}	{"Ich fühle mich verpflichtet, weil ich es versprochen habe.","Das Gesetz verpflichtet uns, obwohl es unpraktisch ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8867	verständnis	{understanding}	{"Ich habe Verständnis für dich, auch wenn ich anderer Meinung bin.","Verständnis zeigen ist wichtig, weil es Konflikte löst."}	3	3	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8868	verstoß	{violation}	{"Das ist ein Verstoß gegen Regeln, der bestraft werden muss.","Verstöße werden bestraft, auch wenn sie klein sind."}	3	3	1	\N	verstöße	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8869	verstoßen	{"to violate"}	{"Er verstößt gegen das Gesetz, weil er keine Wahl hat.","Das verstößt nicht gegen Regeln, obwohl es unfair erscheint."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8870	völlig	{completely}	{"Das ist völlig normal, obwohl es am Anfang komisch aussah.","Ich bin völlig einverstanden, weil der Vorschlag sinnvoll ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8871	vorher	{before}	{"Was hast du vorher gemacht, bevor du hierher gekommen bist?","Vorher war alles einfacher, obwohl wir weniger Geld hatten."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8872	wegräumen	{"to clear away"}	{"Räum deine Sachen weg, bevor Gäste kommen!","Sie räumt den Tisch weg, weil das Essen fertig ist."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8873	widerspruch	{contradiction}	{"Das ist ein Widerspruch, weil du gestern etwas anderes gesagt hast.","Kein Widerspruch, bitte! Auch wenn du anderer Meinung bist."}	3	3	1	\N	widersprüche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8874	wütend	{angry}	{"Warum bist du so wütend, obwohl es nur ein Missverständnis war?","Er schlug die Tür wütend zu, weil niemand ihm zugehört hatte."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8875	zeitraum	{"time frame"}	{"Der Zeitraum ist zu kurz, um das Projekt abzuschließen.","Wähle einen Zeitraum aus, der für alle passt."}	3	3	1	\N	zeiträume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8876	ziemlich	{rather}	{"Das ist ziemlich gut, obwohl es noch verbessert werden kann.","Sie ist ziemlich müde, weil sie die ganze Nacht gearbeitet hat."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8877	zimmerlautstärke	{"room volume"}	{"Bitte Zimmerlautstärke, weil die Nachbarn sonst protestieren!","Musik auf Zimmerlautstärke hören, obwohl man lieber tanzen möchte."}	3	3	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8878	zugeben	{"to admit"}	{"Er gibt seinen Fehler zu, obwohl es ihm schwerfällt.","Ich muss zugeben, ich lag falsch, weil ich nicht genug nachgedacht hatte."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8879	zurücklassen	{"to leave behind"}	{"Lass nichts zurück, weil wir später nicht zurückkommen können!","Sie ließ ihre Tasche zurück, obwohl sie es eigentlich nicht wollte."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8880	zusammenleben	{"life together"}	{"Das Zusammenleben ist friedlich, weil wir Rücksicht nehmen.","Zusammenleben erfordert Respekt, auch wenn man unterschiedliche Meinungen hat."}	3	3	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8882	zutritt	{access}	{"Zutritt verboten, weil die Baustelle gefährlich ist!","Hier ist kein Zutritt, obwohl das Schild fehlt."}	3	3	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8883	abgas	{"exhaust gas"}	{"Moderne Autos produzieren weniger Abgase, obwohl sie immer noch die Umwelt belasten.","Weil Abgase schädlich sind, müssen Fabriken Filter verwenden."}	3	4	3	\N	abgase	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8884	abwasser	{sewage}	{"Bevor Abwasser in Flüsse fließt, muss es gereinigt werden.","Der Fluss ist verschmutzt, weil Abwasser falsch entsorgt wurde."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8885	altöl	{"waste oil"}	{"Altöl darf man nicht wegschütten, weil es das Grundwasser vergiftet.","Obwohl Altöl recycelbar ist, landet es oft im Hausmüll."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8886	altpapier	{"waste paper"}	{"Wenn Altpapier recycelt wird, spart das Bäume.","Die blaue Tonne ist nur für Altpapier, das sauber sein muss."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8887	aluminium	{aluminium}	{"Aluminium ist leicht, obwohl es sehr stabil ist.","Dosen aus Aluminium können recycelt werden, sodass Ressourcen gespart werden."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8888	andauernd	{lasting}	{"Weil der Regen andauernd ist, gibt es Hochwasser.","Andauernder Lärm ist stressig, deshalb brauchen wir Ruhezeiten."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8889	ankündigen	{"to announce"}	{"Der Bürgermeister kündigt an, dass neue Radwege gebaut werden.","Bevor das Projekt startet, wird die Regierung es offiziell ankündigen."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8890	anstatt	{instead}	{"Anstatt Plastik zu nutzen, verwenden wir Stoffbeutel.","Sie geht zu Fuß, anstatt mit dem Auto zu fahren."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8891	begleitperson	{"accompanying person"}	{"Kinder brauchen eine Begleitperson, wenn sie allein reisen.","Weil sie unsicher war, nahm sie eine Begleitperson zur Veranstaltung mit."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8892	belasten	{"to pollute"}	{"Fabriken belasten die Luft, indem sie Schadstoffe ausstoßen.","Wenn Plastik im Meer landet, belastet es die Ökosysteme."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8893	belastung	{pollution}	{"Die Belastung durch Plastik ist hoch, weil viele es wegwerfen.","Obwohl die Belastung bekannt ist, ändern viele ihr Verhalten nicht."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8894	beobachten	{"to observe"}	{"Wir beobachten Vögel, die im Wald leben.","Weil er den Sternenhimmel liebt, beobachtet er ihn jede Nacht."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8895	beutel	{bag}	{"Anstatt Plastikbeutel zu kaufen, nehmen wir Stoffbeutel.","Der Beutel, den ich benutze, ist aus recyceltem Material."}	3	4	1	\N	beutel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8896	biologisch	{biological}	{"Biologisches Gemüse ist teurer, weil es ohne Chemikalien wächst.","Obwohl es teurer ist, kaufen viele biologisch angebaute Produkte."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8897	chemikalie	{chemicals}	{"Chemikalien, die in Reinigern sind, können gefährlich sein.","Weil Chemikalien die Umwelt schädigen, suchen wir Alternativen."}	3	4	2	\N	chemikalien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8898	deckel	{lid}	{"Der Deckel passt nicht, obwohl er die gleiche Größe hat.","Wenn du den Deckel verlierst, verdirbt das Essen schneller."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8899	doof	{stupid}	{"Das ist eine doofe Idee, weil sie viel Müll produziert.","Obwohl er Mathe doof findet, muss er es lernen."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8900	eierkarton	{"egg box"}	{"Eierkartons aus Pappe können recycelt werden, wenn sie sauber sind.","Weil Eierkartons leicht sind, werden sie oft wiederverwendet."}	3	4	1	\N	eierkartons	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8901	eierschale	{"egg shell"}	{"Eierschalen, die im Kompost landen, sind gut für den Boden.","Weil Eierschalen zerbrechlich sind, muss man vorsichtig sein."}	3	4	2	\N	eierschalen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8902	einfallen	{"to occur"}	{"Mir fällt kein Name ein, obwohl ich ihn gerade gehört habe.","Weil ihm nichts einfällt, fragt er um Hilfe."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8903	elektroauto	{"electric car"}	{"Elektroautos sind leise, obwohl sie manchmal teuer sind.","Weil Elektroautos umweltfreundlich sind, fördert die Regierung sie."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8904	energiesparhaus	{"energy efficient house"}	{"Ein Energiesparhaus spart Geld, weil es weniger Strom verbraucht.","Obwohl es teurer ist, lohnt sich ein Energiesparhaus langfristig."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8905	energiesparlampe	{"energy efficient bulb"}	{"Energiesparlampen halten länger, obwohl sie teurer sind.","Weil sie weniger Strom brauchen, sind sie umweltfreundlicher."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8906	erdbeben	{earthquake}	{"Nachdem das Erdbeben stattfand, halfen viele Freiwillige.","Weil Erdbeben gefährlich sind, baut man erdbebensichere Häuser."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8907	erde	{earth}	{"Pflanzen brauchen Erde, die nährstoffreich ist.","Weil die Erde trocken ist, müssen wir mehr gießen."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8908	erderwärmung	{"global warming"}	{"Erderwärmung betrifft uns alle, weil sie das Klima verändert.","Obwohl die Erderwärmung bekannt ist, handeln viele Länder nicht."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8909	erlaubnis	{permission}	{"Er braucht Erlaubnis, bevor er das Grundstück betritt.","Weil er keine Erlaubnis hatte, durfte er nicht parken."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8910	förster/in	{woodsman}	{"Der Förster schützt den Wald, indem er Wilderer überwacht.","Weil Försterinnen die Natur lieben, arbeiten sie in diesem Beruf."}	3	4	5	\N	förster/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8911	gegenstand	{object}	{"Gegenstände aus Metall können recycelt werden, wenn sie sauber sind.","Weil der Gegenstand kaputt ist, werfen wir ihn weg."}	3	4	1	\N	gegenstände	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8912	gegenvorschlag	{counterproposal}	{"Sie macht einen Gegenvorschlag, weil der erste Plan zu teuer ist.","Obwohl der Gegenvorschlag gut war, wurde er abgelehnt."}	3	4	1	\N	gegenvorschläge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8913	giftig	{toxic}	{"Diese Pilze sind giftig, obwohl sie lecker aussehen.","Weil die Chemikalien giftig sind, muss man Handschuhe tragen."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8914	haushalt	{household}	{"Im Haushalt sparen wir Energie, indem wir LED-Lampen nutzen.","Weil unser Haushalt groß ist, produzieren wir viel Müll."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8915	hochwasser	{high-tide}	{"Nachdem das Hochwasser kam, mussten die Straßen gesperrt werden.","Weil Hochwasser gefährlich ist, baut man Dämme."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8916	hörer/in	{listener}	{"Die Hörer, die anriefen, stellten viele Fragen.","Weil die Hörerin Feedback gab, verbesserte sich der Podcast."}	3	4	5	\N	hörer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8917	kaffeefilter	{"coffee filter"}	{"Der Kaffeefilter, den wir benutzen, ist aus Papier.","Weil der Kaffeefilter voll war, lief das Wasser über."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8918	klima	{climate}	{"Das Klima verändert sich, obwohl viele es nicht wahrhaben.","Weil das Klima wärmer wird, schmelzen die Gletscher."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8919	klimawandel	{"climate change"}	{"Klimawandel betrifft uns alle, deshalb müssen wir handeln.","Obwohl der Klimawandel real ist, ignorieren ihn manche Politiker."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8920	konservendose	{"preserving jars"}	{"Konservendosen aus Metall können recycelt werden, wenn sie leer sind.","Weil die Konservendose rostig war, warf er sie weg."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8921	kunststoff	{"synthetic material"}	{"Kunststoff, der im Meer landet, schadet den Tieren.","Weil Kunststoff langlebig ist, bleibt er Jahrhunderte in der Natur."}	3	4	1	\N	kunststoffe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8922	luft	{air}	{"Frische Luft ist wichtig, obwohl viele Städte verschmutzt sind.","Weil die Luft sauberer wurde, gibt es wieder mehr Vögel."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8923	matratze	{mattress}	{"Die Matratze, die wir kauften, ist aus recycelten Materialien.","Weil die Matratze zu hart war, konnte er nicht schlafen."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8924	metall	{metal}	{"Metall, das recycelt wird, spart Energie und Ressourcen.","Weil Metall schwer ist, braucht man Maschinen zum Transport."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8925	milchkarton	{"milk carton"}	{"Milchkartons aus Pappe gehören in die Altpapiertonne.","Weil der Milchkarton leer war, warf sie ihn weg."}	3	4	1	\N	milchkartons	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8926	mülltonne	{"rubbish bin"}	{"Die Mülltonne ist voll, weil wir letzte Woche nicht entleert wurden.","Obwohl die Mülltonne voll ist, wirft er den Abfall hinein."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8927	mülltrennung	{"waste separation"}	{"Mülltrennung ist wichtig, damit mehr recycelt werden kann.","Weil Mülltrennung kompliziert ist, machen viele Fehler."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8928	naturkatastrophe	{"natural disaster"}	{"Naturkatastrophen wie Tsunamis werden durch den Klimawandel stärker.","Weil Naturkatastrophen unvorhersehbar sind, braucht man Notfallpläne."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8929	naturprodukt	{"natural product"}	{"Naturprodukte, die ohne Chemie hergestellt werden, sind gesünder.","Weil Naturprodukte teurer sind, kaufen sie nicht alle."}	3	4	3	\N	naturprodukte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8930	obstschale	{"fruit skin"}	{"Obstschalen aus Holz sind umweltfreundlicher als Plastikschalen.","Weil die Obstschale kaputt war, kaufte sie eine neue."}	3	4	2	\N	obstschalen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8931	papiermüll	{"paper waste"}	{"Papiermüll, der in der blauen Tonne landet, wird recycelt.","Weil wir viel Papiermüll produzieren, brauchen wir eine größere Tonne."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8932	pappe	{cardboard}	{"Pappe, die nass wird, kann nicht mehr recycelt werden.","Weil Pappe leicht ist, nutzt man sie für Verpackungen."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8933	picknick	{picnic}	{"Beim Picknick im Park nutzen wir Mehrweg-Geschirr, um Müll zu sparen.","Weil das Picknick im Regen stattfand, mussten wir früh aufhören."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8934	planet	{planet}	{"Die Erde ist der einzige Planet, auf dem wir leben können.","Weil andere Planeten unwirtlich sind, müssen wir die Erde schützen."}	3	4	1	\N	planeten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8935	plastik	{plastic}	{"Plastik, das im Meer schwimmt, wird von Tieren gefressen.","Weil Plastik nicht verrottet, bleibt es Jahrhunderte in der Umwelt."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8936	recyceln	{"to recycle"}	{"Wir recyceln Glas, weil es unendlich oft wiederverwendet werden kann.","Obwohl viele recyceln, landet noch zu viel im Restmüll."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8937	sack	{bag}	{"Säcke aus Jute sind umweltfreundlicher als Plastiksäcke.","Weil der Sack voll war, konnte er ihn kaum tragen."}	3	4	1	\N	säcke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8939	schädigen	{"to damage"}	{"Rauch schädigt die Lunge, weil er giftige Partikel enthält.","Weil Müll die Natur schädigt, müssen wir ihn richtig entsorgen."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8940	schädlich	{harmful}	{"Zigaretten sind schädlich, obwohl viele Menschen rauchen.","Weil Chemikalien schädlich sind, tragen wir Schutzhandschuhe."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8941	schadstoff	{"hazardous substance"}	{"Schadstoffe in der Luft verursachen Atemprobleme, besonders bei Kindern.","Weil Schadstoffe gefährlich sind, müssen sie kontrolliert werden."}	3	4	1	\N	schadstoffe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8942	schützen	{"to protect"}	{"Wir schützen die Umwelt, indem wir weniger Plastik verwenden.","Weil Bäume das Klima schützen, pflanzen wir mehr davon."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8943	solarenergie	{"solar energy"}	{"Solarenergie ist sauber, weil sie keine Abgase produziert.","Obwohl Solarenergie teuer ist, lohnt sie sich langfristig."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8944	sondermüll	{"hazardous waste"}	{"Sondermüll muss getrennt werden, weil er gefährliche Stoffe enthält.","Weil Sondermüll giftig ist, darf er nicht in den Hausmüll."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8945	sonnenschein	{sunshine}	{"Sonnenschein ist wichtig, weil er Solaranlagen antreibt.","Obwohl es viel Sonnenschein gab, war der Tag kühl."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8946	sorge	{worry}	{"Ich mache mir Sorgen, weil die Umweltverschmutzung zunimmt.","Obwohl sie sich Sorgen macht, unternimmt sie nichts."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8947	sparsam	{economical}	{"Sei sparsam mit Wasser, weil es eine wertvolle Ressource ist.","Weil sie sparsam lebt, hat sie niedrige Stromkosten."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8948	sperrmüll	{"bulky waste"}	{"Sperrmüll wird abgeholt, wenn man ihn vorher anmeldet.","Weil Sperrmüll viel Platz braucht, lagern wir ihn im Keller."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8949	stattfinden	{"to take place"}	{"Das Festival findet statt, obwohl das Wetter schlecht ist.","Weil das Treffen regelmäßig stattfindet, kennen sich alle gut."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8950	tierschutz	{"animal protection"}	{"Tierschutz ist wichtig, weil Tiere Respekt verdienen.","Obwohl Tierschutz Gesetze hat, werden sie oft ignoriert."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8951	trinkwasser	{"drinking water"}	{"Trinkwasser ist knapp, weil die Bevölkerung wächst.","Weil Trinkwasser kostbar ist, sollten wir es nicht verschwenden."}	3	4	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8952	trüb	{gloomy}	{"Das Wasser ist trüb, weil Sedimente darin schwimmen.","Obwohl der Himmel trüb war, regnete es nicht."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8953	tsunami	{tsunami}	{"Ein Tsunami zerstörte die Stadt, weil sie nahe am Meer lag.","Weil Tsunamis gefährlich sind, gibt es Frühwarnsysteme."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8954	turm	{tower}	{"Der Turm, den wir besteigen, bietet eine Aussicht über die Stadt.","Weil der Turm hoch ist, hat man einen weiten Blick."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8955	umdrehen	{"to turn around"}	{"Dreh dich um, weil jemand hinter dir steht!","Weil er den Schlüssel umdreht, öffnet sich die Tür."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8956	umgehen	{"to go round"}	{"Wir umgehen das Hindernis, indem wir einen anderen Weg nehmen.","Weil die Straße gesperrt ist, müssen wir umgehen."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8957	umweltfreundlich	{"environmentally friendly"}	{"Umweltfreundliche Produkte sind teurer, aber besser für die Erde.","Weil wir umweltfreundlich leben, reduzieren wir unseren Müll."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8958	umweltschutz	{"environmental protection"}	{"Umweltschutz ist wichtig, weil er die Natur bewahrt.","Obwohl Umweltschutz teuer ist, investieren viele Länder darin."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8959	umweltverschmutzung	{"environmental pollution"}	{"Umweltverschmutzung nimmt zu, weil die Industrie wächst.","Weil Umweltverschmutzung gefährlich ist, müssen wir handeln."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8960	unwetter	{thunderstorm}	{"Nachdem das Unwetter vorbei war, sah man die Schäden.","Weil Unwetter gefährlich sind, bleiben viele zu Hause."}	3	4	3	\N	unwetter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8961	verändern	{"to change"}	{"Die Welt verändert sich, weil der Klimawandel voranschreitet.","Weil er seine Gewohnheiten verändert, lebt er gesünder."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8962	verlaufen	{"to continue"}	{"Die Diskussion verläuft gut, weil alle kooperativ sind.","Weil das Projekt positiv verläuft, sind wir optimistisch."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8963	verschmutzen	{"to contaminate"}	{"Müll verschmutzt den Fluss, weil Leute ihn hineinwerfen.","Weil Fabriken die Luft verschmutzen, gibt es Gesundheitsprobleme."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8965	verschwendung	{waste}	{"Verschwendung von Essen ist ein Problem, weil viele hungern.","Weil Verschwendung Ressourcen kostet, müssen wir sparsam sein."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8966	versprechen	{"to promise"}	{"Ich verspreche dir, dass ich umweltfreundlicher leben werde.","Weil er es versprochen hat, trennt er jetzt den Müll."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8967	verwerten	{"to exploit"}	{"Wir verwerten Altglas, indem wir es zur Sammelstelle bringen.","Weil wir Abfälle verwerten, produzieren wir weniger Müll."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8968	voraussichtlich	{provisionally}	{"Voraussichtlich regnet es morgen, deshalb verschieben wir das Picknick.","Weil der Termin voraussichtlich später ist, können wir länger schlafen."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8969	vorhersagen	{"to predict"}	{"Experten vorhersagen einen heißen Sommer, weil der Klimawandel zunimmt.","Weil der Wetterbericht Regen vorhersagt, nehmen wir Regenschirme mit."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8970	wahrscheinlich	{probably}	{"Es wird wahrscheinlich regnen, obwohl die Sonne jetzt scheint.","Weil er krank ist, kommt er wahrscheinlich nicht zur Arbeit."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8971	wegschmeißen	{"to chuck out"}	{"Schmeiß den Müll nicht weg, weil er recycelt werden kann.","Weil sie alte Sachen wegschmeißt, hat sie mehr Platz."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8972	wegwerfen	{"to throw away"}	{"Wirf das Papier nicht weg, weil es noch verwendet werden kann.","Weil er Dinge schnell wegwirft, kauft er ständig neu."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8973	wertstoff	{"recyclable material"}	{"Wertstoffe wie Glas und Metall trennen wir sorgfältig.","Weil Wertstoffe wertvoll sind, werden sie recycelt."}	3	4	1	\N	wertstoffe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8974	wind	{wind}	{"Starker Wind weht, obwohl die Wettervorhersage Sonne versprach.","Weil der Wind die Turbinen antreibt, erzeugen wir saubere Energie."}	3	4	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8975	windel	{nappy}	{"Windeln aus Stoff sind umweltfreundlicher als Einwegwindeln.","Weil die Windel voll war, weinte das Baby."}	3	4	2	\N	windeln	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8976	wirbelsturm	{hurricane}	{"Ein Wirbelsturm zerstörte die Häuser, weil sie nicht stabil genug waren.","Weil Wirbelstürme gefährlich sind, evakuieren die Behörden die Küste."}	3	4	1	\N	wirbelstürme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8977	wolke	{cloud}	{"Dunkle Wolken, die am Himmel hängen, kündigen Regen an.","Weil die Wolken dick sind, scheint keine Sonne."}	3	4	2	\N	wolken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8978	zerstören	{"to destroy"}	{"Der Sturm zerstörte den Wald, weil die Bäume nicht standhielten.","Weil Feuer ganze Ökosysteme zerstören, sind sie gefährlich."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8979	zerstörung	{destruction}	{"Die Zerstörung der Natur schreitet voran, obwohl es Lösungen gibt.","Weil die Zerstörung groß war, dauert der Wiederaufbau Jahre."}	3	4	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8980	zigarettenkippe	{"cigarette butts"}	{"Zigarettenkippen verschmutzen die Straßen, weil Raucher sie wegwerfen.","Weil Zigarettenkippen giftig sind, schaden sie der Umwelt."}	3	4	2	\N	zigarettenkippen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8981	zurückfahren	{"to go back"}	{"Wir fahren langsam zurück, weil die Straße vereist ist.","Weil er das Auto zurückfährt, passt es in die Parklücke."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8982	agb	{"General T&C","General terms and conditions"}	{"Bevor Sie bestellen, sollten Sie die AGB lesen, um Ihre Rechte zu kennen.","Die AGB enthalten wichtige Informationen, die Sie verstehen müssen."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8983	anfassen	{"to touch"}	{"Bitte fassen Sie die Ausstellung nicht an, da sie sehr empfindlich ist.","Kinder sollten scharfe Gegenstände nicht anfassen, um Verletzungen zu vermeiden."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8984	anprobe	{"fitting room"}	{"Die Anprobe befindet sich im ersten Stock, wo Sie die Kleidung in Ruhe anprobieren können.","Falls die Anprobe besetzt ist, können Sie kurz warten."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8985	anprobieren	{"to try on"}	{"Sie können die Schuhe anprobieren, bevor Sie sie kaufen.","Ich probiere das Kleid an, obwohl ich es eher zu klein finde."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8986	art	{type}	{"Diese Art von Stoff ist besonders haltbar, weil er wasserabweisend ist.","Es gibt verschiedene Arten der Bezahlung, die Sie wählen können."}	3	5	2	\N	arten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8988	atmung	{breathing}	{"Die Atmung wird schwierig, wenn man in einer stickigen Umgebung ist.","Yoga hilft, die Atmung zu kontrollieren und zu entspannen."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8989	atmungsaktiv	{breathable}	{"Diese Jacke ist atmungsaktiv, sodass man sie auch beim Sport tragen kann.","Atmungsaktive Materialien sind angenehm, weil sie Schweiß ableiten."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8990	aufmerksam	{attentive}	{"Der Verkäufer war sehr aufmerksam, obwohl das Geschäft voller Kunden war.","Seien Sie aufmerksam, wenn Sie die Anweisungen lesen."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8991	auftrag	{order}	{"Der Auftrag wird bearbeitet, sobald die Zahlung bestätigt ist.","Wenn Sie einen Auftrag stornieren möchten, kontaktieren Sie uns bitte."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8992	auftragsnummer	{"order number"}	{"Ihre Auftragsnummer finden Sie in der Bestätigungsmail, die wir geschickt haben.","Ohne die Auftragsnummer können wir Ihre Lieferung nicht verfolgen."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8993	ausliefern	{"to deliver"}	{"Wir liefern die Ware aus, sobald sie im Lager verfügbar ist.","Das Paket wird morgen ausgeliefert, falls keine Verzögerungen auftreten."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8994	auswahl	{selection}	{"Unsere Auswahl an Produkten ist groß, sodass Sie viele Optionen haben.","Je nach Auswahl können sich die Lieferkosten ändern."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8995	bankeinzug	{"direct debit"}	{"Der Betrag wird per Bankeinzug abgebucht, sobald die Lieferung erfolgt ist.","Wenn Sie Bankeinzug wählen, müssen Sie Ihre Kontodaten angeben."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8996	bereits	{already}	{"Die Bestellung wurde bereits versendet, obwohl sie erst gestern aufgegeben wurde.","Bereits nach einer Stunde erhielt ich die Bestätigung."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8997	beschädigt	{damaged}	{"Falls die Ware beschädigt ankommt, können Sie sie kostenlos zurückschicken.","Das Paket war beschädigt, weil es unsachgemäß verpackt wurde."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8998	bestellhotline	{"order hotline"}	{"Rufen Sie die Bestellhotline an, falls Sie Fragen zu Ihrem Kauf haben.","Die Bestellhotline ist rund um die Uhr erreichbar, um Kunden zu helfen."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8999	betrag	{sum}	{"Der Betrag wird Ihrem Konto belastet, sobald die Lieferung beginnt.","Bitte überprüfen Sie den Betrag, bevor Sie die Zahlung bestätigen."}	3	5	1	\N	beträge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9000	bezahlvorgang	{"payment process"}	{"Während des Bezahlvorgangs müssen Sie Ihre Kreditkartendaten eingeben.","Der Bezahlvorgang wurde unterbrochen, weil die Verbindung fehlschlug."}	3	5	1	\N	bezahlvorgänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9001	callcenter	{"call centre"}	{"Das Callcenter hilft Ihnen weiter, falls Probleme mit der Lieferung auftreten.","Obwohl das Callcenter busy war, wurde mein Anruf schnell beantwortet."}	3	5	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9056	versenden	{"to send"}	{"Wir versenden weltweit, sodass Kunden aus allen Ländern bestellen können.","Die Ware wird versendet, sobald die Zahlung eingegangen ist."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9002	datenschutz	{"data protection"}	{"Der Datenschutz ist wichtig, damit Ihre persönlichen Informationen sicher bleiben.","Wir halten uns streng an den Datenschutz, um Vertrauen aufzubauen."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9003	dicht	{thick}	{"Der Mantel ist sehr dicht, sodass er auch bei Kälte warm hält.","Da der Stoff zu dicht ist, fühlt er sich schwer an."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9004	durchlässig	{permeable}	{"Diese Jacke ist wasserdicht, aber trotzdem durchlässig für Luft.","Durchlässige Materialien sind angenehm, weil sie Feuchtigkeit abgeben."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9005	ebenso	{"as well"}	{"Sie können per Kreditkarte zahlen, ebenso wie mit PayPal.","Ebenso wie die Qualität ist auch der Preis wichtig."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9006	eher	{rather}	{"Ich würde eher Online-Shopping nutzen, weil es bequemer ist.","Dieses Modell ist eher für den Sommer geeignet, da es leicht ist."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9007	eigentum	{property}	{"Das Eigentum geht auf Sie über, sobald die Zahlung erfolgt ist.","Beschädigtes Eigentum muss dem Kundendienst gemeldet werden."}	3	5	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9008	ergänzung	{addition}	{"Als Ergänzung zu Ihrer Bestellung empfehlen wir dieses Zubehör.","Die Ergänzung der AGB wurde notwendig, um neue Regelungen aufzunehmen."}	3	5	2	\N	ergänzungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9009	erhältlich	{available}	{"Dieses Modell ist nur online erhältlich, obwohl es sehr beliebt ist.","Die Größe M ist leider nicht mehr erhältlich, aber Größe L ist vorrätig."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9010	eventuell	{possible}	{"Eventuell kommt die Lieferung später, falls es Lieferverzögerungen gibt.","Wir bieten eventuell Rabatte an, wenn Sie Großbestellungen aufgeben."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9011	falls	{"in case"}	{"Falls Sie unzufrieden sind, können Sie die Ware innerhalb von 14 Tagen zurückschicken.","Kontaktieren Sie uns, falls Fragen zur Rechnung auftreten."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9012	gutschein	{voucher}	{"Sie können den Gutschein einlösen, sobald Sie eine Bestellung aufgeben.","Falls der Gutschein abgelaufen ist, können wir ihn nicht akzeptieren."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9013	herstellen	{"to manufacture"}	{"Wir stellen diese Produkte lokal her, um die Umwelt zu schonen.","Die Firma stellt hochwertige Möbel her, die lange halten."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9014	herstellung	{manufacture}	{"Die Herstellung dauert etwa zwei Wochen, da wir auf Qualität achten.","Während der Herstellung werden alle Materialien geprüft."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9015	impressum	{imprint}	{"Das Impressum finden Sie unten auf der Website, wo alle Kontaktdaten stehen.","Laut Impressum ist die Firma in Berlin registriert."}	3	5	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9016	innerhalb	{within}	{"Innerhalb von 24 Stunden erhalten Sie eine Bestätigungsmail.","Die Rücksendung muss innerhalb von 14 Tagen erfolgen."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9017	irgendwie	{somehow}	{"Irgendwie hat die Bestellung nicht funktioniert, obwohl ich alles richtig gemacht habe.","Wir werden das Problem irgendwie lösen, versprochen!"}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9018	kauf	{purchase}	{"Nach dem Kauf erhalten Sie eine Rechnung per E-Mail.","Der Kauf wurde storniert, weil die Ware nicht verfügbar war."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9019	kaufbestätigung	{"purchase confirmation"}	{"Die Kaufbestätigung wurde versendet, sobald die Zahlung bearbeitet wurde.","Ohne Kaufbestätigung können wir den Umtausch nicht durchführen."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9020	käufer/in	{customer}	{"Käufer/innen haben das Recht, die Ware innerhalb von 14 Tagen zurückzugeben.","Als Käufer/in können Sie zwischen verschiedenen Zahlungsmethoden wählen."}	3	5	5	\N	käufer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9021	kaufvertrag	{"sales contract"}	{"Der Kaufvertrag muss von beiden Parteien unterschrieben werden, bevor er gültig wird.","Im Kaufvertrag sind alle Lieferbedingungen genau festgelegt."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9022	kosmetik	{cosmetics}	{"Diese Kosmetik ist vegan, sodass sie auch für sensible Haut geeignet ist.","Kosmetik darf nicht zurückgegeben werden, falls die Verpackung geöffnet wurde."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9023	kundenbefragung	{"customer survey"}	{"Durch die Kundenbefragung wollen wir unseren Service verbessern, um zufriedenere Kunden zu haben.","Teilnehmer der Kundenbefragung erhalten einen Gutschein."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9024	kundenfreundlich	{"customer friendly"}	{"Unser Service ist sehr kundenfreundlich, weil wir flexible Rückgaberegeln haben.","Eine kundenfreundliche Website ist einfach zu bedienen."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9026	lieferbar	{"in stock"}	{"Dieses Produkt ist momentan lieferbar, obwohl es sehr gefragt ist.","Nur lieferbare Artikel werden im Onlineshop angezeigt."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9027	lieferbedingung	{"delivery conditions"}	{"Die Lieferbedingungen stehen im Kaufvertrag, den Sie unterschrieben haben.","Bitte lesen Sie die Lieferbedingungen, bevor Sie bestellen."}	3	5	2	\N	lieferbedingungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9028	lieferung	{delivery}	{"Die Lieferung erfolgt innerhalb von 3 Werktagen, sobald die Zahlung bestätigt ist.","Falls die Lieferung verzögert ist, erhalten Sie eine E-Mail."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9029	luftdurchlässig	{breathable}	{"luftdurchlässige Kleidung ist ideal für den Sommer, weil sie nicht schwitzen lässt.","Das Material ist luftdurchlässig, obwohl es wasserabweisend ist."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9030	mehrkosten	{"extra costs"}	{"Für Expresslieferung entstehen Mehrkosten, die im Voraus bezahlt werden müssen.","Eventuelle Mehrkosten werden in der Rechnung aufgeführt."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9031	nachnahme	{"cash on delivery"}	{"Bei Nachnahme zahlen Sie das Paket beim Boten, wenn es geliefert wird.","Nachnahme ist möglich, verursacht aber zusätzliche Gebühren."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9032	nachteil	{disadvantage}	{"Ein Nachteil der Nachnahme ist, dass Sie zu Hause sein müssen.","Trotz einiger Nachteile ist das Produkt sehr beliebt."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9033	onlineeinkauf	{"online shopping"}	{"Beim Onlineeinkauf spart man Zeit, weil man nicht ins Geschäft gehen muss.","Der Onlineeinkauf ist einfach, aber man sollte die Bewertungen lesen."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9035	onlineshopping	{"online shopping"}	{"Onlineshopping ist praktisch, obwohl man die Ware nicht anfassen kann.","Viele bevorzugen Onlineshopping, weil es bequemer ist."}	3	5	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9036	paket	{parcel}	{"Das Paket wird morgen geliefert, falls es keine Verzögerungen gibt.","Bitte überprüfen Sie das Paket auf Schäden, bevor Sie es annehmen."}	3	5	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9037	paketbote	{"parcel carrier"}	{"Der Paketbote klingelt zweimal, falls Sie nicht sofort öffnen.","Unser Paketbote ist immer freundlich, obwohl er unter Zeitdruck steht."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9038	paketdienst	{"parcel service"}	{"Der Paketdienst liefert täglich, sodass Sie schnell Ihre Ware erhalten.","Falls der Paketdienst das Paket nicht zustellt, erhalten Sie eine Benachrichtigung."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9039	porto	{postage}	{"Das Porto hängt vom Gewicht ab, weshalb schwere Pakete teurer sind.","Bei Retouren müssen Sie das Porto selbst tragen, falls kein Fehler vorliegt."}	3	5	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9040	portofrei	{"postage paid"}	{"Bestellungen über 50 € sind portofrei, um Ihnen Kosten zu sparen.","Portofreie Lieferung gilt nur innerhalb Deutschlands."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9041	portokosten	{postage}	{"Die Portokosten werden berechnet, sobald Sie die Lieferadresse eingeben.","Bei Retouren übernehmen wir die Portokosten, falls ein Fehler unsererseits vorlag."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9025	lager	{warehouse}	{"Das Lager ist klimatisiert.","Im Lager werden Waren sortiert und verpackt."}	3	5	3	\N	Lager	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9034	onlineshop	{"online shop"}	{"Unser Onlineshop ist rund um die Uhr geöffnet.","Der Onlineshop wurde neu gestaltet."}	3	5	1	\N	Onlineshops	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9044	reklamation	{complaint}	{"Bei einer Reklamation müssen Sie das Formular ausfüllen, das wir Ihnen schicken.","Reklamationen werden innerhalb von 5 Werktagen bearbeitet."}	3	5	2	\N	reklamationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9045	retoure	{"return order"}	{"Die Retoure muss innerhalb von 14 Tagen erfolgen, damit wir sie bearbeiten können.","Für die Retoure benötigen Sie den beigefügten Retourenschein."}	3	5	2	\N	retouren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9046	retourenschein	{"return order slip"}	{"Der Retourenschein liegt der Lieferung bei, damit Sie ihn einfach nutzen können.","Ohne Retourenschein können wir die Rücksendung nicht bearbeiten."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9047	rücksendung	{"return delivery"}	{"Die Rücksendung ist kostenlos, falls das Produkt defekt ist.","Bitte verpacken Sie die Rücksendung sorgfältig, um Beschädigungen zu vermeiden."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9048	shopping	{shopping}	{"Online-Shopping spart Zeit, weil man nicht in die Stadt fahren muss.","Obwohl Shopping Spaß macht, sollte man ein Budget einhalten."}	3	5	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9049	unverbindlich	{non-binding}	{"Sie können ein unverbindliches Angebot anfordern, um Preise zu vergleichen.","Die Beratung ist unverbindlich, sodass Sie keine Verpflichtung haben."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9050	verbraucher/in	{consumer}	{"Verbraucher/innen haben Rechte, die gesetzlich geschützt sind.","Als Verbraucher/in können Sie bei Mängeln die Ware reklamieren."}	3	5	5	\N	verbraucher/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9051	verpacken	{"to package"}	{"Wir verpacken die Ware sicher, damit sie nicht beschädigt ankommt.","Bitte verpacken Sie die Rücksendung in der Originalverpackung."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9053	versandkosten	{"shipping fee"}	{"Die Versandkosten hängen vom Gewicht und der Lieferadresse ab.","Bei Bestellungen über 100 € fallen keine Versandkosten an."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9054	versandkostenfrei	{"free of shipping costs"}	{"Ab einem Einkaufswert von 50 € ist die Lieferung versandkostenfrei.","Versandkostenfrei bestellen können Sie nur innerhalb Deutschlands."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9055	versandkostenpauschale	{"flat shipping rate"}	{"Es gibt eine Versandkostenpauschale von 5 €, unabhängig von der Bestellmenge.","Die Versandkostenpauschale gilt nicht für internationale Lieferungen."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9058	warenkorb	{basket}	{"Im Warenkorb sehen Sie alle Artikel, die Sie ausgewählt haben.","Sie können den Warenkorb jederzeit bearbeiten, bevor Sie bezahlen."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9059	wasserdicht	{waterproof}	{"Diese Uhr ist wasserdicht, sodass Sie sie beim Schwimmen tragen können.","Obwohl die Jacke wasserdicht ist, ist sie atmungsaktiv."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9061	wetterfest	{waterproof}	{"Das Material ist wetterfest, sodass es auch bei Regen genutzt werden kann.","Wetterfeste Schuhe sind ideal für Outdoor-Aktivitäten."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9062	widerrufen	{disclaimer}	{"Sie können den Kauf widerrufen, falls Sie innerhalb von 14 Tagen eine Retoure einleiten.","Das Widerrufsrecht erlaubt es Ihnen, den Vertrag zu widerrufen."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9063	widerrufsrecht	{"right of revocation"}	{"Das Widerrufsrecht gilt 14 Tage ab Erhalt der Ware, falls Sie online bestellt haben.","Im Impressum finden Sie Details zum Widerrufsrecht."}	3	5	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9064	zahlung	{payment}	{"Die Zahlung muss innerhalb von 7 Tagen erfolgen, sonst wird die Bestellung storniert.","Bei erfolgreicher Zahlung erhalten Sie eine Bestätigungsmail."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9065	zurückschicken	{"to send back"}	{"Sie können die Ware zurückschicken, falls sie nicht Ihren Erwartungen entspricht.","Bitte schicken Sie das Paket zurück, sobald Sie den Retourenschein erhalten."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9066	zurücksenden	{"to send back"}	{"Sie müssen das Produkt zurücksenden, um eine Rückerstattung zu erhalten.","Bevor Sie die Ware zurücksenden, kontaktieren Sie bitte den Kundendienst."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9067	zurücktreten	{"to withdraw"}	{"Sie können vom Kaufvertrag zurücktreten, falls die Ware defekt ist.","Der Käufer kann innerhalb von 14 Tagen ohne Angabe von Gründen zurücktreten."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9043	qualität	{quality}	{"Hohe Qualität sichert langfristige Kundenbindung.","Die Qualität unserer Produkte ist unübertroffen."}	3	5	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9060	werktag	{"working day"}	{"Die Lieferung erfolgt innerhalb von drei Werktagen.","Werktage sind Montag bis Freitag."}	3	5	1	\N	Werktage	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9052	versand	{shipping}	{"Der Versand erfolgt innerhalb von 24 Stunden.","Die Versandkosten hängen vom Gewicht ab."}	3	5	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9068	zustellen	{"to deliver"}	{"Wir stellen die Ware zu, sobald sie im Lager verfügbar ist.","Der Paketbote versucht dreimal zuzustellen, bevor das Paket zurückgeschickt wird."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9069	alter	{age}	{"Das Durchschnittsalter der Teilnehmer liegt bei 35 Jahren, wie die Umfrage zeigt.","Obwohl das Alter in vielen Sportarten eine Rolle spielt, gibt es Ausnahmen."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9070	anschauen	{"to look at"}	{"Ich schaue mir oft Dokumentationen an, weil ich Neues lernen möchte.","Kannst du dir das Diagramm anschauen und mir erklären, was es bedeutet?"}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9071	anstoß	{stimulus}	{"Die Diskussion gab den Anstoß für neue Regeln, die dem Team helfen sollen.","Der Trainer gab den Anstoß zum Training, das heute besonders intensiv war."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9072	anstrengend	{tiring}	{"Das Handballspiel war anstrengend, obwohl wir nur eine halbe Stunde spielten.","Anstrengende Arbeit macht müde, aber sie kann auch befriedigend sein."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9073	autorennen	{"motor racing"}	{"Beim Autorennen im Stadion waren tausende Fans, die ihre Lieblingsfahrer anfeuerten.","Autorennen sind spannend, aber sie verursachen auch viel Lärm."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9074	befragen	{"to consult"}	{"Wir befragen die Experten, bevor wir eine Entscheidung treffen.","Die Reporter befragten die Kandidaten, um mehr über ihre Pläne zu erfahren."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9075	begeistern	{"to inspire"}	{"Der Film begeisterte das Publikum, weil die Handlung voller Überraschungen war.","Kinder lassen sich leicht für neue Sportarten begeistern, wenn sie Spaß haben."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9076	beliebt	{popular}	{"Eishockey ist in Kanada sehr beliebt, während in Deutschland Fußball dominiert.","Beliebte Serien werden oft über viele Staffeln hinweg produziert."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9077	biergarten	{"beer garden"}	{"Im Biergarten treffen sich Freunde, um gemeinsam Zeit zu verbringen.","Der Biergarten war voll, obwohl das Wetter nicht perfekt war."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9078	boxen	{boxing}	{"Boxen erfordert Disziplin, da die Sportler hart trainieren müssen.","Obwohl Boxen gefährlich sein kann, zieht es viele Zuschauer an."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9079	chips	{crisps}	{"Chips sind zwar lecker, aber sie gelten als ungesunder Snack.","Wir kauften Chips und Limonade für den Filmabend, den wir planten."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9080	demnächst	{soon}	{"Demnächst wird eine neue Staffel der Serie erscheinen, auf die viele Fans warten.","Die Mannschaft trainiert hart, denn demnächst steht ein wichtiges Spiel an."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9081	detektivgeschichte	{"detective story"}	{"Die Detektivgeschichte war so spannend, dass ich das Buch in einem Tag las.","In jeder Detektivgeschichte gibt es ein Rätsel, das gelöst werden muss."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9082	diagramm	{diagram}	{"Das Diagramm zeigt deutlich, dass die Mehrheit für die neue Regel ist.","Um die Statistik zu verstehen, muss man das Diagramm genau analysieren."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9083	diskussion	{discussion}	{"Die Diskussion dauerte Stunden, weil niemand eine Lösung fand.","In der Talkshow gab es hitzige Diskussionen über aktuelle Themen."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9084	dokumentation	{documentary}	{"Die Dokumentation über Klimawandel war informativ, obwohl sie traurig machte.","Dokumentationen können helfen, komplexe Themen besser zu verstehen."}	3	6	2	\N	dokumentationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9085	doppelt	{doubled}	{"Die Zuschauerzahl hat sich doppelt, seit die Sendung beliebter wurde.","Er arbeitet doppelt so hart, um sein Ziel zu erreichen."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9086	dramatisch	{dramatic}	{"Das Spielende war dramatisch, weil die Mannschaft in letzter Sekunde ein Tor schoss.","Die Handlung des Films wurde immer dramatischer, je länger er lief."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9087	durchschnitt	{average}	{"Im Durchschnitt verbringen Menschen zwei Stunden täglich mit Unterhaltung.","Die Durchschnittstemperatur stieg, was viele Wissenschaftler beunruhigt."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9088	dvd	{DVD}	{"Ich kaufte die DVD der Komödie, weil ich sie mehrmals anschauen wollte.","Obwohl Streaming beliebt ist, sammeln einige Leute noch DVDs."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9089	ehrlich	{honest}	{"Sei ehrlich: Hast du das letzte Tor im Spiel wirklich gesehen?","Ehrliche Kommentare sind wichtig, um eine Diskussion fair zu halten."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9090	einschlafen	{"to fall asleep"}	{"Ich kann nicht einschlafen, wenn ich vorher eine Horrorfilme anschaue.","Nach dem anstrengenden Training schlief er sofort ein."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9091	einsetzen	{"to use"}	{"Der Trainer setzt neue Spieler ein, um die Taktik zu verbessern.","In der Reportage wurden Drohnen eingesetzt, um spektakuläre Aufnahmen zu machen."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9092	eishockey	{"ice hockey"}	{"Eishockey ist in nordischen Ländern populär, weil das Klima passend ist.","Das Eishockey-Spiel wurde abgebrochen, als das Eis zu schmelzen begann."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9698	weniger als	{"less/fewer than"}	{"Weniger als zehn Teilnehmer waren da.","Er arbeitet weniger als 20 Stunden pro Woche."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9093	eiskunstlauf	{"ice skating"}	{"Beim Eiskunstlauf bewerteten die Jury die Technik und die Kreativität.","Eiskunstlauf erfordert jahrelanges Training, um erfolgreich zu sein."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9094	entstehen	{"to result"}	{"Durch den Mord in der Serie entstand eine spannende Detektivgeschichte.","Viele Missverständnisse entstehen, wenn man nicht klar kommuniziert."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9095	ereignis	{event}	{"Das Ereignis wurde live übertragen, damit Fans weltweit zuschauen konnten.","Historische Ereignisse prägen oft die Handlung von Dokumentationen."}	3	6	3	\N	ereignisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9096	erfolgreich	{successful}	{"Erfolgreiche Sportler müssen diszipliniert sein, auch wenn es schwerfällt.","Die Serie war so erfolgreich, dass eine Fortsetzung geplant ist."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9097	ergebnis	{result}	{"Das Ergebnis der Wahl überraschte viele, da die Minderheit stärker war.","Ohne Fleiß gibt es keine guten Ergebnisse, sagt der Trainer."}	3	6	3	\N	ergebnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9098	experte/expertin	{expert}	{"Der Experte erklärte im Magazin, wie man gesünder lebt.","Expertinnen betonten in der Diskussion, wie wichtig objektive Daten sind."}	3	6	5	\N	experten/expertinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9099	fan	{fan}	{"Fans des Fußballclubs feierten die Niederlage der gegnerischen Mannschaft.","Obwohl er ein Fan von Actionfilmen ist, mag er auch romantische Komödien."}	3	6	1	\N	fans	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9100	fußballclub	{"football club"}	{"Der Fußballclub sucht neue Spieler, um in der Rangliste aufzusteigen.","Fans des Fußballclubs reisten zum Auswärtsspiel, um ihre Mannschaft anzufeuern."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9101	gewohnheit	{habit}	{"Gesunde Gewohnheiten können helfen, Langeweile im Alltag zu vermeiden.","Die Gewohnheit, täglich Sport zu treiben, fällt vielen Menschen schwer."}	3	6	2	\N	gewohnheiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9102	golf	{golf}	{"Golf erfordert Geduld, weil jeder Schlag präzise sein muss.","Obwohl Golf als elitär gilt, wird es immer beliebter."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9103	handball	{"hand ball"}	{"Handball ist ein Teamsport, bei dem Schnelligkeit und Taktik wichtig sind.","Die Handball-Weltmeisterschaft zieht Millionen von Zuschauern an."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9104	herz	{heart}	{"Sport ist gut für das Herz, solange man es nicht übertreibt.","Der Film berührte ihr Herz, weshalb sie weinte."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9105	horrorfilm	{"horror film"}	{"Horrorfilme sind nichts für mich, weil ich danach schlecht einschlafe.","Der Horrorfilm war so gruselig, dass einige Zuschauer den Saal verließen."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9106	kandidat/in	{candidate}	{"Die Kandidatin überzeugte die Jury mit ihrer kreativen Idee.","Kandidaten müssen in der Quizshow unter Zeitdruck antworten."}	3	6	5	\N	kandidaten/kandidatinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9107	kommissar/in	{commissioner}	{"Der Kommissar löste den Mordfall, indem er jedes Detail überprüfte.","Kommissarinnen in Krimis sind oft besonders clever und entschlossen."}	3	6	5	\N	kommissare/kommissarinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9108	kommentator/in	{commentator}	{"Der Kommentator beschrieb das Spiel so lebhaft, als wäre man live dabei.","Kommentatorinnen analysierten die Statistiken nach dem Match."}	3	6	5	\N	kommentatoren/kommentatorinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9109	komödie	{comedy}	{"Die Komödie war so lustig, dass das Publikum die ganze Zeit lachte.","Komödien eignen sich gut, um nach einem anstrengenden Tag abzuschalten."}	3	6	2	\N	komödien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9110	krimi	{"crime thriller"}	{"Im Krimi ging es um einen Räuber, der nie gefasst wurde.","Krimis sind beliebt, weil sie Spannung und Logik kombinieren."}	3	6	1	\N	krimis	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9111	kuscheln	{"to cuddle"}	{"Nach dem Film kuschelten wir uns auf die Couch und redeten über die Handlung.","Kuscheln mit Haustieren kann Stress reduzieren, sagen Experten."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9112	langeweile	{boredom}	{"Langeweile entsteht oft, wenn man keine Hobbys oder Interessen hat.","Um der Langeweile zu entkommen, schaltete er die Talkshow ein."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9113	leichtathletik	{athletics}	{"Leichtathletik umfasst Disziplinen wie Laufen, Springen und Werfen.","Bei den Olympischen Spielen ist Leichtathletik eine der wichtigsten Sportarten."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9114	lieblingsbeschäftigung	{"favourite pastime"}	{"Meine Lieblingsbeschäftigung ist Lesen, weil ich dabei in andere Welten eintauchen kann.","Sport ist für viele eine Lieblingsbeschäftigung, um fit zu bleiben."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9115	magazin	{magazine}	{"Das Magazin veröffentlichte eine Reportage über gesunde Ernährung.","In einem Sportmagazin findet man Artikel über verschiedene Disziplinen."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9116	mannschaft	{team}	{"Die Mannschaft trainierte hart, um bei der Weltmeisterschaft zu siegen.","Ohne Teamgeist kann eine Mannschaft keine großen Erfolge erzielen."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9117	mehrheit	{majority}	{"Die Mehrheit der Zuschauer bevorzugt Spielfilme gegenüber Dokumentationen.","Laut Statistik ist die Mehrheit der Jugendlichen motiviert, Sport zu treiben."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9118	minderheit	{minority}	{"Nur eine Minderheit der Fans war mit dem Ergebnis des Spiels zufrieden.","Minderheiten haben oft besondere Interessen, die berücksichtigt werden müssen."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9119	mitreden	{"to have a say"}	{"Bei wichtigen Entscheidungen möchte ich mitreden, da es auch mich betrifft.","Nur wer sich informiert, kann bei komplexen Themen mitreden."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9120	mittelfeld	{mid-field}	{"Das Mittelfeld spielte ausgezeichnet, weshalb die Mannschaft das Spiel dominierte.","Ein starkes Mittelfeld ist entscheidend für die Kontrolle des Spiels."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9121	moderation	{presentation}	{"Die Moderation der Sendung übernahm ein bekannter Reporter, der viel Erfahrung hat.","Eine gute Moderation macht selbst langweilige Themen interessant."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9122	mord	{murder}	{"Der Mord in der Serie wurde nie aufgeklärt, was die Zuschauer frustrierte.","In vielen Krimis ist ein Mord der Ausgangspunkt der Handlung."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9123	motiviert	{motivated}	{"Die Spieler waren hochmotiviert, nachdem der Trainer sie angefeuert hatte.","Motivierte Mitarbeiter sind der Schlüssel zum Erfolg eines Unternehmens."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9124	naschen	{"to snack"}	{"Kinder naschen gerne Süßigkeiten, obwohl sie wissen, dass es ungesund ist.","Statt zu naschen, könnte man Obst als gesunde Alternative wählen."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9125	niederlage	{defeat}	{"Die Niederlage war hart, aber die Mannschaft lernte daraus für die Zukunft.","Nach der Niederlage analysierte der Trainer die Fehler des Teams."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9126	objektiv	{objective}	{"Ein guter Kommentator sollte objektiv bleiben, auch wenn er Fan einer Mannschaft ist.","Objektive Berichterstattung ist in den Medien unverzichtbar."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9127	quizshow	{"quiz show"}	{"In der Quizshow gewann der Kandidat, indem er alle Rätsel richtig löste.","Quizshows sind beliebt, weil sie Wissen und Unterhaltung kombinieren."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9128	radrennen	{"cycling race"}	{"Das Radrennen fand bei Regen statt, was es besonders anspruchsvoll machte.","Fans des Radrennens verfolgten jede Etappe gespannt im Fernsehen."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9129	rangliste	{"league table"}	{"Die Rangliste zeigt, welche Mannschaft aktuell die beste Leistung bringt.","Durch den Sieg stieg das Team in der Rangliste um drei Plätze."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9130	rätsel	{puzzle}	{"Das Rätsel in der Detektivgeschichte war so schwer, dass niemand es löste.","Kinder lieben es, Rätsel zu lösen, weil es ihr Denken fördert."}	3	6	3	\N	rätsel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9131	reportage	{report}	{"Die Reportage über den Skisport zeigte atemberaubende Aufnahmen der Berge.","In der Reportage interviewten sie Experten zum Thema Klimawandel."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9132	reporter/in	{reporter}	{"Die Reporterin befragte den Sieger unmittelbar nach dem Spiel.","Reporter müssen oft schnell reagieren, um aktuelle Ereignisse zu dokumentieren."}	3	6	5	\N	reporter/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9133	retten	{"to rescue"}	{"Der Torwart rettete das Spiel, indem er den entscheidenden Schuss abwehrte.","In der Serie rettete der Held die Stadt vor einer Katastrophe."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9134	romantisch	{romantic}	{"Der Film war so romantisch, dass einige Zuschauer vor Rührung weinten.","Romantische Komödien sind ideal für einen gemütlichen Abend zu zweit."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9135	runde	{round}	{"In der letzten Runde des Spiels schoss die Mannschaft das Siegtor.","Die Diskussionsrunde dauerte länger als geplant, weil viele mitreden wollten."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9136	schalten	{"to switch"}	{"Viele Zuschauer schalten ein, wenn ihre Lieblingssendung läuft.","Er schaltete den Fernseher aus, weil er die Werbung nicht ertrug."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9137	schiedsrichter	{referee}	{"Der Schiedsrichter unterbrach das Spiel, weil ein Spieler verletzt war.","Ein fairer Schiedsrichter ist für den reibungslosen Ablauf des Spiels wichtig."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9138	schießen	{"to shoot"}	{"Der Stürmer schoss das Tor in letzter Sekunde, was die Fans begeisterte.","In Actionfilmen wird oft geschossen, was nicht für Kinder geeignet ist."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9139	seifenoper	{"soap opera"}	{"Seifenopern haben viele Fans, obwohl die Handlung oft unrealistisch ist.","In der Seifenoper gab es dramatische Szenen, die die Zuschauer fesselten."}	3	6	2	\N	seifenopern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9140	sendung	{programme}	{"Die Sendung über gesunde Ernährung wurde von vielen Zuschauern positiv bewertet.","Jeden Montag läuft meine Lieblingssendung, die ich nie verpasse."}	3	6	2	\N	sendungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9141	serie	{series}	{"Die Serie handelt von einem Mord, der eine ganze Familie betrifft.","Viele Serien setzen auf Spannung, um die Zuschauer bei Laune zu halten."}	3	6	2	\N	serien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9142	siegen	{"to win"}	{"Um zu siegen, muss die Mannschaft im Mittelfeld stärker werden.","Auch wenn man nicht immer siegt, sollte man stolz auf die Leistung sein."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9143	sieger/in	{winner}	{"Die Siegerin der Weltmeisterschaft wurde mit einer Goldmedaille geehrt.","Sieger/innen sollten auch lernen, mit Niederlagen umzugehen."}	3	6	5	\N	sieger/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9144	skisport	{"ski sport"}	{"Skisport ist im Winter beliebt, obwohl er teuer und wetterabhängig ist.","Im Skisport gibt es verschiedene Disziplinen wie Slalom oder Abfahrt."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9145	soap	{"soap opera"}	{"Die Soap zeigt das Leben einer Familie, die viele Konflikte bewältigt.","Obwohl Soaps oft kritisiert werden, haben sie eine treue Fangemeinde."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9146	spannend	{exciting}	{"Das Fußballspiel war spannend bis zur letzten Minute.","Spannende Bücher lassen einen oft die Zeit vergessen."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9147	spieler/in	{player}	{"Die Spielerin wurde ausgewechselt, nachdem sie ein Tor geschossen hatte.","Erfolgreiche Spieler/innen trainieren täglich, um ihre Fähigkeiten zu verbessern."}	3	6	5	\N	spieler/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9148	spielfilm	{"feature film"}	{"Der Spielfilm gewann mehrere Preise, darunter den für die beste Kamera.","Spielfilme bieten oft eine Mischung aus Unterhaltung und tiefgründigen Themen."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9149	stadion	{stadium}	{"Das Stadion war ausverkauft, als die Mannschaft das entscheidende Spiel bestritt.","Moderne Stadien bieten nicht nur Sport, sondern auch Konzerte."}	3	6	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9150	statistik	{statistics}	{"Laut Statistik verbringen Jugendliche mehr Zeit mit Serien als mit Sport.","Die Statistik zeigt, dass die Mehrheit für eine Regeländerung ist."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9151	tagesablauf	{"daily routine"}	{"Ein strukturierter Tagesablauf hilft, Zeitverschwendung zu vermeiden.","In der Dokumentation wurde der Tagesablauf einer Profisportlerin gezeigt."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9152	talkshow	{"talk show"}	{"In der Talkshow diskutierten Experten über die Zukunft des Sports.","Talkshows sind populär, weil sie aktuelle Themen lebhaft präsentieren."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9153	tor	{goal}	{"Das Tor in der 89. Minute entschied das Spiel zugunsten unserer Mannschaft.","Tore zu schießen erfordert Präzision und schnelles Denken."}	3	6	3	\N	tore	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9154	torwart/in	{goalie}	{"Die Torwartin rettete ihr Team mit einer spektakulären Parade.","Ein guter Torwart kann den Ausgang eines Spiels entscheidend beeinflussen."}	3	6	5	\N	torwarte/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9155	tote	{"dead people"}	{"Nach dem Krieg wurden viele Tote in Gedenkstätten beerdigt, um ihre Geschichte nicht zu vergessen.","In manchen Kulturen ehrt man die Tote mit besonderen Ritualen und Blumen."}	3	6	5	\N	toten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9156	übertragung	{transmission}	{"Die Übertragung des Fußballspiels wurde unterbrochen, weil das Wetter zu schlecht war.","Wissenschaftler untersuchten die Übertragung des Virus durch die Luft."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9157	unentschieden	{undecided}	{"Das Spiel endete unentschieden, sodass beide Teams einen Punkt bekamen.","Ich bin noch unentschieden, ob ich heute ins Kino oder zu Hause bleiben soll."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9158	ungesund	{unhealthy}	{"Zu viel Fast Food ist ungesund, aber manchmal kann man nicht widerstehen.","Rauchen und wenig Schlaf sind genauso ungesund wie Stress im Beruf."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9159	unterhaltung	{entertainment}	{"Die Unterhaltung im Park war perfekt: Live-Musik, Theater und leckeres Essen.","Viele Menschen nutzen Streaming-Dienste zur Unterhaltung, weil sie bequem sind."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9160	verlierer/in	{loser}	{"Der Verlierer des Wettbewerbs gratulierte der Gewinnerin trotzdem herzlich.","In der Politik gibt es immer Gewinner und Verlierer, je nach Entscheidung der Wähler."}	3	6	5	\N	verlierer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9161	weltmeisterschaft	{"World cup"}	{"Die Weltmeisterschaft in Brasilien war voller Überraschungen und emotionaler Momente.","Viele Länder investieren Millionen, um die Weltmeisterschaft austragen zu können."}	3	6	2	\N	weltmeisterschaften	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9162	weshalb	{"which is why"}	{"Es regnete stark, weshalb das Picknick im Park abgesagt werden musste.","Sie hatte kein Geld dabei, weshalb sie schnell nach Hause zurückging."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9163	zappen	{"to channel surf"}	{"Er zappte stundenlang durch die Fernsehkanäle, fand aber nichts Interessantes.","Wenn wir zappen, verpassen wir oft den Anfang der Filme, die wir suchen."}	3	6	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9164	zeichentrickfilm	{"animated film"}	{"Mein kleiner Bruder liebt japanische Zeichentrickfilme mehr als Realverfilmungen.","Disney hat viele berühmte Zeichentrickfilme produziert, die weltweit bekannt sind."}	3	6	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9165	zeitverschwendung	{"waste of time"}	{"Social Media kann eine große Zeitverschwendung sein, wenn man nicht aufpasst.","Der Vortrag war reine Zeitverschwendung, weil keine neuen Informationen gegeben wurden."}	3	6	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9166	zuschauer/in	{viewer}	{"Die Zuschauer im Stadion jubelten laut, als das Tor fiel.","Diese Serie hat Millionen von Zuschauern weltweit, die jede Folge diskutieren."}	3	6	5	\N	zuschauer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9462	drinnen	{inside}	{"Es regnet stark, also bleiben wir lieber drinnen.","Drinnen ist es viel wärmer als draußen im Winter."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9167	alliierte	{allies}	{"Die Alliierten beschlossen nach dem Krieg, Deutschland in vier Besatzungszonen aufzuteilen.","Ohne die Unterstützung der Alliierten hätte die Demokratie in Europa schwerer entstehen können."}	3	7	5	\N	alliierten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9168	amtssprache	{"official language"}	{"In Indien gibt es über 20 Amtssprachen, was die Kommunikation manchmal schwierig macht.","Wenn man in ein neues Land zieht, sollte man die Amtssprache möglichst schnell lernen."}	3	7	2	\N	amtssprachen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9169	anfangs	{initially}	{"Anfangs wollte sie Medizin studieren, aber später entschied sie sich für Politikwissenschaft.","Anfangs gab es viele Proteste gegen die Euroeinführung, doch heute akzeptieren die meisten Bürger den Euro."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9170	anheben	{"to raise"}	{"Die Regierung plant, das Mindestgehalt um 10% anzuheben, um die Arbeitskräfte zu unterstützen.","Er musste die schwere Kiste anheben, um sie in den LKW zu laden."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9171	arbeitskraft	{workforce}	{"Die Arbeitskraft in der Industrie wurde durch Maschinen ersetzt, was zu Arbeitslosigkeit führte.","Junge Arbeitskräfte wandern oft aus, um bessere Gehälter im Ausland zu erhalten."}	3	7	2	\N	arbeitskräfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9172	arbeitslosigkeit	{unemployment}	{"Die Arbeitslosigkeit stieg nach der Wirtschaftskrise stark an, besonders unter Jugendlichen.","Die Regierung versucht, Arbeitslosigkeit durch neue Gesetze zu reduzieren."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9173	astronaut/in	{astronaut}	{"Der Astronaut trainierte jahrelang, um ins Weltall fliegen zu können.","Sie war die erste Astronautin aus ihrem Land, die an einer internationalen Mission teilnahm."}	3	7	5	\N	astronauten/astronautinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9174	asyl	{asylum}	{"Viele Flüchtlinge suchten Asyl in Deutschland, nachdem der Bürgerkrieg in ihrer Heimat begann.","Das Recht auf Asyl ist in der Verfassung der Bundesrepublik festgeschrieben."}	3	7	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9175	aufschreiben	{"to write down"}	{"Sie schrieb ihre Ideen schnell auf, um sie später nicht zu vergessen.","Der Lehrer bat die Schüler, die Regeln der Demokratie aufzuschreiben."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9176	aufteilen	{"to divide"}	{"Die Klasse wurde in Gruppen aufgeteilt, um das Projekt effizienter zu bearbeiten.","Nach dem Krieg wurde Berlin in vier Besatzungszonen aufgeteilt."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9177	auswanderer	{emigrant}	{"Im 19. Jahrhundert waren viele Auswanderer aus Deutschland in die USA gezogen.","Die Auswanderer vermissten ihre Heimat, hofften aber auf ein besseres Leben."}	3	7	1	\N	auswanderer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9178	auswanderung	{emigration}	{"Die Auswanderung aus Osteuropa nahm nach dem Mauerfall deutlich zu.","Wirtschaftliche Gründe sind oft der Auslöser für Auswanderung."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9203	friedlich	{peaceful}	{"Die Demonstration verlief friedlich, obwohl Tausende Menschen teilnahmen.","Nach dem Krieg sehnten sich alle nach einer friedlichen Zukunft."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9179	besatzungszone	{"occupied zone"}	{"Nach 1945 wurde Deutschland in vier Besatzungszonen der Alliierten aufgeteilt.","In der französischen Besatzungszone entwickelten sich eigene politische Strukturen."}	3	7	2	\N	besatzungszonen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9180	besiegen	{"to conquer"}	{"Die Armee konnte den Feind besiegen, aber der Krieg hinterließ große Zerstörung.","Im Sport ist es wichtig, nicht nur den Gegner, sondern auch eigene Zweifel zu besiegen."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9181	bundeskanzler/in	{"federal chancellor"}	{"Der erste Bundeskanzler der BRD, Konrad Adenauer, prägte die Nachkriegszeit entscheidend.","Die Bundeskanzlerin betonte in ihrer Rede die Bedeutung der EU für den Frieden."}	3	7	5	\N	bundeskanzler/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9182	bundesrepublik (brd)	{"federal republic (FRG)"}	{"Die Bundesrepublik wurde 1949 gegründet und entwickelte sich schnell zu einem demokratischen Staat.","Während der Teilung war die BRD eng mit der NATO verbunden."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9183	bürger/in	{citizen}	{"Jeder Bürger hat das Recht, in freien Wahlen die Regierung zu bestimmen.","Die Bürger der DDR durften lange Zeit nicht in den Westen reisen."}	3	7	5	\N	bürger/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9184	bürgerkrieg	{"civil war"}	{"Der Bürgerkrieg zerstörte die Infrastruktur des Landes und trieb viele in die Auswanderung.","In einem Bürgerkrieg kämpfen oft Bürger desselben Staates gegeneinander."}	3	7	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9185	demokratie	{democracy}	{"Eine funktionierende Demokratie erfordert informierte Bürger und freie Medien.","Nach dem Krieg wurde die Demokratie in Westdeutschland schrittweise eingeführt."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9186	demokratisch	{democratic}	{"Die demokratischen Wahlen sorgten für Hoffnung auf politische Stabilität.","In einer demokratischen Republik haben alle Bürger gleiche Rechte."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9187	demonstration	{demonstration}	{"Die friedliche Demonstration forderte mehr Rechte für Migranten und Flüchtlinge.","Während der DDR-Zeit waren Demonstrationen gegen die Regierung verboten."}	3	7	2	\N	demonstrationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9188	deutsche demokratische republik (ddr)	{"German democratic republic (GDR)"}	{"Die DDR wurde 1949 gegründet und existierte bis zur Wiedervereinigung 1990.","In der DDR kontrollierte die Regierung fast alle Bereiche des Lebens."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9189	ehemalig	{former}	{"Der ehemalige Bundeskanzler sprach über die Herausforderungen der EU-Erweiterung.","Viele ehemalige Gastarbeiter blieben dauerhaft in Deutschland."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9190	einführen	{"to introduce"}	{"Die Regierung möchte ein neues Gesetz zur Förderung der Einwanderung einführen.","Die Euroeinführung war ein wichtiger Schritt für die europäische Integration."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9191	einsperren	{"to confine"}	{"Politische Gegner wurden während der Diktatur oft eingesperrt.","Man sollte Tiere nicht in kleinen Käfigen einsperren."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9192	einwanderung	{immigration}	{"Die Einwanderung nach Deutschland hat die Kultur des Landes vielfältiger gemacht.","Strenge Visumsregeln können legale Einwanderung erschweren."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9193	emotional	{emotional}	{"Die Wiedervereinigung war ein emotionaler Moment für viele Deutsche.","In der Debatte wurde es sehr emotional, als es um Kindheitserinnerungen ging."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9194	entwickeln	{"to develop"}	{"Nach dem Krieg musste sich die Industrie komplett neu entwickeln.","Kinder entwickeln ihre Muttersprache natürlicherweise durch Zuhören."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9195	erinnern	{"to remember"}	{"Viele Zeitzeugen erinnern sich noch genau an den Mauerfall.","Ich kann mich kaum an meine ersten Jahre in der Krippe erinnern."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9196	erinnerung	{memory}	{"Die Erinnerung an den Krieg prägte die Generation meiner Großeltern.","In seinem Roman verarbeitete er Erinnerungen an seine Kindheit in der DDR."}	3	7	2	\N	erinnerungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9197	ernähren	{"to feed"}	{"Viele Familien konnten sich nach dem Krieg kaum noch ernähren.","Eine ausgewogene Ernährung ist wichtig, um Kinder gesund zu ernähren."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9198	europäische union (eu)	{"European union"}	{"Die EU fördert die Zusammenarbeit zwischen ihren Mitgliedsstaaten.","Durch die EU können Bürger ohne Visum in viele Länder reisen."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9199	euroeinführung	{"introduction of the Euro"}	{"Die Euroeinführung vereinfachte den Handel innerhalb der EU erheblich.","Anfangs gab es viele Kritiker der Euroeinführung, doch heute ist die Währung akzeptiert."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9200	flüchtling	{refugee}	{"Viele Flüchtlinge fanden in Notunterkünften Schutz vor dem Bürgerkrieg.","Die Integration von Flüchtlingen ist eine wichtige Aufgabe für die Gesellschaft."}	3	7	1	\N	flüchtlinge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9201	fördern	{"to promote"}	{"Die Regierung fördert die Forschung im Bereich erneuerbarer Energien.","Sportvereine fördern nicht nur Talente, sondern auch Teamgeist."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9202	fremdsprache	{"foreign language"}	{"Englisch ist die meistgelernte Fremdsprache in deutschen Schulen.","Fremdsprachen zu beherrschen, eröffnet neue berufliche Möglichkeiten."}	3	7	2	\N	fremdsprachen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9204	gastarbeiter/in	{"guest worker"}	{"In den 1960er Jahren kamen viele Gastarbeiter aus der Türkei nach Deutschland.","Die Gastarbeiter halfen, den Arbeitskräftemangel in der Industrie zu lösen."}	3	7	5	\N	gastarbeiter/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9205	gefühl	{feeling}	{"Beim Anblick der zerstörten Mauer hatte sie gemischte Gefühle.","Sein Gefühl sagte ihm, dass die Entscheidung falsch war."}	3	7	3	\N	gefühle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9206	gegner/in	{opponent}	{"Die politischen Gegner kritisierten die Pläne der Regierung scharf.","Im Sport respektierte er immer seine Gegner, auch wenn er verlor."}	3	7	5	\N	gegner/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9208	gewürz	{spice}	{"Gewürze wie Pfeffer und Zimt waren früher sehr wertvoll und teuer.","Ohne die richtigen Gewürze schmeckt das Gericht fad."}	3	7	3	\N	gewürze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9209	grenze	{border}	{"Nach dem Mauerfall öffnete sich die Grenze zwischen Ost- und Westdeutschland.","Die Grenze zwischen Österreich und Deutschland ist für Reisende kaum sichtbar."}	3	7	2	\N	grenzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9210	gründen	{"to establish"}	{"1949 wurde die Bundesrepublik Deutschland als demokratischer Staat gegründet.","Sie möchte ein Startup gründen, das nachhaltige Produkte herstellt."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9211	hart	{hard}	{"Die Arbeit in der Fabrik war hart, aber sie verdienten damit ihr Gehalt.","Nach Jahren der Diktatur war der Übergang zur Demokratie hart."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9212	hauptstadt	{"capital city"}	{"Berlin ist nicht nur die Hauptstadt Deutschlands, sondern auch ein kulturelles Zentrum.","Jede Hauptstadt spiegelt die Geschichte und Identität ihres Landes wider."}	3	7	2	\N	hauptstädte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9213	heimat	{"home country"}	{"Viele Russlanddeutsche kehrten in ihre Heimat zurück, nachdem die Sowjetunion zerfiel.","Heimat kann für Migranten sowohl das neue als auch das alte Land sein."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9214	industrie	{industry}	{"Die deutsche Industrie spielte eine Schlüsselrolle im Wiederaufbau nach dem Krieg.","Durch Automatisierung verändert sich die Industrie weltweit rasch."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9215	irgendwann	{"at some point"}	{"Irgendwann wird die Menschheit vielleicht Kolonien im Weltall gründen.","Jeder möchte irgendwann in seinem Leben die Hauptstadt seines Landes besuchen."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9216	jahrelang	{"for years"}	{"Jahrelang arbeitete er als Gastarbeiter in Deutschland, um seiner Familie zu helfen.","Die Forschung an der Medizin dauerte jahrelang, war aber erfolgreich."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9217	jahrhundert	{century}	{"Das 20. Jahrhundert war geprägt von zwei Weltkriegen und technischem Fortschritt.","In diesem Jahrhundert wird die Klimakrise eine große Herausforderung sein."}	3	7	3	\N	jahrhunderte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9218	jahrzehnt	{decade}	{"Ein Jahrzehnt nach dem Mauerfall war Deutschland wieder vereint.","In den letzten Jahrzehnten hat sich die Migration stark verändert."}	3	7	3	\N	jahrzehnte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9219	jude/jüdin	{jew}	{"Während des Nationalsozialismus wurden viele Juden und Jüdinnen verfolgt.","Heute leben in Deutschland wieder zahlreiche jüdische Gemeinden."}	3	7	5	\N	juden/jüdinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9220	kaum	{hardly}	{"Nach dem Krieg gab es kaum noch Industrie, die funktionsfähig war.","Sie konnte es kaum erwarten, ihre Heimat nach Jahren wiederzusehen."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9221	kindheit	{childhood}	{"Ihre Kindheit verbrachte sie in einer kleinen Stadt nahe der Grenze.","In der Nachkriegszeit war die Kindheit vieler Menschen von Armut geprägt."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9222	krieg	{war}	{"Der Krieg zerstörte nicht nur Städte, sondern auch Familien und Träume.","Viele Staaten versuchen heute, Konflikte ohne Krieg zu lösen."}	3	7	1	\N	kriege	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9223	kriegsende	{"end of war"}	{"Das Kriegsende 1945 brachte Erleichterung, aber auch neue Herausforderungen.","Veteranen erinnern sich oft emotional an das Kriegsende."}	3	7	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9224	krippe	{crib}	{"In der Krippe im Dorf wurden Kinder von berufstätigen Eltern betreut.","Die Krippe war aus Holz und stand seit Generationen in der Familie."}	3	7	2	\N	krippen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9225	kritiker/in	{critic}	{"Kritiker der Regierung warnten vor den Folgen der neuen Gesetze.","Auch wenn er ein Kritiker der EU ist, unterstützt er die Idee der Zusammenarbeit."}	3	7	5	\N	kritiker/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9226	mauer	{wall}	{"Die Berliner Mauer trennte die Stadt fast drei Jahrzehnte lang.","Heute sind nur noch kleine Teile der Mauer als Denkmal erhalten."}	3	7	2	\N	mauern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9227	mauerbau	{"building of the wall"}	{"Der Mauerbau 1961 verschärfte die Spannungen zwischen Ost und West.","Viele Familien wurden durch den Mauerbau getrennt."}	3	7	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9228	mauerfall	{"fall of the Berlin wall"}	{"Der Mauerfall 1989 markierte den Beginn der deutschen Wiedervereinigung.","Menschen auf der ganzen Welt feierten den Mauerfall als Symbol der Freiheit."}	3	7	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9229	medizin	{medicine}	{"Die moderne Medizin hat viele Krankheiten besiegt, die früher tödlich waren.","Er studierte Medizin, um später in Entwicklungsländern zu helfen."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9230	merken	{"to realise"}	{"Er merkte erst spät, dass sein Visum abgelaufen war.","Die Regierung merkte schnell, dass die Reformen nicht ausreichten."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9231	migration	{migration}	{"Migration hat viele Ursachen, wie Kriege, Armut oder Hoffnung auf Bildung.","Die EU versucht, gemeinsame Regeln für Migration zu entwickeln."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9232	miteinander	{together}	{"Nach der Wiedervereinigung mussten Ost und West lernen, miteinander zu leben.","In der Demokratie geht es darum, Konflikte friedlich miteinander zu lösen."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9233	miterleben	{"to experience with"}	{"Sie durfte miterleben, wie ihr Land nach Jahren des Krieges wieder aufgebaut wurde.","Kinder, die den Mauerfall miterlebten, erinnern sich noch genau daran."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9234	musikalisch	{musical}	{"Die Stadt ist bekannt für ihr musikalisches Erbe und viele Konzerte.","Schon in der Kindheit zeigte er musikalisches Talent."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9235	muttersprache	{"native language"}	{"Seine Muttersprache ist Deutsch, aber er spricht fließend drei Fremdsprachen.","In vielen Ländern ist die Muttersprache der Minderheiten geschützt."}	3	7	2	\N	muttersprachen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9236	nachkriegszeit	{"post-war years"}	{"In der Nachkriegszeit herrschte in Deutschland große Armut und Arbeitslosigkeit.","Viele Gebäude aus der Nachkriegszeit sind heute denkmalgeschützt."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9237	nationalsozialismus	{"national socialism"}	{"Der Nationalsozialismus führte zu einer der dunkelsten Phasen der deutschen Geschichte.","Über den Nationalsozialismus wird in Schulen ausführlich aufgeklärt."}	3	7	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9238	nato	{NATO}	{"Die NATO wurde gegründet, um die Sicherheit der Mitgliedsstaaten zu gewährleisten.","Nach dem Kriegsende trat Deutschland der NATO bei."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9239	notunterkunft	{"emergency accommodation"}	{"Die Flüchtlinge wurden vorübergehend in einer Notunterkunft untergebracht.","Nach dem Erdbeben fehlte es an ausreichend Notunterkünften."}	3	7	2	\N	notunterkünfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9240	öffnung	{opening}	{"Die Öffnung der Grenzen ermöglichte vielen Familien die Wiedervereinigung.","Die Öffnung der EU für neue Mitglieder ist ein kontroverses Thema."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9241	phase	{phase}	{"In der ersten Phase des Projekts wurden die Grundlagen erforscht.","Jede politische Reform durchläuft mehrere Phasen der Diskussion."}	3	7	2	\N	phasen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9242	politisch	{political}	{"Die politische Lage in vielen Ländern ist instabil, was Migration verstärkt.","Er engagiert sich politisch, um demokratische Werte zu fördern."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9243	protest	{protest}	{"Der Protest gegen die Arbeitslosigkeit führte zu neuen Gesetzen.","Friedliche Proteste sind ein Grundrecht in demokratischen Staaten."}	3	7	1	\N	proteste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9244	regierung	{government}	{"Die Regierung beschloss, die Steuern für Familien zu senken.","In der DDR kontrollierte die Regierung fast alle Medien."}	3	7	2	\N	regierungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9245	republik	{republic}	{"Deutschland ist eine parlamentarische Republik mit einem Bundespräsidenten.","Viele Republiken kämpfen um die Balance zwischen Freiheit und Sicherheit."}	3	7	2	\N	republiken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9246	russlanddeutsche	{German-Russian}	{"Viele Russlanddeutsche kehrten nach Deutschland zurück, nachdem die Sowjetunion zerfiel.","Die Kultur der Russlanddeutschen ist eine Mischung aus deutschen und russischen Traditionen."}	3	7	5	\N	russlanddeutschen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9247	staat	{state}	{"Jeder Staat hat eigene Gesetze, die die Bürger befolgen müssen.","Kleine Staaten haben oft weniger Einfluss in internationalen Organisationen."}	3	7	1	\N	staaten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9248	staatsgründung	{"formation of a state"}	{"Die Staatsgründung Israels 1948 war ein historischer Moment für das jüdische Volk.","Die Staatsgründung der BRD markierte einen Neuanfang nach dem Krieg."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9249	stipendium	{scholarship}	{"Dank eines Stipendiums konnte sie ihr Studium im Ausland finanzieren.","Stipendien fördern begabte Studenten, unabhängig von ihrem Einkommen."}	3	7	3	\N	stipendien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9250	tatsächlich	{actual}	{"Tatsächlich war die Arbeitslosigkeit niedriger als erwartet.","Viele glaubten nicht, dass die Wiedervereinigung tatsächlich passieren würde."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9251	teilung	{division}	{"Die Teilung Deutschlands prägte die Politik des 20. Jahrhunderts.","Die Teilung der Aufgaben im Team führte zum Erfolg des Projekts."}	3	7	2	\N	teilungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9252	verdrängen	{"to suppress"}	{"Viele verdrängten die Erinnerungen an den Krieg, um weiterleben zu können.","Große Konzerne verdrängen oft kleine Unternehmen vom Markt."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9253	vereinigen	{"to unite"}	{"1990 gelang es, Ost- und Westdeutschland wieder zu vereinigen.","Die EU versucht, verschiedene Kulturen unter gemeinsamen Werten zu vereinigen."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9254	verfolgen	{"to follow"}	{"Die Polizei verfolgte den Verdächtigen, bis sie ihn verhaften konnte.","Sie verfolgt seit Jahren das Ziel, als Astronautin ins Weltall zu fliegen."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9255	verhaften	{"to arrest"}	{"Während der Diktatur wurden viele Regierungskritiker verhaftet.","Die Polizei konnte den Dieb schnell verhaften, nachdem Zeugen ihn erkannt hatten."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9256	verlängern	{"to extend"}	{"Das Visum wurde um sechs Monate verlängert, sodass er länger bleiben konnte.","Die Regierung beschloss, die Arbeitslosengeld-Zahlungen zu verlängern."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9257	verlassen	{"to leave"}	{"Viele Auswanderer verließen ihre Heimat, um in einem neuen Staat zu leben.","Man kann sich in einer Demokratie darauf verlassen, dass Wahlen fair sind."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9258	vermischen	{"to mix"}	{"In großen Städten vermischen sich oft Kulturen und Sprachen.","Die Gewürze wurden sorgfältig vermischt, um den perfekten Geschmack zu erreichen."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9259	visum	{visa}	{"Ohne gültiges Visum durfte er nicht in die USA einreisen.","Das Visum für Studenten ermöglichte ihm, zwei Jahre im Ausland zu studieren."}	3	7	3	\N	visa	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9260	weltall	{space}	{"Die Erforschung des Weltalls ist ein Traum vieler Wissenschaftler.","Astronauten berichten oft von ihrem emotionalen Erlebnis im Weltall."}	3	7	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9261	wiedervereinigen	{"to re-unify"}	{"Es dauerte Jahrzehnte, bis sich die beiden Staaten wiedervereinigen konnten.","Die Hoffnung, Familien wiederzuvereinigen, trieb viele politische Entscheidungen an."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9262	wiedervereinigung	{reunification}	{"Die deutsche Wiedervereinigung 1990 war ein historisches Ereignis für Europa.","Die Feier zur Wiedervereinigung fand vor dem Brandenburger Tor statt."}	3	7	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9263	zerschlagen	{"to destroy"}	{"Der Konflikt zerschlug die Hoffnung auf eine friedliche Lösung.","Nach dem Krieg wurde die Industrie des Landes fast vollständig zerschlagen."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9264	zurückkehren	{"to return"}	{"Nach Jahren im Ausland kehrte sie in ihre Heimat zurück, um ihre Familie zu sehen.","Viele Flüchtlinge hoffen, irgendwann sicher in ihr Land zurückzukehren."}	3	7	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9265	abschicken	{"to submit"}	{"Sie muss das Antragsformular bis morgen abschicken, sonst verpasst sie die Frist.","Nachdem er den Brief abgeschickt hatte, fühlte er sich erleichtert."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9266	abwicklung	{settlement}	{"Die Abwicklung des Vertrags dauerte länger als erwartet, weil Dokumente fehlten.","Für die Abwicklung des Erbes benötigt man oft einen Anwalt."}	3	8	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9267	amtlich	{official}	{"Die amtliche Bestätigung muss beglaubigt sein, um gültig zu sein.","Er trug einen amtlichen Ausweis, um sich bei der Behörde auszuweisen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9268	anerkennen	{"to recognise"}	{"Die Universität erkennt sein ausländisches Diplom leider nicht an.","Seine Leistungen wurden endlich von der Firma anerkannt."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9270	anfang	{beginning}	{"Am Anfang des Kurses waren alle nervös, aber jetzt fühlen sie sich wohl.","Die Anfänge des Projekts waren chaotisch, doch jetzt läuft alles reibungslos."}	3	8	1	\N	anfänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9271	ansteckend	{infectious}	{"Seine gute Laune war so ansteckend, dass alle im Raum lächelten.","Die Krankheit ist hoch ansteckend, deshalb muss man vorsichtig sein."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9272	ausstellen	{"to issue"}	{"Das Bürgeramt wird Ihnen einen neuen Pass innerhalb von zwei Wochen ausstellen.","Das Gesundheitszeugnis kann nur von einem Arzt ausgestellt werden."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9273	bearbeitung	{processing}	{"Die Bearbeitung Ihres Visums kann bis zu sechs Wochen dauern.","Während der Bearbeitung des Antrags können keine Änderungen vorgenommen werden."}	3	8	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9274	beglaubigen	{"to certify"}	{"Die Unterschrift muss von einem Notar beglaubigt werden, um gültig zu sein.","Er ließ seine Zeugnisse beglaubigen, bevor er sie einreichte."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9275	beglaubigung	{certification}	{"Ohne die Beglaubigung der Kopie wird das Dokument nicht akzeptiert.","Die Beglaubigung durch die Botschaft kostet 30 Euro."}	3	8	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9276	bekannte	{acquaintance}	{"Eine Bekannte aus meinem Sprachkurs hat mir beim Übersetzen geholfen.","Er ist kein enger Freund, nur ein Bekannter von der Arbeit."}	3	8	\N	\N	bekannten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9277	benötigen	{"to require"}	{"Für die Anmeldung benötigen Sie einen gültigen Ausweis und eine Meldebescheinigung.","Die Bearbeitung benötigt Geduld, da viele Anträge eingegangen sind."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9278	berufen	{"to appoint"}	{"Der Direktor wurde vom Vorstand berufen, um die Abteilung zu leiten.","Sie fühlte sich berufen, Pflegehelferin zu werden, um Menschen zu helfen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9279	bescheinigen	{"to certify"}	{"Der Arzt bescheinigte ihm, dass er gesundheitlich für den Job geeignet ist.","Die Teilnahme am Kurs wird durch ein Zertifikat bescheinigt."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9280	dran sein	{"to be for it"}	{"Wenn du nicht dran bist, musst du warten, bis dein Name aufgerufen wird.","„Wer ist dran, die Dokumente abzuholen?“ – „Ich glaube, du bist dran!“"}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9281	einreichen	{"to submit"}	{"Sie müssen alle Unterlagen bis Freitag einreichen, sonst verfällt der Anspruch.","Nachdem er die Steuererklärung eingereicht hatte, wartete er auf die Rückmeldung."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9282	enttäuschen	{"to disappoint"}	{"Es enttäuschte ihn sehr, dass sein Antrag abgelehnt wurde.","Sie wollte ihre Eltern nicht enttäuschen und arbeitete hart für das Stipendium."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9284	erhalt	{receipt}	{"Bewahren Sie den Erhalt der Sendung gut auf, falls es Probleme gibt.","Nach dem Erhalt des Briefes kontaktierte sie sofort die Behörde."}	3	8	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9285	erklärung	{explanation}	{"Die Sachbearbeiterin gab eine detaillierte Erklärung zum Ablauf des Verfahrens.","Ohne eine klare Erklärung verstand er die Formalitäten nicht."}	3	8	2	\N	erklärungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9286	erkundigen	{"to enquire"}	{"Er erkundigte sich beim Amt, welche Dokumente er benötigte.","Bevor Sie den Antrag stellen, sollten Sie sich nach den Voraussetzungen erkundigen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9287	fähigkeit	{ability}	{"Seine sprachlichen Fähigkeiten halfen ihm, schnell Freunde zu finden.","Die Fähigkeit, geduldig zu sein, ist in diesem Job sehr wichtig."}	3	8	2	\N	fähigkeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9288	fantasie	{phantasy}	{"Kinder haben eine lebhafte Fantasie, die man fördern sollte.","Ohne Fantasie wären viele Erfindungen nie entstanden."}	3	8	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9289	formalität	{formality}	{"Die Formalitäten bei der Visa-Beantragung können sehr zeitaufwendig sein.","Es ist nur eine Formalität – unterschreiben Sie bitte hier."}	3	8	2	\N	formalitäten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9283	enttäuschung	{disappointment}	{"Die Enttäuschung über die Lieferverzögerung war groß.","Seine Enttäuschung war deutlich zu spüren."}	3	8	2	\N	Enttäuschungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9291	fotokopie	{photocopy}	{"Reichen Sie bitte eine Fotokopie Ihres Ausweises zusammen dem Original ein.","Die Fotokopien der Verträge wurden in einer Mappe zusammengestellt."}	3	8	2	\N	fotokopien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9292	frieden	{peace}	{"Nach langen Verhandlungen herrschte endlich Frieden zwischen den Nachbarländern.","Sie zog sich in die Natur zurück, um inneren Frieden zu finden."}	3	8	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9293	führungszeugnis	{"certificate of good conduct"}	{"Für die Arbeitserlaubnis benötigen Sie ein aktuelles Führungszeugnis.","Das Führungszeugnis kann online beantragt und zugeschickt werden."}	3	8	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9294	garantieren	{"to guarantee"}	{"Der Hersteller garantiert eine schnelle Reparatur innerhalb von 24 Stunden.","Wir können leider nicht garantieren, dass alle Unterlagen rechtzeitig bearbeitet werden."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9295	gedanke	{thought}	{"Der Gedanke an die Prüfung ließ ihn nachts nicht schlafen.","Plötzlich kam ihr der Gedanke, dass sie etwas Wichtiges vergessen hatte."}	3	8	1	\N	gedanken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9296	geduld	{patience}	{"Geduld ist eine Tugend, besonders wenn man auf Amtternminate wartet.","Ohne Geduld würde man bei so vielen Formalitäten schnell verzweifeln."}	3	8	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9297	geduldig	{patient}	{"Die Sachbearbeiterin war sehr geduldig und erklärte alles Schritt für Schritt.","Sei geduldig – die Bearbeitung kann einige Tage dauern."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9298	gemeinsamkeit	{"common feature"}	{"Trotz ihrer unterschiedlichen Herkunftsländer fanden sie viele Gemeinsamkeiten.","Eine Gemeinsamkeit aller Kulturen ist der Wunsch nach Frieden."}	3	8	2	\N	gemeinsamkeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9299	geruch	{smell}	{"Der Geruch von frischem Kaffee erinnerte sie an ihre Kindheit.","Ein seltsamer Geruch im Flur ließ sie misstrauisch werden."}	3	8	1	\N	gerüche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9300	gesundheitszeugnis	{"health certificate"}	{"Für die Arbeit in der Küche braucht man ein gültiges Gesundheitszeugnis.","Das Gesundheitszeugnis muss alle zwei Jahre erneuert werden."}	3	8	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9301	gewährleisten	{"to ensure"}	{"Die Firma gewährleistet, dass alle Daten sicher gespeichert werden.","Nur eine gute Vorbereitung kann den Erfolg des Projekts gewährleisten."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9302	häufig	{often}	{"Häufig kommt es zu Verzögerungen, wenn Dokumente unvollständig sind.","Sie besucht häufig das Übersetzungsbüro, um ihre Unterlagen zu beglaubigen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9303	heimweh	{"home sickness"}	{"In den ersten Wochen im Ausland hatte sie starkes Heimweh nach ihrer Familie.","Sein Heimweh verschwand langsam, als er neue Freunde fand."}	3	8	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9304	herkommen	{"to come from"}	{"„Woher kommst du eigentlich?“ – „Ich komme aus Syrien her.“","Viele der Pflegekräfte herkommen aus osteuropäischen Ländern."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9305	herkunftsland	{"country of origin"}	{"Im Herkunftsland der Familie gibt es viele kulturelle Traditionen.","Das Gericht ist typisch für mein Herkunftsland und schmeckt wunderbar."}	3	8	3	\N	herkunftsländer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9306	hierher	{here}	{"Wie bist du eigentlich hierher gekommen? Mit dem Zug oder dem Auto?","Sie lud ihre Bekannten hierher ein, um ihnen ihre neue Wohnung zu zeigen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9308	inzwischen	{meanwhile}	{"Inzwischen hat sie gelernt, die Formalitäten selbstständig zu erledigen.","Er wartete auf die Antwort und las inzwischen ein Buch."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9309	kopie	{copy}	{"Bitte reichen Sie eine Kopie Ihres Abschlusszeugnisses ein.","Die Kopien der Verträge wurden alphabetisch sortiert."}	3	8	2	\N	kopien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9310	mentalität	{mentality}	{"Die Mentalität der Menschen hier ist sehr offen und freundlich.","Arbeitsmoral und Mentalität unterscheiden sich oft zwischen Kulturen."}	3	8	2	\N	mentalitäten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9311	nachdenklich	{thoughtful}	{"Die Absage machte ihn nachdenklich, aber er gab nicht auf.","Sie saß nachdenklich am Fenster und überlegte, was sie tun sollte."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9312	pflegehelfer/in	{"nursing assistant"}	{"Als Pflegehelferin unterstützt sie ältere Menschen im Alltag.","Pflegehelfer müssen einfühlsam und geduldig sein."}	3	8	5	\N	pflegehelfer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9313	pflegekraft	{carer}	{"Die Pflegekräfte in diesem Krankenhaus sind sehr kompetent.","Aufgrund des Personalmangels werden dringend Pflegekräfte gesucht."}	3	8	2	\N	pflegekräfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9314	reihe	{row}	{"In der Reihe vor dem Schalter warteten bereits zehn Menschen.","Die Dokumente lagen ordentlich in einer Reihe auf dem Tisch."}	3	8	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9567	vegan	{vegan}	{"Vegane Ernährung erfordert Planung, um alle Nährstoffe abzudecken.","Immer mehr Restaurants bieten vegane Optionen an."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9290	förmlich	{formal}	{"Förmliche E-Mails enthalten eine Anrede und Grußformel.","In Behörden ist der Ton oft förmlich."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9315	sachbearbeiter/in	{"administrative assistant"}	{"Der Sachbearbeiter prüfte die Unterlagen sorgfältig auf Vollständigkeit.","Die Sachbearbeiterin erklärte mir, welche Formulare ich benötige."}	3	8	5	\N	sachbearbeiter/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9316	sprachnachweis	{"language certificate"}	{"Für das Studium benötigen Sie einen offiziellen Sprachnachweis wie das Goethe-Zertifikat.","Ohne einen gültigen Sprachnachweis kann die Bewerbung nicht berücksichtigt werden."}	3	8	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9317	übereinstimmen	{"to correspond"}	{"Die Angaben in den Dokumenten müssen genau übereinstimmen, sonst gibt es Probleme.","Seine Version der Geschichte stimmt nicht mit ihrer überein."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9318	überglücklich	{overjoyed}	{"Sie war überglücklich, als sie die Zusage für das Stipendium erhielt.","Überglücklich rief er seine Familie an, um die gute Nachricht mitzuteilen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9319	übersetzen	{"to translate"}	{"Er übersetzte den Vertrag ins Deutsche, weil die Firma keinen Übersetzer hatte.","Können Sie diesen Satz für mich vom Englischen ins Arabische übersetzen?"}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9320	übersetzung	{translation}	{"Die Übersetzung des Dokuments muss von einem zertifizierten Büro beglaubigt werden.","Fehler in der Übersetzung können zu Missverständnissen führen."}	3	8	2	\N	übersetzungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9322	ungeduldig	{impatient}	{"Nach einer Stunde Wartezeit wurde er ungeduldig und fragte nach dem Status.","Ungeduldig tippte er mit den Fingern auf den Tisch."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9323	vermissen	{"to miss"}	{"Sie vermisste ihre Familie sehr, als sie zum ersten Mal im Ausland lebte.","Was vermisst du am meisten aus deinem Herkunftsland?"}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9324	verurteilen	{"to judge"}	{"Der Richter verurteilte den Angeklagten zu einer Geldstrafe.","Man sollte niemanden vorschnell verurteilen, ohne die Fakten zu kennen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9325	wahr	{true}	{"Es ist wahr, dass die Bearbeitungszeit manchmal sehr lang ist.","Sie konnte kaum glauben, dass die gute Nachricht wahr war."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9326	weitergehen	{"to continue"}	{"Nach der Pause ging die Sachbearbeiterin mit der Prüfung der Unterlagen weiter.","„Können wir bitte weitergehen? Wir haben noch viel zu erledigen.“"}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9327	wohlfühlen	{"to feel comfortable"}	{"Er fühlte sich in der neuen Stadt schnell wohl, obwohl er Heimweh hatte.","In einer förmlichen Umgebung kann ich mich nicht richtig wohlfühlen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9328	ziel	{aim}	{"Sein Ziel war es, ohne Hilfe alle Formalitäten zu bewältigen.","Das Hauptziel des Projekts ist die Vereinfachung der Abwicklung."}	3	8	3	\N	ziele	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9329	zügig	{quick}	{"Die Bearbeitung des Antrags verlief zügig, sodass er schon nach drei Tagen eine Antwort erhielt.","Bitte arbeiten Sie zügig, wir haben nur begrenzt Zeit."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9330	zusammenstellen	{"to put together"}	{"Er stellte alle benötigten Dokumente in einer Mappe zusammen.","Das Übersetzungsbüro hilft dabei, die Unterlagen für die Visa-Beantragung zusammenzustellen."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9331	abhängig	{dependent}	{"Seine Anstellung ist abhängig von der erfolgreichen Absolvierung der Probezeit.","Die Software ist abhängig von regelmäßigen Updates, um effizient zu bleiben."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9509	behaupten	{"to claim"}	{"Viele Studien behaupten, dass vegane Ernährung nachhaltiger ist.","Er behauptet, dass er durch Intervallfasten abgenommen hat."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9333	abteilungsleiter/in	{"division manager"}	{"Die Abteilungsleiterin organisierte eine Teamsitzung zur Verbesserung der Arbeitsweise.","Abteilungsleiter müssen sowohl kommunikativ als auch entscheidungsfreudig sein."}	3	9	5	\N	abteilungsleiter/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9334	abwechslungsreich	{varied}	{"Die Stelle als Projektmanagerin ist abwechslungsreich und fordert Kreativität.","Ein abwechslungsreicher Berufsalltag motiviert viele Mitarbeiter."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9335	altenpfleger/in	{"geriatric nurse"}	{"Altenpflegerinnen im Seniorenheim kümmern sich liebevoll um die Bewohner.","Der Beruf des Altenpflegers erfordert Geduld und Einfühlungsvermögen."}	3	9	5	\N	altenpfleger/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9336	anlage	{system}	{"Die technische Anlage im Maschinenbau muss regelmäßig gewartet werden.","In der Bewerbung fügte er eine Anlage mit seinen Zeugnissen bei."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9337	annahme	{acceptance}	{"Die Annahme des Vertrags erfolgte nach einer ausführlichen Prüfung.","Die schnelle Annahme seines Angebots überraschte ihn positiv."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9338	anrechnen	{"to charge"}	{"Seine Berufserfahrung wurde bei der Gehaltsverhandlung angerechnet.","Überstunden können als Urlaubstage angerechnet werden."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9339	anstellung	{employment}	{"Die unbefristete Anstellung gab ihm finanzielle Sicherheit.","Eine Festanstellung ist oft mit sozialen Leistungen verbunden."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9332	absolvieren	{"to complete"}	{"Er absolvierte erfolgreich seine Ausbildung.","Sie hat ein Praktikum im Ausland absolviert."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9340	arbeitsstelle	{position}	{"Sie sucht eine neue Arbeitsstelle in der Telekommunikationsbranche.","Die Arbeitsstelle als Sachbearbeiterin erfordert Genauigkeit."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9341	arbeitsweise	{"working method"}	{"Seine strukturierte Arbeitsweise führt zu effizienten Ergebnissen.","Die agile Arbeitsweise des Teams fördert Innovationen."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9342	arbeitszeit	{"working hours"}	{"Flexible Arbeitszeiten sind in vielen modernen Unternehmen üblich.","Die Arbeitszeiten im Schichtdienst können körperlich anstrengend sein."}	3	9	2	\N	arbeitszeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9343	assistenz	{assistance}	{"Die Assistenz der Geschäftsführung organisiert den täglichen Ablauf.","Ohne die Assistenz des Teams wäre das Projekt nicht möglich gewesen."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9344	aufteilung	{allocation}	{"Die Aufteilung der Aufgaben im Team erfolgte nach Kompetenzen.","Eine klare Aufteilung der Verantwortung vermeidet Konflikte."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9345	auszug	{extract}	{"Im Anschreiben fügte er einen Auszug seines Lebenslaufs bei.","Ein Auszug aus der Gehaltsabrechnung wurde angefordert."}	3	9	1	\N	auszüge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9347	beherrschen	{"to master"}	{"Er beherrscht die englische Sprache fließend, was im internationalen Geschäft wichtig ist.","Um erfolgreich zu sein, muss man die Arbeitsabläufe genau beherrschen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9348	beilegen	{"to enclose"}	{"Bitte legen Sie Ihrer Bewerbung ein aktuelles Führungszeugnis bei.","Dem Schreiben wurde eine Kopie des Vertrags beigelegt."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9349	berufsbezeichnung	{"job description"}	{"In der Stellenanzeige war die Berufsbezeichnung nicht genau angegeben.","Seine offizielle Berufsbezeichnung lautet „Sales Manager“."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9351	berufsleben	{"professional life"}	{"Das Berufsleben bringt sowohl Herausforderungen als auch Chancen mit sich.","Nach dem Studium startete sie voller Motivation ins Berufsleben."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9352	betriebswirtschaft	{"business administration"}	{"Betriebswirtschaft ist ein beliebtes Studienfach mit vielen Spezialisierungen.","Kenntnisse in Betriebswirtschaft sind für Führungspositionen entscheidend."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9353	beurteilen	{"to evaluate"}	{"Die Personalabteilung beurteilt die Bewerber nach ihren Qualifikationen.","Es ist wichtig, Leistungen fair und objektiv zu beurteilen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9354	bewerbungsschreiben	{"letter of application"}	{"Im Bewerbungsschreiben betonte er seine Teamfähigkeit und Zuverlässigkeit.","Ein individuelles Bewerbungsschreiben erhöht die Chancen auf eine Einladung."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9355	bilanzbuchhalter/in	{accountant}	{"Bilanzbuchhalter erstellen monatliche Berichte für die Geschäftsführung.","Die Bilanzbuchhalterin überprüfte die finanziellen Unterlagen sorgfältig."}	3	9	5	\N	bilanzbuchhalter/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9356	bisher	{"until now"}	{"Bisher gab es keine Beschwerden über die Arbeitsweise des Teams.","Er hat bisher alle Projekte termingerecht abgeschlossen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9357	briefpapier	{"letter paper"}	{"Offizielle Schreiben werden auf dem Briefpapier der Firma verfasst.","Das Briefpapier enthielt das Logo und die Kontaktdaten des Unternehmens."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9358	büromaterial	{"office stationary"}	{"Die Bestellung von Büromaterial erfolgt zentral über die Verwaltung.","Ohne ausreichend Büromaterial kann der Arbeitsalltag nicht reibungslos laufen."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9359	bürozeit	{"office hours"}	{"Die Bürozeiten sind von 8:00 bis 17:00 Uhr, außer freitags.","Außerhalb der Bürozeiten ist das Gebäude geschlossen."}	3	9	2	\N	bürozeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9360	catering	{catering}	{"Das Catering für die Firmenfeier wurde von einem lokalen Anbieter organisiert.","Gutes Catering trägt zur Zufriedenheit der Konferenzteilnehmer bei."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9361	daneben	{besides}	{"Daneben arbeitet er als freiberuflicher Übersetzer für ein Übersetzungsbüro.","Hauptberuflich ist sie Lehrerin, daneben schreibt sie Fachartikel."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9362	eigenverantwortlich	{independent}	{"In der Position arbeitet sie eigenverantwortlich und trifft eigene Entscheidungen.","Eigenverantwortliches Handeln wird in diesem Job vorausgesetzt."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9363	eingehen	{"to enter"}	{"Das Unternehmen geht eine strategische Partnerschaft mit einem Startup ein.","Auf die Bewerbung wird die Personalabteilung in Kürze eingehen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9364	einschreiben	{"to inscribe"}	{"Wichtige Dokumente sollten per Einschreiben versendet werden.","Er ließ den Vertrag einschreiben, um den Erhalt nachzuweisen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9350	berufserfahrung	{"job experience"}	{"Berufserfahrung ist in vielen Jobs Voraussetzung.","Er sammelte Berufserfahrung im Ausland."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9365	eintrittsdatum	{"entry date"}	{"Das Eintrittsdatum im Arbeitsvertrag ist der 1. September.","Bitte bestätigen Sie Ihr gewünschtes Eintrittsdatum per E-Mail."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9366	empfang	{reception}	{"Der Empfang der Kunden erfolgte im modernen Konferenzraum des Firmensitzes.","Am Empfang liegt der Terminkalender für Besprechungen aus."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9367	empfangen	{"to receive"}	{"Die Personalabteilung empfängt täglich zahlreiche Bewerbungsschreiben.","Der Geschäftsführer empfing die internationalen Gäste persönlich."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9368	englischsprachig	{"in English"}	{"Die englischsprachige Stellenanzeige richtet sich an internationale Bewerber.","In globalen Unternehmen ist englischsprachige Kommunikation Standard."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9369	entnehmen	{"to take from"}	{"Die genauen Konditionen können Sie dem beigefügten Vertragsentwurf entnehmen.","Bitte entnehmen Sie die Details der Anlage im Schreiben."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9370	erstellung	{creation}	{"Die Erstellung des Geschäftsberichts dauerte mehrere Wochen.","Für die Erstellung der Bewerbungsunterlagen nutzte sie eine Vorlage."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9371	färben	{"to colour"}	{"Sie färbte ihre Haare für ein professionelleres Erscheinungsbild.","In der Textilindustrie werden Stoffe mit umweltfreundlichen Farben gefärbt."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9372	fax	{fax}	{"Trotz moderner Technik wird in einigen Behörden noch per Fax kommuniziert.","Das Fax mit den Unterschriften wurde an die Geschäftsführung gesendet."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9373	festanstellung	{"full-time position"}	{"Nach der erfolgreichen Probezeit erhielt er eine Festanstellung.","Eine Festanstellung bietet mehr Planungssicherheit als ein befristeter Vertrag."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9374	festlegen	{"to determine"}	{"Die Geschäftsführung legte klare Ziele für das nächste Quartal fest.","Der genaue Zeitpunkt der Schulung muss noch festgelegt werden."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9375	finanziell	{financial}	{"Die finanzielle Vergütung entsprach seinen Gehaltsvorstellungen.","Ein stabiles Einkommen ist für viele eine wichtige finanzielle Sicherheit."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9376	finanzwesen	{finance}	{"Er arbeitet im Finanzwesen einer großen Bank und betreut Kundendepots.","Kenntnisse im Finanzwesen sind für Steuerberater unverzichtbar."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9377	firmensitz	{"registered office"}	{"Der Firmensitz befindet sich in Berlin, aber die Niederlassungen sind weltweit.","Die Adresse des Firmensitzes ist auf dem Briefpapier vermerkt."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9378	fließend	{fluent}	{"Sie spricht fließend Englisch und Spanisch, was im internationalen Handel vorteilhaft ist.","Fließende Deutschkenntnisse sind für die Stelle in der Verwaltung erforderlich."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9379	föhn	{hairdryer}	{"Im Hotelzimmer stehen den Gästen ein Föhn und weitere Hygieneartikel zur Verfügung.","Der Föhn im Badezimmer des Büros ist defekt und muss repariert werden."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9380	fordern	{"to demand"}	{"Die Stelle fordert hohe Kommunikationsstärke und eigenverantwortliches Arbeiten.","Kunden fordern oft schnelle Lieferzeiten und qualitativ hochwertige Produkte."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9381	formulierung	{wording}	{"Die Formulierung im Arbeitsvertrag wurde juristisch geprüft.","Eine präzise Formulierung der E-Mails vermeidet Missverständnisse."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9383	frisur	{hairdresser}	{"Eine gepflegte Frisur hinterlässt im Vorstellungsgespräch einen positiven Eindruck.","Er änderte seine Frisur, um professioneller zu wirken."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9536	glutenfrei	{gluten-free}	{"Glutenfreies Brot ist für Menschen mit Zöliakie unverzichtbar.","Immer mehr Bäckereien bieten glutenfreie Backwaren an."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9385	geschäftsführer/in	{"managing director"}	{"Die Geschäftsführerin präsentierte die Jahresbilanz vor den Mitarbeitern.","Der Geschäftsführer traf die Entscheidung in Absprache mit dem Vorstand."}	3	9	5	\N	geschäftsführer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9386	geschäftsführung	{management}	{"Die Geschäftsführung genehmigte das Budget für das neue Projekt.","Ein Treffen mit der Geschäftsführung ist für nächste Woche geplant."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9387	gleichzeitig	{"at the same time"}	{"Gleichzeitig mit der E-Mail erhielt er eine schriftliche Einladung zum Vorstellungsgespräch.","Sie arbeitet gleichzeitig an zwei Projekten, was ihre Zeitmanagementfähigkeiten fordert."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9388	handlung	{conduct}	{"Seine professionelle Handlung in der Krise stärkte das Vertrauen der Kollegen.","Die Handlung des Mitarbeiters entsprach nicht den ethischen Richtlinien des Unternehmens."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9384	gehaltsvorstellung	{"desired salary"}	{"Nennen Sie realistische Gehaltsvorstellungen.","Im Vorstellungsgespräch wurde nach Gehaltsvorstellungen gefragt."}	3	9	2	\N	Gehaltsvorstellungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9389	herausforderung	{challenge}	{"Die neue Rolle ist eine große Herausforderung.","Herausforderungen motivieren ihn im Berufsalltag."}	3	9	2	\N	Herausforderungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9390	individuell	{individual}	{"Jeder Mitarbeiter erhält individuelle Fortbildungsmöglichkeiten.","Individuelle Arbeitszeitmodelle erhöhen die Zufriedenheit im Team."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9391	insofern	{provided}	{"Insofern alle Unterlagen vollständig sind, kann der Vertrag unterschrieben werden.","Die Zusage gilt insofern, als keine unvorhergesehenen Probleme auftreten."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9392	intern	{internal}	{"Die interne Kommunikation erfolgt über eine firmeneigene Plattform.","Interne Schulungen werden regelmäßig für neue Mitarbeiter angeboten."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9393	jobbezeichnung	{"job description"}	{"Die Jobbezeichnung „Sales Manager“ spiegelt die vielfältigen Aufgaben wider.","In der Stellenanzeige fehlte eine klare Jobbezeichnung, was Verwirrung stiftete."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9394	kamm	{comb}	{"Im Badezimmer des Büros liegen Kamm und Handtücher für die Mitarbeiter bereit.","Er benutzte einen Kamm, um seine Haare vor dem Meeting zu richten."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9395	kommunikationsstärke	{"strong communication skills"}	{"Kommunikationsstärke ist in Führungspositionen unverzichtbar.","Die Stellenausschreibung betont die Bedeutung von Kommunikationsstärke im Team."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9396	kommunikativ	{communicative}	{"Ein kommunikativer Umgang mit Kunden stärkt die Geschäftsbeziehungen.","Sie ist sehr kommunikativ und überzeugt in Verhandlungen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9397	konferenzraum	{"conference room"}	{"Der Konferenzraum ist mit moderner Präsentationstechnik ausgestattet.","Die monatliche Teamsitzung findet immer im großen Konferenzraum statt."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9398	kontaktdaten	{"contact details"}	{"Bitte aktualisieren Sie Ihre Kontaktdaten im internen Mitarbeiterportal.","Die Kontaktdaten des Ansprechpartners stehen im Footer der E-Mail."}	3	9	2	\N	kontaktdaten (pl.)	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9399	kümmern	{"to take care of"}	{"Die Assistenz kümmert sich um die Organisation von Dienstreisen.","Im Seniorenheim kümmern sich Pflegekräfte liebevoll um die Bewohner."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9400	leistungsgerecht	{performance-based}	{"Die leistungsgerechte Vergütung motiviert die Mitarbeiter zu Höchstleistungen.","Ein leistungsgerechtes Gehalt spiegelt die Verantwortung der Position wider."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9401	leiten	{"to lead"}	{"Er leitet die Abteilung für Maschinenbau und koordiniert alle Projekte.","Die erfahrene Managerin leitet das Team mit viel Empathie und Fachwissen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9402	manager/in	{manager}	{"Der Manager organisierte ein Workshop zur Verbesserung der Teamfähigkeit.","Als Managerin trägt sie Verantwortung für die Erreichung der Quartalsziele."}	3	9	5	\N	manager/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9404	meistern	{"to master"}	{"Sie meisterte die Herausforderungen der Probezeit mit Bravour.","Um komplexe Projekte zu meistern, ist Teamarbeit unerlässlich."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9405	millionär/in	{millionaire}	{"Durch den Erfolg seines Startups wurde er zum Millionär.","Nicht jeder Millionär lebt extravagant; manche investieren lieber in neue Projekte."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9406	mittelständisch	{middle-class}	{"Mittelständische Unternehmen sind das Rückgrat der deutschen Wirtschaft.","Das Familienunternehmen gehört zum mittelständischen Sektor und existiert seit drei Generationen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9407	nachdem	{after}	{"Nachdem er den Bachelor abgeschlossen hatte, begann er im Finanzwesen zu arbeiten.","Nachdem die Bewerbungsfrist abgelaufen war, begann die Auswahlphase."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9408	niveau	{level}	{"Das fachliche Niveau der Bewerber wurde im Vorstellungsgespräch geprüft.","Die Diskussionen im Team zeichnen sich durch ein hohes intellektuelles Niveau aus."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9537	grundsätzlich	{basically}	{"Grundsätzlich esse ich kein rotes Fleisch, nur manchmal Geflügel.","Sie ist grundsätzlich gegen Massentierhaltung."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9409	original	{original}	{"Bitte reichen Sie das Original Ihres Abschlusszeugnisses zur Beglaubigung ein.","Das Originaldokument muss für die Vertragsunterzeichnung vorgelegt werden."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9410	pc	{PC}	{"Jeder Arbeitsplatz ist mit einem leistungsstarken PC ausgestattet.","Die IT-Abteilung aktualisiert regelmäßig die Software auf allen PCs."}	3	9	1	\N	pcs	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9411	posteingang	{inbox}	{"Täglich überprüft sie ihren Posteingang auf neue Bewerbungen.","Der Posteingang war voll mit unerledigten Anfragen von Kunden."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9414	regeln	{"to control"}	{"Der Vertrag regelt die genauen Arbeitszeiten und Urlaubsansprüche.","Die Geschäftsführung regelt interne Konflikte durch klare Kommunikation."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9412	probezeit	{"probationary period"}	{"Die Probezeit dauert in der Regel sechs Monate.","Während der Probezeit kann schneller gekündigt werden."}	3	9	2	\N	Probezeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9403	maschinenbau	{engineering}	{"Deutschland ist führend im Maschinenbau.","Der Maschinenbau exportiert weltweit."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9415	sales manager/in	{"sales manager"}	{"Der Sales Manager ist verantwortlich für die Akquise neuer Kunden.","Als Sales Managerin reist sie häufig zu internationalen Messen."}	3	9	5	\N	sales manager/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9416	schneiden	{"to cut"}	{"Er schnitt die überflüssigen Passagen aus dem Bericht heraus.","In der Probezeit muss man sich gut schneiden, um eine Festanstellung zu erhalten."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6609	schreiben	{"write (you write)"}	{"Das Schreiben der Geschäftsführung wurde an alle Mitarbeiter verteilt.","Offizielle Schreiben müssen auf dem Firmenbriefpapier verfasst werden."}	1	25	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9417	seitdem	{"since then"}	{"Seitdem er die Stelle angetreten hat, hat sich die Produktivität des Teams verbessert.","Seitdem sie die Fortbildung absolviert hat, übernimmt sie mehr Verantwortung."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9418	selbstständige	{"self-employed person"}	{"Selbstständige müssen sich eigenverantwortlich um ihre Altersvorsorge kümmern.","Viele Selbstständige schätzen die flexible Arbeitszeit, die der Beruf bietet."}	3	9	\N	\N	selbstständigen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9419	senden	{"to broadcast"}	{"Die Bewerbungsunterlagen wurden per E-Mail an die Personalabteilung gesendet.","Das Unternehmen sendet monatlich einen Newsletter mit internen Updates."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9420	seniorenheim	{"old people's home"}	{"Im Seniorenheim werden täglich Aktivitäten wie Gymnastik und Spiele angeboten.","Altenpflegerinnen im Seniorenheim arbeiten oft in Schichtdiensten."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9421	soweit	{"so far as"}	{"Soweit alle Formalitäten erledigt sind, kann der Vertrag unterzeichnet werden.","Soweit ich weiß, ist die Stelle bereits intern besetzt worden."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9422	speise	{dish}	{"Das Catering bietet eine Auswahl an vegetarischen und veganen Speisen.","In der Firmenkantine gibt es täglich frische Speisen zum Mittagessen."}	3	9	2	\N	speisen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9423	spezialisieren	{"to specialise"}	{"Er spezialisierte sich auf Steuerberatung für mittelständische Unternehmen.","Das Unternehmen spezialisiert sich auf nachhaltige Produkte im Bereich Maschinenbau."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9424	stellenanzeige	{"job advertisement"}	{"Die Stellenanzeige für den Sales Manager wurde in mehreren Jobportalen geschaltet.","In der Stellenanzeige werden fließende Englischkenntnisse und Teamfähigkeit gefordert."}	3	9	2	\N	stellenanzeigen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9425	steuerberater	{"tax consultant"}	{"Der Steuerberater half bei der Erstellung der Jahresbilanz.","Steuerberater müssen sich regelmäßig über Gesetzesänderungen informieren."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9426	steuerberatungsbüro	{"tax consultancy firm"}	{"Das Steuerberatungsbüro befindet sich im Zentrum der Stadt.","In einem Steuerberatungsbüro arbeitet sie als Assistentin und organisiert Termine."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9427	teamfähigkeit	{"ability to work in a team"}	{"Teamfähigkeit ist eine der wichtigsten Soft Skills in modernen Arbeitsumgebungen.","In der Bewerbung betonte er seine Teamfähigkeit durch Beispiele aus vorherigen Projekten."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9428	telekommunikation	{telecommunication}	{"Die Telekommunikationsbranche entwickelt sich rasant durch neue Technologien.","Er arbeitet in der Telekommunikation und ist für die Netzwerksicherheit zuständig."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9429	terminkalender	{"appointment calendar"}	{"Der Terminkalender der Geschäftsführerin ist stets voll mit wichtigen Meetings.","Bitte tragen Sie den Workshop-Termin in Ihren digitalen Terminkalender ein."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9432	umgang	{handling}	{"Der Umgang mit schwierigen Kunden erfordert viel Geduld und Diplomatie.","Sie hat langjährige Erfahrung im Umgang mit komplexen Projekten."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9433	umschulung	{re-training}	{"Die Umschulung zum Fachinformatiker ermöglichte ihm einen Karrierewechsel.","Eine Umschulung kann neue Perspektiven eröffnen, wenn der bisherige Beruf nicht mehr passt."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9565	trend	{trend}	{"Superfoods wie Chia-Samen sind ein aktueller Trend in der Ernährung.","Der Trend zu pflanzlicher Milch nimmt weltweit zu."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9434	unbefristet	{indefinite}	{"Er erhielt einen unbefristeten Arbeitsvertrag nach erfolgreicher Probezeit.","Unbefristete Stellen bieten mehr Sicherheit als befristete Verträge."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7722	unternehmen	{"to undertake"}	{"Das Unternehmen expandiert international und eröffnet neue Niederlassungen.","Mittelständische Unternehmen sind oft flexibler als große Konzerne."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9435	urlaubstag	{"paid leave"}	{"Jeder Mitarbeiter hat Anspruch auf 30 Urlaubstage pro Jahr.","Urlaubstage müssen mindestens zwei Wochen im Voraus beantragt werden."}	3	9	1	\N	urlaubstage	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9436	verabreden	{"to arrange"}	{"Sie verabredeten einen Termin für das Vorstellungsgespräch per E-Mail.","Die Teams verabreden wöchentliche Besprechungen, um den Fortschritt zu besprechen."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9430	traditionsreich	{"steeped in tradition"}	{"Das traditionsreiche Unternehmen feiert sein 100-jähriges Jubiläum.","Traditionsreiche Branchen kämpfen oft mit Modernisierungsdruck."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9438	verstärkung	{enhancement}	{"Das Team sucht Verstärkung durch eine erfahrene Fachkraft im Bereich IT.","Die Verstärkung der Marketingabteilung führte zu einer Steigerung der Umsätze."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9439	weiterhelfen	{"to help out"}	{"Kann mir jemand mit der Erstellung dieser Präsentation weiterhelfen?","Die Kollegen helfen sich gegenseitig weiter, um Deadlines einzuhalten."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9440	weiterleitung	{forwarding}	{"Die Weiterleitung der Bewerbung an die zuständige Abteilung erfolgte sofort.","Bitte bestätigen Sie die Weiterleitung der Unterlagen per E-Mail."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9441	werkzeug	{"work tools"}	{"Qualitativ hochwertige Werkzeuge sind für präzise Arbeiten unverzichtbar.","Das Unternehmen stellt allen Mitarbeitern die notwendigen Werkzeuge zur Verfügung."}	3	9	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9442	zaubern	{"to conjure"}	{"Mit kreativen Ideen zauberte das Team eine Lösung aus der Krise.","Der Designer zauberte aus einfachen Materialien ein beeindruckendes Kunstwerk."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9443	zeitlich	{"on time"}	{"Die Aufgabe muss zeitlich genau eingeplant werden, um Verzögerungen zu vermeiden.","Zeitliche Flexibilität ist in dieser Position aufgrund internationaler Kunden wichtig."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9444	zeitpunkt	{"point in time"}	{"Der optimale Zeitpunkt für die Bewerbung ist nach Abschluss des Studiums.","Bitte teilen Sie uns Ihren gewünschten Zeitpunkt für das Vorstellungsgespräch mit."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9445	zusätzlich	{additional}	{"Zusätzlich zum Gehalt erhalten Mitarbeiter eine leistungsabhängige Prämie.","Für diese Aufgabe sind zusätzliche Qualifikationen im Projektmanagement erforderlich."}	3	9	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9446	zusatzqualifikation	{"additional qualifications"}	{"Eine Zusatzqualifikation in Datenanalyse erhöht die Berufschancen deutlich.","Er erwarb Zusatzqualifikationen durch Fortbildungen in Kommunikationstechniken."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9447	zuverlässigkeit	{reliability}	{"Zuverlässigkeit ist eine Grundvoraussetzung für die Arbeit in verantwortungsvollen Positionen.","Seine Zuverlässigkeit macht ihn zu einem geschätzten Kollegen im Team."}	3	9	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9448	abdrehen	{"to change course"}	{"Der Kapitän beschloss, den Kurs abzudrehen, um dem Sturm auszuweichen.","Wir müssen unsere Strategie abdrehen, um langfristig erfolgreich zu sein."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9449	abheften	{"to file away"}	{"Nach dem Meeting heftete sie die Unterlagen im Ordner ab.","Bitte heften Sie die Rechnungen korrekt ab, damit wir sie später finden."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9450	allerdings	{however}	{"Ich würde gerne helfen, allerdings habe ich heute keine Zeit.","Das Projekt ist gut geplant, allerdings fehlen noch die Genehmigungen."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9451	anmachen	{"to turn on"}	{"Kannst du bitte das Licht anmachen? Es ist zu dunkel hier.","Er machte den Computer an, um mit der Arbeit zu beginnen."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9452	ansehen	{"to look at"}	{"Sie sah sich das Gemälde genau an, um die Details zu erkennen.","Kannst du dir bitte dieses Problem ansehen? Ich finde keine Lösung."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9453	aufdrehen	{"to open"}	{"Dreh bitte den Wasserhahn auf, ich möchte mir die Hände waschen.","Im Winter sollte man die Heizung nicht zu stark aufdrehen, um Kosten zu sparen."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9454	aufmachen	{"to open"}	{"Kannst du das Fenster aufmachen? Es ist stickig hier.","Die Läden machen um 9 Uhr morgens auf."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9455	ausschalten	{"to turn off"}	{"Vergiss nicht, den Fernseher auszuschalten, bevor du gehst.","Nach der Arbeit schaltet sie immer den Computer aus."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9456	ausschlafen	{"to sleep in"}	{"Am Wochenende schlafe ich gerne aus, um mich zu erholen.","Heute konnte ich endlich mal ausschlafen, weil ich frei habe."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9457	besprechungszimmer	{"meeting room"}	{"Das Besprechungszimmer ist bereits für die Präsentation vorbereitet.","Wir haben das Besprechungszimmer reserviert, um über das Projekt zu diskutieren."}	3	10	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9458	büroalltag	{"office life"}	{"Der Büroalltag kann manchmal monoton sein, aber Teamarbeit hilft.","Im Büroalltag ist es wichtig, Pausen einzulegen."}	3	10	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9459	büroassistent/in	{"office assistant"}	{"Die Büroassistentin organisierte die Termine des Managers.","Ein guter Büroassistent muss multitaskingfähig sein."}	3	10	5	\N	büroassistenten/büroassistentinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9460	büroraum	{"office space"}	{"Die Firma mietet zusätzliche Büroräume für das neue Team.","Der Büroraum ist modern eingerichtet und hat viel Tageslicht."}	3	10	1	\N	büroräume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9461	dienstleistung	{service}	{"Unsere Dienstleistung umfasst auch Reparaturen.","Qualitativ hochwertige Dienstleistungen sind teuer."}	3	10	2	\N	Dienstleistungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9463	einschalten	{"to turn on"}	{"Schalt bitte die Kaffeemaschine ein, ich brauche einen Kaffee.","Er schaltete das Radio ein, um die Nachrichten zu hören."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9464	energiekosten	{"energy costs"}	{"Die Energiekosten sind dieses Jahr um 15% gestiegen.","Wir senken die Energiekosten, indem wir LED-Lampen verwenden."}	3	10	2	\N	(pl.)	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9465	energieverschwendung	{"waste of energy"}	{"Geräte im Standby-Modus sind reine Energieverschwendung.","Energieverschwendung zu reduzieren, schont die Umwelt und das Budget."}	3	10	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9466	handwerker/in	{workman}	{"Der Handwerker reparierte das kaputte Fenster in nur einer Stunde.","Handwerkerinnen sind in technischen Berufen immer noch unterrepräsentiert."}	3	10	5	\N	handwerker/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9467	heizkosten	{"heating costs"}	{"Die Heizkosten können durch richtiges Lüften gesenkt werden.","Im Winter machen die Heizkosten einen großen Teil der Nebenkosten aus."}	3	10	2	\N	(pl.)	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9468	indem	{by}	{"Man spart Strom, indem man unnötige Lichter ausschaltet.","Indem wir recyceln, tragen wir zum Umweltschutz bei."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9469	kippen	{"to tilt"}	{"Der Stuhl kippte nach hinten, als er sich zurücklehnte.","Bitte kippe den Mülleimer nicht, sonst fällt alles heraus."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9470	könig/in	{king}	{"Der König hielt eine Rede vor dem versammelten Volk.","In Märchen rettet oft eine Königin oder ein König das Land."}	3	10	5	\N	könige/königinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9471	kopierer	{"copying machine"}	{"Der Kopierer im Büro ist schon wieder kaputt – wir müssen ihn reparieren lassen.","Kannst du mir zeigen, wie man den neuen Kopierer bedient?"}	3	10	1	\N	kopierer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9472	langfristig	{long-term}	{"Langfristig wollen wir unsere CO2-Emissionen auf Null reduzieren.","Eine langfristige Planung gibt dem Team Sicherheit."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9473	mehrmals	{"multiple times"}	{"Ich habe mehrmals versucht, dich anzurufen, aber es ging niemand ran.","Mehrmals pro Woche geht sie nach der Arbeit joggen."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9474	million	{million}	{"Die Stadt hat über eine Million Einwohner und wächst weiter.","Das Startup erhielt eine Investition in Höhe von zwei Millionen Euro."}	3	10	2	\N	millionen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9475	mitdenken	{"to follow a thought"}	{"In einem guten Team sollte jeder mitdenken und Ideen einbringen.","Wenn du im Unterricht mitdenkst, verstehst du den Stoff besser."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9476	offen	{open}	{"Die Tür steht offen, du kannst direkt reingehen.","Wir sind für Vorschläge offen – erzähl uns deine Idee!"}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9477	privatnummer	{"private number"}	{"Gib niemals deine Privatnummer an unbekannte Personen weiter.","Die Kollegin bat darum, ihre Privatnummer nicht im Team zu teilen."}	3	10	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9478	rasieren	{"to shave"}	{"Er rasiert sich jeden Morgen vor dem Frühstück.","Vergiss nicht, dich vor dem Vorstellungsgespräch zu rasieren."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9479	reinigungsfirma	{"cleaning basicUser"}	{"Die Reinigungsfirma kommt dreimal pro Woche, um das Büro zu säubern.","Wir haben eine neue Reinigungsfirma engagiert, die umweltfreundliche Produkte verwendet."}	3	10	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9480	reinigungsvertrag	{"cleaning contract"}	{"Der Reinigungsvertrag läuft noch ein Jahr und kann dann verlängert werden.","Im Reinigungsvertrag sind die genauen Aufgaben festgehalten."}	3	10	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9481	senken	{"to reduce"}	{"Um Kosten zu senken, haben wir auf LED-Beleuchtung umgestellt.","Die Regierung will die Steuern für Familien senken."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9482	stinksauer	{furious}	{"Sie war stinksauer, weil ihr Projekt ohne Absprache abgesagt wurde.","Der Chef war stinksauer über die ständigen Verspätungen des Teams."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9483	strom	{electricity}	{"Während des Sturms fiel der Strom für mehrere Stunden aus.","Unser Strom kommt zu 100% aus erneuerbaren Energien."}	3	10	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9484	stromanbieter	{"electricity provider"}	{"Wir haben den Stromanbieter gewechselt, um Geld zu sparen.","Unser Stromanbieter bietet attraktive Tarife für Ökostrom an."}	3	10	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9485	stromkosten	{"electricity costs"}	{"Die Stromkosten machen einen großen Teil unserer monatlichen Ausgaben aus.","Durch sparsame Geräte können die Stromkosten deutlich reduziert werden."}	3	10	2	\N	(pl.)	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7422	tropfen	{drops}	{"Der Wasserhahn tropft seit Tagen – wir sollten einen Handwerker rufen.","Nach dem Regen tropfte das Wasser von den Bäumen."}	1	33	1	\N	tropfen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9486	übergeben	{"to be sick"}	{"Ihm wurde so schlecht, dass er sich auf der Toilette übergeben musste.","Nach der langen Autofahrt hatte sie das Gefühl, sich gleich zu übergeben."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9487	unnötig	{unnecessary}	{"Diese Diskussion ist unnötig – wir haben bereits eine Entscheidung getroffen.","Vermeide unnötige Ausgaben, um das Budget einzuhalten."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9488	verbrauch	{use}	{"Der Stromverbrauch im Büro ist seit der Umstellung auf LEDs gesunken.","Unser Wasserverbrauch ist im Sommer höher wegen des Gartens."}	3	10	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8964	verschwenden	{"to disappear"}	{"Verschwende keine Zeit mit unwichtigen Aufgaben – konzentriere dich auf das Wesentliche.","Es ist schade, so viel Papier zu verschwenden."}	3	4	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9489	vertragsende	{"contract end"}	{"Zum Vertragsende müssen wir entscheiden, ob wir verlängern oder kündigen.","Das Vertragsende des Mieters ist am 30. Juni."}	3	10	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9490	vertragsnummer	{"contract number"}	{"Bitte nennen Sie uns Ihre Vertragsnummer, damit wir Sie schnell finden können.","Die Vertragsnummer finden Sie oben rechts auf der Rechnung."}	3	10	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9491	wärme	{warmth}	{"Die Wärme des Kaminfeuers machte den Abend gemütlich.","Im Winter sehne ich mich nach der Wärme des Sommers."}	3	10	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9492	wasserhahn	{tap}	{"Der Wasserhahn in der Küche tropft – wir sollten ihn reparieren lassen.","Dreh bitte den Wasserhahn zu, sonst läuft das Becken über."}	3	10	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9493	weise	{manner}	{"Auf höfliche Weise bat er um eine Gehaltserhöhung.","Die Art und Weise, wie sie das Problem löste, beeindruckte alle."}	3	10	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9494	zudrehen	{"to turn off"}	{"Vergiss nicht, den Gashahn nach dem Kochen zuzudrehen!","Kannst du bitte den Wasserhahn zudrehen? Das Geräusch stört mich."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9495	zumachen	{"to close"}	{"Mach bitte die Tür zu, es zieht hier stark.","Die Läden machen um 18 Uhr zu, also beeil dich!"}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9496	zusammenarbeit	{cooperation}	{"Die Zusammenarbeit zwischen den Abteilungen funktioniert reibungslos.","Gute Zusammenarbeit ist der Schlüssel zum Erfolg jedes Projekts."}	3	10	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9497	zusammenarbeiten	{"to work together"}	{"Wir arbeiten eng mit externen Partnern zusammen, um Innovationen voranzutreiben.","Im Team zusammenzuarbeiten erfordert Respekt und Kommunikation."}	3	10	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9498	abnehmen	{"to lose weight"}	{"Sie möchte abnehmen, indem sie mehr Gemüse isst und regelmäßig Sport treibt.","Der Arzt riet ihm, langsam abzunehmen, um gesund zu bleiben."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9499	achten	{"to be careful"}	{"Achte auf die Zutatenliste, um versteckten Zucker zu vermeiden.","Wir sollten alle darauf achten, weniger Plastik zu verwenden."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9500	allergie	{allergy}	{"Meine Allergie gegen Nüsse macht das Essen im Restaurant manchmal schwierig.","Im Frühling leiden viele Menschen unter einer Pollenallergie."}	3	11	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9501	allergisch	{allergic}	{"Sie ist allergisch auf Milchprodukte und trinkt deshalb laktosefreie Milch.","Er reagiert allergisch auf Erdbeeren, deshalb meidet er sie."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9502	anbau	{cultivation}	{"Der ökologische Anbau von Gemüse schont die Umwelt.","In dieser Region ist der Anbau von Weizen sehr verbreitet."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9503	angewöhnen	{"to get used to"}	{"Ich habe mir angewöhnt, jeden Morgen ein gesundes Frühstück zuzubereiten.","Sie will sich das Rauchen abgewöhnen, um fitter zu werden."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9504	auseinandersetzen	{"to discuss"}	{"In der Schule setzen wir uns mit den Folgen von Fast Food auseinander.","Er möchte sich mehr mit veganer Ernährung auseinandersetzen."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9505	ausgewogen	{balanced}	{"Eine ausgewogene Ernährung enthält Vitamine, Proteine und Kohlenhydrate.","Sie versucht, sich ausgewogen zu ernähren, um fit zu bleiben."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9506	ausprobieren	{"to try"}	{"Ich möchte neue glutenfreie Rezepte ausprobieren, weil ich Zöliakie habe.","Hast du schon mal vegetarische Alternativen zu Fleisch ausprobiert?"}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9507	bedenklich	{questionable}	{"Der hohe Zusatzstoffgehalt in Fertiggerichten ist bedenklich.","Es ist bedenklich, wie viel Zucker in Kindergetränken steckt."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9508	bedingung	{condition}	{"Eine Bedingung für die Teilnahme am Kurs ist der Verzicht auf Alkohol.","Unter welchen Bedingungen wird Bio-Gemüse angebaut?"}	3	11	2	\N	bedingungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9510	berufstätigkeit	{"professional activity"}	{"Wegen ihrer Berufstätigkeit hat sie wenig Zeit zum Kochen.","Eine ausgewogene Work-Life-Balance ist bei stressiger Berufstätigkeit wichtig."}	3	11	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9511	bevölkerung	{population}	{"Ein Großteil der Bevölkerung leidet unter Bewegungsmangel.","Die ältere Bevölkerung achtet oft stärker auf gesunde Ernährung."}	3	11	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9512	bewusst	{conscious}	{"Er kauft bewusst regionale Produkte, um die Umwelt zu schonen.","Bewusstes Essen hilft, Heißhunger zu vermeiden."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9513	bio	{organic}	{"Bio-Eier kommen von Hühnern, die artgerecht gehalten werden.","Immer mehr Menschen kaufen bio, obwohl es teurer ist."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9514	bioprodukt	{"organic produce"}	{"Bioprodukte erkennt man am EU-Bio-Siegel auf der Verpackung.","Der Markt verkauft frische Bioprodukte aus der Region."}	3	11	3	\N	bioprodukte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9515	bloß	{purely}	{"Bloß kein Fleisch! Sie ernährt sich ausschließlich vegan.","Das Gericht besteht bloß aus drei Zutaten, schmeckt aber fantastisch."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9516	diabetiker/in	{diabetic}	{"Diabetiker müssen ihren Blutzuckerspiegel regelmäßig überprüfen.","Als Diabetikerin verzichtet sie auf zuckerhaltige Getränke."}	3	11	5	\N	diabetiker/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9517	döner	{kebab}	{"Ein Döner mit viel Salat und Joghurtsauce ist sein Lieblingsfastfood.","In Berlin gibt es die besten Döner-Buden der Stadt."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9518	durchschnittlich	{average}	{"Der durchschnittliche Kalorienbedarf eines Erwachsenen liegt bei 2000 kcal.","Durchschnittlich isst jeder Deutsche 60 kg Fleisch pro Jahr."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9519	einkommen	{income}	{"Mit einem geringen Einkommen ist gesunde Ernährung oft schwierig.","Das Durchschnittseinkommen beeinflusst die Ernährungsgewohnheiten."}	3	11	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9520	einseitig	{one-sided}	{"Eine einseitige Ernährung kann zu Vitaminmangel führen.","Er kritisiert die einseitige Berichterstattung über vegane Ernährung."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9521	eiweiß	{protein}	{"Eiweiß ist wichtig für den Muskelaufbau und die Regeneration.","Hülsenfrüchte sind eine gute pflanzliche Eiweißquelle."}	3	11	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9522	erkennen	{"to recognise"}	{"Man erkennt gesunde Lebensmittel oft an der kurzen Zutatenliste.","Sie erkannte sofort, dass das Brot glutenfrei war."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9523	ernährung	{nutrition}	{"Eine ausgewogene Ernährung ist die Grundlage für ein gesundes Leben.","In der Schule lernen Kinder viel über gesunde Ernährung."}	3	11	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9524	esser/in	{eater}	{"Schnelle Esser nehmen oft mehr Kalorien zu sich, als sie brauchen.","Als Vegetarierin ist sie eine bewusste Esserin."}	3	11	5	\N	esser/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9525	fertiggericht	{"ready meal"}	{"Fertiggerichte sind praktisch, enthalten aber oft zu viel Salz.","Sie vermeidet Fertiggerichte, um Zusatzstoffe zu reduzieren."}	3	11	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9526	fett	{fat}	{"Zu fettiges Essen kann zu Herzproblemen führen.","Avocados enthalten gesunde Fette, die der Körper braucht."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9527	fix	{quick}	{"Ein fix zubereiteter Salat ist ideal für die Mittagspause.","Fix fertige Smoothies sind eine schnelle Alternative zum Frühstück."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9528	fleischfrei	{meat-free}	{"Fleischfreie Montage sind eine gute Einführung in vegetarische Ernährung.","Immer mehr Restaurants bieten fleischfreie Optionen an."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9529	fleischlos	{vegetarian}	{"Fleischlose Gerichte wie Linseneintopf sind nahrhaft und lecker.","Sie lebt seit fünf Jahren fleischlos und fühlt sich besser."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9530	freundeskreis	{"circle of friends"}	{"In ihrem Freundeskreis kochen alle gerne gemeinsam vegane Gerichte.","Sein Freundeskreis motiviert ihn, gesünder zu leben."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9531	frust	{frustration}	{"Aus Frust aß sie eine ganze Tafel Schokolade – danach bereute sie es.","Frust über die Diät führte dazu, dass er alles hinschmiss."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7498	furchtbar	{terrible}	{"Das Essen schmeckte furchtbar, weil es stark versalzen war.","Sie hatte furchtbaren Durst, nachdem sie Sport gemacht hatte."}	1	35	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9532	gang	{course}	{"Das Menü bestand aus drei Gängen: Vorspeise, Hauptgericht und Dessert.","Beim Italiener bestellte sie nur einen Gang, um Kalorien zu sparen."}	3	11	1	\N	gänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9533	gemüsehändler/in	{greengrocer}	{"Der Gemüsehändler auf dem Markt verkauft frische regionale Produkte.","Sie kauft lieber beim Gemüsehändler als im Supermarkt ein."}	3	11	5	\N	gemüsehändler/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9534	geschmack	{taste}	{"Der Geschmack von frischem Basilikum ist unvergleichlich.","Joghurt ohne Zucker hat einen etwas sauren Geschmack."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9535	getreide	{grain}	{"Vollkorn-Getreide enthält mehr Ballaststoffe als Weißmehl.","Hafer ist ein Getreide, das oft im Müsli verwendet wird."}	3	11	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9538	hartweizen	{"durum wheat"}	{"Hartweizen wird für die Herstellung von Pasta verwendet.","Die Qualität von Pasta hängt vom verwendeten Hartweizen ab."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9539	haselnuss	{hazelnut}	{"Haselnüsse sind eine beliebte Zutat in Schokolade und Gebäck.","Aufgrund ihrer Allergie muss sie Haselnüsse strikt meiden."}	3	11	2	\N	haselnüsse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9540	hauptgrund	{"main reason"}	{"Der Hauptgrund für ihre vegane Ernährung ist Tierschutz.","Zeitmangel war der Hauptgrund, warum er oft Fast Food aß."}	3	11	1	\N	hauptgründe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9541	hülsenfrucht	{pulse}	{"Hülsenfrüchte wie Linsen und Bohnen sind reich an Eiweiß.","In der vegetarischen Küche sind Hülsenfrüchte ein Grundnahrungsmittel."}	3	11	2	\N	hülsenfrüchte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9542	industriell	{industrial}	{"Industriell verarbeitete Lebensmittel enthalten oft Konservierungsstoffe.","Die industrielle Landwirtschaft steht wegen Umweltschäden in der Kritik."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9543	institution	{institution}	{"Die Universität ist eine wichtige Institution für Ernährungsforschung.","Krankenhäuser sind Institutionen, die auf gesunde Verpflegung achten sollten."}	3	11	2	\N	institutionen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9544	irgendwelche	{any}	{"Hast du irgendwelche Lebensmittelallergien, die ich kennen sollte?","Gibt es irgendwelche Zutaten, die du nicht magst?"}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9545	irgendwer	{anyone}	{"Irgendwer hat den letzten Joghurt gegessen – jetzt muss ich einkaufen.","Kann irgendwer mir sagen, wo der Bio-Laden ist?"}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9546	kochbuch	{"cookery book"}	{"Im Kochbuch findet sie Inspiration für gesunde Mittagessen.","Dieses vegane Kochbuch enthält über 100 Rezepte ohne Tierprodukte."}	3	11	3	\N	kochbücher	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9547	kulinarisch	{culinary}	{"Berlin bietet eine kulinarische Reise durch Kulturen aus aller Welt.","Die kulinarische Vielfalt Asiens fasziniert viele Food-Blogger."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9548	laktosefrei	{lactose-free}	{"Laktosefreie Milch ist für Menschen mit Laktoseintoleranz geeignet.","Immer mehr Cafés bieten laktosefreien Kaffee an."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9549	laune	{mood}	{"Bei schlechter Laune nascht sie oft Schokolade, um sich zu trösten.","Seine Laune verbesserte sich, als er das leckere Essen roch."}	3	11	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9550	leiden	{"to suffer"}	{"Viele Menschen leiden unter Lebensmittelunverträglichkeiten wie Zöliakie.","Sie leidet darunter, dass es im Dorf keinen Bio-Laden gibt."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9551	massentierhaltung	{"livestock farming"}	{"Massentierhaltung ist ein großes ethisches und ökologisches Problem.","Viele Verbraucher lehnen Massentierhaltung aus moralischen Gründen ab."}	3	11	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9552	milchzucker	{"milk sugar"}	{"Milchzucker (Laktose) kann bei manchen Menschen Verdauungsprobleme verursachen.","Laktosefreie Produkte enthalten keinen Milchzucker."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9553	moralisch	{morally}	{"Aus moralischen Gründen verzichtet sie auf tierische Produkte.","Die Entscheidung für Bio-Fleisch ist für ihn eine moralische Pflicht."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9554	nährstoff	{nutrient}	{"Nährstoffe wie Eisen und Kalzium sind essenziell für den Körper.","Grünes Gemüse ist reich an wichtigen Nährstoffen."}	3	11	1	\N	nährstoffe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9555	nahrungsmittel	{foodstuff}	{"Frische Nahrungsmittel sind gesünder als konservierte Produkte.","In diesem Laden gibt es nur biologisch angebaute Nahrungsmittel."}	3	11	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9556	nebenbei	{incidentally}	{"Nebenbei zu snacken, kann zu unkontrolliertem Essen führen.","Sie erwähnte nebenbei, dass sie jetzt vegan lebt."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9557	nuss	{nut}	{"Nüsse sind ein gesunder Snack, aber auch kalorienreich.","Aufgrund ihrer Allergie muss sie alle Nüsse meiden."}	3	11	2	\N	nüsse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9558	präsentieren	{"to present"}	{"Der Koch präsentierte das Gericht mit viel Kreativität auf dem Teller.","Auf der Messe wurden neue Bio-Produkte präsentiert."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9559	problemlos	{unproblematic}	{"Das Rezept ist problemlos und in 20 Minuten zubereitet.","Man kann problemlos vegan leben, wenn man sich informiert."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9560	quark	{quark}	{"Quark ist eine proteinreiche Zutat für Frühstück und Desserts.","Sie mischt Quark mit Früchten für ein gesundes Dessert."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9561	reduzieren	{"to reduce"}	{"Sie reduziert ihren Fleischkonsum, um die Umwelt zu schonen.","Zucker in Rezepten kann man oft um die Hälfte reduzieren."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9562	studie	{study}	{"Eine Studie zeigte, dass mediterrane Ernährung herzgesund ist.","Laut neuer Studien ist zu viel Salz ungesund."}	3	11	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9563	tiefkühlpizza	{"frozen pizza"}	{"Tiefkühlpizza ist praktisch, aber oft voller Zusatzstoffe.","Er isst selten Tiefkühlpizza, weil er frisch kocht."}	3	11	2	\N	tiefkühlpizzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9564	tierisch	{animalistic}	{"Tierische Produkte wie Milch und Eier sind umstritten.","Vegane Ernährung verzichtet komplett auf tierische Inhaltsstoffe."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9566	überzeugen	{"to convince"}	{"Die Geschmacksprobe überzeugte ihn, mehr Bio-Produkte zu kaufen.","Sie ließ sich vom Nutzen einer veganen Ernährung überzeugen."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9568	veganer/in	{vegan}	{"Veganer verzichten nicht nur auf Fleisch, sondern auf alle Tierprodukte.","Als Veganerin kauft sie nur pflanzliche Lebensmittel ein."}	3	11	5	\N	veganer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9569	vereinbar	{compatible}	{"Ist eine Low-Carb-Diät mit einem aktiven Lebensstil vereinbar?","Sein Beruf ist kaum mit seiner veganen Überzeugung vereinbar."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9570	versorgen	{"to provide for"}	{"Supermarktketten versorgen die Bevölkerung mit Grundnahrungsmitteln.","Sie versorgt ihre Familie täglich mit frisch gekochtem Essen."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9571	vertragen	{"to tolerate"}	{"Nicht jeder verträgt scharfes Essen gleich gut.","Sein Magen verträgt keine frittierten Speisen mehr."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9572	verzehr	{consumption}	{"Der Verzehr von rohem Fisch erfordert höchste Hygiene.","Übermäßiger Verzehr von Zucker kann zu Diabetes führen."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9573	verzichten	{"to avoid"}	{"Sie verzichtet seit einem Jahr komplett auf Alkohol.","Auf Plastik zu verzichten, ist gut für die Umwelt."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9574	vorbeigehen	{"to walk past"}	{"Jeden Morgen geht sie am Bio-Bauernhof vorbei und kauft ein.","Er konnte nicht am Dönerstand vorbeigehen, ohne hungrig zu werden."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9575	wert	{value}	{"Der Nährwert von frischem Obst ist höher als der von Saft.","Sie legt großen Wert auf nachhaltig produzierte Lebensmittel."}	3	11	1	\N	werte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9576	wurst	{sausage}	{"Wurst enthält oft viel Fett und sollte in Maßen gegessen werden.","Vegetarische Wurst aus Soja ist eine beliebte Alternative."}	3	11	2	\N	würste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9577	zeitmangel	{"lack of time"}	{"Wegen Zeitmangel greift er oft zu Fertiggerichten.","Zeitmangel ist keine Ausrede für ungesunde Ernährung."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9578	zeitungsbericht	{"report in the newspaper"}	{"Ein Zeitungsbericht enthüllte Skandale in der Lebensmittelindustrie.","Laut einem Zeitungsbericht ist Zucker schädlicher als gedacht."}	3	11	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9579	zufällig	{incidentally}	{"Sie traf zufällig eine Freundin im Bio-Supermarkt.","Er entdeckte zufällig ein neues veganes Restaurant."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9580	zunehmen	{"to gain weight"}	{"In den Ferien nimmt er immer ein paar Kilo zu.","Wer viel Fast Food isst, wird schnell zunehmen."}	3	11	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9581	zusatzstoff	{additives}	{"Viele Zusatzstoffe in Lebensmitteln sind bedenklich.","Fertiggerichte enthalten oft unnötige Zusatzstoffe."}	3	11	1	\N	zusatzstoffe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9582	abdecken	{"to cover"}	{"Sie deckte das Auto mit einer Plane ab, um es vor Hagel zu schützen.","Die Versicherung deckt nicht alle Kosten ab, nur Sachschäden."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9583	absichtlich	{intentional}	{"Er hat den Parkplatz absichtlich blockiert, was zu einem Streit führte.","Absichtliches Beschädigen fremder Autos ist strafbar."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9584	anfahren	{"to bump into"}	{"Beim Rückwärtsfahren fuhr sie leicht gegen die Mauer an.","Der Lkw fuhr beim Abbiegen das kleinere Auto an."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9585	ärztlich	{medical}	{"Nach dem Unfall war ärztliche Behandlung notwendig.","Die Versicherung verlangt ein ärztliches Attest für den Schadensfall."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9586	aufkommen	{"to pay"}	{"Die Haftpflichtversicherung kommt für den Schaden am anderen Fahrzeug auf.","Wer muss für die Reparaturkosten aufkommen, wenn kein Versicherungsschutz besteht?"}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9587	ausparken	{"to reverse out"}	{"Beim Ausparken übersah sie das Motorrad und es kam zu einer Kollision.","In engen Parklücken ist vorsichtiges Ausparken wichtig."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9588	außenspiegel	{"wing mirror"}	{"Der Außenspiegel brach ab, als das Auto zu nah am Laternenpfahl vorbeifuhr.","Ohne funktionierende Außenspiegel ist das Fahren gefährlich."}	3	12	1	\N	außenspiegel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9589	autofahrer/in	{"car driver"}	{"Die Autofahrerin blinkte rechtzeitig, um den Spurwechsel anzuzeigen.","Ein rücksichtsloser Autofahrer verursachte den Stau."}	3	12	5	\N	autofahrer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9590	automarke	{"car make"}	{"Toyota ist eine japanische Automarke, die für Zuverlässigkeit bekannt ist.","Welche Automarke bevorzugst du – deutsche oder italienische?"}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9591	autoteil	{"car part"}	{"Ersatzteile für ältere Autoteile sind oft schwer zu finden.","Der Mechaniker tauschte das defekte Autoteil aus."}	3	12	3	\N	autoteile	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9592	autoversicherung	{"car insurance"}	{"Ohne gültige Autoversicherung darf das Fahrzeug nicht angemeldet werden.","Sie verglich mehrere Autoversicherungen, um die günstigste zu finden."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9593	benzin	{petrol}	{"Der Benzinpreis stieg wegen der globalen Krise stark an.","Elektroautos benötigen kein Benzin, sondern Strom."}	3	12	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9594	beschädigen	{"to damage"}	{"Der Sturm beschädigte mehrere parkende Autos durch umherfliegende Äste.","Vorsicht – bei großer Hitze kann sich der Lack beschädigen."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9595	betrunken	{drunk}	{"Betrunken Auto zu führen kann zum Führerscheinentzug führen.","Die Polizei kontrollierte, ob der Fahrer betrunken war."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9596	blinker	{indicator}	{"Vergiss nicht, den Blinker zu setzen, bevor du die Spur wechselst!","Ein defekter Blinker muss sofort repariert werden."}	3	12	1	\N	blinker	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9597	bremsen	{"to brake"}	{"Sie bremste abrupt, als ein Reh auf die Straße sprang.","Bei Glätte sollte man vorsichtig und frühzeitig bremsen."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9598	dach	{roof}	{"Das Dach des Cabriolets lässt sich elektrisch öffnen.","Nach dem Hagelsturm war das Autodach voller Dellen."}	3	12	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9599	diebstahl	{theft}	{"Der Diebstahl des Fahrrads vom Autodach wurde angezeigt.","Eine Kaskoversicherung schützt vor Diebstahl des Fahrzeugs."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9600	dorf	{village}	{"Im Dorf gibt es kaum Parkplätze, besonders an Markttagen.","Die engen Dorfstraßen sind für große SUVs ungeeignet."}	3	12	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9601	einbrechen	{"to break in"}	{"Unbekannte brachen nachts in das Auto ein und stahlen das Radio.","In unsicheren Gegenden brechen Diebe häufiger in Autos ein."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9602	einbrecher/in	{burglar}	{"Die Einbrecher wurden von der Alarmanlage des Autos vertrieben.","Ein Einbrecher beschädigte die Tür, um an die Wertsachen zu kommen."}	3	12	5	\N	einbrecher/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9603	einbruch	{burglary}	{"Nach dem Einbruch ins Auto fehlten Laptop und Navigationsgerät.","Die Polizei untersuchte den Einbruch am Parkplatz."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9604	einparken	{"to pull in"}	{"Das Einparken in der engen Garage gelang ihm erst beim dritten Versuch.","Mit Einparkhilfen fällt das Einparken in moderne Autos leichter."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9605	fahrerseite	{"driver's side"}	{"Die Tür auf der Fahrerseite klemmte nach dem Unfall.","Der Blinker auf der Fahrerseite war defekt."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9606	freiwillige	{volunteer}	{"Freiwillige halfen nach dem Unfall, Glassplitter von der Straße zu entfernen.","Die Freiwilligen organisierten eine Verkehrssicherheitskampagne."}	3	12	\N	\N	freiwilligen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9607	frustriert	{frustrated}	{"Frustriert gab er das Einparken auf und suchte einen anderen Platz.","Die frustrierte Autofahrerin rief den Abschleppdienst."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9608	gebrauchtwagen	{"used vehicle"}	{"Er kaufte einen Gebrauchtwagen mit geringer Kilometerleistung.","Bei Gebrauchtwagen sollte man immer den Motor prüfen lassen."}	3	12	1	\N	gebrauchtwagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9609	haftpflicht	{liability}	{"Die Haftpflicht deckt Schäden an Dritten, aber nicht am eigenen Auto.","Ohne Haftpflichtversicherung darf kein Auto zugelassen werden."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9610	haftpflichtversicherung	{"liability insurance"}	{"Die Haftpflichtversicherung übernahm die Kosten für den Unfallgegner.","Jeder Autobesitzer muss eine Haftpflichtversicherung abschließen."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9611	hagel	{hail}	{"Der Hagel beschädigte die Windschutzscheibe und die Motorhaube.","Nach dem Hagelsturm sahen viele Autos wie Siebe aus."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9612	hügel	{hill}	{"Auf dem Hügel parkte ein Auto mit defekten Bremsen – es rollte zurück.","Die Serpentinenstraße führte steile Hügel hinauf."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9613	kaskoversicherung	{"hull insurance"}	{"Die Kaskoversicherung ersetzt Schäden durch Naturereignisse wie Hagel.","Eine Vollkaskoversicherung ist teurer, aber umfassender."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9614	kilometer	{kilometre}	{"Der Gebrauchtwagen hatte bereits 120.000 Kilometer auf dem Tacho.","Die nächste Tankstelle ist noch zehn Kilometer entfernt."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9615	kofferraum	{"car boot"}	{"Im Kofferraum war kein Platz mehr für den großen Koffer.","Die Diebe durchsuchten den Kofferraum nach Wertgegenständen."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9616	korrekt	{correct}	{"Korrektes Parken vermeidet Knöllchen und Ärger mit anderen Fahrern.","Er verhielt sich korrekt, indem er den Unfall sofort meldete."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9617	krachen	{"to crash"}	{"Es krachte laut, als der Lastwagen mit dem Auto kollidierte.","Das Geräusch des Krachens war im ganzen Viertel zu hören."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9618	kratzer	{scratch}	{"Ein tiefer Kratzer auf der Motorhaube entstand beim Parken.","Die Kratzer an der Stoßstange wurden lackiert."}	3	12	1	\N	kratzer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9619	lenken	{"to steer"}	{"Bei Glatteis lässt sich das Auto schwer lenken.","Er lenkte geschickt durch den dichten Verkehr."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9620	lohnen	{"to pay"}	{"Lohnt sich die Reparatur des alten Motors noch?","Es lohnt sich, frühzeitig eine gute Versicherung zu wählen."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9621	motor	{motor}	{"Der Motor des Neuwagens war extrem leise und effizient.","Bei Überhitzung kann der Motor ernsthaft beschädigt werden."}	3	12	1	\N	motoren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9622	motorhaube	{bonnet}	{"Die Motorhaube war nach dem Unfall verbogen und ließ sich nicht öffnen.","Er hob die Motorhaube an, um den Ölstand zu prüfen."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9623	motorradfahrer/in	{motorcyclist}	{"Der Motorradfahrer trug eine reflektierende Weste für mehr Sichtbarkeit.","Motorradfahrerinnen sind im Straßenverkehr besonders gefährdet."}	3	12	5	\N	motorradfahrer/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9624	nachdenken	{"to think about"}	{"Er dachte lange nach, ob er die teure Reparatur in Kauf nehmen sollte.","Nachdenken über umweltfreundliche Alternativen zum Auto ist wichtig."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9625	neuwagen	{"new vehicle"}	{"Der Neuwagen roch nach Leder und moderner Technik.","Sie entschied sich für einen Neuwagen mit Hybridantrieb."}	3	12	1	\N	neuwagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9626	nummernschild	{"number plate"}	{"Das Nummernschild war schmutzig und kaum lesbar.","Die Polizei notierte das Nummernschild des flüchtigen Fahrzeugs."}	3	12	3	\N	nummernschilder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9627	oldtimer	{"vintage car"}	{"Der Oldtimer aus den 1960er Jahren war auf der Ausstellung der Star.","Oldtimer benötigen spezielle Pflege und Versicherungen."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9628	optimistisch	{optimistic}	{"Trotz des Motorschadens blieb der Fahrer optimistisch.","Sie war optimistisch, dass die Versicherung den Schaden decken würde."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9629	parken	{"to park"}	{"In der Innenstadt ist das Parken zwischen 8 und 18 Uhr kostenpflichtig.","Sie parkte rückwärts ein, um später leichter ausparken zu können."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9630	parklücke	{"parking space"}	{"Die Parklücke war so klein, dass nur ein Smart hineinpasste.","Nach 20 Minuten Suche fand er endlich eine freie Parklücke."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9631	personenschaden	{"personal injury"}	{"Zum Glück gab es beim Auffahrunfall keinen Personenschaden.","Personenschäden müssen sofort der Polizei gemeldet werden."}	3	12	1	\N	personenschäden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9632	ps	{horsepower}	{"Der Sportwagen hat 450 PS und beschleunigt in wenigen Sekunden.","Mehr PS bedeutet nicht automatisch mehr Sicherheit auf der Straße."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9633	quietschen	{"to screech"}	{"Die Bremsen quietschten laut, als der Bus abrupt hielt.","Beim Lenken quietschte das alte Lenkrad unangenehm."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9634	regulieren	{"to regulate"}	{"Die Regierung will die Geschwindigkeit in Wohngebieten stärker regulieren.","Tempolimits regulieren den Verkehrsfluss und erhöhen die Sicherheit."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9635	regulierung	{regulation}	{"Strenge Regulierungen für Abgaswerte gelten seit diesem Jahr.","Die Regulierung von Versicherungsbedingungen schützt Verbraucher."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9636	reifen	{tyre}	{"Winterreifen sind ab Oktober in vielen Regionen Pflicht.","Ein platter Reifen verzögerte die Reise um zwei Stunden."}	3	12	1	\N	reifen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9637	rücklicht	{"tail light"}	{"Das Rücklicht war defekt, weshalb das Auto zur Prüfung musste.","Bei Nebel sollten die Rücklichter immer sauber sein."}	3	12	3	\N	rücklichter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9638	rückscheibe	{"rear window"}	{"Die Rückscheibe war beschlagen, sodass er kaum etwas sah.","Ein Stein traf die Rückscheibe und verursachte einen Riss."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9639	rückwärts	{backwards}	{"Rückwärts aus der Einfahrt zu fahren, erfordert Konzentration.","Der Lieferwagen fuhr rückwärts in eine Parklücke."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9640	rutschen	{"to slide"}	{"Das Auto rutschte auf dem vereisten Asphalt und prallte gegen den Baum.","Bei Nässe rutschen die Reifen leicht, besonders in Kurven."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9641	sachschaden	{"property damage"}	{"Der Sachschaden am geparkten Auto belief sich auf 2.000 Euro.","Die Kaskoversicherung übernimmt Sachschäden durch Naturereignisse."}	3	12	1	\N	sachschäden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9642	schadensfall	{"damage claim"}	{"Im Schadensfall muss die Polizei innerhalb von 24 Stunden informiert werden.","Die Versicherung prüfte den Schadensfall gründlich."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9643	scheibe	{windscreen}	{"Ein Stein schlug gegen die Scheibe und hinterließ einen Sprung.","Die vereiste Scheibe musste erst freigekratzt werden."}	3	12	2	\N	scheiben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9644	scheinwerfer	{headlight}	{"Die Scheinwerfer des alten Wagens waren zu schwach für Nachtfahrten.","Moderne Scheinwerfer passen sich automatisch der Umgebung an."}	3	12	1	\N	scheinwerfer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9645	schläger	{bat}	{"Ein Schläger lag im Kofferraum für den geplanten Baseballausflug.","Der Dieb benutzte einen Schläger, um die Scheibe einzuschlagen."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9646	schwingen	{"to swing"}	{"Er schwang das Auto elegant in die letzte Parklücke.","Die Tür schwang im Wind zu und klemmte den Schlüssel ein."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9647	sinn	{meaning}	{"Welchen Sinn hat es, bei Glatteis zu schnell zu fahren?","Der Sinn der Verkehrsregeln ist der Schutz aller."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9346	bachelor	{"Bachelor's degree"}	{"Er hat einen Bachelor in Informatik.","Der Bachelor dauert sechs Semester."}	3	9	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9648	sportwagen	{"sports car"}	{"Der rote Sportwagen zog alle Blicke auf der Autobahn auf sich.","Sportwagen verbrauchen oft mehr Benzin als normale Autos."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9649	stoßstange	{bumper}	{"Die Stoßstange war nach dem kleinen Unfall leicht verzogen.","Moderne Stoßstangen sind aus Kunststoff und leichter reparierbar."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9650	straßenrand	{roadside}	{"Sie hielt am Straßenrand, um die Reifen zu überprüfen.","Das Auto stand halb auf dem Straßenrand und blockierte den Radweg."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9651	straßenverkehr	{traffic}	{"Im dichten Straßenverkehr ist vorausschauendes Fahren entscheidend.","Der Straßenverkehr nimmt in Ballungsräumen ständig zu."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9652	sturm	{storm}	{"Der Sturm deckte Dächer ab und warf Bäume auf die Straßen.","Wegen des Sturms wurde empfohlen, Autos nicht unter Bäumen zu parken."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9653	suv	{"sport utility vehicle"}	{"Der SUV war perfekt für die Fahrt auf unwegsamem Gelände.","Immer mehr Familien entscheiden sich für einen SUV als Alltagsauto."}	3	12	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9654	teilkaskoversicherung	{"partial coverage insurance"}	{"Die Teilkaskoversicherung deckt Schäden durch Diebstahl und Feuer.","Im Vergleich zur Vollkasko ist die Teilkaskoversicherung günstiger."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9655	überraschen	{"to surprise"}	{"Die Höhe der Reparaturrechnung überraschte den Autobesitzer.","Es überrascht nicht, dass betrunkenes Fahren oft zu Unfällen führt."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9656	überschwemmung	{flood}	{"Die Überschwemmung beschädigte zahlreiche Autos in der Tiefgarage.","Nach der Überschwemmung war der Motor des Wagens komplett zerstört."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9657	umfallen	{"to fall over"}	{"Das Motorrad fiel um, als der Fahrer es auf unebenem Boden abstellte.","Der Lastwagen wäre fast umgefallen, als er scharf bremsen musste."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9658	umso	{"all the (more)"}	{"Je später der Unfall gemeldet wird, umso schwieriger ist die Regulierung.","Umso mehr PS ein Auto hat, desto höher ist oft der Spritverbrauch."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9659	unfall	{accident}	{"Der Unfall auf der Autobahn führte zu einem Stau von zehn Kilometern.","Bei dem Unfall wurden zwei Personen leicht verletzt."}	3	12	1	\N	unfälle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9660	unfallgefahr	{"risk of accident"}	{"Bei Nebel besteht erhöhte Unfallgefahr auf den Autobahnen.","Die Unfallgefahr steigt bei überhöhter Geschwindigkeit deutlich."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9661	verletzen	{"to injure"}	{"Zum Glück wurde niemand bei dem Auffahrunfall verletzt.","Der Airbag verhinderte, dass sich der Fahrer schwer verletzte."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9662	versehentlich	{accidental}	{"Sie trat versehentlich aufs Gas statt auf die Bremse.","Er parkte versehentlich auf einem Behindertenparkplatz."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9663	versichern	{"to insure"}	{"Jeder Autobesitzer muss sein Fahrzeug gesetzlich versichern, bevor es zugelassen wird.","Sie versicherte den Oldtimer gegen Diebstahl und Hagelschäden."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9664	versicherungsberater/in	{"insurance advisor"}	{"Der Versicherungsberater erklärte die Unterschiede zwischen Teil- und Vollkasko.","Viele Versicherungsberaterinnen empfehlen eine Zusatzversicherung für teure Fahrzeuge."}	3	12	5	\N	versicherungsberater/innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9665	versicherungsschutz	{"insurance cover"}	{"Ohne gültigen Versicherungsschutz darf das Auto nicht auf der Straße fahren.","Der Versicherungsschutz gilt erst ab dem Datum der Unterschrift."}	3	12	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9666	verursachen	{"to cause"}	{"Der betrunkene Fahrer verursachte einen schweren Unfall auf der Autobahn.","Ein defekter Blinker kann Missverständnisse im Straßenverkehr verursachen."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9667	vollkaskoversicherung	{"full comprehensive insurance"}	{"Die Vollkaskoversicherung deckt auch Schäden am eigenen Fahrzeug, egal wer schuld ist.","Für Neuwagen lohnt sich eine Vollkaskoversicherung meistens."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9668	vorschreiben	{"to stipulate"}	{"Das Gesetz schreibt vor, dass alle Autos eine Haftpflichtversicherung haben müssen.","Der Vertrag schreibt vor, dass Reparaturen nur in zertifizierten Werkstätten durchgeführt werden dürfen."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9669	vorsichtig	{careful}	{"Bei Glatteis sollte man besonders vorsichtig bremsen und lenken.","Der Fahrer war vorsichtig genug, um den Fußgänger rechtzeitig zu sehen."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9670	wegfahren	{"to drive away"}	{"Nach dem Tanken fuhr er schnell weg, ohne die Tankstelle zu bezahlen – das war ein Fehler.","Sie wollte gerade wegfahren, als sie das quietschende Geräusch am Motor hörte."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7262	flexibel	{flexible}	{"Flexible Arbeitszeiten sind vielen Mitarbeitern wichtig.","Er ist flexibel und passt sich neuen Aufgaben an."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9671	windschutzscheibe	{windscreen}	{"Ein Stein schlug gegen die Windschutzscheibe und hinterließ einen langen Riss.","Die Windschutzscheibe war komplett vereist, sodass sie freigekratzt werden musste."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9672	zulassen	{"to allow"}	{"Die Behörden lassen nur Fahrzeuge mit gültiger Versicherung und TÜV zu.","Es ist nicht erlaubt, Autos ohne Nummernschild zuzulassen."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9673	zusammenstoßen	{"to collide"}	{"Die beiden Autos stießen an der Kreuzung zusammen, weil keiner geblinkt hatte.","Glücklicherweise ist niemand verletzt worden, als die Fahrräder zusammenstießen."}	3	12	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9674	zusatzversicherung	{"additional insurance"}	{"Eine Zusatzversicherung für Mietwagen kann im Urlaub sinnvoll sein.","Er entschied sich für eine Zusatzversicherung, die auch Reifenpannen abdeckt."}	3	12	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9675	arbeitgeber/-in	{employer}	{"Der Arbeitgeber bietet flexible Arbeitszeiten an.","Die Arbeitgeberin leitet das Unternehmen."}	4	37	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9676	architekt/-in	{architect}	{"Der Architekt entwirft moderne Gebäude.","Die Architektin präsentiert den Bauplan."}	4	37	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9677	automechaniker/-in	{"car mechanic"}	{"Der Automechaniker repariert Bremsen.","Die Automechanikerin arbeitet in der Werkstatt."}	4	37	5	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9678	autoproduzent	{"car manufacturer"}	{"Der Autoproduzent stellt Elektroautos her.","VW ist ein bekannter Autoproduzent."}	4	37	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7999	beratung	{counselling}	{"Die Beratung dauert eine Stunde.","Kunden erhalten kostenlose Beratung."}	2	17	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9679	betreuung	{care}	{"Die Betreuung der Kinder ist sicher.","Ältere Menschen benötigen Betreuung."}	4	37	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9680	branche	{industry}	{"Die IT-Branche wächst schnell.","In dieser Branche gibt es viele Jobs."}	4	37	2	\N	branchen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9681	betrieb	{business}	{"Der Betrieb stellt neue Maschinen vor.","Kleine Betriebe sind oft flexibel."}	4	37	1	\N	betriebe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9682	familienbetrieb	{"family business"}	{"Der Familienbetrieb existiert seit 1950.","Familienbetriebe sind persönlicher."}	4	37	1	\N	familienbetriebe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9683	hilfsorganisation	{"aid agency"}	{"Die Hilfsorganisation sammelt Spenden.","Hilfsorganisationen helfen bei Katastrophen."}	4	37	2	\N	hilfsorganisationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9684	internationale unternehmen	{"international company"}	{"Das internationale Unternehmen expandiert.","Internationale Unternehmen haben globale Teams."}	4	37	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9685	lebensmittelbranche	{"food industry"}	{"Die Lebensmittelbranche ist streng reguliert.","In der Lebensmittelbranche arbeiten viele Menschen."}	4	37	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9686	malerbetrieb	{"painting and decorating company"}	{"Der Malerbetrieb streicht das Gebäude.","Malerbetriebe verwenden umweltfreundliche Farben."}	4	37	1	\N	malerbetriebe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9687	soziale bereich	{"social field"}	{"Im sozialen Bereich ist Empathie wichtig.","Soziale Bereiche benötigen mehr Förderung."}	4	37	1	\N	soziale bereiche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9688	beschäftigen	{"to employ"}	{"Die Firma beschäftigt 500 Mitarbeiter.","Er beschäftigt sich mit Forschung."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9042	produzieren	{"to produce"}	{"Die Fabrik produziert täglich 1000 Stück.","Wir produzieren nachhaltige Produkte."}	3	5	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9689	geistig	{intellectual}	{"Geistige Arbeit erfordert Konzentration.","Sie löst gerne geistige Aufgaben."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8084	handwerklich	{manual}	{"Handwerkliche Berufe sind gefragt.","Er hat handwerkliches Geschick."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9690	sozial	{social}	{"Soziale Verantwortung ist wichtig.","Sie arbeitet im sozialen Bereich."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9691	weiterführende schule	{"secondary school"}	{"Nach der Grundschule geht man auf die weiterführende Schule.","Weiterführende Schulen haben unterschiedliche Schwerpunkte."}	4	37	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8366	hauptschule	{"secondary school"}	{"Die Hauptschule endet nach der 9. Klasse.","Viele Schüler wechseln nach der Hauptschule."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8094	mittelschule	{"secondary school"}	{"Die Mittelschule kombiniert verschiedene Bildungswege.","In Bayern heißt sie Mittelschule."}	2	18	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8360	gesamtschule	{"comprehensive school"}	{"Die Gesamtschule fördert alle Schüler.","Gesamtschulen sind in vielen Bundesländern verbreitet."}	2	21	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9692	haupt-/realschulabschluss	{"general/lower secondary school-leaving certificate"}	{"Er hat den Hauptschulabschluss gemacht.","Der Realschulabschluss ermöglicht eine Ausbildung."}	4	37	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9693	abitur	{"school-leaving examination for university admission"}	{"Das Abitur ist anspruchsvoll.","Nach dem Abitur studiert sie Medizin."}	4	37	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9694	mittlere reife	{"secondary school-leaving certificate"}	{"Die Mittlere Reife eröffnet viele Möglichkeiten.","Sie hat die Mittlere Reife mit Auszeichnung bestanden."}	4	37	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9699	(fast) alle	{"(almost) all"}	{"Fast alle Mitarbeiter waren pünktlich.","Alle Schüler bestanden die Prüfung."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9700	die hälfte	{half}	{"Die Hälfte der Angestellten arbeitet remote.","Er trank die Hälfte des Wassers."}	4	37	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9701	ein viertel	{"one quarter"}	{"Ein Viertel der Mitarbeiter ist krank.","Das Meeting dauert ein Viertel der Zeit."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9702	ein drittel	{"one third"}	{"Ein Drittel der Produkte ist defekt.","Sie spart ein Drittel ihres Gehalts."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9703	jeder zehnte	{"one in ten"}	{"Jeder Zehnte nutzt öffentliche Verkehrsmittel.","Nur jeder Zehnte Kunde reklamiert."}	4	37	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9704	ansprechpartner/-in	{"contact person"}	{"Der Ansprechpartner hilft bei Fragen zur Ausbildung.","Die Ansprechpartnerin erklärt die Zugangsvoraussetzungen."}	4	38	5	\N	ansprechpartner/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9705	beratungsstelle	{"advice centre"}	{"Die Beratungsstelle bietet Hilfe bei der Jobsuche.","In der Beratungsstelle gibt es kostenlose Broschüren."}	4	38	2	\N	beratungsstellen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9706	berufspraktikum	{internship}	{"Das Berufspraktikum dauert drei Monate.","Ein Praktikum verbessert die Berufschancen."}	4	38	3	\N	berufspraktika	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9707	duale ausbildung	{"dual training"}	{"Die duale Ausbildung kombiniert Schule und Betrieb.","Viele Handwerker absolvieren eine duale Ausbildung."}	4	38	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9708	fachschule	{"technical college"}	{"Die Fachschule bietet Kurse für Mechatroniker an.","Nach der Ausbildung besucht er eine Fachschule."}	4	38	2	\N	fachschulen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9382	fortbildung	{"further education"}	{"Die Fortbildung findet online statt.","Regelmäßige Fortbildungen sind im IT-Bereich wichtig."}	3	9	2	\N	Fortbildungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9709	meisterprüfung	{"master craftsman's examination"}	{"Die Meisterprüfung ist anspruchsvoll.","Er bereitet sich auf die Meisterprüfung vor."}	4	38	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9710	schichtdienst	{"shift work"}	{"Der Schichtdienst im Krankenhaus ist anstrengend.","Sie arbeitet im Schichtdienst bei einer Fabrik."}	4	38	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9711	staatliche ausbildung	{"state-funded training"}	{"Die staatliche Ausbildung ist kostenlos.","Er absolviert eine staatliche Ausbildung zum Pfleger."}	4	38	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9712	wunschberuf	{"profession of choice"}	{"Mediziner ist ihr Wunschberuf seit der Kindheit.","Leider gibt es im Wunschberuf wenig Stellen."}	4	38	1	\N	wunschberufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9713	zugangsvoraussetzungen (pl)	{"admission requirements"}	{"Die Zugangsvoraussetzungen sind auf der Website.","Ohne Abitur erfüllt er die Zugangsvoraussetzungen nicht."}	4	38	2	\N	zugangsvoraussetzungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9714	einen beruf ausüben	{"to practise a profession"}	{"Er übt seinen Beruf seit 20 Jahren aus.","Ohne Abschluss darf sie den Beruf nicht ausüben."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9715	den berufsabschluss anerkennen lassen	{"to have your vocational qualification recognised"}	{"Sie lässt ihren ausländischen Abschluss anerkennen.","Die Anerkennung des Berufsabschlusses dauert sechs Monate."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9716	finanzielle unterstützung (vom staat) beantragen	{"to apply for financial support (from the state)"}	{"Er beantragt finanzielle Unterstützung für die Ausbildung.","Die Unterstützung vom Staat muss schriftlich beantragt werden."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9717	pflicht sein	{"to be mandatory"}	{"Der Erste-Hilfe-Kurs ist Pflicht für den Führerschein.","Die Teilnahme an der Schulung ist Pflicht."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9718	in der verwaltung arbeiten	{"to work in administration"}	{"Sie arbeitet in der Verwaltung einer Universität.","Verwaltungsjobs erfordern Organisationsfähigkeit."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9719	sich selbstständig machen	{"to become self-employed"}	{"Er möchte sich nach der Ausbildung selbstständig machen.","Viele Handwerker machen sich später selbstständig."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9720	zuständig sein	{"to be responsible"}	{"Die Personalabteilung ist für Bewerbungen zuständig.","Welche Behörde ist hierfür zuständig?"}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9721	schwäche	{weakness}	{"Mathe war immer seine Schwäche.","Jeder Mensch hat Stärken und Schwächen."}	4	38	2	\N	schwächen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9722	stärke	{strength}	{"Teamarbeit ist ihre größte Stärke.","In Bewerbungsgesprächen betont man seine Stärken."}	4	38	2	\N	stärken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9723	belastbar	{resilient}	{"Pflegekräfte müssen psychisch belastbar sein.","Belastbare Mitarbeiter sind in Stresssituationen ruhig."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9724	eigeninitiativ	{"on one’s own initiative"}	{"Eigeninitiative Mitarbeiter werden oft befördert.","Sie handelt eigeninitiativ und löst Probleme schnell."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9307	hilfsbereit	{"ready to help"}	{"Hilfsbereite Kollegen machen das Team stark.","Sie ist immer hilfsbereit und unterstützt andere."}	3	8	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7291	kreativ	{creative}	{"Kreative Lösungen sind in der Werbung gefragt.","Er denkt kreativ und entwickelt neue Ideen."}	1	32	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9725	lernbereit	{"ready to learn"}	{"Lernbereite Azubis haben gute Zukunftschancen.","In der IT-Branche muss man ständig lernbereit sein."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9726	(un-)organisiert	{(dis)organised}	{"Unorganisierte Menschen verpassen oft Termine.","Ein organisierter Arbeitsplatz spart Zeit."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9727	selbstbewusst	{self-assured}	{"Selbstbewusstes Auftreten ist im Vertrieb wichtig.","Sie präsentiert ihre Ideen selbstbewusst."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9728	teamfähig	{"capable of teamwork"}	{"Teamfähige Mitarbeiter stärken das Arbeitsklima.","In Projekten ist Teamfähigkeit unverzichtbar."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9729	tolerant	{tolerant}	{"Tolerantes Verhalten fördert die Zusammenarbeit.","In internationalen Teams muss man tolerant sein."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9730	verantwortungsbewusst	{responsible}	{"Verantwortungsbewusste Mitarbeiter übernehmen Führungsrollen.","Sie handelt stets verantwortungsbewusst."}	4	38	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9269	anerkennung	{recognition}	{"Die Anerkennung ausländischer Abschlüsse dauert oft lange.","Er erhielt eine Auszeichnung für seine berufliche Anerkennung."}	3	8	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9695	berufsabschluss	{"vocational qualification"}	{"Ohne Berufsabschluss findet man schwer einen Job.","Sein Berufsabschluss wird in Deutschland anerkannt."}	4	37	1	\N	Abschlüsse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9731	unterlagen (pl)	{documents}	{"Bitte reichen Sie alle Unterlagen ein.","Die Unterlagen liegen im Ordner bereit."}	4	38	2	\N	unterlagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9732	zulassung	{admission}	{"Die Zulassung zum Studium erfolgt im Sommer.","Ohne Zulassung darf das Medikament nicht verkauft werden."}	4	38	2	\N	zulassungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9733	arbeitsablauf	{workflow}	{"Ein klarer Arbeitsablauf steigert die Effizienz.","Der neue Arbeitsablauf reduziert Fehler."}	4	39	1	\N	arbeitsabläufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9734	fachdeutsch	{"technical German"}	{"Fachdeutsch ist für Ingenieure wichtig.","Der Kurs verbessert ihr Fachdeutsch."}	4	39	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9735	fachleute/fachkräfte (pl)	{professionals}	{"Fachkräfte sind in der IT-Branche gefragt.","Das Projekt benötigt erfahrene Fachleute."}	4	39	\N	\N	fachleute/fachkräfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9736	fachwortschatz	{"specialist vocabulary"}	{"Der Fachwortschatz wird im Training vermittelt.","Ärzte müssen den medizinischen Fachwortschatz beherrschen."}	4	39	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9737	handwerker/-in	{craftsman/craftswoman}	{"Der Handwerker repariert das Dach.","Die Handwerkerin installiert die Küche."}	4	39	5	\N	handwerker/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9738	mint-beruf	{"STEM profession"}	{"MINT-Berufe bieten gute Karrierechancen.","Sie entschied sich für einen MINT-Beruf."}	4	39	1	\N	mint-berufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8123	vollzeit	{full-time}	{"Er arbeitet in Vollzeit als Projektmanager.","Vollzeitjobs erfordern oft Überstunden."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9739	gefragte beruf	{"sought-after profession"}	{"Pflegekräfte sind ein gefragter Beruf.","IT-Spezialisten zählen zu den gefragtesten Berufen."}	4	39	1	\N	gefragte berufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9740	umgang mit kunden	{"dealing with customers"}	{"Der Umgang mit Kunden erfordert Geduld.","Sie hat viel Erfahrung im Umgang mit Kunden."}	4	39	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9741	berechtigung	{authorisation}	{"Die Berechtigung für den Kurs muss beantragt werden.","Ohne Berechtigung ist der Zugang nicht möglich."}	4	39	2	\N	berechtigungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9742	förderung	{funding}	{"Die Förderung des Staates hilft bei der Ausbildung.","Förderungen für Weiterbildungen sind begrenzt."}	4	39	2	\N	förderungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9743	lehrgang	{course}	{"Der Lehrgang dauert sechs Monate.","Sie absolvierte einen Lehrgang in Projektmanagement."}	4	39	1	\N	lehrgänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9744	nachweis über deutschkenntnisse (pl)	{"proof of German language skills"}	{"Ein Nachweis über Deutschkenntnisse ist erforderlich.","Die Deutschkenntnisse müssen durch ein Zertifikat belegt werden."}	4	39	1	\N	nachweise	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9745	vorkenntnisse (pl)	{"prior knowledge"}	{"Vorkenntnisse in Programmierung sind von Vorteil.","Ohne Vorkenntnisse ist der Einstieg schwer."}	4	39	\N	\N	vorkenntnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9746	vermittler/-in	{agent}	{"Der Vermittler hilft bei der Jobsuche.","Die Vermittlerin vermittelt passende Stellen."}	4	39	5	\N	vermittler/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9771	schulbildung	{"school education"}	{"Eine gute Schulbildung ist die Grundlage für den Beruf.","Die Schulbildung variiert je nach Bundesland."}	4	40	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9747	zugangsvoraussetzung	{"admission requirements"}	{"Die Zugangsvoraussetzungen sind auf der Website aufgelistet.","Ohne Sprachzertifikat erfüllen Sie die Zugangsvoraussetzung nicht."}	4	39	2	\N	zugangsvoraussetzungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9748	meisterprüfung machen	{"to take the master craftsman's examination"}	{"Er möchte nächsten Monat die Meisterprüfung machen.","Ohne Ausbildung kann man die Meisterprüfung nicht machen."}	4	39	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9749	persönlich vorbeikommen	{"to come by in person"}	{"Für die Anmeldung müssen Sie persönlich vorbeikommen.","Der Kunde kam persönlich vorbei, um die Unterlagen abzuholen."}	4	39	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9750	sich beruflich neu orientieren	{"to set out in a new professional direction"}	{"Nach der Kündigung orientierte er sich beruflich neu.","Manchmal muss man sich beruflich neu orientieren."}	4	39	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9751	beglaubigte kopie	{"certified copy"}	{"Reichen Sie eine beglaubigte Kopie Ihres Abschlusses ein.","Die beglaubigte Kopie kostet 10 Euro."}	4	39	2	\N	beglaubigte kopien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9752	beglaubigte übersetzung	{"certified translation"}	{"Das Dokument benötigt eine beglaubigte Übersetzung.","Ein Übersetzungsbüro erstellt beglaubigte Übersetzungen."}	4	39	2	\N	beglaubigte übersetzungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9753	berufliche anerkennung beantragen	{"to apply for professional recognition"}	{"Er beantragt die berufliche Anerkennung seines Diploms.","Die Anerkennung muss beim Amt beantragt werden."}	4	39	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9413	qualifikation	{qualification}	{"Sprachkenntnisse sind eine wichtige Qualifikation.","Ohne Qualifikationen findet man keinen Job."}	3	9	2	\N	Qualifikationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9321	übersetzungsbüro	{"translation agency"}	{"Das Übersetzungsbüro übersetzt Verträge ins Deutsche.","Sie arbeitet in einem Übersetzungsbüro."}	3	8	3	\N	Übersetzungsbüros	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9754	einzelunternehmer/-in	{"sole proprietor"}	{"Der Einzelunternehmer verwaltet alles selbst.","Als Einzelunternehmerin trägt sie alle Risiken."}	4	39	5	\N	einzelunternehmer/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9755	geschäftspartner/-in	{"business partner"}	{"Sein Geschäftspartner investiert in das Projekt.","Die Geschäftspartnerin kommt aus Frankreich."}	4	39	5	\N	geschäftspartner/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9756	gut/schlecht anlaufen	{"to start well/badly"}	{"Das neue Geschäft ist gut angelaufen.","Das Projekt ist leider schlecht angelaufen."}	4	39	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9757	freiberufliche tätigkeit	{"freelance work"}	{"Sie übt eine freiberufliche Tätigkeit als Übersetzerin aus.","Freiberufliche Tätigkeiten bieten Flexibilität."}	4	39	2	\N	freiberufliche tätigkeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9758	sich selbständig machen	{"to become self-employed"}	{"Er möchte sich nach der Ausbildung selbständig machen.","Viele Handwerker machen sich später selbständig."}	4	39	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9759	unternehmen/firma gründen	{"to start a company/a firm"}	{"Sie gründete ein Unternehmen im IT-Bereich.","Eine Firma zu gründen erfordert Mut."}	4	39	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9760	bewerbungstraining	{"application training"}	{"Das Bewerbungstraining verbessert die Chancen.","Sie besuchte ein Bewerbungstraining für Absolventen."}	4	39	3	\N	bewerbungstrainings	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9761	spezialisierung	{specialisation}	{"Die Spezialisierung auf IT-Sicherheit ist gefragt.","Eine berufliche Spezialisierung erhöht die Jobchancen."}	4	39	2	\N	spezialisierungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9762	stellengesuch	{"advertisement seeking employment"}	{"Er veröffentlichte ein Stellengesuch online.","Stellengesuche sind in Fachzeitschriften üblich."}	4	39	3	\N	stellengesuche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9764	arbeitssuchende	{"job seeker"}	{"Arbeitssuchende können sich online registrieren.","Die Beratung hilft Arbeitssuchenden bei der Stellensuche."}	4	40	2	\N	arbeitssuchende	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9765	mittelständische unternehmen	{"medium-sized company"}	{"Mittelständische Unternehmen prägen die deutsche Wirtschaft.","Viele mittelständische Unternehmen suchen Fachkräfte."}	4	40	3	\N	mittelständische unternehmen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9766	nach dem aktuellen stand fragen	{"to ask about the current progress (of an application)"}	{"Sie rief an, um nach dem aktuellen Stand zu fragen.","Bewerber dürfen höflich nach dem Stand fragen."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9767	sich an jmdn. wenden	{"to contact someone"}	{"Bei Fragen wenden Sie sich bitte an die Personalabteilung.","Er wandte sich direkt an den Geschäftsführer."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9768	sich auf eine anzeige beziehen	{"to refer to an ad"}	{"In der Bewerbung bezog sie sich auf die Online-Anzeige.","Beziehen Sie sich immer auf die Stellenausschreibung."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9769	sich um eine stelle bewerben	{"to apply for a job"}	{"Er bewirbt sich um eine Stelle im Marketing.","Sie bewarb sich bei fünf Unternehmen."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9770	ehrenamt	{"volunteer work"}	{"Ehrenamtliche Tätigkeiten bereichern den Lebenslauf.","Sie engagiert sich im Ehrenamt bei einer NGO."}	4	40	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9772	besonderen kenntnisse (pl)	{"special knowledge"}	{"Besondere Kenntnisse in Programmierung sind gefragt.","Er hat Kenntnisse im Bereich Projektmanagement."}	4	40	\N	\N	kenntnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9773	berufliche station	{"career stage"}	{"Im Lebenslauf listete er alle beruflichen Stationen auf.","Jede berufliche Station brachte neue Erfahrungen."}	4	40	2	\N	berufliche stationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9774	persönlichen daten (pl)	{"personal information"}	{"Bitte geben Sie Ihre persönlichen Daten korrekt an.","Persönliche Daten müssen geschützt werden."}	4	40	\N	\N	daten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9775	verhandlungssicher	{"business fluent"}	{"Verhandlungssicheres Englisch ist im Export wichtig.","Sie spricht verhandlungssicher Spanisch."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9776	ausgeschriebene stelle	{"advertised position"}	{"Die ausgeschriebene Stelle passt zu ihren Fähigkeiten.","Bewerben Sie sich auf die ausgeschriebene Stelle."}	4	40	2	\N	ausgeschriebene stellen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9777	ein bewerbungsschreiben verfassen	{"to write a letter of application"}	{"Sie verfasste ein überzeugendes Bewerbungsschreiben.","Das Bewerbungsschreiben muss fehlerfrei sein."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9778	für fragen (pl) zur verfügung stehen	{"to be on hand to answer questions"}	{"Der Personalchef steht für Fragen zur Verfügung.","Bei Problemen stehe ich Ihnen gerne zur Verfügung."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9779	den interessen und qualifikationen (pl) entsprechen	{"to match the interests and qualifications"}	{"Die Stelle entspricht ihren Qualifikationen.","Seine Interessen entsprechen den Jobanforderungen."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9780	einen guten eindruck machen	{"to make a good impression"}	{"Sie machte einen guten Eindruck im Vorstellungsgespräch.","Pünktlichkeit macht immer einen guten Eindruck."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9781	eine schwierige situation meistern	{"to master a difficult situation"}	{"Er meisterte die Krise mit Teamwork.","Schwierige Situationen stärken die Kompetenz."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9782	sich nach dem stand der dinge erkundigen	{"to enquire about the progress of an application"}	{"Sie erkundigte sich per E-Mail nach dem Stand.","Höflich nach dem Stand zu fragen, ist üblich."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9783	sich für einen bewerber entscheiden	{"to decide on an applicant"}	{"Das Team entschied sich für die erfahrene Bewerberin.","Die Entscheidung für einen Bewerber fiel schwer."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9784	eine stelle antreten	{"to take up a position"}	{"Er tritt die Stelle am 1. Januar an.","Nach der Probezeit trat sie die Stelle offiziell an."}	4	40	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9785	arbeitsverhältnis	{"employment relationship"}	{"Das Arbeitsverhältnis beginnt mit einem Vertrag.","Ein unbefristetes Arbeitsverhältnis bietet Sicherheit."}	4	40	3	\N	arbeitsverhältnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9786	betriebsgeheimnis	{"trade secret"}	{"Betriebsgeheimnisse dürfen nicht weitergegeben werden.","Der Vertrag schützt sensible Betriebsgeheimnisse."}	4	40	3	\N	betriebsgeheimnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9207	gehalt	{salary}	{"Das Gehalt wird monatlich überwiesen.","Das Gehalt orientiert sich an der Branche."}	3	7	3	\N	Gehälter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9787	kündigungsfrist	{"period of notice"}	{"Die Kündigungsfrist beträgt drei Monate.","Während der Probezeit ist die Kündigungsfrist kürzer."}	4	40	2	\N	kündigungsfristen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9788	lohnfortzahlung	{"sick pay"}	{"Die Lohnfortzahlung im Krankheitsfall ist gesetzlich geregelt.","Nach sechs Wochen endet die Lohnfortzahlung."}	4	40	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9431	überstunde	{overtime}	{"Überstunden werden mit einem Zuschlag vergütet.","Er leistete letzte Woche zehn Überstunden."}	3	9	2	\N	Überstunden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9789	verdienst	{earnings}	{"Der monatliche Verdienst ist verhandelbar.","Hohe Verdienste locken Fachkräfte an."}	4	40	1	\N	verdienste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9437	vergütung	{remuneration}	{"Die Vergütung entspricht der Verantwortung.","Eine transparente Vergütung motiviert Mitarbeiter."}	3	9	2	\N	Vergütungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9790	verschwiegenheitspflicht	{"duty of confidentiality"}	{"Die Verschwiegenheitspflicht gilt für sensible Daten.","Jeder Mitarbeiter unterschreibt die Verschwiegenheitspflicht."}	4	40	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8428	anweisung	{instruction}	{"Bitte folgen Sie den Sicherheitsanweisungen.","Die Anweisung des Chefs war eindeutig."}	2	22	2	\N	Anweisungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9791	gefahrenstelle	{"danger point"}	{"Die Gefahrenstelle ist mit einem Schild markiert.","Arbeiter müssen Gefahrenstellen sofort melden."}	4	41	2	\N	gefahrenstellen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7782	schild	{sign}	{"Das Schild warnt vor Hochspannung.","Schilder im Labor sind oft auf Englisch."}	2	14	3	\N	Schilder	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9792	verbesserungsvorschlag	{"suggestion for improvement"}	{"Sein Verbesserungsvorschlag wurde umgesetzt.","Verbesserungsvorschläge sind immer willkommen."}	4	41	1	\N	verbesserungsvorschläge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9793	zeichen	{sign}	{"Das rote Zeichen bedeutet „Stopp“.","Achten Sie auf Warnzeichen im Labor."}	4	41	3	\N	zeichen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9794	die alarmanlage einschalten	{"to activate the alarm system"}	{"Vor Feierabend muss die Alarmanlage eingeschaltet werden.","Er vergaß, die Alarmanlage einzuschalten."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9795	ätzende säure	{"corrosive acid"}	{"Ätzende Säure erfordert Schutzhandschuhe.","Lagern Sie ätzende Säuren sicher."}	4	41	2	\N	ätzende säuren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9796	das berichtsheft führen	{"to keep the record book"}	{"Auszubildende müssen das Berichtsheft täglich führen.","Das Berichtsheft dokumentiert die Ausbildungsschritte."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9797	brennende material	{"burning material"}	{"Brennende Materialien dürfen nicht mit Wasser gelöscht werden.","Lagern Sie brennbare Materialien separat."}	4	41	3	\N	brennende materialien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9798	ein dokument in der firma auslegen	{"to display a document in the company"}	{"Das Protokoll wird im Pausenraum ausgelegt.","Bitte legen Sie die Sicherheitshinweise aus."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9799	elektrische spannung	{voltage}	{"Elektrische Spannung kann lebensgefährlich sein.","Prüfen Sie die elektrische Spannung vor Arbeiten."}	4	41	2	\N	elektrische spannungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9800	explosive material	{"explosive material"}	{"Explosive Materialien sind streng reguliert.","Nur Fachpersonal darf explosive Materialien handhaben."}	4	41	3	\N	explosive materialien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9801	giftige material	{"toxic material"}	{"Giftige Materialien erfordern Schutzausrüstung.","Die Lagerung giftiger Materialien wird kontrolliert."}	4	41	3	\N	giftige materialien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9802	auf hygiene achten	{"to pay attention to hygiene"}	{"In der Küche muss auf Hygiene geachtet werden.","Hygiene ist in medizinischen Berufen entscheidend."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9803	den kunden/die kundin zur kasse begleiten	{"to accompany the customer to the checkout"}	{"Die Verkäuferin begleitete den Kunden zur Kasse.","Im Luxusgeschäft ist dies üblich."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9804	keine zeit verlieren	{"to lose no time"}	{"Bei einem Notfall darf man keine Zeit verlieren.","Sie verlor keine Zeit und handelte sofort."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9805	die papiere dabeihaben	{"to have the papers with you"}	{"Haben Sie Ihre Arbeitspapiere immer dabeihaben?","Ohne Papiere darf er nicht arbeiten."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9806	quittungen aufheben	{"to keep receipts"}	{"Heben Sie Reisekostenquittungen für die Abrechnung auf.","Quittungen müssen sieben Jahre aufgehoben werden."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9807	rechtzeitig bescheid geben	{"to inform in good time"}	{"Bitte geben Sie rechtzeitig Bescheid, wenn Sie krank sind.","Der Lieferant gab Bescheid über die Verspätung."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9808	einen termin absagen	{"to cancel an appointment"}	{"Sie musste den Termin kurzfristig absagen.","Absagen Sie bitte per E-Mail."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9809	einen termin verlegen	{"to re-schedule an appointment"}	{"Der Arzttermin wurde auf nächste Woche verlegt.","Können wir den Termin auf Freitag verlegen?"}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9810	einen termin übernehmen	{"to attend an appointment"}	{"Die Kollegin übernahm den Termin für ihn.","Können Sie diesen Termin übernehmen?"}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9811	überstunden berechnen	{"to calculate overtime"}	{"Die Software berechnet automatisch Überstunden.","Wie werden Überstunden in Ihrem Betrieb berechnet?"}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9812	krankenschein	{"health insurance certificate"}	{"Der Krankenschein muss dem Arbeitgeber vorgelegt werden.","Ohne Krankenschein gibt es kein Krankengeld."}	4	41	1	\N	krankenscheine	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7386	krankmeldung	{"sick note"}	{"Die Krankmeldung kann online eingereicht werden.","Eine Krankmeldung ist ab dem dritten Tag Pflicht."}	1	33	2	\N	Krankmeldungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9813	schwindel	{dizziness}	{"Plötzlicher Schwindel kann ein Warnsignal sein.","Bei Schwindel sollte man sitzen bleiben."}	4	41	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9814	stromschlag	{"electric shock"}	{"Ein Stromschlag kann tödlich sein.","Er bekam einen leichten Stromschlag."}	4	41	1	\N	stromschläge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8489	übelkeit	{nausea}	{"Übelkeit ist ein häufiges Symptom bei Vergiftungen.","Bei Übelkeit sollte man einen Arzt konsultieren."}	2	22	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9815	einen arzt rufen	{"to call a doctor"}	{"Im Notfall müssen Sie sofort einen Arzt rufen.","Sie rief den Arzt wegen starker Schmerzen."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9816	gesundheitliche probleme (pl) haben	{"to have health problems"}	{"Bei gesundheitlichen Problemen darf man nicht arbeiten.","Er hat seit Jahren gesundheitliche Probleme."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9817	die haut kühlen	{"to cool the skin"}	{"Nach dem Sonnenbrand sollte man die Haut kühlen.","Kühlen Sie die verbrannte Haut sofort."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9818	den rettungsdienst anrufen	{"to call an ambulance"}	{"Bei schweren Verletzungen muss der Rettungsdienst gerufen werden.","Sie rief den Rettungsdienst umgehend."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9819	sich krankmelden	{"to call in sick"}	{"Sie meldete sich am Morgen telefonisch krank.","Bei Grippe muss man sich krankmelden."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9820	die stromquelle abschalten	{"to turn off the power source"}	{"Vor Reparaturen immer die Stromquelle abschalten!","Er schaltete die Stromquelle vorsorglich ab."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9821	die vertretung organisieren	{"to organise a stand-in"}	{"Bei Urlaub muss die Vertretung organisiert werden.","Die Teamleiterin organisierte eine Vertretung."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9822	den unfallbericht schreiben	{"to write the accident report"}	{"Nach dem Vorfall muss ein Unfallbericht geschrieben werden.","Der Sicherheitsbeauftragte schrieb den Unfallbericht."}	4	41	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9823	antibakterielle seife	{"antibacterial soap"}	{"Im Labor wird antibakterielle Seife verwendet.","Händewaschen mit antibakterieller Seife ist wichtig."}	4	41	2	\N	antibakterielle seifen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7526	ordnung	{order}	{"Ordnung am Arbeitsplatz steigert die Produktivität.","Die Kollegin legt großen Wert auf Ordnung."}	1	35	2	\N	ordnungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9824	putzlappen	{"cleaning rag"}	{"Der Putzlappen wird täglich gewechselt.","Verwenden Sie separate Putzlappen für verschiedene Bereiche."}	4	41	1	\N	putzlappen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9825	staubsauger	{"vacuum cleaner"}	{"Der Staubsauger ist im Lagerraum.","Moderne Staubsauger sind leise und effizient."}	4	41	1	\N	staubsauger	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9826	waschbecken	{washbasin}	{"Das Waschbecken im Labor ist rostfrei.","Reinigen Sie das Waschbecken täglich."}	4	41	3	\N	waschbecken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9827	mengenrabatt	{"bulk discount"}	{"Bei großen Bestellungen gewähren wir einen Mengenrabatt.","Der Mengenrabatt beträgt 10 % ab 100 Artikeln."}	4	42	1	\N	mengenrabatte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9828	preisangabe	{quotation}	{"Die Preisangabe erfolgt in Euro.","Bitte senden Sie mir eine schriftliche Preisangabe."}	4	42	2	\N	preisangaben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9830	eine bestellung aufgeben	{"to place an order"}	{"Kunden können die Bestellung online aufgeben.","Er gab die Bestellung telefonisch auf."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9831	eine bestellung durchgeben	{"to transmit an order"}	{"Die Sekretärin gab die Bestellung an die Lieferabteilung durch.","Bitte geben Sie die Bestellung per E-Mail durch."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9832	die buchung bestätigen	{"to confirm the booking"}	{"Das Hotel bestätigte die Buchung per E-Mail.","Bitte bestätigen Sie die Buchung schriftlich."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9833	einen liefertermin abklären	{"to clarify a delivery date"}	{"Wir müssen den Liefertermin mit dem Kunden abklären.","Der Liefertermin wurde für nächsten Montag abgeklärt."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9834	eine offene frage klären	{"to clarify an open question"}	{"Bevor wir unterschreiben, müssen wir die offenen Fragen klären.","Die Unklarheiten wurden im Meeting geklärt."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9835	vereinbarter termin	{"agreed date"}	{"Der vereinbarte Termin muss eingehalten werden.","Wir bestätigen den vereinbarten Termin per E-Mail."}	4	42	1	\N	vereinbarte termine	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8324	vorbeikommen	{"to drop by"}	{"Können Sie morgen im Büro vorbeikommen?","Der Kunde kam persönlich vorbei, um die Unterlagen abzuholen."}	2	20	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9836	am apparat	{speaking}	{"Guten Tag, Herr Müller am Apparat.","„Wer ist am Apparat?“, fragte die Sekretärin."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9837	auf den anrufbeantworter sprechen	{"to leave a message on the answering machine"}	{"Sie sprach ihre Nachricht auf den Anrufbeantworter.","Bitte sprechen Sie nach dem Signalton auf den Anrufbeantworter."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9838	auskunft geben	{"to provide information"}	{"Die Hotline gibt Auskunft zu Öffnungszeiten.","Können Sie mir Auskunft über den Lieferstatus geben?"}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9839	außerhalb der sprechzeit anrufen	{"to call outside office hours"}	{"Bitte rufen Sie nicht außerhalb der Sprechzeit an.","Notrufe können auch außerhalb der Sprechzeit getätigt werden."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9840	bezug nehmen auf	{"to refer to"}	{"In der E-Mail nahm sie Bezug auf das letzte Meeting.","Beziehen Sie sich bitte auf die Vertragsnummer."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9841	in dringenden fällen	{"in urgent cases"}	{"In dringenden Fällen erreichen Sie uns unter der Notrufnummer.","Nur in dringenden Fällen dürfen Sie die Hotline nutzen."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9842	eine kurze rückmeldung geben	{"to give brief feedback"}	{"Bitte geben Sie mir eine kurze Rückmeldung bis morgen.","Der Kunde gab eine positive Rückmeldung."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9829	preisnachlass	{"price reduction"}	{"Bei Barzahlung erhalten Sie einen Preisnachlass.","Der Preisnachlass beträgt 10 Prozent."}	4	42	1	\N	Preisnachlässe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9843	ohne voranmeldung	{"without prior registration"}	{"Der Besuch im Lager ist nur mit Voranmeldung möglich.","Ohne Voranmeldung können wir leider keine Beratung anbieten."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9844	sich wenden an	{"to contact"}	{"Bei Fragen wenden Sie sich bitte an unsere Hotline.","Er wandte sich direkt an den Geschäftsführer."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9845	missverständnis	{misunderstanding}	{"Das Missverständnis wurde schnell aufgeklärt.","Um Missverständnisse zu vermeiden, schreiben Sie bitte klar."}	4	42	3	\N	missverständnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9846	auf beschwerden (pl) reagieren	{"to respond to complaints"}	{"Das Team reagierte professionell auf die Beschwerden.","Schnelles Reagieren auf Beschwerden stärkt das Kundenvertrauen."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9847	auf nachfrage	{"on request"}	{"Die Unterlagen werden auf Nachfrage zugesendet.","Auf Nachfrage erhielt er weitere Informationen."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9848	bescheid geben	{"to inform"}	{"Bitte geben Sie mir Bescheid, sobald die Lieferung eintrifft.","Der Kollege gab rechtzeitig Bescheid über die Verspätung."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9849	einweisung in das programm bekommen	{"to be inducted into the programme"}	{"Neue Mitarbeiter bekommen eine Einweisung in das Programm.","Die Einweisung dauerte zwei Stunden."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9850	einen konflikt lösen	{"to resolve a conflict"}	{"Der Mediator half, den Konflikt zu lösen.","Offene Kommunikation kann Konflikte lösen."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9851	sich beschweren	{"to complain"}	{"Der Kunde beschwerte sich über die Lieferverzögerung.","Bei Problemen können Sie sich beim Kundendienst beschweren."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9852	(nicht) zufrieden sein mit	{"to be (dis)satisfied with"}	{"Die Kunden waren sehr zufrieden mit dem Service.","Er war nicht zufrieden mit dem Ergebnis."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9853	abdruck	{impression}	{"Der Abdruck des Schlüssels war im Ton zu sehen.","Der Zahnarzt nahm einen Abdruck des Gebisses."}	4	42	1	\N	abdrücke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9854	betäubungsspritze	{"anaesthetic injection"}	{"Vor der Behandlung erhielt er eine Betäubungsspritze.","Die Betäubungsspritze machte den Eingriff schmerzfrei."}	4	42	2	\N	betäubungsspritzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9855	provisorische füllung	{"temporary filling"}	{"Der Zahnarzt setzte eine provisorische Füllung ein.","Die provisorische Füllung hält nur wenige Wochen."}	4	42	2	\N	provisorische füllungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9856	haltbarkeit	{durability}	{"Die Haltbarkeit des Materials wurde getestet.","Auf der Verpackung steht die Haltbarkeit des Produkts."}	4	42	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9857	inlay	{inlay}	{"Das Gold-Inlay wurde individuell angefertigt.","Ein Inlay ist eine präzise Zahnfüllung."}	4	42	3	\N	inlays	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9858	karies	{caries}	{"Karies muss frühzeitig behandelt werden.","Zucker begünstigt die Entstehung von Karies."}	4	42	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9859	keramik	{ceramics}	{"Die Keramik-Implantate sind sehr langlebig.","Keramik wird in der Zahnmedizin häufig verwendet."}	4	42	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9860	labor	{laboratory}	{"Das Labor analysierte die Proben.","Im Dentallabor werden Kronen hergestellt."}	4	42	3	\N	labore	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9861	notdienst	{"emergency service"}	{"Der zahnärztliche Notdienst ist rund um die Uhr erreichbar.","Am Wochenende übernimmt der Notdienst."}	4	42	1	\N	notdienste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9862	gründlich zähne putzen	{"to brush one’s teeth thoroughly"}	{"Gründliches Zähneputzen beugt Karies vor.","Er putzt seine Zähne zweimal täglich gründlich."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9863	schmerzen aushalten	{"to endure pain"}	{"Nach der Operation musste er starke Schmerzen aushalten.","Manchmal muss man im Beruf Schmerzen aushalten."}	4	42	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8628	gastronomie	{gastronomy}	{"Die Gastronomiebranche leidet unter Personalmangel.","Er arbeitet seit Jahren in der Gastronomie."}	2	24	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9864	großhandel	{wholesale}	{"Der Großhandel beliefert Einzelhändler in der Region.","Im Großhandel sind große Mengen günstiger."}	4	43	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9865	einzelhandel	{retail}	{"Der Einzelhandel bietet Produkte direkt an Kunden.","Im Einzelhandel sind flexible Arbeitszeiten selten."}	4	43	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9866	immobilienbranche	{"real estate sector"}	{"Die Immobilienbranche boomt in Großstädten.","In der Immobilienbranche sind Verhandlungsfähigkeiten wichtig."}	4	43	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9867	it-branche	{"IT industry"}	{"Die IT-Branche sucht dringend Fachkräfte.","In der IT-Branche ist lebenslanges Lernen Pflicht."}	4	43	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9868	medien (pl)	{"media (pl.)"}	{"Die Medien berichten über das Ereignis.","In den Medien herrscht großer Wettbewerb."}	4	43	\N	\N	medien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9869	metallindustrie	{"metal industry"}	{"Die Metallindustrie ist energieintensiv.","In der Metallindustrie arbeiten viele Fachkräfte."}	4	43	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9870	öffentliche dienst	{"public service"}	{"Im öffentlichen Dienst gibt es sichere Jobs.","Der öffentliche Dienst bietet gute Sozialleistungen."}	4	43	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9871	pharmaindustrie	{"pharmaceutical industry"}	{"Die Pharmaindustrie forscht an neuen Medikamenten.","In der Pharmaindustrie gelten strenge Vorschriften."}	4	43	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9872	transport und logistik	{"transport and logistics"}	{"Transport und Logistik sind global vernetzt.","In der Logistik sind Schichtarbeiter üblich."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9873	einkauf	{"purchase department"}	{"Der Einkauf verhandelt mit Lieferanten.","Im Einkauf sind Sparsamkeit und Verhandlungsgeschick gefragt."}	4	43	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9874	finanzabteilung	{"finance department"}	{"Die Finanzabteilung kontrolliert das Budget.","In der Finanzabteilung arbeiten viele Experten."}	4	43	2	\N	finanzabteilungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9875	geschäftsleitung/geschäftsführung	{"executive board/management"}	{"Die Geschäftsleitung traf eine strategische Entscheidung.","Die Geschäftsführung informierte die Mitarbeiter."}	4	43	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8291	kundenbetreuung	{"customer support"}	{"Die Kundenbetreuung ist rund um die Uhr erreichbar.","In der Kundenbetreuung ist Geduld wichtig."}	2	20	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9876	marketingabteilung	{"marketing department"}	{"Die Marketingabteilung plant eine neue Kampagne.","In der Marketingabteilung sind kreative Köpfe gefragt."}	4	43	2	\N	marketingabteilungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9877	produktion	{production}	{"Die Produktion läuft rund um die Uhr.","In der Produktion sind Maschinenlärm und Schichtarbeit üblich."}	4	43	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9878	berufschancen (pl)	{"career opportunities (PL)"}	{"In der IT gibt es exzellente Berufschancen.","Berufschancen hängen oft von der Qualifikation ab."}	4	43	2	\N	berufschancen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9879	einsatzplan	{"shift plan"}	{"Der Einsatzplan hängt im Pausenraum aus.","Der Einsatzplan wird wöchentlich aktualisiert."}	4	43	1	\N	einsatzpläne	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9880	konkurrenz	{competition}	{"Die Konkurrenz bietet ähnliche Produkte an.","In diesem Markt ist die Konkurrenz hart."}	4	43	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9881	vorgesetzte	{superior}	{"Der Vorgesetzte genehmigte den Urlaub.","Vorgesetzte sollten Feedback konstruktiv geben."}	4	43	5	\N	vorgesetzte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9057	ware	{goods}	{"Die Ware wird morgen geliefert.","Beschädigte Ware kann reklamiert werden."}	3	5	2	\N	Waren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9882	anredeform	{"form of address"}	{"Die Anredeform im Unternehmen ist meist formell.","In Start-ups ist die Anredeform oft locker."}	4	43	2	\N	anredeformen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9883	firmenphilosophie	{"corporate philosophy"}	{"Die Firmenphilosophie betont Nachhaltigkeit.","Neue Mitarbeiter lernen die Firmenphilosophie im Onboarding."}	4	43	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9884	image	{image}	{"Das Image des Unternehmens ist hervorragend.","Ein gutes Image zieht Kunden und Talente an."}	4	43	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9885	duzen	{"to use the familiar form of address"}	{"In diesem Startup duzen sich alle.","Im deutschen Norden wird häufiger geduzt."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9886	siezen	{"to use the formal form of address"}	{"Kunden werden in der Regel gesiezt.","Siezen zeigt Respekt, kann aber Distanz schaffen."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9887	angemessen	{appropriate}	{"Angemessene Kleidung ist im Büro Pflicht.","Seine Reaktion war professionell und angemessen."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9888	konservativ	{conservative}	{"Konservative Unternehmen bevorzugen traditionelle Strukturen.","Sein Kleidungsstil ist eher konservativ."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9889	locker	{casual}	{"Die Atmosphäre im Team ist locker und freundlich.","Lockerer Umgang kann die Kreativität fördern."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9890	respektlos	{disrespectful}	{"Respektloses Verhalten wird nicht toleriert.","Sein Kommentar war völlig respektlos."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9891	das du anbieten	{"to invite someone to address you informally"}	{"Der Chef bot den neuen Mitarbeitern das Du an.","In Deutschland wird das Du oft nach kurzer Zeit angeboten."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9892	den ersten schritt machen	{"to take the first step"}	{"Er machte den ersten Schritt zur Versöhnung.","In Verhandlungen sollte man manchmal den ersten Schritt machen."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9893	per du/sie sein	{"to be on first-name/last-name terms"}	{"Wir sind per Du, seit wir zusammen studiert haben.","Mit Kunden ist man meist per Sie."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9894	tabu sein	{"to be taboo"}	{"Über Gehälter zu sprechen, ist in vielen Firmen tabu.","Bestimmte Themen sind im Berufsleben tabu."}	4	43	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7239	ausbildung	{apprenticeship/training}	{"Die Ausbildung zum Mechatroniker dauert 3,5 Jahre.","Ohne abgeschlossene Ausbildung ist der Berufseinstieg schwer."}	1	32	2	\N	Ausbildungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9895	ausbildungsberuf	{"occupation requiring training"}	{"Kfz-Mechatroniker ist ein beliebter Ausbildungsberuf.","In Deutschland gibt es über 300 anerkannte Ausbildungsberufe."}	4	44	1	\N	ausbildungsberufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9896	berufsfachschule	{"vocational school"}	{"Nach der Realschule besuchte er eine Berufsfachschule.","Berufsfachschulen vermitteln theoretisches und praktisches Wissen."}	4	44	2	\N	berufsfachschulen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9897	berufsinformationszentrum (biz)	{"Vocational Information Centre (BIZ)"}	{"Das BIZ bietet kostenlose Beratung zur Berufswahl.","Im Berufsinformationszentrum finden Sie Broschüren zu allen Berufen."}	4	44	3	\N	berufsinformationszentren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8340	berufskolleg	{"vocational college"}	{"Sie absolvierte am Berufskolleg eine kaufmännische Ausbildung.","Berufskollegs kombinieren Schulbildung mit Berufspraxis."}	2	21	1	\N	Berufskollegs	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9898	berufsvorbereitungsjahr	{"vocational preparation year"}	{"Das Berufsvorbereitungsjahr hilft bei der Orientierung.","Ohne Schulabschluss kann man ein Berufsvorbereitungsjahr machen."}	4	44	3	\N	berufsvorbereitungsjahre	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9899	fortbildungsakademie	{"advanced training academy"}	{"Die Fortbildungsakademie bietet Kurse für IT-Sicherheit an.","Er besucht eine Fortbildungsakademie, um sich weiterzuqualifizieren."}	4	44	2	\N	fortbildungsakademien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9900	handelssprache	{"commercial language"}	{"Englisch ist die globale Handelssprache.","In der Handelssprache sind Fachbegriffe wichtig."}	4	44	2	\N	handelssprachen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9901	sprachenkenntnisse (pl)	{"language skills"}	{"Gute Sprachenkenntnisse sind im Tourismus unerlässlich.","Im Lebenslauf müssen Sie Ihre Sprachenkenntnisse angeben."}	4	44	\N	\N	sprachenkenntnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9902	erfahrungen (pl) sammeln	{"to gain experience"}	{"Im Praktikum sammelte sie erste Berufserfahrungen.","Erfahrungen im Ausland sind für den Lebenslauf wertvoll."}	4	44	\N	\N	erfahrungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9903	erlernte beruf	{"learned profession"}	{"Sein erlernter Beruf ist Elektriker.","Viele arbeiten nicht in ihrem erlernten Beruf."}	4	44	1	\N	erlernte berufe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9904	fundierte ausbildung	{"sound training"}	{"Eine fundierte Ausbildung ist die Basis für die Karriere.","Das Unternehmen verlangt eine fundierte technische Ausbildung."}	4	44	2	\N	fundierte ausbildungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9905	altersbegrenzung	{"age limit"}	{"Für diese Stelle gibt es keine Altersbegrenzung.","Altersbegrenzungen sind in einigen Berufen gesetzlich geregelt."}	4	44	2	\N	altersbegrenzungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9906	anliegen	{concern}	{"Haben Sie ein besonderes Anliegen?","Kunden können ihre Anliegen online einreichen."}	4	44	3	\N	anliegen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9907	ausschreibung	{"job advertisement"}	{"Die Ausschreibung für die Stelle endet morgen.","In der Ausschreibung stehen die genauen Anforderungen."}	4	44	2	\N	ausschreibungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9908	bewerbungsunterlagen (pl)	{"application documents"}	{"Bitte senden Sie Ihre Bewerbungsunterlagen per E-Mail.","Unvollständige Bewerbungsunterlagen werden nicht berücksichtigt."}	4	44	2	\N	bewerbungsunterlagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9909	jobbörse	{"job exchange"}	{"Auf der Jobbörse finden Sie aktuelle Stellenangebote.","Online-Jobbörsen sind bei Arbeitssuchenden beliebt."}	4	44	2	\N	jobbörsen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9910	personalchef/-in	{"head of Human Resources"}	{"Der Personalchef führt die Vorstellungsgespräche.","Die Personalchefin prüft alle Bewerbungsunterlagen."}	4	44	5	\N	personalchefs/-chefinnen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9911	beeindrucken	{"to impress"}	{"Seine Präsentation beeindruckte das gesamte Team.","Im Vorstellungsgespräch möchte man den Arbeitgeber beeindrucken."}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9912	derzeitig	{current}	{"Der derzeitige Job erfordert viel Reisetätigkeit.","Die derzeitige Situation auf dem Arbeitsmarkt ist schwierig."}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9913	gelegentlich	{occasional}	{"Sie arbeitet gelegentlich als Übersetzerin.","Gelegentliche Überstunden sind in dieser Branche üblich."}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9914	gewissenhaft	{conscientious}	{"Gewissenhafte Mitarbeiter sind in der Verwaltung gefragt.","Er erledigt alle Aufgaben gewissenhaft."}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9915	reibungslos	{smooth}	{"Der Ablauf der Produktion verlief reibungslos.","Eine reibungslose Kommunikation ist im Team wichtig."}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8127	zuverlässig	{reliable}	{"Zuverlässige Lieferungen sind für das Geschäft entscheidend.","Sie ist eine zuverlässige Kollegin."}	2	18	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9916	ab und zu	{"from time to time"}	{"Ab und zu arbeitet er am Wochenende.","Treffen Sie sich ab und zu mit Kollegen zum Netzwerken?"}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9917	die ausbildung verkürzen	{"to shorten the training"}	{"Bei guten Noten kann man die Ausbildung verkürzen.","Sie verkürzte ihre Ausbildung um ein halbes Jahr."}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9918	beruflich vorwärtskommen	{"to advance professionally"}	{"Durch Fortbildungen kann man beruflich vorwärtskommen.","Er möchte schnell beruflich vorwärtskommen."}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9919	feste arbeit	{"steady job"}	{"Nach Jahren in Teilzeit sucht sie eine feste Arbeit.","Eine feste Arbeit bietet finanzielle Sicherheit."}	4	44	2	\N	feste arbeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9920	rund um die uhr	{"around the clock"}	{"Der Kundendienst ist rund um die Uhr erreichbar.","In der Logistik arbeiten viele rund um die Uhr."}	4	44	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9921	anlagemmechaniker/-in	{"plant mechanic"}	{"Der Anlagemmechaniker wartet die Industrieanlagen.","Anlagemmechanikerinnen arbeiten oft im Schichtdienst."}	4	44	5	\N	anlagemmechaniker/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9922	bilanzbuchhalter/-in	{accountant}	{"Die Bilanzbuchhalterin prüft die Jahresabschlüsse.","Bilanzbuchhalter benötigen eine spezielle Zertifizierung."}	4	44	5	\N	bilanzbuchhalter/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9923	bürokaufmann/-frau	{"office worker"}	{"Der Bürokaufmann organisiert den Schriftverkehr.","Bürokauffrauen sind in fast jeder Branche tätig."}	4	44	5	\N	bürokaufleute	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9924	gärtner/-in	{gardener}	{"Der Gärtner gestaltet den Park neu.","Gärtnerinnen arbeiten oft in Gartencentern oder Baumschulen."}	4	44	5	\N	gärtner/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9925	gesundheits- und krankenpfleger/-in	{nurse}	{"Die Gesundheits- und Krankenpflegerin assistierte bei der Operation.","Gesundheits- und Krankenpfleger arbeiten in Krankenhäusern oder Pflegeheimen."}	4	44	5	\N	gesundheits- und krankenpfleger/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9926	näher/-in	{dressmaker}	{"Die Näherin fertigte das Kleid in Handarbeit.","Näher arbeiten oft in der Textilindustrie."}	4	44	5	\N	näher/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9927	servicekraft	{"service employee"}	{"Die Servicekraft bedient die Gäste im Restaurant.","Servicekräfte benötigen gute Kommunikationsfähigkeiten."}	4	44	2	\N	servicekräfte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9928	zimmerservice	{"room service"}	{"Der Zimmerservice bringt das Frühstück ins Hotelzimmer.","Im Luxushotel ist der Zimmerservice 24 Stunden verfügbar."}	4	44	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9929	aufstiegschancen (pl)	{"opportunities for advancement"}	{"In großen Unternehmen gibt es gute Aufstiegschancen.","Aufstiegschancen motivieren Mitarbeiter zur Leistungssteigerung."}	4	45	2	\N	aufstiegschancen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9930	außentermin	{"external appointment"}	{"Heute habe ich einen Außentermin bei einem Kunden.","Außentermine erfordern oft Reisebereitschaft."}	4	45	1	\N	außentermine	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8249	besprechung	{meeting}	{"Die wöchentliche Besprechung findet montags statt.","In der Besprechung wurden neue Projekte vorgestellt."}	2	20	2	\N	Besprechungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7273	kantine	{cafeteria}	{"In der Kantine gibt es täglich frisches Essen.","Die Mitarbeiter treffen sich oft in der Kantine."}	1	32	2	\N	Kantinen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9931	sozialleistungen (pl)	{"social benefits"}	{"Das Unternehmen bietet attraktive Sozialleistungen an.","Sozialleistungen wie Krankenversicherung sind inklusive."}	4	45	2	\N	sozialleistungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9932	jmdm. einen gefallen tun	{"to do someone a favour"}	{"Könnten Sie mir einen Gefallen tun und diesen Bericht korrigieren?","Sie tat ihrem Kollegen einen Gefallen, indem sie ihn vertrat."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9933	das gehalt verhandeln	{"to negotiate one’s salary"}	{"Er verhandelte erfolgreich sein Gehalt beim Vorstellungsgespräch.","Frauen sollten selbstbewusst ihr Gehalt verhandeln."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9934	karriere machen	{"to make a career"}	{"Sie möchte in der IT-Branche Karriere machen.","Karriere zu machen erfordert oft Flexibilität."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9935	priorität haben	{"to take priority"}	{"Die Familie hat für ihn immer Priorität.","Im Projekt hat die Termineinhaltung Priorität."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9936	sachen abarbeiten	{"to process things"}	{"Heute muss ich noch viele Sachen abarbeiten.","Durch effizientes Arbeiten konnte er die Liste schnell abarbeiten."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9937	sachlich bleiben	{"to stay objective"}	{"Auch in Konflikten sollte man sachlich bleiben.","Sachliche Diskussionen führen zu besseren Lösungen."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9938	angemessen bezahlt werden	{"to be paid appropriately"}	{"Jeder möchte für seine Arbeit angemessen bezahlt werden.","In diesem Beruf wird man selten angemessen bezahlt."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9939	auf dauer unzufrieden sein	{"to be dissatisfied in the long term"}	{"Wer ständig Überstunden macht, ist auf Dauer unzufrieden.","Mit zu wenig Anerkennung wird man auf Dauer unzufrieden."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9940	bedenken (pl) äußern	{"to express concerns"}	{"Die Mitarbeiter äußerten Bedenken bezüglich der neuen Regelung.","Im Meeting können Sie gerne Bedenken äußern."}	4	45	\N	\N	bedenken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9941	die chemie stimmt (nicht)	{"the chemistry is (not) right"}	{"Im Team stimmt die Chemie einfach nicht.","Wenn die Chemie stimmt, arbeitet es sich leichter."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9942	fix und fertig sein	{"to be exhausted"}	{"Nach der Nachtschicht war er fix und fertig.","Die Projektwoche hat mich fix und fertig gemacht."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10020	werbegeschenk	{freebie}	{"Das Werbegeschenk ist ein USB-Stick.","Werbegeschenke steigern die Kundenbindung."}	4	47	3	\N	werbegeschenke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9943	die geduld bewahren	{"to keep patience"}	{"In stressigen Phasen muss man die Geduld bewahren.","Sie bewahrte die Geduld, obwohl der Kunde unhöflich war."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9944	gesellschaftlich (nicht) anerkannt sein	{"to be (not) socially recognized"}	{"Pflegeberufe sind gesellschaftlich oft nicht ausreichend anerkannt.","Künstlerische Berufe werden manchmal weniger anerkannt."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9945	ein hohes arbeitspensum haben	{"to have a high workload"}	{"In der Weihnachtszeit hat sie ein hohes Arbeitspensum.","Ein hohes Arbeitspensum kann zu Burnout führen."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9946	monotone aufgabe	{"monotonous task"}	{"Monotone Aufgaben können demotivierend wirken.","Er versucht, monotone Aufgaben zu automatisieren."}	4	45	2	\N	monotone aufgaben	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9947	nichts unüberlegtes tun	{"to do nothing rash"}	{"In Stresssituationen sollte man nichts Unüberlegtes tun.","Bevor Sie kündigen, tun Sie bitte nichts Unüberlegtes."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9948	nichts zu verschenken haben	{"to have nothing to give away"}	{"In kleinen Betrieben hat man oft nichts zu verschenken.","Wenn der Umsatz sinkt, hat das Unternehmen nichts zu verschenken."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9949	schlecht gelaunt sein	{"to be in a bad mood"}	{"Nach der langen Sitzung war der Chef schlecht gelaunt.","Schlecht gelaunte Kollegen beeinträchtigen das Teamklima."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9950	sich über-/unterfordert fühlen	{"to feel over-/underchallenged"}	{"Im neuen Job fühlt er sich unterfordert.","Wenn man sich überfordert fühlt, sollte man Hilfe suchen."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9951	sich zu tode langweilen	{"to be bored to death"}	{"In der Routinearbeit langweilt sie sich zu Tode.","Ohne Herausforderungen langweile ich mich zu Tode."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9952	vierzig(40)-stunden-woche	{"40-hour week"}	{"Die klassische 40-Stunden-Woche ist in vielen Branchen üblich.","Eine 40-Stunden-Woche ermöglicht eine gute Work-Life-Balance."}	4	45	2	\N	40-stunden-wochen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9953	entgegenkommen	{goodwill}	{"Das Entgegenkommen des Chefs erleichterte die Verhandlungen.","Dank ihres Entgegenkommens konnte der Termin verschoben werden."}	4	45	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9954	gleitzeit	{flexitime}	{"Gleitzeit gibt Mitarbeitern mehr Freiheit bei der Arbeitsplanung.","In unserem Unternehmen herrscht Gleitzeit ohne Kernzeit."}	4	45	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9955	kernzeit	{"core hours"}	{"Zwischen 10 und 15 Uhr gilt die Kernzeit.","Während der Kernzeit müssen alle anwesend sein."}	4	45	2	\N	kernzeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9956	wechselschicht	{"rotating shift"}	{"Wechselschichten im Krankenhaus sind körperlich anstrengend.","Er arbeitet in Wechselschicht bei einer Fabrik."}	4	45	2	\N	wechselschichten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9957	flexible arbeitszeiten	{"flexible working hours"}	{"Flexible Arbeitszeiten helfen Eltern bei der Kinderbetreuung.","Viele junge Arbeitnehmer bevorzugen flexible Arbeitszeiten."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9958	feste arbeitszeiten	{"fixed working hours"}	{"Feste Arbeitszeiten erleichtern die Planung des Tagesablaufs.","Im Einzelhandel sind feste Arbeitszeiten selten."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9959	überstunden (pl) machen	{"to work overtime"}	{"In der Hochsaison müssen alle Überstunden machen.","Überstunden machen belastet das Privatleben."}	4	45	\N	\N	überstunden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9960	vertraglich vereinbaren	{"to agree by contract"}	{"Die Gehaltserhöhung wurde vertraglich vereinbart.","Flexible Arbeitszeiten sind vertraglich vereinbart."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9961	betreuungsangebot	{"childcare services"}	{"Das Betreuungsangebot des Unternehmens umfasst eine Kita.","Fehlende Betreuungsangebote erschweren die Berufstätigkeit von Eltern."}	4	45	3	\N	betreuungsangebote	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9962	tagesmutter	{"childminder (female)"}	{"Die Tagesmutter betreut die Kinder während der Arbeitszeit.","Eine vertrauenswürdige Tagesmutter zu finden, ist schwierig."}	4	45	2	\N	tagesmütter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9963	alleinerziehend	{"single parent"}	{"Alleinerziehende benötigen oft flexible Arbeitszeiten.","Als alleinerziehende Mutter hat sie wenig Freizeit."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9964	familienfreundlich	{family-friendly}	{"Familienfreundliche Unternehmen bieten Homeoffice-Optionen an.","Eine familienfreundliche Politik fördert die Vereinbarkeit von Beruf und Familie."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9965	angewiesen sein auf	{"to be dependent on"}	{"Alleinerziehende sind oft auf Betreuungsangebote angewiesen.","Wir sind auf pünktliche Lieferungen angewiesen."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9966	beruf und familie miteinander vereinbaren	{"to reconcile work and family life"}	{"Viele Eltern möchten Beruf und Familie besser vereinbaren.","Homeoffice hilft, Beruf und Familie miteinander zu vereinbaren."}	4	45	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9967	an-/abreise	{arrival/departure}	{"Die Anreise zum Tagungsort erfolgt per Zug.","Die Abreise ist für 18 Uhr geplant."}	4	46	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9968	besprechungsraum	{"conference room"}	{"Der Besprechungsraum ist mit moderner Technik ausgestattet.","Bitte reservieren Sie den Besprechungsraum für morgen."}	4	46	1	\N	besprechungsräume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9969	buchungsbestätigung	{"booking confirmation"}	{"Die Buchungsbestätigung wurde per E-Mail versendet.","Ohne Buchungsbestätigung können Sie nicht einchecken."}	4	46	2	\N	buchungsbestätigungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9970	doppelzimmer (dz)	{"double room"}	{"Das Doppelzimmer bietet Platz für zwei Personen.","Wir buchten ein DZ mit Blick aufs Meer."}	4	46	3	\N	doppelzimmer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9971	einzelzimmer (ez)	{"single room"}	{"Das Einzelzimmer ist kleiner, aber ruhiger.","Ein EZ kostet 20 € mehr pro Nacht."}	4	46	3	\N	einzelzimmer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9972	fahrgemeinschaft	{carpool}	{"Wir bilden eine Fahrgemeinschaft zur Konferenz.","Fahrgemeinschaften sparen Kosten und reduzieren Emissionen."}	4	46	2	\N	fahrgemeinschaften	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9973	flugverbindung	{"flight connection"}	{"Die Flugverbindung nach Berlin wurde gestrichen.","Direkte Flugverbindungen sind bevorzugt."}	4	46	2	\N	flugverbindungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9974	gewerbegebiet	{"industrial area"}	{"Das neue Gewerbegebiet liegt am Stadtrand.","Im Gewerbegebiet gibt es viele Lagerhallen."}	4	46	3	\N	gewerbegebiete	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9975	meeting	{meeting}	{"Das internationale Meeting beginnt um 9 Uhr.","Wir nutzen den Meeting-Raum für Videokonferenzen."}	4	46	3	\N	meetings	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9976	mietauto	{"hire car"}	{"Das Mietauto wurde online reserviert.","Ein Mietauto bietet Flexibilität vor Ort."}	4	46	3	\N	mietautos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9977	parkmöglichkeit	{parking}	{"Das Hotel bietet kostenlose Parkmöglichkeiten.","Parkmöglichkeiten in der Innenstadt sind selten."}	4	46	2	\N	parkmöglichkeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9978	tagungshotel	{"conference hotel"}	{"Das Tagungshotel hat 200 Zimmer und fünf Säle.","Wir buchen ein Tagungshotel mit Vollpension."}	4	46	3	\N	tagungshotels	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7886	tiefgarage	{"underground garage"}	{"Die Tiefgarage ist nur für Hotelgäste zugänglich.","Die Tiefgarage bietet Platz für 50 Autos."}	2	15	2	\N	Tiefgaragen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9979	zimmer-/hotelkategorie	{"room/hotel category"}	{"Die Hotelkategorie entspricht einem 4-Sterne-Standard.","Bitte wählen Sie eine Zimmerkategorie aus."}	4	46	2	\N	hotelkategorien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9980	auf montage fahren	{"to go away for work"}	{"Der Techniker fährt nächste Woche auf Montage.","Auf Montage zu fahren bedeutet oft Wochen unterwegs zu sein."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9981	arbeitsplatzbeschreibung	{"job description"}	{"Die Arbeitsplatzbeschreibung wurde aktualisiert.","In der Arbeitsplatzbeschreibung stehen alle Aufgaben."}	4	46	2	\N	arbeitsplatzbeschreibungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9982	qualitätssicherung	{"quality assurance"}	{"Die Qualitätssicherung prüft alle Produkte vor dem Versand.","Ohne Qualitätssicherung gibt es mehr Reklamationen."}	4	46	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9983	richtlinien (pl)	{guidelines}	{"Die neuen Richtlinien wurden im Team besprochen.","Sicherheitsrichtlinien müssen strikt eingehalten werden."}	4	46	2	\N	richtlinien	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9984	vorarbeiter/-in	{foreman/forewoman}	{"Der Vorarbeiter koordiniert das Team auf der Baustelle.","Die Vorarbeiterin überprüft die täglichen Fortschritte."}	4	46	5	\N	vorarbeiter/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9985	arbeitsabläufe (pl) regeln	{"to regulate workflows"}	{"Die Software hilft, Arbeitsabläufe effizient zu regeln.","Gut geregelte Arbeitsabläufe sparen Zeit."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9986	anweisungen (pl) verstehen	{"to understand instructions"}	{"Er versteht komplexe Anweisungen schnell.","Unklare Anweisungen führen zu Fehlern."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9987	arbeitsschritte (pl) kleinschrittig festhalten	{"to create a step-by-step description of work procedures"}	{"Die Arbeitsschritte wurden kleinschrittig in einem Handbuch festgehalten.","Für Azubis sind kleinschrittige Anleitungen hilfreich."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9988	auf einem stick speichern	{"to save to a USB stick"}	{"Die Präsentation wurde auf einem Stick gespeichert.","Bitte speichern Sie die Dateien auf dem Stick."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9989	einen bericht vorlegen	{"to submit a report"}	{"Der Mitarbeiter legte den Bericht pünktlich vor.","Monatlich muss ein Statusbericht vorgelegt werden."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9990	ergebnisse (pl) präsentieren	{"to present results"}	{"Das Team präsentierte die Ergebnisse im Plenum.","Ergebnisse klar zu präsentieren, ist eine Schlüsselkompetenz."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9991	etw. gemeinsam durchgehen	{"to go through something together"}	{"Lassen Sie uns den Vertrag nochmal gemeinsam durchgehen.","Nach dem Fehler gingen wir die Schritte gemeinsam durch."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9992	eine grafik einpflegen	{"to enter a graphic"}	{"Die Grafik wurde in das Dokument eingepflegt.","Bitte pflegen Sie die neuen Daten ein."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9993	den laptop herunterfahren	{"to shut down the laptop"}	{"Vor dem Verlassen des Büros den Laptop herunterfahren.","Das Herunterfahren dauert wegen Updates länger."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9994	einen probedurchlauf machen	{"to make a test run"}	{"Vor dem Start machen wir einen Probedurchlauf.","Der Probedurchlauf zeigte technische Schwächen."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9995	eine sicherungskopie machen	{"to make a backup copy"}	{"Machen Sie regelmäßig eine Sicherungskopie der Daten.","Ohne Sicherungskopie sind Datenverluste riskant."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9996	eine tätigkeit schriftlich dokumentieren	{"to document an activity in writing"}	{"Jeder Arbeitsschritt muss schriftlich dokumentiert werden.","Die Fehler wurden genau dokumentiert."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9997	unterlagen (pl) zusammenstellen	{"to compile documents"}	{"Bitte stellen Sie alle Unterlagen für die Prüfung zusammen.","Das Team stellte die Unterlagen für den Kunden zusammen."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9998	vorbereitungen (pl) treffen	{"to make preparations"}	{"Wir treffen Vorbereitungen für die Messe nächste Woche.","Ohne gründliche Vorbereitungen scheitert das Projekt."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9999	absagen	{"to cancel"}	{"Der Termin musste kurzfristig abgesagt werden.","Bei Krankheit sollten Sie rechtzeitig absagen."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10000	um etwas bitten	{"to ask for something"}	{"Der Kunde bat um eine schnellere Lieferung.","Höflich um Hilfe zu bitten, ist wichtig."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10001	einen gegenvorschlag machen	{"to make a counter-proposal"}	{"Sie machte einen Gegenvorschlag zur Terminänderung.","Der Gegenvorschlag wurde angenommen."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10002	seine meinung ausdrücken	{"to express one’s opinion"}	{"Jeder Teilnehmer darf seine Meinung ausdrücken.","In Meetings sollte man seine Meinung klar äußern."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10003	einverstanden sein	{"to agree"}	{"Sind Sie mit den Bedingungen einverstanden?","Alle waren mit der Lösung einverstanden."}	4	46	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10004	aufkleber	{sticker}	{"Der Aufkleber zeigt das Firmenlogo.","Kinder lieben bunte Aufkleber."}	4	47	1	\N	aufkleber	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10005	aussteller	{exhibitor}	{"Die Aussteller präsentieren ihre Produkte auf der Messe.","Unser Unternehmen ist dieses Jahr als Aussteller vertreten."}	4	47	1	\N	aussteller	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8523	broschüre	{brochure}	{"Die Broschüre enthält alle Produktdetails.","Nehmen Sie eine Broschüre vom Stand mit."}	2	23	2	\N	Broschüren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10006	datenblatt	{datasheet}	{"Das Datenblatt listet technische Spezifikationen auf.","Bitte senden Sie mir das Datenblatt per E-Mail."}	4	47	3	\N	datenblätter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10007	detail	{detail}	{"Achten Sie auf jedes Detail im Vertrag.","Die Details des Projekts werden noch besprochen."}	4	47	3	\N	details	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10008	flyer	{flyer}	{"Der Flyer wirbt für das neue Produkt.","Flyer werden an Messebesucher verteilt."}	4	47	1	\N	flyer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10009	give-away	{"give away"}	{"Give-aways sind beliebte Werbegeschenke.","Unser Give-away ist eine praktische Tasche."}	4	47	3	\N	give-aways	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10010	großhändler	{wholesaler}	{"Der Großhändler liefert an Einzelhändler.","Großhändler bieten Mengenrabatte an."}	4	47	1	\N	großhändler	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8730	katalog	{catalogue}	{"Der Katalog liegt am Stand aus.","Blättern Sie durch den digitalen Katalog."}	3	2	1	\N	Kataloge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10011	leistungsschau	{exhibition}	{"Die Leistungsschau findet jährlich statt.","Auf der Leistungsschau werden Innovationen präsentiert."}	4	47	2	\N	leistungsschauen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10012	logo	{logo}	{"Das Logo der Firma ist leicht erkennbar.","Unser neues Logo symbolisiert Innovation."}	4	47	3	\N	logos	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10013	poster	{poster}	{"Das Poster hängt an der Messewand.","Poster visualisieren Produktvorteile."}	4	47	3	\N	poster	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10014	prospektständer	{"brochure stand"}	{"Der Prospektständer ist gut sichtbar platziert.","Nehmen Sie einen Flyer aus dem Prospektständer."}	4	47	1	\N	prospektständer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10015	stand	{stand}	{"Unser Messestand zieht viele Besucher an.","Der Stand ist modern gestaltet."}	4	47	1	\N	stände	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10016	start-up-unternehmen	{start-up}	{"Das Start-up-Unternehmen präsentiert eine App.","Start-up-Unternehmen suchen oft Investoren."}	4	47	3	\N	start-up-unternehmen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10017	to-do-liste	{"to-do list"}	{"Die To-do-Liste für die Messe ist lang.","Erfolgreiche Projekte beginnen mit einer To-do-Liste."}	4	47	2	\N	to-do-listen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10018	veranstalter	{organiser}	{"Die Veranstalter planen die Messe seit Monaten.","Der Veranstalter ist für die Sicherheit verantwortlich."}	4	47	1	\N	veranstalter	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10019	visitenkarte	{"business card"}	{"Tauschen Sie Visitenkarten mit potenziellen Kunden.","Eine professionelle Visitenkarte ist wichtig."}	4	47	2	\N	visitenkarten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8881	zustimmen	{"to agree"}	{"Alle Teilnehmer stimmten dem Plan zu.","Der Chef stimmte dem Vorschlag zu."}	3	3	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10021	wettbewerber	{competitor}	{"Analysieren Sie die Strategien der Wettbewerber.","Starke Wettbewerber fördern Innovationen."}	4	47	1	\N	wettbewerber	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10022	innovativ	{innovative}	{"Innovative Lösungen setzen Maßstäbe.","Das Team arbeitet innovativ und effizient."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10023	einzigartig	{unique}	{"Unser Produkt ist einzigartig auf dem Markt.","Ein einzigartiges Verkaufsargument überzeugt Kunden."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10024	wettbewerbsfähig	{competitive}	{"Wettbewerbsfähige Preise sind entscheidend.","Unser Service macht uns wettbewerbsfähig."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10025	aktuelle situation auf dem markt	{"current situation on the market"}	{"Die aktuelle Situation auf dem Markt ist unsicher.","Analysieren Sie die aktuelle Marktsituation."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10026	angebote vergleichen	{"to compare offers"}	{"Kunden vergleichen oft Angebote online.","Vergleichen Sie Preise und Leistungen."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10027	keine zeit verschwenden	{"to waste no time"}	{"Verschwenden Sie keine Zeit mit unwichtigen Details.","Erfolgreiche Teams verschwenden keine Zeit."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10028	präsenz zeigen	{"to make one's presence felt"}	{"Auf Messen muss man Präsenz zeigen.","Durch Werbung zeigt das Unternehmen Präsenz."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10029	eine preisliste beilegen	{"to enclose a price list"}	{"Bitte legen Sie die Preisliste dem Angebot bei.","Die beiliegende Preisliste ist aktuell."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10030	produkte präsentieren	{"to present products"}	{"Wir präsentieren die Produkte auf der Messe.","Präsentieren Sie die Vorteile klar und deutlich."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10031	sich über trends informieren	{"to find out about trends"}	{"Informieren Sie sich über aktuelle Branchentrends.","Messen helfen, neue Trends zu entdecken."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10032	umsatz machen	{"to make sales"}	{"Das Team machte letztes Quartal hohen Umsatz.","Umsatz zu machen ist das primäre Ziel."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10033	ab-/zusage	{cancellation/commitment}	{"Die Zusage des Kunden kam per E-Mail.","Eine Absage muss höflich formuliert werden."}	4	47	2	\N	ab-/zusagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8531	filiale	{branch}	{"Die Filiale in Berlin eröffnet nächste Woche.","Unsere Filialen sind bundesweit vertreten."}	2	23	2	\N	Filialen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10034	saison	{season}	{"In der Weihnachtssaison steigen die Verkäufe.","Die touristische Saison beginnt im Frühling."}	4	47	2	\N	saisons	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10035	wartung	{maintenance}	{"Regelmäßige Wartung verlängert die Lebensdauer.","Die Wartung des Geräts erfolgt jährlich."}	4	47	2	\N	wartungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10036	einzelheiten besprechen	{"to discuss details"}	{"Wir müssen die Einzelheiten des Vertrags besprechen.","Besprechen Sie die Details in der Teamsitzung."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10037	gezielte fragen stellen	{"to ask specific questions"}	{"Stellen Sie gezielte Fragen zum Produkt.","Der Kunde stellte gezielte Fragen zur Funktionalität."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10038	liefer- und zahlungsbedingungen (pl)	{"terms of delivery and payment"}	{"Die Liefer- und Zahlungsbedingungen stehen im Vertrag.","Klären Sie die Bedingungen vorab."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10039	notizen machen	{"to take notes"}	{"Machen Sie Notizen während des Gesprächs.","Notizen helfen bei der Nachbereitung."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10040	sich eine praktische lösung ausdenken	{"to come up with a practical solution"}	{"Das Team dachte sich eine kreative Lösung aus.","Für Probleme muss man praktische Lösungen finden."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10041	rückfragen stellen	{"to ask questions"}	{"Bei Unklarheiten sollten Sie Rückfragen stellen.","Der Kunde stellte mehrere Rückfragen zum Angebot."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10042	sich auf das gespräch konzentrieren	{"to focus on the conversation"}	{"Konzentrieren Sie sich auf das Wesentliche im Gespräch.","Störungen lenken vom Gespräch ab."}	4	47	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10043	anfrage	{enquiry}	{"Die Anfrage des Kunden wurde per E-Mail gestellt.","Bitte senden Sie uns Ihre schriftliche Anfrage."}	4	48	2	\N	anfragen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10044	elizuschlag	{"express surcharge"}	{"Der Elizuschlag beträgt 15 Euro.","Bei Expresslieferung fällt ein Elizuschlag an."}	4	48	1	\N	elizuschläge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10045	gesamtpreis	{"total price"}	{"Der Gesamtpreis inklusive Steuern wird angezeigt.","Bitte bestätigen Sie den Gesamtpreis schriftlich."}	4	48	1	\N	gesamtpreise	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10046	mailing	{mailing}	{"Das Mailing erreichte die Kunden pünktlich.","Ein gut gestaltetes Mailing erhöht die Response-Rate."}	4	48	3	\N	mailings	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10047	nettopreis	{"net price"}	{"Der Nettopreis ist ohne Mehrwertsteuer angegeben.","Der Kunde verhandelte über den Nettopreis."}	4	48	1	\N	nettopreise	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10150	agenda	{agenda}	{"Die Agenda für das Meeting steht fest.","Bitte halten Sie sich an die vorgegebene Agenda."}	4	51	2	\N	agenden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10048	bruttopreis	{"gross price"}	{"Der Bruttopreis enthält alle Steuern und Gebühren.","Auf der Rechnung steht der Bruttopreis."}	4	48	1	\N	bruttopreise	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10049	neukundengewinnung	{"new customer acquisition"}	{"Die Neukundengewinnung ist ein Schwerpunkt der Marketingabteilung.","Rabatte fördern die Neukundengewinnung."}	4	48	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10050	sonderwunsch	{"special request"}	{"Der Kunde äußerte einen Sonderwunsch zur Lieferung.","Sonderwünsche können zusätzliche Kosten verursachen."}	4	48	1	\N	sonderwünsche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10051	angebot ist gültig bis …	{"the offer is valid until …"}	{"Das Angebot ist gültig bis zum 31. Dezember.","Bitte beachten Sie: Das Angebot ist gültig bis nächste Woche."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10052	ein angebot unterbreiten	{"to make an offer"}	{"Wir unterbreiten Ihnen ein attraktives Angebot.","Der Lieferant unterbreitete ein konkretes Angebot."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10053	ein angebot verhandeln	{"to negotiate an offer"}	{"Beide Parteien verhandelten das Angebot intensiv.","Es lohnt sich, das Angebot zu verhandeln."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10054	unverbindliche angebot	{"non-binding offer"}	{"Das unverbindliche Angebot dient zur Orientierung.","Kunden erhalten zunächst ein unverbindliches Angebot."}	4	48	3	\N	unverbindliche angebote	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10055	zuzüglich der gesetzlich geltenden mehrwertsteuer	{"plus statutory value-added tax"}	{"Der Preis beträgt 500 Euro zuzüglich Mehrwertsteuer.","Alle Angaben sind zuzüglich der gesetzlich geltenden Mehrwertsteuer."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10056	inklusive der gesetzlich geltenden mehrwertsteuer	{"including statutory value-added tax"}	{"Der Betrag ist inklusive Mehrwertsteuer zu zahlen.","Alle Preise sind inklusive der gesetzlich geltenden Mehrwertsteuer."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10057	lieferkosten (pl)	{"delivery costs"}	{"Die Lieferkosten werden separat berechnet.","Lieferkosten können je nach Land variieren."}	4	48	2	\N	lieferkosten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10058	rabatt	{discount}	{"Großkunden erhalten einen Sonderrabatt.","Der Rabatt gilt nur für Neukunden."}	4	48	1	\N	rabatte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10059	ratenzahlung	{instalment}	{"Die Ratenzahlung erleichtert die Finanzierung.","Eine Ratenzahlung ist über 12 Monate möglich."}	4	48	2	\N	ratenzahlungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10060	skonto	{"early payment discount"}	{"Bei sofortiger Zahlung gewähren wir 2 % Skonto.","Skonto wird nur bei Vorauszahlung gewährt."}	4	48	3	\N	skonti	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10061	vorauszahlung	{"advance payment"}	{"Eine Vorauszahlung von 30 % ist erforderlich.","Die Vorauszahlung sichert die Lieferung."}	4	48	2	\N	vorauszahlungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10062	ab werk	{"ex works"}	{"Der Preis gilt ab Werk ohne Transportkosten.","Die Ware muss ab Werk abgeholt werden."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10063	bei erhalt der ware	{"upon receipt of the goods"}	{"Die Zahlung ist bei Erhalt der Ware fällig.","Bei Erhalt der Ware prüfen Sie bitte die Qualität."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10064	die ware umtauschen	{"to exchange the goods"}	{"Kunden können die Ware innerhalb von 14 Tagen umtauschen.","Defekte Ware kann kostenlos umgetauscht werden."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10065	frei grenze	{"free border"}	{"Der Preis gilt frei Grenze des Exportlandes.","Frei Grenze bedeutet, der Käufer trägt die Zollkosten."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10066	frei haus	{"carriage free"}	{"Die Lieferung erfolgt frei Haus bis zur Haustür.","Frei Haus bedeutet inklusive aller Transportkosten."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10067	keine garantie übernehmen im anhang	{"not to offer a guarantee enclosed"}	{"Der Hersteller übernimmt keine Garantie im Anhang des Vertrags.","Bitte beachten Sie: Wir übernehmen keine Garantie im Anhang."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10068	frühestens	{"at the earliest"}	{"Die Lieferung ist frühestens nächste Woche möglich.","Frühestens ab Montag können wir starten."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10069	höchstens	{"at most"}	{"Die Bearbeitungszeit beträgt höchstens fünf Tage.","Höchstens zwei Personen dürfen den Raum betreten."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7060	mindestens	{"at least"}	{"Mindestens drei Angebote sollten verglichen werden.","Die Lieferung dauert mindestens eine Woche."}	1	30	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8583	spätestens	{"at the latest"}	{"Die Zahlung muss spätestens bis Freitag erfolgen.","Spätestens um 18 Uhr schließt das Büro."}	2	23	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10070	bankrott sein	{"to be bankrupt"}	{"Das Unternehmen ist bankrott und wurde geschlossen.","Ohne Investoren wären wir bankrott gewesen."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10071	zahlbar innerhalb von ... tagen	{"payable within ... days"}	{"Die Rechnung ist zahlbar innerhalb von 14 Tagen.","Der Betrag ist zahlbar innerhalb von drei Werktagen."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10072	bürokommunikation	{"office communication"}	{"Effiziente Bürokommunikation steigert die Produktivität.","Moderne Tools verbessern die Bürokommunikation."}	4	48	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10073	vertriebskenntnisse (pl)	{"sales knowledge"}	{"Vertriebskenntnisse sind für diese Stelle Voraussetzung.","Er hat umfangreiche Vertriebskenntnisse gesammelt."}	4	48	2	\N	vertriebskenntnisse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10074	zukunftsorientiert	{future-oriented}	{"Das Unternehmen verfolgt eine zukunftsorientierte Strategie.","Zukunftsorientierte Technologien prägen den Markt."}	4	48	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10075	gängige computerprogramme (pl)	{"common computer programs"}	{"Gängige Computerprogramme wie Excel sind Pflicht.","Bewerber müssen gängige Computerprogramme beherrschen."}	4	48	\N	\N	gängige computerprogramme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8987	artikelnummer	{"item number"}	{"Die Artikelnummer finden Sie auf der Verpackung.","Bitte geben Sie die Artikelnummer bei der Bestellung an."}	3	5	2	\N	Artikelnummern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10076	artikelbezeichnung	{"item description"}	{"Die Artikelbezeichnung muss genau mit der Lieferung übereinstimmen.","Die falsche Artikelbezeichnung führte zu Verwirrung."}	4	49	2	\N	artikelbezeichnungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10077	bestandskunde	{"existing customer"}	{"Bestandskunden erhalten exklusive Rabatte.","Wir schätzen die Treue unserer Bestandskunden."}	4	49	1	\N	bestandskunden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10078	neukunde	{"new customer"}	{"Als Neukunde erhalten Sie 10 % Rabatt.","Die Werbung zielt auf Neukunden ab."}	4	49	1	\N	neukunden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10079	versandhandel	{"mail-order business"}	{"Der Versandhandel hat im letzten Jahr stark expandiert.","Viele Kunden bevorzugen den Versandhandel."}	4	49	1	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10080	erhältlich sein	{"to be available"}	{"Das Produkt ist ab nächster Woche erhältlich.","Sind diese Schuhe noch in Größe 42 erhältlich?"}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10081	jmdm. etw. ausrichten	{"to pass on a message to someone"}	{"Kann ich Herrn Müller etwas ausrichten?","Sie hat die Nachricht an den Chef ausgerichtet."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10082	eine nachricht hinterlassen	{"to leave a message"}	{"Sie können gerne eine Nachricht auf dem Anrufbeantworter hinterlassen.","Er hinterließ eine dringende Nachricht."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10083	verfügbar sein	{"to be available"}	{"Der Manager ist heute Nachmittag verfügbar.","Sind die Unterlagen bereits verfügbar?"}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10084	barzahlung	{"cash payment"}	{"Barzahlung ist nur an der Kasse möglich.","Bei Barzahlung entfallen Bearbeitungsgebühren."}	4	49	2	\N	barzahlungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10085	mahnung	{"written warning"}	{"Die erste Mahnung wurde per Post verschickt.","Ohne Zahlung folgt eine zweite Mahnung."}	4	49	2	\N	mahnungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10086	onlinebanking	{"online banking"}	{"Onlinebanking vereinfacht die Kontoverwaltung.","Sicherheit ist beim Onlinebanking entscheidend."}	4	49	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10087	online-bezahldienst	{"online payment service"}	{"PayPal ist ein bekannter Online-Bezahldienst.","Der Online-Bezahldienst gewährleistet schnelle Transaktionen."}	4	49	1	\N	online-bezahldienste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10088	sicherheitsbedenken (pl)	{"security concerns"}	{"Es gibt Sicherheitsbedenken bei der Datenübertragung.","Die Sicherheitsbedenken der Kunden wurden geprüft."}	4	49	2	\N	sicherheitsbedenken	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10089	zahlungsempfänger	{payee}	{"Geben Sie den Namen des Zahlungsempfängers korrekt an.","Der Zahlungsempfänger bestätigte den Eingang des Betrags."}	4	49	1	\N	zahlungsempfänger	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10090	der betrag ist fällig zum ...	{"the amount is due on ..."}	{"Der Betrag ist fällig zum 15. des Monats.","Die Rechnung ist fällig zum Ende der Woche."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10091	... euro ausgeben	{"to spend ... euros"}	{"Er gab 200 Euro für Büromaterial aus.","Wir dürfen nicht mehr als budgetiert ausgeben."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10092	einen betrag in höhe von ...	{"an amount of ..."}	{"Es wurde ein Betrag in Höhe von 500 Euro überwiesen.","Der Schaden belief sich auf einen Betrag in Höhe von 2.000 Euro."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10093	einen betrag überweisen	{"to transfer an amount"}	{"Bitte überweisen Sie den Betrag auf unser Firmenkonto.","Der Kunde überwies den Betrag versehentlich zweimal."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10094	einen betrag vom konto abbuchen	{"to debit an amount from the account"}	{"Die Miete wird automatisch vom Konto abgebucht.","Der Betrag wurde fälschlicherweise abgebucht."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10095	in bar bezahlen	{"to pay in cash"}	{"Kleinere Beträge können in bar bezahlt werden.","In bar zu bezahlen ist manchmal praktischer."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10096	per lastschrift	{"by direct debit"}	{"Die Mitgliedsbeiträge werden per Lastschrift eingezogen.","Per Lastschrift zu zahlen spart Zeit."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10097	per überweisung	{"by bank transfer"}	{"Bitte zahlen Sie per Überweisung innerhalb von 14 Tagen.","Internationale Zahlungen erfolgen oft per Überweisung."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10098	eine rechnung begleichen	{"to pay an invoice"}	{"Die Rechnung muss bis zum Monatsende beglichen werden.","Er beglich die Rechnung sofort nach Erhalt."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10099	die zahlung ist eingegangen	{"the payment has been received"}	{"Ihre Zahlung ist am 10. Mai eingegangen.","Sobald die Zahlung eingegangen ist, versenden wir die Ware."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10100	zahlungserinnerung	{"payment reminder"}	{"Die erste Zahlungserinnerung wurde freundlich formuliert.","Ohne Reaktion folgt eine zweite Zahlungserinnerung."}	4	49	2	\N	zahlungserinnerungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10101	etw. als gegenstandslos betrachten	{"to consider something to be groundless"}	{"Der Antrag wurde als gegenstandslos betrachtet.","Die Beschwerde erwies sich als gegenstandslos."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10102	budget	{budget}	{"Das Budget für Marketing wurde gekürzt.","Ein realistisches Budget ist für Projekte entscheidend."}	4	49	3	\N	budgets	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10103	komma	{comma}	{"Setzen Sie ein Komma zwischen die Zahlen.","Ein falsches Komma kann Missverständnisse verursachen."}	4	49	3	\N	kommata	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10104	drittel	{third}	{"Ein Drittel der Mitarbeiter arbeitet im Homeoffice.","Das Projekt ist zu einem Drittel abgeschlossen."}	4	49	3	\N	drittel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10105	achtel	{eighth}	{"Ein Achtel der Fläche ist noch ungenutzt.","Das Rezept erfordert ein Achtel Liter Milch."}	4	49	3	\N	achtel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6970	viertel	{quarter}	{"Ein Viertel der Angestellten nahm an der Schulung teil.","Das Meeting dauert eine dreiviertel Stunde."}	1	29	3	\N	Viertel	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10106	(geteilt) durch	{"(divided) by"}	{"20 geteilt durch 4 ergibt 5.","Der Gewinn wird durch die Anzahl der Mitarbeiter geteilt."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
6821	gleich	{"the same"}	{"5 plus 5 ist gleich 10.","Die Summe beider Posten ist gleich."}	1	28	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10107	mal	{times}	{"3 mal 4 ergibt 12.","Der Umsatz stieg um das Zehnfache."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7602	minus	{minus}	{"10 minus 3 ergibt 7.","Der Gewinn sank um 20 % minus."}	1	36	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10108	plus	{plus}	{"Der Bruttopreis ist Nettopreis plus Steuern.","5 plus 5 ergibt 10."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10109	gut/schlecht wirtschaften	{"to manage one's money well/badly"}	{"Das Unternehmen wirtschaftet gut und ist profitabel.","Wer schlecht wirtschaftet, riskiert Insolvenz."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10110	übrig sein	{"to be left over"}	{"Nach dem Projekt war kein Budget mehr übrig.","Am Monatsende ist oft kaum Geld übrig."}	4	49	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10111	bewertung	{review}	{"Die Bewertung des Produkts war überwiegend positiv.","Kunden hinterlassen oft Bewertungen auf der Website."}	4	50	2	\N	bewertungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10112	konsequenzen (pl)	{consequences}	{"Die Konsequenzen des Fehlers müssen analysiert werden.","Ohne Konsequenzen ändert sich nichts."}	4	50	\N	\N	konsequenzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10113	streitgespräch	{disputation}	{"Das Streitgespräch führte zu einer Einigung.","Ein konstruktives Streitgespräch löst Konflikte."}	4	50	3	\N	streitgespräche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10114	vorfall	{incident}	{"Der Vorfall wurde im Protokoll festgehalten.","Solche Vorfälle dürfen sich nicht wiederholen."}	4	50	1	\N	vorfälle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10115	vorwurf	{accusation}	{"Der Vorwurf der Fahrlässigkeit war unbegründet.","Er wies alle Vorwürfe zurück."}	4	50	1	\N	vorwürfe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10116	fehlerhaft	{defective}	{"Die fehlerhafte Lieferung wurde reklamiert.","Fehlerhafte Produkte müssen zurückgegeben werden."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10117	ungerecht	{unfair}	{"Die Entscheidung wurde als ungerecht empfunden.","Ungerechte Behandlung führt zu Unmut."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10118	bis an die grenzen (pl) arbeiten	{"to work to one's limits"}	{"Das Team arbeitete bis an die Grenzen seiner Belastbarkeit.","In der Hochsaison arbeiten wir bis an die Grenzen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10119	etw. verallgemeinern	{"to generalize"}	{"Man sollte nicht voreilig urteilen und alles verallgemeinern.","Verallgemeinerungen führen oft zu Missverständnissen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10120	gezwungen sein, etw. zu tun	{"to be forced to do something"}	{"Sie war gezwungen, Überstunden zu machen.","Niemand sollte gezwungen sein, gegen seinen Willen zu handeln."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10121	jmdn. nicht weiterempfehlen	{"not to recommend someone"}	{"Aufgrund schlechter Leistung kann ich ihn nicht weiterempfehlen.","Wir werden diesen Lieferanten nicht weiterempfehlen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10122	nicht den angaben (pl) entsprechen	{"not to be consistent with the information given"}	{"Die gelieferte Ware entsprach nicht den Angaben.","Seine Aussagen entsprechen nicht den Fakten."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10123	recht bekommen	{"to get one's own way"}	{"Am Ende wird der Kunde immer recht bekommen.","In der Diskussion wollte er unbedingt recht bekommen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10124	sich gestört fühlen	{"to feel disturbed"}	{"Sie fühlte sich durch die Lautstärke gestört.","Gestört fühlen sich viele durch häufige Unterbrechungen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10125	beschwerden (pl) beantworten	{"to respond to complaints"}	{"Die Hotline muss Beschwerden schnell beantworten.","Unbeantwortete Beschwerden führen zu Unzufriedenheit."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10126	konstruktive streitgespräch	{"constructive disputation"}	{"Ein konstruktives Streitgespräch fördert Lösungen.","Konstruktive Streitgespräche sind im Team wichtig."}	4	50	3	\N	konstruktive streitgespräche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10127	einen einmaligen vorfall beseitigen	{"to resolve a one-off incident"}	{"Der Vorfall wurde als einmalig eingestuft und beseitigt.","Wir müssen solche Vorfälle proaktiv beseitigen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10128	etw. bedauern	{"to regret something"}	{"Das Unternehmen bedauert den entstandenen Schaden.","Er bedauerte sein vorschnelles Urteil."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10129	etw. weitergeben	{"to pass something on"}	{"Bitte geben Sie die Information an das Team weiter.","Er gab die Verantwortung an seinen Nachfolger weiter."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10130	etw. wiedergutmachen	{"to make up for something"}	{"Der Fehler wurde durch kostenlosen Ersatz wiedergutgemacht.","Sie versuchte, den Schaden wiedergutzumachen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10131	etwas wird nicht wieder vorkommen	{"something will not happen again"}	{"Wir garantieren, dass der Fehler nicht wieder vorkommt.","Der Vorfall wird sicherlich nicht wieder vorkommen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10132	einen gutschein anbieten	{"to offer a voucher"}	{"Als Entschuldigung boten wir einen Gutschein an.","Gutscheine werden oft als Kulanzlösung angeboten."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10133	eine lösung finden	{"to find a solution"}	{"Gemeinsam fand das Team eine praktische Lösung.","Für jedes Problem gibt es eine Lösung."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10134	einen fehler beheben	{"to fix a mistake"}	{"Der Techniker behebt den Fehler sofort.","Software-Updates beheben häufig Sicherheitslücken."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10135	einen fehler zugeben	{"to admit to a mistake"}	{"Er gab den Fehler offen zu und entschuldigte sich.","Fehler zuzugeben stärkt das Vertrauen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10136	sich in die situation des anderen versetzen	{"to put yourself in the other person’s shoes"}	{"Versuchen Sie sich in die Situation des Kunden zu versetzen.","Empathie bedeutet, sich in andere hineinzuversetzen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10137	um verständnis bitten	{"to ask for someone’s understanding"}	{"Wir bitten um Verständnis für die Verzögerung.","Der Chef bat um Verständnis für die strenge Deadline."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10138	verständnis zeigen	{"to show understanding"}	{"Die Mitarbeiter zeigten Verständnis für die Entscheidung.","Verständnis für Kundenbedürfnisse ist wichtig."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
9763	anforderung	{requirement}	{"Die Anforderungen an die Stelle sind klar definiert.","Technische Anforderungen müssen erfüllt werden."}	4	40	2	\N	Anforderungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10139	norm	{standard}	{"Die Produkte entsprechen internationalen Normen.","Qualitätsnormen sichern die Kundenzufriedenheit."}	4	50	2	\N	normen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10140	qualitätsmanagementsystem	{"quality management system"}	{"Das Qualitätsmanagementsystem wird jährlich auditiert.","ISO 9001 ist ein bekanntes Qualitätsmanagementsystem."}	4	50	3	\N	qualitätsmanagementsysteme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10141	die arbeitsweisen überprüfen	{"to review the working methods"}	{"Wir überprüfen regelmäßig unsere Arbeitsweisen.","Innovation erfordert das Überprüfen alter Methoden."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10142	die motivation steigern	{"to enhance motivation"}	{"Bonuszahlungen steigern die Motivation der Mitarbeiter.","Anerkennung ist ein Schlüssel zur Motivation."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10143	die produkte kontinuierlich verbessern	{"to continuously improve the products"}	{"Kundenfeedback hilft, die Produkte zu verbessern.","Kontinuierliche Verbesserung ist Teil unserer Philosophie."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10144	die einzelnen produktionsschritte planen	{"to plan the individual production steps"}	{"Jeder Produktionsschritt muss detailliert geplant werden.","Die Planung der Schritte reduziert Fehlerrisiken."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10145	prozesse (pl) definieren	{"to define processes"}	{"Klare Prozesse definieren die Arbeitsabläufe.","Definierte Prozesse steigern die Effizienz."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10146	prozesse (pl) schriftlich festhalten	{"to record processes in writing"}	{"Alle Prozesse werden schriftlich festgehalten.","Schriftliche Dokumentation dient als Referenz."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10147	die qualität sicherstellen	{"to assure quality"}	{"Regelmäßige Tests stellen die Qualität sicher.","Qualitätssicherung ist im Produktionsprozess essenziell."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10148	sich nach den bedürfnissen (pl) der kunden (pl) richten	{"to be guided by the needs of the customers"}	{"Unser Service richtet sich nach den Kundenbedürfnissen.","Flexibilität ist nötig, um auf Bedürfnisse einzugehen."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10149	die wirtschaftliche situation verbessern	{"to improve the economic situation"}	{"Neue Märkte erschließen verbessert die wirtschaftliche Lage.","Kostensenkungen sollen die Situation verbessern."}	4	50	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10151	ankündigung	{announcement}	{"Die Ankündigung der Besprechung erfolgte per E-Mail.","Eine frühzeitige Ankündigung ist wichtig."}	4	51	2	\N	ankündigungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7922	antrag	{application}	{"Der Antrag auf Budgeterhöhung wurde genehmigt.","Bitte stellen Sie den Antrag schriftlich."}	2	16	1	\N	Anträge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8339	bericht	{report}	{"Der Bericht liegt zur Überprüfung bereit.","Sie verfasste einen detaillierten Bericht."}	2	21	1	\N	Berichte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10152	besprechungsprotokoll	{"minutes of the meeting"}	{"Das Besprechungsprotokoll wird an alle verschickt.","Im Protokoll wurden alle Entscheidungen festgehalten."}	4	51	3	\N	besprechungsprotokolle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10153	ergebnisprotokoll	{"results log"}	{"Das Ergebnisprotokoll fasst die wichtigsten Punkte zusammen.","Bitte lesen Sie das Ergebnisprotokoll vor der nächsten Sitzung."}	4	51	3	\N	ergebnisprotokolle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10154	mitarbeiterbesprechung	{"staff meeting"}	{"Die Mitarbeiterbesprechung findet jeden Montag statt.","In der Besprechung wurden neue Projekte vorgestellt."}	4	51	2	\N	mitarbeiterbesprechungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10155	projektvorstellung	{"project presentation"}	{"Die Projektvorstellung dauerte zwei Stunden.","Die Vorstellung des neuen Produkts war überzeugend."}	4	51	2	\N	projektvorstellungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10156	rückblick	{review}	{"Im Rückblick zeigte sich, dass die Ziele erreicht wurden.","Der Jahresrückblick wird im Dezember präsentiert."}	4	51	1	\N	rückblicke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10157	sitzung	{meeting}	{"Die Sitzung wurde auf nächste Woche verschoben.","In der Sitzung wurden Budgetkürzungen diskutiert."}	4	51	2	\N	sitzungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10158	tagesordnungspunkt (top)	{"agenda item"}	{"Der erste Tagesordnungspunkt ist die Budgetplanung.","TOP 3 wurde auf die nächste Sitzung vertagt."}	4	51	1	\N	tagesordnungspunkte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10159	teambesprechung	{"team meeting"}	{"Die wöchentliche Teambesprechung stärkt die Zusammenarbeit.","In der Teambesprechung werden Aufgaben verteilt."}	4	51	2	\N	teambesprechungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10160	verlaufsprotokoll	{"history log"}	{"Das Verlaufsprotokoll dokumentiert alle Diskussionen.","Ein Verlaufsprotokoll ist detaillierter als ein Ergebnisprotokoll."}	4	51	3	\N	verlaufsprotokolle	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10161	vorbesprechung	{"preliminary discussion"}	{"Die Vorbesprechung klärte organisatorische Fragen.","Ohne Vorbesprechung kann das Projekt nicht starten."}	4	51	2	\N	vorbesprechungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10162	mallen	{"to email"}	{"Bitte mall mir das Protokoll zu.","Er mallte die Einladungen an alle Teilnehmer."}	4	51	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7187	nachfragen	{"to ask about"}	{"Bei Unklarheiten können Sie gerne nachfragen.","Sie fragte nach, um Details zu klären."}	1	31	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10163	nachvollziehen	{"to understand"}	{"Die Argumente sind leicht nachzuvollziehen.","Er konnte die Entscheidung nicht nachvollziehen."}	4	51	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10164	protokollieren	{"to record"}	{"Bitte protokollieren Sie alle Beschlüsse.","Der Sekretär protokollierte die Diskussionen."}	4	51	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10165	widersprechen	{"to contradict"}	{"Sie widersprach der vorgeschlagenen Lösung.","In der Sitzung wurde lebhaft widersprochen."}	4	51	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10166	der ansicht sein, dass ...	{"to be of the opinion that ..."}	{"Ich bin der Ansicht, dass wir mehr Zeit benötigen.","Sie war der Ansicht, dass die Kosten zu hoch sind."}	4	51	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10167	ein meeting abhalten	{"to hold a meeting"}	{"Wir werden nächste Woche ein virtuelles Meeting abhalten.","Die Abteilung hält monatliche Meetings ab."}	4	51	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10168	einen termin vorziehen	{"to bring forward an appointment"}	{"Der Termin wurde auf Dienstag vorgezogen.","Können wir den Meeting-Termin vorziehen?"}	4	51	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10169	beamer	{"video projector"}	{"Der Beamer funktionierte während der Präsentation nicht.","Bitte schließen Sie den Laptop an den Beamer an."}	4	51	1	\N	beamer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10170	besprechungsunterlagen	{"meeting documents"}	{"Die Besprechungsunterlagen wurden im Voraus versendet.","Bitte bringen Sie die Unterlagen zur Sitzung mit."}	4	51	2	\N	besprechungsunterlagen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10171	flipchart	{"flip chart"}	{"Am Flipchart wurden die Ideen visualisiert.","Das Flipchart steht im Konferenzraum bereit."}	4	51	3	\N	flipcharts	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10172	leinwand	{screen}	{"Die Präsentation wird auf die Leinwand projiziert.","Die Leinwand im Saal ist sehr groß."}	4	51	2	\N	leinwände	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10173	moderationskarten (pl)	{"presentation cards"}	{"Die Moderationskarten hängen an der Pinnwand.","Bitte beschriften Sie die Moderationskarten deutlich."}	4	51	2	\N	moderationskarten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10174	moderationskoffer	{"presentation case"}	{"Der Moderationskoffer enthält Stifte und Karten.","Holen Sie bitte den Moderationskoffer aus dem Lager."}	4	51	1	\N	moderationskoffer	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10202	kalenderjahr	{"calendar year"}	{"Das Projekt läuft bis Ende des Kalenderjahres.","Urlaubstage gelten pro Kalenderjahr."}	4	52	3	\N	kalenderjahre	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10175	netzwerkanschluss	{"network connection"}	{"Der Netzwerkanschluss im Raum ist defekt.","Für die Präsentation benötigen wir einen stabilen Netzwerkanschluss."}	4	51	1	\N	netzwerkanschlüsse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10176	pinnwand	{pinboard}	{"An der Pinnwand hängen die aktuellen Infos.","Bitte heften Sie den Plan an die Pinnwand."}	4	51	2	\N	pinnwände	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10177	tagungsraum	{"conference room"}	{"Der Tagungsraum ist für 50 Personen ausgelegt.","Bitte reservieren Sie den Tagungsraum für Donnerstag."}	4	51	1	\N	tagungsräume	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10178	whiteboard	{whiteboard}	{"Am Whiteboard wurden die Ideen skizziert.","Das Whiteboard muss nach der Sitzung gereinigt werden."}	4	51	3	\N	whiteboards	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10179	ausblick	{forecast}	{"Der Ausblick auf das nächste Quartal ist positiv.","Im Ausblick werden zukünftige Ziele erläutert."}	4	51	1	\N	ausblicke	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10180	controlling	{controlling}	{"Das Controlling überwacht die Budgeteinhaltung.","Eine Abteilung für Controlling ist essenziell."}	4	51	3	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10181	jahresbilanz	{"annual results"}	{"Die Jahresbilanz wird im März veröffentlicht.","Die Bilanz zeigt einen Gewinn von 10 %."}	4	51	2	\N	jahresbilanzen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10182	prognose	{prognosis}	{"Die Prognose für das nächste Jahr ist optimistisch.","Wirtschaftsprognosen beeinflussen Investitionsentscheidungen."}	4	51	2	\N	prognosen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10183	quartalsaufstellung	{"quarterly statement"}	{"Die Quartalsaufstellung zeigt einen Umsatzrückgang.","Die Aufstellung wird dem Vorstand vorgelegt."}	4	51	2	\N	quartalsaufstellungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10184	quote	{quota}	{"Die Quote der weiblichen Führungskräfte steigt.","Die Exportquote liegt bei 40 %."}	4	51	2	\N	quoten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10185	knapp	{"just under"}	{"Das Budget wurde knapp eingehalten.","Die Frist wurde knapp verpasst."}	4	51	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10186	abdeckung	{cover}	{"Die Abdeckung schützt das Gerät vor Staub.","Bitte entfernen Sie die Abdeckung vorsichtig."}	4	52	2	\N	abdeckungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10187	anschlusskontakt	{contact}	{"Der Anschlusskontakt ist korrekt ausgerichtet.","Überprüfen Sie die Anschlusskontakte auf Verschmutzung."}	4	52	1	\N	anschlusskontakte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10188	display	{display}	{"Das Display zeigt die aktuellen Daten an.","Ein kaputtes Display muss ersetzt werden."}	4	52	3	\N	displays	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10189	pfeil	{arrow}	{"Folgen Sie dem Pfeil zum Notausgang.","Ein roter Pfeil markiert die Richtung."}	4	52	1	\N	pfeile	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10190	qr-code	{"QR code"}	{"Scannen Sie den QR-Code für weitere Informationen.","Der QR-Code ist auf dem Gerät angebracht."}	4	52	1	\N	qr-codes	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10191	standort	{location}	{"Der Standort des Feuerlöschers ist markiert.","Der neue Standort der Firma ist zentral."}	4	52	1	\N	standorte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10192	touchscreen	{touchscreen}	{"Der Touchscreen reagiert nicht mehr.","Reinigen Sie den Touchscreen regelmäßig."}	4	52	1	\N	touchscreens	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10193	usb-anschluss	{"USB port"}	{"Der USB-Anschluss ist defekt.","Stecken Sie das Kabel in den USB-Anschluss."}	4	52	1	\N	usb-anschlüsse	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10194	aktualisieren	{"to update"}	{"Bitte aktualisieren Sie die Software.","Das System wird automatisch aktualisiert."}	4	52	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10195	einrasten	{"to click into place"}	{"Das Gerät muss einrasten, um sicher zu sein.","Der Deckel rastet beim Schließen ein."}	4	52	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7830	einrichten	{"to furnish"}	{"Wir müssen den neuen Drucker einrichten.","Das Büro wurde ergonomisch eingerichtet."}	2	15	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7678	herunterladen	{"to download"}	{"Laden Sie die Anleitung herunter.","Das Update wird gerade heruntergeladen."}	2	13	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10196	navigieren	{"to navigate"}	{"Navigieren Sie zum nächsten Menüpunkt.","Er navigierte problemlos durch die Software."}	4	52	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10197	zoomen	{"to zoom"}	{"Zoomen Sie in die Grafik für Details.","Das Bild lässt sich nicht weiter zoomen."}	4	52	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10198	arbeitsunfähigkeit	{"incapacity to work"}	{"Die Arbeitsunfähigkeit muss ärztlich bescheinigt werden.","Bei langer Arbeitsunfähigkeit gibt es Krankengeld."}	4	52	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10199	bestimmungen (pl)	{regulations}	{"Die Bestimmungen zum Arbeitsschutz sind streng.","Alle Bestimmungen müssen eingehalten werden."}	4	52	2	\N	bestimmungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10201	freizeitausgleich	{"time off in lieu"}	{"Überstunden werden durch Freizeitausgleich abgegolten.","Der Freizeitausgleich muss innerhalb eines Monats genommen werden."}	4	52	1	\N	freizeitausgleiche	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10203	betriebliche notwendigkeit	{"operational necessity"}	{"Die Änderung erfolgte aus betrieblicher Notwendigkeit.","Überstunden sind nur bei betrieblicher Notwendigkeit erlaubt."}	4	52	2	\N	betriebliche notwendigkeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10204	arbeitsschutzschuhe (pl)	{"protective shoes"}	{"Arbeitsschutzschuhe sind in der Werkstatt Pflicht.","Die Firma stellt kostenlos Arbeitsschutzschuhe zur Verfügung."}	4	52	2	\N	arbeitsschutzschuhe	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10205	berufsgruppe	{"group of professions"}	{"Diese Regelung betrifft alle Berufsgruppen.","Ärzte und Pfleger bilden eine eigene Berufsgruppe."}	4	52	2	\N	berufsgruppen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10206	blutung	{bleeding}	{"Bei starken Blutungen sofort den Notarzt rufen.","Die Blutung wurde mit einem Verband gestoppt."}	4	52	2	\N	blutungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10207	ersthelfer/-in	{"first responder"}	{"Der Ersthelfer leistete sofort Hilfe.","Jede Abteilung hat einen ausgebildeten Ersthelfer."}	4	52	5	\N	ersthelfer/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10208	evakuierung	{evacuation}	{"Die Evakuierung verlief reibungslos.","Üben Sie regelmäßig die Evakuierung des Gebäudes."}	4	52	2	\N	evakuierungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10209	flucht-/rettungsweg	{"escape/emergency route"}	{"Der Fluchtweg muss immer frei bleiben.","Markieren Sie die Rettungswege deutlich."}	4	52	1	\N	flucht-/rettungswege	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10210	gehörschutz	{"hearing protection"}	{"Tragen Sie in der Werkstatt immer Gehörschutz.","Der Gehörschutz liegt im Lager bereit."}	4	52	1	\N	gehörschütze	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10211	notausgang	{"emergency exit"}	{"Der Notausgang ist mit einem Schild gekennzeichnet.","Blockieren Sie niemals den Notausgang."}	4	52	1	\N	notausgänge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10212	platzwunde	{laceration}	{"Die Platzwunde wurde genäht.","Bei einer Platzwunde ist Erste Hilfe wichtig."}	4	52	2	\N	platzwunden	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10213	rutschgefahr	{"slip hazard"}	{"Bei Rutschgefahr Schilder aufstellen.","Nasse Böden erhöhen die Rutschgefahr."}	4	52	2	\N	rutschgefahren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
8938	sammelstelle	{"collection point"}	{"Die Sammelstelle befindet sich auf dem Parkplatz.","Nach der Evakuierung gehen Sie zur Sammelstelle."}	3	4	2	\N	Sammelstellen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10214	sanitäter/-in	{paramedic}	{"Der Sanitäter versorgte die Verletzten.","Sanitäterinnen sind im Schichtdienst tätig."}	4	52	5	\N	sanitäter/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10215	schutzausrüstung	{"protective equipment"}	{"Tragen Sie immer die vorgeschriebene Schutzausrüstung.","Die Schutzausrüstung wird vom Arbeitgeber gestellt."}	4	52	2	\N	schutzausrüstungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10216	schutzbrille	{"safety goggles"}	{"Die Schutzbrille schützt die Augen vor Spänen.","Ohne Schutzbrille darf nicht gearbeitet werden."}	4	52	2	\N	schutzbrillen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10217	schutzhelm	{"hard hat"}	{"Auf der Baustelle ist ein Schutzhelm Pflicht.","Der Schutzhelm liegt im Werkzeugkoffer."}	4	52	1	\N	schutzhelme	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10218	stolper-/sturzgefahr	{"risk of tripping/falling"}	{"Achten Sie auf Stolpergefahr durch lose Kabel.","Sturzgefahr besteht bei nassen Treppen."}	4	52	2	\N	stolper-/sturzgefahren	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10219	das gleichgewicht verlieren	{"to lose one’s balance"}	{"Er verlor das Gleichgewicht und stürzte.","Auf dem Gerüst darf man nicht das Gleichgewicht verlieren."}	4	52	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10220	erste hilfe leisten	{"to administer first aid"}	{"Jeder Mitarbeiter muss Erste Hilfe leisten können.","Sie leistete Erste Hilfe, bis der Arzt kam."}	4	52	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10221	in gefahr bringen	{"to put in danger"}	{"Falsche Handhabung bringt Kollegen in Gefahr.","Bringen Sie sich nicht unnötig in Gefahr."}	4	52	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10222	sicherheitsvorschriften (pl) befolgen	{"to follow safety regulations"}	{"Befolgen Sie immer die Sicherheitsvorschriften.","Nur wer die Vorschriften befolgt, arbeitet sicher."}	4	52	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10223	abmahnung	{warning}	{"Eine Abmahnung kann vor einer Kündigung ausgesprochen werden.","Wegen wiederholter Verspätung erhielt er eine Abmahnung."}	4	53	2	\N	abmahnungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10224	ausnahmegenehmigung	{"special authorisation"}	{"Die Ausnahmegenehmigung wurde vom Chef unterschrieben.","Für diese Tätigkeit benötigen Sie eine Ausnahmegenehmigung."}	4	53	2	\N	ausnahmegenehmigungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10225	beförderung	{promotion}	{"Sie feierte ihre Beförderung zur Abteilungsleiterin.","Beförderungen sind an Leistungen geknüpft."}	4	53	2	\N	beförderungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10200	freistellung	{"release from work"}	{"Die Freistellung für die Fortbildung wurde genehmigt.","Bei Krankheit erfolgt eine Freistellung vom Dienst."}	4	52	2	\N	Freistellungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10226	führungsqualitäten (pl)	{"leadership qualities"}	{"Führungsqualitäten sind für Managementpositionen entscheidend.","Er bewies seine Führungsqualitäten im Projekt."}	4	53	2	\N	führungsqualitäten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10227	honoraritätigkeit	{"fee-based work"}	{"Honoraritätigkeit erfordert eine genaue Abrechnung.","Sie übt eine Honoraritätigkeit neben ihrem Hauptjob aus."}	4	53	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10228	minijob	{mini-job}	{"Sie arbeitet in einem Minijob als Aushilfe.","Minijobs sind auf 520 Euro pro Monat begrenzt."}	4	53	1	\N	minijobs	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10229	nebentätigkeit	{"part-time work"}	{"Die Nebentätigkeit muss dem Arbeitgeber gemeldet werden.","Er hat eine Nebentätigkeit als Übersetzer."}	4	53	2	\N	nebentätigkeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10230	sperrzeit	{"blocking time"}	{"Während der Sperrzeit gibt es kein Arbeitslosengeld.","Die Sperrzeit beträgt in der Regel drei Monate."}	4	53	2	\N	sperrzeiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10231	werkvertrag	{"contract for work and services"}	{"Der Werkvertrag wurde für sechs Monate verlängert.","Werkverträge gelten oft für projektbezogene Arbeiten."}	4	53	1	\N	werkverträge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10232	zeitarbeit	{"temporary employment"}	{"Zeitarbeit bietet Flexibilität für Arbeitgeber und Arbeitnehmer.","Er ist über eine Zeitarbeitsfirma angestellt."}	4	53	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10233	befristet	{temporary}	{"Der befristete Vertrag endet im Dezember.","Befristete Arbeitsverhältnisse sind in der Probezeit üblich."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10234	beiderseits	{mutual}	{"Die Kündigung erfolgte beiderseits einvernehmlich.","Beiderseits bestehen keine weiteren Ansprüche."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10235	ablauf der kündigungsfrist	{"expiry of the notice period"}	{"Nach Ablauf der Kündigungsfrist ist das Arbeitsverhältnis beendet.","Der Ablauf der Kündigungsfrist beträgt drei Monate."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10236	anrechnung des resturlaubs	{"crediting of remaining leave"}	{"Die Anrechnung des Resturlaubs erfolgt im Dezember.","Der Resturlaub wird auf das nächste Jahr angerechnet."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10237	ärztliche bescheinigung	{"medical certificate"}	{"Die ärztliche Bescheinigung muss dem Arbeitgeber vorgelegt werden.","Ohne ärztliche Bescheinigung gibt es keine Lohnfortzahlung."}	4	53	2	\N	ärztliche bescheinigungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10238	aus betrieblichen gründen (pl)	{"for operational reasons"}	{"Die Kündigung erfolgte aus betrieblichen Gründen.","Überstunden sind nur aus betrieblichen Gründen zulässig."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10239	betriebsbedingte kündigung	{redundancy}	{"Die betriebsbedingte Kündigung wurde angekündigt.","Bei betriebsbedingten Kündigungen gibt es Abfindungen."}	4	53	2	\N	betriebsbedingte kündigungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10240	etwas bedarf der schriftform	{"something requires the written form"}	{"Die Kündigung bedarf der Schriftform.","Vertragsänderungen bedürfen der Schriftform."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10241	fortzahlung des gehalts/der vergütung	{"continued payment of salary/remuneration"}	{"Die Fortzahlung des Gehalts ist gesetzlich geregelt.","Bei Krankheit erfolgt die Fortzahlung der Vergütung."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10242	im homeoffice arbeiten	{"to work from home"}	{"Viele Mitarbeiter arbeiten seit der Pandemie im Homeoffice.","Im Homeoffice zu arbeiten spart Pendelzeit."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10243	interne angelegenheit	{"internal affairs"}	{"Das ist eine interne Angelegenheit der Firma.","Interne Angelegenheiten werden nicht öffentlich diskutiert."}	4	53	2	\N	interne angelegenheiten	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10244	regelmäßige wöchentliche arbeitszeit	{"regular weekly working hours"}	{"Die regelmäßige wöchentliche Arbeitszeit beträgt 40 Stunden.","Überschreitungen der Arbeitszeit müssen dokumentiert werden."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10245	sich arbeitssuchend melden	{"to register as a jobseeker"}	{"Er muss sich bei der Agentur für Arbeit arbeitssuchend melden.","Nach der Kündigung meldete sie sich sofort arbeitssuchend."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10246	den vertrag verlängern	{"to extend the contract"}	{"Der befristete Vertrag wurde um ein Jahr verlängert.","Beide Parteien wollen den Vertrag verlängern."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10247	arbeitslosenversicherung	{"unemployment insurance"}	{"Die Arbeitslosenversicherung zahlt bei Jobverlust.","Beiträge zur Arbeitslosenversicherung werden automatisch abgezogen."}	4	53	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10248	bruttovergütung	{"gross remuneration"}	{"Die Bruttovergütung enthält noch keine Abzüge.","Die Bruttovergütung wird im Vertrag festgelegt."}	4	53	2	\N	bruttovergütungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10249	kirchensteuer	{"church tax"}	{"Die Kirchensteuer wird nur bei Kirchenmitgliedschaft erhoben.","Die Kirchensteuer beträgt 9 % der Lohnsteuer."}	4	53	2	\N	kirchensteuern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10250	konfession	{denomination}	{"Die Konfession spielt bei der Kirchensteuer eine Rolle.","Er ist ohne Konfession."}	4	53	2	\N	konfessionen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10251	lohnsteuer	{"wage tax"}	{"Die Lohnsteuer wird monatlich vom Gehalt abgezogen.","Die Höhe der Lohnsteuer hängt von der Steuerklasse ab."}	4	53	2	\N	lohnsteuern	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10252	nettoverdienst	{"net earnings"}	{"Der Nettoverdienst ist nach Abzügen deutlich geringer.","Sie gibt ihren Nettoverdienst monatlich genau aus."}	4	53	1	\N	nettoverdienste	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10253	pflegeversicherung	{"long-term care insurance"}	{"Die Pflegeversicherung deckt Kosten für Pflegebedürftige.","Beiträge zur Pflegeversicherung sind gesetzlich festgelegt."}	4	53	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10254	rentenversicherung	{"pension insurance"}	{"Die Rentenversicherung sichert das Einkommen im Alter.","Beiträge zur Rentenversicherung werden automatisch einbehalten."}	4	53	2	\N	rentenversicherungen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10255	solidaritätszuschlag (solz)	{"solidarity surcharge"}	{"Der Solidaritätszuschlag wird für den Aufbau Ostdeutschlands verwendet.","Seit 2021 entfällt der Soli für die meisten Bürger."}	4	53	1	\N	solidaritätszuschläge	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10256	steuerklasse	{"tax bracket"}	{"Die Steuerklasse beeinflusst die Höhe der Lohnsteuer.","Verheiratete Paare können ihre Steuerklasse wählen."}	4	53	2	\N	steuerklassen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10257	abziehen	{"to subtract"}	{"Von der Bruttosumme werden Steuern abgezogen.","Die Kosten können von der Steuer abgezogen werden."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10258	einbehalten	{"to retain"}	{"Der Arbeitgeber behält die Sozialabgaben ein.","Einbehaltene Beträge werden an die Behörden überwiesen."}	4	53	\N	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10259	belegschaft	{workforce}	{"Die Belegschaft wurde über die Änderungen informiert.","Eine motivierte Belegschaft steigert die Produktivität."}	4	53	2	\N	belegschaften	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10260	gleichberechtigung	{"equal rights"}	{"Gleichberechtigung am Arbeitsplatz ist gesetzlich vorgeschrieben.","Das Unternehmen fördert die Gleichberechtigung aller Mitarbeiter."}	4	53	2	\N	\N	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
7965	integration	{integration}	{"Die Integration neuer Mitarbeiter dauert einige Wochen.","Sprachkurse unterstützen die Integration am Arbeitsplatz."}	2	16	2	\N	Integrationen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10261	nachfolger/-in	{successor}	{"Der Nachfolger des Chefs wurde intern gefunden.","Die Nachfolgerin tritt ihre Stelle im Januar an."}	4	53	5	\N	nachfolger/-innen	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
10262	schwerbehinderte	{"severely disabled person"}	{"Schwerbehinderte haben Anspruch auf besondere Unterstützung.","Der Betrieb stellt gezielt Schwerbehinderte ein."}	4	53	5	\N	schwerbehinderte	\N	d9a98059-2f81-4cfa-a9a3-04545a677972
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

SELECT pg_catalog.setval('public."Conversation_id_seq"', 38, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 5, true);


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.levels_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.topics_id_seq', 79, true);


--
-- Name: word_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.word_history_id_seq', 27, true);


--
-- Name: words_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_table_id_seq', 10276, true);


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
-- Name: user_change_logs user_change_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_change_logs
    ADD CONSTRAINT user_change_logs_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: word_history word_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_history
    ADD CONSTRAINT word_history_pkey PRIMARY KEY (id);


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
-- Name: Conversation Conversation_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conversation"
    ADD CONSTRAINT "Conversation_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


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
-- Name: topics topics_levelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT "topics_levelId_fkey" FOREIGN KEY ("levelId") REFERENCES public.levels(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_change_logs user_change_logs_performedById_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_change_logs
    ADD CONSTRAINT "user_change_logs_performedById_fkey" FOREIGN KEY ("performedById") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_change_logs user_change_logs_targetUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_change_logs
    ADD CONSTRAINT "user_change_logs_targetUserId_fkey" FOREIGN KEY ("targetUserId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: word_history word_history_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_history
    ADD CONSTRAINT "word_history_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: word_history word_history_wordId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_history
    ADD CONSTRAINT "word_history_wordId_fkey" FOREIGN KEY ("wordId") REFERENCES public.words_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: words_table words_table_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words_table
    ADD CONSTRAINT "words_table_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


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

