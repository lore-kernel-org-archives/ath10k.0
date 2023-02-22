Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC06C61DA4
	for <ath10k@archiver.kernel.org>; Wed, 22 Feb 2023 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfdF+6wh1FOPPUrusrU95cVhJ1Y/NnOswUfATlYYVN4=; b=NFAWw7FxzNIyR+
	Y5IAtDLNG0l2udacNiSiprBt/cUQ/fAzVePtlFLzICg162oCnYnDTSohGGrQlCV/YMUS1AchbPTuj
	a3nrOf08BEtxHlf8XledGQsjgsBN9iDJXT+HCZah91GTZU0Ql+42laFlZUuT7+9NViNvEGwMnCITV
	4x0LBRcGShh6EmATuGCSOOQmc0GL4vbr2KRo7TyimkDT9fQRt0BREYWkRT8pH2vmokhEdXZqeU7Jr
	XR7XK3r2LEXxkVEsjO3hZuua9y5UiTgqXTMW97q6S7TMVWhyoOyExyyT8ePwVpu2+Hj9mDwYHZvEk
	FkTppA+SAMP7uKEQ0Djg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmRq-00By5E-K3; Wed, 22 Feb 2023 10:34:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlzh-00BjvK-Co
	for ath10k@lists.infradead.org; Wed, 22 Feb 2023 10:05:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B859C6124F;
	Wed, 22 Feb 2023 10:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC80C433EF;
	Wed, 22 Feb 2023 10:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677060300;
	bh=uQlRtmWEOuKqiHVFwu6hu4e8QQoptuSNe09bNvb9sqo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=OBWGuSpEa4PtrBK5nkaKAm72pq4D0vPUxSGW2P5zpKxgItfzt0RpPCR1DPeJO3l7N
	 ZPJ6nhW2GncXFA615Vcxxm/xVgZ70HCLcerf44X6gahaS1118cShj9nz2PWj94aHmF
	 hiqK0H2zTzYDsznPua3nIpmfgd2G4nLfpvG3nHWdeZXC/YWtTXJr6+ignPR2s2Wf1y
	 6q3yOOmM0XpChKvmRC9/Hii6+7pKX/xzggGy1G2X4Mnd/Cor9nXuJ8t9CXHgDe/5sK
	 7D6Cs7pcViDuL146Rt0KyhYcOS9yUmlaBpG63izn4acVAET6ZZhWIH2IClhmajDSql
	 kCuiHeZoypOZA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Remove redundant assignment to changed_flags
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230207052410.26337-1-jiapeng.chong@linux.alibaba.com>
References: <20230207052410.26337-1-jiapeng.chong@linux.alibaba.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167706029271.5928.12785836137133624745.kvalo@kernel.org>
Date: Wed, 22 Feb 2023 10:04:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_020501_536748_03E65BB5 
X-CRM114-Status: UNSURE (   7.67  )
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

Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:

> Variable changed_flags is assigned, but is not effectively used, so
> delete it.
> 
> drivers/net/wireless/ath/ath10k/mac.c:6024:22: warning: parameter 'changed_flags' set but not used.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3963
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7c4c511f74ba wifi: ath10k: Remove redundant assignment to changed_flags

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230207052410.26337-1-jiapeng.chong@linux.alibaba.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
