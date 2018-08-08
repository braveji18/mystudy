// ORM class for table 'SENSOR_TYPE'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:57:45 KST 2017
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

public class SENSOR_TYPE extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("sensor_type", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sensor_type = (String)value;
      }
    });
    setters.put("base_measure_machine", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        base_measure_machine = (String)value;
      }
    });
    setters.put("measure_item_code", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        measure_item_code = (String)value;
      }
    });
    setters.put("item_order", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        item_order = (Integer)value;
      }
    });
    setters.put("item_code_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        item_code_name = (String)value;
      }
    });
    setters.put("item_code_unit", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        item_code_unit = (String)value;
      }
    });
  }
  public SENSOR_TYPE() {
    init0();
  }
  private String sensor_type;
  public String get_sensor_type() {
    return sensor_type;
  }
  public void set_sensor_type(String sensor_type) {
    this.sensor_type = sensor_type;
  }
  public SENSOR_TYPE with_sensor_type(String sensor_type) {
    this.sensor_type = sensor_type;
    return this;
  }
  private String base_measure_machine;
  public String get_base_measure_machine() {
    return base_measure_machine;
  }
  public void set_base_measure_machine(String base_measure_machine) {
    this.base_measure_machine = base_measure_machine;
  }
  public SENSOR_TYPE with_base_measure_machine(String base_measure_machine) {
    this.base_measure_machine = base_measure_machine;
    return this;
  }
  private String measure_item_code;
  public String get_measure_item_code() {
    return measure_item_code;
  }
  public void set_measure_item_code(String measure_item_code) {
    this.measure_item_code = measure_item_code;
  }
  public SENSOR_TYPE with_measure_item_code(String measure_item_code) {
    this.measure_item_code = measure_item_code;
    return this;
  }
  private Integer item_order;
  public Integer get_item_order() {
    return item_order;
  }
  public void set_item_order(Integer item_order) {
    this.item_order = item_order;
  }
  public SENSOR_TYPE with_item_order(Integer item_order) {
    this.item_order = item_order;
    return this;
  }
  private String item_code_name;
  public String get_item_code_name() {
    return item_code_name;
  }
  public void set_item_code_name(String item_code_name) {
    this.item_code_name = item_code_name;
  }
  public SENSOR_TYPE with_item_code_name(String item_code_name) {
    this.item_code_name = item_code_name;
    return this;
  }
  private String item_code_unit;
  public String get_item_code_unit() {
    return item_code_unit;
  }
  public void set_item_code_unit(String item_code_unit) {
    this.item_code_unit = item_code_unit;
  }
  public SENSOR_TYPE with_item_code_unit(String item_code_unit) {
    this.item_code_unit = item_code_unit;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof SENSOR_TYPE)) {
      return false;
    }
    SENSOR_TYPE that = (SENSOR_TYPE) o;
    boolean equal = true;
    equal = equal && (this.sensor_type == null ? that.sensor_type == null : this.sensor_type.equals(that.sensor_type));
    equal = equal && (this.base_measure_machine == null ? that.base_measure_machine == null : this.base_measure_machine.equals(that.base_measure_machine));
    equal = equal && (this.measure_item_code == null ? that.measure_item_code == null : this.measure_item_code.equals(that.measure_item_code));
    equal = equal && (this.item_order == null ? that.item_order == null : this.item_order.equals(that.item_order));
    equal = equal && (this.item_code_name == null ? that.item_code_name == null : this.item_code_name.equals(that.item_code_name));
    equal = equal && (this.item_code_unit == null ? that.item_code_unit == null : this.item_code_unit.equals(that.item_code_unit));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof SENSOR_TYPE)) {
      return false;
    }
    SENSOR_TYPE that = (SENSOR_TYPE) o;
    boolean equal = true;
    equal = equal && (this.sensor_type == null ? that.sensor_type == null : this.sensor_type.equals(that.sensor_type));
    equal = equal && (this.base_measure_machine == null ? that.base_measure_machine == null : this.base_measure_machine.equals(that.base_measure_machine));
    equal = equal && (this.measure_item_code == null ? that.measure_item_code == null : this.measure_item_code.equals(that.measure_item_code));
    equal = equal && (this.item_order == null ? that.item_order == null : this.item_order.equals(that.item_order));
    equal = equal && (this.item_code_name == null ? that.item_code_name == null : this.item_code_name.equals(that.item_code_name));
    equal = equal && (this.item_code_unit == null ? that.item_code_unit == null : this.item_code_unit.equals(that.item_code_unit));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.sensor_type = JdbcWritableBridge.readString(1, __dbResults);
    this.base_measure_machine = JdbcWritableBridge.readString(2, __dbResults);
    this.measure_item_code = JdbcWritableBridge.readString(3, __dbResults);
    this.item_order = JdbcWritableBridge.readInteger(4, __dbResults);
    this.item_code_name = JdbcWritableBridge.readString(5, __dbResults);
    this.item_code_unit = JdbcWritableBridge.readString(6, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.sensor_type = JdbcWritableBridge.readString(1, __dbResults);
    this.base_measure_machine = JdbcWritableBridge.readString(2, __dbResults);
    this.measure_item_code = JdbcWritableBridge.readString(3, __dbResults);
    this.item_order = JdbcWritableBridge.readInteger(4, __dbResults);
    this.item_code_name = JdbcWritableBridge.readString(5, __dbResults);
    this.item_code_unit = JdbcWritableBridge.readString(6, __dbResults);
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
    JdbcWritableBridge.writeString(sensor_type, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_measure_machine, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(measure_item_code, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(item_order, 4 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(item_code_name, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(item_code_unit, 6 + __off, 12, __dbStmt);
    return 6;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(sensor_type, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_measure_machine, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(measure_item_code, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(item_order, 4 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(item_code_name, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(item_code_unit, 6 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.sensor_type = null;
    } else {
    this.sensor_type = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.base_measure_machine = null;
    } else {
    this.base_measure_machine = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.measure_item_code = null;
    } else {
    this.measure_item_code = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.item_order = null;
    } else {
    this.item_order = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.item_code_name = null;
    } else {
    this.item_code_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.item_code_unit = null;
    } else {
    this.item_code_unit = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.sensor_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_type);
    }
    if (null == this.base_measure_machine) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_measure_machine);
    }
    if (null == this.measure_item_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, measure_item_code);
    }
    if (null == this.item_order) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.item_order);
    }
    if (null == this.item_code_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, item_code_name);
    }
    if (null == this.item_code_unit) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, item_code_unit);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.sensor_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_type);
    }
    if (null == this.base_measure_machine) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_measure_machine);
    }
    if (null == this.measure_item_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, measure_item_code);
    }
    if (null == this.item_order) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.item_order);
    }
    if (null == this.item_code_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, item_code_name);
    }
    if (null == this.item_code_unit) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, item_code_unit);
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
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_type==null?"null":sensor_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_measure_machine==null?"null":base_measure_machine, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(measure_item_code==null?"null":measure_item_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(item_order==null?"null":"" + item_order, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(item_code_name==null?"null":item_code_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(item_code_unit==null?"null":item_code_unit, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_type==null?"null":sensor_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_measure_machine==null?"null":base_measure_machine, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(measure_item_code==null?"null":measure_item_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(item_order==null?"null":"" + item_order, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(item_code_name==null?"null":item_code_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(item_code_unit==null?"null":item_code_unit, delimiters));
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
    if (__cur_str.equals("null")) { this.sensor_type = null; } else {
      this.sensor_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_measure_machine = null; } else {
      this.base_measure_machine = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.measure_item_code = null; } else {
      this.measure_item_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.item_order = null; } else {
      this.item_order = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.item_code_name = null; } else {
      this.item_code_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.item_code_unit = null; } else {
      this.item_code_unit = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_type = null; } else {
      this.sensor_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_measure_machine = null; } else {
      this.base_measure_machine = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.measure_item_code = null; } else {
      this.measure_item_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.item_order = null; } else {
      this.item_order = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.item_code_name = null; } else {
      this.item_code_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.item_code_unit = null; } else {
      this.item_code_unit = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    SENSOR_TYPE o = (SENSOR_TYPE) super.clone();
    return o;
  }

  public void clone0(SENSOR_TYPE o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("sensor_type", this.sensor_type);
    __sqoop$field_map.put("base_measure_machine", this.base_measure_machine);
    __sqoop$field_map.put("measure_item_code", this.measure_item_code);
    __sqoop$field_map.put("item_order", this.item_order);
    __sqoop$field_map.put("item_code_name", this.item_code_name);
    __sqoop$field_map.put("item_code_unit", this.item_code_unit);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("sensor_type", this.sensor_type);
    __sqoop$field_map.put("base_measure_machine", this.base_measure_machine);
    __sqoop$field_map.put("measure_item_code", this.measure_item_code);
    __sqoop$field_map.put("item_order", this.item_order);
    __sqoop$field_map.put("item_code_name", this.item_code_name);
    __sqoop$field_map.put("item_code_unit", this.item_code_unit);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
