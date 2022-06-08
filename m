Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CBC433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Jun 2022 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PF4+vRrW1y6cffoN6XG4HlJWMVdxc6U0zs0sKM4lIAg=; b=ksewSw8NVA9cmH
	nk/wBaPwydw3hr66eTu238EXnp8GdP1ORRjeuJavwsqdD75X+0Ht3CfMMyZipi64DZRwsnxEkAYXJ
	oj5JY2TEGCYM5ROlYnvK4D/W1RM+Ys/j966gEKfCjm554kIhBaO9JtemF5jm8+rt72EBvkG4MJYCt
	ZPC/mmghYz1NhF3PtzZRBeaSldHwYpklRl2+1Yp6yJ6d/zgH/3q86HnOgmUj9srZ/kllQVR2tKUt6
	5+v5taAjci+Gz63komPiRzfDWs9T4+hbH6lJgTZScDn62ONeH4m/coZ94sGLfNic5gvz4h4e6AGMl
	TBvg43DcGpmbi6X3KivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysvC-00CkUb-3c; Wed, 08 Jun 2022 10:28:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyslE-00CgMN-VF
	for ath10k@lists.infradead.org; Wed, 08 Jun 2022 10:18:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42F8361A05;
	Wed,  8 Jun 2022 10:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB81C34116;
	Wed,  8 Jun 2022 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654683479;
	bh=IMewlYaCpOf5euEAVJNf7mIjnq7SaRTV0BHoA2v0z0U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HO6qlWr1xR3L2xrmt2btzTfMviVwQYZw5giS5C9az8gbeULFhhnJfqvBrRV7TMhwa
	 nvAtVJW9r8ZG7a48sSDUwCkS+daDzgQlezxxicys+p3a2zFmTyJ7FltRAdu94yVau7
	 Het8keVVx+perrKbTbHDW17AL3tZsAq6cdd7rCvRMd/wZi2pToI6jV9DRpnlYTp7CN
	 hEDL6YnH2PVKbLfzkJmyxaMbfaXxrvw+PUMznEBtXIqhULd9o/39/joPgBj6e4ISPT
	 GCb6360h8yRIOCEJmiTNKUW5c6hBs/8CU+iWpsSt5ZmdJg2Sd5c8B2eo2pp2OBsc0a
	 b+dqpTb79qBzQ==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Nicol=C3=B2?= Sprea <nsprea@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: Firmware 4 vs Firmware 6 for QCA6174 hw3.0
References: <CA+BgFQXJr2FFdS5wK=it=sKck3htDXFFO50Px=scvL62xh41bw@mail.gmail.com>
	<87k09rr7bl.fsf@kernel.org>
	<CA+BgFQV+H+YnTFhOG+d5GtWC7ZDzu8fh6S+K6wF4a5fhOP5Jmg@mail.gmail.com>
	<87fskfr462.fsf@kernel.org>
	<CA+BgFQXH7FsSO6ZuGNcddm+0iyP+NEW77Tr-dtaDvOQC3ri+qg@mail.gmail.com>
Date: Wed, 08 Jun 2022 13:17:55 +0300
In-Reply-To: <CA+BgFQXH7FsSO6ZuGNcddm+0iyP+NEW77Tr-dtaDvOQC3ri+qg@mail.gmail.com>
	(=?utf-8?Q?=22Nicol=C3=B2?= Sprea"'s message of "Wed, 8 Jun 2022 11:16:47
 +0200")
Message-ID: <87y1y7pigc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_031801_081984_BEE9DD45 
X-CRM114-Status: UNSURE (   9.83  )
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

Tmljb2zDsiBTcHJlYSA8bnNwcmVhQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiAjIFVzaW5nOgo+IGRy
aXZlcjogYXRoMTBrX3BjaQo+IHZlcnNpb246IDQuMTUuMC0zOC1nZW5lcmljCj4gZmlybXdhcmUt
dmVyc2lvbjogV0xBTi5STS40LjQuMS0wMDA3OS1RQ0FSTVNXUFotMQo+Cj4gIyBQcm9ibGVtOgo+
IFdoZW4gd3BhX3N1cHBsaWNhbnQgcmUtYXNzb2NpYXRlcywgSSBnZXQgdGhlIGZvbGxvd2luZyBp
c3N1ZToKPiBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogZmFpbGVkIHRvIGZsdXNoIHRyYW5zbWl0
IHF1ZXVlIChza2lwIDAgYXItc3RhdGUgMSk6IDAKPiBhbmQgYWxsIHRoZSBpbnRlcmZhY2VzIChp
bmNsdWRpbmcgbG9vcGJhY2spICJmcmVlemUiIGZvciBhIGZldyBzZWNvbmRzLgo+Cj4gIyBTb2x1
dGlvbnM6Cj4gMS4gdXNpbmcgZmlybXdhcmUgdmVyc2lvbiBXTEFOLlJNLjIuMC0wMDE4MC1RQ0FS
TVNXUFotMQo+IDIuIGJhY2twb3J0aW5nIGRyaXZlcgoKdjQuMTUgd2FzIHJlbGVhc2VkIGZvdXIg
eWVhcnMgYWdvIHNvIGZvciB1cyBpdCdzIGFuY2llbnQuIEkgcmVjb21tZW5kCnVwZGF0aW5nIHRo
ZSBrZXJuZWwgb3IgdXNpbmcgYmFja3BvcnRzIHByb2plY3Q6CgpodHRwczovL2JhY2twb3J0cy53
aWtpLmtlcm5lbC5vcmcvaW5kZXgucGhwL01haW5fUGFnZQoKLS0gCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVz
cy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdw
YXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
