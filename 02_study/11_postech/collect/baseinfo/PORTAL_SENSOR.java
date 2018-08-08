// ORM class for table 'PORTAL_SENSOR'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:57:03 KST 2017
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

public class PORTAL_SENSOR extends SqoopRecord  implements DBWritable, Writable {
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
    setters.put("manufacturer", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        manufacturer = (String)value;
      }
    });
    setters.put("model", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        model = (String)value;
      }
    });
    setters.put("sn", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sn = (String)value;
      }
    });
    setters.put("device_id", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        device_id = (String)value;
      }
    });
    setters.put("measure_item_code", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        measure_item_code = (String)value;
      }
    });
    setters.put("lab_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        lab_name = (String)value;
      }
    });
    setters.put("reg_date", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        reg_date = (java.sql.Timestamp)value;
      }
    });
  }
  public PORTAL_SENSOR() {
    init0();
  }
  private String sensor_name;
  public String get_sensor_name() {
    return sensor_name;
  }
  public void set_sensor_name(String sensor_name) {
    this.sensor_name = sensor_name;
  }
  public PORTAL_SENSOR with_sensor_name(String sensor_name) {
    this.sensor_name = sensor_name;
    return this;
  }
  private String manufacturer;
  public String get_manufacturer() {
    return manufacturer;
  }
  public void set_manufacturer(String manufacturer) {
    this.manufacturer = manufacturer;
  }
  public PORTAL_SENSOR with_manufacturer(String manufacturer) {
    this.manufacturer = manufacturer;
    return this;
  }
  private String model;
  public String get_model() {
    return model;
  }
  public void set_model(String model) {
    this.model = model;
  }
  public PORTAL_SENSOR with_model(String model) {
    this.model = model;
    return this;
  }
  private String sn;
  public String get_sn() {
    return sn;
  }
  public void set_sn(String sn) {
    this.sn = sn;
  }
  public PORTAL_SENSOR with_sn(String sn) {
    this.sn = sn;
    return this;
  }
  private String device_id;
  public String get_device_id() {
    return device_id;
  }
  public void set_device_id(String device_id) {
    this.device_id = device_id;
  }
  public PORTAL_SENSOR with_device_id(String device_id) {
    this.device_id = device_id;
    return this;
  }
  private String measure_item_code;
  public String get_measure_item_code() {
    return measure_item_code;
  }
  public void set_measure_item_code(String measure_item_code) {
    this.measure_item_code = measure_item_code;
  }
  public PORTAL_SENSOR with_measure_item_code(String measure_item_code) {
    this.measure_item_code = measure_item_code;
    return this;
  }
  private String lab_name;
  public String get_lab_name() {
    return lab_name;
  }
  public void set_lab_name(String lab_name) {
    this.lab_name = lab_name;
  }
  public PORTAL_SENSOR with_lab_name(String lab_name) {
    this.lab_name = lab_name;
    return this;
  }
  private java.sql.Timestamp reg_date;
  public java.sql.Timestamp get_reg_date() {
    return reg_date;
  }
  public void set_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
  }
  public PORTAL_SENSOR with_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof PORTAL_SENSOR)) {
      return false;
    }
    PORTAL_SENSOR that = (PORTAL_SENSOR) o;
    boolean equal = true;
    equal = equal && (this.sensor_name == null ? that.sensor_name == null : this.sensor_name.equals(that.sensor_name));
    equal = equal && (this.manufacturer == null ? that.manufacturer == null : this.manufacturer.equals(that.manufacturer));
    equal = equal && (this.model == null ? that.model == null : this.model.equals(that.model));
    equal = equal && (this.sn == null ? that.sn == null : this.sn.equals(that.sn));
    equal = equal && (this.device_id == null ? that.device_id == null : this.device_id.equals(that.device_id));
    equal = equal && (this.measure_item_code == null ? that.measure_item_code == null : this.measure_item_code.equals(that.measure_item_code));
    equal = equal && (this.lab_name == null ? that.lab_name == null : this.lab_name.equals(that.lab_name));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof PORTAL_SENSOR)) {
      return false;
    }
    PORTAL_SENSOR that = (PORTAL_SENSOR) o;
    boolean equal = true;
    equal = equal && (this.sensor_name == null ? that.sensor_name == null : this.sensor_name.equals(that.sensor_name));
    equal = equal && (this.manufacturer == null ? that.manufacturer == null : this.manufacturer.equals(that.manufacturer));
    equal = equal && (this.model == null ? that.model == null : this.model.equals(that.model));
    equal = equal && (this.sn == null ? that.sn == null : this.sn.equals(that.sn));
    equal = equal && (this.device_id == null ? that.device_id == null : this.device_id.equals(that.device_id));
    equal = equal && (this.measure_item_code == null ? that.measure_item_code == null : this.measure_item_code.equals(that.measure_item_code));
    equal = equal && (this.lab_name == null ? that.lab_name == null : this.lab_name.equals(that.lab_name));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.sensor_name = JdbcWritableBridge.readString(1, __dbResults);
    this.manufacturer = JdbcWritableBridge.readString(2, __dbResults);
    this.model = JdbcWritableBridge.readString(3, __dbResults);
    this.sn = JdbcWritableBridge.readString(4, __dbResults);
    this.device_id = JdbcWritableBridge.readString(5, __dbResults);
    this.measure_item_code = JdbcWritableBridge.readString(6, __dbResults);
    this.lab_name = JdbcWritableBridge.readString(7, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(8, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.sensor_name = JdbcWritableBridge.readString(1, __dbResults);
    this.manufacturer = JdbcWritableBridge.readString(2, __dbResults);
    this.model = JdbcWritableBridge.readString(3, __dbResults);
    this.sn = JdbcWritableBridge.readString(4, __dbResults);
    this.device_id = JdbcWritableBridge.readString(5, __dbResults);
    this.measure_item_code = JdbcWritableBridge.readString(6, __dbResults);
    this.lab_name = JdbcWritableBridge.readString(7, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(8, __dbResults);
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
    JdbcWritableBridge.writeString(manufacturer, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(model, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sn, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_id, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(measure_item_code, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(lab_name, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 8 + __off, 93, __dbStmt);
    return 8;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(sensor_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(manufacturer, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(model, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sn, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_id, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(measure_item_code, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(lab_name, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 8 + __off, 93, __dbStmt);
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
        this.manufacturer = null;
    } else {
    this.manufacturer = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.model = null;
    } else {
    this.model = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.sn = null;
    } else {
    this.sn = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.device_id = null;
    } else {
    this.device_id = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.measure_item_code = null;
    } else {
    this.measure_item_code = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.lab_name = null;
    } else {
    this.lab_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.reg_date = null;
    } else {
    this.reg_date = new Timestamp(__dataIn.readLong());
    this.reg_date.setNanos(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.sensor_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_name);
    }
    if (null == this.manufacturer) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, manufacturer);
    }
    if (null == this.model) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, model);
    }
    if (null == this.sn) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sn);
    }
    if (null == this.device_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_id);
    }
    if (null == this.measure_item_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, measure_item_code);
    }
    if (null == this.lab_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, lab_name);
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
    if (null == this.sensor_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_name);
    }
    if (null == this.manufacturer) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, manufacturer);
    }
    if (null == this.model) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, model);
    }
    if (null == this.sn) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sn);
    }
    if (null == this.device_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_id);
    }
    if (null == this.measure_item_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, measure_item_code);
    }
    if (null == this.lab_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, lab_name);
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
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_name==null?"null":sensor_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(manufacturer==null?"null":manufacturer, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(model==null?"null":model, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sn==null?"null":sn, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_id==null?"null":device_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(measure_item_code==null?"null":measure_item_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(lab_name==null?"null":lab_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(reg_date==null?"null":"" + reg_date, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_name==null?"null":sensor_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(manufacturer==null?"null":manufacturer, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(model==null?"null":model, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sn==null?"null":sn, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_id==null?"null":device_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(measure_item_code==null?"null":measure_item_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(lab_name==null?"null":lab_name, delimiters));
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
    if (__cur_str.equals("null")) { this.sensor_name = null; } else {
      this.sensor_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.manufacturer = null; } else {
      this.manufacturer = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.model = null; } else {
      this.model = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sn = null; } else {
      this.sn = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_id = null; } else {
      this.device_id = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.measure_item_code = null; } else {
      this.measure_item_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.lab_name = null; } else {
      this.lab_name = __cur_str;
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
    if (__cur_str.equals("null")) { this.sensor_name = null; } else {
      this.sensor_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.manufacturer = null; } else {
      this.manufacturer = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.model = null; } else {
      this.model = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sn = null; } else {
      this.sn = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_id = null; } else {
      this.device_id = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.measure_item_code = null; } else {
      this.measure_item_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.lab_name = null; } else {
      this.lab_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.reg_date = null; } else {
      this.reg_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    PORTAL_SENSOR o = (PORTAL_SENSOR) super.clone();
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
    return o;
  }

  public void clone0(PORTAL_SENSOR o) throws CloneNotSupportedException {
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("sensor_name", this.sensor_name);
    __sqoop$field_map.put("manufacturer", this.manufacturer);
    __sqoop$field_map.put("model", this.model);
    __sqoop$field_map.put("sn", this.sn);
    __sqoop$field_map.put("device_id", this.device_id);
    __sqoop$field_map.put("measure_item_code", this.measure_item_code);
    __sqoop$field_map.put("lab_name", this.lab_name);
    __sqoop$field_map.put("reg_date", this.reg_date);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("sensor_name", this.sensor_name);
    __sqoop$field_map.put("manufacturer", this.manufacturer);
    __sqoop$field_map.put("model", this.model);
    __sqoop$field_map.put("sn", this.sn);
    __sqoop$field_map.put("device_id", this.device_id);
    __sqoop$field_map.put("measure_item_code", this.measure_item_code);
    __sqoop$field_map.put("lab_name", this.lab_name);
    __sqoop$field_map.put("reg_date", this.reg_date);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
