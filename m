Return-Path: <SRS0=sV6w=LH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DDDC48BCF
	for <ath10k@archiver.kernel.org>; Sun, 13 Jun 2021 09:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C56AF6120E
	for <ath10k@archiver.kernel.org>; Sun, 13 Jun 2021 09:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C56AF6120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoFwLhymUo2JiXB8oKX0zn9JV1fIBEt/mrXDxfwtL2s=; b=IUQEpmd0128fK7
	cSODHVmLsGbnpxCfEQ+OmypCCranJm1R5dz744RRhe/k5ZHjiF+BwJPJ1qCBE15kMsa/RQS3GCYeu
	6crB8eFR9nSJvDLwLSLLbB9KC7LQC+PsG+VJPcQ/vsmTow44mmvxs8juoILFxa3vVL3vXEdjxjFmh
	CGUpbx1ErlVf7GQ1hmvuDBNB1GthwcxypE7DFQLXxSUh2MPHY9GTad/MW9yNnDdyxmq1Eswj4JsdD
	envsNDJPaAT0q84YH9FddyesMN3ejWqI2z4GGYs0KfGWcvyTKwhOnn9lQruPBEzPGiyZ3J0izYnfT
	m9y/01xd3NP7100KzQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsM0i-00A2ew-V1; Sun, 13 Jun 2021 09:02:29 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsM0e-00A2e0-GD
 for ath10k@lists.infradead.org; Sun, 13 Jun 2021 09:02:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623574945; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=dQoeZwVu2n9jRfR6UQm6hwPctLkAmGru9+XJJja6Lvo=;
 b=AjVNO+H6Qguym+eglwEkMOLe+BHbyWTe+tTH5S2InrjaeFR6LvhxyJ1gJsG3cLTzokG7bXW6
 R+JOs+0HAuZ/KI57NfDhu1mn8QpbiSxFcv0cXCpnzJPY8OHl34VW6CkaT21DPrDzyAAA5SPV
 RzQFsRGsYDpkFVU5tduaUsM9lqI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60c5c98de27c0cc77f3c16a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 13 Jun 2021 09:02:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6C50DC433F1; Sun, 13 Jun 2021 09:02:04 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D256C433D3;
 Sun, 13 Jun 2021 09:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D256C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Caleb Connolly <caleb@connolly.tech>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath10k: demote chan info without scan request warning
References: <20210522171609.299611-1-caleb@connolly.tech>
 <20210612103640.2FD93C433F1@smtp.codeaurora.org>
 <f39034ea-f4da-1564-e22f-398e4a1ae077@connolly.tech>
Date: Sun, 13 Jun 2021 12:01:56 +0300
In-Reply-To: <f39034ea-f4da-1564-e22f-398e4a1ae077@connolly.tech> (Caleb
 Connolly's message of "Sat, 12 Jun 2021 13:00:57 +0000")
Message-ID: <871r96yw6z.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_020225_476213_7E0E0C51 
X-CRM114-Status: GOOD (  16.00  )
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

Caleb Connolly <caleb@connolly.tech> writes:

> Hi Kalle,
>
> On 12/06/2021 11:36 am, Kalle Valo wrote:
>> Caleb Connolly <caleb@connolly.tech> wrote:
>>
>>> Some devices/firmwares cause this to be printed every 5-15 seconds,
>>> though it has no impact on functionality. Demote this to a debug
>>> message.
>>>
>>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> Is this meant to be an Ack?

No, my patchwork script has few quirks and it actually takes the quoted
text from my pending branch, not from your actual email. That's why you
see my s-o-b there. I haven't bothered to fix that yet, but hopefully
one day.

>> On what hardware and firmware version do you see this?
>
> I see this on SDM845 and MSM8998 platforms, specifically the OnePlus 6
> devices, PocoPhone F1 and OnePlus 5.
> On the OnePlus 6 (SDM845) we are stuck with the following signed vendor fw:
>
> [    9.339873] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214
> chip_family 0x4001 board_id 0xff soc_id 0x40030001
> [    9.339897] ath10k_snoc 18800000.wifi: qmi fw_version 0x20060029
> fw_build_timestamp 2019-07-12 02:14 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c8-00041-QCAHLSWMTPLZ-1
>
> The OnePlus 5 (MSM8998) is using firmware:
>
> [ 6096.956799] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214
> chip_family 0x4001 board_id 0xff soc_id 0x40010002
> [ 6096.956824] ath10k_snoc 18800000.wifi: qmi fw_version 0x1007007e
> fw_build_timestamp 2020-04-14 22:45 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HL.1.0.c6-00126-QCAHLSWMTPLZ-1.211883.1.278648.

Thanks, I'll include this information to the commit log and then apply
the patch. And I'll assume you have also tested this patch on those
platforms so that I can add a Tested-on tag?

BTW, ath10k should strip that ugly "QC_IMAGE_VERSION_STRING=" string in
the firmware version. Patches very welcome :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
