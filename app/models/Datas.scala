package models

import java.sql.Connection

import controllers.DataController.Contact
import imadz.model.gen.Tables.DATA
import imadz.model.gen.tables.pojos.Data
import imadz.model.gen.tables.records.DataRecord
import org.jooq.impl._
import org.jooq.scala.Conversions._
import play.api.Play.current
import play.api.db.DB

import scala.collection.JavaConversions._


object Datas {

  implicit def dataRecord2Data(r: DataRecord): Data = r.into(classOf[Data])

  implicit def dataRecord2OptionData(r : DataRecord) : Option[Data] = if (null == r) None else Some(dataRecord2Data(r))

  implicit def dataRecordList2DataList(r: List[DataRecord]): List[Data] = r.map(dataRecord2Data(_))

  implicit def conn2DSL(conn: Connection) = DSL.using(conn)

  def listAll: List[Data] = DB.withConnection { conn =>
    for (r: DataRecord <- conn
      selectFrom DATA
      fetch
    ) yield r

  } toList

  def findById(id: String, tableId: String, orgId: String): Option[Data] = DB.withConnection { conn =>
    conn.selectFrom (DATA)
      .where (DATA.OBJECT_ID === id)
      .and (DATA.TABLE_ID === tableId)
      .and (DATA.ORG_ID === orgId)
      .fetchOne();

  }

  def create(contact: Contact) : Unit = DB.withConnection { conn =>
    conn.insertInto(DATA)
      .set(DATA.ORG_ID, contact.orgId)
      .set(DATA.TABLE_ID, contact.tableId)
      .set(DATA.OBJECT_ID, contact.objSeq)
      .set(DATA.COL_1, contact.firstName)
      .set(DATA.COL_2, contact.lastName)
      .set(DATA.COL_3, contact.email)
      .execute
  }

  def update(contact: Contact) : Unit = DB.withConnection { conn =>
    conn.update(DATA)
      .set(DATA.COL_1, contact.firstName)
      .set(DATA.COL_2, contact.lastName)
      .set(DATA.COL_3, contact.email)
      .where(DATA.ORG_ID === contact.orgId)
    .and(DATA.TABLE_ID === contact.tableId)
    .and(DATA.OBJECT_ID === contact.objSeq)
    .execute
  }
}