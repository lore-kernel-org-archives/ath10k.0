Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A500FC433EF
	for <ath10k@archiver.kernel.org>; Tue, 30 Nov 2021 00:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:From:Date:
	Subject:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tUEmcvdicPRyQI4BK7ZOZ9gcw2pPqRbLNO/AGLbiK2E=; b=MpUbXUXZxrl3Om
	9YXblTOtW3nmfQKrr0VnkloRnNhdTxY6frw2wUTdPTEjhOVUrxiHGBzAewbtpYcXBvQuPxiUxaucY
	99V1GqbZ2FSrpFuKw+979DP6//tuWwBeRUZvo6GMqaiNnRAezV4IficU/hoM0Hl26zX1ukOc6ysnY
	nVP2nHQR9J+DNKnU6AfvoYRPD0IPNQhi/11BLmZzWIxwAnUKdRL92vJno08u9XIIUzhVyyM4JgSuz
	3lgNNsHnPAMH9eIPZ+pNUC/+oyMupemQ/r3nPY2l7nSlmU8JuqAFNXI6auuyfiQpraNLILEVhAaKi
	MBO/60OrFcXIAfC6mOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrrQU-003Dr9-Ex; Tue, 30 Nov 2021 00:55:18 +0000
Received: from spd005.phy.lolipop.jp ([163.44.185.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrrQR-003DqC-S9
 for ath10k@lists.infradead.org; Tue, 30 Nov 2021 00:55:17 +0000
Received: by spd005.phy.lolipop.jp (Postfix, from userid 707)
 id 967131C07F21D; Tue, 30 Nov 2021 09:55:09 +0900 (JST)
To: ath10k@lists.infradead.org
Subject: =?UTF-8?B?SGlyYWNvbyjjg5Ljg6njgrPjg7wp44CA44GK5ZWP5ZCI44Gb44GC44KK?=
 =?UTF-8?B?44GM44Go44GG44GU44GW44GE44G+44GZ?=
X-PHP-Originating-Script: 985043:class-phpmailer.php
Date: Tue, 30 Nov 2021 00:55:09 +0000
From: =?UTF-8?B?5qCq5byP5Lya56S+44OS44Op44Kz44O8?= <info@hiracoo.com>
Message-ID: <c448bd884678414ddafe6cd28138bfbb@hiracoo.com>
X-Mailer: WPMailSMTP/Mailer/mail 2.2.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_165516_065521_86B7A1AB 
X-CRM114-Status: UNSURE (   0.94  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSGlyYWNvbyjjg5Ljg6njgrPjg7wp
44GuSFDjgojjgoroh6rli5Xov5Tkv6EKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KCuKdpO+4jyBBbGljZSB3YW50IHRvIG1lZXQgeW91ISBDbGljayBIZXJlOiBodHRwOi8vYml0
LmRvL2ZTSnpSP3J1eXo1IOKdpO+4j+OAgOanmAoKCgpIaXJhY29vKOODkuODqeOCs+ODvCnjgbjj
ga7jgYrllY/lkIjjgZvjgYLjgorjgYzjgajjgYbjgZTjgZbjgYTjgb7jgZnjgIIK5Lul5LiL44Gu
5YaF5a6544Gn44CB44GK5ZWP44GE5ZCI44KP44Gb44KS5Y+X44GR5LuY44GR44G+44GX44Gf44CC
CuWGheWuueOCkueiuuiqjeW+jOOAge+8k+WWtualreaXpeS7peWGheOBq+OBlOeZu+mMsuOBruOD
oeODvOODq+OCouODieODrOOCueOBq+WbnuetlOOBhOOBn+OBl+OBvuOBmeOAggrjgojjgo3jgZfj
gY/jgYrpoZjjgYTjgYTjgZ/jgZfjgb7jgZnjgIIKCuOAkOWVj+WQiOOBm+WGheWuueeiuuiqjeOA
kQrjgYrllY/lkIjjgZvpoIXnm67vvJrjgZ3jga7ku5YK5Lya56S+5ZCNL+Wbo+S9k+WQje+8muKd
pO+4jyBBbGljZSB3YW50IHRvIG1lZXQgeW91ISBDbGljayBIZXJlOiBodHRwOi8vYml0LmRvL2ZT
SnpSP3J1eXo1IOKdpO+4jwrjgYrlkI3liY3vvJpsaGxnem4K44Oh44O844Or77yaYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcK6Zu76Kmx77yaNDMwNjk2OTY1MjMyLTQzMDY5Njk2NTIzMi00MzA2
OTY5NjUyMzIKCuOBiuWVj+WQiOOBm+WGheWuue+8mgpmcWN0d3M1ZQoKCgrilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIAK5qCq
5byP5Lya56S+44OS44Op44Kz44O8KEhpcmFjb28gQ28uLCBMdGQuKQrnpo/lsqHnnIznpo/lsqHl
uILkuK3lpK7ljLrpq5jnoIIxLTIwLTE4IOODkuOCqOODgOODh+OCtuOCpOODs+ODk+ODqzNGClRF
TO+8mjA5Mi00MDYtOTkzNwpGQVjvvJowOTItNDA2LTk5NDAKRS1tYWls77yaaW5mb0BoaXJhY29v
LmNvbQrllrbmpa3mmYLplpPvvJoxMTowMH4xODowMCAo5bmz5pelKQrilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
