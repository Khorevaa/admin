export ADMINNAME="admin2"

admin_list() {
    $CMD admin list
}

admin_invite() {
        output=$($CMD admin invite "$ADMINNAME")
        export INVITE_ID=$(echo "$output" | awk '/Invite ID/ { print $3 }')
        export INVITE_KEY=$(echo "$output" | awk '/Invite key/ { print $3 }')
}

admin_new() {
  PKIIO_HOME="$PKIIO_HOME2_DIR" $CMD admin new "$ADMINNAME" --invite-id "$INVITE_ID" --invite-key "$INVITE_KEY"
}

admin_run() {
  $CMD admin run
}

admin_complete() {
    PKIIO_HOME="$PKIIO_HOME2_DIR" $CMD admin complete "$ADMINNAME" --invite-id "$INVITE_ID" --invite-key "$INVITE_KEY"
}

admin_delete() {
    $CMD admin delete "$ADMINNAME" --confirm-delete "this is just a test" 2> /tmp/wtf.txt
}

admin_check_exists() {
    admin_list | grep -q "$1"
}
