Return-Path: <SRS0=v+vA=PU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6F5C433F5
	for <ath10k@archiver.kernel.org>; Mon,  1 Nov 2021 14:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCA06108F
	for <ath10k@archiver.kernel.org>; Mon,  1 Nov 2021 14:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CCA06108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riJuN3F7fbwT2Qn9FL7KzN3JhGl87XY6xRdc+R3712o=; b=22+MlC28lf4Jgd
	6k9kChy5QBHk91Fdnw+OXW2HPSjMo6j+DQkNvJOA0VaO1R9h9XlH59DjV5jwWLUA3FE2gwO9r/d8e
	dMIb9eWjDnBrsETzXwJsQTrcn7XpyIsbluI/K4e8ZrhPrnX4/n0DCkK8pmED45TTtDjS/dthuPwlW
	AmCKvLvw4uyjc0IxUjqEIVnApbD76Ct+QOixC4SsQfhEpq1ZbBQ3yp6SK6D9RPH1BQtQDrzeh+3qq
	sqc0Bhq2v9kYUaghOLCMOxDl2kBRON+n1TrZYCwCVDawH40G1VlIWuLoLpnULVF9i98BtPWrjZ3Li
	HUtt1ecu3uvJObHxDGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhYFb-00GZj4-Pr; Mon, 01 Nov 2021 14:25:27 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhYFV-00GZiR-AP
 for ath10k@lists.infradead.org; Mon, 01 Nov 2021 14:25:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635776724; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Ca1iSqB4+cUbhZN1Yua/QMV90QwKQ0QMFKCdksG3Go4=;
 b=lseQhAkYYuVoWT4sPP1Is7KPbqNGAaNn3N+ECMk+OUTejoyUf0kKGXBpJUITrVeFdnfXDgBl
 1YsOigbldo9rUL6aHWqfzkj7eLsG8w4No+55das5YloVinHxDtK5Ht5CqaRF61KNOWEu4RtW
 342Bj08Rtxqan8uFkgzBqNbaisc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 617ff8cc2e144ac4d32c936d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Nov 2021 14:25:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 592E9C43460; Mon,  1 Nov 2021 14:25:15 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D4B26C4338F;
 Mon,  1 Nov 2021 14:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D4B26C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] ath10k: fetch (pre-)calibration data via nvmem
 subsystem
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
 <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
 <875yth5pt3.fsf@codeaurora.org>
 <3aebb711-dc45-3cbf-43cb-12f59909baf0@gmail.com>
Date: Mon, 01 Nov 2021 16:25:10 +0200
In-Reply-To: <3aebb711-dc45-3cbf-43cb-12f59909baf0@gmail.com> (Christian
 Lamparter's message of "Thu, 28 Oct 2021 20:50:13 +0200")
Message-ID: <87lf280x89.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_072525_099360_18EFBF7E 
X-CRM114-Status: GOOD (  15.62  )
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

Christian Lamparter <chunkeey@gmail.com> writes:

> On 28/10/2021 13:52, Kalle Valo wrote:
>
>>>>>
>>>>> v1 -> v2:
>>>>> 	- use %zu and %u in the format string for size_t
>>>>>             and u32 types (catched by the "kernel test robot").
>>>>> 	- reworded commit message + successfully tested on QCA9880v2
>>>>>
>>>>> I placed the nvmem code in front of the current "file" method
>>>>> (firmware_request). Reason is that this makes it easier for me
>>>>> to test it. If needed it can be moved to a different place.
>>>>
>>>> Looks good to me. Before I apply this, I want to mention to that I have
>>>> had a long in my deferred queue related two patchsets:
>>>
>>>
>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20200927192515.86-1-ansuelsmth@gmail.com/
>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20200927192515.86-2-ansuelsmth@gmail.com/
>>>
>>> Oh ok, serves me right for not looking thoroughly googling this first.
>>> Alban Bedel and Ansuel's work made this nvmem all possible. And indeed,
>>> the second patch here looks eerie similar.
>>>
>>> Do you want to go with his two patches instead?
>>
>> I would prefer to take your patch.
>
> Ok.
>
>>> I'll change mine, so it just consists of the cal_mode for the older
>>> QCA9880v2,QCA9887 and add the -EPROBE_DEFER handling. This
>>> -EPROBE_DEFER only ever comes up with the Meraki gear. This is because
>>> Meraki likes putting the MACs-Values into SoC-connected AT24
>>> eeproms-chips. Everyone else just have them in a proper FLASH
>>> partition. Though, this's usually nothing more than adding the
>>> following line:
>>>
>>> if (ret == -EPROBER_DEFER)
>>> 	return ret;
>>
>> So I'll drop this version and wait for v3?
>
> I guess that "waiting for v3" won't be necessary in this case.
> If @Ansuel doesn't voice any concerns, you might as well just
> apply v2.

Ok, I took the v2 now. Thanks for helping out, I appreciate it!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
