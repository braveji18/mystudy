// ORM class for table 'INSTALL_LOCATION'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:56:09 KST 2017
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class INSTALL_LOCATION extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("device_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        device_name = (String)value;
      }
    });
    setters.put("base_organ", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        base_organ = (String)value;
      }
    });
    setters.put("base_sitetype", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        base_sitetype = (String)value;
      }
    });
    setters.put("base_siteinout", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        base_siteinout = (String)value;
      }
    });
    setters.put("base_roomtype", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        base_roomtype = (String)value;
      }
    });
    setters.put("site_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        site_name = (String)value;
      }
    });
    setters.put("site_floor", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        site_floor = (String)value;
      }
    });
    setters.put("site_area", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        site_area = (String)value;
      }
    });
    setters.put("description", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        description = (String)value;
      }
    });
    setters.put("reg_date", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        reg_date = (java.sql.Timestamp)value;
      }
    });
  }
  public INSTALL_LOCATION() {
    init0();
  }
  private String device_name;
  public String get_device_name() {
    return device_name;
  }
  public void set_device_name(String device_name) {
    this.device_name = device_name;
  }
  public INSTALL_LOCATION with_device_name(String device_name) {
    this.device_name = device_name;
    return this;
  }
  private String base_organ;
  public String get_base_organ() {
    return base_organ;
  }
  public void set_base_organ(String base_organ) {
    this.base_organ = base_organ;
  }
  public INSTALL_LOCATION with_base_organ(String base_organ) {
    this.base_organ = base_organ;
    return this;
  }
  private String base_sitetype;
  public String get_base_sitetype() {
    return base_sitetype;
  }
  public void set_base_sitetype(String base_sitetype) {
    this.base_sitetype = base_sitetype;
  }
  public INSTALL_LOCATION with_base_sitetype(String base_sitetype) {
    this.base_sitetype = base_sitetype;
    return this;
  }
  private String base_siteinout;
  public String get_base_siteinout() {
    return base_siteinout;
  }
  public void set_base_siteinout(String base_siteinout) {
    this.base_siteinout = base_siteinout;
  }
  public INSTALL_LOCATION with_base_siteinout(String base_siteinout) {
    this.base_siteinout = base_siteinout;
    return this;
  }
  private String base_roomtype;
  public String get_base_roomtype() {
    return base_roomtype;
  }
  public void set_base_roomtype(String base_roomtype) {
    this.base_roomtype = base_roomtype;
  }
  public INSTALL_LOCATION with_base_roomtype(String base_roomtype) {
    this.base_roomtype = base_roomtype;
    return this;
  }
  private String site_name;
  public String get_site_name() {
    return site_name;
  }
  public void set_site_name(String site_name) {
    this.site_name = site_name;
  }
  public INSTALL_LOCATION with_site_name(String site_name) {
    this.site_name = site_name;
    return this;
  }
  private String site_floor;
  public String get_site_floor() {
    return site_floor;
  }
  public void set_site_floor(String site_floor) {
    this.site_floor = site_floor;
  }
  public INSTALL_LOCATION with_site_floor(String site_floor) {
    this.site_floor = site_floor;
    return this;
  }
  private String site_area;
  public String get_site_area() {
    return site_area;
  }
  public void set_site_area(String site_area) {
    this.site_area = site_area;
  }
  public INSTALL_LOCATION with_site_area(String site_area) {
    this.site_area = site_area;
    return this;
  }
  private String description;
  public String get_description() {
    return description;
  }
  public void set_description(String description) {
    this.description = description;
  }
  public INSTALL_LOCATION with_description(String description) {
    this.description = description;
    return this;
  }
  private java.sql.Timestamp reg_date;
  public java.sql.Timestamp get_reg_date() {
    return reg_date;
  }
  public void set_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
  }
  public INSTALL_LOCATION with_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof INSTALL_LOCATION)) {
      return false;
    }
    INSTALL_LOCATION that = (INSTALL_LOCATION) o;
    boolean equal = true;
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.base_organ == null ? that.base_organ == null : this.base_organ.equals(that.base_organ));
    equal = equal && (this.base_sitetype == null ? that.base_sitetype == null : this.base_sitetype.equals(that.base_sitetype));
    equal = equal && (this.base_siteinout == null ? that.base_siteinout == null : this.base_siteinout.equals(that.base_siteinout));
    equal = equal && (this.base_roomtype == null ? that.base_roomtype == null : this.base_roomtype.equals(that.base_roomtype));
    equal = equal && (this.site_name == null ? that.site_name == null : this.site_name.equals(that.site_name));
    equal = equal && (this.site_floor == null ? that.site_floor == null : this.site_floor.equals(that.site_floor));
    equal = equal && (this.site_area == null ? that.site_area == null : this.site_area.equals(that.site_area));
    equal = equal && (this.description == null ? that.description == null : this.description.equals(that.description));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof INSTALL_LOCATION)) {
      return false;
    }
    INSTALL_LOCATION that = (INSTALL_LOCATION) o;
    boolean equal = true;
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.base_organ == null ? that.base_organ == null : this.base_organ.equals(that.base_organ));
    equal = equal && (this.base_sitetype == null ? that.base_sitetype == null : this.base_sitetype.equals(that.base_sitetype));
    equal = equal && (this.base_siteinout == null ? that.base_siteinout == null : this.base_siteinout.equals(that.base_siteinout));
    equal = equal && (this.base_roomtype == null ? that.base_roomtype == null : this.base_roomtype.equals(that.base_roomtype));
    equal = equal && (this.site_name == null ? that.site_name == null : this.site_name.equals(that.site_name));
    equal = equal && (this.site_floor == null ? that.site_floor == null : this.site_floor.equals(that.site_floor));
    equal = equal && (this.site_area == null ? that.site_area == null : this.site_area.equals(that.site_area));
    equal = equal && (this.description == null ? that.description == null : this.description.equals(that.description));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.device_name = JdbcWritableBridge.readString(1, __dbResults);
    this.base_organ = JdbcWritableBridge.readString(2, __dbResults);
    this.base_sitetype = JdbcWritableBridge.readString(3, __dbResults);
    this.base_siteinout = JdbcWritableBridge.readString(4, __dbResults);
    this.base_roomtype = JdbcWritableBridge.readString(5, __dbResults);
    this.site_name = JdbcWritableBridge.readString(6, __dbResults);
    this.site_floor = JdbcWritableBridge.readString(7, __dbResults);
    this.site_area = JdbcWritableBridge.readString(8, __dbResults);
    this.description = JdbcWritableBridge.readString(9, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(10, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.device_name = JdbcWritableBridge.readString(1, __dbResults);
    this.base_organ = JdbcWritableBridge.readString(2, __dbResults);
    this.base_sitetype = JdbcWritableBridge.readString(3, __dbResults);
    this.base_siteinout = JdbcWritableBridge.readString(4, __dbResults);
    this.base_roomtype = JdbcWritableBridge.readString(5, __dbResults);
    this.site_name = JdbcWritableBridge.readString(6, __dbResults);
    this.site_floor = JdbcWritableBridge.readString(7, __dbResults);
    this.site_area = JdbcWritableBridge.readString(8, __dbResults);
    this.description = JdbcWritableBridge.readString(9, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(10, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(device_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_organ, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_sitetype, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_siteinout, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_roomtype, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(site_name, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(site_floor, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(site_area, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(description, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 10 + __off, 93, __dbStmt);
    return 10;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(device_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_organ, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_sitetype, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_siteinout, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_roomtype, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(site_name, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(site_floor, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(site_area, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(description, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 10 + __off, 93, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.device_name = null;
    } else {
    this.device_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.base_organ = null;
    } else {
    this.base_organ = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.base_sitetype = null;
    } else {
    this.base_sitetype = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.base_siteinout = null;
    } else {
    this.base_siteinout = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.base_roomtype = null;
    } else {
    this.base_roomtype = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.site_name = null;
    } else {
    this.site_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.site_floor = null;
    } else {
    this.site_floor = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.site_area = null;
    } else {
    this.site_area = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.description = null;
    } else {
    this.description = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.reg_date = null;
    } else {
    this.reg_date = new Timestamp(__dataIn.readLong());
    this.reg_date.setNanos(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_name);
    }
    if (null == this.base_organ) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_organ);
    }
    if (null == this.base_sitetype) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_sitetype);
    }
    if (null == this.base_siteinout) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_siteinout);
    }
    if (null == this.base_roomtype) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_roomtype);
    }
    if (null == this.site_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, site_name);
    }
    if (null == this.site_floor) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, site_floor);
    }
    if (null == this.site_area) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, site_area);
    }
    if (null == this.description) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, description);
    }
    if (null == this.reg_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.reg_date.getTime());
    __dataOut.writeInt(this.reg_date.getNanos());
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_name);
    }
    if (null == this.base_organ) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_organ);
    }
    if (null == this.base_sitetype) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_sitetype);
    }
    if (null == this.base_siteinout) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_siteinout);
    }
    if (null == this.base_roomtype) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_roomtype);
    }
    if (null == this.site_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, site_name);
    }
    if (null == this.site_floor) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, site_floor);
    }
    if (null == this.site_area) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, site_area);
    }
    if (null == this.description) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, description);
    }
    if (null == this.reg_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.reg_date.getTime());
    __dataOut.writeInt(this.reg_date.getNanos());
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(device_name==null?"null":device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_organ==null?"null":base_organ, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_sitetype==null?"null":base_sitetype, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_siteinout==null?"null":base_siteinout, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_roomtype==null?"null":base_roomtype, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(site_name==null?"null":site_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(site_floor==null?"null":site_floor, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(site_area==null?"null":site_area, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(description==null?"null":description, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(reg_date==null?"null":"" + reg_date, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(device_name==null?"null":device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_organ==null?"null":base_organ, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_sitetype==null?"null":base_sitetype, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_siteinout==null?"null":base_siteinout, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_roomtype==null?"null":base_roomtype, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(site_name==null?"null":site_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(site_floor==null?"null":site_floor, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(site_area==null?"null":site_area, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(description==null?"null":description, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(reg_date==null?"null":"" + reg_date, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_name = null; } else {
      this.device_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_organ = null; } else {
      this.base_organ = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_sitetype = null; } else {
      this.base_sitetype = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_siteinout = null; } else {
      this.base_siteinout = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_roomtype = null; } else {
      this.base_roomtype = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.site_name = null; } else {
      this.site_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.site_floor = null; } else {
      this.site_floor = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.site_area = null; } else {
      this.site_area = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.description = null; } else {
      this.description = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.reg_date = null; } else {
      this.reg_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_name = null; } else {
      this.device_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_organ = null; } else {
      this.base_organ = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_sitetype = null; } else {
      this.base_sitetype = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_siteinout = null; } else {
      this.base_siteinout = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_roomtype = null; } else {
      this.base_roomtype = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.site_name = null; } else {
      this.site_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.site_floor = null; } else {
      this.site_floor = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.site_area = null; } else {
      this.site_area = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.description = null; } else {
      this.description = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.reg_date = null; } else {
      this.reg_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    INSTALL_LOCATION o = (INSTALL_LOCATION) super.clone();
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
    return o;
  }

  public void clone0(INSTALL_LOCATION o) throws CloneNotSupportedException {
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("base_organ", this.base_organ);
    __sqoop$field_map.put("base_sitetype", this.base_sitetype);
    __sqoop$field_map.put("base_siteinout", this.base_siteinout);
    __sqoop$field_map.put("base_roomtype", this.base_roomtype);
    __sqoop$field_map.put("site_name", this.site_name);
    __sqoop$field_map.put("site_floor", this.site_floor);
    __sqoop$field_map.put("site_area", this.site_area);
    __sqoop$field_map.put("description", this.description);
    __sqoop$field_map.put("reg_date", this.reg_date);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("base_organ", this.base_organ);
    __sqoop$field_map.put("base_sitetype", this.base_sitetype);
    __sqoop$field_map.put("base_siteinout", this.base_siteinout);
    __sqoop$field_map.put("base_roomtype", this.base_roomtype);
    __sqoop$field_map.put("site_name", this.site_name);
    __sqoop$field_map.put("site_floor", this.site_floor);
    __sqoop$field_map.put("site_area", this.site_area);
    __sqoop$field_map.put("description", this.description);
    __sqoop$field_map.put("reg_date", this.reg_date);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
