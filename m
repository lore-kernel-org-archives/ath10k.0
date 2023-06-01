Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5027EC77B7E
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4Av0+X6Hd59/m+NlQCLma80tBWvpxUNqZzVcm3OBnw=; b=IODMbbcGgbaxxO
	IOjikT/NUns1tNL3TZ969lGTVCWLb1/dZs7Vj23n0O5JMFLywdhw9w5AlylvkbjiRPBIv+XcaTVoF
	UWRnqM5YF9CJF+/dWYPv7vBfKJZoOMxkm90MuxI537G5REe0ndA7iB3IeXfvo+pPZw3/CjFeAeDwC
	ZCgtyFCCsloUVEogtAWGx3nmbNid4CgCMfLedSmmYU8spy99QwqWHaV3Ap5f5ilq73FB0YXzM1sDX
	lNzmgMQ/kJ4oakopjmlqJRN8JrS/TyYLRl3wgDIB7XeSbgDz6n08PI0LbliymLsQQagRPmC+TraVz
	DPGZP2+KixKDUS3MCOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fbY-0033Re-37;
	Thu, 01 Jun 2023 10:32:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fbW-0033P8-1V
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 10:32:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 053E1639F2;
	Thu,  1 Jun 2023 10:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B199C433EF;
	Thu,  1 Jun 2023 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685615545;
	bh=dt6p3Brt1Itsty6Taal/O+e66TI2Zbp2bCYp/pFVGaw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gFapp66adfNYkz+UlBv5CMml4HXuFfXtVf6eLzE6XDqSe34qVIkSfa0CigUpSGk9c
	 h9yqhWQtpk7A3j6Cd4X/jNX3tsSS+9zitXnZ6/aZlvp6+/RDJkIpfICV2/zOf3bX53
	 YCdQYy7Wq3Ig2BEDmUxKNOAK4cD+0p5kmijgqb3mRC+mbtS86i+G73jr/dX/7r4B4m
	 GmCghaIZbmMBc9Lg8QdAXAbviL1+z6VZv5cmiz0y6sLEM9UHOvYPr4GMe6Omd5IOMT
	 RUI3aH2CBt1ZnNmpruIpW6hvnhZxa5nwOcmdKFQFnKLBX5M2Hc+NF82AQR1Awdv+0E
	 IXyE1ZtjiBN+w==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: Trigger STA disconnect after reconfig
 complete
 on hardware restart
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230518101515.3820-1-quic_youghand@quicinc.com>
References: <20230518101515.3820-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quic_mpubbise@quicinc.com>,
 Youghandhar Chintala <quic_youghand@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168561554040.17301.14211213140833705181.kvalo@kernel.org>
Date: Thu,  1 Jun 2023 10:32:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_033226_551616_445123B4 
X-CRM114-Status: GOOD (  11.51  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> wrote:

> Currently, on WCN3990, the station disconnect after hardware recovery is
> not working as expected. This is because of setting the
> IEEE80211_SDATA_DISCONNECT_HW_RESTART flag very early in the hardware
> recovery process even before the driver invokes ieee80211_hw_restart().
> On the contrary, mac80211 expects this flag to be set after
> ieee80211_hw_restart() is invoked for it to trigger station disconnect.
> 
> Set the IEEE80211_SDATA_DISCONNECT_HW_RESTART flag in
> ath10k_reconfig_complete() instead to fix this.
> 
> The other targets are not affected by this change, since the hardware
> params flag is not set.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Fixes: 2c3fc50591ff ("ath10k: Trigger sta disconnect on hardware restart")
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

75bd32f5ce94 wifi: ath10k: Trigger STA disconnect after reconfig complete on hardware restart

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230518101515.3820-1-quic_youghand@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
