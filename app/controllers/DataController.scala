package controllers

import models.Datas
import play.api.data.Form
import play.api.data.Forms._
import play.api.libs.json.JsValue
import play.api.mvc.{Result, Action, Controller}

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.Future

/**
 * Created by Barry on 12/7/14.
 */
object DataController extends Controller {

  case class Contact(orgId: String, tableId: String, objSeq: String, firstName: String, lastName: String, email: String)

  def data = Datas.listAll

  def list = Action {
    Ok(views.html.data(data))
  }

  def futureList = Action.async {
    Future {
      data
    } map { data => Ok(views.html.data(data))}
  }

  val dataForm: Form[Contact] = Form(
    mapping[Contact, String, String, String, String, String, String](
      "organizationId" -> text,
      "tableId" -> text,
      "objectSeq" -> text,
      "firstName" -> text,
      "lastName" -> text,
      "email" -> text
    )(Contact.apply)(Contact.unapply)
  )

  def create = Action { implicit request =>
    dataForm.bindFromRequest.fold(redirectErrorPage, createContact)
  }

  def update = Action { implicit request =>
    dataForm.bindFromRequest.fold(redirectErrorPage, updateContact)
  }

  def updateJson = Action { implicit request =>
    val jsValue: JsValue = request.body.asJson.get
    val orgId = jsValue \ "organizationId"
    val tableId = jsValue \ "tableId"
    val objectId = jsValue \ "objectId"
    val firstName = jsValue \ "firstName"
    val lastName = jsValue \ "lastName"
    val email = jsValue \ "email"
    val contact = Contact(orgId.as[String], tableId.as[String], objectId.as[String], firstName.as[String], lastName.as[String], email.as[String])
    Datas.update(contact)
    Ok
  }

  def redirectErrorPage: (Form[Contact]) => DataController.Status = {
    errors =>
      BadRequest
  }

  private def createContact: (Contact) => Result = {
    case contact: Contact =>
      Datas.create(contact)
      Redirect(routes.DataController.list())

  }

  private def updateContact: (Contact) => Result = {
    case contact: Contact =>
      Datas.update(contact)
      Redirect(routes.DataController.list())
  }
}
