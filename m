Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AF1C3DA78
	for <ath10k@archiver.kernel.org>; Tue, 17 Jan 2023 11:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gq5TTB1ycWv4YYymtVdu126LoZPExlnEYBmIpGq4XU=; b=Zcww5ts9EWohTt
	4xTs9QJxvwleRru6RcSYwUmaCR1+SYuziuTXCReahXcyB/SEu+s1CM0tflXHR74TgmRr8YOAgsYSB
	F1dnlkuMPtHZYgNcOaEM7twHL8E4QqgJN9JJEAQlGfyu35LzJ9OWs0FDCriXTdTvH+4Etq7vrzmiB
	UPWhC2tDlseamRLVFFPTGz1hE7Me1Mz+TzE0f4+nr1waO9QonIaoFgdLjUT5EZvY2EaWOG6+4zyHo
	uA/cnbCPgTLPwPTR3BcDkj1vdDib6ldC6LnhwM4/J1lFLoH+5wfITCtKKbyOMrIpXhkvTvKM0bRWO
	N/81sLSpnaZ95jqdr7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkbP-00E6Y4-Qs; Tue, 17 Jan 2023 11:58:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkbM-00E6Wl-KD
	for ath10k@lists.infradead.org; Tue, 17 Jan 2023 11:58:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 822CDCE167C;
	Tue, 17 Jan 2023 11:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB2DC433D2;
	Tue, 17 Jan 2023 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673956680;
	bh=CfY0vKBLLa78iuxTi6W0/d/1e7iUQFA5mLDhSfHHTao=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=E0OO6GabjV2cNT1r2R4mEd2T0B+XUQGP4ZfCmveHjMaYwqEyiM2Adq/TurSWPz9Ob
	 lP8KJ+oUa7a7wx2WoS0G+qg1yWN6lpaj5tPLvBBPSYWiptz9WcGKn7y2WJNi9/jNyp
	 eFflKhpJr5/A52fXssPo1yFZfdjqDoKIN9f4CIQVVred1W851v/bYwH3S0vL8mpd3P
	 4FBnkCG4uIl+52O5r6teZQoIYzdps2GBEud+C5PJvKFD4VO1IRp6jStCvE8R2UFHE7
	 +Qsskn5aSOS0aYeH8ZXAVFIBttwGdim5Z6nIo5D3h868GQCat97JpV40j9JfmHfAO9
	 c54d/LXHzSSAg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: Remove the unused function
 ath10k_ce_shadow_src_ring_write_index_set()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221219132041.91418-1-jiapeng.chong@linux.alibaba.com>
References: <20221219132041.91418-1-jiapeng.chong@linux.alibaba.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167395667652.22891.15435711500083496948.kvalo@kernel.org>
Date: Tue, 17 Jan 2023 11:57:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_035804_866381_CD69A84D 
X-CRM114-Status: UNSURE (   8.33  )
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

> The function ath10k_ce_shadow_src_ring_write_index_set is defined in the
> ce.c file, but not called elsewhere, so remove this unused function.
> 
> drivers/net/wireless/ath/ath10k/ce.c:212:1: warning: unused function 'ath10k_ce_shadow_dest_ring_write_index_set'.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3519
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

179340dd4b39 wifi: ath10k: Remove the unused function ath10k_ce_shadow_src_ring_write_index_set()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221219132041.91418-1-jiapeng.chong@linux.alibaba.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
