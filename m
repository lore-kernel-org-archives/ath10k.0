Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C969C30653
	for <ath10k@archiver.kernel.org>; Wed, 26 Jun 2024 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPnC41wSdJji2Txg9mvrVfPMHU5AtWoYLUh6Y36UiQ4=; b=ktZzUSZx83VrEo1s4fXVM7bnRe
	ndsTRemVr5iDRJK/HwO2ALgkiYWMVx5hfMVpbrdHN/QyYkmxZuR0XG5C/55vq3bsTyCY1ONI34RQY
	9Ww9GKGdHcmWXNkoKmDEU04gKpu1dMLLiNSEY9uxf5G7paWOlPcTaA4fsW+wSDkd7MAfH0HwIOkn8
	8dsyjRogfLDDkuoGMf1084iFDWOShktf2UlnTRBZIdSpnkM7/fTJlZg+JxaN4+H6HsPR97Zu4fYDB
	Szo3H51rBkT/aYbSwheKq5uNuUbvmrFawwgvNyEkXdI961RveM/Nc23f0L4xssZhmBvgfsNFG+PrW
	p47/3SAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMR8j-00000006cFW-18s0;
	Wed, 26 Jun 2024 11:48:41 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMR8c-00000006cD7-0kSg
	for ath10k@lists.infradead.org;
	Wed, 26 Jun 2024 11:48:38 +0000
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 58C2561E5FE07;
	Wed, 26 Jun 2024 13:48:02 +0200 (CEST)
Message-ID: <d19d520c-547b-46c1-b59e-748c2cccaf53@molgen.mpg.de>
Date: Wed, 26 Jun 2024 13:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
To: Kalle Valo <kvalo@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
 James Prestwood <prestwoj@gmail.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Hui Wang <hui.wang@canonical.com>
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
 <1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com> <87iky7mvxt.fsf@kernel.org>
 <37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com> <875xu6mtgh.fsf@kernel.org>
 <f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
 <082024ce-fdd4-4fb1-8055-6d25f7d2e524@molgen.mpg.de>
 <878qyshuud.fsf@kernel.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <878qyshuud.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_044834_513495_82D7DEEA 
X-CRM114-Status: GOOD (  19.99  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Dear Kalle,


Am 26.06.24 um 12:16 schrieb Kalle Valo:
> Paul Menzel writes:
> 
>> Am 26.06.24 um 10:53 schrieb Baochen Qiang:
>>
>>> OK, there are two issues here:
>>> 1. invalid HT rate: "ath10k_pci 0000:02:00.0: invalid ht params rate 1440 100kbps nss 2 mcs 7".
>>> As commented by Wen quite some time ago, this has been fixed from
>>> firmware side, and firmware newer than [ver:241] has the fix
>>> included.
> 
> I assume this means that the firmware version
> WLAN.RM.4.4.1-00241-QCARMSWPZ-1 or newer has the fix.
> 
>>> 2. invaid VHT rate: "ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps nss 2 mcs 9".
>>> After checking with firmware team, I thought this is because there is
>>> a mismatch in rate definition between host and firmware: In host, the
>>> rate for 'nss 2 mcs 9' is defined as {1560, 1733}, see
>>> supported_vht_mcs_rate_nss2[]. While in firmware this is defined as
>>> {1730, 1920}. So seems we can update host definition to avoid this
>>> issue.
>> 
>> Looking through the logs since May 2024, I have four different logs:
>>
>> 1.  invalid vht params rate 878 100kbps nss 3 mcs 2
>> 2.  invalid vht params rate 960 100kbps nss 1 mcs 9
>> 3.  invalid vht params rate 1730 100kbps nss 2 mcs 9
>> 4.  invalid vht params rate 1920 100kbps nss 2 mcs 9
>>
>> I believe it’s only happening with Cisco networks. I am happy to test
>> a patch.
>>
>> By the way, is the firmware version logged by Linux?
>>
>>      ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
>>      ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
>>      ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
>>      ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A crc32 d2863f91
>>      ath10k_pci 0000:3a:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
>>
>> Is it 4.4.1-00288?
> 
> Yes, that should be WLAN.RM.4.4.1-00288-QCARMSWPZ-1. But I don't know
> why 'QCARMSWPZ-1' is not printed by ath10k, maybe we have a bug
> somewhere.
> 
>> How can I find the file in `/lib/firmware/`?
> 
> It should be in ath10k/QCA6174/hw3.0/firmware-6.bin.
> 
> All firmware releases are available here:
> 
> https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/tree/main/QCA6174/hw3.0/4.4.1?ref_type=heads
> 
> And more info here:
> 
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware

Thank you. It looks like the latest firmware version is 309, and Debian 
sid/unstable still ships version 288 in *firmware-atheros* 20230625-2 [1].

Unfortunately, there does not seem to be a change-log for version 309 
(or any version for that matter). I am going to manually copy it anyway, 
but it’d be nice, if I knew what to expect. ;-)


Kind regards,

Paul


[1]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1074308
      "firmware-atheros: QCA 6174: Newest version 309 missing"

