import scala.concurrent.{Future, Promise}
/**
 * Created by Barry on 1/2/15.
 */
package object controllers {



  def never[T]: Future[T] = {
    Promise[T]().future
  }

}
