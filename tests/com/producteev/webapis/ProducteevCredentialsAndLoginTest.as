package com.producteev.webapis
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevFaultEvent;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;

	public class ProducteevCredentialsAndLoginTest
	{
		
		[Test]
		public function testAPICredentials():void 
		{
			var service:ProducteevService = new ProducteevService(Credentials.API_KEY, Credentials.API_SECRET);
			assertTrue("service.api_key == API_KEY", service.apiKey == Credentials.API_KEY);
			assertTrue("service.api_secret == API_SECRET", service.apiSecret == Credentials.API_SECRET);
		}
		
		//**************************************************************
		//
		// Tests for the "Users" Method Group
		//
		//**************************************************************
		
		[Test(async)]
		public function testLogin():void
		{
			var asyncHandler:Function = Async.asyncHandler(this, usersLoginHandler, 500, null, handleTimeout);

		 	var service:ProducteevService =  new ProducteevService(Credentials.API_KEY, Credentials.API_SECRET);
			service.users.addEventListener(ProducteevResultEvent.USERS_LOGIN, asyncHandler);
			service.users.login(Credentials.userName, Credentials.password);
		}
		
		private function usersLoginHandler(event:ProducteevResultEvent, passThroughData:Object):void
		{
			assertTrue("event.success == true", event.success);
			
			var authResult:AuthResult = event.data.users;
			assertNotNull("authRest.token != null", authResult.token);
		}
		
		[Test(async)]
		public function testWrongLogin():void
		{
			var asyncHandler:Function = Async.asyncHandler(this, usersLoginFaultHandler, 500, null, handleTimeout);
			
			var service:ProducteevService =  new ProducteevService(Credentials.API_KEY, Credentials.API_SECRET);
			service.users.addEventListener(ProducteevResultEvent.USERS_LOGIN, asyncHandler);
			service.users.login("username", "password");
		}
		
		private function usersLoginFaultHandler(event:ProducteevResultEvent, o:Object):void
		{
			assertFalse("event.success == false", event.success);
			assertEquals("event.data == Wrong Credentials", event.data, "Wrong credentials");
		}
		
		[Test(async)]
		public function testTooShortPassword():void
		{
			var asyncHandler:Function = Async.asyncHandler(this, testTooShortPassword, 500, null, handleTimeout);
			
			var service:ProducteevService =  new ProducteevService(Credentials.API_KEY, Credentials.API_SECRET);
			service.users.addEventListener(ProducteevResultEvent.USERS_SIGNUP, asyncHandler);
			service.users.signup("", "", "", "short", "");
		}
		
		private function testTooShortPasswordHandler(event:ProducteevResultEvent, o:Object):void
		{
			assertFalse("event.success == false", event.success);
			assertNotNull("event.data.error not null", event.data.error);
		}
		
		[Test(async)]
		public function testSignumWrongEmail():void
		{
			var asyncHandler:Function = Async.asyncHandler(this, testSignumWrongEmailHandler, 500, null, handleTimeout);
			
			var service:ProducteevService =  new ProducteevService(Credentials.API_KEY, Credentials.API_SECRET);
			service.users.addEventListener(ProducteevResultEvent.USERS_SIGNUP, asyncHandler);
			service.users.signup("àploa@.@", "", "", "product33v", "");
		}
		
		private function testSignumWrongEmailHandler(event:ProducteevResultEvent, o:Object):void
		{
			assertFalse("event.success == false", event.success);
			assertNotNull("event.data.error not null", event.data.error);
		}
		
				
		private function handleTimeout(passThourghData:Object):void
		{
			Assert.fail("Timeout reached before event");	
		}

	}
}