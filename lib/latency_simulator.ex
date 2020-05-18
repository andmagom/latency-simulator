defmodule LatencySimulator do


  use Plug.Router

  #plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)



  get "/wait/:time_to_wait" do
    case Integer.parse time_to_wait do
      {int_time, _} ->
        Process.sleep(int_time)
        send_resp(conn, 200, "OK After #{int_time} milliseconds")
      :error ->
        send_resp(conn, 500, "Please specify an integer in the form: /wait/:time_to_wait")
    end
  end

  post "/tokenapplication/" do
    Process.sleep(2000)
    send_resp(conn, 200, "{\"token_type\":\"string\",\"access_token\":\"string\",\"expires_in\":10000,\"consented_on\":10000,\"scope\":\"string\"}")
  end

  post "/tokenwas/" do
    Process.sleep(2000)
    send_resp(conn, 200,   "{\"data\":[{\"customerName\":\"string\",\"documentNumber\":\"string\",\"tokenType\":\"string\",\"accessToken\":\"string\",\"documentType\":\"string\"}]}")
  end

  post "/dynamickey/" do
    Process.sleep(2000)
    send_resp(conn, 200,   "{\"data\":[{\"type_strongAutentication\":\"string\"}]}")
  end



  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end

end
