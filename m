Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09041C4332F
	for <ath10k@archiver.kernel.org>; Wed, 30 Nov 2022 05:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2QP74c1S8mfX2tbbJMZdOxFKAQbLWUC7YJymN9Gcgg=; b=LuK0tOWePOIpY2
	I68z3eSnipVj1qXvbwVJnk9MiMwcFMS4EzhpuKOX6YUFOzFc2beGcdrsmG3deIQ9glb9AdUMX2kU7
	CTYJf9kk5qf9G0pDpTHS0aSZ24hVHBxlFmyPrJdEA7eh4Mj9qA878MeEvZ66x3T6aqh9gVA+zPwBY
	ywFv0N+mGH/jXexshYTM+8zaIYA+6OQzVaS0gNqYsLSCQLc1SHxvIBi6uL5XEOhcEcv3YBkLqiQZ1
	BQxApEwXtU7UEOenZDl2u2CzsmJHCTWKOj1MphrAQcycG6ltqoWSWSe4YXzexegbSTx1KIlDLiCPb
	nr3SyUgYMbOc9bzTn1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0FQG-00DJCq-HC; Wed, 30 Nov 2022 05:14:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0FQD-00DJAl-H1
	for ath10k@lists.infradead.org; Wed, 30 Nov 2022 05:14:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21700619B2;
	Wed, 30 Nov 2022 05:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC373C433D6;
	Wed, 30 Nov 2022 05:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669785251;
	bh=CqrmiuOOxenDGqbbJzSkLOlZlAOT8xZfVDi8NlAoucg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X5LsRBBmSdMxilT7u1kEOnYe1lcKIhr0qRADdbDRXYrFsTm6sVEujTgKxCUkNV3rQ
	 +qWzWRJ1xa7zhDoS4Ce94E10R+Zry4YJOWhaWl0snQqpJH0pvDRX0dGRV2SxKvX0W1
	 yqA2ZqCaHXV96Wv1cJU/IRHBQCJ7HsykzNNBaHN86cAvwq8/OkiJG908gRR4J5f0/g
	 TbaX/DWOeTEz1oOg8Tx5qrgv2wWSQF0sQshbq5UFeizM21Mro4wD5smfET6tLOFnT2
	 mHQTtOusPTzAzsuU8OjlXoeJ9XvH1FP8dB/ZLlkjXS5NSyASvHjago/qe2MjgUi5z7
	 FQIEBOEoV7Kgw==
From: Kalle Valo <kvalo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Youghandhar Chintala <quic_youghand@quicinc.com>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,  quic_mpubbise@quicinc.com,  rameshn@qti.qualcomm.com
Subject: Re: [PATCH v4] wifi: ath10k: Store WLAN firmware version in SMEM image table
In-Reply-To: <Y4YsyaIW+CPdHWv3@dev-arch.thelio-3990X> (Nathan Chancellor's
	message of "Tue, 29 Nov 2022 09:01:13 -0700")
References: <20221117180534.2267-1-quic_youghand@quicinc.com>
	<Y4YsyaIW+CPdHWv3@dev-arch.thelio-3990X>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 30 Nov 2022 07:14:05 +0200
Message-ID: <87sfi13tya.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_211413_697014_1694C5AB 
X-CRM114-Status: GOOD (  18.52  )
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

Nathan Chancellor <nathan@kernel.org> writes:

> On Thu, Nov 17, 2022 at 11:35:34PM +0530, Youghandhar Chintala wrote:
>
>> In a SoC based solution, it would be useful to know the versions of the
>> various binary firmware blobs the system is running on. On a QCOM based
>> SoC, this info can be obtained from socinfo debugfs infrastructure. For
>> this to work, respective subsystem drivers have to export the firmware
>> version information to an SMEM based version information table.
>> 
>> Having firmware version information at one place will help quickly
>> figure out the firmware versions of various subsystems on the device
>> instead of going through builds/logs in an event of a system crash.
>> 
>> Fill WLAN firmware version information in SMEM version table to be
>> printed as part of socinfo debugfs infrastructure on a Qualcomm based
>> SoC.
>> 
>> This change is applicable only for SNOC/QMI based targets.
>> 
>> Example:
>> cat /sys/kernel/debug/qcom_socinfo/cnss/name
>> QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>> 
>> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>> 
>> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
>> ---
>> Changes from v3:
>>  - Changed patch title
>>  - Changed naming conventions
>>  - Removed MAX_BUILD_ID_LEN usuage
>>  - Added condition to call API
>>  - Changed depends on QCOM_SMEM to select QCOM_SMEM
>
> You cannot blindly select user configurable symbols that have
> dependencies, otherwise you end up with Kconfig warnings. I see the
> following warning in -next when CONFIG_HWSPINLOCK is disabled:
>
>   WARNING: unmet direct dependencies detected for QCOM_SMEM
>     Depends on [n]: (ARCH_QCOM [=y] || COMPILE_TEST [=n]) && HWSPINLOCK [=n]
>     Selected by [m]:
>     - ATH10K_SNOC [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH10K [=m] && (ARCH_QCOM [=y] || COMPILE_TEST [=n])
>
> That should likely be changed back to 'depends on'. The reason the other
> QCOM symbols are selected is because they are not user-selectable, so
> they have to be selected by the configurations that need them.

Thanks, I didn't realise this. I'll send a patch changing it to 'depends
on'.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
