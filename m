Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95162C433EF
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 18:50:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5895F610C8
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 18:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5895F610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gs0aa7PMRmRU12b0j4E13j1c4/WDMFzVPfjfTaxvvGQ=; b=MljJYaxjsIQ61G
	p9f8mM2hMMUMGzlqzI++GTNO8g7wqj9BBem/CfP+9GnnaLtqA1O2cW0QQL44DZYOnbiuhMFJkjkT7
	XB9RSqSrFyHG35Cikw+W/L2nbf4GleCsIoTaFtYnFTC46DT0BaXvT6/lM8jnQXSUGbY5E7r3nJ1Am
	bREo82GSdBjheHutCwnGHi/WUSszAQkFDsTr9T/z3cG9eeIcWcLewRix2hezBr+BnXVPHrwSQkUG6
	8PPfEK3NKBs0SqLGE2+mER5RQk/Seg1o/FHAW7dW9ZF/9Vlr+u+h2rh4o6aIullf6UHVwupBn0zQW
	iTVTbRK0um3mOngxV9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgATk-008vzE-5M; Thu, 28 Oct 2021 18:50:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgATg-008vyo-M7
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 18:50:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 j35-20020a05600c1c2300b0032caeca81b7so5200030wms.0
 for <ath10k@lists.infradead.org>; Thu, 28 Oct 2021 11:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r6DzYL06+c7rlETep7KeTkbRa0OqD6hohbE6YOoJ33U=;
 b=ECziJepm37iXy00W7IOLUXMPeMYSWxmUnAUS5+VVMNesBi3R74sP8SOFPZJKnsdJBA
 tHpICxn4a0GfjnjWFxGXS+EEdZxlkEbF/gqlHYTCwz3dEi02KKauGYDEeCq8TQ2gKjD3
 GpOMCa1POOVwRQnfXPJr/+H59RWZ/1iyoLt2ui6jsyKnbNVh5PRQw7W5ly5XTOG3Pdm4
 v74b3zx1KbXTLIDfWAos2mTibbz+IY31TOGNtAI5EX2zAwAJhlQR6zrDPbBlN4KmI7s2
 Ob11h35aM/W05r+lYM3aKgdmyy+/bOe++5nFhNHVvECN2rL9jj+K4+UP9ocFc9ypCdFc
 FVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r6DzYL06+c7rlETep7KeTkbRa0OqD6hohbE6YOoJ33U=;
 b=CKDdXqJX+RSnvzMAm5xFtS6Q3j8N7WcyJis/doJIqMCmIQ2KmzqBOfI87SyyTgc8KE
 6lUVJVlFDR3E80n95xxvSsYg5hSeZQivfHb4kc9Utbu5HzyEPuKCm7Nde6+DxekvIcE+
 STMjeyowYAtYkJjHw/KItvW2fDUNoCKOdzqTYlYD6mxuR4xdwISsACdBqYoBohtQ67Os
 JMaaeh0BtQeq0EWsyShZkOZJxzHFQNguHQiDl+T8LMvlGi3uEqJ2Cp2oJ2Qx4+F0iB6u
 yYkvw4zlaLyio7915a4BxAAYzNTiLm8WvdGpE+AqrJa5ucWgtLlIEusQzAl+rF1lThmD
 aGYA==
X-Gm-Message-State: AOAM530dg6mWSdaqXeu5mQ8kGvMXKKo0HY0XcwFCvQstmn5CO3EFYxRT
 FSENPdHe06sQa1DLGEjaBOA=
X-Google-Smtp-Source: ABdhPJxkGNHkV76AX3Kld0dxp1OA31WDo8PiiXoLkeqRyC1CpY/nEHlbcbS/OtYavgReiUi+9ntofw==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr14356355wmq.97.1635447015112; 
 Thu, 28 Oct 2021 11:50:15 -0700 (PDT)
Received: from debian64.daheim (p5b0d7857.dip0.t-ipconnect.de. [91.13.120.87])
 by smtp.gmail.com with ESMTPSA id
 t6sm2596002wmq.31.2021.10.28.11.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 11:50:14 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1mg8al-000BEt-1J;
 Thu, 28 Oct 2021 20:50:14 +0200
Message-ID: <3aebb711-dc45-3cbf-43cb-12f59909baf0@gmail.com>
Date: Thu, 28 Oct 2021 20:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] ath10k: fetch (pre-)calibration data via nvmem
 subsystem
Content-Language: en-US
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Ansuel Smith <ansuelsmth@gmail.com>
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
 <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
 <875yth5pt3.fsf@codeaurora.org>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <875yth5pt3.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_115016_763518_E7D06422 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 28/10/2021 13:52, Kalle Valo wrote:

>>>>
>>>> v1 -> v2:
>>>> 	- use %zu and %u in the format string for size_t
>>>>             and u32 types (catched by the "kernel test robot").
>>>> 	- reworded commit message + successfully tested on QCA9880v2
>>>>
>>>> I placed the nvmem code in front of the current "file" method
>>>> (firmware_request). Reason is that this makes it easier for me
>>>> to test it. If needed it can be moved to a different place.
>>>
>>> Looks good to me. Before I apply this, I want to mention to that I have
>>> had a long in my deferred queue related two patchsets:
>>
>>
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20200927192515.86-1-ansuelsmth@gmail.com/
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20200927192515.86-2-ansuelsmth@gmail.com/
>>
>> Oh ok, serves me right for not looking thoroughly googling this first.
>> Alban Bedel and Ansuel's work made this nvmem all possible. And indeed,
>> the second patch here looks eerie similar.
>>
>> Do you want to go with his two patches instead?
> 
> I would prefer to take your patch.

Ok.

>> I'll change mine, so it just consists of the cal_mode for the older
>> QCA9880v2,QCA9887 and add the -EPROBE_DEFER handling. This
>> -EPROBE_DEFER only ever comes up with the Meraki gear. This is because
>> Meraki likes putting the MACs-Values into SoC-connected AT24
>> eeproms-chips. Everyone else just have them in a proper FLASH
>> partition. Though, this's usually nothing more than adding the
>> following line:
>>
>> if (ret == -EPROBER_DEFER)
>> 	return ret;
> 
> So I'll drop this version and wait for v3?

I guess that "waiting for v3" won't be necessary in this case.
If @Ansuel doesn't voice any concerns, you might as well just
apply v2.

The "[1/2] ath10k: Try to get mac-address from dts" patch
will need a respin, so it can apply cleanly.

Is Anyone interested? If not, I can take a shot at it on Saturday.

(There's the tiny question of that device_get_mac_address() which
ath10k currently uses. It looks a lot like of_get_mac_address() too!
but with extra ACPI (through FWNODE-which also includes OF), but
without NVMEM.)

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
