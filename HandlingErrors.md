# Introduction #

There are 2 kind of errors you can handle
  * Server error
  * Method errors


# Server errors #

A ProducteevFaultEvent is dispatched by the ProducteevService when a server error is happening (Internal Server Error, Service Unavailable, ...).

These kinds of error should happened rarely but it's still recommanded to add a listener in your application :

```
service.addEventListener(ProducteevFaultEvent.FAULT, serverFaultHandler);

private function serverfaultHandler(event:ProducteevFaultEvent)
{
Alert.show("Server Error: " + e.data);
}
```

# Method errors #

Sometimes, you might call methods on objects you don't have permissions.
For each method call, you should check if the request failed or not through the ProducteevResultEvent success property dispatched after the server sent back a response :

```
service.tasks.addEventListener(ProducteevResultEvent.TASKS_SHOW_LIST, showListHandler)
service.tasks.show_list();

private function showListHandler(event:ProducteevResultEvent):void
{
  if (event.success)
  {
    //means the request succeed
  }
  else
  {
   //request failed
  }
}
```

A ProducteevError containing a message property explaining why the request failed is stored in the event.data.error property.