Return-Path: <SRS0=Yrnq=KS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E42FC4707F
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 02:19:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E7D600D1
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 02:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E7D600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjPvlg4fxwwJBHXsEMiFhN3Rd8Uyv6zNuKMpn5LhfWc=; b=bQDZTSd7yHmpuL
	g0Eb0XYt071JXx7G09Twj3qlR1HRQ8ieQPpF2YQXWAZgWwNXwf8aarom1yNv8JTH7Yx/SfUW8kaKB
	AFS2sxQ/28bDildy5xCfoU7iwe44UzneMLAhNFkuJNvJ4TTPy35SMnpDdOlw+nwQbRYffHi4tCp/I
	y9erwCVKM/DpNNKRSMjwEOp5BSs44FEB/amszo1enllHZBXkeCZEesN+SOBunZ2eDhQSbmbPJtQbF
	ho7wCyfZ+/9FEWfzW82hrUAEaar+MWkPpFDuNoMcKs4DzJCk5uJlOZjjz6u0RERPl5mNKh4OGsqsR
	lNpfHNFT8Qpnbb2ycddw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkdhl-003XOt-N0; Sun, 23 May 2021 02:19:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkdhi-003XMb-Gy
 for ath10k@desiato.infradead.org; Sun, 23 May 2021 02:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=3ltlV64S2Usa3ghD5aJRBnBk66hdDjJnS+6Lasj2RQU=; b=OBxMiVSS4jMA0VklnM2R9bHPcz
 +VzidT0Q9HSdSsi+ZEn5cElgN+/A5irsnQq8C0uhE4fu3U3gzP6rCZwsmJpX9zmnsS7Gbr3BJBE/f
 6+JcwOTaj1Zg8NKbZUOqPhszr8gVmsqFIZFbU0oE7tG1n3BQIebA97FTSd0n2MQ24UsswpjdAOlix
 37idamhFuht0a0aTHpZ4Ty0M0pT2yoRiOGTiYHfFu0h7mvgt8CyySkmRLoyslUs0XadxOw8SQabUP
 gsf0QPfm6cpZ6WpWiL7yW7VRsg8ACLfaXhhzGj/bqqJ4xU19OWgtaqXtYjZGiZQ+di+8RFvfCJCn4
 m9oftGuA==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkdhf-000HLT-NQ
 for ath10k@lists.infradead.org; Sun, 23 May 2021 02:18:57 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so21792329otc.12
 for <ath10k@lists.infradead.org>; Sat, 22 May 2021 19:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=3ltlV64S2Usa3ghD5aJRBnBk66hdDjJnS+6Lasj2RQU=;
 b=hAjyxF8KkT5O1u7IdIQhP4CzHT4vBgkuwk4UkM0DFkPezDgp91y3rFDaMHo0gx8a+p
 +emcFszRxoq7yBH1XEE6tLyk58xXaVNEecEfehI4u02uKDmVspERepg5+OJrxzFCFcpJ
 ycScp9rQQ0ZNGmCn/oTCaiPIRltl0Nb0Blx6k+hoDVp9MSKXnExUmaB95Yc3u0se8xDY
 F4sJAWNe7gi7DNQSdEEzMXRGVAkdXoHDfTTkOjX/ZtLPwsSzjmyDD+mtYi8zdNRzwfe1
 +FU3eVnsLs1SlEKHLtOJcDluq9Y9HVDIHBnheP7Dmy7rObUjIYn5vwd03Z0GG/0pnsGd
 2ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=3ltlV64S2Usa3ghD5aJRBnBk66hdDjJnS+6Lasj2RQU=;
 b=STFZIxBgLp2N+33acskpIh3umPWUg/2i0A+t01m65lPqhZQ1UU8IsbrOS60xLtkAUv
 rZoeFAPDBb3O9ELIDMNBMjnsvh6UOZvCeQ2WgS8iRoMOE79pujZkB8XVtAABpV0Ov/iR
 3KG8zfqpx68i2oqyn4LFZgjPqslz7OQ6Z9er6d2miR7C0SeNykAXOfcrQxp2yYnez2rU
 RjaTyPicMvgpp1s/qqqQ555x9Hp9miq/5+pbDtYFtObs9XcN+vdG4Aqk/mDAWi2lcKmZ
 MGgTZtTPLXDnfaO5SYvcnhXejY4GlpaKZwGV0yQGNokCvWOWO1QDM0WAgRgYPWMeM+Aq
 sWAw==
