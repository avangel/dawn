package com.example.model
{
	import com.example.handlers.IPeopleRequestHandler;
	import com.example.handlers.IPersonRequestHandler;
	import com.example.workers.PeopleRecieved;
	import com.example.workers.PersonRecieved;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	import uk.co.ziazoo.INotificationBus;

	public class PersonModel 
		implements IPeopleRequestHandler, IPersonRequestHandler
	{
		private var _bus:INotificationBus;
		private var _people:IList;
		
		public function PersonModel()
		{
			var p1:Person = new Person( "sam", 26 );
			var p2:Person = new Person( "becky", 26 );
			var p3:Person = new Person( "wibble", 200 );
			_people = new ArrayCollection( [ p1, p2, p3 ] );
		}
		
		[Inject]
		public function set notificationBus( value:INotificationBus ):void
		{
			_bus = value;
		}
		
		public function retrieveAllPeople():void
		{
			_bus.trigger( new PeopleRecieved( _people ) );
		}
		
		public function retrievePerson( name:String ):void
		{
			for each( var person:Person in _people )
			{
				if( person.name == name )
				{
					_bus.trigger( new PersonRecieved( person ) );
					return;
				}
			}
			// what do I do on fail?
		}
	}
}