%%%-------------------------------------------------------------------
%%% @author zsoci
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Apr 2017 2:34 PM
%%%-------------------------------------------------------------------
-module(sappan).
-author("zsoci").

-include("sappan.hrl").

-export([start/0,
         start_link/0,
         stop/0]).

%% start/0
%% ====================================================================
%% @doc starts the Common Service Interface service
%% @end
-spec start() -> Result when
  Result :: {ok, Pid} | ignore | {error, Error},
  Pid :: pid(),
  Error :: {already_started, Pid} | term().
start() -> csi:start(?SERVICE_NAME, ?SERVICE_MODULE).

%% start_link/0
%% ====================================================================
%% @doc starts the Common Service Interface service and make a link
%% @end
-spec start_link() -> Result when
  Result :: {ok, Pid} | ignore | {error, Error},
  Pid :: pid(),
  Error :: {already_started, Pid} | term().
start_link() -> csi:start_link(?SERVICE_NAME, ?SERVICE_MODULE).

%% stop/0
%% ====================================================================
%% @doc stops the Common Service Interface service
%% @end
-spec stop() -> Reply when
  Reply :: term().
stop() -> csi:stop(?SERVICE_NAME).