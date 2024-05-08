Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4865C04FFE
	for <ath10k@archiver.kernel.org>; Wed,  8 May 2024 17:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Date:Message-ID:Mime-Version:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=549Rgks9EqLznkeSdpcU0wAalVY/u1t/5acxQIbRL0g=; b=v+ErL1+20ki89YPfu9xOatdQg8
	rfuchzXquJHtxmcR+NcPkKEpMJiqOUTe2tffSn1uWgtkrBjnzFkyueIYmZ4Patuvv1Kv65c26FqRa
	XWJhUNRgTVSS91PSUpNEvP0tTMo/JOA4Yi2WnmD0baSTgONZZuTrV7idObtEJfhmdSlG1bHUYOlW/
	ZaVmsb0vEiOxKb2vndIPdqdQMuaWKbUkKoxD8GyJ7U9/o9Prim9Cmgqovwa3r4p2hP3FR9MBKKB8e
	wEUrEZL36LsvO2tkNev1i3VSsmMKtNFWs1aJqtClgrk8BmgTbuD97BjxyHyH8eDq/e1vPP9IzvXdn
	PmXuz8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kzD-0000000GLLt-2j6P;
	Wed, 08 May 2024 17:21:47 +0000
Received: from [104.143.35.198] (helo=mail0.jv561.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kz1-0000000GLII-0z3O
	for ath10k@lists.infradead.org;
	Wed, 08 May 2024 17:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=jv561.com;
 h=From:To:Subject:Mime-Version:Message-ID:Date:Content-Type:
 Content-Transfer-Encoding; i=no-reply@jv561.com;
 bh=549Rgks9EqLznkeSdpcU0wAalVY/u1t/5acxQIbRL0g=;
 b=C5CVpDXjVBiFI/svdkVhkGw76YZFzvXgTlYJw4eHY7DPNqTOTD/3q7qT+xvy+CNOMGNyRCtb2NV9
   AoqQixmNIwXaFXopMqSbio5hR1MJyQlKQ7aeDURjKXGXzyjOpqhZv7hk/zjjkmIiuWg58ahhW9hX
   w5azoAPMOzKB7W28Md8=
From: =?utf-8?B?6Ieq5YuV44Oh44O844Or6YCB5L+h?= <no-reply@jv561.com>
To: =?utf-8?B?YXRoMTBr?= <ath10k@lists.infradead.org>
Subject: =?utf-8?B?44CQ5LiJ5LqV5L2P5Y+L44Kr44O844OJ44CR44GU5Yip55So?=
	=?utf-8?B?5YaF5a6544Gu44GK55+l44KJ44Gb?=
Mime-Version: 1.0
Message-ID: <tencent_01A8D5A85AFC957DC11379AC@jv561.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-QQ-Mailer: QQMail 2.x
Date: Thu, 09 May 2024 01:11:21 +0800
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_102135_785856_C9399EEE 
X-CRM114-Status: UNSURE (   2.01  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

三井住友カードをご利用のお客様へ

このたびは三井住友カードをご利用いただき、誠にありがとうございます。
下記のご利用照会がございましたので、お知らせいたします。

※本メールは、ご利用・請求を確定するものではありません。
ご利用日時：2024/05/08      23:18
ご利用場所：セブン-イレブン 千代田一ツ橋 3 丁目店
ご利用金額：16, 580円

カードを使用した覚えがない場合は、以下 の リ ン ク をクリ ッ ク し てカ ー ド使用の詳細を確認してください。
https://fjhealthy.com

＜ご注意点＞
本サービスは、お客様の三井住友カードのご利用照会が行われた場合、
三 井 住 友 NETにご登録いただいているメールアドレスへお知らせするサービスです。
——————————————————————
■発 行 者■
三井住友カード株式会社
〒135-0061
東京都江東区豊洲2丁目2番31


