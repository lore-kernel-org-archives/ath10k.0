Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896ACC2BD09
	for <ath10k@archiver.kernel.org>; Thu, 27 Jun 2024 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkBeNUOJCPtsS6cbJUiP/VXcl8kirmhxwU0GblGSpIo=; b=e9KwWeEwS+TOQiik3NiH60Pgme
	NpuNw7+qwvTlhgM5FLjdayRgYxvBRZMh2OBkzGoF+qkRy005m/QQXSumjWs70EIfK+/Vek//ep2U3
	92WovRDkGVocsKAoUTt94CSnD3XBuiVvX/ov1sdyVO/2eg0P+m/594TIiMRox1qeArX1x1FZ0TYFf
	keai/EVQHZo56r/wjhX3XxbSzzmAKVY0QMLXpdghwbgGrbuN4W4TUpxhRDwfbjpgnavpSgwB9lDvj
	cLQsKlRsGC4DQt4d6V4hz9zycNr8Fkxwy9VKu6cgkJrkStKEJR7M0xbzUOvBoZp92tczsOOy/pRfK
	nVlTJgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtoX-0000000BNzI-0MHw;
	Thu, 27 Jun 2024 18:25:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtoT-0000000BNyK-2cP9
	for ath10k@lists.infradead.org;
	Thu, 27 Jun 2024 18:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11ED061F3E;
	Thu, 27 Jun 2024 18:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D36C2BBFC;
	Thu, 27 Jun 2024 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719512740;
	bh=PQ2lmzlqL1okTuWQlEsOF7zEOb+8es3MD0eL7BCCv5I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HMeHWTJa2cYBnDj13BjeII+XxXCSFp/lozdypx5qlnrWct3GUpUDIgCzjxywsU9pF
	 oyTqvXRZvvkuf8S4i50vedPn9mZc5kF7IDrbLRJM9QypPe8gImDldn7zRxeX1hnjtF
	 KuWLcxgDVU03l1LxbtOF9hUHZQZUqyDJ/8kSchnyMZA45sRfO7/6BwND54SPbVtM5G
	 2D9D2Zb0E2CBvnJYaUPC1XwSbfZQFEjo46KruupRvoQ4FnXt+rsL5IG11bCHkqTSRo
	 d0Lj2C/bxQAXb21xIxd2ubMh7Fv+U9vJ6ERRmbXKYLP0p2P4PoEU26MHQ+wehCDXgE
	 5jM2iwP8QY0iQ==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  Paul Menzel
 <pmenzel@molgen.mpg.de>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  LKML <linux-kernel@vger.kernel.org>
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
	<1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com>
	<87iky7mvxt.fsf@kernel.org>
	<37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com>
	<875xu6mtgh.fsf@kernel.org>
	<f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
	<d9f95dcc-6343-4af3-8acc-a150fb4e5923@gmail.com>
Date: Thu, 27 Jun 2024 21:25:37 +0300
In-Reply-To: <d9f95dcc-6343-4af3-8acc-a150fb4e5923@gmail.com> (James
	Prestwood's message of "Thu, 27 Jun 2024 10:42:40 -0700")
Message-ID: <87a5j6gs4e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_112541_787700_EACD69B2 
X-CRM114-Status: GOOD (  25.17  )
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

James Prestwood <prestwoj@gmail.com> writes:

> HI Baochen,
>
> On 6/26/24 1:53 AM, Baochen Qiang wrote:
>>
>> On 6/18/2024 6:33 PM, Kalle Valo wrote:
>>> + baochen
>>>
>>> James Prestwood <prestwoj@gmail.com> writes:
>>>
>>>> Hi Kalle,
>>>>
>>>> On 6/17/24 8:27 AM, Kalle Valo wrote:
>>>>> James Prestwood <prestwoj@gmail.com> writes:
>>>>>
>>>>>> Hi Paul,
>>>>>>
>>>>>> On 6/16/24 6:10 AM, Paul Menzel wrote:
>>>>>>> Dear Linux folks,
>>>>>>>
>>>>>>>
>>>>>>> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when
>>>>>>> connecting to a public WiFi:
>>>>>>>
>>>>>>>   =C2=A0=C2=A0=C2=A0 ath10k_pci 0000:3a:00.0: invalid vht params ra=
te 1920 100kbps
>>>>>>> nss 2 mcs 9
>>>>>> This has been reported/discussed [1]. It was hinted that there was a
>>>>>> firmware fix for this, but none that I tried got rid of it. I got fed
>>>>>> up enough with the logs filling up with this I patched our kernel to
>>>>>> remove the warning. AFAICT it appears benign (?). Removing the warni=
ng
>>>>>> was purely "cosmetic" so other devs stopped complaining about it :)
>>>>>>
>>>>>> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406=
.html
>>>>> More reliable link to the discussion:
>>>>>
>>>>> https://lore.kernel.org/ath10k/76a816d983e6c4d636311738396f97971b5523=
fb.1612915444.git.skhan@linuxfoundation.org/
>>>>>
>>>>> I think we should add this workaround I mentioned in 2021:
>>>>>
>>>>>      "If the firmware still keeps sending invalid rates we should add=
 a
>>>>>       specific check to ignore the known invalid values, but not all =
of
>>>>>       them."
>>>>>
>>>>>      https://lore.kernel.org/ath10k/87h7mktjgi.fsf@codeaurora.org/
>>>>>
>>>>> I guess that would be mcs =3D=3D 7 and rate =3D=3D 1440?
>>>> I think its more than this combination (Paul's are different).
>>> Good point.
>>>
>>>> So how many combinations are we willing to add here? Seems like that
>>>> could get out of hand if there are more than a few invalid
>>>> combinations.
>>> Yeah, but there haven't been that many different values reported yet,
>>> right? And I expect that ath10k user base will just get smaller in the
>>> future so the chances are that we will get less reports.
>>>
>>>> Would we also want to restrict the workaround to specific
>>>> hardware/firmware?
>>> Good idea, limiting per hardware would be simple to implement using
>>> hw_params. Of course we could even limit this per firmware version using
>>> enum ath10k_fw_features, but not sure if that's worth all the extra wor=
k.
>>>
>>> Baochen, do you know more about this firmware bug? Any suggestions?
>>
>> OK, there are two issues here:
>>
>> 1. invalid HT rate: "ath10k_pci 0000:02:00.0: invalid ht params rate
>> 1440 100kbps nss 2 mcs 7".
>>
>> As commented by Wen quite some time ago, this has been fixed from
>> firmware side, and firmware newer than [ver:241] has the fix
>> included.
>
> Thanks for pointing this out, I guess I didn't look close enough at
> the log and missed "ht" vs "vht" when I brought it up on that older
> thread. I thought i was seeing the same problem even with newer
> firmware.
>>
>> 2. invaid VHT rate: "ath10k_pci 0000:3a:00.0: invalid vht params
>> rate 1920 100kbps nss 2 mcs 9".
>>
>> After checking with firmware team, I thought this is because there
>> is a mismatch in rate definition between host and firmware: In host,
>> the rate for 'nss 2 mcs 9' is defined as {1560, 1733}, see
>> supported_vht_mcs_rate_nss2[]. While in firmware this is defined as
>> {1730, 1920}. So seems we can update host definition to avoid this
>> issue.
>
> That would be great!

Indeed! Baochen, can you work on a patch for ath10k to fix this?

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

