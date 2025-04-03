#!/bin/bash
amixer -D pulse sset Master 0 && systemctl hibernate
