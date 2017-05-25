%%%-------------------------------------------------------------------
%% @doc sappan public API
%% @end
%%%-------------------------------------------------------------------

-module(sappan_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

-spec start(Type :: application:start_type(), Args :: term()) ->
  {ok, Pid :: pid()} |
  {error, Reason :: term()}.
start(_Type, _Args) ->
  case sappan_sup:start_link() of
    {ok, Pid} ->
      {ok, Pid};
    Else ->
      {error, Else}
  end.

%%--------------------------------------------------------------------
-spec stop(State :: term()) ->
  ok.
stop(_State) ->
  ok.

%%====================================================================
%% Internal functions
%%====================================================================
