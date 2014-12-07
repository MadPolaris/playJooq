package controllers

import models.Datas
import play.api.mvc.{Action, Controller}

/**
 * Created by geek on 12/7/14.
 */
object DataController extends Controller{


  def list = Action {
    Ok(views.html.data(Datas.listAll))
  }
}
