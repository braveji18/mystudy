// ORM class for table 'PANEL_HIERARCHY'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:56:49 KST 2017
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

public class PANEL_HIERARCHY extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("panel", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        panel = (String)value;
      }
    });
    setters.put("parent_panel", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        parent_panel = (String)value;
      }
    });
    setters.put("child_panel", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        child_panel = (String)value;
      }
    });
  }
  public PANEL_HIERARCHY() {
    init0();
  }
  private String panel;
  public String get_panel() {
    return panel;
  }
  public void set_panel(String panel) {
    this.panel = panel;
  }
  public PANEL_HIERARCHY with_panel(String panel) {
    this.panel = panel;
    return this;
  }
  private String parent_panel;
  public String get_parent_panel() {
    return parent_panel;
  }
  public void set_parent_panel(String parent_panel) {
    this.parent_panel = parent_panel;
  }
  public PANEL_HIERARCHY with_parent_panel(String parent_panel) {
    this.parent_panel = parent_panel;
    return this;
  }
  private String child_panel;
  public String get_child_panel() {
    return child_panel;
  }
  public void set_child_panel(String child_panel) {
    this.child_panel = child_panel;
  }
  public PANEL_HIERARCHY with_child_panel(String child_panel) {
    this.child_panel = child_panel;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof PANEL_HIERARCHY)) {
      return false;
    }
    PANEL_HIERARCHY that = (PANEL_HIERARCHY) o;
    boolean equal = true;
    equal = equal && (this.panel == null ? that.panel == null : this.panel.equals(that.panel));
    equal = equal && (this.parent_panel == null ? that.parent_panel == null : this.parent_panel.equals(that.parent_panel));
    equal = equal && (this.child_panel == null ? that.child_panel == null : this.child_panel.equals(that.child_panel));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof PANEL_HIERARCHY)) {
      return false;
    }
    PANEL_HIERARCHY that = (PANEL_HIERARCHY) o;
    boolean equal = true;
    equal = equal && (this.panel == null ? that.panel == null : this.panel.equals(that.panel));
    equal = equal && (this.parent_panel == null ? that.parent_panel == null : this.parent_panel.equals(that.parent_panel));
    equal = equal && (this.child_panel == null ? that.child_panel == null : this.child_panel.equals(that.child_panel));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.panel = JdbcWritableBridge.readString(1, __dbResults);
    this.parent_panel = JdbcWritableBridge.readString(2, __dbResults);
    this.child_panel = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.panel = JdbcWritableBridge.readString(1, __dbResults);
    this.parent_panel = JdbcWritableBridge.readString(2, __dbResults);
    this.child_panel = JdbcWritableBridge.readString(3, __dbResults);
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
    JdbcWritableBridge.writeString(panel, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(parent_panel, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(child_panel, 3 + __off, 12, __dbStmt);
    return 3;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(panel, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(parent_panel, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(child_panel, 3 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.panel = null;
    } else {
    this.panel = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.parent_panel = null;
    } else {
    this.parent_panel = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.child_panel = null;
    } else {
    this.child_panel = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.panel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, panel);
    }
    if (null == this.parent_panel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, parent_panel);
    }
    if (null == this.child_panel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, child_panel);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.panel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, panel);
    }
    if (null == this.parent_panel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, parent_panel);
    }
    if (null == this.child_panel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, child_panel);
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
    __sb.append(FieldFormatter.escapeAndEnclose(panel==null?"null":panel, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(parent_panel==null?"null":parent_panel, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(child_panel==null?"null":child_panel, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(panel==null?"null":panel, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(parent_panel==null?"null":parent_panel, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(child_panel==null?"null":child_panel, delimiters));
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
    if (__cur_str.equals("null")) { this.panel = null; } else {
      this.panel = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.parent_panel = null; } else {
      this.parent_panel = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.child_panel = null; } else {
      this.child_panel = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.panel = null; } else {
      this.panel = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.parent_panel = null; } else {
      this.parent_panel = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.child_panel = null; } else {
      this.child_panel = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    PANEL_HIERARCHY o = (PANEL_HIERARCHY) super.clone();
    return o;
  }

  public void clone0(PANEL_HIERARCHY o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("panel", this.panel);
    __sqoop$field_map.put("parent_panel", this.parent_panel);
    __sqoop$field_map.put("child_panel", this.child_panel);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("panel", this.panel);
    __sqoop$field_map.put("parent_panel", this.parent_panel);
    __sqoop$field_map.put("child_panel", this.child_panel);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