X-Gm-Message-State: AOAM531VEZ8umG4yo/PL94oMul0gCWnUN7GfPfG1JIRRTyiFEbQcKCg1
 YFRywnYPJ0gBzsCTRVHQV94sftWjDoFnCVuX/uQSoe1g0EvsSG0y
X-Google-Smtp-Source: ABdhPJwov3zAkhV8hoasd/Nqez+KCbLf1i+FAG9iey0fHovUPuTpB9EtzhpanTNBdYach08n5ztNawibGa6MQx+Y6ZM=
X-Received: by 2002:a05:6830:1d81:: with SMTP id
 y1mr13858111oti.24.1621736332774; 
 Sat, 22 May 2021 19:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAOw_LSEjzmUi1KvPM6nyKRV=8N3tqTru-noaKLwE01mcDw6uLg@mail.gmail.com>
In-Reply-To: <CAOw_LSEjzmUi1KvPM6nyKRV=8N3tqTru-noaKLwE01mcDw6uLg@mail.gmail.com>
From: Daniel Lenski <dlenski@gmail.com>
Date: Sat, 22 May 2021 19:18:16 -0700
Message-ID: <CAOw_LSHOysZvefG0drJDEyQa6wCiZS447eyX42z9P6S5Jjud9A@mail.gmail.com>
Subject: Re: ath10k raw mode
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_191855_800562_35F720FD 
X-CRM114-Status: UNSURE (   9.57  )
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

T24gU2F0LCBNYXkgMjIsIDIwMjEgYXQgNzowMCBQTSBEYW5pZWwgTGVuc2tpIDxkbGVuc2tpQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gSSdtIHdvbmRlcmluZyBpZiB0aGVyZSdzIGEgZmlybXdhcmUgZmls
ZSB3aXRoIHJhdyBtb2RlIGVuYWJsZWQgZm9yCj4gUUNBOTM3NyAocmV2IDMxKS4KPgo+IEkndmUg
dHJpZWQgc2V2ZXJhbCBmaXJtd2FyZSB2ZXJzaW9ucywgYW5kIHRoZXkgYWxsIGFwcGVhciB0byBi
ZQo+IHNpbWlsYXJseSBsYWNraW5nIGluIHN1cHBvcnQgZm9yIHJhdyBtb2RlLgoKSSBmb3VuZCBh
bm90aGVyIG1lc3NhZ2UgZnJvbSBOb3YgMjAyMCwgd2hpY2ggc3VnZ2VzdHMgdGhhdCBRQ0E5Mzc3
CipkaWQqIHN1cHBvcnQgbW9uaXRvciBtb2RlIHVudGls4oCmIHNvbWUgc3BlY2lmaWMgZmlybXdh
cmUgdmVyc2lvbi4KaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9hdGgxMGsv
MjAyMC1Ob3ZlbWJlci8wMTIwNTMuaHRtbAoKSG93ZXZlciwgSSdtIGhhdmluZyB0cm91YmxlIGRl
dGVybWluaW5nIHdoaWNoIGFyZSB0aGUgZmlybXdhcmUKdmVyc2lvbnMgcmVmZXJlbmNlZCB0aGVy
ZWluLCBzaW5jZSB0aGUgY29tbWl0IElEcyBmb3IgbGludXgtZmlybXdhcmUKc2VlbSB0byBiZSBt
aXN0YWtlbi4KCkRvZXMgYW55b25lIGhhdmUgYW4gaWRlYSB3aGljaCBhcmUgdGhlIGtub3duLWdv
b2QgZmlybXdhcmUgdmVyc2lvbnMKZm9yIG1vbml0b3IvcmF3IG1vZGUgb24gUUNBOTM3Nz8KaHR0
cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1maXJtd2FyZS9jb21taXRzL21hc3Rlci9RQ0E5
Mzc3L2h3MS4wCgpUaGFua3MsCkRhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
