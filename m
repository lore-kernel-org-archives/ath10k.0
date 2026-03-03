Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F5DEDEBEC
	for <ath10k@archiver.kernel.org>; Tue,  3 Mar 2026 20:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgOZrXhSvk/RcO52eeYo0jmSPR2PFwy4VajF0IuSt1s=; b=tZ4cYWSzQbqKC+OE0nnMcobmuU
	WoaFXMGNzTZw8IhKwWoJQrwjk63jF21Qjtf0jw/jswh3BHE/6AufZtsozddrSWY8MDKjPLHkbOGJY
	GeNFVToUeBvLOwPY41gxs6dqnC58VRaX2qN84Ad7hPOzVjXgwNqkyUzsSo+bCCjkJnpUN4kOTXED4
	S9uKCSYnsM3dqGecLHTojxbmDMPUr1uETcJ8YNq+fdz62vM5+2AEnYilCzoUH8AjF+gk4o8QsA0Wj
	IBPNyRYkJkHa5ul5QLVpIf4vYQbpPvgDiDTU68PCb/QkGHLP6GZyw1A3XKdETF38jnP53d19yu1T9
	UKb++eaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVvt-0000000FsBR-3MTX;
	Tue, 03 Mar 2026 20:01:29 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVvr-0000000Fs9Y-0XEG
	for ath10k@lists.infradead.org;
	Tue, 03 Mar 2026 20:01:28 +0000
Received: from [192.168.0.192] (ip5f5af739.dynamic.kabel-deutschland.de [95.90.247.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7165B4C2C37D64;
	Tue, 03 Mar 2026 21:01:05 +0100 (CET)
Message-ID: <e71b2039-0478-4775-b221-753dc25647d5@molgen.mpg.de>
Date: Tue, 3 Mar 2026 21:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning `ath10k_pci 0000:3a:00.0: not found station for peer
 stats`
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
 <6a83fd12-edd8-4559-b7ba-75b074fa889f@molgen.mpg.de>
 <5c152304-853d-4142-8553-55cd8907f271@oss.qualcomm.com>
 <2c722676-98c6-4162-96cb-9bea06672153@molgen.mpg.de>
 <badaf39e-6ab7-4be7-944a-cfc9d6757db2@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <badaf39e-6ab7-4be7-944a-cfc9d6757db2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_120127_320136_193710EC 
X-CRM114-Status: GOOD (  12.13  )
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

Dear Baochen,


Am 11.02.26 um 06:43 schrieb Baochen Qiang:

> On 2/10/2026 6:31 AM, Paul Menzel wrote:

>> Am 09.02.26 um 03:44 schrieb Baochen Qiang:
>>
>>> On 2/7/2026 1:55 PM, Paul Menzel wrote:
>>
>>>> Am 19.01.26 um 17:41 schrieb Paul Menzel:
>>>>
>>>>> Since January 10th, I have started seeing the warning below in
>>>>> my Linux logs, that reach back to September 24th, 2025:
>>>>>
>>>>>        [   37.108902] ath10k_pci 0000:3a:00.0: not found station for peer stats
>>>>>        [   37.108906] ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>>>>
>>>>> It started appearing with 6.19.0-rc4-00282-gb6151c4e60e5, the
>>>>> version running before is 6.19.0-rc4-00003-g3609fa95fb0f, but I
>>>>> do not see anything related in the commit list:
>>>>>
>>>>>        git log --oneline 3609fa95fb0f...b6151c4e60e5
>>>>>
>>>>> The warning log from `drivers/net/wireless/ath/ath10k/wmi-tlv.c` has also been there
>>>>> since 2021.
>>>>>
>>>>> Do you have an idea? Please find the output of `dmesg` attached.
>>>>
>>>> Looking through the commit list from above again, commit
>>>> a203dbeeca15 (wifi: mac80211: collect station statistics earlier
>>>> when disconnect) probably introduced the new behavior.
>>>
>>> is this error seen when disconnecting from AP?
>>
>> I attached the logs in my first message. But yes, it looks like this:
> 
> sorry, didn't notice there was an attachment.
> 
>>
>>      Feb 07 06:32:52 abreu kernel: wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by local choice (Reason: 3=DEAUTH_LEAVING)
>>      Feb 07 06:32:52 abreu kernel: ath10k_pci 0000:3a:00.0: not found station for peer stats
>>      Feb 07 06:32:52 abreu kernel: ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>      Feb 07 06:32:52 abreu wpa_supplicant[846]: wlp58s0: CTRL-EVENT-DISCONNECTED bssid=74:1a:e0:e7:b4:c8 reason=3 locally_generated=1
>>      Feb 07 06:32:52 abreu wpa_supplicant[846]: BSSID 74:1a:e0:e7:b4:c8 ignore list count incremented to 2, ignoring for 10 seconds
>>
>>> did you try with that commit reverted?
>> 
>> Yes, I tried it now with Linux 6.19 and reverting the commit. The warnings are gone now.
>>
>> Are you able to reproduce the issue? What devices are you testing with?
> 
> I managed to reproduce this issue locally. Will submit a patch fixing it.
Sorry for being impatient, but as Linux 7.0-rc2 was tagged, were you 
able to come up with a patch, or should the commit be reverted for now 
to have more time to analyze this?


Kind regards,

Paul

