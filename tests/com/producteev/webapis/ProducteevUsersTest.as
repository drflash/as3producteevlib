package com.producteev.webapis
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.hamcrest.core.isA;

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
		
		[Test(async)]
		public function testColleagues():void
		{
			var async:Function = Async.asyncHandler(this, usersColleaguesHandler, 500, timeOutHandler);
			
			service.users.addEventListener(ProducteevResultEvent.USERS_COLLEAGUES, async)
			service.users.colleagues();
		}
		
		private function usersColleaguesHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.users, isA(Array));
		}
		
		[Test(async)]
		public function testSetDefaultDashboard():void
		{
			var async:Function = Async.asyncHandler(this, setDefaultDashboardHandler, 500, timeOutHandler);
			
			service.users.addEventListener(ProducteevResultEvent.USERS_SET_DEFAULT_DASHBOARD, async)
			service.users.setDefaultDashboard(24046);
		}
		
		private function setDefaultDashboardHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == false", e.success);
			assertThat(e.data.users, isA(User));
		}
		
		
		[Test(async)]
		public function testDefaultDashboardWithWrongDashboardId():void
		{
			var async:Function = Async.asyncHandler(this, setDefaultDashboardWithWrongDashboardIdHandler, 500, timeOutHandler);
			
			service.users.addEventListener(ProducteevResultEvent.USERS_SET_DEFAULT_DASHBOARD, async)
			service.users.setDefaultDashboard(36000);
		}
		
		private function setDefaultDashboardWithWrongDashboardIdHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertFalse("event.success == false", e.success);
			assertNotNull("error not null", e.data.error);
		}
		
		[Test(async)]
		public function testSetTimezoneNonExistingString():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, timeOutHandler);
			
			service.users.addEventListener(ProducteevResultEvent.USERS_SET_TIMEZONE, async)
			service.users.setTimezone("nonExisting/Timezone");
		}
		
		private function assertErrorHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertFalse("event.success == false", e.success);
			assertNotNull("event.data.error", e.data.error);
		}
		
		private function timeOutHandler(o:Object):void
		{
			Assert.fail("timeout handler");
		}
	}
}