#!/bin/bash

case "$1" in
    status)
        tc -s qdisc ls dev lo
        tc class show dev lo
        ;;

    on)
        if [ -z "$2" ] ; then
            echo "Usage: $0 on [#ms latency] [optional max Mbps]"
            exit 1
        fi
        if [ ! -z "$3" ] ; then
            sudo tc qdisc add dev lo handle 1: root htb default 11
            sudo tc class add dev lo parent 1: classid 1:1 htb rate 1000Mbps
            sudo tc class add dev lo parent 1:1 classid 1:11 htb rate "$3"Mbit
            sudo tc qdisc add dev lo parent 1:11 handle 10: netem delay "$2"ms limit 100000
        else
            sudo tc qdisc add dev lo handle 1: root netem delay "$2"ms limit 100000
        fi
        ;;
    off)
        sudo tc qdisc del dev lo root
        ;;
    *)
        echo "Use this script to add latency or bandwidth limit to the loopback device"
        echo
        echo "Usage:"
        echo "  $0 status"
        echo "  $0 on [#ms latency] [max Mpbs]"
        echo "  $0 off"
        exit 1
esac
