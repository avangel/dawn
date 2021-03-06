package uk.co.ziazoo.injector.impl
{	
  import org.flexunit.Assert;
  
  import some.thing.Apple;
  import some.thing.Car;
  
  import uk.co.ziazoo.injector.IMapping;
  import uk.co.ziazoo.injector.IMappingBuilder;
  
  public class MappingBuilderTest
  {
    private var builder:IMappingBuilder;
    
    public function MappingBuilderTest()
    {
    }
    
    [Before]
    public function setUp():void
    {
      builder = new MappingBuilder(Apple, new Reflector(), null);
    }
    
    [After]
    public function tearDown():void
    {
      builder = null;
    }
    
    [Test]
    public function createMapping():void
    {
      builder.to(Car);
      var mapping:IMapping = builder.mapping;
      Assert.assertTrue( "maps correct class", mapping.type == Apple );
      Assert.assertTrue( "provider of correct type", mapping.provider is BasicProvider );
      
      var provider:BasicProvider = BasicProvider( mapping.provider );
      Assert.assertTrue( "provider for Car", provider.type == Car );
    }
    
    [Test]
    public function createMappingWithName():void
    {
      builder.to(Car).named("car tree?");
      
      var mapping:IMapping = builder.mapping;
      Assert.assertTrue( "maps correct class", mapping.type == Apple );
      Assert.assertTrue( "provider of correct type", mapping.provider is BasicProvider );
      
      var provider:BasicProvider = BasicProvider( mapping.provider );
      Assert.assertTrue( "provider for Car", provider.type == Car );
      
      Assert.assertTrue( "gets the name right", mapping.name == "car tree?" );
    }
    
    [Test]
    [Ignore(message="refactoring the scope classes")]
    public function createSingletonMapping():void
    {
      builder.to(Car).asSingleton();
      var mapping:IMapping = builder.mapping;
      Assert.assertTrue( "is SingletonScope", mapping.provider is SingletonScope )
    }
  }
}