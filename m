Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6879C30658
	for <ath10k@archiver.kernel.org>; Fri,  5 Jul 2024 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4t+Rx08QRSL0/D2zI45fCbCA7mpO/J9mjCo2sfTiUc=; b=oQQcLwxWAg6UcG4oBK5+cvvgSa
	LpNLeiJJDtmBWcLp9pP5nm7rpLqSc/rPBzJGRqCy801+3VOEaV3uFFE45rfYIo5poJISduOU7aUYQ
	bNVxadG9LcY/qeHxImBF4HZuf8BpjIXy0XrAPpg1mdffdv90+ZGPk3O0P2ZHuMSiVzAH9C3i1WUik
	gtEJCaD1C77iBF4SchHsD/RRxp4rKTA5OaJQMK/9EucPxdBb6vRTmVATNy5Y9vZ0jljpaJcPGcGNY
	Sn6ZVO9C6Fc3Wby3fw8dvkYLC9u1SFyT0B2mwcZ5/abQ7ZobEYtO0yQLZNnJBQNqi6H0hUsBOVILd
	VyC/0ruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPhUy-0000000Fqqd-11oR;
	Fri, 05 Jul 2024 11:53:08 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPhUu-0000000Fqov-0kA6
	for ath10k@lists.infradead.org;
	Fri, 05 Jul 2024 11:53:06 +0000
