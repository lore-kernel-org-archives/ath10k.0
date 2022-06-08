Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4082CCCA49F
	for <ath10k@archiver.kernel.org>; Wed,  8 Jun 2022 06:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKxuwycj4IA2JQuvWPu7YRkynR4zcyXcmctsV8Zbo98=; b=SuyP9kMAnmxKTS
	UH471ZBjcsBUrApUAbE+nJZ9eFHWNV9ZCTEsj4aPFlK4Mp8Zy65Uhva6bsaO9xXzDsdC38BLxpL9u
	mDgKx9aOfZtf6aLHAt+c3HawbMUrBJ9BSlB01gBC3DezfLMHyEBR0M+TqRSh9ZSQCwdlAEhnkXJRm
	cMQy39hsPbjXDxnAynFfXv0srLCFNrqpORsb4KoopPVMv3pBEk1lSNep8YWqCOmkQNHcx2vLpfVrX
	a7WtmKPfe+TYhm7No1j/2dmaLq4bKbXz2I6jJeLviof/mVqFn/N3XlsfJRSipgL9Vrv8Xn2QrODRd
	lCtLrqVHWLO2pgR4V9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nypPh-00BKcN-6t; Wed, 08 Jun 2022 06:43:33 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nypPe-00BKbv-UB
	for ath10k@lists.infradead.org; Wed, 08 Jun 2022 06:43:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id y32so31706958lfa.6
        for <ath10k@lists.infradead.org>; Tue, 07 Jun 2022 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PGGKYpahmLpnxlBiK63iZ86oLZGK07dVSipLHF5eQXs=;
        b=T5EIK88fd19+34zolX5I2c5HooS/CwSuTer5GVTRZz735qKorvGNH/nklCKlDsE46M
         D3+1CjuqZhLyaWZnM8vajPf0xIn+Do/RCcE/M9QbQAxgsz9y1S7/l5jkxOh9ZJ8OgAB8
         e/UkGqYzxvs1OZn53iCNpmXhL3anwJNPu14efkT4Dp2GRIkLoib4NtzRLd+sZdygvP5h
         poYal84dfD+SlrQ6t8XxB6eZgS4xhEU6gKc5jY2dTW3yZ+xDmN9zvRMNb1asYmGq5p7c
         4HifDR2BqSId1YlZER4pfmHlVPZXZy1j7NK5vne4dpVV9G/3YG5Z2ZbfKSL7owJZ5OT8
         BWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PGGKYpahmLpnxlBiK63iZ86oLZGK07dVSipLHF5eQXs=;
        b=I9dXI+VN7lZmvqhwSa81lCH2Kvkv2ghQKOKVUWV9TP7TTdDvSytZcgvh8s1eyDN2on
         O+4rhZ9GDz0g+XLrjnTRHdYRPRVmgL4HLppaY61mB82yLWyvZL+md8/c6jo437TbNGh5
         kvFm+VXY4RWI3aQz+9aYGl/J0hOVHMFcgO7FExVqse372UmF7MRt3IZsrc4vDgqKFHR1
         WxcBe3E+4Bahg/aqsv7Ht92xEmicfG6JUEe6TjfnacWaHJZn8jsq6esrpgdGX0utdgPf
         hwapznN9Ce9UurwkdxySaHgjXdo0Cd4xI4J27SO7HmcRNNjviSklSrcAFcVg4yfY/PWI
         OFqQ==
X-Gm-Message-State: AOAM533wlTnB3uvWF6hO5YiZpxGuzyrEQf/tLTP6z9dasYiyIhrtcp9l
	aXsvARrX1IuqWcfFdcdmEqjwHXFLix1MpZfeJJbuq02q
X-Google-Smtp-Source: ABdhPJz71DItbSJDnOclHiv8OR1JHAapVKST4j4tJO9A7gYsFPHpWmdDkvgEfN+KBU3hV64vyI4P8U3+E2zjGzkfofs=
X-Received: by 2002:a05:6512:13a3:b0:474:2642:d00e with SMTP id
 p35-20020a05651213a300b004742642d00emr20885296lfa.328.1654670608611; Tue, 07
 Jun 2022 23:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+BgFQXJr2FFdS5wK=it=sKck3htDXFFO50Px=scvL62xh41bw@mail.gmail.com>
 <87k09rr7bl.fsf@kernel.org>
In-Reply-To: <87k09rr7bl.fsf@kernel.org>
From: =?UTF-8?Q?Nicol=C3=B2_Sprea?= <nsprea@gmail.com>
Date: Wed, 8 Jun 2022 08:43:17 +0200
Message-ID: <CA+BgFQV+H+YnTFhOG+d5GtWC7ZDzu8fh6S+K6wF4a5fhOP5Jmg@mail.gmail.com>
Subject: Re: Firmware 4 vs Firmware 6 for QCA6174 hw3.0
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_234331_009067_3C516034 
X-CRM114-Status: GOOD (  11.96  )
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

VGhhbmtzIGZvciB0aGUgYW5zd2VyLgpJcyB0aGVyZSBhbnkgZmVhdHVyZSB0aGF0IHVzZXMgb25s
eSBhcGkgNj8KSWYgSSB3YW50IHRvIGRvd25ncmFkZSB0byBhcGkgNCwgaXMgdGhlcmUgYW55dGhp
bmcgdGhhdCBJIHNob3VsZCBwYXkKYXR0ZW50aW9uIHRvPwoKT24gV2VkLCBKdW4gOCwgMjAyMiBh
dCA4OjM1IEFNIEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gTmljb2zD
siBTcHJlYSA8bnNwcmVhQGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4gPiBXaGF0IGFyZSB0aGUgZGlm
ZmVyZW5jZXMgYmV0d2VlbiBmaXJtd2FyZSA0IGFuZCBmaXJtd2FyZSA2IGZvciBRQ0E2MTc0Cj4g
PiBodzMuMD8KPgo+IFRoZXkgYXJlIGp1c3QgZGlmZmVyZW50IGZpcm13YXJlIGludGVyZmFjZSB2
ZXJzaW9ucyB0byBtYWludGFpbgo+IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5Ogo+Cj4gaHR0cHM6
Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vdXNlcnMvZHJpdmVycy9hdGgxMGsvZmlybXdh
cmUjZmlybXdhcmVfYXBpX3ZlcnNpb25zCj4KPiBUaGUgYWN0dWFsIGZpcm13YXJlIHZlcnNpb25z
IGFyZSBzdHJpbmdzIGxpa2UgJ1dMQU4uUk0uNC40LjEtMDAyODgtUUNBUk1TV1BaLTEnLgo+Cj4g
aHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1maXJtd2FyZS90cmVlL21hc3Rlci9RQ0E2
MTc0L2h3My4wLzQuNC4xCj4KPiA+IElzIHRoZXJlIGEgcmVsZWFzZSBub3RlPwo+Cj4gSWYgeW91
IGFyZSBhc2tpbmcgcmVsZWFzZXMgbm90ZXMgZm9yIGZpcm13YXJlIHJlbGVhc2VzLCB1bmZvcnR1
bmF0ZWx5IG5vLgo+Cj4gLS0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtd2lyZWxlc3MvbGlzdC8KPgo+IGh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3Jn
L2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
