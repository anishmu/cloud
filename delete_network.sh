#!/bin/bash

source setup.cfg

neutron subnet-delete test-subnet
op=$( neutron subnet-list | grep test-subnet )
while [ ! -z "$op" ]; do
  op=$( neutron subnet-list | grep test-subnet )
  echo -n "."
done

neutron net-delete test
op=$( neutron net-list | grep test )
while [ ! -z "$op" ]; do
  op=$( neutron net-list | grep test )
  echo -n "."
done

neutron subnet-delete ext-subnet
neutron net-delete ext-net
neutron router-delete test-router
exit 0
