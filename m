Return-Path: <SRS0=uzqH=HK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F2AC433DB
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 17:22:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C53964E56
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 17:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C53964E56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f8dw50F3YkedC3QMGptjx8Zs25uveQhopb2gwYXF310=; b=s8KGGjEj/xjNJAi3nqyz4P/tQ
	jNfTJnAeKYh28VLoWG6Vi4nUeqZQq6nu77REERO+Xb5bMbmv02wth5DE9qpoqxwbHLv5UXrNiln6r
	R4BTrus4UCxt/MOpjkTLD4EfA4zXORr4dFZfICC6YRUS7e//QTQF6ten06LKfDm+2392nNMw+zANX
	dwf5rQDNkFrMMBua6+fR8M1iLNxyfYEhPAdWSuD50km5BgEsJu40vFd/GPJkMxQ/pxljvVtO10pLW
	3/Q6fKbSHKeBtWn+ZOPbTF/mv36nl7hSKeHY6wnSGa5FYxesCOV1+8pEuZzcdV95iCQYF9Gor0e6R
	0CGS9BOiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9AEU-000161-Uh; Mon, 08 Feb 2021 17:21:54 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9AEQ-000155-3q
 for ath10k@lists.infradead.org; Mon, 08 Feb 2021 17:21:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612804911; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=VvrhI2uHyem0TWcE3hoIWIu/Lz0TWdmIj8+lLm4p6+c=;
 b=MFzDdhwGV0om+60FgXixYdoGy6FYDeJRA7M+/ddp/m2V+nUnU8H++Tinxy9dzxp1glo5vFoz
 GUvqd43eMX+I3t0nOnmb7nNTsnJQd3iWBrY7Hf/G+LoOKlJ6qPqY2BR982VnKTtntW+GVj0d
 bEw7ChSqtax0ubeoTbK0k0e7dek=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6021731a8e43a988b735c385 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Feb 2021 17:21:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3F998C43462; Mon,  8 Feb 2021 17:21:30 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C6D8C433CA;
 Mon,  8 Feb 2021 17:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C6D8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap QMI
 requests
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
 <20200929190817.GA968845@bogus> <20201029134017.GA807@yoga>
 <CAMi1Hd20UpNhZm6z5t5Kcy8eTABiAj7X_Gm66QnJspZWSio0Ew@mail.gmail.com>
 <20201124175146.GG185852@builder.lan> <87sg8heeta.fsf@codeaurora.org>
 <CAMi1Hd2FN6QQzbKHooVyqQfH1NFTNLt4RwxyVXRf+5DwTc9ojg@mail.gmail.com>
Date: Mon, 08 Feb 2021 19:21:24 +0200
In-Reply-To: <CAMi1Hd2FN6QQzbKHooVyqQfH1NFTNLt4RwxyVXRf+5DwTc9ojg@mail.gmail.com>
 (Amit Pundir's message of "Tue, 2 Feb 2021 16:41:19 +0530")
Message-ID: <87czxa4grv.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_122151_623297_46EFCE78 
X-CRM114-Status: GOOD (  18.14  )
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
Cc: Rob Herring <robh@kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dt <devicetree@vger.kernel.org>,
 David S Miller <davem@davemloft.net>, John Stultz <john.stultz@linaro.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Amit Pundir <amit.pundir@linaro.org> writes:

> Hi Kalle,
>
> On Mon, 7 Dec 2020 at 22:25, Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> This is firmware version specific, right? There's also enum
>> ath10k_fw_features which is embedded within firmware-N.bin, we could add
>> a new flag there. But that means that a correct firmware-N.bin is needed
>> for each firmware version, not sure if that would work out. Just
>> throwing out ideas here.
>
> Apologies for this late reply. I was out for a while.

No worries.

> If by that (the firmware version) you mean "QC_IMAGE_VERSION_STRING",
> then that may be a bit tricky. Pocophone F1 use the same firmware
> family version (WLAN.HL.2.0.XXX), used by Dragonboard 845c (which has
> Wi-Fi working upstream).

I'm meaning the ath10k firmware meta data we have in firmware-N.bin
(N=2,3,4...) file. A quick summary:

Every ath10k firmware release should have firmware-N.bin. The file is
created with this tool:

https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-fwencoder

firmware-N.bin contains various metadata, one of those being firmware
feature flags:

enum ath10k_fw_features {
	/* wmi_mgmt_rx_hdr contains extra RSSI information */
	ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX = 0,

	/* Firmware from 10X branch. Deprecated, don't use in new code. */
	ATH10K_FW_FEATURE_WMI_10X = 1,

        [...]

So what you could is add a new flag enum ath10k_fw_features, create a
new firmware-N.bin for your device and enable the flag on the firmware
releases for your device only.

I don't know if this is usable, but one solution which came to my mind.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
