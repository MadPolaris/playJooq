package controllers

import models.Datas
import play.api.mvc.{Action, Controller}

import scala.concurrent.Future

/**
 * Created by Barry on 12/7/14.
 */
object DataController extends Controller{

  def list = Action {
    Ok(views.html.data(Datas.listAll))
  }

  def futureList = Action.async {
    Future {Datas.listAll} map { data => Ok(views.html.data(data)) }
  }
}
