package models;

import java.math.*;
import play.data.validation.Constraints;
import play.data.*;
import scala.Option;
import java.sql.Connection;
import java.sql.Statement;
import java.util.*;
import java.io.*;
import java.sql.*;
import play.db.*;
import java.util.*;
import javax.persistence.*;
import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;
import com.avaje.ebean.Model.Finder;
import play.Logger;
import com.avaje.ebean.Model;


@Entity
public class QuoteModel  extends Model{

  @Id
  public long id;
  public long user_Id;

  @Version
  public java.util.Date version; //timestamp

  @Column(precision = 38, scale = 2) // Constrains BigDecimal to 38 integers and 2 decimal places.
  public BigDecimal cost;



}
