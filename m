Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C97AFEFB70
	for <ath10k@archiver.kernel.org>; Fri, 27 Feb 2026 17:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVkc6ZPyuoqOkhwVhzdZ8Ion5jcRGNGi3A9fSjWSfmA=; b=sIcqd/ZQHUYDSzX2Top7wS2Uiy
	Q720IIvrzjbcC4Yw61pKW25RvP2QwuSx9NQknpCFbNie/G8CPfWMa+euGOmUIp7+xz1nRw3VnN30B
	v/d0Z1+r0v0MSZ5tf8dHN6SeL4tcExKtsZ6NFAZ9FjO1yosVBZZ7PxcdhM4D7dcoVeNViEQAEvRuu
	+Zvl7PM46u57K1WSjg8VaDtkKl1FLU5eQV7bxdu/bo2ns6kYPe/v8q3ouC9LyC+Tth+hAVlQbf7C/
	+tPdmIrWbBJ+AcMK0qNhy/zDHHpwGereox/VyDVB9foJrd+LjqJ4qU8n+CMvgtLM/VLti9xJphi6q
	nvHyKt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1eF-00000008oEw-07Ao;
	Fri, 27 Feb 2026 17:29:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1eC-00000008oEa-38w5
	for ath10k@lists.infradead.org;
	Fri, 27 Feb 2026 17:29:06 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so1383152a91.0
        for <ath10k@lists.infradead.org>; Fri, 27 Feb 2026 09:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772213343; x=1772818143; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WVkc6ZPyuoqOkhwVhzdZ8Ion5jcRGNGi3A9fSjWSfmA=;
        b=TyP2Pti3wzlT0CGO0DuBBcmJrxn2/proRA5/ovmdlsIgJ/S4R7jxcaqQ22EitUL1fh
         PN7X3XQ3k6oVjp05SIggf+inFaL7+MCZ/lkaQVQDFiApD6dgqUl897+fjQhYJto26y8f
         2WbfIiiIVCQACbUJuJs5vaopTWTtr7MNqxNiayOgZ6vkH4b1WlGb46Qo1lFnsqmVitLi
         p6Vg/1ldNLshRzlC/vrExQte0QQlrTUJQdcqsNMK3jIaM8RZ4PpKJxio1p1wbWMagqOp
         v6ihvL3uw8TjFG+rX7fzGXZ915GinQsNjHYrNKQxLsAyMSEQZLLdgHXg46yDAiZVinxn
         /1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772213343; x=1772818143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVkc6ZPyuoqOkhwVhzdZ8Ion5jcRGNGi3A9fSjWSfmA=;
        b=vBy6vQLG4Du0KOqq9KXWan71bovP5FZNWvJSpndwc68UZbXK8h29PHwd+7hKh/qHfV
         zUiI8rNsqiNFK475TabIArdGcVW/Wj/ILv0eN8HFSTpMTd19jyXc5vF4hW0pZ6mYu9aR
         xipWGCc2hjbcz/K2RRG45rnBqN/I4aiBeGFp4vsPCg+PjKEcrq1OdGdpvjKvXPNRYQkw
         NKu/g8Ni9dTMtyuT4h7+sjqumi2Qo+Che3mve444/QRegBBaLmVqH8kvIuINbQuMO/u9
         u63IWiWBHhbS0RNJR0bwt1CBmaANd6koaYBoUFb6xEifVxH1w8qq8IuAaHOxLRLXrOnM
         1/dg==
X-Forwarded-Encrypted: i=1; AJvYcCUvR5M/mL+9XJpwc0XnVD/coxLl4E/YzTmK4A3qIDTGrYQ056GRAtgxLX8AGq/pTxJYLAdWJb4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4a8adrKwABcjJFqGNocaK9slMfmClTliiedfAuD4QLubbDveP
	9wCKtzO3rY88pHXtqMlvdWSlqR21aB29iVHHWfPSBRISVpFO9oPksoUV
