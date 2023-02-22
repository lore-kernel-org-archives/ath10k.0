Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A5FC6379F
	for <ath10k@archiver.kernel.org>; Wed, 22 Feb 2023 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7aYN3AAPAVm/NgUH5AhRR76EwHOk/DWVaFXAO0kJI8=; b=eLOc2g0x9gIVE9
	RoR0EjqJcBvPKCqjOXvWEqCEcQacoZOOj/YrytPPcvKvES07HYAq7FGwyFPn/vk3Kirl34LL1E4e2
	4yjb4jklcG30TUWAi2yUJxfbvzs/FkX1dOVtttWSDW8ylQHDlWPWUYrWWTputtmxRGTMRUIUvLWr5
	IKAW/viVM/6dxzuOhpHrLy9JdX06AJhlalkaijt1fLyJyX+r62q+O0DcZ1fKA4R1L2/Pq+5Nhwt6/
	k5IIBh2Vh70Ubr5URYNfqb7koi8rFmxgiL/ST7AjH+wiX2G9ad+30ZzaHj3q1SjMoz0ZSsux+BG1f
	AfnD0AG/RYWe+kh4Ei9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmDx-00BrCE-UJ; Wed, 22 Feb 2023 10:19:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlXo-00BUwH-UA
	for ath10k@lists.infradead.org; Wed, 22 Feb 2023 09:36:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 953F1612C3;
	Wed, 22 Feb 2023 09:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FFEC433A0;
	Wed, 22 Feb 2023 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677058570;
	bh=rFQ08XqnmKgreYK0T/xvGGP3R+J2JrSfW9FfpliUaPs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pwlyWK4iVjR8tABgAOltE1OFLX1vmDwB78exTdCb8OeRE1K1yKo+IdVYeUL/BqESA
	 BaHGSBUTf4J92Ev884CbXmqm0FjFiaUB7dloSaBYrO4PQzVH5jClJX6ASp/sWYG6O4
	 w39i5ctPyuQwvEr7Eo7VNTFzFDSghetuEhMCR7XBmDCoyQc2HfT9mUmeYb9EkbXrsQ
	 dQN6yUkONs0CKUHvaL8FORav4HxEJqfNeQjHFjZgyCnqEu7xpybLrTt9modqFtUlgA
	 SqMfnHxXTzoIiHwYRApL+jYPOm92N8U7N9vQkAB1sDlFNjyQhfDwmsf7T9sDZkq1bh
	 8ujIbE/PxEMvg==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: davem@davemloft.net,  ath10k@lists.infradead.org,  quic_mpubbise@quicinc.com,  netdev@vger.kernel.org,  kuba@kernel.org,  linux-wireless@vger.kernel.org,  pabeni@redhat.com,  linux-kernel@vger.kernel.org,  Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v2] ath10k: snoc: enable threaded napi on WCN3990
In-Reply-To: <CACTWRws334p0qpsZrDBULgS124Zye9D7YC3F9hzJpaFzSmn1CQ@mail.gmail.com>
	(Abhishek Kumar's message of "Tue, 21 Feb 2023 23:09:24 -0800")
References: <20230203000116.v2.1.I5bb9c164a2d2025655dee810b983e01ecd81c14e@changeid>
	<CACTWRws334p0qpsZrDBULgS124Zye9D7YC3F9hzJpaFzSmn1CQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 22 Feb 2023 11:36:03 +0200
Message-ID: <878rgqt530.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_013613_045361_BBCC8236 
X-CRM114-Status: UNSURE (   7.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Abhishek Kumar <kuabhs@chromium.org> writes:

> Gentle reminder for your comments.

A gentle reminder to avoid sending gentle reminders :) For example, I
currently have 103 patches in patchwork and if everyone send gentle
reminders that's a lot of unnecessary email. So please avoid sending
unnecessary emails. "gentle reminders" don't help, quite the opposite.

Unfortunately sometimes it takes time before I'm able to look at
patches, but if the patch is in patchwork in an active state I will look
at them eventually. More info here:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#checking_state_of_patches_from_patchwork

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
