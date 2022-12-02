Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC429C4708D
	for <ath10k@archiver.kernel.org>; Fri,  2 Dec 2022 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEs7xMX1deMjGWHgrF9nG6IyUI0p4O2nB0rgW7HOl7g=; b=GTxt6d9WMT+Oj3
	mDvCasu9AArE8cYzBOYLgNdhpnlpoRmVmGJHqM8wv64quHlrlk+KmU1qF7MvLtQ7zAajYRXc697YX
	6vL0lfs8mfJnf03mtz815hSwIYTwToF9cjQu9iDdny6H+LZMLO3msLMyZBU50hQUW3XmCJfvmZSY4
	2eo2vsniVuNWm+gsCZzgLAYLLCwCHGoSkXWYtNA750LbY0VffOqonavvgcGd5WjRNcGzmfzD4o/IY
	naLWYamGvFcHLeUgEjOHX38etvaJafvh8hagd2UZrhWGzXe9Yio7fYRZV8cGibQ6cFYJejKGEnygO
	1FP9LXa6p2pPtrf2pGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13OI-00FW2b-MX; Fri, 02 Dec 2022 10:35:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13OF-00FVzA-3M
	for ath10k@lists.infradead.org; Fri, 02 Dec 2022 10:35:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7A2B2B820F1;
	Fri,  2 Dec 2022 10:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A634BC433D6;
	Fri,  2 Dec 2022 10:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669977328;
	bh=gy4BSJ76mh0HAcCurbowxB8Nozc4FwfIp6+iriE3IcY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TFDHsTSV63ZHWA+a23ObzI3TB0iF2nAR6DIY2CdrxIJTyxBhG+TFfoj7+khPxCPvY
	 UTRIh1CnqeQ5OwxFjKirUvSvBj16lRSy8mnH/wBZm5gtY6NCFzNev6X1Et37H9ygoB
	 SIyfjs4qfBeyYEhUF2mhzkHu7TyJCWM9XlSlZOMDFDaf88Y+Uq1Mm7m5XoT5X3bHWA
	 77f94e64K13ROczPc16BVrhrM9zcv+zYNsWQZZTPDNVSyl8Fqcac9bXQyDRIRQ6qHj
	 5aqo66RA7JeW+ydCYQEH4o6BjhriwIAVk3raDG29rZN8SpHBzP26b+IwMIM9nkJq14
	 4mT7XHDsPOTzw==
From: Kalle Valo <kvalo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Youghandhar Chintala <quic_youghand@quicinc.com>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,  quic_mpubbise@quicinc.com,  rameshn@qti.qualcomm.com
Subject: Re: [PATCH v4] wifi: ath10k: Store WLAN firmware version in SMEM image table
References: <20221117180534.2267-1-quic_youghand@quicinc.com>
	<Y4YsyaIW+CPdHWv3@dev-arch.thelio-3990X> <87sfi13tya.fsf@kernel.org>
Date: Fri, 02 Dec 2022 12:35:24 +0200
In-Reply-To: <87sfi13tya.fsf@kernel.org> (Kalle Valo's message of "Wed, 30 Nov
	2022 07:14:05 +0200")
Message-ID: <877cza3xg3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_023531_443718_1D2A18E7 
X-CRM114-Status: GOOD (  16.24  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Nathan Chancellor <nathan@kernel.org> writes:
>
>> On Thu, Nov 17, 2022 at 11:35:34PM +0530, Youghandhar Chintala wrote:
>>
>>> In a SoC based solution, it would be useful to know the versions of the
>>> various binary firmware blobs the system is running on. On a QCOM based
>>> SoC, this info can be obtained from socinfo debugfs infrastructure. For
>>> this to work, respective subsystem drivers have to export the firmware
>>> version information to an SMEM based version information table.
>>> 
>>> Having firmware version information at one place will help quickly
>>> figure out the firmware versions of various subsystems on the device
>>> instead of going through builds/logs in an event of a system crash.
>>> 
>>> Fill WLAN firmware version information in SMEM version table to be
>>> printed as part of socinfo debugfs infrastructure on a Qualcomm based
>>> SoC.
>>> 
>>> This change is applicable only for SNOC/QMI based targets.
>>> 
>>> Example:
>>> cat /sys/kernel/debug/qcom_socinfo/cnss/name
>>> QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>>> 
>>> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>>> 
>>> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
>>> ---
>>> Changes from v3:
>>>  - Changed patch title
>>>  - Changed naming conventions
>>>  - Removed MAX_BUILD_ID_LEN usuage
>>>  - Added condition to call API
>>>  - Changed depends on QCOM_SMEM to select QCOM_SMEM
>>
>> You cannot blindly select user configurable symbols that have
>> dependencies, otherwise you end up with Kconfig warnings. I see the
>> following warning in -next when CONFIG_HWSPINLOCK is disabled:
>>
>>   WARNING: unmet direct dependencies detected for QCOM_SMEM
>>     Depends on [n]: (ARCH_QCOM [=y] || COMPILE_TEST [=n]) && HWSPINLOCK [=n]
>>     Selected by [m]:
>>     - ATH10K_SNOC [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH10K [=m] && (ARCH_QCOM [=y] || COMPILE_TEST [=n])
>>
>> That should likely be changed back to 'depends on'. The reason the other
>> QCOM symbols are selected is because they are not user-selectable, so
>> they have to be selected by the configurations that need them.
>
> Thanks, I didn't realise this. I'll send a patch changing it to 'depends
> on'.

Here's the patch:

https://patchwork.kernel.org/project/linux-wireless/patch/20221202103027.25974-1-kvalo@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
