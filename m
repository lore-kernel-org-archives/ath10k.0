Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789C6C433F5
	for <ath10k@archiver.kernel.org>; Mon, 13 Dec 2021 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JMgxAE29n/UU24qaemGNhN+K38RKMFPwxwOwpHLDFM=; b=I9k33bGQhJHmrQ
	slAtdyygOW4ETWZsShkmNNc5Lxhr9x2wAHyP89TPCmIbyJ95uHs1gfN31HmBbUpooUaeIu7PFBy5C
	O1J4zC5Xltgr1+EX2xKM7BLIJj/9FjFfg/19t5aF0JutQEN9CIBjR2CS1Qqw8cdS36A0uzbsILfzM
	Vhjuf92CxhUgeH0FUzS9Yd7qgTNH/SCInhqGaiwUNe5XFuJl6zExkXGerDqjRsYBH5SSvQkZSWlAK
	XYQoW8LfJgO18r5ESBZgNGD3heQvrIxzmHWwg/V0Ch8N1LZOh5PlggxQ2rdQLUxEcEoNZejW3U0Ve
	73XYxyAukjydN+tHTiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiEq-008sNG-I8; Mon, 13 Dec 2021 10:07:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwhtR-008j5L-Et
 for ath10k@lists.infradead.org; Mon, 13 Dec 2021 09:45:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 310DECE0E95
 for <ath10k@lists.infradead.org>; Mon, 13 Dec 2021 09:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91873C341DE;
 Mon, 13 Dec 2021 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639388707;
 bh=xJvuX1HROiNhGGrUSLW+EepdAVSlVCN2hxtVw4012Bg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=gn1RdBxBkNImL9DTiE1HFOVB5yxAWzWAyXFx1/EPiD8fcN9W2Jev5Rn172j8hvC68
 0stWDkEdo+hRePg/nmZBVc2ghwpzry5s5WeOUj6uxTlaBwE9OFQHSRgnMrgm5pNXni
 TmMVFcJuFMvbr6/Iec+o+aPeo3VY04qyeuGfhR1MdbQpeE+HYZ7VdztvFWuhsQfsWI
 pD81iAQ6xzgyzwzww3TaBnKEbjhBLpmFuUHHq+YR6iOqdFCKh2ve/VdkEfctlUBs5M
 VOB9OFxDr0hgRCBswl47JvFFfkY3iL/ZqPoopJP4yxCGF9G9uu/XtNicykZVE5ddE5
 2rmmQqd5wuvQg==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: htt: remove array of flexible structures
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211209091545.6098-1-kvalo@kernel.org>
References: <20211209091545.6098-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163938870083.20609.3005949856683385332.kvalo@kernel.org>
Date: Mon, 13 Dec 2021 09:45:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_014513_732221_A3A1B71B 
X-CRM114-Status: UNSURE (   8.38  )
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

> I updated to sparse v0.6.4 and it warns:
> 
> drivers/net/wireless/ath/ath10k/hw.c: note: in included file (through drivers/net/wireless/ath/ath10k/core.h):
> drivers/net/wireless/ath/ath10k/htt.h:1503:41: warning: array of flexible structures
> drivers/net/wireless/ath/ath10k/htt_rx.c: note: in included file (through drivers/net/wireless/ath/ath10k/core.h):
> drivers/net/wireless/ath/ath10k/htt.h:1503:41: warning: array of flexible structures
> 
> The structure is unused in ath10k so let's just remove it.
> 
> Compile tested only.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

56789eef894c ath10k: htt: remove array of flexible structures
5341d57bc398 ath10k: wmi: remove array of flexible structures

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211209091545.6098-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
