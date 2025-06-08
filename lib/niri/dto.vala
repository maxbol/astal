namespace AstalNiri {
  public class Action : Object, Json.Serializable {
    string actionName;
    public Action(string name) { actionName = name; }
    public Json.Node to_json() {
      var inner_node = Json.gobject_serialize(this);
      var outer_node = new Json.Node(Json.NodeType.OBJECT);
      var action = new Json.Object();
      action.set_member(this.actionName, inner_node);
      var container = new Json.Object();
      container.set_object_member("Action", action);
      outer_node.set_object(container);
      return outer_node;
    }
    public string to_string() {
      var json_node = this.to_json();
      return Json.to_string(json_node, false);
    }
  }

  namespace Actions {
    public static void init() {
      ActionFields.register_serialize_funcs();
    }

    public static bool quit(bool skip_confirmation) {
      return msg.send_act_json(new Quit(skip_confirmation));
    }

    public static bool power_off_monitors() {
      return msg.send_act("PowerOffMonitors");
    }

    public static bool power_on_monitors() {
      return msg.send_act("PowerOnMonitors");
    }

    public static bool spawn(string[] command) {
      return msg.send_act_json(new Spawn(command));
    }

    public static bool do_screen_transition(uint16? delay_ms) {
      return msg.send_act_json(new DoScreenTransition(delay_ms));
    }

    public static bool screenshot(bool show_pointer) {
      return msg.send_act_json(new Screenshot(show_pointer));
    }

    public static bool screenshot_screen(bool write_to_disk, bool show_pointer) {
      return msg.send_act_json(new ScreenshotScreen(write_to_disk, show_pointer));
    }
    
    public static bool screenshot_window(uint64? id, bool write_to_disk) {
      return msg.send_act_json(new ScreenshotWindow(id, write_to_disk));
    }

    public static bool toggle_keyboard_shortcuts_inhibit() {
      return msg.send_act("ToggleKeyboardShortcutsInhibit");
    }

    public static bool close_window(uint64? id) {
      return msg.send_act_json(new CloseWindow(id));
    }

    public static bool fullscreen_window(uint64? id) {
      return msg.send_act_json(new FullscreenWindow(id));
    }

    public static bool toggle_windowed_fullscreen(uint64? id) {
      return msg.send_act_json(new ToggleWindowedFullscreen(id));
    }

    public static bool focus_window(uint64 id) {
      return msg.send_act_json(new FocusWindow(id));
    }

    public static bool focus_window_in_column(uint8 index) {
      return msg.send_act_json(new FocusWindowInColumn(index));
    }

    public static bool focus_window_previous() {
      return msg.send_act("FocusWindowPrevious");
    }

    public static bool focus_column_left() {
      return msg.send_act("FocusColumnLeft");
    }

    public static bool focus_column_right() {
      return msg.send_act("FocusColumnRight");
    }

    public static bool focus_column_first() {
      return msg.send_act("FocusColumnFirst");
    }

    public static bool focus_column_last() {
      return msg.send_act("FocusColumnLast");
    }

    public static bool focus_column_right_or_first() {
      return msg.send_act("FocusColumnRightOrFirst");
    }

    public static bool focus_column_left_or_last() {
      return msg.send_act("FocusColumnLeftOrLast");
    }

    public static bool focus_column(size_t index) {
      return msg.send_act_json(new FocusColumn(index));
    }

    public static bool focus_window_or_monitor_up() {
      return msg.send_act("FocusWindowOrMonitorUp");
    }

    public static bool focus_window_or_monitor_down() {
      return msg.send_act("FocusWindowOrMonitorDown");
    }

    public static bool focus_column_or_monitor_left() {
      return msg.send_act("FocusColumnOrMonitorLeft");
    }

    public static bool focus_column_or_monitor_right() {
      return msg.send_act("FocusColumnOrMonitorRight");
    }

    public static bool focus_window_down() {
      return msg.send_act("FocusWindowDown");
    }

    public static bool focus_window_up() {
      return msg.send_act("FocusWindowUp");
    }

    public static bool focus_window_down_or_column_left() {
      return msg.send_act("FocusWindowDownOrColumnLeft");
    }

    public static bool focus_window_down_or_column_right() {
      return msg.send_act("FocusWindowDownOrColumnRight");
    }

    public static bool focus_window_up_or_column_left() {
      return msg.send_act("FocusWindowUpOrColumnLeft");
    }

    public static bool focus_window_up_or_column_right() {
      return msg.send_act("FocusWindowUpOrColumnRight");
    }

    public static bool focus_window_top() {
      return msg.send_act("FocusWindowTop");
    }

    public static bool focus_window_bottom() {
      return msg.send_act("FocusWindowBottom");
    }

    public static bool focus_window_down_or_top() {
      return msg.send_act("FocusWindowDownOrTop");
    }

    public static bool focus_window_up_or_bottom() {
      return msg.send_act("FocusWindowUpOrBottom");
    }

    public static bool move_column_left() {
      return msg.send_act("MoveColumnLeft");
    }

    public static bool move_column_right() {
      return msg.send_act("MoveColumnRight");
    }

    public static bool move_column_to_first() {
      return msg.send_act("MoveColumnToFirst");
    }

    public static bool move_column_to_last() {
      return msg.send_act("MoveColumnToLast");
    }

    public static bool move_column_left_or_to_monitor_left() {
      return msg.send_act("MoveColumnLeftOrToMonitorLeft");
    }

    public static bool move_column_right_or_to_monitor_right() {
      return msg.send_act("MoveColumnLeftOrToMonitorRight");
    }

    public static bool move_column_to_index(size_t index) {
      return msg.send_act_json(new MoveColumnToIndex(index));
    }

    public static bool move_window_down() {
      return msg.send_act("MoveWindowDown");
    }

    public static bool move_window_up() {
      return msg.send_act("MoveWindowUp");
    }

    public static bool move_window_down_or_to_workspace_down() {
      return msg.send_act("MoveWindowDownOrToWorkspaceDown");
    }

    public static bool move_window_up_or_to_workspace_up() {
      return msg.send_act("MoveWindowUpOrToWorkspaceUp");
    }

    public static bool consume_or_expel_window_left(uint64? id) {
      return msg.send_act_json(new ConsumeOrExpelWindowLeft(id));
    }

    public static bool consume_or_expel_window_right(uint64? id) {
      return msg.send_act_json(new ConsumeOrExpelWindowRight(id));
    }

    public static bool consume_window_into_column() {
      return msg.send_act("ConsumeWindowIntoColumn");
    }

    public static bool expel_window_from_column() {
      return msg.send_act("ExpelWindowFromColumn");
    }

    public static bool swap_window_right() {
      return msg.send_act("SwapWindowRight");
    }

    public static bool swap_window_left() {
      return msg.send_act("SwapWindowLeft");
    }

    public static bool toggle_column_tabbed_display() {
      return msg.send_act("ToggleColumnTabbedDisplay");
    }

    public static bool set_column_display(ActionFields.ColumnDisplayTag display) {
      return msg.send_act_json(new SetColumnDisplay(display));
    }

    public static bool center_column() {
      return msg.send_act("CenterColumn");
    }

    public static bool center_window(uint64? id) {
      return msg.send_act_json(new CenterWindow(id));
    }

    public static bool center_visible_columns() {
      return msg.send_act("CenterVisibleColumns");
    }

    public static bool focus_workspace_down() {
      return msg.send_act("FocusWorkspaceDown");
    }

    public static bool focus_workspace_up() {
      return msg.send_act("FocusWorkspaceUp");
    }

    public static bool focus_workspace(ActionFields.WorkspaceReferenceArg reference) {
      return msg.send_act_json(new FocusWorkspace(reference));
    }

    public static bool focus_workspace_previous() {
      return msg.send_act("FocusWorkspacePrevious");
    }

    public static bool move_window_to_workspace_down() {
      return msg.send_act("MoveWindowToWorkspaceDown");
    }

    public static bool move_window_to_workspace_up() {
      return msg.send_act("MoveWindowToWorkspaceUp");
    }

    public static bool move_window_to_workspace(uint64? window_id, ActionFields.WorkspaceReferenceArg reference, bool focus) {
      return msg.send_act_json(new MoveWindowToWorkspace(window_id, reference, focus));
    }

    public static bool move_column_to_workspace_down(bool focus) {
      return msg.send_act_json(new MoveColumnToWorkspaceDown(focus));
    }

    public static bool move_column_to_workspace_up(bool focus) {
      return msg.send_act_json(new MoveColumnToWorkspaceUp(focus));
    }

    public static bool move_column_to_workspace(ActionFields.WorkspaceReferenceArg reference, bool focus) {
      return msg.send_act_json(new MoveColumnToWorkspace(reference, focus));
    }

    public static bool move_workspace_down() {
      return msg.send_act("MoveWorkspaceDown");
    }
    
    public static bool move_workspace_up() {
      return msg.send_act("MoveWorkspaceUp");
    }

    public static bool move_workspace_to_index(size_t index, ActionFields.WorkspaceReferenceArg? reference) {
      return msg.send_act_json(new MoveWorkspaceToIndex(index, reference));
    }

    public static bool set_workspace_name(string name, ActionFields.WorkspaceReferenceArg? workspace) {
      return msg.send_act_json(new SetWorkspaceName(name, workspace));
    }

    public static bool unset_workspace_name(ActionFields.WorkspaceReferenceArg? workspace) {
      return msg.send_act_json(new UnsetWorkspaceName(workspace));
    }

    public static bool focus_monitor_left() {
      return msg.send_act("FocusMonitorLeft");
    }

    public static bool focus_monitor_right() {
      return msg.send_act("FocusMonitorRight");
    }

    public static bool focus_monitor_down() {
      return msg.send_act("FocusMonitorDown");
    }

    public static bool focus_monitor_up() {
      return msg.send_act("FocusMonitorUp");
    }

    public static bool focus_monitor_previous() {
      return msg.send_act("FocusMonitorPrevious");
    }

    public static bool focus_monitor_next() {
      return msg.send_act("FocusMonitorNext");
    }

    public static bool focus_monitor(string output) {
      return msg.send_act_json(new FocusMonitor(output));
    }

    public static bool move_window_to_monitor_left() {
      return msg.send_act("MoveWindowToMonitorLeft");
    }
    
    public static bool move_window_to_monitor_right() {
      return msg.send_act("MoveWindowToMonitorRight");
    }

    public static bool move_window_to_monitor_down() {
      return msg.send_act("MoveWindowToMonitorDown");
    }

    public static bool move_window_to_monitor_up() {
      return msg.send_act("MoveWindowToMonitorUp");
    }

    public static bool move_window_to_monitor(uint64? id, string output) {
      return msg.send_act_json(new MoveWindowToMonitor(id, output));
    }

    public static bool move_column_to_monitor_left() {
      return msg.send_act("MoveColumnToMonitorLeft");
    }

    public static bool move_column_to_monitor_right() {
      return msg.send_act("MoveColumnToMonitorRight");
    }

    public static bool move_column_to_monitor_down() {
      return msg.send_act("MoveColumnToMonitorDown");
    }

    public static bool move_column_to_monitor_up() {
      return msg.send_act("MoveColumnToMonitorUp");
    }

    public static bool move_column_to_monitor_previous() {
      return msg.send_act("MoveColumnToMonitorPrevious");
    }

    public static bool move_column_to_monitor_next() {
      return msg.send_act("MoveColumnToMonitorNext");
    }

    public static bool move_column_to_monitor(string output) {
      return msg.send_act_json(new MoveColumnToMonitor(output));
    }

    public static bool set_window_width(uint64? id, ActionFields.SizeChange change) {
      return msg.send_act_json(new SetWindowWidth(id, change));
    }

    public static bool set_window_height(uint64? id, ActionFields.SizeChange change) {
      return msg.send_act_json(new SetWindowHeight(id, change));
    }

    public static bool reset_window_height(uint64? id) {
      return msg.send_act_json(new ResetWindowHeight(id));
    }

    public static bool switch_preset_column_width() {
      return msg.send_act("SwitchPresetColumnWidth");
    }

    public static bool switch_preset_window_width(uint64? id) {
      return msg.send_act_json(new SwitchPresetWindowWidth(id));
    }

    public static bool switch_preset_window_height(uint64? id) {
      return msg.send_act_json(new SwitchPresetWindowHeight(id));
    }

    public static bool maximize_column() {
      return msg.send_act("MaximizeColumn");
    }

    public static bool set_column_width(ActionFields.SizeChange change) {
      return msg.send_act_json(new SetColumnWidth(change));
    }

    public static bool expand_column_to_available_width() {
      return msg.send_act("ExpandColumnToAvailableWidth");
    }

    public static bool switch_layout(ActionFields.LayoutSwitchTarget layout) {
      return msg.send_act_json(new SwitchLayout(layout));
    }

    public class Quit : Action {
      public bool skip_confirmation {get; set;}
      public Quit(bool skip_confirmation) { base("Quit"); this.skip_confirmation = skip_confirmation; }
    }

    public class CenterWindow : Action {
      public uint64? id {get; set;}
      public CenterWindow(uint64? id) { base("CenterWindow"); this.id = id; }
    }

    public class FocusWorkspace : Action {
      public ActionFields.WorkspaceReferenceArg reference {get; set;}
      public FocusWorkspace(ActionFields.WorkspaceReferenceArg reference) { base("FocusWorkspace"); this.reference = reference; }
    }

    public class Spawn : Action {
      public string[] command {get; set;}
      public Spawn(string[] command) { base("Spawn"); this.command = command; }
    }

    public class DoScreenTransition : Action {
      public uint16? delay_ms {get; set;}
      public DoScreenTransition(uint16? delay_ms) { base("DoScreenTransition"); this.delay_ms = delay_ms; }
    }

    public class Screenshot : Action {
      public bool show_pointer {get; set;}
      public Screenshot(bool show_pointer) { base("Screenshot"); this.show_pointer = show_pointer; }
    }

    public class ScreenshotScreen : Action {
      public bool write_to_disk {get; set;}
      public bool show_pointer {get; set;}
      public ScreenshotScreen(bool write_to_disk, bool show_pointer) { base("ScreenshotScreen"); this.write_to_disk = write_to_disk; this.show_pointer = show_pointer; }
    }

    public class ScreenshotWindow : Action {
      public uint64? id {get; set;}
      public bool write_to_disk {get; set;}
      public ScreenshotWindow(uint64? id, bool write_to_disk) { base("ScreenshotWindow"); this.id = id; this.write_to_disk = write_to_disk; }
    }

    public class CloseWindow : Action {
      public uint64? id {get; set;}
      public CloseWindow(uint64? id) { base("CloseWindow"); this.id = id; }
    }

    public class FullscreenWindow : Action {
      public uint64? id {get; set;}
      public FullscreenWindow(uint64? id) { base("FullscreenWindow"); this.id = id; }
    }

    public class ToggleWindowedFullscreen : Action {
      public uint64? id {get; set;}
      public ToggleWindowedFullscreen(uint64? id) { base("ToggleWindowedFullscreen"); this.id = id; }
    }

    public class FocusWindow : Action {
      public uint64 id {get; set;}
      public FocusWindow(uint64 id) { base("FocusWindow"); this.id = id; }
    }

    public class FocusWindowInColumn : Action {
      public uint8 index {get; set;}
      public FocusWindowInColumn(uint8 index) { base("FocusWindowInColumn"); this.index = index; }
    }

    public class FocusColumn : Action {
      public size_t index {get; set;}
      public FocusColumn(size_t index) { base("FocusColumn"); this.index = index; }
    }

    public class MoveColumnToIndex : Action {
      public size_t index {get; set;}
      public MoveColumnToIndex(size_t index) { base("MoveColumnToIndex"); this.index = index; }
    }

    public class ConsumeOrExpelWindowLeft : Action {
      public uint64? id {get; set;}
      public ConsumeOrExpelWindowLeft(uint64? id) { base("ConsumeOrExpelWindowLeft"); this.id = id; }
    }

    public class ConsumeOrExpelWindowRight : Action {
      public uint64? id {get; set;}
      public ConsumeOrExpelWindowRight(uint64? id) { base("ConsumeOrExpelWindowRight"); this.id = id; }
    }
    
    public class SetColumnDisplay : Action {
      public ActionFields.ColumnDisplay display {get; set;}
      public SetColumnDisplay(ActionFields.ColumnDisplayTag display) { base("SetColumnDisplay"); this.display = ActionFields.ColumnDisplay(display); }
    }

    public class MoveWindowToWorkspace : Action {
      public uint64? window_id {get; set;}
      public ActionFields.WorkspaceReferenceArg reference {get; set;}
      public bool focus {get; set;}
      public MoveWindowToWorkspace(uint64? window_id, ActionFields.WorkspaceReferenceArg reference, bool focus) { base("MoveWindowToWorkspace"); this.window_id = window_id; this.reference = reference; this.focus = focus; }
    }

    public class MoveColumnToWorkspaceDown : Action {
      public bool focus {get; set;}
      public MoveColumnToWorkspaceDown(bool focus) { base("MoveColumnToWorkspaceDown"); this.focus = focus; }
    }

    public class MoveColumnToWorkspaceUp : Action {
      public bool focus {get; set;}
      public MoveColumnToWorkspaceUp(bool focus) { base("MoveColumnToWorkspaceUp"); this.focus = focus; }
    }

    public class MoveColumnToWorkspace : Action {
      public ActionFields.WorkspaceReferenceArg reference {get; set;}
      public bool focus {get; set;}
      public MoveColumnToWorkspace(ActionFields.WorkspaceReferenceArg reference, bool focus) { base("MoveColumnToWorkspace"); this.reference = reference; this.focus = focus; }
    }

    public class MoveWorkspaceToIndex : Action {
      public size_t index {get; set;}
      public ActionFields.WorkspaceReferenceArg? reference {get; set;}
      public MoveWorkspaceToIndex(size_t index, ActionFields.WorkspaceReferenceArg? reference) { base("MoveWorkspaceToIndex"); this.index = index; this.reference = reference; }
    }

    public class SetWorkspaceName : Action {
      public string name {get; set;}
      public ActionFields.WorkspaceReferenceArg? workspace {get; set;}
      public SetWorkspaceName(string name, ActionFields.WorkspaceReferenceArg? workspace) { base("SetWorkspaceName"); this.name = name; this.workspace; }
    }

    public class UnsetWorkspaceName : Action {
      public ActionFields.WorkspaceReferenceArg? workspace {get; set;}
      public UnsetWorkspaceName(ActionFields.WorkspaceReferenceArg? workspace) { base("UnsetWorkspaceName"); this.workspace = workspace; }
    }

    public class FocusMonitor : Action {
      public string output {get; set;}
      public FocusMonitor(string output) { base("FocusMonitor"); this.output = output; }
    }

    public class MoveWindowToMonitor : Action {
      public uint64? id {get; set;}
      public string output {get; set;}
      public MoveWindowToMonitor(uint64? id, string output) { base("MoveWindowToMonitor"); this.id = id; this.output = output; }
    }

    public class MoveColumnToMonitor : Action {
      public string output {get; set;}
      public MoveColumnToMonitor(string output) { base("MoveColumnToMonitor"); this.output = output;}
    }

    public class SetWindowWidth : Action {
      public uint64? id {get; set;}
      public ActionFields.SizeChange change {get; set;}
      public SetWindowWidth(uint64? id, ActionFields.SizeChange change) { base("SetWindowWidth"); this.id = id; this.change = change; }
    }

    public class SetWindowHeight : Action {
      public uint64? id {get; set;}
      public ActionFields.SizeChange change {get; set;}
      public SetWindowHeight(uint64? id, ActionFields.SizeChange change) { base("SetWindowHeight"); this.id = id; this.change = change; }
    }

    public class ResetWindowHeight : Action {
      public uint64? id {get; set;}
      public ResetWindowHeight(uint64? id) { base("ResetWindowHeight"); this.id = id; }
    }

    public class SwitchPresetWindowWidth : Action {
      public uint64? id {get; set;}
      public SwitchPresetWindowWidth(uint64? id) { base("SwitchPresetWindowWidth"); this.id = id; }
    }

    public class SwitchPresetWindowHeight : Action {
      public uint64? id {get; set;}
      public SwitchPresetWindowHeight(uint64? id) { base("SwitchPresetWindowHeight"); this.id = id; }
    }

    public class SetColumnWidth : Action {
      public ActionFields.SizeChange change {get; set;}
      public SetColumnWidth(ActionFields.SizeChange change) { base("SetColumnWidth"); this.change = change; }
    }

    public class SwitchLayout : Action {
      public ActionFields.LayoutSwitchTarget layout {get; set;}
      public SwitchLayout(ActionFields.LayoutSwitchTarget layout) { base("SwitchLayout"); this.layout = layout; }
    }
  }

  namespace ActionFields {
    public static bool registered_serialize_funcs = false;

    public static void register_serialize_funcs() {
      if (!registered_serialize_funcs) {
        Json.boxed_register_serialize_func(typeof(WorkspaceReferenceArg), Json.NodeType.OBJECT, WorkspaceReferenceArg.serialize_json);
        Json.boxed_register_serialize_func(typeof(ColumnDisplay), Json.NodeType.VALUE, ColumnDisplay.serialize_json);
        Json.boxed_register_serialize_func(typeof(SizeChange), Json.NodeType.VALUE, SizeChange.serialize_json);
        Json.boxed_register_serialize_func(typeof(LayoutSwitchTarget), Json.NodeType.VALUE, LayoutSwitchTarget.serialize_json);
        registered_serialize_funcs = true;
      }
    }

    public enum WorkspaceReferenceArgTag {
      Id,
      Index,
      Name,
    }

    public struct WorkspaceReferenceArg<T> {
      public WorkspaceReferenceArgTag tag {get; set;}
      public T value {get; set;}

      public WorkspaceReferenceArg(WorkspaceReferenceArgTag tag, T value) {
        this.tag = tag;
        this.value = value;
      }

      public static WorkspaceReferenceArg<uint64?> id(uint64 id) {
        return WorkspaceReferenceArg<uint64?>(WorkspaceReferenceArgTag.Id, id);
      }

      public static WorkspaceReferenceArg<uint8?> index(uint8 index) {
          return WorkspaceReferenceArg<uint8?>(WorkspaceReferenceArgTag.Index, index);
      }

      public static WorkspaceReferenceArg<string?> name(string name) {
        return WorkspaceReferenceArg<string?>(WorkspaceReferenceArgTag.Name, name);
      }

      public static Json.Node serialize_json(void* _boxed) {
        assert(_boxed != null);
        WorkspaceReferenceArg* boxed = (WorkspaceReferenceArg*) _boxed;

        var node = new Json.Node(Json.NodeType.OBJECT);
        var obj = new Json.Object();
        switch (boxed.tag) {
          case WorkspaceReferenceArgTag.Index:
            obj.set_int_member("Index", *((uint8*)boxed.value));
            break;
          case WorkspaceReferenceArgTag.Id:
            obj.set_int_member("Id", (int64)(*((uint64*)boxed.value)));
            break;
          case WorkspaceReferenceArgTag.Name:
            obj.set_string_member("Name", (string)boxed.value);
            break;
        }
        node.set_object(obj);

        return node;
      }
    }

    public enum ColumnDisplayTag {
      Normal,
      Tabbed
    }

    public struct ColumnDisplay {
      public ColumnDisplayTag tag {get; set;}
      public ColumnDisplay(ColumnDisplayTag tag) { this.tag = tag; }
      public ColumnDisplay.normal() { ColumnDisplay(ColumnDisplayTag.Normal); }
      public ColumnDisplay.tabbed() { ColumnDisplay(ColumnDisplayTag.Tabbed); }
      public static Json.Node serialize_json(void* _boxed) {
        assert(_boxed != null);
        ColumnDisplay* boxed = (ColumnDisplay*) _boxed;
        var node = new Json.Node(Json.NodeType.VALUE);
        switch (boxed.tag) {
          case ColumnDisplayTag.Normal:
            node.set_string("Normal");
            break;
          case ColumnDisplayTag.Tabbed:
            node.set_string("Tabbed");
            break;
        }
        return node;
      }
    }

    public enum SizeChangeTag {
      SetFixed,
      SetProportion,
      AdjustFixed,
      AdjustProportion,
    }

    public struct SizeChange<T> {
      public SizeChangeTag tag {get; set;}
      public T value {get; set;}

      public SizeChange(SizeChangeTag tag, T value) {
        this.tag = tag;
        this.value = value;
      }

      public static SizeChange<int64?> set_fixed(int64 fixed) {
        return SizeChange<int64?>(SizeChangeTag.SetFixed, fixed);
      }

      public static SizeChange<double?> set_proportion(double proportion) {
        return SizeChange<double?>(SizeChangeTag.SetProportion, proportion);
      }

      public static SizeChange<int64?> adjust_fixed(int64 fixed) {
        return SizeChange<int64?>(SizeChangeTag.AdjustFixed, fixed);
      }

      public static SizeChange<double?> adjust_proportion(double proportion) {
        return SizeChange<double?>(SizeChangeTag.AdjustProportion, proportion);
      }

      public static Json.Node serialize_json(void *_boxed) {
        assert(_boxed != null);
        var boxed = (SizeChange*)_boxed;
        var node = new Json.Node(Json.NodeType.OBJECT);
        var object = new Json.Object();
        switch (boxed.tag) {
          case SizeChangeTag.SetFixed: {
            object.set_int_member("SetFixed", *(int64*)boxed.value);
            break;
          }
          case SizeChangeTag.SetProportion: {
            object.set_double_member("SetProportion", *(double*)boxed.value);
            break;
          }
          case SizeChangeTag.AdjustFixed: {
            object.set_int_member("AdjustFixed", *(int64*)boxed.value);
            break;
          }
          case SizeChangeTag.AdjustProportion: {
            object.set_double_member("AdjustProportion", *(double*)boxed.value);
            break;
          }
        }
        node.set_object(object);
        return node;
      }
    }

    public enum LayoutSwitchTargetTag {
      Next,
      Prev,
      Index,
    }

    public struct LayoutSwitchTarget {
      public LayoutSwitchTargetTag tag {get; set;}
      public uint8 index_value {get; set;}

      public LayoutSwitchTarget(LayoutSwitchTargetTag tag) {
        this.tag = tag;
      }

      public LayoutSwitchTarget.next() {
        this(LayoutSwitchTargetTag.Next);
      }

      public LayoutSwitchTarget.prev() {
        this(LayoutSwitchTargetTag.Prev);
      }

      public LayoutSwitchTarget.index(uint8 index) {
        this(LayoutSwitchTargetTag.Index);
        this.index_value = index;
      }

      public static Json.Node serialize_json(void *_boxed) {
        assert(_boxed != null);
        LayoutSwitchTarget* boxed = (LayoutSwitchTarget*)_boxed;
        var node = new Json.Node(Json.NodeType.VALUE);
        switch (boxed.tag) {
          case LayoutSwitchTargetTag.Next:
            node.set_string("Next");
          break;
          case LayoutSwitchTargetTag.Prev:
            node.set_string("Prev");
          break;
          case LayoutSwitchTargetTag.Index:
            var n = new Json.Node(Json.NodeType.OBJECT);
            var obj = new Json.Object();
            obj.set_int_member("Index", boxed.index_value);
            n.set_object(obj);
            return n;
        }
        return node;
      }
    }
  }
}