X-Gm-Gg: ATEYQzzDgKsizQ1MjkXoSilL7pXZ54ozEJH6AGhR7UiwcsgFjfSZpIj5AV5iFIy3jGD
	ebsxLvDVnteE1q+UiZb08yk69iJYZ5n4zm7EVD4St5GnDVJyVV/Ua1UvDaQnYo/ZMTRpqh4Wjkk
	V82SG+qdIv7Y/F5QgKi62viL9mICzlEQic8M18chd8kDV8BH4+V6/5py8YSOBDvn1UJ8AYJEBUQ
	l1s9dAyJT/MImNYzQs0IQseE6LOYnECFDbaftSt50fqCR/Zu0QTonBCcoe95qrUaZvzO5GsNJRC
	Wx43j9GN/FtXY+h+S9UbTfg8Qlq1vY44PMr0UhcvhrDxbrE2nc/yQJ8+G7jFOx2cqFUxRwxNf42
	tp4NAZkOTmBvh63OqcqsUeGGnpTWS2UgudSAefHD5uJp6k616lBl5Z7lqz8WkDIGpKdUwyOtC87
	1ke/KFifSwWEntkv4nuPwbOMWCCHFCa+9uUqAGNpger58tPx1I7VVusqUP
X-Received: by 2002:a17:90b:1f8a:b0:356:22ef:57b9 with SMTP id 98e67ed59e1d1-35965c280e5mr3850766a91.3.1772213343243;
        Fri, 27 Feb 2026 09:29:03 -0800 (PST)
Received: from [10.100.120.15] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359019780bfsm9638243a91.8.2026.02.27.09.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 09:29:02 -0800 (PST)
Message-ID: <2e2818e5-ec6f-4bd7-8d2a-41f65652593f@gmail.com>
Date: Fri, 27 Feb 2026 09:28:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] wifi: ath10k: only wait for response to SET_KEY
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Richard Acayan <mailingradian@gmail.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <20260210021249.12132-1-mailingradian@gmail.com>
 <20260210021249.12132-3-mailingradian@gmail.com>
 <dd019903-f8d9-4bd3-a90d-b4d505f489f3@gmail.com>
 <3e1274fd-fe95-420c-94e3-ac34f497b7ae@oss.qualcomm.com>
 <8b468ad4-39e3-401f-a2f2-7484759137df@oss.qualcomm.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <8b468ad4-39e3-401f-a2f2-7484759137df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_092904_818158_C44A93CE 
X-CRM114-Status: GOOD (  18.78  )
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

Hi,

On 2/25/26 6:59 PM, Baochen Qiang wrote:
>
> On 2/13/2026 1:56 AM, Jeff Johnson wrote:
>> On 2/11/2026 6:11 PM, James Prestwood wrote:
>>> On 2/9/26 6:12 PM, Richard Acayan wrote:
>>>> When sending DELETE_KEY, the driver times out waiting for a response
>>>> that doesn't come. Only wait for a response when sending SET_KEY.
>>> We've run into the exact same thing on the QCA6174 and have been
>>> carrying an identical patch to this for at least a year.
>>>
>>> https://lore.kernel.org/linux-wireless/b2838a23-ea30-4dee-b513-f5471d486af2@gmail.com/
>> Baochen,
>> Were we ever able to reproduce this?
> unfortunately no
>
>> Do we normally always get a response to DELETE_KEY but in some instances it
>> comes very late (or not at all)?
> In my tests, I never hit this issue so seems can always get a response.
>
>> If we remove the wait, is there any concern that a late arriving DELETE_KEY
>> response might be processed as a response to a subsequent SET_KEY command?
> I would suggest not to remove the wait, but instead reduce the timeout to like 1s, just
> like the patch "[RFC 0/1] wifi: ath10k: improvement on key removal failure".
>
Is there a specific reason to require a wait? I would be more ok if the 
way was sub-second, like 100ms or frankly even less (no idea what a 
"normal" amount of time is to delete a key). The issue is this effects 
roaming, and will delay roams by e.g. 1 second which is not ideal. I've 
also seen a 1 second wait cause issues with configurations that expect a 
very fast reassociation time. Even 1 second was causing a deauth.

I dropped this patch a long time ago and replaced it with a similar 
patch being discussed here. So far, no issues, though I realize this is 
a limited test with specific hardware.

Thanks,

James

>> /jeff

