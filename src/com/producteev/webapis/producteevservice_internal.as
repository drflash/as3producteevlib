package com.producteev.webapis
{
	/**
	 * Because of the directory structure (having a methodgroups package
	 * where the classes in there are really "Friends" of the ProducteevService
	 * class), we can't use the "internal" modifier to hide methods from
	 * the public API.  Thus, in order to provide the helper classes in the
	 * methodGroup package access to this class, we create a special
	 * namespace to use as a method modifier.
	 */
	public namespace producteevservice_internal = "http://www.producteev.com/webapis/internal";
}