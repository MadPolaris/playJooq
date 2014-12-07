package models

import scala.collection.JavaConversions._

import imadz.model.gen.Tables.DATA
import imadz.model.gen.tables.pojos.Data
import imadz.model.gen.tables.records.DataRecord
import org.jooq.impl._
import play.api.db.DB
import play.api.Play.current

object Datas {

  implicit def dataRecord2Data(r: DataRecord): Data = r.into(classOf[Data])

  implicit def dataRecordList2DataList(r: List[DataRecord]): List[Data] = r.map(dataRecord2Data(_))

  def listAll: List[Data] = DB.withConnection { conn =>
    DSL.using(conn)
      .selectFrom(DATA)
      .fetch
      .toList
  }

  def findById(id: String, tableId: String, orgId: String): Data = DB.withConnection { conn =>
    DSL.using(conn)
    .selectFrom(DATA)
      .where(DATA.OBJECT_ID.eq(id))
      .and(DATA.TABLE_ID.eq(tableId))
      .and(DATA.ORG_ID.eq(orgId))
      .fetchOne
  }

}