package dzh.ysyyrps.modules.help.util;

public class AntiCrack
{
   private AntiCrack()
   {
   }
   public static Throwable fake(Throwable throwable, Throwable throwable1)
   {
       try
       {
           throwable.getClass().getMethod("initCause", new Class[] {
               Throwable.class
           }).invoke(throwable, new Object[] {
               throwable1
           });
       }
       catch(Exception exception) { }
       return throwable;
   }
}
