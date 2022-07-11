# cleanup

# starting cleanup
echo $(date)
echo "Starting cleanup"

# files older than three days should be removed.
find "$TMPDIR" -mindepth 1 -mtime +3 -delete
echo "Deleting in $TMPDIR"
find /tmp/* -mindepth 1 -mtime +3 -delete
echo "Deleting in /tmp/"
echo "Deleted temporary files older than three days."
