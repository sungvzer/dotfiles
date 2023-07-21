use regex::Regex;
use std::io::{BufRead, BufReader};
use std::process::{Command, Stdio};
fn main() {
    let mut ping_cmd = Command::new("ping")
        .args(["-i 1", "1.1.1.1"])
        .stdout(Stdio::piped())
        .spawn()
        .expect("Could not execute ping");

    let ping_stdout = ping_cmd.stdout.as_mut().unwrap();
    let ping_reader = BufReader::new(ping_stdout);

    for line in ping_reader.lines() {
        if line.is_err() {
            continue;
        }
        let line = line.unwrap();
        let re = Regex::new(r"[0-9]*\.[0-9]* ms$").unwrap();
        let matched = re.find(line.as_str());
        if matched.is_none() {
            continue;
        }
        let matched = matched.unwrap().as_str();
        println!("{matched}");
    }
}
