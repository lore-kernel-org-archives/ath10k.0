Return-Path: <SRS0=NYaa=LG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43B2C48BCF
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 10:38:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864B461376
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 10:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 864B461376
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbSx3b32vOJfPfvInK8Zu2QmJSXLDAvqAfRfsU3KzZk=; b=px06TGHsMRmec6
	nYFyxqeQ7ono480LLBAdLntRIRtyH+h25nMI2s9pztpAdEX3k7dhCS6uFMcIg9ty+tiS3zOTrTpGJ
	D4wx36y7hz9URu3L6g75zrqXTVMxdXwepE+aloj1r9m0Y8Kg/qPZ8F7188sv5QGOoaFUDdMYpITF9
	zNMyhOE7FlogTDeHMd1eMwOTD55CbE/5gYl5cYtyHXHTXNTNBRq4DoHx7mENjoYKFHyYZD/iMzSaw
	ycjXA6beGMGjVsvzuVQWDLq91fPoazpDT5dZCAIUf3EmjqNQRqP6Jxp6K7Jk44V9//I3zpw1LLgRM
	Wwaog/AqZ0SQn6F571SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls12G-008IeX-3X; Sat, 12 Jun 2021 10:38:40 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls12C-008Ie1-Mj
 for ath10k@lists.infradead.org; Sat, 12 Jun 2021 10:38:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623494317; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=VrXPNpDv7WacuPMGlLje+hrxsCRRKU7x5OH9JHGdD/E=;
 b=D1qWpQqaO2yWwGDHUkkcHmyxp7s3V0fuTWESrNwr3NCZTCESVYk6bg9bjis7cxRI4L9M9F3+
 xGiwbUq4hU9ZXoGvYruKme315czd9FyclsE5Kc6Eo3v7AwlSinICDbBOBwQ8jTa9QV1OEBLi
 WVrLvyflnbsZts1hlAZG9a1AP7g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60c48eab2eaeb98b5e733992 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Jun 2021 10:38:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 018C4C4338A; Sat, 12 Jun 2021 10:38:35 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D0B9C433D3;
 Sat, 12 Jun 2021 10:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D0B9C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH -next] ath10k: Fix W=1 build warning in htt_rx.c
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210526142219.2542528-1-yangyingliang@huawei.com>
References: <20210526142219.2542528-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
 <davem@davemloft.net>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210612103835.018C4C4338A@smtp.codeaurora.org>
Date: Sat, 12 Jun 2021 10:38:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_033837_315181_11F7509F 
X-CRM114-Status: UNSURE (   6.71  )
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

WWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IEZpeCB0
aGUgZm9sbG93aW5nIFc9MSBidWlsZCB3YXJuaW5nOgo+IAo+ICAgZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9odHRfcnguYzoxNzkwOjc6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmG1vcmVf
ZnJhZ3PigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAg
ICAxNzkwIHwgIGJvb2wgbW9yZV9mcmFnczsKPiAgICAgICAgIHwgICAgICAgXn5+fn5+fn5+fgo+
IAo+IEZpeGVzOiBhMTE2NmIyNjUzZGIgKCJhdGgxMGs6IGFkZCBDQ01QIFBOIHJlcGxheSBwcm90
ZWN0aW9uIGZvciBmcmFnbWVudGVkIGZyYW1lcyBmb3IgUENJZSIpCj4gUmVwb3J0ZWQtYnk6IEh1
bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWWluZ2xp
YW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS2FsbGUgVmFs
byA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+CgpQYXRjaCBhcHBsaWVkIHRvIGF0aC1uZXh0IGJyYW5j
aCBvZiBhdGguZ2l0LCB0aGFua3MuCgplMGE2MTIwZjY4MTYgYXRoMTBrOiByZW1vdmUgdW51c2Vk
IG1vcmVfZnJhZ3MgdmFyaWFibGUKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMTA1MjYxNDIyMTkuMjU0MjUyOC0xLXlhbmd5
aW5nbGlhbmdAaHVhd2VpLmNvbS8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2Vu
L2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
