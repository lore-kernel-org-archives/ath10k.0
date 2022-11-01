Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1CDC433FE
	for <ath10k@archiver.kernel.org>; Tue,  1 Nov 2022 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqDKWTSUHRrIxGe5ysIhJZFCIqCLCl28wwoaK6OMSlY=; b=4NK9pG+kCrjPP9
	IPdS4JXTRHgXPI9gvtB8ucuoVJ1Cq97sy4y+90IUNYXwzh8Zi8E/bXBUZSlGeLhOFScsztcxUYzx+
	Bnyg5tFdepN8Z0bdiyJ6lCmZhWTtstCoGda7XPxc9wAWvqOU3T1g8WXTP70GlCGScBuyh4hG4LiGH
	3B/wZzBnh0PSHdXXz+dpxXd/R8M2pBPwbvUdiflmzuBO+O15RRCIu11fqdQHCKxyG9wh2Zt59mRJp
	VX4OOco/q7xGM80CCwl6H9d0FurAx8j9dU50zLt1pnVLWi0VTdMmaO272IXGZSAKgSnesuHxQunuy
	gnqFBQN6HfvnOL2GngBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opnaB-003dv4-HJ; Tue, 01 Nov 2022 09:29:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opna8-003duN-3U
	for ath10k@lists.infradead.org; Tue, 01 Nov 2022 09:29:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 39EF4B81C53;
	Tue,  1 Nov 2022 09:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA662C433C1;
	Tue,  1 Nov 2022 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667294952;
	bh=SHCUtKcvJiP4x/pfLfKcS8SGR09keelP++DTClcWsqc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cRvh8ggN/RxQBCdsU51vlzlPibZ2lM/sx/5X9NrqF6NFfBJ+E/swRKcWlgI7iu0vK
	 ZhBcOL4zN08RK0na63PPvV+TAtDp8j9ebRUVLG01B7d+fquzBTVI2fhBj27DXg9bBF
	 1Tnf7LUy3hRUZr2xxzvltB+BnRGzDUvCjcF1xmM47T0cOI/gHrYElWwH8ZGj/lQoIg
	 ShnUJa781rfoUwSmktyxaeeSA0Zg5J/lKEFynW3kcZV7shKBlxEcdG3aYDxpd0fENx
	 aX5bXTqM0VCOQYZtC8+pdJ9DlIVT5SJ04pPosXr2fJhxYpbOUxSm+icKZC7GivlYNG
	 vHPVartbWfqcQ==
From: Kalle Valo <kvalo@kernel.org>
To: "Youghandhar Chintala \(Temp\)" <quic_youghand@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath10k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath10k: Add WLAN firmware image version info into smem
References: <20221026102257.19919-1-quic_youghand@quicinc.com>
	<b55ef95f-f400-9ef6-a427-525ae529d673@quicinc.com>
	<fd45187c-739c-cd5d-4d4b-ae6abad03a94@quicinc.com>
	<877d0fgiaa.fsf@kernel.org>
	<722d3571-b399-dbf0-26da-04b73331df49@quicinc.com>
Date: Tue, 01 Nov 2022 11:29:09 +0200
In-Reply-To: <722d3571-b399-dbf0-26da-04b73331df49@quicinc.com> (Youghandhar
	Chintala's message of "Tue, 1 Nov 2022 14:38:22 +0530")
Message-ID: <8735b3gh0a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_022916_317350_2B5BE56A 
X-CRM114-Status: GOOD (  12.03  )
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

IllvdWdoYW5kaGFyIENoaW50YWxhIChUZW1wKSIgPHF1aWNfeW91Z2hhbmRAcXVpY2luYy5jb20+
IHdyaXRlczoKCj4gT24gMTEvMS8yMDIyIDI6MzEgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4KPj4g
QlRXIFlvdWdoYW5kaGFyLCB5b3VyIHF1b3RlcyB3ZXJlIGJyb2tlbiBpbiB0aGlzIG1haWwgc28g
eW91ciByZXBseSB3YXMKPj4gZGlmZmljdWx0IHRvIGZpbmQuIFNlZSBoZXJlOgo+Pgo+PiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAy
MjEwMjYxMDIyNTcuMTk5MTktMS1xdWljX3lvdWdoYW5kQHF1aWNpbmMuY29tLwo+Pgo+PiBJZiB5
b3UgYXJlIHVzaW5nIE91dGxvb2ssIEkgcmVjb21tZW5kIHN3aXRjaGluZyB0byBhbiBhcHBsaWNh
dGlvbiB3aGljaAo+PiByZXNwZWN0cyBzdGFuZGFyZHMgbW9yZSA6KSBGb3IgZXhhbXBsZSwgc29t
ZSBwZW9wbGUgc2VlbSB0byBiZSBoYXBweQo+PiB3aXRoIFRodW5kZXJiaXJkLgo+Cj4KPiBUaGFu
ayB5b3Ugc28gbXVjaCBmb3IgeW91ciBzdWdnZXN0aW9uLiBJIHdpbGwgYWRkcmVzcyBpdC4KPgo+
IEN1cnJlbnRseSBJIGFtIHVzaW5nwqAgVGh1bmRlcmJpcmQuCgpHb29kLCBhbmQgbm93IHlvdXIg
cXVvdGVzIHdlcmUgY29ycmVjdC4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwu
b3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
