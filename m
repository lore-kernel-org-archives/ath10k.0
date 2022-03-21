Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EABC433EF
	for <ath10k@archiver.kernel.org>; Mon, 21 Mar 2022 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abdmgO7gItBtSAuCjyYaMg7Hdp1j5Yp9js1zTgMtbv0=; b=TxJhrdBYUnfknO
	BeVr3V/MrwkPr0MfOF3zKK0NT/+5k4pgY4cPkZQ+7+Q+Lg3tUHNf5shLU74hgPD09uHMRkb5MEjrT
	TNhunkgBzJkzh/NmhqlJyspRbAgirDd1OztDIbrcvEiVswyw0aDiV7Xc5rx5/rRYM7bfgK9LSwEIz
	6XRA1pVbz83CYKltZyI1ZZye2MqbnIWahcOsHpR62kBqUo0jjMDPD3fLC2BD4lxKiV6Zf2gm540eY
	emqdOOylbbXMG4f1m0KQVmDp39Ox5eBT+nAAHk9Rlh/xGRL2T/aI26Bzm6T+KQkZjgoTcTt++DCKp
	mgj8Sl+EZXqLCt47hc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWFYn-007MCr-S8; Mon, 21 Mar 2022 10:46:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWFYl-007MCV-HE
 for ath10k@lists.infradead.org; Mon, 21 Mar 2022 10:46:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB486136C;
 Mon, 21 Mar 2022 10:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6890FC340E8;
 Mon, 21 Mar 2022 10:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647859606;
 bh=Vs+nyNU9WPQ7f8z0iHRRvmd6m3Jk9pFLsFcqph9kasw=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Xji8JWciE6aQU4muZlCqsXcPBYs396Lv+H94GDwIbQ9/JgGfmEcT1Ru8w9v5r3eK1
 GejAAaXmPvVz+VQVXhdS6xmTFx4MqNh6bhzPlM6ngzQ6UrZC/AT5a+Sgwf3Dt42MgK
 9Nm8UCn8nUNLdjCRnDZit52AZUUXmW2HbN2QhCUZsr154vfgYEfk3JSnUz0z5hgk7/
 /RY0KbZco0vn+vhyix376c0Be74gjmbtQyseHFK1mzMk8h0mURjACj891Abpv3dMUz
 07Lz+HataH0ZP7cYJ3UC2A1/EauM/ty+h1ywrK+3fmHHHJYvSMrKzEGFh1Jt1qLa5y
 Y9xm6hR1q4teg==
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/2] ath10k: Trigger sta disconnect on hardware restart
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220315082944.12406-3-youghand@codeaurora.org>
References: <20220315082944.12406-3-youghand@codeaurora.org>
To: Youghandhar Chintala <youghand@codeaurora.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, pillair@codeaurora.org, dianders@chromium.org,
 kuabhs@chromium.org, briannorris@chromium.org, mpubbise@codeaurora.org,
 Youghandhar Chintala <youghand@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164785960237.19083.15185904446289698730.kvalo@kernel.org>
Date: Mon, 21 Mar 2022 10:46:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_034647_667938_07952927 
X-CRM114-Status: GOOD (  11.71  )
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

Youghandhar Chintala <youghand@codeaurora.org> wrote:

> Currently after the hardware restart triggered from the driver,
> the station interface connection remains intact, since a disconnect
> trigger is not sent to userspace. This can lead to a problem in
> targets where the wifi mac sequence is added by the firmware.
> 
> After the target restart, its wifi mac sequence number gets
> reset to zero. Hence AP to which our device is connected will receive
> frames with a  wifi mac sequence number jump to the past, thereby
> resulting in the AP dropping all these frames, until the frame
> arrives with a wifi mac sequence number which AP was expecting.
> 
> To avoid such frame drops, its better to trigger a station disconnect
> upon target hardware restart which can be done with API
> ieee80211_reconfig_disconnect exposed to mac80211.
> 
> The other targets are not affected by this change, since the hardware
> params flag is not set.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048
> 
> Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2c3fc50591ff ath10k: Trigger sta disconnect on hardware restart

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220315082944.12406-3-youghand@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
