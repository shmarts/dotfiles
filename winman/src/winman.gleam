import gleam/dynamic.{field, int, string}
import gleam/io
import gleam/json
import gleam/list
import gleam/string
import glexec as exec

pub type Window {
  Window(id: Int, app: String)
}

pub fn get_string_list(output: exec.Output) -> String {
  // let foo = exec.Output([exec.Stdout(["foo"])])

  let exec.Output(inner) = output

  let a =
    inner
    |> list.map(fn(stdout_or_stderr) {
      case stdout_or_stderr {
        exec.Stdout(s) -> s
        exec.Stderr(_) -> []
      }
    })
    |> list.concat
    |> string.concat

  io.debug(a)

  ""
}

pub fn main() {
  // use use
  let assert Ok(_bash) = exec.find_executable("bash")

  // use use
  let assert Ok(cmd) =
    exec.new()
    |> exec.with_stdin(exec.StdinPipe)
    |> exec.with_stdout(exec.StdoutCapture)
    |> exec.with_stderr(exec.StderrStdout)
    |> exec.run_sync(exec.Shell("yabai -m query --windows"))

  let a = get_string_list(cmd)

  let window_decoder =
    dynamic.decode2(Window, field("id", of: int), field("app", of: string))
  let b = json.decode(from: a, using: dynamic.list(window_decoder))
  io.debug(b)
}
