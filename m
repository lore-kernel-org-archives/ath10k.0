Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9501C47DD9
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHuw2uncckIZhbhm2xvPn9FEgRi3tDLRWW2k4Bzu7Ns=; b=Pjm6QM6ZMNiAeoaFuPurC5Cz0R
	8K/lUhn2StXkPJySKpW0798KmXgt5E6WS4k4wPLGc3lR9fD7YBO2hqxTKWOMvhf5cejxMSFJ2uMcG
	GNMz4PzwfG8eZ0nNeSLzq+aMAFat5bpsAEDzYKpbbHwdFgcaPu9Sct5vULCPtJUKyabRAZlLxAOV1
	t+pDoe2ChjPigvit3aX1A3EdfUquvg/lHaR3lpPOvJIOyjC71HOAJNvEP55+W3CJ5REH4+1BclaP3
	3mmUro6y7+5WASwb6musaQGZnQe6VkLDhxyoKGr3eKs8KtpOA7QNVi71k2J8hC0oR3BUJ6a0vTm+k
	6qBYCRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOx9-0000000AYgk-2jbS;
	Wed, 28 Feb 2024 18:46:51 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOx7-0000000AYgA-1ad5
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 18:46:50 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-42e29149883so147061cf.2
        for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 10:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709146008; x=1709750808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHuw2uncckIZhbhm2xvPn9FEgRi3tDLRWW2k4Bzu7Ns=;
        b=jI13tP6CVxHY9jyUnYnsO97NGJS1fQl860UI/KN3dVCYI2P8A1dlPou96ir65bB7qu
         m5PHAg69sT/TVc5mRYa1K20OLPizP2+eEH8mMiXB6kkVhJeN+bjTF7YdDmgdW+j9DvPC
         YeXoW/hfiRlhR/ywSHOLsiW5wBoOUTk7CdqB05LvPyKGIPp74OX9h38F45kCc1ZXtqog
         PmSXgtyUcWBQt5hzKuair7WFAgZhsz9JjLRVIVWhH+kNc1/t1EDXaaLR31cdiTgHUyBS
         MN0R2mZixDfl9f5smmUQDUxmcRIt67eJ/Z6NLcITPkSbaXdLVDY+wSqfLPc3vvrrfwkb
         ypgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709146008; x=1709750808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHuw2uncckIZhbhm2xvPn9FEgRi3tDLRWW2k4Bzu7Ns=;
        b=k/uMf6u7/XhG+8lC9CdrouJFzDzSCBaPZA1yx/oovCt6K/w5p+ScgmTgf9nwsKU+7N
         620ekYLLAhJ3kNE8Tb1Pkego8KROVdMQGnVxN+8Vxv3SHUUHxNQ5p/sCBuXpTuKSz/mS
         Wa7RwsQYVRPRJaN44bbSDNHXV+S2Whk/2mcXAiLwOSxwmsjZVJTZlQb62T2ZYXZoKAac
         FrUd5vrfSNX5jdIYat0BBocD4aFvbu2TBoOYLPSZHTsdS2LyuqPlWb+cQ9NMmLoE6T0T
         /0lNYgB9exZxGGx21HDjDNn3HwahrmCXKglhnGovGrgkBLpIlqrPAo3MPLo6qUy7jQqV
         rgTg==
X-Forwarded-Encrypted: i=1; AJvYcCXIxqj1G6w38n+xT9yJYijpiS3a1S05dio5Fb9ixjUsaEjRvMQR9PEyP59gs0KQk8ULvy0pHeED2fGyqKG/ke6JkD5Aygz8KxhCkg==
X-Gm-Message-State: AOJu0YyyMeE1Wsp7rPyw823bMZJm0AS52xO4QywglZ1fUotmgMVJdnU2
	kFOyWbltHNK0IiAp4ahuut6qF04g+iXcj+6h5pP5kpfiCcxgsq0WMaNHv62/
X-Google-Smtp-Source: AGHT+IHlslU2XdNksuaZaX3Gi0NN29fJA1PPl8Wp5p7mMyg8xMXPyIIC2VYMkGn/4eaoSq99d65yxg==
X-Received: by 2002:ac8:5c96:0:b0:42e:b063:a35f with SMTP id r22-20020ac85c96000000b0042eb063a35fmr1850048qta.8.1709146007686;
        Wed, 28 Feb 2024 10:46:47 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id t6-20020ac85306000000b0042c1ce79b4bsm18198qtn.50.2024.02.28.10.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 10:46:47 -0800 (PST)
Message-ID: <6362d9b2-6ed2-4454-bf1b-8614d181bc93@gmail.com>
Date: Wed, 28 Feb 2024 10:46:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: poll service ready message before failing
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240221031729.2707-1-quic_bqiang@quicinc.com>
 <d67fb4f4-aea2-4668-aac4-6e7eca8db4fa@gmail.com>
 <0ee7ae2f-8034-4908-b6e3-fa17a995c661@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <0ee7ae2f-8034-4908-b6e3-fa17a995c661@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_104649_457416_C4EF2C0B 
X-CRM114-Status: GOOD (  28.08  )
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

