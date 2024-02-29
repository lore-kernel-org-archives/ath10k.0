Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169A0C48BF6
	for <ath10k@archiver.kernel.org>; Thu, 29 Feb 2024 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7MnpL073fugq+76ssTgqGhMdT73fb0J5bWE7tprDF0=; b=ZoihpZYAmZVykRLcxNVOCJi+83
	NtdouYl6n9w7S9s0rOARNxxSlB9kwwW+jHX1unj5Cqn1c6xk/YffLS/TQV+nk72SPMIzvjkhdnRr5
	iBiS6sMrlouGMrHj9C+ZvaehIiG+011ufi49jvw4r50Jz9+flwcusyITHleTCeJC9Z/lBpnNypDDM
	hnYTsbvf2IuBHRLV23DGOZ74CHznpQtSEUOqvmZlJLcjkVke73tTDCtquCTykgmvEjO++DXE4Semm
	C0Z3d1iCFkaj2+5viE3mgBcIMnrAHNLagg7RO2AobDhz3dkLGql9PuN4357m06D/0wo0i5dkmG3RB
	QTL9vyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbag-0000000CcFV-2wFw;
	Thu, 29 Feb 2024 08:16:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbad-0000000CcEt-1mS0
	for ath10k@lists.infradead.org;
	Thu, 29 Feb 2024 08:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A77D560C05;
	Thu, 29 Feb 2024 08:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED4DC433F1;
	Thu, 29 Feb 2024 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709194585;
	bh=y5OcD3gxfF0Cd3ddWFl0v6H0yVaSk1HNKViGum5HbdA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OyhtWHb+e3wh3rEpz3W5DXVdOChzx+LTM1SJBM2Ar1osbd+Fy39i5I/075/m5E59P
	 VtNKVDQgcodv8IgWY5Bh9K+KrnIdls2PAJx/vv2Z+zdSzvDkxUfffF9RAvNQ9A9Z39
	 kmf0tE6n70dWbshkpR45SZ5KPRjatDjP7uOiQkp7nH5BiCdAUT7wjICQnGcxTDoiWs
	 af0rd/QfQ2birR47J95FJ+qBRNOaMgIfODUrJRv/1tKPbg6rFZXBYfYxafIPXfLUiV
	 H3CNeJBlfJW0/Lf9k6hgwydSTaizjPyhMFJgOhVANXu/j8+GP9bklFPthvW1DdDEZf
	 oP3g7l77D7MZA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath10k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath10k: poll service ready message before failing
References: <20240227030409.89702-1-quic_bqiang@quicinc.com>
Date: Thu, 29 Feb 2024 10:16:22 +0200
In-Reply-To: <20240227030409.89702-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Tue, 27 Feb 2024 11:04:09 +0800")
Message-ID: <87sf1bit2h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_001627_528692_355CB364 
X-CRM114-Status: UNSURE (   9.09  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Currently host relies on CE interrupts to get notified that
> the service ready message is ready. This results in timeout
> issue if the interrupt is not fired, due to some unknown
> reasons. See below logs:
>
> [76321.937866] ath10k_pci 0000:02:00.0: wmi service ready event not received
> ...
> [76322.016738] ath10k_pci 0000:02:00.0: Could not init core: -110
>
> And finally it causes WLAN interface bring up failure.
>
> Change to give it one more chance here by polling CE rings,
> before failing directly.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
>
> Fixes: 5e3dd157d7e7 ("ath10k: mac80211 driver for Qualcomm Atheros
> 802.11ac CQA98xx devices")
> Reported-by: James Prestwood <prestwoj@gmail.com>
> Link:
> https://lore.kernel.org/linux-wireless/304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

In the pending branch I'll add this from v1:

Tested-By: James Prestwood <prestwoj@gmail.com> # on QCA6174 hw3.2

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

