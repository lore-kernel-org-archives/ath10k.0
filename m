Return-Path: <SRS0=CzWf=F2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94913C433DB
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 22:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE6722573
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 22:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DE6722573
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d1M4m7JTN2WS5I4IyooMmVIaY+4NWWRTiKBx0I23iRs=; b=UPDTa7UKwfa12kbX5ViJoAaBE
	1WfKeulz6NwdHzMT8cpSNYv0cUY8jk/p+QvVihkfIPoD37G42gvMFxRV7NbM+vSAZrUwfLb8OQdOQ
	6NjzddU3ytu1u6Dt2bJabREH9j1S7LS0s9kGgXEPtoiT+zyVw+3V5XnGfjH0E6kgD/9furU2KejnR
	vHQmipbo+bQu+sJYsi+D6PVpt1+GSn7sr97jDFLmC9a9/9asaqjnx8cqWcR6KYLicxNtFoyZX4lna
	5uxlwAyCtUzfi7kVKaa3gQ5CNayaklBZPbZxry9cJ7qBKOUIGxneZMXsrZ5H5ElztuyD9AUmkZyZ0
	HExnix1Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krqHV-00083D-1h; Tue, 22 Dec 2020 22:37:25 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krqHS-00082b-SN
 for ath10k@lists.infradead.org; Tue, 22 Dec 2020 22:37:23 +0000
Received: by mail-io1-xd30.google.com with SMTP id 81so13377912ioc.13
 for <ath10k@lists.infradead.org>; Tue, 22 Dec 2020 14:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=djZGsbrkmGA94jAXMOhutdjZdetBTqkQXt4zsACd0OM=;
 b=Z8Ugi74CxfCPMN3s/HZNn1ukTSQh20jHPmxZYidK/tLBsgUU85LmLkEK9m8Tiva5Du
 9cVovmwScoIvz0x072sABbgGW852qliKBHsMYTnzCy4u5UtU/fx0an7c/QOq8EHgQZth
 S7BTWvhvN8nhQkA6W/noUD1I18PhFFoisCdFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=djZGsbrkmGA94jAXMOhutdjZdetBTqkQXt4zsACd0OM=;
 b=ac+xy49OYMT6V7HP9EF8RWfX520n5E4YoUK4iLAzfbGvY1xB6htdFa9MilNfbV6dzT
 D1aJtr+L9gi6xeBUrsXnBvtp/2T/68gqOGOxwtQ7G3VJcbIl/rKRjMGqyX3yWtej3gkh
 8NpLzt6mpgT7+FwCmLqQjUAr1U/V01vBgcdMw/7ICY6E8J6UEeg717IFb1LOnVTMKpaK
 kFx74in2z3rpkz8ecFhF/jnNo6WX6VEIYMmqPP3yAG7AGdLKriOpaUzppYsSIit3yK9f
 cY3QzoBGFQldHXkYNhdfHOOAyCd+jnmr6y19SS4ETzb4I8yU4oJbvcv+YpuwYrQ0fN5e
 6szA==
X-Gm-Message-State: AOAM531Yzdzbai1EsK44YXdZZLIt1215MXheYsxSLS7Ankq9VuMLlAQM
 KMS4a59urhU2VWycZ65PDZikzBFOFxl3vKwgs03IizLmMIt3kRP2
X-Google-Smtp-Source: ABdhPJzjPE3ifZKjaoRV9kaxRig0JeWpFArkXbVay9Rq/k+MZUU5lRDgK84v6MDTfAop8WyZlSSNI01+2WrWzmEqp2k=
X-Received: by 2002:a02:a304:: with SMTP id q4mr20446611jai.97.1608676639053; 
 Tue, 22 Dec 2020 14:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20201215172435.5388-1-youghand@codeaurora.org>
In-Reply-To: <20201215172435.5388-1-youghand@codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 22 Dec 2020 14:36:58 -0800
Message-ID: <CACTWRwsM_RJnssBpxDpRSbex4_1T9QDv3+ZT7eLnYsgOgtGFQw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: Set wiphy flag to trigger sta disconnect on
 hardware restart
To: Youghandhar Chintala <youghand@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_173722_958987_517ABAEE 
X-CRM114-Status: GOOD (  19.82  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev <netdev@vger.kernel.org>, Brian Norris <briannorris@chromium.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Dec 15, 2020 at 9:24 AM Youghandhar Chintala
<youghand@codeaurora.org> wrote:
>
> From: Rakesh Pillai <pillair@codeaurora.org>
>
> Currently after the hardware restart triggered from the driver,
> the station interface connection remains intact, since a disconnect
> trigger is not sent to userspace. This can lead to a problem in
> hardwares where the wifi mac sequence is added by the firmware.
>
> After the firmware restart, during subsytem recovery, the firmware
> restarts its wifi mac sequence number. Hence AP to which our device
> is connected will receive frames with a  wifi mac sequence number jump
> to the past, thereby resulting in the AP dropping all these frames,
> until the frame arrives with a wifi mac sequence number which AP was
> expecting.
>
> To avoid such frame drops, its better to trigger a station disconnect
> upon the  hardware restart. Indicate this support via a WIPHY flag
> to mac80211, if the hardware params flag mentions the support to
> add wifi mac sequence numbers for TX frames in the firmware.
>
> All the other hardwares, except WCN3990, are not affected by this
> change, since the hardware params flag is not set for any hardware
> except for WCN3990
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 15 +++++++++++++++
>  drivers/net/wireless/ath/ath10k/hw.h   |  3 +++
>  drivers/net/wireless/ath/ath10k/mac.c  |  3 +++
>  3 files changed, 21 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 796107b..4155f94 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -90,6 +90,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>                 .hw_filter_reset_required = true,
>                 .fw_diag_ce_download = false,
>                 .tx_stats_over_pktlog = true,
> +               .tx_mac_seq_by_fw = false,
Probably orthogonal to this patch, there is a static array maintained
for different hardware configs and the structure members like
"tx_mac_seq_by_fw" are initialized. This does not seem to be scalable
and probably these parameters can be auto populated based on FW
capabilities and so we don't have to maintain the static array.
Thoughts?

-Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
