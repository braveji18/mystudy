// ORM class for table 'DEVICE_HIERARCHY'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:55:56 KST 2017
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

public class DEVICE_HIERARCHY extends SqoopRecord  implements DBWritable, Writable {
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
    setters.put("parent_device_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        parent_device_name = (String)value;
      }
    });
    setters.put("child_device_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        child_device_name = (String)value;
      }
    });
  }
  public DEVICE_HIERARCHY() {
    init0();
  }
  private String device_name;
  public String get_device_name() {
    return device_name;
  }
  public void set_device_name(String device_name) {
    this.device_name = device_name;
  }
  public DEVICE_HIERARCHY with_device_name(String device_name) {
    this.device_name = device_name;
    return this;
  }
  private String parent_device_name;
  public String get_parent_device_name() {
    return parent_device_name;
  }
  public void set_parent_device_name(String parent_device_name) {
    this.parent_device_name = parent_device_name;
  }
  public DEVICE_HIERARCHY with_parent_device_name(String parent_device_name) {
    this.parent_device_name = parent_device_name;
    return this;
  }
  private String child_device_name;
  public String get_child_device_name() {
    return child_device_name;
  }
  public void set_child_device_name(String child_device_name) {
    this.child_device_name = child_device_name;
  }
  public DEVICE_HIERARCHY with_child_device_name(String child_device_name) {
    this.child_device_name = child_device_name;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof DEVICE_HIERARCHY)) {
      return false;
    }
    DEVICE_HIERARCHY that = (DEVICE_HIERARCHY) o;
    boolean equal = true;
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.parent_device_name == null ? that.parent_device_name == null : this.parent_device_name.equals(that.parent_device_name));
    equal = equal && (this.child_device_name == null ? that.child_device_name == null : this.child_device_name.equals(that.child_device_name));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof DEVICE_HIERARCHY)) {
      return false;
    }
    DEVICE_HIERARCHY that = (DEVICE_HIERARCHY) o;
    boolean equal = true;
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.parent_device_name == null ? that.parent_device_name == null : this.parent_device_name.equals(that.parent_device_name));
    equal = equal && (this.child_device_name == null ? that.child_device_name == null : this.child_device_name.equals(that.child_device_name));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.device_name = JdbcWritableBridge.readString(1, __dbResults);
    this.parent_device_name = JdbcWritableBridge.readString(2, __dbResults);
    this.child_device_name = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.device_name = JdbcWritableBridge.readString(1, __dbResults);
    this.parent_device_name = JdbcWritableBridge.readString(2, __dbResults);
    this.child_device_name = JdbcWritableBridge.readString(3, __dbResults);
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
    JdbcWritableBridge.writeString(parent_device_name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(child_device_name, 3 + __off, 12, __dbStmt);
    return 3;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(device_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(parent_device_name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(child_device_name, 3 + __off, 12, __dbStmt);
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
        this.parent_device_name = null;
    } else {
    this.parent_device_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.child_device_name = null;
    } else {
    this.child_device_name = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_name);
    }
    if (null == this.parent_device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, parent_device_name);
    }
    if (null == this.child_device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, child_device_name);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_name);
    }
    if (null == this.parent_device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, parent_device_name);
    }
    if (null == this.child_device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, child_device_name);
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
    __sb.append(FieldFormatter.escapeAndEnclose(parent_device_name==null?"null":parent_device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(child_device_name==null?"null":child_device_name, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(device_name==null?"null":device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(parent_device_name==null?"null":parent_device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(child_device_name==null?"null":child_device_name, delimiters));
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
    if (__cur_str.equals("null")) { this.parent_device_name = null; } else {
      this.parent_device_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.child_device_name = null; } else {
      this.child_device_name = __cur_str;
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
    if (__cur_str.equals("null")) { this.parent_device_name = null; } else {
      this.parent_device_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.child_device_name = null; } else {
      this.child_device_name = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    DEVICE_HIERARCHY o = (DEVICE_HIERARCHY) super.clone();
    return o;
  }

  public void clone0(DEVICE_HIERARCHY o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("parent_device_name", this.parent_device_name);
    __sqoop$field_map.put("child_device_name", this.child_device_name);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("parent_device_name", this.parent_device_name);
    __sqoop$field_map.put("child_device_name", this.child_device_name);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
