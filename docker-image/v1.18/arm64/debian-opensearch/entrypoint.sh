#!/usr/bin/env sh

# AUTOMATICALLY GENERATED
# DO NOT EDIT THIS FILE DIRECTLY, USE /templates/entrypoint.sh.erb


set -e

SIMPLE_SNIFFER=$( gem contents fluent-plugin-opensearch | grep opensearch_simple_sniffer.rb )

if [ -n "$SIMPLE_SNIFFER" -a -f "$SIMPLE_SNIFFER" ] ; then
    FLUENTD_OPT="$FLUENTD_OPT -r $SIMPLE_SNIFFER"
fi


exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins --gemfile /fluentd/Gemfile ${FLUENTD_OPT}
