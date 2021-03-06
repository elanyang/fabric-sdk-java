#!/usr/bin/env bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#
#file used for automatic integration build test
#This should always match what's in the README.md

export FABRIC_COMMIT=latest
export FABRIC_CA_COMMIT=latest
# if below are set then fabric/ca won't be built.
#export FABRIC_NO_BUILD=true
#export FABRIC_CA_NO_BUILD=true

ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION=${ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION:-}
if [ -z $ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION ];then
export ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION="2.0.0"
fi


dotcount="${ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION//\.}"
if [ "3" == "${#dotcount}" ];then
export ORG_HYPERLEDGER_FABRIC_SDKTEST_FIXVERSION=${ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION%.*}
else
export ORG_HYPERLEDGER_FABRIC_SDKTEST_FIXVERSION=$ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION
fi

echo  "ORG_HYPERLEDGER_FABRIC_SDKTEST_FIXVERSION: $ORG_HYPERLEDGER_FABRIC_SDKTEST_FIXVERSION"


case "$ORG_HYPERLEDGER_FABRIC_SDKTEST_FIXVERSION" in
"2.0")
unset FABRIC_NO_BUILD
unset FABRIC_CA_NO_BUILD
    ;;
*)
echo "NOT DOING BUILD ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION=$ORG_HYPERLEDGER_FABRIC_SDKTEST_VERSION"
export FABRIC_NO_BUILD=true
export FABRIC_CA_NO_BUILD=true
    ;;
esac
