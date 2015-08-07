# Introduction #

Most Producteev API methods require user to be logged in. All responses are relative to the context of the logged-in user. For example, an attempt to retrieve information about a task who does not belong to the requesting user team will fail.

# Details #

  * Initialize  ProducteevService

```
service = new ProducteevService("YOUR_API_KEY", "YOUR_SECRET_KEY");
```

  * Call login method

```
service.users.addEventListener(ProducteevResultEvent.USERS_LOGIN, usersLoginHandler);
service.users.login("yourLogin", "yourPassword");
```

  * Add the token to the service

```
private function usersLoginHandler(e:ProducteevResultEvent):void
{
	if (e.success)
	{
		var auth:AuthResult = AuthResult(e.data.users);
		service.token = auth.token;
	}
	else
	{
		Alert.show(e.data.error.message as String);
	}
	
}
```

Once the token is setted in the service, you will be able to call any other methods.