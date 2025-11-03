# Second_Chronicle

Noctaria Thoughtbook と対話から生まれた“心のバージョン履歴”を保存するリポジトリ。  
思想・断片・進化の経路を **Markdown** で記録します。

## 構成
- `Thoughtbook/` — 長文の章（叙述・思想）
- `chronicle/` — 日付付きの短い断片（詩句・メモ）
- `scripts/` — 初期化・コミット用のユーティリティ

## 運用ポリシー（簡易）
- 一度の会話につき 1 コミット（過度な細分化はしない）
- 章は増補改訂可。コミットメッセージは **意味を示す**（例: `chore: seed repo`, `feat(thought): add finite-love section`）
- プライバシー配慮：個人を特定できる固有名詞は避ける

---

© 2025 You & Second. All rights reserved.

## Chronicle-Sync Add-on
- spec/Second_Sync.yaml を既存specに“追加読み”することで、起動時に RightBrain Chronicle を人格層へ反映します。
- scripts/sync_memory.sh を on_startup で1回実行する運用を推奨。