Received: from [192.168.0.2] (ip5f5af14a.dynamic.kabel-deutschland.de [95.90.241.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8AEA661E64862;
	Fri,  5 Jul 2024 13:52:48 +0200 (CEST)
Message-ID: <fb8acc69-89aa-4b26-91b4-e768ae4c2238@molgen.mpg.de>
Date: Fri, 5 Jul 2024 13:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, James Prestwood <prestwoj@gmail.com>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Chun Wu <chunwu@qti.qualcomm.com>
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
 <1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com> <87iky7mvxt.fsf@kernel.org>
 <37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com> <875xu6mtgh.fsf@kernel.org>
 <f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
 <082024ce-fdd4-4fb1-8055-6d25f7d2e524@molgen.mpg.de>
 <462c97dc-f366-4f75-9327-04d9424b819a@quicinc.com>
 <b30307fd-4417-4220-a3ac-e3e80f23105e@molgen.mpg.de>
 <ceddb62b-61dd-44c9-babd-cd375c5a147d@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ceddb62b-61dd-44c9-babd-cd375c5a147d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_045304_528736_7526E557 
X-CRM114-Status: GOOD (  32.16  )
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


Am 05.07.24 um 12:51 schrieb Baochen Qiang:
> 
> 
> On 7/5/2024 2:55 PM, Paul Menzel wrote:

>> Am 05.07.24 um 04:47 schrieb Baochen Qiang:
>>
>>> On 6/26/2024 5:12 PM, Paul Menzel wrote:
>>
>>>> Am 26.06.24 um 10:53 schrieb Baochen Qiang:
>>>>
>>>>> On 6/18/2024 6:33 PM, Kalle Valo wrote:
>>>>>> + baochen
>>>>>>
>>>>>> James Prestwood <prestwoj@gmail.com> writes:
>>>>
>>>>>>> On 6/17/24 8:27 AM, Kalle Valo wrote:
>>>>>>>> James Prestwood writes:
>>>>
>>>>>>>>> On 6/16/24 6:10 AM, Paul Menzel wrote:
>>
>>>>>>>>>> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when
>>>>>>>>>> connecting to a public WiFi:
>>>>>>>>>>
>>>>>>>>>>         ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps nss 2 mcs 9
>>>>>>>>>
>>>>>>>>> This has been reported/discussed [1]. It was hinted that there was a
>>>>>>>>> firmware fix for this, but none that I tried got rid of it. I got fed
>>>>>>>>> up enough with the logs filling up with this I patched our kernel to
>>>>>>>>> remove the warning. AFAICT it appears benign (?). Removing the warning
>>>>>>>>> was purely "cosmetic" so other devs stopped complaining about it :)
>>>>>>>>>
>>>>>>>>> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.html
>>>>>>>>
>>>>>>>> More reliable link to the discussion:
>>>>>>>>
>>>>>>>> https://lore.kernel.org/ath10k/76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org/
>>>>>>>>
>>>>>>>> I think we should add this workaround I mentioned in 2021:
>>>>>>>>
>>>>>>>>        "If the firmware still keeps sending invalid rates we should add a
>>>>>>>>         specific check to ignore the known invalid values, but not all of
>>>>>>>>         them."
>>>>>>>>
>>>>>>>>        https://lore.kernel.org/ath10k/87h7mktjgi.fsf@codeaurora.org/
>>>>>>>>
>>>>>>>> I guess that would be mcs == 7 and rate == 1440?
>>>>>>>
>>>>>>> I think its more than this combination (Paul's are different).
>>>>>>
>>>>>> Good point.
>>>>>>
>>>>>>> So how many combinations are we willing to add here? Seems like that
>>>>>>> could get out of hand if there are more than a few invalid
>>>>>>> combinations.
>>>>>>
>>>>>> Yeah, but there haven't been that many different values reported yet,
>>>>>> right? And I expect that ath10k user base will just get smaller in the
>>>>>> future so the chances are that we will get less reports.
>>>>>>
>>>>>>> Would we also want to restrict the workaround to specific
>>>>>>> hardware/firmware?
>>>>>>
>>>>>> Good idea, limiting per hardware would be simple to implement using
>>>>>> hw_params. Of course we could even limit this per firmware version using
>>>>>> enum ath10k_fw_features, but not sure if that's worth all the extra work.
>>>>>>
>>>>>> Baochen, do you know more about this firmware bug? Any suggestions?
>>>>>
>>>>> OK, there are two issues here:
>>>>>
>>>>> 1. invalid HT rate: "ath10k_pci 0000:02:00.0: invalid ht params rate 1440 100kbps nss 2 mcs 7".
>>>>>
>>>>> As commented by Wen quite some time ago, this has been fixed from
>>>>> firmware side, and firmware newer than [ver:241] has the fix
>>>>> included.
>>>> This is the issue from 2021, correct?
>>>>
>>>>> 2. invaid VHT rate: "ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps nss 2 mcs 9".
>>>>>
>>>>> After checking with firmware team, I thought this is because there is
>>>>> a mismatch in rate definition between host and firmware: In host, the
>>>>> rate for 'nss 2 mcs 9' is defined as {1560, 1733}, see
>>>>> supported_vht_mcs_rate_nss2[]. While in firmware this is defined as
>>>>> {1730, 1920}. So seems we can update host definition to avoid this
>>>>> issue.
>>>> Looking through the logs since May 2024, I have four different logs:
>>>>
>>>> 1.  invalid vht params rate 878 100kbps nss 3 mcs 2
>>>
>>> which chip are you using when you hit this nss 3 issue? QCA6174
>>> firmware does not support NSS 3 so really weird.
>>
>> This is all from the same device Dell XPS 13 9360 with QCA6174 and firmware 288.
>>
>> ```
>> Mai 20 12:07:09 abreu kernel: Linux version 6.9.0-09705-g08b269af52c0 (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 13.2.0-23) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42) #147 SMP PREEMPT_DYNAMIC Mon May 20 07:33:23 CEST 2024
>> […]
>> Mai 20 12:07:11 abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
>> […]
>> Mai 20 15:37:55 abreu wpa_supplicant[613]: wlp58s0: Trying to associate with e2:b3:70:83:01:af (SSID='public' freq=5500 MHz)
>> […]
>> Mai 20 15:37:55 abreu kernel: wlp58s0: authenticate with e2:b3:70:83:01:af (local address=9c:b6:d0:d1:6a:b1)
>> Mai 20 15:37:55 abreu kernel: wlp58s0: send auth to e2:b3:70:83:01:af (try 1/3)
>> Mai 20 15:37:55 abreu kernel: wlp58s0: authenticated
>> Mai 20 15:37:55 abreu kernel: wlp58s0: associate with e2:b3:70:83:01:af (try 1/3)
>> Mai 20 15:37:55 abreu kernel: wlp58s0: RX AssocResp from e2:b3:70:83:01:af (capab=0x1501 status=0 aid=4)
>> […]
>> Mai 20 15:39:29 abreu wpa_supplicant[613]: wlp58s0: CTRL-EVENT-SIGNAL-CHANGE above=1 signal=-55 noise=-97 txrate=300000
>> […]
>> Mai 20 15:54:44 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params rate 878 100kbps nss 3 mcs 2
>> ```
>>
>> It was some public WiFi in some restaurant. No idea, what hardware
>> they use. Maybe you can deduce this from the MAC address.
> 
> Then it is QCA6174 definitely.
Sorry, I meant, I do not know, what the access points were.

> Checked with firmware team and just know that, the TX rate info is
> generated by firmware directly but for RX rate it is from phy side.
> From firmware TX rate generation code seems NSS 3 is an impossible
> value, so it might be an RX rate generated by phy side. But I could
> not tell for now since the log is not complete. Paul, could you
> enable full ath10k log and try to reproduce? With full log we can
> check whether it is a RX rate issue,

Please tell me how I enable full logging. Also, I cannot promise I am 
going to be in the area with that WiFI in the next weeks.

>>>> 2.  invalid vht params rate 960 100kbps nss 1 mcs 9
>>>> 3.  invalid vht params rate 1730 100kbps nss 2 mcs 9
>>>> 4.  invalid vht params rate 1920 100kbps nss 2 mcs 9
>>>
>>> OK, these are due to mismatch between host and QCA6174 firmware, we
>>> can update host to fix them.
> 
> Kalle, the root cause to these three warnings are clear now and if
> you agree I can submit patches to fix them. Or I can also wait until
> the NSS 3 issue is clear.

Don’t hold your breath, that I am going to be able to get to the public 
WiFi network for 1. in the next weeks.

>> Nice. If there would be a test framework to test this, so I do not
>> have to search for a Cisco network, that’d be great. >>
>>>> I believe it’s only happening with Cisco networks. I am happy
>>>> to test a patch.

Kind regards,

Paul

