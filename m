Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D58C4332F
	for <ath10k@archiver.kernel.org>; Thu, 17 Nov 2022 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2xjkudWbmgbmyMgXvVrekUW+QEgQzwkKkitYzeNqlY=; b=HAzdV1DHo9AwUV
	640sJGLS0HebJO5QeHdYoPjiWaTAjJxunpN6fcatLd28f8bdkEwNdABmV3+gk/PLNOM86s+mQLZB3
	z9nBDwaEgYziznj8HOT9suCjUiGGB0v2z/70lWyxS1hLlKyi/D0cO12Ezz6n03lj2K/8+qNdif86R
	rHm4tCJ6EH22QPRozH28vsS4tWV+8WLTrLqnOzoJ6c6ts99KgjUhBHaCkIKyS2bWHMDwuUTrisIlo
	MI5HECuLFhVOl4QshgWt+aHsUWghTqr8q9e+HMMNbXX6eG9kQGh8m5CG/QsulIcE2GzSFrTGu6zr4
	tDnrlUCj1THRYN3xwIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveSn-00Dzh0-4Z; Thu, 17 Nov 2022 12:57:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveSk-00Dzdo-Nb
	for ath10k@lists.infradead.org; Thu, 17 Nov 2022 12:57:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AA9C6B81FFA;
	Thu, 17 Nov 2022 12:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0A7C433C1;
	Thu, 17 Nov 2022 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668689863;
	bh=0/DXGG0FpalOrK5YKRn6w8anso4j2ak9dr9rUgU/UAE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bcNRfVMHLhuFw0q6nXAdhsNM4UYjHCSPnoZFskVPO+Iy3Oz6lUBqQqWfi2tEQ2Pez
	 /sAo04b7/2vPxiKv1OZDgSTDTC87oqfTqCD5I0lavxti5S0or4Z6AHWot8NzIAODGz
	 iowoQzvnHIxkO3nLHEdu0DWsZ9pWNqLRNrnBb3IkeTx31CJRRNt7Pxhr1t5noFoKrS
	 uM7+CYQjJ1hdkbLpy/YLBRhaLgI42FnfCBP7DJ5lFF+E6RBRNr2mBwf9pu+8gwKeN1
	 8YNP0ZPIEXHGg9XhRO9PiK7LvWV0oYwxDxuf2Y07Jv5AooZ0MoNOBiPz6bdI+4jGVg
	 GrI9r2vKo9NEQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: Remove redundant argument offset
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221110164025.14418-1-hujy652@gmail.com>
References: <20221110164025.14418-1-hujy652@gmail.com>
To: Zhi-Jun You <hujy652@gmail.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Zhi-Jun You <hujy652@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166868986062.22046.4412615782635710951.kvalo@kernel.org>
Date: Thu, 17 Nov 2022 12:57:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_045750_955280_66E59B0D 
X-CRM114-Status: UNSURE (   6.82  )
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

Zhi-Jun You <hujy652@gmail.com> wrote:

> This argument of ath10k_htt_rx_h_frag_pn_check() is always set to 0 so
> drop this.
> 
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d9e38350a7b1 wifi: ath10k: Remove redundant argument offset

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221110164025.14418-1-hujy652@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
