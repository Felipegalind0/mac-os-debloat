#!/usr/bin/env bash
# Stop Apple Intelligence model downloads (including mobileassetd).
# With SIP off, also delete writable Data AssetsV2 trees. OS-sealed
# GenerativeModels leftover (EROFS) needs FileVault off (`fdesetup status`,
# not Settings.app) then Recovery:
#   csrutil authenticated-root disable
# then re-run. Remaining bundles (including empty husks) are listed if rm
# cannot finish. Tick MobileAsset back on in the TUI for dictionary/trust
# updates.
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
exec python3 "$ROOT/debloat" --purge-ai-models "$@"
