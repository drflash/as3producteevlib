package com.producteev.webapis
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;

	public class ProducteevUsersTest
	{
		public var service:ProducteevService;
		
		[Before(async)]
		public function login():void
		{
			var async:Function = Async.asyncHandler(this, loginHandler, 500);
			
			service = new ProducteevService(Credentials.API_KEY, Credentials.API_SECRET);
			service.users.addEventListener(ProducteevResultEvent.USERS_LOGIN, async);
			service.users.login(Credentials.userName, Credentials.password);
		}
		
		public function loginHandler(e:ProducteevResultEvent, o:Object):void
		{
			var authResult:AuthResult = AuthResult(e.data.users);
			service.token = authResult.token;
		}
		
		[Test(async)]
		public function testView():void
		{
			var async:Function = Async.asyncHandler(this, usersViewHandler, 500, timeOutHandler);
			
			service.users.addEventListener(ProducteevResultEvent.USERS_VIEW, async)
			service.users.view();
		}
		
		private function usersViewHandler(e:ProducteevResultEvent, o:Object):void
		{
			var user:User = e.data.users;
			
			assertTrue("event.success == true", e.success);
			assertTrue("id_user present", user.id_user.toString().length > 1);
		}
		
		[Test(async)]
		public function testViewWithNonExistingIdColleague():void
		{
			var async:Function = Async.asyncHandler(this, usersViewNonExistingIdColleagueHandler, 500, timeOutHandler);
			
			service.users.addEventListener(ProducteevResultEvent.USERS_VIEW, async)
			service.users.view(0101010);
		}
		
		private function usersViewNonExistingIdColleagueHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertFalse("event.success == false", e.success);
			assertNotNull("error not null", e.data.error);
		}
		
		private function timeOutHandler(o:Object):void
		{
			Assert.fail("timeout handler");
		}
	}
}