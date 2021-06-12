Return-Path: <SRS0=NYaa=LG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0893BC48BCF
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 13:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F836108E
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 13:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9F836108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=connolly.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWUizOaSH/ltwBDtnAL/bzl7mA+87C4FIJptuB1LEsc=; b=DYKGifmcpuEqaw
	E/ZMGHJqp+qGFvWYz1kfkIL8+Obl2KwftNNqbmCcVH2UdjUO5B9G84XWVm0U8jfejqj6kL6n9joCx
	osB9cU6iVIhbjgRhp996e2nLXmnFxw7vYifbqlMaE4hle1v7csxTaSjEaOu6zSchb1zJ4kP2W6tou
	dRhFKzSGvmgT/wXJD+erhptQIZcSKhDl0VD8DAZZlI8vuDytodbu8KiKXfAB77tbswdOVKZQo4x1s
	GNwxbatcUjuNFehw9bg5LX47hi9qdqpc79hmTypojT/o1Am1LcH1c8ABLBzIj+/EiOfUH8Nc8ZJdf
	rzdXIaTL0mqyAXd4Fxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls3GC-008XBE-J0; Sat, 12 Jun 2021 13:01:12 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls3G8-008X6X-Ex
 for ath10k@lists.infradead.org; Sat, 12 Jun 2021 13:01:10 +0000
Date: Sat, 12 Jun 2021 13:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1623502861;
 bh=pgwY2LSzrTH3x6cddXIr2d/PpxKxnWBnWbNdx+MeaIo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=R3EfeI/qLvB3XtNMyPPJGZ2lfAlWHHeOIMHnuhmolSn1ZjiPG9nmQbfF0qZ6QC0OO
 CjaEG9Z2rFmvy096uZGobcgSpGKvJw7Igs1lZFJ4U6qek2wPmXw9njdu4yMnPYH1uk
 /ztfBzM9NLGgXrDy1VQXgMcJuXOeUXbjz3ihwbDI=
To: Kalle Valo <kvalo@codeaurora.org>
From: Caleb Connolly <caleb@connolly.tech>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath10k: demote chan info without scan request warning
Message-ID: <f39034ea-f4da-1564-e22f-398e4a1ae077@connolly.tech>
In-Reply-To: <20210612103640.2FD93C433F1@smtp.codeaurora.org>
References: <20210522171609.299611-1-caleb@connolly.tech>
 <20210612103640.2FD93C433F1@smtp.codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_060108_708879_6E249B98 
X-CRM114-Status: UNSURE (   7.17  )
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On 12/06/2021 11:36 am, Kalle Valo wrote:
> Caleb Connolly <caleb@connolly.tech> wrote:
>
>> Some devices/firmwares cause this to be printed every 5-15 seconds,
>> though it has no impact on functionality. Demote this to a debug
>> message.
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Is this meant to be an Ack?
>
> On what hardware and firmware version do you see this?
I see this on SDM845 and MSM8998 platforms, specifically the OnePlus 6
devices, PocoPhone F1 and OnePlus 5.
On the OnePlus 6 (SDM845) we are stuck with the following signed vendor fw:

[    9.339873] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214
chip_family 0x4001 board_id 0xff soc_id 0x40030001
[    9.339897] ath10k_snoc 18800000.wifi: qmi fw_version 0x20060029
fw_build_timestamp 2019-07-12 02:14 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c8-00041-QCAHLSWMTPLZ-1

The OnePlus 5 (MSM8998) is using firmware:

[ 6096.956799] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214
chip_family 0x4001 board_id 0xff soc_id 0x40010002
[ 6096.956824] ath10k_snoc 18800000.wifi: qmi fw_version 0x1007007e
fw_build_timestamp 2020-04-14 22:45 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HL.1.0.c6-00126-QCAHLSWMTPLZ-1.211883.1.278648.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/patch/20210522171609.299611-1-caleb@connolly.tech/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>

--
Kind Regards,
Caleb


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
