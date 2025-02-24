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


-- ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


-- ALTER SCHEMA graphql OWNER TO supabase_admin;

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

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
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
-- Data for Name: _AntonymRelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_AntonymRelation" ("A", "B") FROM stdin;
176	1651
1651	176
1301	1270
1270	1301
1389	1394
1394	1389
1396	1392
1666	1392
1392	1666
1392	1396
1437	1395
1395	1437
\.


--
-- Data for Name: _SimilarWordRelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_SimilarWordRelation" ("A", "B") FROM stdin;
1620	1301
1301	1620
\.


--
-- Data for Name: _SynonymRelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_SynonymRelation" ("A", "B") FROM stdin;
565	1647
1647	565
1650	1525
1525	1650
1665	1664
1664	1665
1436	1389
1389	1436
1404	1392
1392	1404
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
59fc3dfd-f3c6-4eff-8d9b-78ea02133fe4	3e4f6d22d953dbf377fa6449f21f29e7c057168adf684fd1c54c3b163499a491	2025-01-19 06:01:25.709216+00	20250119060125_init	\N	\N	2025-01-19 06:01:25.532412+00	1
dd378218-7f98-406a-8d9a-101ff767f551	3e4f6d22d953dbf377fa6449f21f29e7c057168adf684fd1c54c3b163499a491	2025-01-19 05:38:01.37951+00	20250119053801_init	\N	\N	2025-01-19 05:38:01.195702+00	1
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, name) FROM stdin;
1	der
2	die
3	das
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
\.


