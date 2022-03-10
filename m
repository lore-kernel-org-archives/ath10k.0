Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B449C433EF
	for <ath10k@archiver.kernel.org>; Thu, 10 Mar 2022 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=773X/P+q3hqKqmXt5oA7/cqw6F1GgUg3wBiZp1fKICo=; b=KNdD2QkFlXIQkg
	cvff4NVW2N6NzzWr331OGbVjRFUnGHD/XxbWSZ9Y18kzOb2gysMyqUR3EV9IgTTwI8u62n+dCR8s8
	HgpIMMXHriSq1HDjPUK3r7rwkREKZdWhkMwJiZI9NbaYK4L9cwXz1Z0AXHJnhFyAtSXFcBrcgTBP+
	G7vs4/aTwt2Yjh+h3TcqmBzL7vB5Axe002jifMythne6SnGKul4phA1+kpUFe6vGfbZG5I5wYSD0h
	Ty5PYA+vcFrsUFNNWItXhT9K68cBP+x3mbolHxZ14feHboKugy9s6zh7mT50URnwD+q6m+JR9uLNK
	azWgzgZO9z026xDUamcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSL60-00DQGZ-Be; Thu, 10 Mar 2022 15:52:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSL5x-00DQG0-Co
 for ath10k@lists.infradead.org; Thu, 10 Mar 2022 15:52:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96A2BB826BA;
 Thu, 10 Mar 2022 15:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4896FC340E8;
 Thu, 10 Mar 2022 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646927570;
 bh=5BSwm39TVBk+/sZEf4qJ0qeckWgsRWt03o2mAj/NKBo=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=iztUl96yqpYaN8ldIISRZ4beF2U7oSDfAk4g8B9u/CydhoPrjL4CtyqNp4A6DF9v4
 TLyHxDJID1gninumbb5OeoQXzsrtSHXrLCPKprwKYaIoVpC1goP0pZERFo9CgxkGl8
 l5+gAp++knf9OsUKoSBfvWaFbUgCF1m1fpfmiig8C0rufZTfRgmzjyoNcHzbKm60x5
 4rdZ6lbHlTqRBx5F6LDK9XzYSYnmMOAsl7aaxH4Mg90p/bJiEaWG/EnDhehg6melWp
 kjjxiKxqO8Eyowgc/fK3c994z+QIlZKAsM1wrPgSLuXIypBEjd42NGvh7Ps77n/Qcx
 1/SazEO7ufhwg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix error handling in ath10k_setup_msa_resources
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220308070238.19295-1-linmq006@gmail.com>
References: <20220308070238.19295-1-linmq006@gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linmq006@gmail.com
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164692756657.18489.311627042082408244.kvalo@kernel.org>
Date: Thu, 10 Mar 2022 15:52:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_075253_611522_9517CDB6 
X-CRM114-Status: GOOD (  10.45  )
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

Miaoqian Lin <linmq006@gmail.com> wrote:

> The device_node pointer is returned by of_parse_phandle() with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error path.
> 
> Fixes: 727fec790ead ("ath10k: Setup the msa resources before qmi init")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9747a78d5f75 ath10k: Fix error handling in ath10k_setup_msa_resources

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220308070238.19295-1-linmq006@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
