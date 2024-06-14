# PINS Tests Suite

This repository presents a number of example and tests for solving optimal control problems with `PINS` toolkit. 

Each test has the following structure:

    ├── test-TestName
    │   ├── model
    │   │  ├── TestName.mw
    │   │  └── TestName.maplet
    │   └── doc
    │      └── ...

The `model` folder contains the Maple worksheet (`.mw`), which is used to generate the C++ files and ruby scripts.

The `doc` folder contains a short documentation about the test itself.

## Requirements

You need a licensed version of the PINS toolkit and a licensed Maple installation. Mac OS X, Linux, and Windows are supported.

## Contacts

Main contacts are

  - enrico[dot]bertolazzi[at]unitn[dot]it
  - francesco[dot]biral[at]unitn[dot]it
  - paolo[dot]bosetti[at]unitn[dot]it.
