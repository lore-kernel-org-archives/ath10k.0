Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C95DCF6495
	for <ath10k@archiver.kernel.org>; Sat, 28 Sep 2024 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MGA8yh0n0LVQgrrLvF/vW2cGMnY4+rzfABYk3dHtpY=; b=1LURPu3aoEz1DPz/yClxWXTR11
	TUzFLyCqgIvW0fsEqF8Mllt+vWb6QGIyYGeRcMgTd9FaMT1ka3GVuusRutFAZgGCxSmroBs1YgOXP
	pwwyoVRP446djRV6VVkR+8aTMg1V7MxpiA1+YAc7aaWg7I83Sr6XvBIglkJ8pX9+MyR5gJmdd263r
	F4RsVhbSXDPfrhWFC4kxHuNXfHQvuV3QdjyQ9Ta7eON8n3VkAGkpWfmP8r4F2mFi1JrjpDhJtdX+l
	iE5AU7JUTL3gtBTgedRT0GJyJ9OqpcxlpF8u+ipcMsnZqtZb8fR4cCrAwQUg5ioOx0FfsroD5Nw8z
	fC2Ra6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTVl-0000000Crcr-0FGM;
	Sat, 28 Sep 2024 09:13:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTVj-0000000CrcQ-0HSK
	for ath10k@lists.infradead.org;
	Sat, 28 Sep 2024 09:13:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F41A6A401B4;
	Sat, 28 Sep 2024 09:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B98C4CEC3;
	Sat, 28 Sep 2024 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727514785;
	bh=8/JQT2MYezwnANraA78P+Yt1ozUwaArcy0dZ2wd0BVA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=T+7YhzVQfpd4PHcgySsM0szy4kzfqD3nJ3bvIVHNCywWo71Wtd9dj/+aHWDcRqHXW
	 a+hMuDjK7/BMeBI8hhSe7nI7rKjFypQkdrxRBURBVIbj7Xi/NTxFD9v5INzf1eoM0X
	 AUdHK18lY3QedQDLakOSLOTnmbVkBNaN3K3uS8WWQWK9ZCqzAKEISRKBJX0li1YLm+
	 EuoDlsl53V7TdxEFbao3+lCoYomoQkOgMpTNjjoLDNPo+X7difhU0P4SK1fCeWPegy
	 Wz+bwSeX+bFQEvQfJVueCr8hcvtZQffImUQKvOPCuJtCBbBm6bFa/5UphTz4+VXr8a
	 PlfTI8bhzii+Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: ath10k: fix the stack frame size warning in
 ath10k_remain_on_channel
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240830015349.1083226-1-quic_miaoqing@quicinc.com>
References: <20240830015349.1083226-1-quic_miaoqing@quicinc.com>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751478271.2249584.10843872161726973254.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:13:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021307_191435_B09315FD 
X-CRM114-Status: UNSURE (   4.88  )
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

Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:

> Fix the following W=1 kernel build warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c: In function ‘ath10k_remain_on_channel’:
> drivers/net/wireless/ath/ath10k/mac.c:7980:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Compile tested only.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c4c074d3fddc wifi: ath10k: fix the stack frame size warning in ath10k_remain_on_channel

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240830015349.1083226-1-quic_miaoqing@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


