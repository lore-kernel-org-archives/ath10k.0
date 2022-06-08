Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B11C433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Jun 2022 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgkx0lgWu17u1xPmvnwoyrzBbIWOZJo3jhr85Hjh4kY=; b=cfLYntrxqhw20v
	gB4zT06Yp8CQ/IgerV3EKB6v7ii0xQqRlMSXtfqmIzXNnJIaiIlgwpouRFMzJ/Y38dWSRjPfiWsDj
	kdT4vfhWRLePskJ8GrLe53gaxXMTfZSNi5oKmryre+Nkr8zqV37Nl3qwFdituYKTl81mFiEh2SVXd
	KdcANRnZEpyautmyIPY3/zxtSdb+s5SIMuzP2cy4IdfudM7GK3QuHT72pbqH8dfl+/dDhuKu3bLga
	Tfa8V+oHXRpW07Z9vVatqGYI86azgfoM7N/vP5y/kEPXVXF3MtS3G7MX+EVLpp4BW0hGyZZTEW+CH
	mY5uUDNAXf/NKLS7g3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqLt-00Bhsl-Mj; Wed, 08 Jun 2022 07:43:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqLq-00Bhp4-LV
	for ath10k@lists.infradead.org; Wed, 08 Jun 2022 07:43:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE7E360B41;
	Wed,  8 Jun 2022 07:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FD3C34116;
	Wed,  8 Jun 2022 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654674217;
	bh=sw4rc+hvMEAbMywczDHoeM3y4SoZW35kRuYudCcfPNo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UGZ0ogWDXJRboaz5RgCaeTCk/2JszKiRlqTXqMq463YuG0PZUVaT0z9+B+ZCRLoEK
	 8hsvTi0JYw9mwibVGXaBindeJbUcqBG5y6nNviE+GoSuH5EAeRcfrI5jbNHuOyExHw
	 Bw34GdAInpE01nSYKLdS+TNmCVgQF5Wgal2Ms0WxwaUKssZ4Yy1vsKwZf0jBfW0S/k
	 dXYVqb4h6Vx0XZnKxpxLv45AvjJY0wRDHzE6ZtoxEhl7Dbi9rSno80per70rCZFS2F
	 4f/GyABEFBt3t41hoZCH1rt7gkh1okUtEJeoJ933HIq+o1AZvyMACwk7RuPsJtsUZZ
	 TeUjADVZUo0ag==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Nicol=C3=B2?= Sprea <nsprea@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: Firmware 4 vs Firmware 6 for QCA6174 hw3.0
References: <CA+BgFQXJr2FFdS5wK=it=sKck3htDXFFO50Px=scvL62xh41bw@mail.gmail.com>
	<87k09rr7bl.fsf@kernel.org>
	<CA+BgFQV+H+YnTFhOG+d5GtWC7ZDzu8fh6S+K6wF4a5fhOP5Jmg@mail.gmail.com>
Date: Wed, 08 Jun 2022 10:43:33 +0300
In-Reply-To: <CA+BgFQV+H+YnTFhOG+d5GtWC7ZDzu8fh6S+K6wF4a5fhOP5Jmg@mail.gmail.com>
	(=?utf-8?Q?=22Nicol=C3=B2?= Sprea"'s message of "Wed, 8 Jun 2022 08:43:17
 +0200")
Message-ID: <87fskfr462.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_004338_758936_60213E20 
X-CRM114-Status: GOOD (  11.60  )
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

Tmljb2zDsiBTcHJlYSA8bnNwcmVhQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBUaGFua3MgZm9yIHRo
ZSBhbnN3ZXIuCj4gSXMgdGhlcmUgYW55IGZlYXR1cmUgdGhhdCB1c2VzIG9ubHkgYXBpIDY/Cj4g
SWYgSSB3YW50IHRvIGRvd25ncmFkZSB0byBhcGkgNCwgaXMgdGhlcmUgYW55dGhpbmcgdGhhdCBJ
IHNob3VsZCBwYXkKPiBhdHRlbnRpb24gdG8/CgpUaGUgaW50ZXJmYWNlIG51bWJlciBpdHNlbGYg
ZG9lcyBub3QgY2hhbmdlIGFueSBmdW5jdGlvbmFsaXR5LCB3aGF0Cm1hdHRlcnMgYXJlIHRoZSBh
Y3R1YWwgZmlybXdhcmUgcmVsZWFzZSB2ZXJzaW9ucy4gQW5kIG9mIGNvdXJzZSBvbGRlcgpmaXJt
d2FyZSByZWxlYXNlcyBoYXZlIG1vcmUgYnVncyBhbmQgbGVzcyBmZWF0dXJlcy4gSXQgd291bGQg
YmUgZWFzaWVyCmZvciBwZW9wbGUgdG8gaGVscCBpZiB5b3UgZGVzY3JpYmUgd2hhdCdzIHRoZSBh
Y3R1YWwgcHJvYmxlbSB5b3UgYXJlCnRyeWluZyB0byBzb2x2ZS4KCi0tIApodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2ly
ZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0
aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
