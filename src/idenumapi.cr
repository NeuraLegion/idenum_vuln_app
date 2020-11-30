require "http"
module Idenumapi
  VERSION = "0.1.0"
  USERS = {
  10 => %(
      {
          "name": "James",
          "school":
            {
              "school_name":"FIT",
              "address": "something"
            }
      }
  ),
  11 => %(
      {
          "name": "Bar",
          "school":
            {
              "school_name":"FIT",
              "address": "something"
            }
      }
  ),
  12 => %(
      {
          "name": "Amar",
          "school":
            {
              "school_name":"FIT",
              "address": "something"
            }
      }
  ),
  13 => %(
      {
          "name": "Bekto",
          "school":
            {
              "school_name":"FIT",
              "address": "something"
            }
      }
  ),
  14 => %(
      {
          "name": "Bekto",
          "school":
            {
              "school_name":"FIT",
              "address": "something"
            }
      }
  ),
  15 => %(
    {
        "name": "Bekto",
        "school":
          {
            "school_name":"FIT",
            "address": "something"
          }
    }
  ),
  16 => %(
    {
        "name": "Bekto",
        "school":
          {
            "school_name":"FIT",
            "address": "something"
          }
    }
  ),
  17 => %(
    {
        "name": "Bekto",
        "school":
          {
            "school_name":"FIT",
            "address": "something"
          }
    }
  ),
  18 => %(
    {
        "name": "Bekto",
        "school":
          {
            "school_name":"FIT",
            "address": "something"
          }
    }
  ),
  19 => %(
    {
        "name": "Bekto",
        "school":
          {
            "school_name":"FIT",
            "address": "something"
          }
    }
  ),
  20 => %(
    {
        "name": "Bekto",
        "school":
          {
            "school_name":"FIT",
            "address": "something"
          }
    }
  ),
}
WRONG_USER = <<-EOF
  {
      "error" :
      {
        "status": 404,
        "message": "User doesn't exist"
      }
  }
  EOF
  server = HTTP::Server.new do |context|
    context.response.content_type = "application/json"
    if context.request.method.includes?("GET")
      userid = context.request.query_params["users"].try &.to_i
      body = ""
      USERS.each { |id, response| body = response if id == userid }
      body = WRONG_USER if body.size == 0
      context.response.status == 200
      context.response.print body
    else
      context.response.status == 400
      context.response.print "400 Bad Request"
    end
  end
  server.bind_tcp "0.0.0.0", 80
  server.try &.listen
end
