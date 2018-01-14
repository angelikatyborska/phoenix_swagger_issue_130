# PhoenixSwaggerIssue130

This repository illustrates [Issue 130](https://github.com/xerions/phoenix_swagger/issues/130) of `xerions/phoenix_swagger`.

This is an umbrella project consisting of a Phoenix app using Swagger (`apps/my_web_app`) and a library app (`apps/my_library`) that does not have an OTP application.

To regenerate the swagger file, this command **must be run from inside `apps/my_web_app`**:

```
angelika at MBP in ~/Documents/phoenix_swagger_issue_130/apps/my_web_app
$ mix phx.swagger.generate -e MyWebApp.Endpoint -r MyWebApp.Router priv/static/swagger.json
```

What does not work is running this command from the root directory:

```
angelika at MBP in ~/Documents/phoenix_swagger_issue_130 
$ mix phx.swagger.generate -e MyWebApp.Endpoint -r MyWebApp.Router apps/my_web_app/priv/static/swagger.json
Generated apps/my_web_app/priv/static/swagger.json
** (ArgumentError) argument error
    lib/mix/tasks/swagger.generate.ex:27: Mix.Tasks.Phx.Swagger.Generate.top_level_namespace/0
    lib/mix/tasks/swagger.generate.ex:30: Mix.Tasks.Phx.Swagger.Generate.default_router_module_name/0
    lib/mix/tasks/swagger.generate.ex:32: Mix.Tasks.Phx.Swagger.Generate.router_module/1
    lib/mix/tasks/swagger.generate.ex:44: Mix.Tasks.Phx.Swagger.Generate.run/1
    (mix) lib/mix/task.ex:301: Mix.Task.run_task/3
    (mix) lib/mix/project.ex:332: Mix.Project.in_project/4
    (elixir) lib/file.ex:1277: File.cd!/2
    (mix) lib/mix/task.ex:401: anonymous fn/4 in Mix.Task.recur/1
```
