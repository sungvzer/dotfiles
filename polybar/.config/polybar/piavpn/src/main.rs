use std::fmt::Display;
use std::io::{BufRead, BufReader};
use std::process::{Command, Stdio};

enum ConnectionState {
    Unknown,
    Disconnected,
    Disconnecting,
    Connecting,
    Connected,
}

impl Display for ConnectionState {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ConnectionState::Unknown => f.write_str("unknown"),
            ConnectionState::Disconnected => f.write_str("disconnected"),
            ConnectionState::Disconnecting => f.write_str("disconnecting"),
            ConnectionState::Connecting => f.write_str("connecting"),
            ConnectionState::Connected => f.write_str("connected"),
        }
    }
}

fn main() {
    let mut monitor_cmd = Command::new("piactl")
        .args(["monitor", "connectionstate"])
        .stdout(Stdio::piped())
        .spawn()
        .expect("Could not execute piactl");

    let monitor_stdout = monitor_cmd.stdout.as_mut().unwrap();
    let monitor_stdout_reader = BufReader::new(monitor_stdout);

    let mut current_state: ConnectionState;

    for line in monitor_stdout_reader.lines() {
        if line.is_err() {
            continue;
        }
        let line = line.unwrap();

        current_state = match line.to_lowercase().as_str() {
            "connected" => ConnectionState::Connected,
            "disconnected" => ConnectionState::Disconnected,
            "connecting" => ConnectionState::Connecting,
            "disconnecting" => ConnectionState::Disconnecting,
            _ => ConnectionState::Unknown,
        };

        match current_state {
            ConnectionState::Unknown => {
                println!("???");
            }
            ConnectionState::Connected => {
                let region_cmd = Command::new("piactl")
                    .args(["get", "region"])
                    .output()
                    .expect("Could not execute piactl");
                let region = String::from_utf8(region_cmd.stdout).unwrap();
                let region = region.trim();

                println!("{}", region);
            }
            _ => {
                println!("{current_state}");
            }
        };
    }
}
