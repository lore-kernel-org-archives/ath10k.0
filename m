Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607AFC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uhH0+tu7pJnAUQCdE08yqEEpaKSIpCCvs8mK7dXKec=; b=lbqJxYP8OkEjzn
	ux5XfwOeeG4GuOy70bAEYXutE/W9hdTmI7kmT+xEP0wNeFJkfzXE5xb9wgEqRtFMKfQK/+TD23ead
	LmioyykPdYhYhhEdOsVKanf+UfKd0N0JE7Xs5cUckoRXdCfGjSd6BI8tnIcrZoMtyhXZc6xbE357r
	kS92cjIFemLkavy4N/StwGM28pANYj+Z7MeSDFS2aw+pPr5rI7uELNBH55XBSHl5P+XJXerrUNilG
	KA2vmJt1nOGKWep8JdpJVObE70x2F6xlAvOvaZm9zHhiZu+ymtrpDR1hDqViATpxMkUcNvhVOf8hy
	S7wfDngrUyPdlFaWuICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuQm-00FFtB-BZ; Fri, 21 Jan 2022 13:58:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuQZ-00FFln-Pd
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:58:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78214B81FC5;
 Fri, 21 Jan 2022 13:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A539BC340E1;
 Fri, 21 Jan 2022 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773485;
 bh=5Lhv2cFmB2ZpJ4JVOOjwtI85k53AYWqGpITrhGgzOdo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=NhNTOO6RHLaTzIvveUKNpobAcjwqSG/MRSvoN9hmTnP5Yx8NLfckAqeRPvuW9hvn/
 OCHGgCsWCiEIA1WffdakF0Tx5G2Aan9DJGjOpMmJM+AhbfWzAMVPvteMfxUqgA80EK
 1oBESMdWnKF46y9WW0XGVFxAPaaSMO3qJRERrK5Vt/2Egz78Gz4a5IazlMLo7Wi+Mr
 6Qa68OO5KbYXBCWhNUkXRIZsI7FP689zlvtHiFtokbT1ZeHjbJMSx1bCIsqJVdtDZL
 HDbnU0ZF2w9AIGQdwtDgJFMfbfjvbXdGJ8Ad5V+9QJYMWLhehdQyhHz1pPCQtWRXy4
 Iu4IE27HfNgLA==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Pawe=C5=82?= Dembicki <paweldembicki@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ZTE MF286D specific BDFs
References: <CAJN1KkxHQwLWQ=0m6DfGG_c5Ls3QMp7VBkJ4BMbqeQY4V-Lx1Q@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:58:02 +0200
In-Reply-To: <CAJN1KkxHQwLWQ=0m6DfGG_c5Ls3QMp7VBkJ4BMbqeQY4V-Lx1Q@mail.gmail.com>
 (=?utf-8?Q?=22Pawe=C5=82?= Dembicki"'s message of "Tue, 18 Jan 2022
 21:16:07 +0100")
Message-ID: <87lez9b385.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_055807_995938_416AD68F 
X-CRM114-Status: GOOD (  11.47  )
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

UGF3ZcWCIERlbWJpY2tpIDxwYXdlbGRlbWJpY2tpQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBJIGFt
IHByZXBhcmluZyBPcGVuV3J0IHN1cHBvcnQgZm9yIHRoZSBaVEUgTUYyODZEIHJvdXRlci4gSXQn
cyBiYXNlZAo+IG9uIHRoZSBJUFE0MDE5IHByb2Nlc3Nvci4KPgo+ICogZGVzY3JpcHRpb24gb2Yg
aGFyZHdhcmUKPiAgIC0gUUNBNDAxOS1iYXNlZCBib2FyZAo+ICAgLSBRQ0E0MDE5IGlzIHVzZWQg
YXMgMi40IEdIeiByYWRpbwo+ICAgLSBRQ0E0MDE5IGlzIHVzZWQgYXMgNSBHSHogcmFkaW8KPgo+
ICogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlCj4gICAtIFB1bGxlZCBmcm9tIHRoZSBzdG9jayBm
aXJtd2FyZSBkdW1wLgo+Cj4gKiBJRHMgdG8gYmUgdXNlZCB3aXRoIHRoZSBib2FyZCBmaWxlCj4g
ICAtIGJ1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjAsdmFyaWFudD16dGUsbWYy
ODZkCj4gICAgIG1kNXN1bTogNDg5ZjAxNTdkZjdkOTI4NTdhOGQ5MTUwOThjMmRlNTYKPiAgIC0g
YnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMSx2YXJpYW50PXp0ZSxtZjI4NmQK
PiAgICAgbWQ1c3VtOiBlMGZkNTM3NmQyNGYwYzJjM2M0OWJhMmE3ZmMzNzM3Ngo+Cj4gQm9hcmQg
ZmlsZSBpcyBhdHRhY2hlZC4KClRoYW5rcywgYWRkZWQgdG8gUUNBNDAxOS9odzEuMC9ib2FyZC0y
LmJpbjoKCk5ldzoKYnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMSx2YXJpYW50
PXp0ZSxtZjI4NmQKYnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMCx2YXJpYW50
PXp0ZSxtZjI4NmQKCkNoYW5nZWQ6CgoKRGVsZXRlZDoKCjIgYm9hcmQgaW1hZ2UocykgYWRkZWQs
IDAgY2hhbmdlZCwgMCBkZWxldGVkLCA4OSBpbiB0b3RhbAoKaHR0cHM6Ly9naXRodWIuY29tL2t2
YWxvL2F0aDEway1maXJtd2FyZS9jb21taXQvOTM1OTFjZTkxOGYzZDdiMTA3MGVmY2M5MGUwODMw
OGI4NWYyMmIzZQoKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGlu
dXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2Rl
dmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
