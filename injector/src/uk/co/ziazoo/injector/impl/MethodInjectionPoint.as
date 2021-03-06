package uk.co.ziazoo.injector.impl 
{
  import uk.co.ziazoo.injector.*;
  
  internal class MethodInjectionPoint implements IInjectionPoint
  {
    private var method:Method;
    private var dependencies:Array;
    
    public function MethodInjectionPoint( method:Method )
    {
      this.method = method;
      dependencies = [];
    }
    
    public function getMethodName():String
    {
      return method.name;
    }
    
    public function getDependencies():Array
    {
      return dependencies;
    }
    
    public function isOptional():Boolean
    {
      return false;
    }
    
    internal function addDependency( dependency:IDependency ):void
    {
      dependencies.push( dependency );
    }
  }
}