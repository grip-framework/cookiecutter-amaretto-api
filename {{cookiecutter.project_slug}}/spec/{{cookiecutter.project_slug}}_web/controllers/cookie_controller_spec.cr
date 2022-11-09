describe {{cookiecutter.module_slug}}Web::Controllers::CookieController do
  it "gets /" do
    response = get Application.new, "/api/cookie/"
    response.status_code.should eq 418
    response.body.should eq "Hello, World!"
  end

  it "posts /" do
    headers = HTTP::Headers.new
    headers.add("Content-Type", "application/json")

    response = post Application.new, "/api/cookie/", headers, {"exampleRequest" => "exampleMessage"}.to_json
    response.status_code.should eq 201
    response.body.should eq "Bye, exampleMessage!"
  end
end