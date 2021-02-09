Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94ECC433E0
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 08:11:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F77A64DE0
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 08:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F77A64DE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CDCgTS85pptSddY7BsOXsXj9HJY6CdLfQ+DrS4prgbg=; b=FKCD6wELvBIgAdlX4PEZdnj7Y
	6Hlzwqw28HWJKXtVNAS2VD8kTkteJMF5pgJ4R8s+txB0VoEA/AC1+UxSPy4mHO5CQgrAn2DE0S2l6
	MUsWkGHKKoF6KCBpiLuc4wB6nMxMeZwCVAI18dluhov0jO3bajNYmpDKA5m6IdZ2lzk5IygFn5+Qm
	3RgLUFKXwIBbiogL5OD8ZMTSHe23R6grMomG9idDsP7ib3Ll2Qhdti8w4CZLUGZjdtM+cFbCmpAQR
	/iQBmw5Vu8cfQqqacB6wjGSMw79F0m8IOmmQqpGx+cqv/Ew4GjIQx8BNtJuOAgWo6Na9R0i/qaRC+
	+UEFuHyaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9O6w-0008Jz-0n; Tue, 09 Feb 2021 08:11:02 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9O6r-0008Ix-96
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 08:11:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612858259; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=5WGte9xt2dXjRFbMOx/ZKB9MKO7A9fu4SSLGKPnadEw=;
 b=VDNNXvTDGoh9Yc2QhLGv3t289SfRsm8XiAcW0q14JR5+8BLWVYsvu7v0cxh3I94J5UFP2UxJ
 B3QccGy3inJkf797LrGzspTj3CbJ0U3bMPrb/Rqd5b6GO/75JG/ezMfud2FmEdy11PYCDbyF
 b/S889mp/+9bIPL3+SDou8MqB24=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6022438b81f6c45dced25c09 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 08:10:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E89F1C433CA; Tue,  9 Feb 2021 08:10:50 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B1227C433CA;
 Tue,  9 Feb 2021 08:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1227C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap QMI
 requests
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
 <20200929190817.GA968845@bogus> <20201029134017.GA807@yoga>
 <CAMi1Hd20UpNhZm6z5t5Kcy8eTABiAj7X_Gm66QnJspZWSio0Ew@mail.gmail.com>
 <20201124175146.GG185852@builder.lan> <87sg8heeta.fsf@codeaurora.org>
 <CAMi1Hd2FN6QQzbKHooVyqQfH1NFTNLt4RwxyVXRf+5DwTc9ojg@mail.gmail.com>
 <87czxa4grv.fsf@codeaurora.org> <YCF5ZC/WMRefTRcQ@builder.lan>
Date: Tue, 09 Feb 2021 10:10:44 +0200
In-Reply-To: <YCF5ZC/WMRefTRcQ@builder.lan> (Bjorn Andersson's message of
 "Mon, 8 Feb 2021 11:48:20 -0600")
Message-ID: <87blctveyj.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_031100_031440_49304D48 
X-CRM114-Status: GOOD (  26.18  )
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Rob Herring <robh@kernel.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, Konrad Dybcio <konradybcio@gmail.com>,
 dt <devicetree@vger.kernel.org>, John Stultz <john.stultz@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 David S Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Bjorn Andersson <bjorn.andersson@linaro.org> writes:

> On Mon 08 Feb 11:21 CST 2021, Kalle Valo wrote:
>
>> Amit Pundir <amit.pundir@linaro.org> writes:
>> 
>> > Hi Kalle,
>> >
>> > On Mon, 7 Dec 2020 at 22:25, Kalle Valo <kvalo@codeaurora.org> wrote:
>> >>
>> >> This is firmware version specific, right? There's also enum
>> >> ath10k_fw_features which is embedded within firmware-N.bin, we could add
>> >> a new flag there. But that means that a correct firmware-N.bin is needed
>> >> for each firmware version, not sure if that would work out. Just
>> >> throwing out ideas here.
>> >
>> > Apologies for this late reply. I was out for a while.
>> 
>> No worries.
>> 
>> > If by that (the firmware version) you mean "QC_IMAGE_VERSION_STRING",
>> > then that may be a bit tricky. Pocophone F1 use the same firmware
>> > family version (WLAN.HL.2.0.XXX), used by Dragonboard 845c (which has
>> > Wi-Fi working upstream).
>> 
>> I'm meaning the ath10k firmware meta data we have in firmware-N.bin
>> (N=2,3,4...) file. A quick summary:
>> 
>> Every ath10k firmware release should have firmware-N.bin. The file is
>> created with this tool:
>> 
>> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-fwencoder
>> 
>> firmware-N.bin contains various metadata, one of those being firmware
>> feature flags:
>> 
>> enum ath10k_fw_features {
>> 	/* wmi_mgmt_rx_hdr contains extra RSSI information */
>> 	ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX = 0,
>> 
>> 	/* Firmware from 10X branch. Deprecated, don't use in new code. */
>> 	ATH10K_FW_FEATURE_WMI_10X = 1,
>> 
>>         [...]
>> 
>> So what you could is add a new flag enum ath10k_fw_features, create a
>> new firmware-N.bin for your device and enable the flag on the firmware
>> releases for your device only.
>> 
>> I don't know if this is usable, but one solution which came to my mind.
>
> It sounds quite reasonable to pass this using firmawre-N.bin instead of
> DT, however that would imply that we need to find firmware-N.bin in the
> device-specific directory, where we keep the wlanmdsp.mbn as well - and
> not under /lib/firmware/ath10k
>
> For other devices (e.g. ADSP, modem or wlanmdsp.mbn) we're putting these
> in e.g. /lib/firmware/qcom/LENOVO/81JL/ and specifies the location using
> a firmware-name property in DT.

Ah, I didn't realise that.

Actually I would like to have ath10k in control[1] of QMI/rproc firmware
loading as the firmware releases have different constraints, like the
issue we are now discussing. Ideally firmware-N.bin would contain all
firmware files, for example wlanmdsp.mbn, and from the meta data
ath10k/ath11k would know what version of the firmware interface should
be used.

I remember we discussed this briefly a year or two ago and there was no
easy solution, but I really wish we could find one. More these kind of
firmware interface incompatibilities will most likely pop up, also in
ath11k, so it would be great to find a clean and easily maneagable
solution.

[1] With control I mean that ath10k/ath11k can choose which firmware
should be loaded

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
