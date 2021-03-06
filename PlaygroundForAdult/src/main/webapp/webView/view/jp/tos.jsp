<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<title>terms of service</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/webView/bootstrap/js/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>

/* 4inch smartphone (landscape) */
@media only screen
and (max-device-width : 568px)
and (min-device-width : 400px) {
	.container-fluid {padding: 2%; width: 568px; height: 320px; background-image: url("/webView/img/568x320/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden;}
	#topcon {}
	#tosBtn {height: 500px; margin: auto;}
	#privacyBtn {margin: auto;}
	#tos {height: 80%; display: block;}
	#privacy {display: none; height: 80%;}
}

/* **standard** */
/* Samsung Galaxy S7, g2 (landscape) */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 569px) {
	.container-fluid {width: 630px; height: 350px; background-image: url("/webView/img/640x360/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#topcon {height: 60px;}
	#tosBtn {height: 25px; margin: 20px 0 0 -10px;}
	#privacyBtn {height: 25px; margin: 20px 0 0 10px;}
	#tos {height: 80%; display: block;}
	#privacy {display: none; height: 80%;}
}

/* Samsung Galaxy S8 (landscape) */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 740px; height: 360px; background-image: url("/webView/img/740x360/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden;}
	#topcon {}
	#tosBtn {margin: 4% auto;}
	#privacyBtn {margin: 4% auto;}
	#tos {height: 80%; display: block;}
	#privacy {display: none; height: 80%;}
}

/* LG G3 (landscape) */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 853px; height: 480px; background-image: url("/webView/img/853x480/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden;}
	#topcon {}
	#tosBtn {margin: 5% auto;}
	#privacyBtn {margin: 5% auto;}
	#tos {height: 80%; display: block;}
	#privacy {display: none; height: 80%;}
}

/* Samsung Galaxy Note4 (landscape) */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 960px; height: 540px; background-image: url("/webView/img/960x540/bg.png"); background-repeat: no-repeat;}
	#topcon {}
	#tosBtn {margin: 5% auto;}
	#privacyBtn {margin: 5% auto;}
	#tos {height: 80%; display: block;}
	#privacy {display: none; height: 80%;}
}

/* Tablet iPad (landscape) */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px) {
	.container-fluid {width: 1024px; height: 768px; background-image: url("/webView/img/1024x768/bg.png"); background-repeat: no-repeat;}
	#topcon {}
	#tosBtn {margin: 5% auto;}
	#privacyBtn {margin: 5% auto;}
	#tos {height: 80%; display: block;}
	#privacy {display: none; height: 80%;}
}

/* Tablet Tab10, Xperia Z4 (landscape) */
@media only screen
and (max-device-width : 2560px)
and (min-device-width : 1025px) {
	.container-fluid {width: 1280px; height: 800px; background-image: url("/webView/img/1280x800/bg.png"); background-repeat: no-repeat;}
	#topcon {}
	#tosBtn {margin: 5% auto;}
	#privacyBtn {margin: 5% auto;}
	#tos {height: 80%; display: block;}
	#privacy {display: none; height: 80%;}
}

.contentcon {height: 100%; overflow-y: hidden; overflow-x: hidden}

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;

</style>
</head>
<body style="background-color: black;">

