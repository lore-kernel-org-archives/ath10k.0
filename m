Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF7CC433EF
	for <ath10k@archiver.kernel.org>; Wed, 16 Mar 2022 11:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IaFlDbY17V+8rfJq2M6UgBJrCYCHZhHj0BB4TuhZCc=; b=fXHVcKyUQ5Ywqb
	ph08Ax7rV/IZqbw+a5N+lAPtQoqs1wx+yu1eMKAnZmxGfneyNFuScNiHd8c2jY8XgV3cxgajdpHqm
	H3mRHB5pUTUmOfBpePK5+hyBAiJ4po6vuvVlLBCStz6Bzryz09+WUBRiQujcBKjsYk4QfeZbCqRhJ
	5neJPq05E0wOfLOLNvge855LOUIGJwWI5gQ3zOt1GqivZLodmSoDYL3E30xomkVaD2MUC1bqICZ+3
	ErG9DL0P0NhzA7oM/yp8V5hqw6QmFk0cBUvfgvD56jEGFdP33Pk4fhBjk13kWYl7GhFY7my4uAX3y
	j8VKUD7s9+KmCUfqvAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nURwV-00CdNX-Ec; Wed, 16 Mar 2022 11:35:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nURwS-00CdNA-GY
 for ath10k@lists.infradead.org; Wed, 16 Mar 2022 11:35:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B959B81883
 for <ath10k@lists.infradead.org>; Wed, 16 Mar 2022 11:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CEFC340EC;
 Wed, 16 Mar 2022 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647430546;
 bh=R26zP40G4bx4aXQtrRtqCtRbPpetQ1qRyleLrW/uvrM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Tqd8Deszp7XPWTUnYnECJD9HbiYs9uJB/pp0Ns5El9oEG84MioDt+m+vRvVX9pX7T
 EXX5Kd0WwsA4HW9rF01nzrU7Yocu+DzTarS9bIprAaKYklMhnkjTtmwbA4fKgRzafy
 sKghMjd1lBEHUtJWoULutD2aJPC9yesYk3JC3QAdUL/Ph6XcubsG+KKNnFVu2f1Q6J
 MqG4Qjsud1wtc2vlyRebGOOLY0bX6JQ2Ctp0KQb6x8LiJfD0Wi3MVcluMKOdsKQ3BP
 ORUGNYm1PfxkYDHF0pg8Zia949AJp6FwkyYlvlJQjSH3CCNjrD/PdhlSRRrHkDD8z/
 zMujCXpvNr0DQ==
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "ath10k: drop beacon and probe response which leak
 from other channel"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220315155455.20446-1-kvalo@kernel.org>
References: <20220315155455.20446-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164743054137.26015.17991500615716853281.kvalo@kernel.org>
Date: Wed, 16 Mar 2022 11:35:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_043548_732451_E0097004 
X-CRM114-Status: UNSURE (   8.43  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> This reverts commit 3bf2537ec2e33310b431b53fd84be8833736c256.
> 
> I was reported privately that this commit breaks AP and mesh mode on QCA9984
> (firmware 10.4-3.9.0.2-00156). So revert the commit to fix the regression.
> 
> There was a conflict due to cfg80211 API changes but that was easy to fix.
> 
> Fixes: 3bf2537ec2e3 ("ath10k: drop beacon and probe response which leak from other channel")
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

45b4eb7ee6aa Revert "ath10k: drop beacon and probe response which leak from other channel"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220315155455.20446-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