Hi Baochen,

On 2/21/24 6:18 PM, Baochen Qiang wrote:
>
>
> On 2/21/2024 8:38 PM, James Prestwood wrote:
>> Hi Baochen,
>>
>> On 2/20/24 7:17 PM, Baochen Qiang wrote:
>>> Currently host relies on CE interrupts to get notified that
>>> the service ready message is ready. This results in timeout
>>> issue if the interrupt is not fired, due to some unknown
>>> reasons. See below logs:
>>>
>>> [76321.937866] ath10k_pci 0000:02:00.0: wmi service ready event not 
>>> received
>>> ...
>>> [76322.016738] ath10k_pci 0000:02:00.0: Could not init core: -110
>>>
>>> And finally it causes WLAN interface bring up failure.
>>>
>>> Change to give it one more chance here by polling CE rings,
>>> before failing directly.
>>>
>>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
>>>
>>> Fixes: 5e3dd157d7e7 ("ath10k: mac80211 driver for Qualcomm Atheros 
>>> 802.11ac CQA98xx devices")
>>> Reported-by: James Prestwood <prestwoj@gmail.com>
>>> Link: 
>>> https://lore.kernel.org/linux-wireless/304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com/
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>> ---
>>>   drivers/net/wireless/ath/ath10k/wmi.c | 22 +++++++++++++++++++---
>>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c 
>>> b/drivers/net/wireless/ath/ath10k/wmi.c
>>> index ddf15717d504..bf6cb2c73128 100644
>>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>>> @@ -1763,12 +1763,28 @@ void ath10k_wmi_put_wmi_channel(struct 
>>> ath10k *ar, struct wmi_channel *ch,
>>>   int ath10k_wmi_wait_for_service_ready(struct ath10k *ar)
>>>   {
>>> -    unsigned long time_left;
>>> +    unsigned long time_left, i;
>>>       time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
>>>                           WMI_SERVICE_READY_TIMEOUT_HZ);
>>> -    if (!time_left)
>>> -        return -ETIMEDOUT;
>>> +    if (!time_left) {
>>> +        /* Sometimes the PCI HIF doesn't receive interrupt
>>> +         * for the service ready message even if the buffer
>>> +         * was completed. PCIe sniffer shows that it's
>>> +         * because the corresponding CE ring doesn't fires
>>> +         * it. Workaround here by polling CE rings once.
>>> +         */
>>> +        ath10k_warn(ar, "failed to receive service ready 
>>> completion, polling..\n");
>>> +
>>> +        for (i = 0; i < CE_COUNT; i++)
>>> +            ath10k_hif_send_complete_check(ar, i, 1);
>>> +
>>> +        time_left = 
>>> wait_for_completion_timeout(&ar->wmi.service_ready,
>>> +                            WMI_SERVICE_READY_TIMEOUT_HZ);
>>> +        if (!time_left)
>>> +            return -ETIMEDOUT;
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>>
>>> base-commit: 707e306f3573fa321ae197d77366578e4566cff5
>>
>> Thank you for looking at this I will test this and see if it resolves 
>> the problem we're seeing but since its somewhat rare it may take me a 
>> bit to validate.
>>
>> Is this any different than just trying to bring up the interface 
>> again from userspace? I could be wrong, but my concern with this is 
>> that when I retried in userspace things got into a very odd state:
>>
>>   - IWD starts
>>
>>   - ifdown interface
>>
>>   - ifup interface, timeout -110
>>
>>   - Retry ifup, success
>>
>>   - Authenticate/associate succeed
>>
>>   - 4-way handshake fails because the device never received the 1/4 
>> frame.
>>
> Don't get time to look into this case, but I suppose there might be 
> some issues in error handling when interface up fails, kind of 
> incorrect irq enable/disable or something else impacting data path, so 
> no data frame received even after a second interface up retry succeeds,
>
> Anyway please test this patch, which is supposed to be the right fix 
> to this issue.

This does appear to have fixed it! For reference this was my test:

  for i in $(seq 1 100000); do sudo ip link set wlan0 down; sudo ip link 
set wlan0 up; echo $?; done

I never saw the up command fail, and after a while I noticed one of the 
iterations took a bit longer to complete. Checked dmesg and saw:

[ 1006.017198] ath10k_pci 0000:02:00.0: failed to receive service ready 
completion, polling..
[ 1006.017295] ath10k_pci 0000:02:00.0: service ready completion 
received, continuing normally

I then started IWD and it was able to connect fine (data frames were 
being passed). I was able to trigger this 3 times relatively quickly, 
each time IWD connected afterwards. So from my end this appears fixed.

You can add tested-by me if you like:

Tested-By: James Prestwood <prestwoj@gmail.com> # on QCA6174 hw3.2


>
>> IWD would then retry indefinitely with auth/assoc succeeding but 
>> never receiving any 4-way handshake frames. The only way to get 
>> things working again was reloading the ath10k driver/reboot. Maybe 
>> this patch is different because its waiting for the initial request 
>> and no issuing a second one? Just wanted to point that out in case it 
>> sheds any light.
>>
>> Thanks,
>>
>> James
>>