<div class="container-fluid">


	<div class="contentcon" style="height: 100%;">
		<div class="row" style="height: 17%;">
			<div class="col-6" style="margin: 0 auto;">
				<div class="row">
					<div class="col-4"></div>
					<img class="col-4" id="tosBtn" src="/webView/img/common/tos/jp/tos_btn.png" style="padding: 0; margin-left: 10%;"/>
					<div class="col-4"></div>
				</div>
			</div>
			<div class="col-6" style="margin: 0 auto;">
				<div class="row">
					<div class="col-4"></div>
					<img class="col-4" id="privacyBtn" src="/webView/img/common/tos/jp/privacy_btn.png" style="padding: 0; margin-left: -10%;"/>
					<div class="col-4"></div>
				</div>
			</div>
		</div>
		<div class="row" id="tos" style="height: 80%; display: block;">
			<div class="col-12" style="padding: 0 2% 0 2%; height: 100%;">
			<pre style="height: 100%; margin: 0 auto; color: white; overflow-y: scroll; font-size: 0.5em;">


 第1条[目的]

 この規約は、㈜King of Day（以下「会社」）が提供するモバイルゲームサービス利用と関連して、会社と利用者との間の権利と
 義務と必要な諸事項を規定することをその目的としています。


 第2条[用語の定義]
 
 この規約で使用する用語の定義は次のとおりです。
 
 1.「利用者」とは、会社の規約に同意し、会社の情報を継続的に提供受け会社が提供するサービスを継続的に利用する
 ことができる者を意味し、「一時的利用者」とは、正式に「利用者」に登録せず、ゲストログインモードを利用する者を意味します。
 
 2.「サービス」とは、会社が提供するモバイルゲームやその他のサービス一切を意味します。
 3.「端末」とは、サービスをダウンロードしたりインストールして使用することができる携帯電話、スマートフォン、PDA、タブレット、携帯ゲーム機、コンソールゲーム機などの機器を意味します。
 4.「アプリケーション」とは、会社が提供するサービスを利用するために、第2条第3項で説明した端末を介してダウンロードしたりインストールして使用するプログラム一式を意味します。
 5.「オープンマーケット事業者」とは、当社のゲームをインストールして決済することができるように機能を提供する電子商取引企業（ゲーム内課金を提供する事業者を含む）を意味します。（例えば、GoogleのプレイのApp Storeは、AppleのApp Store、ティーストア、
 オレマーケット、ユープラスアプリマーケットなど）
 6.「プラットフォーム事業者」とは、当社のゲームを知らせたり、利用するにあたり、会社と提携してサービスを提供する事業者を意味します。（例えば、カカオ、ラインなど）
 7.「アカウント情報」とは、利用者のID、ゲームの会員番号、機器情報、ニックネーム、プロフィール写真、友達リストなど、利用者が会社に提供された一般的な情報とゲーム利用情報（キャラクター情報、アイテム、レベルなど）、利用料金決済情報などの生成情報を
 意味します。
 8.「有料コンテンツ」とは、利用者がサービスを利用するにおいて、特定の効果や効能を享受するために、オープンマーケット事業者を介して購入するオンラインコンテンツ一切を意味します。
 9.「無料コンテンツ」とは、第2条第8項の有料コンテンツを購入せずに、利用者間のギフトやゲームサービスを利用しながら取得することができるオンラインコンテンツ一切を意味します。
 10.「In-App決済（In-App Purchase）」とは、アプリケーション内でアイテム、ゲームマネーなどの有料コンテンツ等を購入するための決済行為を意味します。
 11.この規約で使用する用語の定義は、第2条で定めるものを除いては、関係法令およびその他の一般的な商慣習によります。


 第3条[約款の効力と変更]


 1.この約款は、会社のウェブサイトやサービス利用のためのアプリケーション内に明示し、利用者がアプリケーションをインストールして実行して同意欄にチェックすることで効力が発生します。
 2.本規約に同意することは定期的に規約の変更を確認することに同意することを意味します。
 3.当社は、関連法令の変更や利用者の権利と義務を改善するために、関係法令や商慣習に違反しない範囲でこの規約を改正することができます。
 4.変更された規約は、変更された規約の適用日の7日前までに（ただし、利用者の権利？義務に重大な影響を与える事項については、30日前）会社のウェブサイトや公式カフェ、提供するアプリケーションなどを介して利用者に告知して
 適用日から効力が発生します。
 5.利用者は、変更された規約に同意しない権利があり、変更された規約に同意しない場合は、アプリケーションのログアウトおよび削除とサービスの利用を停止し、脱退することができます。ただし、会社が変更された
 規約を告知し、利用者に適用さ日前までに拒否の意思表示をしないとの条件変更に同意したものとみなさないという意味を明確にしたにもかかわらず、利用者が拒否の意思表示をしない場合には、変更された
 規約に同意したものとみなされます。


 第4条[約款外準則]


 この規約で明示していない事項については、当社の運営方針、関係法令及び商慣習によります。

 第5条[会社の義務]


 1.当社は、関連法令とこの約款で禁止する行為をせず、継続的安定的にサービスを提供するために全力を尽くして努力します。
 2.会社は、利用者の個人情報を保護するためのセキュリティ義務を怠っていません。ただし、サービスの特性に応じて、利用者のニックネーム、写真など自分を紹介する内容が、利用者の選択によって、他の利用者に公開されることがあります。
 3.当社は、利用者から提起される意見や不満が正当だと客観的に認められる場合には、合理的な期間内に処理しなければします。ただし、すぐに処理が困難な場合には、利用者にその事由と処理日程を通報しなければします。
 4.会社はずっと信頼性の高いサービスの提供のためにサービスの改善をしていたの設備に障害が生じたり、データなどが軽蔑されたときには天災、緊急事態、解決が困難な技術的欠陥などのやむを得ない事由がない限り、これを
 修理または修復する最善の努力を尽くします。
 5.当社は、個人情報保護のため、個人情報の取り扱い方針を告知し、遵守します。


 第6条[利用者の義務】
	
 利用者は、会社が提供するサービスをゲームサービス本来の利用目的以外の目的で使用したり、次の各項に該当する行為をしてはならなりません。また、利用者は、利用規約の変更を頻繁に確認しなければします。
 1.お問い合わせ、有料コンテンツの回復と返金要求は、イベント当選などにより会社に個人情報を提供時実名ではなく、情報または他の情報を使用したり、虚偽の事実を記載する行為
 2.他人になりすましたり、他人との関係を虚偽で記載する行為、他の利用者のIDとパスワードを盗用、不正に使用したり、他人のクレジットカード、有線/無線電話、銀行口座などを無断で盗用して有料コンテンツを購入する行為
 3.会社が提供していないサービスを使用して有料コンテンツなどを他人と取引したり、売買する行為
 4.会社のサービスと提供されたアプリケーションを利用して得た情報を会社の事前承諾なしに複製、流通、商業利用や、既知または未知のバグを悪用してサービスを利用する行為
 5.会社のサービスと提供されたアプリケーションを利用して自己又は他人に財産上の利益を発生させる行為
 6.会社や第三者の知的財産権などその他の権利を侵害したり、他の利用者の個人情報を収集、保存、配布、掲示、利用する行為
 7.第三者欺罔して利益を得るか、会社が提供するサービスを不健全に利用したりして、第3者に損害を与える行為
 8.会社から特別な権利を付与されず、アプリケーションを変更したり、アプリケーションに他のプログラムを追加または挿入したり、サーバーをハッキング、リバースエンジニアリングしたり、ソースコードやアプリケーションデータの流出や変更は、別の
  サーバーを構築したり、ウェブサイトの一部を任意に変更または盗用して、会社を詐称する行為
 9.会社の従業員やオペレータを最もたり詐称して、または他人の名義を盗用して記事を投稿したり、メールを送信する行為
 10.会社の事前の同意なしに広告性情報を送信する行為
 11.その他の公の秩序及び公序良俗に違反する違法、不当な行為と関係法令に違反する行為

	
 第7条[サービスの利用時間】


 サービス利用は会社の業務上または技術上特別な支障がない限り年中無休、1日24時間運営を原則とします。ただし、定期点検などの必要により、会社が定めた日や時間にはサービスを中断することができ、会社は
 その時間帯や日付を事前にウェブサイトやアプリケーションに通知します。
	
	
 第8条[サービス内容と変更]


 1.会社は新しいゲーム内容、各種バグのパッチなどのサービスの運営上、技術上または企画上必要な場合には、提供しているサービスの全部または一部を常時的に修正、追加、廃止などを変更することができます。変更されるサービスの
 内容及び提供日等については運営するウェブサイトやアプリケーション内に掲示して通知します。
 2.会社はサービスの運営上、技術上、または企画賞サービスを中断または終了する必要がある場合は、次の各号のようにサービスを一時中断または終了することができます。

 ①30日前告知後中断した場合、
 が。期間制有料アイテム：中断期間だけ延長ただし、利用者のキャンセル/払い戻し要請があった時の残りの期間に該当する金額のみ返金。
 私。非期間制有料アイテムまたは無料アイテム：一時停止した後、継続使用可能であり、キャンセル返金不可。
 ②30日前告知後サービス終了した場合、
 
 情報提供及び第2項の広告などを提供する場合は、SMS（LMS）、スマートフォンの通知（Push通知）、メールアドレスなどを活用して、送信することができ、利用者が望まない場合には、いつでも受信を拒否することができます
 

 第10条[有料コンテンツの購入および利用]


 1.利用者は、サービスを使用している端末の種類に応じた各オープンマーケット事業者の決済運営方針に基づいて、有料コンテンツを購入することができ、当該決済政策の違いにより、決済金額の限度額の差が生じる場合があります。
 また、有料コンテンツの購入代金はオープンマーケット事業者と連携した移動通信社やプラットフォーム事業者やオープンマーケット事業者が定める方法およびポリシーに基づいて課され、支払い方法も当該事業者のポリシーに従います。
 2.ゲームサービス内で利用者が購入した有料コンテンツは、ゲームサービスアプリケーションをダウンロードしたりインストールした端末でのみ利用することができます。
 
 
 
 第11条[In-App決済]
 
 
 1.会社のアプリケーションは、有料コンテンツを購入するためのIn-App決済機能を備えています。
 2.利用者は、端末のパスワード設定機能、オープンマーケットで提供されるパスワード設定機能などを利用して、第3者のIn-App決済を防止しなければならず、会社はこのために放送通信委員会の勧告及び「オープンマーケットモバイルコンテンツ
 決済ガイドライン」に基づいてオープンマーケットが提供する認証手続きなどが適用されたIn-App決済のためのモジュール、ライブラリ、などをアプリケーションに適用します。
 3.利用者が端末とオープンマーケットのパスワード設定機能などを利用していないか、または不注意に露出して発生する第三者In-App決済については、会社がどのような責任も負いません。
 4.利用者が携帯電話会社の青少年料金制に加入した場合は、その端末で、In-App決済をすると、その内容は、法定代理人の同意があるものとみなされます。
 5.利用者は、オープンマーケット事業者の政策、方法などに応じて、In-App決済代金を誠実に納付すべき責任があり、各決済手段ごとに決済限度が付与されることがあります。
 
 
 第12条[申込撤回と払い戻しなど]
 
 
 1.利用者が購入した有料コンテンツの場合には、契約締結日または有料コンテンツ利用可能日から7日以内に別の手数料なし申込撤回（購入のキャンセル）をすることができます。ただし、ギフト、イベントなど、会社や第三者から無償で
 提供された有料コンテンツまたは申込撤回要求、当時すでに使用し、又は使用したものと考えられている有料コンテンツなどこれに準ずる特性を持ついくつかの有料コンテンツに対しては、「電子商取引等での消費者保護に関する法律」
 第17条第2項第2号から第3号及び「コンテンツ産業振興法」第27条第1項の規定により申込み撤回（購入のキャンセル）が制限されることがあります。この場合、会社は、利用者に対し、当該有料コンテンツの購入時に告知するなど、関連の法律で定めるところ
  による措置をとることにします。
 2.利用者が会社の故意または重大な過失による帰責事由により購入した有料コンテンツを利用していない場合には、同一の有料コンテンツを無償で提供したり、その購入金額を契約締結日（購入日）に関係なく全額
 返金します。ただし、サービスを中断する場合には、第8条第2項により処理します。
 3.払い戻しは支払いの確認がされた場合に限り、申請日から3営業日以内に購入した決済手段として払い戻しすることを原則とします。ただし、サービスを使用している端末のオペレーティングシステムの種類に応じて、各オープンマーケット事業者の払い戻し運営方針が
  適用されることができ、詳細な払い戻しの申請手続きは、会社のウェブサイトやアプリケーションに公知されたところに従ってください。また、払い戻しがされた対価に基づいて、ゲーム内の有料コンテンツは、その払い戻しされた金額だけ差し引い反映します。
 4.有料コンテンツを開封（例：ライブラリから移動させた場合など）、または使用するボタンをクリックした場合には、利用者が使用の意思を明らかにしたと判断することができ、また、全部または一部の使用によって、ゲームサービス内での購入
 することができる基本的な単位が毀損された時にも、会社は、利用者が使用の意思を明らかにしたものと判断します。また、メッセージさと物など有料コンテンツの送受信に関する画面で受け入れなどの同意過程を経た場合、これは、利用者が
 使用意思を明らかにしたものと判断します。該当事項は、顧客の意図と異なるように他人を介して購入された場合も含まれています。
 5.利用者が実際に正常な購入履歴が記録されている利用代金の決済を通さずにゲームサービス中の補償に取得したり、会社が内部イベントもしくは外部連携イベントなどを通じて支給したコンテンツは、返金されません。
 6.申込撤回と払い戻しなどを要求する場合には、会社の顧客センターまたは会社が指定した委託業者に別の個人情報の取り扱いについて同意する過程を経た後、会社の購入履歴確認によって行われ、この過程の中で、プラットフォーム事業者、オープンマーケット
 事業者を介して購入履歴を確認する手順を経た次の行われます。同社は、この過程の中で、利用者の正当な契約撤回理由を確認するために、利用者から提供された情報を使用して利用者に連絡して、正確な事実確認
 を行うことができ、さらに証明を要求することができます。（例：プラットフォーム事業者に登録された個人情報、オープンマーケット事業者の購入や支払い履歴は、顧客の意図と異なるように他人を介して購入されたことが確認できる書類
 &lt;例：家族関係証明書&gt;など）
 7.次のような場合、有料コンテンツの契約撤回が制限されて、会社は契約撤回が制限される有料コンテンツについて、In-App決済前に契約撤回が制限を表示します。
 ①購入後すぐに使用が開始されたり、すぐにアプリケーションに適用される有料コンテンツの場合
 ②追加の利点が提供される有料コンテンツでは、追加の利点が使用されている場合
 ③セット型で販売された有料コンテンツの一部が使用されている場合
 ④開封行為を使用で見ることができたり、開封時に効用が決定されるカプセル型/確率型有料コンテンツの場合
 8.アプリケーションで販売されている有料コンテンツを未成年者が法定代理人の同意なしに、In-App決済した場合には、未成年者のまたは法定代理人は、In-App決済を取り消すことができます。ただし、未成年者のIn-App決済が法定代理人から
  処分を許された財産の範囲内である場合、または未成年者が詐術などを使用して、成年者に信じたときは、キャンセルが制限されます。有料コンテンツの購入者が未成年者であるかどうかは、In-App決済が行われた端末またはクレジットカードなど
 決済手段の名義を基準に判断されます。支払いのキャンセルを要求される場合、会社の必要に応じて、未成年者と法定代理人を証明できる書類を提出しなければならない。
 9.示す機能を介して行われたIn-App決済については、購入した有料コンテンツの欠陥がある場合を除いては、原則として請求のキャンセル及び払い戻しが不可能で、有料コンテンツの欠陥に起因する払い戻しはギフトを送った利用者に
 限り可能です。
 10.アプリケーションのダウンロードやネットワークサービスを利用して、発生する料金（例えば、通話料、データ通信料など）は払い戻し対象から除外されることがあります。
 
 
 第13条[間違いの金の返金]
 
 
 
 1.会社の帰責事由間違いの金が発生した場合、間違いの金を利用者に返金します。ただし、利用者の責に帰すべき事由に間違いの金が発生した場合には、会社が間違いの金を返金するためにかかる費用を合理的な範囲内で、利用者に
 負担するようにすることができます。
 2.返金の手続きは、オープンマーケット事業者が提供する方法を実行します。したがって間違いの金が発生した場合には、利用者は、原則としてオープンマーケット事業者に対して払い戻しを要求したり、追加の支払いをしなければします。ただし、同社はオープンマーケット事業者の
 政策、システムに応じて、可能な場合、会社がオープンマーケット事業者に代わって、上記のような手続きを代行することもできます
 
 
 
 第14条[契約解除とサービス利用停止等]
 
 
 1.利用者は、いつでもサービスの利用を希望しない場合は、会員脱退を介して契約を解除することができます。脱退はすぐに処理され脱退時、利用者が保有しているコンテンツの情報は、すべて削除され、復元できません。
 2.会社は、利用者が次の各号の事由に該当する行為をした場合には、利用契約を解約するか、または期間を定めてサービス利用を停止することができます。
 ①サービス申込時に虚偽の内容を登録した場合
 ②サービスの運営を故意に妨害した場合
 ③他人のサービスIDとパスワードを盗用した場合
 ④サービスの安定的運営を妨害する目的で多量の情報を送信したり、広告性情報を送信する場合
 ⑤会社と利用者に被害を誘発させるウイルスプログラムなどを流布する場合
 ⑥その他、第6条利用者の主な義務項目に違反して会社のサービスに支障をきたすすべての場合
 3.前項の規定に基づいて利用契約を解約するか、中止する場合、利用者は、ダウンロードしたコンテンツを使用することができず、基支払ったコンテンツの購入代金やデータ通話料、月額サービス利用料などを返すことができません。
 
 
 第15条[損害賠償]
 
 
 1.会社は、会社が提供する無料サービスの利用に関連して、会社の故意や重過失により利用者に生じた損害に対してのみ、その損害を賠償します。
 2.会社が第三者との提携契約を結んで、利用者に個別のサービスを提供することにあり、利用者が第三者の利用規約に同意をした後、個々のサービスプロバイダの責に帰すべき事由により損害が発生した場合関連損害については、第3自己責任を
 ます。
 3.利用者がサービスを利用するにおいて行った不法行為、またはこの規約への違反行為により会社が当利用者以外の第三者からの損害賠償請求や訴訟をはじめとする各種異議申し立てを受けた場合、当利用者は、自分の責任と費用で
 会社を免責なければならず、会社が免責されない場合ごとに、利用者は、それによって会社に発生したすべての損害を賠償する責任があります。
 
 
 第16条[免責]
 
 
 1.当社は、展示会、出来事、天災、国家非常事態、解決が困難な技術的欠陥その他の不可抗力的な事由でサービスを提供することができない場合には、責任が免除されます。
 2.会社は、利用者の責に帰すべき事由によるサービスの停止/利用障害に対しては責任を負いず、会社は期間通信事業者等が、電気通信サービス等を停止したり、定期的に提供していないし、利用者に損害が発生した
 場合には責任が免除されます。
 3.当社は、事前に告知されたり、緊急に実施されたサービス用設備の補修、交換、定期点検、工事などやむを得ない事由でサービスが停止したり、障害が発生した場合について、会社の故意または重大な過失がない限り責任が免除されます。
 4.当社は、利用者がサービスを利用して期待するスコア、順位などを得られなかったことについての責任を負わず、サービスの折衷や利用で発生する損害等については、会社の故意または重大な過失がない
 責任が免除されます。
 5.当社は、無料で提供されるサービス利用と関連して、会社の故意または重大な過失がない限り責任を負いません。
 6.当社は、利用者のゲーム賞経験値、評価、アイテム、ゲーム上マネーなどの損失に対して、会社の故意または重大な過失による場合を除き、責任を負いません。
 7.当社は、利用者が本人の個人情報など（アカウント情報を含む）を変更して得る不利益と情報の喪失に対して会社の故意または重大な過失がない限り一切責任を負いません
 8.会社は利用者の端末環境により発生する諸問題や会社の帰責事由がないネットワーク環境により発生する問題に対して責任を負いません。
 9.当社は、利用者相互間または利用者と第三者の間でサービスを媒介に発生した紛争について介入する義務がなく、これによる損害を賠償する責任もありません。
 10.会社は、関連法令、政府の政策等に応じてゲームサービスまたは会員によってゲームサービス利用時間などを制限することができ、これらの制限事項と制限に基づいて発生するゲームサービス利用に関する諸般事項については責任が免除さ
 されます。
 11.会社は「一時的利用者」が正式に「利用者」に加入していなく会社のサービスを利用するに応じて発生することができるすべての問題に対して責任を負いません。 「一時的利用者」にサービスを利用する場合は、次の各号の
 事由が発生サービス利用記録と取引履歴が削除されたり記録を確認することができない問題が発生する可能性があります。したがって、「会社」は、これらの事実について、最初のサービス利用時のポップアップなどでお知らせします。また、第3者が
 「一時的利用者」の端末情報を不正に操作し、利用してサービスを利用するに応じ結果に対しても弊社は責任を負いません。
 1.モバイル機器を変更した場合
 2.モバイル機器を改造したり、初期化した場合、
 3.モバイル機器では、アプリケーションなどのコンテンツを削除した場合
 
 
 第17条[テスト目的のゲームサービスの特例]
 
 
 1.会社は新しいゲームサービスを正式に商用化する前に、利用者を対象に、一定期間、テスト目的のゲームサービス（以下「CBT」とし）を提供することができます。
 2. CBTは、ゲームサービスの安定性などのために、ゲームデータの変更、追加、削除などが実施されることができ、これに関連して、リカバリ、利用時間の延長、損害賠償などの一切の補償は行われていないです。また、CBT期間中
 利用者が取得したアイテム、ゲームマネー、文字などは期間終了後の初期化されます。
 3. CBT中に予期しない問題が発生した場合には、会社は、予告なしにCBTを中止することができます。
 4. CBT期間は、会社のウェブサイトやアプリケーションを介して公知します。
 5.この規約の全体的な内容と、本条項の内容が解釈上の相互衝突した場合には、本条項の内容を優先して適用します。
 
 
 第18条[裁判権と準拠法]
 
 
 1.この約款に明示されていない事項が関係法令に規定されている場合は、その規定に従います。
 2.サービス利用で発生した紛争に対して訴訟が提起されている場合、法令に定められた手順に従った裁判所を管轄裁判所とします。
 3.会社と利用者間に提起された訴訟には大韓民国の法律を適用します。
 
 
 &lt;附則&gt;
 
 本規約は、2017年11月10日から施行されます。
			
			</pre>
			</div>
		</div>
			
		<div class="row" id="privacy" style="display: none; height: 80%;">
			<div class="col-12" style="padding: 0 2% 0 2%;">
			<pre style="height: 100%; margin: 0 auto; color: white; overflow-y: scroll; font-size: 0.5em;">


 1.個人情報の処理を目的（「http://www.kingofday.co.kr/「以下「KingofDay」）は次の目的のために個人情報を処理しており、次の目的以外の用途には利用できません。
  - 顧客の登録意思確認は、顧客へのサービス提供に伴う本人識別認証、会員資格を維持管理、物品又はサービスの供給に伴う金額の支払い、物品やサービスの供給。配送など



 2.個人情報の処理と保有期間

 ①（「http://www.kingofday.co.kr/「以下「KingofDay」）は、情報主体から個人情報を収集する際に同意いただいた個人情報保有？利用期間又は法令に基づく個人情報の保持？利用期間内で個人情報を処理？保持します。

 ②具体的な個人情報の処理、保管期間は次のとおりです。
 ☞下の例を参考にして、個人情報の処理業務と個人情報の処理業務の保有期間と関連法令、根拠などを記載します。
 （例） - 顧客登録と管理：サービス利用契約または登録解除時まで、ただし債権？債務関係残存時には、その債権？債務関係精算時まで
  - 電子商取引での契約？申込撤回、代金決済、財貨等の供給記録：5年



 3.個人情報の第三者への提供

 （「http://www.kingofday.co.kr/「以下」KingofDay）は、情報主体の独立の動き、法律の特別の規定など、個人情報保護法第17条に該当する場合を除き、個人情報を第三者に提供していません。



 4.個人情報の処理委託

 ①（「KingofDay」）は円滑な個人情報の業務処理のために次のように個人情報の処理業務を委託しています。

  - 委託を受ける者（受託者）：（株）キング・オブ・デイ
  - 委託する業務の内容：購入と料金決済、本人認証（金融取引、金融サービス）、会員制サービス利用による本人確認、クレーム処理などの請願処理、イベント、および広告性情報の提供や参加の機会を提供
  - 委託期間：1年


 ②（「http://www.kingofday.co.kr/「以下「KingofDay」）は、（は）委託契約締結時の個人情報保護法第25条の規定により委託業務目的外の個人情報の処理を禁止、技術？管理上の保護措置、再委託の制限、受託者の管理？監督、
 損害賠償等の責任に関する事項を契約書等の文書に明示し、受託者が個人情報を安全に処理するかを監督しています。



 4.個人情報の処理委託

 ①（「KingofDay」）は円滑な個人情報の業務処理のために次のように個人情報の処理業務を委託しています。


 5.情報​​主体の権利、義務、およびその行使方法利用者は、個人情報の主体として、次のような権利を行使することができます。

 ①情報主体は、（「サイトのURL」以下「サイト名）について、いつでも、次の各号の個人情報保護に関連する権利を行使することができます。
 1.個人情報の閲覧要求
 2.エラーなどがあった場合の訂正要求
 3.削除要求
 4.処理停止要求


 6.処理する個人情報の項目の作成

 ①（「http://www.kingofday.co.kr/「以下「KingofDay」）は、以下の個人情報の項目を処理しています。

  - 必須項目：電子メール、携帯電話番号、秘密の質問と答え、パスワード、ログインID、性別、生年月日、名前、趣味、社会保障番号、銀行口座情報、サービス利用記録、接続IP情報、決済記録
  - 選択項目：電子メール、携帯電話番号、パスワード、ログインID、性別、銀行口座情報、サービス利用記録、接続ログ、接続IP情報、決済記録



 7.個人情報の破棄（「KingofDay」）は、原則として、個人情報の処理の目的が達成された場合には、遅滞なく、その個人情報を破棄します。破棄の手続き、期限及び方法は次のとおりです。

  - 破棄手続き利用者が入力した情報は、目的達成後、別途のDBに移され（紙の場合別途の書類）内部方針及びその他の関連法令に基づいて一定期間保存された後、あるいは、すぐに破棄されます。このとき、DBに移された個人情報は、法律に
   による場合でない限り、他の目的に利用されません。 - 破棄期限、利用者の個人情報は、個人情報の保有期間が経過した場合には、保有期間の終了日から5日以内に、個人情報の処理目的達成するため、これらのサービスの廃止、
   事業の終了など、その個人情報が不要になったときには、個人情報の処理が不要なものと認められる日から5日以内に、その個人情報を破棄します。



 8.個人情報の安全性確保措置（「KingofDay」）は、個人情報保護法第29条の規定により、次のように安全性の確保に必要な技術的/管理的および物理的な対策をしています。

 1.定期的な自己監査実施
 個人情報の取扱いに関する安全性の確保のために、定期的（四半期に1回）で自己監査を実施しています。

 2.個人情報の取扱いの従業員の最小化と教育
 個人情報を扱う職員を指定して、担当者に限定させて最小化して、個人情報を管理する対策を実施しています。

 3.内部管理計画の策定と実施
 個人情報の安全な処理のために、内部管理計画を策定して実施しています。

 4.ハッキングなどに備えた技術的対策
 &lt;（株）キング・オブ・デイ&gt;（「KingofDay」）は、ハッキングやコンピュータウイルスなどによる個人情報の流出や毀損を防ぐために、セキュリティプログラムをインストールして、周期的な更新？検査をし、外部からのアクセスが制御された区域にシステムをインストールして
 技術/物理的に監視および遮断しています。

 5.個人情報の暗号化
 利用者の個人情報は、パスワードは暗号化され保存および管理されており、本人だけが知ることができ、重要なデータは、ファイルや転送データを暗号化したり、ファイルロック機能を使用するなどの別途セキュリティ機能を使用しています。

 6.接続記録の保管と偽変造防止
 個人情報の処理システムに接続した記録を少なくとも6ヶ月以上保管、管理しており、接続記録が偽造・変造、盗難、紛失されないようにセキュリティ機能を使用しています。

 7.個人情報へのアクセス制限
 個人情報を処理するデータベースシステムへのアクセス権の付与、変更、および抹消を通じて個人情報へのアクセス制御のために必要な措置をしており、侵入遮断システムを利用して、外部からの不正なアクセスを制御して
 ています。

 8.ドキュメントのセキュリティのためのロックの使用
 個人情報が含まれている書類、補助記憶媒体などをロックできる安全な場所に保管しています。

 9.非認可者のアクセスコントロール
 個人情報を保管している物理的な保管場所を別に置いてこれに対してアクセス制御手順を確立し、運営しています。


 9.個人情報保護責任者を作成


 ①（株）キング・オブ・デイ（「http://www.kingofday.co.kr/「以下」KingofDay）は、個人情報の処理に関する業務を総括して責任を持って、個人情報の処理と関連した情報主体の苦情や被害救済などのために下記のように個人情報保護責任者を指定しています。


 ▶個人情報保護責任者
     氏名：バクガンヨウン
     役職：CEO
     職級：CEO

    コンタクト：02.536.1300、kingofdayinc@gmail.com、02.536.1301
    ※個人情報保護担当部署に接続されます。


 ▶個人情報保護担当部署
     部署名：
     担当者：
     コンタクト：、、
    ②情報主体は（株）キング・オブ・デイ（「http://www.kingofday.co.kr/「以下」KingofDay）のサービス（または事業）を利用しながら発生したすべての個人情報保護に関するお問い合わせは、苦情処理、被害救済等に関する事項を個人情報保護責任者及び担当部署に連絡することができます。 （株）キング・オブ・デイ（「http://www.kingofday.co.kr/「以下」KingofDay）は、情報主体のお問い合わせについては、遅滞なく回答し、処理せ続ける。



 10.個人情報の処理方針の変更

 ①この個人情報の処理方針は、施行日から適用され、法令及び方針に沿って変更の追加、削除、および訂正がある場合には、変更の実施7日前からお知らせを通じて告知します。


			</pre>
			</div>
			</div>
		</div>
</div>


<script>
$("#tosBtn").on("click", function(){
	$("#tos").show();
	$("#privacy").hide();
	$("#tosBtn").attr("src", "/webView/img/common/tos/jp/tos_btn_on.png");
	$("#privacyBtn").attr("src", "/webView/img/common/tos/jp/privacy_btn.png");
})

$("#privacyBtn").on("click", function(){
	$("#privacy").show();
	$("#tos").hide();
	$("#tosBtn").attr("src", "/webView/img/common/tos/jp/tos_btn.png");
	$("#privacyBtn").attr("src", "/webView/img/common/tos/jp/privacy_btn_on.png");
})

</script>
</body>
</html>