Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA67E77197
	for <ath10k@archiver.kernel.org>; Thu,  9 Jan 2025 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRp81Kl3NIMZznqRLx5i2hAMw/K/qEeEjM9NQLx3hQ4=; b=i0p4wepZsxbHWZYTKsdit8/xQp
	AZK5hsQXpvuVuHAo+H3Z4P9Wf+Mi/f27LGF4BqUfdOv/Ad0LDQ5kiBB366457D91DUoeDyqsYNi/2
	lcCDYl02tB+aIdOnFbcudbL0eJpm+gtI8Z286UfUUue7BJbNO6BCzpkn1DZOD/7lP1PO3W6ujRWdN
	hNSvoZ86Xbue/9zXyzYB0OBm+pVrkDm/f+RSZ2Mayzj3qKnRflW+b/5AV7IxEbw+rnkE+r+GVTMfE
	A4sy8iNmKulv2IdCoDfGaLnFwTecTdSiNfp+VcqlsS7kYJ6MX0l2fTlbWz+xTTs4mnkVsWE2xroaz
	vRyaejTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsHD-0000000Bx1p-1eEt;
	Thu, 09 Jan 2025 13:08:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsHA-0000000Bx18-3pld
	for ath10k@lists.infradead.org;
	Thu, 09 Jan 2025 13:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93274A41BC6;
	Thu,  9 Jan 2025 13:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F28C4CED2;
	Thu,  9 Jan 2025 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736428119;
	bh=7ITLaen7UqS4VHFOfXTVUMhb7BCDETQvpAN0OW/chKo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KcRMqYg/8cRkijos0TGDZl/kbNcEmg8EHA/3Uy6KeHg1Wv+/FHpI05Ub/JV4zGuvn
	 Jxhv+/ke+jUo8gErC+kDQIKSCB1LR76NYqmnnHMQid0nzVhbpawLSA/TyfpEcvRpVo
	 cesoEDQ41d+JDrscKp657++c5qYkfT7DSUexJ5YkgHgNEQb8HxwBaJ75pUVZhYRtVi
	 BDEoMIskS+RRFBsRV3L7ShxDlyU6LQyA/4atsluZTAz7lUybKoASZEqPz0EwDoQlkP
	 jGVbA+62qlwImnlu11UeM08h5846fTQiHqzFr+UL4QJElfogmhA4wX4giU/zRTUww0
	 Sqm4TD81FMBDQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jamie <jamie@stimulussoft.com>
Cc: ath10k@lists.infradead.org
Subject: Re: Ath10k firmware crash
References: <a5b15899-b214-403b-a1b2-84a948e776ef@stimulussoft.com>
Date: Thu, 09 Jan 2025 15:08:37 +0200
In-Reply-To: <a5b15899-b214-403b-a1b2-84a948e776ef@stimulussoft.com>
	(jamie@stimulussoft.com's message of "Thu, 2 Jan 2025 22:19:54 +0200")
Message-ID: <87cygwdtii.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_050841_016952_85E286AB 
X-CRM114-Status: UNSURE (   8.31  )
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

Jamie <jamie@stimulussoft.com> writes:

> Ath10k firmware crashes periodically with Qualcomm Atheros QCA6174
> 802.11ac Wireless Network Adapter. Fedora 41 on Dell XPS 9575. Kernel
> version is 6.12.6-200.fc41.x86_64. The problem is intermittent. The
> driver crashes after some while and network goes down.

Is this is a regression and an old existing issue? In other words, is
there an older version of kernel which doesn't crash?

My first guess is that this is a bug in the firmware and getting that
fixed is difficult.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

