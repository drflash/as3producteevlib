# Introduction #

Calling method is really easy if you're used to asynchronous calls in AS3.
All methods are available through the ProducteevService class.

# Method Groups #

Producteev API is splitted in 5 groups :
  * Users
  * Dashboards
  * Tasks
  * Labels
  * Activities

ProducteevService exposes each of these groups through a property of the same name:

  * service.users
  * service.dashboards
  * ...



# Calling a method #

  * First, you need to authenticate the user in order to call any other methods. See [LoginProcess](LoginProcess.md)

  * Add an event listener and call the method you re interested in :

```
service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_CREATE, createHandler);
service.dashboards.create('myNewDashboard');
```

  * Verify the result sent from the server

```
private function createHandler(event:ProducteevResultEvent):void
{
  if (event.success)
  {
   //event.data.dashboards contains the result of the call
  }
  else
  {
   //event.data.error contains the error if the call failed
  }
}
```

# Available methods #

All method from the [producteev API](http://code.google.com/p/producteev-api/wiki/methodsDescriptions) are available.
Have a look at the documentation (available in the download package) to find the corresponding AS3 methods.

# Event Listeners #

Everytime you call a method, an ProducteevResultEvent is sent by the group (users, dashboards, ...) that initiated the call.

Usually, the name of the event constant name is made of :
  * the name of the group
  * an underscore
  * the name of the method

So if you call

```
service.tasks.create
```

the dispatched event is ProducteevResultEvent.TASKS\_CREATE