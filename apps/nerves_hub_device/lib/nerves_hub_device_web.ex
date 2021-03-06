defmodule NervesHubDeviceWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use NervesHubDeviceWeb, :controller
      use NervesHubDeviceWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: NervesHubDeviceWeb
      import Plug.Conn
      import NervesHubDeviceWeb.Gettext

      alias NervesHubDeviceWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/nerves_hub_device_web/templates",
        namespace: NervesHubDeviceWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      import NervesHubDeviceWeb.ErrorHelpers
      import NervesHubDeviceWeb.Gettext

      alias NervesHubDeviceWeb.Router.Helpers, as: Routes

      def render("error.json", %{error: error}) do
        %{
          error: error
        }
      end
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import NervesHubDeviceWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
