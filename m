Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AE9C433FE
	for <ath10k@archiver.kernel.org>; Wed, 27 Apr 2022 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9FCmgRhCiihhIXRrHlQFaYxOs7KOBw1PI3VuamMavA=; b=K54i7G+FDn50+h
	w1MilQ4KfYeA9QJ2xl7wQihU30uY2VJs549u79rIgBFTiWWx+SWL2bJ8lgtBZvqQ6LrLivSoKvhiB
	Hpn/HQfn9It9HME4hgaQG/dl/y2K8m7oNu1zOA0l+WrN5ah0MkuczA3LYg/0YAdmgkDe8Sy0yhNQA
	BWHQgNPlUtKCYKkK+TEP7IecluLkHWOm7HOjbGRiWyj+Q+krwD7LDH8me3rGIjdCAv6i5QQpNla4a
	r0uYfXLQczTmYZCfoqBRpFXS8bGQaVggiOvciYh08p9d37f0q+E8Jaoh2kP00nf5oivdbKn1GSEwy
	ZyrwssmBYxepE1Kaca7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njc6a-000GhA-HS; Wed, 27 Apr 2022 07:28:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc6W-000GeS-UE
 for ath10k@lists.infradead.org; Wed, 27 Apr 2022 07:28:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 805DCB824B0;
 Wed, 27 Apr 2022 07:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D72C385A7;
 Wed, 27 Apr 2022 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651044530;
 bh=xLk9XWu/k/y+HAMQv3vTG9xohoGfdtDQLMATOYpRQt8=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=gS3OoIK9EZ1RArYZjN1MapVRm+myv9AfvjD12vQoZzNIv2tKOdcHRbgcLllfy57yZ
 VIKB8I35g9XDZve+1WoZv2IWtFdVVPR2sEmEvShFk1YOfdWpvidlynDMX0sCtRhMB+
 QIQRNJBjsOTSJB0YtCd4r4HVxMua2Y4K7V/v5Vy8XYVyZ0TFawXSzbqTEIf8SAAQm6
 LALClRl3YCxMMzpIv5d/c2XnR0hhAE/5x8m3RQBdP+dR3thLFOfLrSTWx0Q0A2mTI6
 G51yWjUTc9/9q8duMV+gLKr3FVSnJhELLcZ7VM4Q2HNpyOlNeHLyyZufzOPtVo20/x
 ZUpsMUOQPov8w==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: simplify if-if to if-else
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220424094522.105262-1-wanjiabing@vivo.com>
References: <20220424094522.105262-1-wanjiabing@vivo.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kael_w@yeah.net,
 Wan Jiabing <wanjiabing@vivo.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165104452604.30072.1720851618351508731.kvalo@kernel.org>
Date: Wed, 27 Apr 2022 07:28:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_002853_203037_0A09BB35 
X-CRM114-Status: UNSURE (   6.64  )
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

Wan Jiabing <wanjiabing@vivo.com> wrote:

> Use if and else instead of if(A) and if (!A).
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7471f7d273ac ath10k: simplify if-if to if-else

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220424094522.105262-1-wanjiabing@vivo.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
