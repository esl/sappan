%%%-------------------------------------------------------------------
%% @doc sappan top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(sappan_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

-spec start_link() ->
  supervisor:startlink_ret().
start_link() ->
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

-spec init(Args :: term()) ->
  'ignore' |
  {'ok',{ {'one_for_all',non_neg_integer(),pos_integer()}
          | {'one_for_one',non_neg_integer(),pos_integer()}
          | {'rest_for_one',non_neg_integer(),pos_integer()}
          | {'simple_one_for_one',non_neg_integer(),pos_integer()}
        , [ { _
            , { atom()
              , atom()
              , 'undefined'
                | [any()]}
            , 'permanent'
              | 'temporary'
              | 'transient'
            , 'brutal_kill'
              | 'infinity'
              | non_neg_integer()
            , 'supervisor'
              | 'worker'
            , 'dynamic'
              | [ atom() ]}
          ]}}.
init([]) ->
  Server = {sappan, {sappan, start_link, []},
            permanent, 2000, worker, [sappan]},
  Procs = [Server],
  {ok, {{one_for_one, 3, 10}, Procs}}.

%%====================================================================
%% Internal functions
%%====================================================================
