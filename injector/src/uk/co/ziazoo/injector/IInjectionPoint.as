package uk.co.ziazoo.injector
{	
  public interface IInjectionPoint
  {
    function getDependencies():Array;
    
    function isOptional():Boolean;
  }
}