--
-- Data for Name: words_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.words_table (id, value, meaning, sentences, "levelId", "topicId", "articleId", "partOfSpeechId", "pluralForm") FROM stdin;
2	abflug	{departure}	\N	3	2	1	\N	\N
3	absage	{cancellation}	\N	3	2	2	\N	\N
4	aktiv	{active}	\N	3	2	\N	\N	\N
5	alkohol	{alcohol}	\N	3	2	1	\N	\N
6	angenehm	{pleasant}	\N	3	2	\N	\N	\N
7	annulliert	{cancelled}	\N	3	2	\N	\N	\N
8	anzeigetafel	{"bulletin board"}	\N	3	2	2	\N	anzeigetafeln
9	aufruf	{call}	\N	3	2	1	\N	\N
10	ausgang	{exit}	\N	3	2	1	\N	ausgänge
11	ausstattung	{equipment}	\N	3	2	2	\N	\N
12	behälter	{container}	\N	3	2	1	\N	behälter
13	betreten	{"to enter"}	\N	3	2	\N	\N	\N
14	bewohner/in	{resident}	\N	3	2	2	\N	bewohner/innen
15	bordkarte	{"boarding pass"}	\N	3	2	2	\N	\N
16	camper/in	{camper}	\N	3	2	2	\N	camper/innen
17	campingplatz	{campsite}	\N	3	2	1	\N	campingplätze
18	check-in-schalter	{"check-in desk"}	\N	3	2	2	\N	\N
19	container	{container}	\N	3	2	3	\N	container
20	dienstreise	{"business trip"}	\N	3	2	2	\N	\N
21	doppelbett	{"double bed"}	\N	3	2	3	\N	doppelbetten
22	doppelzimmer	{"double room"}	\N	3	2	3	\N	doppelzimmer
23	einchecken	{"to check-in"}	\N	3	2	\N	\N	\N
24	einsteigezeit	{"boarding time"}	\N	3	2	2	\N	\N
25	einzelzimmer	{"single room"}	\N	3	2	3	\N	einzelzimmer
26	erleben	{"to experience"}	\N	3	2	\N	\N	\N
27	flug	{flight}	\N	3	2	1	\N	flüge
28	flugbegleiter/in	{"flight attendant"}	\N	3	2	2	\N	flugbegleiter/innen
29	fluggast	{passenger}	\N	3	2	1	\N	fluggäste
30	fluggesellschaft	{airline}	\N	3	2	2	\N	fluggesellschaften
31	führen	{"to lead"}	\N	3	2	\N	\N	\N
32	füttern	{"to feed"}	\N	3	2	\N	\N	\N
33	gate	{gate}	\N	3	2	3	\N	\N
34	gepäck	{luggage}	\N	3	2	3	\N	\N
35	gepäckausgabe	{"baggage reclaim"}	\N	3	2	2	\N	\N
36	gepäckband	{"luggage belt"}	\N	3	2	3	\N	\N
37	gestattet sein	{"to be permitted"}	\N	3	2	\N	\N	\N
38	halbpension	{half-board}	\N	3	2	2	\N	(hp)
39	handgepäck	{"hand luggage"}	\N	3	2	3	\N	\N
40	historisch	{historical}	\N	3	2	\N	\N	\N
41	hostel	{hostel}	\N	3	2	3	\N	\N
42	hygienisch	{hygienic}	\N	3	2	\N	\N	\N
43	inlineskaten	{"inline skating"}	\N	3	2	3	\N	\N
44	jugendherberge	{"youth hostel"}	\N	3	2	2	\N	jugendherbergen
45	katalog	{catalogue}	\N	3	2	1	\N	kataloge
46	klettern	{"to climb"}	\N	3	2	\N	\N	\N
47	komfortabel	{comfortable}	\N	3	2	\N	\N	\N
48	lage	{site}	\N	3	2	2	\N	\N
49	lagerfeuer	{campfire}	\N	3	2	3	\N	\N
50	landen	{"to land"}	\N	3	2	\N	\N	\N
51	lärm	{noise}	\N	3	2	1	\N	\N
52	lautsprecherdurchsage	{"tannoy announcement"}	\N	3	2	2	\N	lautsprecherdurchsagen
53	lebhaft	{lively}	\N	3	2	\N	\N	\N
54	leine	{rope}	\N	3	2	2	\N	\N
55	leuchtturm	{lighthouse}	\N	3	2	1	\N	leuchttürme
56	meerblick	{seaview}	\N	3	2	1	\N	\N
57	mitten	{middle}	\N	3	2	\N	\N	\N
58	nebel	{fog}	\N	3	2	1	\N	\N
59	neblig	{foggy}	\N	3	2	\N	\N	\N
60	paradies	{paradise}	\N	3	2	3	\N	\N
61	passagier/in	{passenger}	\N	3	2	2	\N	passagiere
62	passkontrolle	{"passport control"}	\N	3	2	2	\N	\N
63	pilotenstreik	{"pilot strike"}	\N	3	2	1	\N	\N
64	pool	{pool}	\N	3	2	3	\N	\N
65	rechtzeitig	{"on time"}	\N	3	2	\N	\N	\N
66	reisebüro	{"travel agency"}	\N	3	2	1	\N	\N
67	reiseplan	{itinerary}	\N	3	2	1	\N	reisepläne
68	reiseplanung	{"travel planning"}	\N	3	2	2	\N	\N
69	reiten	{"to ride"}	\N	3	2	\N	\N	\N
70	ruhezeit	{"rest period"}	\N	3	2	2	\N	ruhezeiten
71	sauber	{clean}	\N	3	2	\N	\N	\N
72	sauberkeit	{cleanliness}	\N	3	2	2	\N	\N
73	schalter	{desk}	\N	3	2	1	\N	schalter
74	schlange	{snake}	\N	3	2	2	\N	\N
75	sonnenschirm	{parasol}	\N	3	2	1	\N	sonnenschirme
76	sonnenterrasse	{"sun terrace"}	\N	3	2	2	\N	sonnenterrassen
77	sonnenuntergang	{sunset}	\N	3	2	1	\N	sonnenuntergänge
78	stern	{star}	\N	3	2	1	\N	sterne
79	stören	{"to disturb"}	\N	3	2	\N	\N	\N
80	streichholz	{match}	\N	3	2	3	\N	streichhölzer
81	streiken	{"to strike"}	\N	3	2	\N	\N	\N
82	taschenlampe	{torch}	\N	3	2	2	\N	\N
83	taschenmesser	{"pocket knife"}	\N	3	2	3	\N	\N
84	traumhaft	{wonderful}	\N	3	2	\N	\N	\N
85	übernachten	{"to stay overnight"}	\N	3	2	\N	\N	\N
86	übernachtung	{"overnight stay"}	\N	3	2	2	\N	übernachtungen
87	übernachtung mit frühstück	{"overnight stay with breakfast"}	\N	3	2	2	\N	üf
88	umgebung	{surroundings}	\N	3	2	2	\N	\N
89	umgehend	{immediately}	\N	3	2	\N	\N	\N
90	verärgert	{annoyed}	\N	3	2	\N	\N	\N
91	verreisen	{"to travel"}	\N	3	2	\N	\N	\N
92	verschieben	{"to postpone"}	\N	3	2	\N	\N	\N
93	wanderer	{hiker}	\N	3	2	1	\N	\N
94	wandertour	{"walking tour"}	\N	3	2	2	\N	wandertouren
95	waschraum	{"laundry room"}	\N	3	2	1	\N	waschräume
96	wohnwagen	{caravan}	\N	3	2	1	\N	\N
97	zelt	{tent}	\N	3	2	1	\N	\N
98	zoll	{customs}	\N	3	2	1	\N	\N
99	zuschlag	{fees}	\N	3	2	1	\N	zuschläge
100	absprechen	{"to arrange"}	\N	3	3	\N	\N	\N
101	der abstellplatz	{"parking space"}	\N	3	3	1	\N	abstellplätze
102	akzeptieren	{"to accept"}	\N	3	3	\N	\N	\N
103	anstreichen	{"to paint"}	\N	3	3	\N	\N	\N
104	der ärger	{trouble}	\N	3	3	1	\N	\N
105	ärgerlich	{annoying}	\N	3	3	\N	\N	\N
106	die aufregung	{commotion}	\N	3	3	1	\N	\N
107	die ausnahme	{exception}	\N	3	3	1	\N	\N
108	das balkongeländer	{"balcony railing"}	\N	3	3	3	\N	\N
109	befestigen	{"to secure"}	\N	3	3	\N	\N	\N
110	behalten	{"to keep"}	\N	3	3	\N	\N	\N
111	beleidigen	{"to offend"}	\N	3	3	\N	\N	\N
112	die beleidigung	{insult}	\N	3	3	1	\N	beleidigungen
113	berechtigt	{justified}	\N	3	3	\N	\N	\N
114	beschimpfen	{"to insult"}	\N	3	3	\N	\N	\N
115	die beschimpfung	{swear}	\N	3	3	1	\N	beschimpfungen
116	beschweren	{"to complain"}	\N	3	3	\N	\N	\N
117	der blumentopf	{"flower pot"}	\N	3	3	1	\N	blumentöpfe
118	bohren	{"to drill"}	\N	3	3	\N	\N	\N
119	deswegen	{"that is why"}	\N	3	3	\N	\N	\N
120	dumm	{stupid}	\N	3	3	\N	\N	\N
121	eilig	{urgent}	\N	3	3	\N	\N	\N
122	einhalten	{"to comply"}	\N	3	3	\N	\N	\N
123	einlegen	{"to insert"}	\N	3	3	\N	\N	\N
125	enden	{"to end"}	\N	3	3	\N	\N	\N
126	die entscheidung	{decision}	\N	3	3	1	\N	entscheidungen
127	entspannend	{relaxing}	\N	3	3	\N	\N	\N
128	entsprechen	{"to correspond to"}	\N	3	3	\N	\N	\N
129	erhöhen	{"to increase"}	\N	3	3	\N	\N	\N
130	erleichtern	{"to relieve"}	\N	3	3	\N	\N	\N
131	erwähnen	{"to mention"}	\N	3	3	\N	\N	\N
132	eskalieren	{"to escalate"}	\N	3	3	\N	\N	\N
133	exotisch	{exotic}	\N	3	3	\N	\N	\N
134	fair	{fair}	\N	3	3	\N	\N	\N
135	festkleben	{"to stick"}	\N	3	3	\N	\N	\N
136	die freude	{joy}	\N	3	3	1	\N	\N
137	die frist	{deadline}	\N	3	3	1	\N	fristen
138	fristgerecht	{punctual}	\N	3	3	\N	\N	\N
139	fristlos	{"without notice"}	\N	3	3	\N	\N	\N
140	der gemeinschaftsraum	{"common room"}	\N	3	3	1	\N	gemeinschaftsräume
141	gesetzlich	{legal}	\N	3	3	\N	\N	\N
142	hämmern	{"to hammer"}	\N	3	3	\N	\N	\N
143	heizen	{"to heat"}	\N	3	3	\N	\N	\N
144	die instandhaltung	{maintenance}	\N	3	3	1	\N	\N
145	klug	{clever}	\N	3	3	\N	\N	\N
146	der konflikt	{conflict}	\N	3	3	1	\N	konflikte
147	die kündigung	{termination}	\N	3	3	1	\N	\N
148	lüften	{"to air"}	\N	3	3	\N	\N	\N
149	massiv	{solid}	\N	3	3	\N	\N	\N
150	meckern	{"to whinge"}	\N	3	3	\N	\N	\N
151	das meerschweinchen	{"guinea pig"}	\N	3	3	3	\N	\N
152	die mieterhöhung	{"rent increase"}	\N	3	3	1	\N	\N
153	der mietspiegel	{"rent index"}	\N	3	3	1	\N	\N
154	der mietvertrag	{"rental contract"}	\N	3	3	1	\N	mietverträge
155	die modernisierung	{modernisation}	\N	3	3	1	\N	\N
156	nachsehen	{"to check"}	\N	3	3	\N	\N	\N
157	neugierig	{curious}	\N	3	3	\N	\N	\N
158	obwohl	{although}	\N	3	3	\N	\N	\N
159	offenbar	{obvious}	\N	3	3	\N	\N	\N
160	protestieren	{"to protest"}	\N	3	3	\N	\N	\N
161	der/die richter/in	{judge}	\N	3	3	1	\N	richter/innen
162	die rücksicht	{consideration}	\N	3	3	1	\N	\N
163	sammeln	{"to collect"}	\N	3	3	\N	\N	\N
164	sauer	{sour}	\N	3	3	\N	\N	\N
165	der schaden	{damages}	\N	3	3	1	\N	schäden
166	schmutzig	{dirty}	\N	3	3	\N	\N	\N
167	selbstverständlich	{"of course"}	\N	3	3	\N	\N	\N
168	sinnlos	{meaningless}	\N	3	3	\N	\N	\N
169	sinnvoll	{meaningful}	\N	3	3	\N	\N	\N
170	sortieren	{"to sort"}	\N	3	3	\N	\N	\N
171	stinken	{"to stink"}	\N	3	3	\N	\N	\N
172	streiten	{"to argue"}	\N	3	3	\N	\N	\N
173	total	{totally}	\N	3	3	\N	\N	\N
174	treu	{faithful}	\N	3	3	\N	\N	\N
175	überlegen	{"to think about"}	\N	3	3	\N	\N	\N
177	unglaublich	{unbelievable}	\N	3	3	\N	\N	\N
178	das unrecht	{unjust}	\N	3	3	3	\N	\N
179	das urteil	{judgement}	\N	3	3	3	\N	\N
180	vergleichbar	{comparable}	\N	3	3	\N	\N	\N
181	verpflichten	{"to compel"}	\N	3	3	\N	\N	\N
182	das verständnis	{understanding}	\N	3	3	3	\N	\N
183	der verstoß	{violation}	\N	3	3	1	\N	verstöße
184	verstoßen	{"to violate"}	\N	3	3	\N	\N	\N
185	völlig	{completely}	\N	3	3	\N	\N	\N
186	vorher	{before}	\N	3	3	\N	\N	\N
187	wegräumen	{"to clear away"}	\N	3	3	\N	\N	\N
188	der widerspruch	{contradiction}	\N	3	3	1	\N	widersprüche
189	wütend	{angry}	\N	3	3	\N	\N	\N
190	der zeitraum	{"time frame"}	\N	3	3	1	\N	zeiträume
191	ziemlich	{rather}	\N	3	3	\N	\N	\N
192	die zimmerlautstärke	{"room volume"}	\N	3	3	1	\N	\N
193	zugeben	{"to admit"}	\N	3	3	\N	\N	\N
194	zurücklassen	{"to leave behind"}	\N	3	3	\N	\N	\N
195	das zusammenleben	{"life together"}	\N	3	3	3	\N	\N
196	zustimmen	{"to agree"}	\N	3	3	\N	\N	\N
197	der zutritt	{access}	\N	3	3	1	\N	\N
198	das abgas	{"exhaust gas"}	\N	3	4	1	\N	abgase
199	das abwasser	{sewage}	\N	3	4	1	\N	\N
200	das altöl	{"waste oil"}	\N	3	4	1	\N	\N
201	das altpapier	{"waste paper"}	\N	3	4	1	\N	\N
202	das aluminium	{aluminium}	\N	3	4	1	\N	\N
203	andauernd	{lasting}	\N	3	4	\N	\N	\N
204	ankündigen	{"to announce"}	\N	3	4	\N	\N	\N
205	anstatt	{instead}	\N	3	4	\N	\N	\N
206	die begleitperson	{"accompanying person"}	\N	3	4	1	\N	\N
207	belasten	{"to pollute"}	\N	3	4	\N	\N	\N
208	die belastung	{pollution}	\N	3	4	1	\N	\N
209	beobachten	{"to observe"}	\N	3	4	\N	\N	\N
210	der beutel	{bag}	\N	3	4	1	\N	beutel
211	biologisch	{biological}	\N	3	4	\N	\N	\N
212	die chemikalie	{chemicals}	\N	3	4	1	\N	chemikalien
213	der deckel	{lid}	\N	3	4	1	\N	\N
214	doof	{stupid}	\N	3	4	\N	\N	\N
215	der eierkarton	{"egg box"}	\N	3	4	1	\N	eierkartons
216	die eierschale	{"egg shell"}	\N	3	4	1	\N	eierschalen
217	einfallen	{"to occur"}	\N	3	4	\N	\N	\N
218	das elektroauto	{"electric car"}	\N	3	4	1	\N	\N
219	das energiesparhaus	{"energy efficient house"}	\N	3	4	1	\N	\N
220	die energiesparlampe	{"energy efficient bulb"}	\N	3	4	1	\N	\N
221	das erdbeben	{earthquake}	\N	3	4	1	\N	\N
222	die erde	{earth}	\N	3	4	1	\N	\N
223	die erderwärmung	{"global warming"}	\N	3	4	1	\N	\N
224	die erlaubnis	{permission}	\N	3	4	1	\N	\N
225	der/die förster/in	{woodsman}	\N	3	4	1	\N	förster/innen
226	der gegenstand	{object}	\N	3	4	1	\N	gegenstände
227	der gegenvorschlag	{counterproposal}	\N	3	4	1	\N	gegenvorschläge
228	giftig	{toxic}	\N	3	4	\N	\N	\N
229	der haushalt	{household}	\N	3	4	1	\N	\N
230	das hochwasser	{high-tide}	\N	3	4	1	\N	\N
231	der/die hörer/in	{listener}	\N	3	4	1	\N	hörer/innen
232	der kaffeefilter	{"coffee filter"}	\N	3	4	1	\N	\N
233	das klima	{climate}	\N	3	4	1	\N	\N
234	der klimawandel	{"climate change"}	\N	3	4	1	\N	\N
235	die konservendose	{"preserving jars"}	\N	3	4	1	\N	\N
236	der kunststoff	{"synthetic material"}	\N	3	4	1	\N	kunststoffe
237	die luft	{air}	\N	3	4	1	\N	\N
238	die matratze	{mattress}	\N	3	4	1	\N	\N
239	das metall	{metal}	\N	3	4	1	\N	\N
240	der milchkarton	{"milk carton"}	\N	3	4	1	\N	milchkartons
241	die mülltonne	{"rubbish bin"}	\N	3	4	1	\N	\N
242	die mülltrennung	{"waste separation"}	\N	3	4	1	\N	\N
243	die naturkatastrophe	{"natural disaster"}	\N	3	4	1	\N	\N
244	das naturprodukt	{"natural product"}	\N	3	4	1	\N	naturprodukte
245	die obstschale	{"fruit skin"}	\N	3	4	1	\N	obstschalen
246	der papiermüll	{"paper waste"}	\N	3	4	1	\N	\N
247	die pappe	{cardboard}	\N	3	4	1	\N	\N
248	das picknick	{picnic}	\N	3	4	1	\N	\N
249	der planet	{planet}	\N	3	4	1	\N	planeten
250	das plastik	{plastic}	\N	3	4	1	\N	\N
251	recyceln	{"to recycle"}	\N	3	4	\N	\N	\N
252	der sack	{bag}	\N	3	4	1	\N	säcke
253	die sammelstelle	{"collection point"}	\N	3	4	1	\N	\N
254	schädigen	{"to damage"}	\N	3	4	\N	\N	\N
255	schädlich	{harmful}	\N	3	4	\N	\N	\N
256	der schadstoff	{"hazardous substance"}	\N	3	4	1	\N	schadstoffe
257	schützen	{"to protect"}	\N	3	4	\N	\N	\N
258	die solarenergie	{"solar energy"}	\N	3	4	1	\N	\N
259	der sondermüll	{"hazardous waste"}	\N	3	4	1	\N	\N
260	der sonnenschein	{sunshine}	\N	3	4	1	\N	\N
261	die sorge	{worry}	\N	3	4	1	\N	\N
262	sparsam	{economical}	\N	3	4	\N	\N	\N
263	der sperrmüll	{"bulky waste"}	\N	3	4	1	\N	\N
264	stattfinden	{"to take place"}	\N	3	4	\N	\N	\N
265	der tierschutz	{"animal protection"}	\N	3	4	1	\N	\N
266	das trinkwasser	{"drinking water"}	\N	3	4	1	\N	\N
267	trüb	{gloomy}	\N	3	4	\N	\N	\N
268	der tsunami	{tsunami}	\N	3	4	1	\N	\N
269	der turm	{tower}	\N	3	4	1	\N	\N
270	umdrehen	{"to turn around"}	\N	3	4	\N	\N	\N
271	umgehen	{"to go round"}	\N	3	4	\N	\N	\N
272	umweltfreundlich	{"environmentally friendly"}	\N	3	4	\N	\N	\N
273	der umweltschutz	{"environmental protection"}	\N	3	4	1	\N	\N
274	die umweltverschmutzung	{"environmental pollution"}	\N	3	4	1	\N	\N
275	das unwetter	{thunderstorm}	\N	3	4	1	\N	unwetter
276	verändern	{"to change"}	\N	3	4	\N	\N	\N
277	verlaufen	{"to continue"}	\N	3	4	\N	\N	\N
278	verschmutzen	{"to contaminate"}	\N	3	4	\N	\N	\N
280	die verschwendung	{waste}	\N	3	4	1	\N	\N
281	versprechen	{"to promise"}	\N	3	4	\N	\N	\N
282	verwerten	{"to exploit"}	\N	3	4	\N	\N	\N
283	voraussichtlich	{provisionally}	\N	3	4	\N	\N	\N
284	vorhersagen	{"to predict"}	\N	3	4	\N	\N	\N
285	wahrscheinlich	{probably}	\N	3	4	\N	\N	\N
286	wegschmeißen	{"to chuck out"}	\N	3	4	\N	\N	\N
287	wegwerfen	{"to throw away"}	\N	3	4	\N	\N	\N
288	der wertstoff	{"recyclable material"}	\N	3	4	1	\N	wertstoffe
289	der wind	{wind}	\N	3	4	1	\N	\N
290	die windel	{nappy}	\N	3	4	1	\N	windeln
291	der wirbelsturm	{hurricane}	\N	3	4	1	\N	wirbelstürme
292	die wolke	{cloud}	\N	3	4	1	\N	wolken
293	zerstören	{"to destroy"}	\N	3	4	\N	\N	\N
294	die zerstörung	{destruction}	\N	3	4	1	\N	\N
295	die zigarettenkippe	{"cigarette butts"}	\N	3	4	1	\N	zigarettenkippen
296	zurückfahren	{"to go back"}	\N	3	4	\N	\N	\N
298	anfassen	{"to touch"}	\N	3	5	\N	\N	\N
299	die anprobe	{"fitting room"}	\N	3	5	1	\N	\N
300	anprobieren	{"to try on"}	\N	3	5	\N	\N	\N
301	die art	{type}	\N	3	5	1	\N	arten
302	die artikelnummer	{"item number"}	\N	3	5	1	\N	artikelnummern
303	die atmung	{breathing}	\N	3	5	1	\N	\N
304	atmungsaktiv	{breathable}	\N	3	5	\N	\N	\N
305	aufmerksam	{attentive}	\N	3	5	\N	\N	\N
306	der auftrag	{order}	\N	3	5	1	\N	\N
307	die auftragsnummer	{"order number"}	\N	3	5	1	\N	\N
308	ausliefern	{"to deliver"}	\N	3	5	\N	\N	\N
309	die auswahl	{selection}	\N	3	5	1	\N	\N
310	der bankeinzug	{"direct debit"}	\N	3	5	1	\N	\N
279	verschwenden	{"to disappear","to waste"}	{}	3	4	\N	\N	\N
311	bereits	{already}	\N	3	5	\N	\N	\N
312	beschädigt	{damaged}	\N	3	5	\N	\N	\N
313	die bestellhotline	{"order hotline"}	\N	3	5	1	\N	\N
314	der betrag	{sum}	\N	3	5	1	\N	beträge
315	der bezahlvorgang	{"payment process"}	\N	3	5	1	\N	bezahlvorgänge
316	das callcenter	{"call centre"}	\N	3	5	1	\N	\N
317	der datenschutz	{"data protection"}	\N	3	5	1	\N	\N
318	dicht	{thick}	\N	3	5	\N	\N	\N
319	durchlässig	{permeable}	\N	3	5	\N	\N	\N
320	ebenso	{"as well"}	\N	3	5	\N	\N	\N
321	eher	{rather}	\N	3	5	\N	\N	\N
322	das eigentum	{property}	\N	3	5	1	\N	\N
323	die ergänzung	{addition}	\N	3	5	1	\N	ergänzungen
324	erhältlich	{available}	\N	3	5	\N	\N	\N
325	eventuell	{possible}	\N	3	5	\N	\N	\N
326	falls	{"in case"}	\N	3	5	\N	\N	\N
327	der gutschein	{voucher}	\N	3	5	1	\N	\N
328	herstellen	{"to manufacture"}	\N	3	5	\N	\N	\N
329	die herstellung	{manufacture}	\N	3	5	1	\N	\N
330	das impressum	{imprint}	\N	3	5	1	\N	\N
331	innerhalb	{within}	\N	3	5	\N	\N	\N
332	irgendwie	{somehow}	\N	3	5	\N	\N	\N
333	der kauf	{purchase}	\N	3	5	1	\N	\N
334	die kaufbestätigung	{"purchase confirmation"}	\N	3	5	1	\N	\N
335	der/die käufer/in	{customer}	\N	3	5	1	\N	käufer/innen
336	der kaufvertrag	{"sales contract"}	\N	3	5	1	\N	\N
337	die kosmetik	{cosmetics}	\N	3	5	1	\N	\N
338	die kundenbefragung	{"customer survey"}	\N	3	5	1	\N	\N
339	kundenfreundlich	{"customer friendly"}	\N	3	5	\N	\N	\N
340	das lager	{warehouse}	\N	3	5	1	\N	\N
341	lieferbar	{"in stock"}	\N	3	5	\N	\N	\N
342	die lieferbedingung	{"delivery conditions"}	\N	3	5	1	\N	lieferbedingungen
343	die lieferung	{delivery}	\N	3	5	1	\N	\N
344	luftdurchlässig	{breathable}	\N	3	5	\N	\N	\N
345	die mehrkosten	{"extra costs"}	\N	3	5	1	\N	\N
346	die nachnahme	{"cash on delivery"}	\N	3	5	1	\N	\N
347	der nachteil	{disadvantage}	\N	3	5	1	\N	\N
348	der onlineeinkauf	{"online shopping"}	\N	3	5	1	\N	\N
349	der onlineshop	{"online shop"}	\N	3	5	1	\N	\N
350	das onlineshopping	{"online shopping"}	\N	3	5	1	\N	\N
351	das paket	{parcel}	\N	3	5	1	\N	\N
352	der paketbote	{"parcel carrier"}	\N	3	5	1	\N	\N
353	der paketdienst	{"parcel service"}	\N	3	5	1	\N	\N
354	das porto	{postage}	\N	3	5	1	\N	\N
355	portofrei	{"postage paid"}	\N	3	5	\N	\N	\N
356	die portokosten	{postage}	\N	3	5	1	\N	\N
357	produzieren	{"to produce"}	\N	3	5	\N	\N	\N
358	die qualität	{quality}	\N	3	5	1	\N	\N
359	die reklamation	{complaint}	\N	3	5	1	\N	reklamationen
360	die retoure	{"return order"}	\N	3	5	1	\N	retouren
361	der retourenschein	{"return order slip"}	\N	3	5	1	\N	\N
362	die rücksendung	{"return delivery"}	\N	3	5	1	\N	\N
363	das shopping	{shopping}	\N	3	5	1	\N	\N
364	unverbindlich	{non-binding}	\N	3	5	\N	\N	\N
365	der/die verbraucher/in	{consumer}	\N	3	5	1	\N	verbraucher/innen
366	verpacken	{"to package"}	\N	3	5	\N	\N	\N
367	der versand	{shipping}	\N	3	5	1	\N	\N
368	die versandkosten	{"shipping fee"}	\N	3	5	1	\N	\N
369	versandkostenfrei	{"free of shipping costs"}	\N	3	5	\N	\N	\N
370	die versandkostenpauschale	{"flat shipping rate"}	\N	3	5	1	\N	\N
371	versenden	{"to send"}	\N	3	5	\N	\N	\N
372	die ware	{goods}	\N	3	5	1	\N	waren
373	der warenkorb	{basket}	\N	3	5	1	\N	\N
374	wasserdicht	{waterproof}	\N	3	5	\N	\N	\N
375	der werktag	{"working day"}	\N	3	5	1	\N	werktage
376	wetterfest	{waterproof}	\N	3	5	\N	\N	\N
377	widerrufen	{disclaimer}	\N	3	5	\N	\N	\N
378	das widerrufsrecht	{"right of revocation"}	\N	3	5	1	\N	\N
379	die zahlung	{payment}	\N	3	5	1	\N	\N
380	zurückschicken	{"to send back"}	\N	3	5	\N	\N	\N
381	zurücksenden	{"to send back"}	\N	3	5	\N	\N	\N
382	zurücktreten	{"to withdraw"}	\N	3	5	\N	\N	\N
383	zustellen	{"to deliver"}	\N	3	5	\N	\N	\N
384	alter	{age}	\N	3	6	1	\N	\N
385	anschauen	{"to look at"}	\N	3	6	\N	\N	\N
386	der anstoß	{stimulus}	\N	3	6	1	\N	\N
387	anstrengend	{tiring}	\N	3	6	\N	\N	\N
388	das autorennen	{"motor racing"}	\N	3	6	1	\N	\N
389	befragen	{"to consult"}	\N	3	6	\N	\N	\N
390	begeistern	{"to inspire"}	\N	3	6	\N	\N	\N
391	beliebt	{popular}	\N	3	6	\N	\N	\N
392	der biergarten	{"beer garden"}	\N	3	6	1	\N	\N
393	das boxen	{boxing}	\N	3	6	1	\N	\N
394	die chips	{crisps}	\N	3	6	1	\N	\N
395	demnächst	{soon}	\N	3	6	\N	\N	\N
396	die detektivgeschichte	{"detective story"}	\N	3	6	1	\N	\N
397	das diagramm	{diagram}	\N	3	6	1	\N	\N
398	die diskussion	{discussion}	\N	3	6	1	\N	\N
399	die dokumentation	{documentary}	\N	3	6	1	\N	dokumentationen
400	doppelt	{doubled}	\N	3	6	\N	\N	\N
401	dramatisch	{dramatic}	\N	3	6	\N	\N	\N
402	der durchschnitt	{average}	\N	3	6	1	\N	\N
403	die dvd	{dvd}	\N	3	6	1	\N	\N
404	ehrlich	{honest}	\N	3	6	\N	\N	\N
405	einschlafen	{"to fall asleep"}	\N	3	6	\N	\N	\N
406	einsetzen	{"to use"}	\N	3	6	\N	\N	\N
407	das eishockey	{"ice hockey"}	\N	3	6	1	\N	\N
408	der eiskunstlauf	{"ice skating"}	\N	3	6	1	\N	\N
409	entstehen	{"to result"}	\N	3	6	\N	\N	\N
410	das ereignis	{event}	\N	3	6	1	\N	ereignisse
411	erfolgreich	{successful}	\N	3	6	\N	\N	\N
412	das ergebnis	{result}	\N	3	6	1	\N	ergebnisse
413	der/die experte/expertin	{expert}	\N	3	6	1	\N	experten/expertinnen
414	der fan	{fan}	\N	3	6	1	\N	fans
415	der fußballclub	{"football club"}	\N	3	6	1	\N	\N
416	die gewohnheit	{habit}	\N	3	6	1	\N	gewohnheiten
417	das golf	{golf}	\N	3	6	1	\N	\N
418	der handball	{"hand ball"}	\N	3	6	1	\N	\N
419	das herz	{heart}	\N	3	6	1	\N	\N
420	der horrorfilm	{"horror film"}	\N	3	6	1	\N	\N
421	der/die kandidat/in	{candidate}	\N	3	6	1	\N	kandidaten/kandidatinnen
422	der/die kommissar/in	{commissioner}	\N	3	6	1	\N	kommissare/kommissarinnen
423	der/die kommentator/in	{commentator}	\N	3	6	1	\N	kommentatoren/kommentatorinnen
424	die komödie	{comedy}	\N	3	6	1	\N	komödien
425	der krimi	{"crime thriller"}	\N	3	6	1	\N	krimis
426	kuscheln	{"to cuddle"}	\N	3	6	\N	\N	\N
427	die langeweile	{boredom}	\N	3	6	1	\N	\N
428	die leichtathletik	{athletics}	\N	3	6	1	\N	\N
429	die lieblingsbeschäftigung	{"favourite pastime"}	\N	3	6	1	\N	\N
430	das magazin	{magazine}	\N	3	6	1	\N	\N
431	die mannschaft	{team}	\N	3	6	1	\N	\N
432	die mehrheit	{majority}	\N	3	6	1	\N	\N
433	die minderheit	{minority}	\N	3	6	1	\N	\N
434	mitreden	{"to have a say"}	\N	3	6	\N	\N	\N
435	das mittelfeld	{mid-field}	\N	3	6	1	\N	\N
436	die moderation	{presentation}	\N	3	6	1	\N	\N
437	der mord	{murder}	\N	3	6	1	\N	\N
438	motiviert	{motivated}	\N	3	6	\N	\N	\N
439	naschen	{"to snack"}	\N	3	6	\N	\N	\N
440	die niederlage	{defeat}	\N	3	6	1	\N	\N
441	objektiv	{objective}	\N	3	6	\N	\N	\N
442	die quizshow	{"quiz show"}	\N	3	6	1	\N	\N
443	das radrennen	{"cycling race"}	\N	3	6	1	\N	\N
444	die rangliste	{"league table"}	\N	3	6	1	\N	\N
445	das rätsel	{puzzle}	\N	3	6	1	\N	rätsel
446	die reportage	{report}	\N	3	6	1	\N	\N
447	der/die reporter/in	{reporter}	\N	3	6	1	\N	reporter/innen
448	retten	{"to rescue"}	\N	3	6	\N	\N	\N
449	romantisch	{romantic}	\N	3	6	\N	\N	\N
450	die runde	{round}	\N	3	6	1	\N	\N
451	schalten	{"to switch"}	\N	3	6	\N	\N	\N
452	der schiedsrichter	{referee}	\N	3	6	1	\N	\N
453	schießen	{"to shoot"}	\N	3	6	\N	\N	\N
454	die seifenoper	{"soap opera"}	\N	3	6	1	\N	seifenopern
455	die sendung	{programme}	\N	3	6	1	\N	sendungen
456	die serie	{series}	\N	3	6	1	\N	serien
457	siegen	{"to win"}	\N	3	6	\N	\N	\N
458	der/die sieger/in	{winner}	\N	3	6	1	\N	sieger/innen
459	der skisport	{"ski sport"}	\N	3	6	1	\N	\N
460	die soap	{"soap opera"}	\N	3	6	1	\N	\N
461	spannend	{exciting}	\N	3	6	\N	\N	\N
462	der/die spieler/in	{player}	\N	3	6	1	\N	spieler/innen
463	der spielfilm	{"feature film"}	\N	3	6	1	\N	\N
464	das stadion	{stadium}	\N	3	6	1	\N	\N
465	die statistik	{statistics}	\N	3	6	1	\N	\N
466	der tagesablauf	{"daily routine"}	\N	3	6	1	\N	\N
467	die talkshow	{"talk show"}	\N	3	6	1	\N	\N
468	das tor	{goal}	\N	3	6	1	\N	tore
469	der/die torwart/in	{goalie}	\N	3	6	1	\N	torwarte/innen
470	der/die tote	{"dead people"}	\N	3	6	1	\N	toten
471	die übertragung	{transmission}	\N	3	6	1	\N	\N
472	unentschieden	{undecided}	\N	3	6	\N	\N	\N
473	ungesund	{unhealthy}	\N	3	6	\N	\N	\N
474	die unterhaltung	{entertainment}	\N	3	6	1	\N	\N
475	der/die verlierer/in	{loser}	\N	3	6	1	\N	verlierer/innen
476	die weltmeisterschaft	{"world cup"}	\N	3	6	1	\N	weltmeisterschaften
477	weshalb	{"which is why"}	\N	3	6	\N	\N	\N
478	zappen	{"to channel surf"}	\N	3	6	\N	\N	\N
479	der zeichentrickfilm	{"animated film"}	\N	3	6	1	\N	\N
480	die zeitverschwendung	{"waste of time"}	\N	3	6	1	\N	\N
481	der/die zuschauer/in	{viewer}	\N	3	6	1	\N	zuschauer/innen
482	der/die alliierte	{allies}	\N	3	7	1	\N	alliierten
483	die amtssprache	{"official language"}	\N	3	7	1	\N	amtssprachen
484	anfangs	{initially}	\N	3	7	\N	\N	\N
485	anheben	{"to raise"}	\N	3	7	\N	\N	\N
486	die arbeitskraft	{workforce}	\N	3	7	1	\N	arbeitskräfte
487	die arbeitslosigkeit	{unemployment}	\N	3	7	1	\N	\N
488	der/die astronaut/in	{astronaut}	\N	3	7	1	\N	astronauten/astronautinnen
489	das asyl	{asylum}	\N	3	7	1	\N	\N
490	aufschreiben	{"to write down"}	\N	3	7	\N	\N	\N
491	aufteilen	{"to divide"}	\N	3	7	\N	\N	\N
492	der auswanderer	{emigrant}	\N	3	7	1	\N	auswanderer
493	die auswanderung	{emigration}	\N	3	7	1	\N	\N
494	die besatzungszone	{"occupied zone"}	\N	3	7	1	\N	besatzungszonen
495	besiegen	{"to conquer"}	\N	3	7	\N	\N	\N
496	der/die bundeskanzler/in	{"federal chancellor"}	\N	3	7	1	\N	bundeskanzler/innen
497	die bundesrepublik (brd)	{"federal republic (frg)"}	\N	3	7	1	\N	\N
498	der/die bürger/in	{citizen}	\N	3	7	1	\N	bürger/innen
499	der bürgerkrieg	{"civil war"}	\N	3	7	1	\N	\N
500	die demokratie	{democracy}	\N	3	7	1	\N	\N
501	demokratisch	{democratic}	\N	3	7	\N	\N	\N
502	die demonstration	{demonstration}	\N	3	7	1	\N	demonstrationen
503	die deutsche demokratische republik (ddr)	{"german democratic republic (gdr)"}	\N	3	7	1	\N	\N
504	ehemalig	{former}	\N	3	7	\N	\N	\N
505	einführen	{"to introduce"}	\N	3	7	\N	\N	\N
506	einsperren	{"to confine"}	\N	3	7	\N	\N	\N
507	die einwanderung	{immigration}	\N	3	7	1	\N	\N
508	emotional	{emotional}	\N	3	7	\N	\N	\N
509	entwickeln	{"to develop"}	\N	3	7	\N	\N	\N
510	erinnern	{"to remember"}	\N	3	7	\N	\N	\N
511	die erinnerung	{memory}	\N	3	7	1	\N	erinnerungen
512	ernähren	{"to feed"}	\N	3	7	\N	\N	\N
513	die europäische union (eu)	{"european union"}	\N	3	7	1	\N	\N
514	die euroeinführung	{"introduction of the euro"}	\N	3	7	1	\N	\N
515	der flüchtling	{refugee}	\N	3	7	1	\N	flüchtlinge
517	die fremdsprache	{"foreign language"}	\N	3	7	1	\N	fremdsprachen
518	friedlich	{peaceful}	\N	3	7	\N	\N	\N
519	der/die gastarbeiter/in	{"guest worker"}	\N	3	7	1	\N	gastarbeiter/innen
520	das gefühl	{feeling}	\N	3	7	1	\N	gefühle
521	der/die gegner/in	{opponent}	\N	3	7	1	\N	gegner/innen
522	das gehalt	{salary}	\N	3	7	1	\N	gehälter
523	das gewürz	{spice}	\N	3	7	1	\N	gewürze
524	die grenze	{border}	\N	3	7	1	\N	grenzen
525	gründen	{"to establish"}	\N	3	7	\N	\N	\N
526	hart	{hard}	\N	3	7	\N	\N	\N
527	die hauptstadt	{"capital city"}	\N	3	7	1	\N	hauptstädte
528	die heimat	{"home country"}	\N	3	7	1	\N	\N
529	die industrie	{industry}	\N	3	7	1	\N	\N
530	irgendwann	{"at some point"}	\N	3	7	\N	\N	\N
531	jahrelang	{"for years"}	\N	3	7	\N	\N	\N
532	das jahrhundert	{century}	\N	3	7	1	\N	jahrhunderte
533	das jahrzehnt	{decade}	\N	3	7	1	\N	jahrzehnte
534	der/die jude/jüdin	{jew}	\N	3	7	1	\N	juden/jüdinnen
535	kaum	{hardly}	\N	3	7	\N	\N	\N
536	die kindheit	{childhood}	\N	3	7	1	\N	\N
537	der krieg	{war}	\N	3	7	1	\N	kriege
538	das kriegsende	{"end of war"}	\N	3	7	1	\N	\N
539	die krippe	{crib}	\N	3	7	1	\N	krippen
540	der/die kritiker/in	{critic}	\N	3	7	1	\N	kritiker/innen
541	die mauer	{wall}	\N	3	7	1	\N	mauern
542	der mauerbau	{"building of the wall"}	\N	3	7	1	\N	\N
543	der mauerfall	{"fall of the berlin wall"}	\N	3	7	1	\N	\N
544	die medizin	{medicine}	\N	3	7	1	\N	\N
545	merken	{"to realise"}	\N	3	7	\N	\N	\N
546	die migration	{migration}	\N	3	7	1	\N	\N
547	miteinander	{together}	\N	3	7	\N	\N	\N
548	miterleben	{"to experience with"}	\N	3	7	\N	\N	\N
549	musikalisch	{musical}	\N	3	7	\N	\N	\N
550	die muttersprache	{"native language"}	\N	3	7	1	\N	muttersprachen
551	die nachkriegszeit	{"post-war years"}	\N	3	7	1	\N	\N
552	der nationalsozialismus	{"national socialism"}	\N	3	7	1	\N	\N
553	die nato	{nato}	\N	3	7	1	\N	\N
554	die notunterkunft	{"emergency accommodation"}	\N	3	7	1	\N	notunterkünfte
555	die öffnung	{opening}	\N	3	7	1	\N	\N
556	die phase	{phase}	\N	3	7	1	\N	phasen
557	politisch	{political}	\N	3	7	\N	\N	\N
558	der protest	{protest}	\N	3	7	1	\N	proteste
559	die regierung	{government}	\N	3	7	1	\N	regierungen
560	die republik	{republic}	\N	3	7	1	\N	republiken
561	der/die russlanddeutsche	{german-russian}	\N	3	7	1	\N	russlanddeutschen
562	der staat	{state}	\N	3	7	1	\N	staaten
563	die staatsgründung	{"formation of a state"}	\N	3	7	1	\N	\N
564	das stipendium	{scholarship}	\N	3	7	1	\N	stipendien
566	die teilung	{division}	\N	3	7	1	\N	teilungen
567	verdrängen	{"to suppress"}	\N	3	7	\N	\N	\N
568	vereinigen	{"to unite"}	\N	3	7	\N	\N	\N
569	verfolgen	{"to follow"}	\N	3	7	\N	\N	\N
570	verhaften	{"to arrest"}	\N	3	7	\N	\N	\N
571	verlängern	{"to extend"}	\N	3	7	\N	\N	\N
572	verlassen	{"to leave"}	\N	3	7	\N	\N	\N
573	vermischen	{"to mix"}	\N	3	7	\N	\N	\N
574	das visum	{visa}	\N	3	7	1	\N	visa
575	das weltall	{space}	\N	3	7	1	\N	\N
576	wiedervereinigen	{"to re-unify"}	\N	3	7	\N	\N	\N
577	die wiedervereinigung	{reunification}	\N	3	7	1	\N	\N
578	zerschlagen	{"to destroy"}	\N	3	7	\N	\N	\N
579	zurückkehren	{"to return"}	\N	3	7	\N	\N	\N
1271	absolvieren	{"to complete"}	\N	3	9	\N	\N	\N
1272	abteilungsleiter	{"division manager"}	\N	3	9	\N	\N	abteilungsleiter/innen
1273	abwechslungsreich	{varied}	\N	3	9	\N	\N	\N
1274	altenpfleger	{"geriatric nurse"}	\N	3	9	\N	\N	altenpfleger/innen
1275	anlage	{system}	\N	3	9	2	\N	\N
1276	annahme	{acceptance}	\N	3	9	2	\N	\N
1277	anrechnen	{"to charge"}	\N	3	9	\N	\N	\N
1278	anstellung	{employment}	\N	3	9	2	\N	\N
1279	arbeitsstelle	{position}	\N	3	9	2	\N	\N
1280	arbeitsweise	{"working method"}	\N	3	9	2	\N	\N
1281	arbeitszeit	{"working hours"}	\N	3	9	2	\N	arbeitszeiten
1282	assistenz	{assistance}	\N	3	9	2	\N	\N
1283	aufteilung	{allocation}	\N	3	9	2	\N	\N
1284	auszug	{extract}	\N	3	9	1	\N	auszüge
1285	bachelor	{"Bachelor's degree"}	\N	3	9	1	\N	\N
1286	beherrschen	{"to master"}	\N	3	9	\N	\N	\N
1287	beilegen	{"to enclose"}	\N	3	9	\N	\N	\N
1288	berufsbezeichnung	{"job description"}	\N	3	9	2	\N	\N
1289	berufserfahrung	{"job experience"}	\N	3	9	2	\N	\N
1290	berufsleben	{"professional life"}	\N	3	9	3	\N	\N
1291	betriebswirtschaft	{"business administration"}	\N	3	9	2	\N	\N
1292	beurteilen	{"to evaluate"}	\N	3	9	\N	\N	\N
608	zugreifen	{access}	{"Wie kann ich auf den Drucker zugreifen?"}	3	1	\N	2	\N
1293	bewerbungsschreiben	{"letter of application"}	\N	3	9	3	\N	\N
1294	bilanzbuchhalter	{accountant}	\N	3	9	\N	\N	bilanzbuchhalter/innen
1295	bisher	{"until now"}	\N	3	9	\N	\N	\N
1296	briefpapier	{"letter paper"}	\N	3	9	3	\N	\N
1297	büromaterial	{"office stationary"}	\N	3	9	3	\N	\N
1298	bürozeit	{"office hours"}	\N	3	9	2	\N	bürozeiten
565	tatsächlich	{actual}	{}	3	7	\N	\N	\N
1299	catering	{catering}	\N	3	9	3	\N	\N
1300	daneben	{besides}	\N	3	9	\N	\N	\N
1302	eingehen	{"to enter"}	\N	3	9	\N	\N	\N
1303	einschreiben	{"to inscribe"}	\N	3	9	\N	\N	\N
1304	eintrittsdatum	{"entry date"}	\N	3	9	3	\N	\N
1305	empfang	{reception}	\N	3	9	1	\N	\N
1306	empfangen	{"to receive"}	\N	3	9	\N	\N	\N
1307	englischsprachig	{"in English"}	\N	3	9	\N	\N	\N
1308	entnehmen	{"to take from"}	\N	3	9	\N	\N	\N
1309	erstellung	{creation}	\N	3	9	2	\N	\N
1310	färben	{"to colour"}	\N	3	9	\N	\N	\N
1311	fax	{fax}	\N	3	9	3	\N	\N
1312	festanstellung	{"full-time position"}	\N	3	9	2	\N	\N
1313	festlegen	{"to determine"}	\N	3	9	\N	\N	\N
1314	finanziell	{financial}	\N	3	9	\N	\N	\N
1315	finanzwesen	{finance}	\N	3	9	3	\N	\N
1316	firmensitz	{"registered office"}	\N	3	9	1	\N	\N
1317	fließend	{fluent}	\N	3	9	\N	\N	\N
1318	föhn	{hairdryer}	\N	3	9	1	\N	\N
1320	formulierung	{wording}	\N	3	9	2	\N	\N
1321	fortbildung	{"further education"}	\N	3	9	2	\N	\N
1322	frisur	{hairdresser}	\N	3	9	2	\N	\N
1323	gehaltsvorstellung	{"desired salary"}	\N	3	9	2	\N	\N
1324	geschäftsführer	{"managing director"}	\N	3	9	\N	\N	geschäftsführer/innen
1325	geschäftsführung	{management}	\N	3	9	2	\N	\N
1326	gleichzeitig	{"at the same time"}	\N	3	9	\N	\N	\N
1327	handlung	{conduct}	\N	3	9	2	\N	\N
1328	herausforderung	{challenge}	\N	3	9	2	\N	\N
1329	individuell	{individual}	\N	3	9	\N	\N	\N
1330	insofern	{provided}	\N	3	9	\N	\N	\N
1331	intern	{internal}	\N	3	9	\N	\N	\N
1332	jobbezeichnung	{"job description"}	\N	3	9	2	\N	\N
1333	kamm	{comb}	\N	3	9	1	\N	\N
1334	kommunikationsstärke	{"strong communication skills"}	\N	3	9	2	\N	\N
1335	kommunikativ	{communicative}	\N	3	9	\N	\N	\N
1336	konferenzraum	{"conference room"}	\N	3	9	1	\N	\N
1337	kontaktdaten	{"contact details"}	\N	3	9	2	\N	kontaktdaten (pl.)
1338	kümmern	{"to take care of"}	\N	3	9	\N	\N	\N
1339	leistungsgerecht	{performance-based}	\N	3	9	\N	\N	\N
1340	leiten	{"to lead"}	\N	3	9	\N	\N	\N
1341	manager	{manager}	\N	3	9	\N	\N	manager/innen
1342	maschinenbau	{engineering}	\N	3	9	1	\N	\N
1343	meistern	{"to master"}	\N	3	9	\N	\N	\N
1344	millionär	{millionaire}	\N	3	9	\N	\N	millionär/in
1345	mittelständisch	{middle-class}	\N	3	9	\N	\N	\N
1346	nachdem	{after}	\N	3	9	\N	\N	\N
1347	niveau	{level}	\N	3	9	3	\N	\N
1348	original	{original}	\N	3	9	3	\N	\N
1349	pc	{PC}	\N	3	9	1	\N	pcs
1350	posteingang	{inbox}	\N	3	9	1	\N	\N
1351	probezeit	{"probationary period"}	\N	3	9	2	\N	\N
1352	qualifikation	{qualification}	\N	3	9	2	\N	qualifikationen
1353	regeln	{"to control"}	\N	3	9	\N	\N	\N
1354	sales manager	{"sales manager"}	\N	3	9	\N	\N	sales manager/innen
1355	schneiden	{"to cut"}	\N	3	9	\N	\N	\N
1356	schreiben	{correspondence}	\N	3	9	3	\N	\N
1357	seitdem	{"since then"}	\N	3	9	\N	\N	\N
1358	selbstständige	{"self-employed person"}	\N	3	9	\N	\N	selbstständigen
1359	senden	{"to broadcast"}	\N	3	9	\N	\N	\N
1360	seniorenheim	{"old people's home"}	\N	3	9	3	\N	\N
1361	soweit	{"so far as"}	\N	3	9	\N	\N	\N
1362	speise	{dish}	\N	3	9	2	\N	speisen
1363	spezialisieren	{"to specialise"}	\N	3	9	\N	\N	\N
1364	stellenanzeige	{"job advertisement"}	\N	3	9	2	\N	stellenanzeigen
1365	steuerberater	{"tax consultant"}	\N	3	9	1	\N	\N
1366	steuerberatungsbüro	{"tax consultancy firm"}	\N	3	9	3	\N	\N
1367	teamfähigkeit	{"ability to work in a team"}	\N	3	9	2	\N	\N
1368	telekommunikation	{telecommunication}	\N	3	9	2	\N	\N
1369	terminkalender	{"appointment calendar"}	\N	3	9	1	\N	\N
1370	traditionsreich	{"steeped in tradition"}	\N	3	9	\N	\N	\N
1371	überstunde	{overtime}	\N	3	9	2	\N	überstunden
1372	umgang	{handling}	\N	3	9	1	\N	\N
1373	umschulung	{re-training}	\N	3	9	2	\N	\N
1374	unbefristet	{indefinite}	\N	3	9	\N	\N	\N
1375	unternehmen	{company}	\N	3	9	3	\N	\N
1376	urlaubstag	{"paid leave"}	\N	3	9	1	\N	urlaubstage
1377	verabreden	{"to arrange"}	\N	3	9	\N	\N	\N
1378	vergütung	{remuneration}	\N	3	9	2	\N	\N
1379	verstärkung	{enhancement}	\N	3	9	2	\N	\N
1380	weiterhelfen	{"to help out"}	\N	3	9	\N	\N	\N
1381	weiterleitung	{forwarding}	\N	3	9	2	\N	\N
1382	werkzeug	{"work tools"}	\N	3	9	3	\N	\N
1383	zaubern	{"to conjure"}	\N	3	9	\N	\N	\N
1384	zeitlich	{"on time"}	\N	3	9	\N	\N	\N
1385	zeitpunkt	{"point in time"}	\N	3	9	1	\N	\N
1386	zusätzlich	{additional}	\N	3	9	\N	\N	\N
1387	zusatzqualifikation	{"additional qualifications"}	\N	3	9	2	\N	\N
1388	zuverlässigkeit	{reliability}	\N	3	9	2	\N	\N
1390	abheften	{"to file away"}	\N	3	10	\N	\N	\N
1391	allerdings	{however}	\N	3	10	\N	\N	\N
1393	ansehen	{"to look at"}	\N	3	10	\N	\N	\N
1396	ausschalten	{"to turn off"}	\N	3	10	\N	\N	\N
1397	ausschlafen	{"to sleep in"}	\N	3	10	\N	\N	\N
1398	besprechungszimmer	{"meeting room"}	\N	3	10	3	\N	\N
1399	büroalltag	{"office life"}	\N	3	10	1	\N	\N
1400	büroassistent	{"office assistant"}	\N	3	10	\N	\N	büroassistenten/büroassistentinnen
1401	büroraum	{"office space"}	\N	3	10	1	\N	büroräume
1402	dienstleistung	{service}	\N	3	10	2	\N	dienstleistungen
1403	drinnen	{inside}	\N	3	10	\N	\N	\N
1404	einschalten	{"to turn on"}	\N	3	10	\N	\N	\N
1405	energiekosten	{"energy costs"}	\N	3	10	2	\N	(pl.)
1406	energieverschwendung	{"waste of energy"}	\N	3	10	2	\N	\N
1407	handwerker	{workman}	\N	3	10	\N	\N	handwerker/innen
1408	heizkosten	{"heating costs"}	\N	3	10	2	\N	(pl.)
1409	indem	{by}	\N	3	10	\N	\N	\N
1410	kippen	{"to tilt"}	\N	3	10	\N	\N	\N
1411	könig	{king}	\N	3	10	\N	\N	könige/königinnen
1412	kopierer	{"copying machine"}	\N	3	10	1	\N	kopierer
1413	langfristig	{long-term}	\N	3	10	\N	\N	\N
1414	mehrmals	{"multiple times"}	\N	3	10	\N	\N	\N
1415	million	{million}	\N	3	10	2	\N	millionen
1416	mitdenken	{"to follow a thought"}	\N	3	10	\N	\N	\N
1417	offen	{open}	\N	3	10	\N	\N	\N
1418	privatnummer	{"private number"}	\N	3	10	2	\N	\N
1419	rasieren	{"to shave"}	\N	3	10	\N	\N	\N
1420	reinigungsfirma	{"cleaning company"}	\N	3	10	2	\N	\N
1421	reinigungsvertrag	{"cleaning contract"}	\N	3	10	1	\N	\N
1422	senken	{"to reduce"}	\N	3	10	\N	\N	\N
1423	stinksauer	{furious}	\N	3	10	\N	\N	\N
1424	strom	{electricity}	\N	3	10	1	\N	\N
1425	stromanbieter	{"electricity provider"}	\N	3	10	1	\N	\N
1426	stromkosten	{"electricity costs"}	\N	3	10	2	\N	(pl.)
1427	tropfen	{"to drip"}	\N	3	10	\N	\N	\N
1428	übergeben	{"to be sick"}	\N	3	10	\N	\N	\N
1429	unnötig	{unnecessary}	\N	3	10	\N	\N	\N
1430	verbrauch	{use}	\N	3	10	1	\N	\N
1431	vertragsende	{"contract end"}	\N	3	10	3	\N	\N
1432	vertragsnummer	{"contract number"}	\N	3	10	2	\N	\N
1433	wärme	{warmth}	\N	3	10	2	\N	\N
1434	wasserhahn	{tap}	\N	3	10	1	\N	\N
1435	weise	{manner}	\N	3	10	2	\N	\N
1436	zudrehen	{"to turn off"}	\N	3	10	\N	\N	\N
1437	zumachen	{"to close"}	\N	3	10	\N	\N	\N
1438	zusammenarbeit	{cooperation}	\N	3	10	2	\N	\N
1439	zusammenarbeiten	{"to work together"}	\N	3	10	\N	\N	\N
1440	abnehmen	{"to lose weight"}	\N	3	11	\N	\N	\N
1441	achten	{"to be careful"}	\N	3	11	\N	\N	\N
1442	allergie	{allergy}	\N	3	11	2	\N	\N
1443	allergisch	{allergic}	\N	3	11	\N	\N	\N
1444	anbau	{cultivation}	\N	3	11	1	\N	\N
1445	angewöhnen	{"to get used to"}	\N	3	11	\N	\N	\N
1446	auseinandersetzen	{"to discuss"}	\N	3	11	\N	\N	\N
1447	ausgewogen	{balanced}	\N	3	11	\N	\N	\N
1448	ausprobieren	{"to try"}	\N	3	11	\N	\N	\N
1449	bedenklich	{questionable}	\N	3	11	\N	\N	\N
1450	bedingung	{condition}	\N	3	11	2	\N	bedingungen
1451	behaupten	{"to claim"}	\N	3	11	\N	\N	\N
1452	berufstätigkeit	{"professional activity"}	\N	3	11	2	\N	\N
1453	bevölkerung	{population}	\N	3	11	2	\N	\N
1454	bewusst	{conscious}	\N	3	11	\N	\N	\N
1455	bio	{organic}	\N	3	11	\N	\N	\N
1536	benzin	{petrol}	\N	3	12	3	\N	\N
1394	aufdrehen	{"to open"}	{}	3	10	\N	\N	\N
1456	bioprodukt	{"organic produce"}	\N	3	11	3	\N	bioprodukte
1457	bloß	{purely}	\N	3	11	\N	\N	\N
1458	diabetiker	{diabetic}	\N	3	11	\N	\N	diabetiker/innen
1459	döner	{kebab}	\N	3	11	1	\N	\N
1460	durchschnittlich	{average}	\N	3	11	\N	\N	\N
1461	einkommen	{income}	\N	3	11	3	\N	\N
1462	einseitig	{one-sided}	\N	3	11	\N	\N	\N
1463	eiweiß	{protein}	\N	3	11	3	\N	\N
1464	erkennen	{"to recognise"}	\N	3	11	\N	\N	\N
1465	ernährung	{nutrition}	\N	3	11	2	\N	\N
1466	esser	{eater}	\N	3	11	\N	\N	esser/innen
1467	fertiggericht	{"ready meal"}	\N	3	11	3	\N	\N
1468	fett	{fat}	\N	3	11	\N	\N	\N
1469	fix	{quick}	\N	3	11	\N	\N	\N
1470	fleischfrei	{meat-free}	\N	3	11	\N	\N	\N
1471	fleischlos	{vegetarian}	\N	3	11	\N	\N	\N
1472	freundeskreis	{"circle of friends"}	\N	3	11	1	\N	\N
1473	frust	{frustration}	\N	3	11	1	\N	\N
1474	furchtbar	{terrible}	\N	3	11	\N	\N	\N
1475	gang	{course}	\N	3	11	1	\N	gänge
1476	gemüsehändler	{greengrocer}	\N	3	11	\N	\N	gemüsehändler/innen
1477	geschmack	{taste}	\N	3	11	1	\N	\N
1478	getreide	{grain}	\N	3	11	3	\N	\N
1479	glutenfrei	{gluten-free}	\N	3	11	\N	\N	\N
1480	grundsätzlich	{basically}	\N	3	11	\N	\N	\N
1481	hartweizen	{"durum wheat"}	\N	3	11	1	\N	\N
1482	haselnuss	{hazelnut}	\N	3	11	2	\N	haselnüsse
1483	hauptgrund	{"main reason"}	\N	3	11	1	\N	hauptgründe
1484	hülsenfrucht	{pulse}	\N	3	11	2	\N	hülsenfrüchte
1485	industriell	{industrial}	\N	3	11	\N	\N	\N
1486	institution	{institution}	\N	3	11	2	\N	institutionen
1487	irgendwelche	{any}	\N	3	11	\N	\N	\N
1488	irgendwer	{anyone}	\N	3	11	\N	\N	\N
1489	kochbuch	{"cookery book"}	\N	3	11	3	\N	kochbücher
1490	kulinarisch	{culinary}	\N	3	11	\N	\N	\N
1491	laktosefrei	{lactose-free}	\N	3	11	\N	\N	\N
1492	laune	{mood}	\N	3	11	2	\N	\N
1493	leiden	{"to suffer"}	\N	3	11	\N	\N	\N
1494	massentierhaltung	{"livestock farming"}	\N	3	11	2	\N	\N
1495	milchzucker	{"milk sugar"}	\N	3	11	1	\N	\N
1496	moralisch	{morally}	\N	3	11	\N	\N	\N
1497	nährstoff	{nutrient}	\N	3	11	1	\N	nährstoffe
1498	nahrungsmittel	{foodstuff}	\N	3	11	3	\N	\N
1499	nebenbei	{incidentally}	\N	3	11	\N	\N	\N
1500	nuss	{nut}	\N	3	11	2	\N	nüsse
1501	präsentieren	{"to present"}	\N	3	11	\N	\N	\N
1502	problemlos	{unproblematic}	\N	3	11	\N	\N	\N
1503	quark	{quark}	\N	3	11	1	\N	\N
1504	reduzieren	{"to reduce"}	\N	3	11	\N	\N	\N
1505	studie	{study}	\N	3	11	2	\N	\N
1506	tiefkühlpizza	{"frozen pizza"}	\N	3	11	2	\N	tiefkühlpizzen
1507	tierisch	{animalistic}	\N	3	11	\N	\N	\N
1508	trend	{trend}	\N	3	11	1	\N	\N
1509	überzeugen	{"to convince"}	\N	3	11	\N	\N	\N
1510	vegan	{vegan}	\N	3	11	\N	\N	\N
1511	veganer	{vegan}	\N	3	11	\N	\N	veganer/innen
1512	vereinbar	{compatible}	\N	3	11	\N	\N	\N
1513	versorgen	{"to provide for"}	\N	3	11	\N	\N	\N
1514	vertragen	{"to tolerate"}	\N	3	11	\N	\N	\N
1515	verzehr	{consumption}	\N	3	11	1	\N	\N
1516	verzichten	{"to avoid"}	\N	3	11	\N	\N	\N
1517	vorbeigehen	{"to walk past"}	\N	3	11	\N	\N	\N
1518	wert	{value}	\N	3	11	1	\N	werte
1519	wurst	{sausage}	\N	3	11	2	\N	würste
1520	zeitmangel	{"lack of time"}	\N	3	11	1	\N	\N
1521	zeitungsbericht	{"report in the newspaper"}	\N	3	11	1	\N	\N
1522	zufällig	{incidentally}	\N	3	11	\N	\N	\N
1523	zunehmen	{"to gain weight"}	\N	3	11	\N	\N	\N
1524	zusatzstoff	{additives}	\N	3	11	1	\N	zusatzstoffe
1526	absichtlich	{intentional}	\N	3	12	\N	\N	\N
1527	anfahren	{"to bump into"}	\N	3	12	\N	\N	\N
1528	ärztlich	{medical}	\N	3	12	\N	\N	\N
1530	ausparken	{"to reverse out"}	\N	3	12	\N	\N	\N
1531	außenspiegel	{"wing mirror"}	\N	3	12	1	\N	außenspiegel
1532	autofahrer	{"car driver"}	\N	3	12	\N	\N	autofahrer/innen
1533	automarke	{"car make"}	\N	3	12	2	\N	\N
1534	autoteil	{"car part"}	\N	3	12	3	\N	autoteile
1535	autoversicherung	{"car insurance"}	\N	3	12	2	\N	\N
1537	beschädigen	{"to damage"}	\N	3	12	\N	\N	\N
1538	betrunken	{drunk}	\N	3	12	\N	\N	\N
1539	blinker	{indicator}	\N	3	12	1	\N	blinker
1540	bremsen	{"to brake"}	\N	3	12	\N	\N	\N
1541	dach	{roof}	\N	3	12	3	\N	\N
1542	diebstahl	{theft}	\N	3	12	1	\N	\N
1543	dorf	{village}	\N	3	12	3	\N	\N
1544	einbrechen	{"to break in"}	\N	3	12	\N	\N	\N
1545	einbrecher	{burglar}	\N	3	12	\N	\N	einbrecher/innen
1546	einbruch	{burglary}	\N	3	12	1	\N	\N
1547	einparken	{"to pull in"}	\N	3	12	\N	\N	\N
1548	fahrerseite	{"driver's side"}	\N	3	12	2	\N	\N
1549	freiwillige	{volunteer}	\N	3	12	\N	\N	freiwilligen
1550	frustriert	{frustrated}	\N	3	12	\N	\N	\N
1551	gebrauchtwagen	{"used vehicle"}	\N	3	12	1	\N	gebrauchtwagen
1552	haftpflicht	{liability}	\N	3	12	2	\N	\N
1553	haftpflichtversicherung	{"liability insurance"}	\N	3	12	2	\N	\N
1554	hagel	{hail}	\N	3	12	1	\N	\N
1555	hügel	{hill}	\N	3	12	1	\N	\N
1556	kaskoversicherung	{"hull insurance"}	\N	3	12	2	\N	\N
1557	kilometer	{kilometre}	\N	3	12	1	\N	\N
1558	kofferraum	{"car boot"}	\N	3	12	1	\N	\N
1559	korrekt	{correct}	\N	3	12	\N	\N	\N
1560	krachen	{"to crash"}	\N	3	12	\N	\N	\N
1561	kratzer	{scratch}	\N	3	12	1	\N	kratzer
1562	lenken	{"to steer"}	\N	3	12	\N	\N	\N
1563	lohnen	{"to pay"}	\N	3	12	\N	\N	\N
1564	motor	{motor}	\N	3	12	1	\N	motoren
1565	motorhaube	{bonnet}	\N	3	12	2	\N	\N
1566	motorradfahrer	{motorcyclist}	\N	3	12	\N	\N	motorradfahrer/innen
1567	nachdenken	{"to think about"}	\N	3	12	\N	\N	\N
1568	neuwagen	{"new vehicle"}	\N	3	12	1	\N	neuwagen
1569	nummernschild	{"number plate"}	\N	3	12	3	\N	nummernschilder
1570	oldtimer	{"vintage car"}	\N	3	12	1	\N	\N
1571	optimistisch	{optimistic}	\N	3	12	\N	\N	\N
1572	parken	{"to park"}	\N	3	12	\N	\N	\N
1573	parklücke	{"parking space"}	\N	3	12	2	\N	\N
1574	personenschaden	{"personal injury"}	\N	3	12	1	\N	personenschäden
1575	ps	{horsepower}	\N	3	12	\N	\N	\N
1576	quietschen	{"to screech"}	\N	3	12	\N	\N	\N
1577	regulieren	{"to regulate"}	\N	3	12	\N	\N	\N
1578	regulierung	{regulation}	\N	3	12	2	\N	\N
1579	reifen	{tyre}	\N	3	12	1	\N	reifen
1580	rücklicht	{"tail light"}	\N	3	12	3	\N	rücklichter
1581	rückscheibe	{"rear window"}	\N	3	12	2	\N	\N
1582	rückwärts	{backwards}	\N	3	12	\N	\N	\N
1583	rutschen	{"to slide"}	\N	3	12	\N	\N	\N
1584	sachschaden	{"property damage"}	\N	3	12	1	\N	sachschäden
1585	schadensfall	{"damage claim"}	\N	3	12	1	\N	\N
1586	scheibe	{windscreen}	\N	3	12	2	\N	scheiben
1587	scheinwerfer	{headlight}	\N	3	12	1	\N	scheinwerfer
1588	schläger	{bat}	\N	3	12	1	\N	\N
1589	schwingen	{"to swing"}	\N	3	12	\N	\N	\N
1590	sinn	{meaning}	\N	3	12	1	\N	\N
1591	sportwagen	{"sports car"}	\N	3	12	1	\N	\N
1592	stoßstange	{bumper}	\N	3	12	2	\N	\N
1593	straßenrand	{roadside}	\N	3	12	1	\N	\N
1594	straßenverkehr	{traffic}	\N	3	12	1	\N	\N
1595	sturm	{storm}	\N	3	12	1	\N	\N
1596	suv	{"sport utility vehicle"}	\N	3	12	3	\N	\N
1597	teilkaskoversicherung	{"partial coverage insurance"}	\N	3	12	2	\N	\N
1598	überraschen	{"to surprise"}	\N	3	12	\N	\N	\N
1599	überschwemmung	{flood}	\N	3	12	2	\N	\N
1600	umfallen	{"to fall over"}	\N	3	12	\N	\N	\N
1601	umso	{"all the (more)"}	\N	3	12	\N	\N	\N
1602	unfall	{accident}	\N	3	12	1	\N	unfälle
1603	unfallgefahr	{"risk of accident"}	\N	3	12	2	\N	\N
1604	verletzen	{"to injure"}	\N	3	12	\N	\N	\N
1605	versehentlich	{accidental}	\N	3	12	\N	\N	\N
1606	versichern	{"to insure"}	\N	3	12	\N	\N	\N
1607	versicherungsberater	{"insurance advisor"}	\N	3	12	\N	\N	versicherungsberater/innen
1608	versicherungsschutz	{"insurance cover"}	\N	3	12	1	\N	\N
1609	verursachen	{"to cause"}	\N	3	12	\N	\N	\N
1610	vollkaskoversicherung	{"full comprehensive insurance"}	\N	3	12	2	\N	\N
1611	vorschreiben	{"to stipulate"}	\N	3	12	\N	\N	\N
1612	vorsichtig	{careful}	\N	3	12	\N	\N	\N
1613	wegfahren	{"to drive away"}	\N	3	12	\N	\N	\N
1621	die geschäftsleitung	{management}	{}	4	1	\N	\N	geschäftsleitungen
124	einstellen	{"to set up","to hire","to employ"}	{}	3	3	\N	\N	\N
1204	abschicken	{"to submit"}	\N	3	8	\N	\N	\N
1205	abwicklung	{settlement}	\N	3	8	2	\N	\N
1206	amtlich	{official}	\N	3	8	\N	\N	\N
1207	anerkennen	{"to recognise"}	\N	3	8	\N	\N	\N
1208	anerkennung	{recognition}	\N	3	8	2	\N	\N
1209	anfang	{beginning}	\N	3	8	1	\N	anfänge
1210	ansteckend	{infectious}	\N	3	8	\N	\N	\N
1211	ausstellen	{"to issue"}	\N	3	8	\N	\N	\N
1212	bearbeitung	{processing}	\N	3	8	2	\N	\N
1213	beglaubigen	{"to certify"}	\N	3	8	\N	\N	\N
1214	beglaubigung	{certification}	\N	3	8	2	\N	\N
1215	bekannte	{acquaintance}	\N	3	8	\N	\N	bekannten
1216	benötigen	{"to require"}	\N	3	8	\N	\N	\N
1217	berufen	{"to appoint"}	\N	3	8	\N	\N	\N
1218	bescheinigen	{"to certify"}	\N	3	8	\N	\N	\N
1219	dran sein	{"to be for it"}	\N	3	8	\N	\N	\N
1220	einreichen	{"to submit"}	\N	3	8	\N	\N	\N
1221	enttäuschen	{"to disappoint"}	\N	3	8	\N	\N	\N
1222	enttäuschung	{disappointment}	\N	3	8	2	\N	enttäuschungen
1223	erhalt	{receipt}	\N	3	8	1	\N	\N
1224	erklärung	{explanation}	\N	3	8	2	\N	erklärungen
1225	erkundigen	{"to enquire"}	\N	3	8	\N	\N	\N
1226	fähigkeit	{ability}	\N	3	8	2	\N	fähigkeiten
1227	fantasie	{phantasy}	\N	3	8	2	\N	\N
1228	formalität	{formality}	\N	3	8	2	\N	formalitäten
1229	förmlich	{formal}	\N	3	8	\N	\N	\N
1230	fotokopie	{photocopy}	\N	3	8	2	\N	fotokopien
1231	frieden	{peace}	\N	3	8	1	\N	\N
1232	führungszeugnis	{"certificate of good conduct"}	\N	3	8	3	\N	\N
1233	garantieren	{"to guarantee"}	\N	3	8	\N	\N	\N
1234	gedanke	{thought}	\N	3	8	1	\N	gedanken
1235	geduld	{patience}	\N	3	8	2	\N	\N
1236	geduldig	{patient}	\N	3	8	\N	\N	\N
1237	gemeinsamkeit	{"common feature"}	\N	3	8	2	\N	gemeinsamkeiten
1238	geruch	{smell}	\N	3	8	1	\N	gerüche
1239	gesundheitszeugnis	{"health certificate"}	\N	3	8	3	\N	\N
1240	gewährleisten	{"to ensure"}	\N	3	8	\N	\N	\N
1241	häufig	{often}	\N	3	8	\N	\N	\N
1242	heimweh	{"home sickness"}	\N	3	8	3	\N	\N
1243	herkommen	{"to come from"}	\N	3	8	\N	\N	\N
1244	herkunftsland	{"country of origin"}	\N	3	8	3	\N	herkunftsländer
1245	hierher	{here}	\N	3	8	\N	\N	\N
1246	hilfsbereit	{"ready to help"}	\N	3	8	\N	\N	\N
1247	inzwischen	{meanwhile}	\N	3	8	\N	\N	\N
1248	kopie	{copy}	\N	3	8	2	\N	kopien
1249	mentalität	{mentality}	\N	3	8	2	\N	mentalitäten
1250	nachdenklich	{thoughtful}	\N	3	8	\N	\N	\N
1251	pflegehelfer	{"nursing assistant"}	\N	3	8	\N	\N	pflegehelfer/innen
1252	pflegekraft	{carer}	\N	3	8	2	\N	pflegekräfte
1253	reihe	{row}	\N	3	8	2	\N	\N
1254	sachbearbeiter	{"administrative assistant"}	\N	3	8	\N	\N	sachbearbeiter/innen
1255	sprachnachweis	{"language certificate"}	\N	3	8	1	\N	\N
1256	übereinstimmen	{"to correspond"}	\N	3	8	\N	\N	\N
1257	überglücklich	{overjoyed}	\N	3	8	\N	\N	\N
1258	übersetzen	{"to translate"}	\N	3	8	\N	\N	\N
1259	übersetzung	{translation}	\N	3	8	2	\N	übersetzungen
1260	übersetzungsbüro	{"translation agency"}	\N	3	8	3	\N	\N
1261	ungeduldig	{impatient}	\N	3	8	\N	\N	\N
1262	vermissen	{"to miss"}	\N	3	8	\N	\N	\N
1263	verurteilen	{"to judge"}	\N	3	8	\N	\N	\N
1264	wahr	{true}	\N	3	8	\N	\N	\N
1265	weitergehen	{"to continue"}	\N	3	8	\N	\N	\N
1266	wohlfühlen	{"to feel comfortable"}	\N	3	8	\N	\N	\N
1267	ziel	{aim}	\N	3	8	3	\N	ziele
1268	zügig	{quick}	\N	3	8	\N	\N	\N
1269	zusammenstellen	{"to put together"}	\N	3	8	\N	\N	\N
1614	windschutzscheibe	{windscreen}	\N	3	12	2	\N	\N
1615	zulassen	{"to allow"}	\N	3	12	\N	\N	\N
1616	zusammenstoßen	{"to collide"}	\N	3	12	\N	\N	\N
1617	zusatzversicherung	{"additional insurance"}	\N	3	12	2	\N	\N
1529	aufkommen	{"to pay","to arise"}	{}	3	12	\N	\N	\N
1622	das gesetz	{law}	{}	\N	1	\N	\N	\N
1389	abdrehen	{"to turn off (water tap",heater)}	{}	3	10	\N	\N	\N
1623	der jura	{law}	{}	\N	1	\N	\N	\N
1319	fordern	{"to demand"}	{}	3	9	\N	\N	\N
516	fördern	{"to promote","to encourage"}	{}	3	7	\N	\N	\N
609	erhalten	{"to receive"}	{"Ich erhalte eine Bestellung."}	2	1	\N	\N	\N
1647	eigentlich	{actually}	{}	\N	1	\N	\N	\N
1525	abdecken	{"to cover"}	{}	3	12	\N	\N	\N
1650	decken	{}	{}	3	12	\N	\N	\N
1651	ungewöhnlich	{uncommon}	{}	3	3	\N	\N	\N
176	üblich	{normal,common}	{}	3	3	\N	\N	\N
1270	abhängig	{dependent}	{}	3	9	\N	\N	\N
1301	eigenverantwortlich	{independent}	{}	3	9	\N	\N	\N
1620	verantwortlich	{responsible}	{}	\N	1	\N	\N	\N
1653	kämpfen	{fight,battle,"military conflict"}	{}	\N	1	\N	\N	\N
1654	gemeinschaft	{association,community,society}	{}	\N	1	\N	\N	\N
1663	mor	{shala}	{}	\N	1	\N	\N	\N
1	abfall	{rubbish,garbage}	{}	3	2	1	\N	abfälle
1664	absagen	{"to cancel"}	{}	3	1	\N	\N	\N
1665	annullieren	{}	{}	3	1	\N	\N	\N
297	agb	{"general t&c","general terms and conditions","(allgemeine geschäftsbedingungen)"}	{}	3	5	\N	\N	\N
1392	anmachen	{"to turn on( e.g. gerät",licht)}	{}	3	10	\N	\N	\N
1666	ausmachen	{}	{}	3	10	\N	\N	\N
1395	aufmachen	{"to open","(e.g. door",window)}	{}	3	10	\N	\N	\N
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
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 3, true);


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.levels_id_seq', 5, true);


--
-- Name: parts_of_speech_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parts_of_speech_id_seq', 2, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 12, true);


--
-- Name: words_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_table_id_seq', 1666, true);


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
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


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
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


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
-- Name: articles_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX articles_name_key ON public.articles USING btree (name);


--
-- Name: levels_level_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX levels_level_key ON public.levels USING btree (level);


--
-- Name: parts_of_speech_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX parts_of_speech_name_key ON public.parts_of_speech USING btree (name);


--
-- Name: topics_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX topics_name_key ON public.topics USING btree (name);


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

