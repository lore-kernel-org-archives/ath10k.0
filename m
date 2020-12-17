Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C864C4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 09:36:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21358236F9
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 09:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21358236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mFaAZluPz5rmjwTJmcy2gj7mNnPkrnAqkUeyX1wtTEM=; b=zqzCG2A+myLPSLoHfWPMNYCkD
	xM0uyJhyf28fidwFMS2MqMsdx2J+pd1uCFhJrsic6ygcsB4rTEl0CnaaLD92XfBFOS2bdxrI4FzGh
	uuWCB7LqZRXVQ39it7iqrkrX51hwke/sjDe6KcrPPO4jxzA76avabH5CzhIu98r5XyVHKHi+4KBLf
	VS7HwWMRO+yux+sjU7VBP87zFttnhgUjftSrdEDGJnMmB6mJK2i7NFd+di5Z+nI+Z20ZwstA8m0/o
	ApVA6kX/rEW/jCuUMv5H9CFSGg9HtHZlnuHZ7TiYKCVmD2UNDjtqpIEgNwVa7ML0PSfpJEEtitEud
	PQQUXy8gA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpphH-00023n-G4; Thu, 17 Dec 2020 09:35:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpphF-00023P-L8
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 09:35:42 +0000
Date: Thu, 17 Dec 2020 10:35:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608197740;
 bh=5kWZ0QEwHk5zG6G+jZNPusICr/3y0G9zUD7KzfJxWTM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=f08QVvu7hQs+JlUXIdl/nFBQaU3l27xv7Ugf6voXjI3265ElPL8tcFPk7KhnGTD13
 0V1BW8onjULJaFe0zCGsUMjFAnOxfzQfvIn8k0+of9IY38zSVVE6/5Wrgq100Ls/PF
 H38PuGHa5zl3CKyCYigR+OvCyURRd7FtFwjMCB4uogl6l8TjpIeqLIsM21nWrTlr4u
 kuA6+TzQ7aqWgzATe8fY8a6WAaxdzCHmVIosqouco1k/0q/BGa3s+v/Jc9b8CvyPeG
 k2vLHmD4I35HcSbbgSiMsbaopyInPtY7ETI4PlycONsCb/L6iTCXedJfdxg4RaN68P
 TitD5z9O2xQNA==
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Jouni Malinen <j@w1.fi>
Subject: Re: CVE-2020-3702: Firmware updates for ath9k and ath10k chips
Message-ID: <20201217093537.w22c7a2jeivt763e@pali>
References: <20200810090126.mtu3uocpcjg5se5e@pali>
 <20200812083600.6zxdf5pfktdzggd6@pali> <87lfik1av8.fsf@toke.dk>
 <20200812092334.GA17878@w1.fi>
 <20201007082502.3da6rw2bkudilqaq@pali>
 <20201207140438.as2i7kwquhdxqn53@pali>
 <20201214174149.GA18899@w1.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214174149.GA18899@w1.fi>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_043541_792487_A515426C 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Kalle Valo <kvalo@codeaurora.org>,
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com,
 ath10k@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gTW9uZGF5IDE0IERlY2VtYmVyIDIwMjAgMTk6NDE6NDkgSm91bmkgTWFsaW5lbiB3cm90ZToK
PiBPbiBNb24sIERlYyAwNywgMjAyMCBhdCAwMzowNDozOFBNICswMTAwLCBQYWxpIFJvaMOhciB3
cm90ZToKPiA+IEhlbGxvISBIYXMgc29tZWJvZHkgZml4ZXMgdGhpcyBzZWN1cml0eSBpc3N1ZSBp
biBhdGg5ayBkcml2ZXI/IEFib3V0Cj4gPiA0IG1vbnRocyBwYXNzZWQgYW5kIGlmIHRoaXMgaXNz
dWUgaXMgbm90IGZpeGVkLCBjb3VsZCB5b3UgcGxlYXNlIHNoYXJlCj4gPiBhdCBsZWFzdCBpbmNv
bXBsZXRlIC8gV0lQIHBhdGNoZXM/IEkgd291bGQgbGlrZSB0byBsb29rIGF0IGl0IGFuZCBoYXZl
Cj4gPiB0aGlzIGlzc3VlIGZpbmFsbHkgZml4ZWQuCj4gCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvP3Nlcmllcz00MDE2ODUKClRoYW5r
IHlvdSEgSSB3aWxsIGxvb2sgYXQgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
