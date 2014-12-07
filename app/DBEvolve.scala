import java.io.File

/**
 * Created by geek on 12/7/14.
 */
object DBEvolve extends App {
  play.api.db.evolutions.OfflineEvolutions.applyScript(new File("."), this.getClass.getClassLoader, "default")
}
