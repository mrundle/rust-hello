extern crate argparse;
use argparse::ArgumentParser;
//use argparse::StoreTrue;
use argparse::Store;

use std::collections::HashMap;


fn parse_args() -> HashMap<String, String> {

    let mut args = HashMap::new();
    let mut action = "".to_string();

    {
        let mut ap = ArgumentParser::new();
        ap.set_description("rust-hello cli");
        ap.refer(&mut action)
          .add_option(
              &["-a", "--action"],
              Store,
              "action: options TODO",
            ).required();
        ap.parse_args_or_exit();
    }

    /* validate action */
    if action != "hello_world".to_string() {
        println!("unknown --action, exiting");
        std::process::exit(1);
    }

    /* store args */
    args.insert("action".to_string(), action);

    return args;
}

fn main() {
    let args = parse_args();
    match args.get("action") {
        Some(action) => {
            if action == "hello_world" {
                hello_world::print_hello_world();
            } else {
                println!("no definition for {action}");
                std::process::exit(1);
            }
        },
        None => println!("no action specified"),
    }
}
