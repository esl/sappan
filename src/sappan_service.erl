-module(sappan_service).
-behaviour(csi_server).

%% General state of the service
-record(sappan_state, {}).

%% Lifecycle State for every requests'
-record(sappan_session_state, {}).

-export([init_service/1,
         init/2,
         terminate/2,
         terminate_service/2]).

-type(state() :: #sappan_state{}).
-type(session_state() :: #sappan_session_state{}).

%% ====================================================================
%% Behavioural functions
%% ====================================================================
-spec init_service(InitArgs :: term()) ->
  Result :: {ok, state()}.
init_service(_InitArgs) ->
  {ok, #sappan_state{}}.

-spec init(InitArgs :: term(), State :: state()) ->
  Result :: {ok, session_state()}.
init(_Args, _ServiceState) ->
  {ok, #sappan_session_state{}}.

-spec terminate(Reason :: term(), State :: session_state()) -> Result :: ok.
terminate(_Reason, _State) ->
  ok.

-spec terminate_service(Reason :: term(),
                        State :: state()) -> Result :: ok.
terminate_service(_Reason, _State) ->
  ok.

%% ====================================================================
%% Service functions
%% ====================================================================
