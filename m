Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88810C433F5
	for <ath10k@archiver.kernel.org>; Wed,  8 Dec 2021 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjGw/O+B0R4swHGeuneGJOHGoOiwjVl/U6vI7R5nn7g=; b=E6ZRTKybxfz6dH
	sZ0lPqYC28zFhuRK8Tl644ZyB4HkLEfO1socZVPNfR7oz/4l+YleKngIVb7qq4E+aY/BtoDFnfCZ5
	7kVLgg0zv1OJllrTTDDsn4H99zcH2HELqTXtiPY9wsBEdwuUdnRCzlf6lFAtpSqdinVq+FZDHQOGN
	RIegqkI8j18P3mR2I1DgTdFNDbI2qCiXA637UvNJDvrKk6cYq18orOm6Yku5KtBs5SAP44VuBSqtg
	YKtEWEnLr6d+P0lArTiyFWHN/o2Y2PNc7Nx7mgA3YFSTZT+e2r1us2rFfNkjC95F8zoU3EZgyAGu+
	qJ574UTqLWVLcXt03b+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musoS-00BoK1-PB; Wed, 08 Dec 2021 09:00:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musoP-00BoJW-QY
 for ath10k@lists.infradead.org; Wed, 08 Dec 2021 09:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A538B81FEC;
 Wed,  8 Dec 2021 09:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F60AC00446;
 Wed,  8 Dec 2021 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638954027;
 bh=krJM6Mq5KiIT+RpKx7SpSZi6opk/kHp4633AN7KqKUA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=KbbOnivmkx2Cn6riN/3Iy5hogWLewzB44dI7KMH/AVBkj5ewkHpWFfg3BIOyFnBUi
 edCmHxXFGpABzrRJOw9+DpEtNzTw14fzGSg4Gnoz92IvK/4oSPiL6Jnr/iUgSrhOZs
 IgUPqRVdhjfkxHPjLZ0cHih00C1NK65vxMeYbOBsKoYO35NWJeNIyR8nh9suOX1hD/
 g/Y40nb/Les7rhMIlXcWgCxC6O1vfin7IRcy/xRa7YZrV70G3UZDBmX8zofxnKBFK2
 hknQ5x/ZrPGyeXmzmdZQmY1SJJK8bARO1yFMWzFTevew2vUJYytepQotQqYc46Bt9J
 +XRiGrgzjl4DQ==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath10k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] ath10k: drop beacon and probe response which leak from
 other channel
References: <20211208061752.16564-1-quic_wgong@quicinc.com>
Date: Wed, 08 Dec 2021 11:00:22 +0200
In-Reply-To: <20211208061752.16564-1-quic_wgong@quicinc.com> (Wen Gong's
 message of "Wed, 8 Dec 2021 01:17:52 -0500")
Message-ID: <87pmq7fp3t.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_010030_027973_466E7DA1 
X-CRM114-Status: GOOD (  17.25  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> When scan request on channel 1, it also receive beacon from other
> channels, and the beacon also indicate to mac80211 and wpa_supplicant,
> and then the bss info appears in radio measurement report of radio
> measurement sent from wpa_supplicant, thus lead RRM case fail.
>
> This is to drop the beacon and probe response which is not the same
> channel of scanning.
>
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
> v2: rebased to ath.git ath-202112071521
>
>  drivers/net/wireless/ath/ath10k/wmi.c | 28 ++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 7c1c2658cb5f..07764ee409fe 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2610,10 +2610,32 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
>  	if (ieee80211_is_beacon(hdr->frame_control))
>  		ath10k_mac_handle_beacon(ar, skb);
>  
> +

This caused a new warning:

drivers/net/wireless/ath/ath10k/wmi.c:2613: Please don't use multiple blank lines

Fixed in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
