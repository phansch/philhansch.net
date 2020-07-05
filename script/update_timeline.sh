#!/bin/bash

# Updates `content/timeline.json` with the latest data
# Usage: GH_TOKEN=xxxx ./update_timeline.sh

set -euo pipefail

jq_transform=$(cat <<-END
[ .[] |
  {
    type:"code",
    project: .project,
    explanation: .title,
    language:"Rust",
    url: .html_url,
    date: (.closed_at | fromdate | strftime("%Y-%m-%d"))
  }
]
END
)
cd ~/code/prs
json=$(LIMIT=20 cargo run -q | jq "$jq_transform")
cd ~/code/phansch.net
rm -rf /tmp/phansch.net
mkdir /tmp/phansch.net
touch /tmp/phansch.net/blog_timeline_update.json
echo "$json" > /tmp/phansch.net/blog_timeline_update.json
cat content/timeline.json >> /tmp/phansch.net/blog_timeline_update.json
cp /tmp/phansch.net/blog_timeline_update.json content/timeline.json

# TODO manually after running this
# 1. Review all the 'language' values.
#    These are hardcoded to 'Rust', but sometimes I contribute in other languages, too
# 2. Review all the 'type' values.
#    These are hardcoded to 'code', but I often write 'docs'
