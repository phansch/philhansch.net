#!/bin/bash

# Updates `_data/timeline.json` with the latest data
# Usage: GH_TOKEN=xxxx ./update_timeline.sh

set -euo pipefail

jq_transform=$(cat <<-END
[ .[] |
  {
    type:"code",
    action:"Made a contribution to",
    project: .project,
    explanation: .title,
    language:"Rust",
    url: .html_url,
    display_date: (.closed_at | fromdate | strftime("%Y-%m-%d"))
  }
]
END
)
cd ~/code/prs
json=$(LIMIT=20 cargo run -q | jq "$jq_transform")
cd ~/code/phansch.github.com
rm -rf /tmp/phansch.github.com
mkdir /tmp/phansch.github.com
touch /tmp/phansch.github.com/blog_timeline_update.json
echo "$json" > /tmp/phansch.github.com/blog_timeline_update.json
cat _data/timeline.json >> /tmp/phansch.github.com/blog_timeline_update.json
cp /tmp/phansch.github.com/blog_timeline_update.json _data/timeline.json

# TODO manually after running this
# 1. Review all the 'language' values.
#    These are hardcoded to 'Rust', but sometimes I contribute in other languages, too
# 2. Review all the 'type' values.
#    These are hardcoded to 'code', but I often write 'docs'
