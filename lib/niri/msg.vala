namespace AstalNiri {
public class msg : Object {

    public static string? send(string message) {
        IPC ipc;

        try {
            ipc = IPC.connect();
            if (ipc == null ) return null;
            var istream = ipc.send(Json.from_string(message));
            var line = istream.read_line();
            return line;
        } catch (Error err) {
            critical("command Error: %s", err.message);
            return err.message;
        } finally {
            ipc.close();
        }
    }

    public static async string send_async(string message) {
        IPC ipc;
        try {
            ipc = IPC.connect();
            if (ipc == null ) return "no ipc";
            var istream = ipc.send(Json.from_string(message));
            var line = yield istream.read_line_async();
            critical("%s", line);
            return line;
        } catch (Error err) {
            critical("command Error: %s", err.message);
            return err.message;
        } finally {
            ipc.close();
        }
    }


    // 
    // Simple Actions
    // 
    /** Formats a simple action for Niri's IPC   */
    public static bool send_act(string str, string fields = "{}") {
        var cmd = "{\"Action\":{\"%s\":%s}}\n".printf(str, fields);
        print("Sending: %s", cmd);
        var res = send(cmd);
        critical(res);
        if (res == "{\"Ok\":\"Handled\"}") return true;
        return false;
    }

    public static bool send_act_json(Action action) {
        var cmd = action.to_string();
        print("Sending: %s", cmd);
        var res = send(cmd);
        critical(res);
        if (res == "{\"Ok\":\"Handled\"}") return true;
        return false;
    }


    // TODO(2025-06-07, Max Bolotin): Continue here

    private static string fmt_str(string str) {
        return "\"%s\"\n".printf(str);
    }
    public string layers() {
      return send(fmt_str("Layers"));
    }
    public static async Window? pick_window() {
      var res = yield send_async(fmt_str("PickWindow"));
      if ("Ok" in res) {
        try {
          var json = Json.from_string(res).get_object();
          var window_json = json.get_object_member("Ok").get_object_member("PickedWindow");
          var window = Niri.get_default().get_window(window_json.get_int_member("id"));
          return window;
        } catch (Error err) {
          critical("command Error: %s", err.message);
        }
      }
      return null;
    }
    public static async double[]? pick_color() {
      var res = yield send_async(fmt_str("PickColor"));
      if ("Ok" in res) {
        try {
          var json = Json.from_string(res).get_object();
          var rgb = json.get_object_member("Ok").get_object_member("PickedColor").get_array_member("rgb");
          double r = rgb.get_double_element(0);
          double g = rgb.get_double_element(1);
          double b = rgb.get_double_element(2);
          double[] col = new double[3];
          col = {r, g, b};
          return col;
        } catch (Error err) {
          critical("command Error: %s", err.message);
        }
      }
      return null;
    }
}
}
