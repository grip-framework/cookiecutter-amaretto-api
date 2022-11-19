# `{{cookiecutter.module_slug}}` keeps the contexts that define your domain
# and business logic.
#
# Contexts are also responsible for managing your data, regardless
# if it comes from the database, an external API or anything else.
module {{cookiecutter.module_slug}}
  Granite::Connections << Granite::Adapter::Pg.new(name: "postgres", url: Micrate::DB.connection_url.to_s)
end
