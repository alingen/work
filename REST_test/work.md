| URI  | HTTP method |
| ---- | ----        |
| /movie/new| POST|
| /movie/index| GET
| /movies/:id| GET |
| /movies| POST|
| /movies/:id| PUT |
| /movies/:id| DELETE|

* REST APIとは
REST APIとは分散型システム（複数のコンピュータが連携して１つのシステムをつくること）における設計のルールのこと。まずwebAPIとはインターネット通信のプログラムが読み書きしやすい形でメッセージを送れるように定義した規約（ルール）のことで、それがRESTで求められる原則に従ってAPIをつくればREST APIとなる。RESTで求められる原則はいくつかある。例えば一回のリクエストだけでやりとりを成立させて、リクエストを独立させること（ステートレスの原則）などがある。
