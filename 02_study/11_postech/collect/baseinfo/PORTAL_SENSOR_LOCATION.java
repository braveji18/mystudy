// ORM class for table 'PORTAL_SENSOR_LOCATION'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:57:17 KST 2017
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

public class PORTAL_SENSOR_LOCATION extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("sensor_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sensor_name = (String)value;
      }
    });
    setters.put("reg_date", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        reg_date = (java.sql.Timestamp)value;
      }
    });
    setters.put("location", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        location = (String)value;
      }
    });
  }
  public PORTAL_SENSOR_LOCATION() {
    init0();
  }
  private String sensor_name;
  public String get_sensor_name() {
    return sensor_name;
  }
  public void set_sensor_name(String sensor_name) {
    this.sensor_name = sensor_name;
  }
  public PORTAL_SENSOR_LOCATION with_sensor_name(String sensor_name) {
    this.sensor_name = sensor_name;
    return this;
  }
  private java.sql.Timestamp reg_date;
  public java.sql.Timestamp get_reg_date() {
    return reg_date;
  }
  public void set_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
  }
  public PORTAL_SENSOR_LOCATION with_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
    return this;
  }
  private String location;
  public String get_location() {
    return location;
  }
  public void set_location(String location) {
    this.location = location;
  }
  public PORTAL_SENSOR_LOCATION with_location(String location) {
    this.location = location;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof PORTAL_SENSOR_LOCATION)) {
      return false;
    }
    PORTAL_SENSOR_LOCATION that = (PORTAL_SENSOR_LOCATION) o;
    boolean equal = true;
    equal = equal && (this.sensor_name == null ? that.sensor_name == null : this.sensor_name.equals(that.sensor_name));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    equal = equal && (this.location == null ? that.location == null : this.location.equals(that.location));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof PORTAL_SENSOR_LOCATION)) {
      return false;
    }
    PORTAL_SENSOR_LOCATION that = (PORTAL_SENSOR_LOCATION) o;
    boolean equal = true;
    equal = equal && (this.sensor_name == null ? that.sensor_name == null : this.sensor_name.equals(that.sensor_name));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    equal = equal && (this.location == null ? that.location == null : this.location.equals(that.location));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.sensor_name = JdbcWritableBridge.readString(1, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(2, __dbResults);
    this.location = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.sensor_name = JdbcWritableBridge.readString(1, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(2, __dbResults);
    this.location = JdbcWritableBridge.readString(3, __dbResults);
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
    JdbcWritableBridge.writeString(sensor_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 2 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(location, 3 + __off, 12, __dbStmt);
    return 3;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(sensor_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 2 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(location, 3 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.sensor_name = null;
    } else {
    this.sensor_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.reg_date = null;
    } else {
    this.reg_date = new Timestamp(__dataIn.readLong());
    this.reg_date.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.location = null;
    } else {
    this.location = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.sensor_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_name);
    }
    if (null == this.reg_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.reg_date.getTime());
    __dataOut.writeInt(this.reg_date.getNanos());
    }
    if (null == this.location) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, location);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.sensor_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_name);
    }
    if (null == this.reg_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.reg_date.getTime());
    __dataOut.writeInt(this.reg_date.getNanos());
    }
    if (null == this.location) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, location);
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
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_name==null?"null":sensor_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(reg_date==null?"null":"" + reg_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(location==null?"null":location, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_name==null?"null":sensor_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(reg_date==null?"null":"" + reg_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(location==null?"null":location, delimiters));
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
    if (__cur_str.equals("null")) { this.sensor_name = null; } else {
      this.sensor_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.reg_date = null; } else {
      this.reg_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.location = null; } else {
      this.location = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_name = null; } else {
      this.sensor_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.reg_date = null; } else {
      this.reg_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.location = null; } else {
      this.location = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    PORTAL_SENSOR_LOCATION o = (PORTAL_SENSOR_LOCATION) super.clone();
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
    return o;
  }

  public void clone0(PORTAL_SENSOR_LOCATION o) throws CloneNotSupportedException {
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("sensor_name", this.sensor_name);
    __sqoop$field_map.put("reg_date", this.reg_date);
    __sqoop$field_map.put("location", this.location);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("sensor_name", this.sensor_name);
    __sqoop$field_map.put("reg_date", this.reg_date);
    __sqoop$field_map.put("location", this.location);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
