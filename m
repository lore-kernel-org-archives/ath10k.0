Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3BEC6FD1C
	for <ath10k@archiver.kernel.org>; Thu, 23 Mar 2023 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afH7fQkjAVdcef3pDAG8Vd9wWXjdEcLqWh9Q7Th3QiE=; b=ITocyz0CoH+m8i6/FvFGzabdX+
	V91vJ2bRv+u5L5Q1SYgfJj+QIDD950N5KP5KOFjEQHvEXF/llD90z3TsaiGVvTjf9wK0n6eTLI0Vo
	yceFmV2saIOYZ0kPp7gJPdj5ux524cN+oelO365m5wtv9HZ4+c6LZA3ZrdyNuwBFfPciDRRIts709
	egscRLi6hqlxMMyfZuceR1MBZkRN1FA2+aV7D1IRrAyQ8i00DUHDzRAEKf9+KqqjVK5Qm+ROuar3b
	gO9M6W6k3YvgJrZJ3YkILIkA04KoOG0lQwUhJ5ZNddHG2mSyXrmRO3p3IfhKTLloDESjVWxwnXXLV
	UH1AQhpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLlr-0029UM-3D;
	Thu, 23 Mar 2023 14:18:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLlo-0029T9-2m
	for ath10k@lists.infradead.org;
	Thu, 23 Mar 2023 14:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679581102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmOQUOtAqacRyOXsSm85w+5nwuG+5y33vZI5QHs5gnc=;
	b=aSHObIVxQo+r+OaWIObgUENGONgR8+MAaG+HfKSlCb0tgkdbTFqzkvnkWAxZ/gKBK8ELI9
	BId5vt1JxbucXCrG9h2YZjH9NbysBQDXZl3I9eLMw/J6puBwF/IF88w3vqY3NK4YWpNx5E
	FQH1c0lgMBdwAieTwgOszSbuhUuoGrY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-mjppuM1ZOW616vLn7bcwbg-1; Thu, 23 Mar 2023 10:18:18 -0400
X-MC-Unique: mjppuM1ZOW616vLn7bcwbg-1
Received: by mail-qv1-f69.google.com with SMTP id f8-20020a0cbec8000000b005b14a30945cso10853476qvj.8
        for <ath10k@lists.infradead.org>; Thu, 23 Mar 2023 07:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581093;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmOQUOtAqacRyOXsSm85w+5nwuG+5y33vZI5QHs5gnc=;
        b=Y4ST6M6GAK9OEQ/2phln4d0lBYdU/WsXfxQ1JNtk3rLQWX6g1kmV0+cNs0uwEsAf91
         gy8WfGd1jmwAxpEn0rd3cy1b0VUCDmPnOFERk/1ESXS68lgKjSDPIneAntOl3yNZUYp6
         l4R4ESPTsqGuKb2ucE5hTbL2t7/OU3T8uwC5lVCgpo5P6ndbVAFDaY7fd/kYmjfyv6If
         HxRu9Yj+5KQHdn+q+PJ2a0VNLU3i4Dzu1WAQsjKu1R17VtzUHuwQfJ4WTCpiSjvNkNDY
         CCTnwpxYTDb0SuthAhawE4BI8htPMdkCk2neT/oDpvGLHDULCXbM04PKQ7eMmGGsafOE
         RxOA==
X-Gm-Message-State: AO0yUKUHm08MqK4pZxJ7/pAAlqe1hw1eK8LUyIGKotLrh7hgYW3qiukH
	Wy1+7jy0BlPoAKBpIX+XjL1FVOBnzXt3GfqA1581IgOwMLOyad5XWNwF9AbWzyBHR/qepWu/Tu2
	PhL2zpS9KzCASrVwqNyBEHw==
X-Received: by 2002:ac8:5845:0:b0:3bf:abd5:f1ef with SMTP id h5-20020ac85845000000b003bfabd5f1efmr11961140qth.7.1679581093095;
        Thu, 23 Mar 2023 07:18:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set8+oxS4bzeF5lRLgX7lO++tpFXfO+fw1zDuVOc/fpqog2+KS85aPH3xR/dKuzfXWCYb7jmdzA==
X-Received: by 2002:ac8:5845:0:b0:3bf:abd5:f1ef with SMTP id h5-20020ac85845000000b003bfabd5f1efmr11961109qth.7.1679581092868;
        Thu, 23 Mar 2023 07:18:12 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a057000b00745c2b29091sm5993338qkp.93.2023.03.23.07.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 07:18:12 -0700 (PDT)
Subject: Re: [PATCH] ath10k: remove unused ath10k_get_ring_byte function
To: Simon Horman <simon.horman@corigine.com>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230322122855.2570417-1-trix@redhat.com>
 <ZBtnbgeW9T75ZXfv@corigine.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <0b9f9c45-7e88-deda-46a6-8c7961878b83@redhat.com>
Date: Thu, 23 Mar 2023 07:18:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ZBtnbgeW9T75ZXfv@corigine.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_071824_969636_9D39BBDE 
X-CRM114-Status: GOOD (  15.73  )
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


On 3/22/23 1:40 PM, Simon Horman wrote:
> On Wed, Mar 22, 2023 at 08:28:55AM -0400, Tom Rix wrote:
>> clang with W=1 reports
>> drivers/net/wireless/ath/ath10k/ce.c:88:1: error:
>>    unused function 'ath10k_get_ring_byte' [-Werror,-Wunused-function]
>> ath10k_get_ring_byte(unsigned int offset,
>> ^
>> This function is not used so remove it.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Hi Tom,
>
> this looks good. But this patch applied, and with clang 11.0.2,
> make CC=clang W=1 tells me:
>
> drivers/net/wireless/ath/ath10k/ce.c:80:19: error: unused function 'shadow_dst_wr_ind_addr' [-Werror,-Wunused-function]
> static inline u32 shadow_dst_wr_ind_addr(struct ath10k *ar,
>                    ^
> drivers/net/wireless/ath/ath10k/ce.c:434:20: error: unused function 'ath10k_ce_error_intr_enable' [-Werror,-Wunused-function]
> static inline void ath10k_ce_error_intr_enable(struct ath10k *ar,
>                     ^
> Perhaps those functions should be removed too?

I believe these were removed with

c3ab8c9a296 ("wifi: ath10k: Remove the unused function 
shadow_dst_wr_ind_addr() and ath10k_ce_error_intr_enable()")

Tom

>
>> ---
>>   drivers/net/wireless/ath/ath10k/ce.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
>> index b656cfc03648..c27b8204718a 100644
>> --- a/drivers/net/wireless/ath/ath10k/ce.c
>> +++ b/drivers/net/wireless/ath/ath10k/ce.c
>> @@ -84,13 +84,6 @@ ath10k_set_ring_byte(unsigned int offset,
>>   	return ((offset << addr_map->lsb) & addr_map->mask);
>>   }
>>   
>> -static inline unsigned int
>> -ath10k_get_ring_byte(unsigned int offset,
>> -		     struct ath10k_hw_ce_regs_addr_map *addr_map)
>> -{
>> -	return ((offset & addr_map->mask) >> (addr_map->lsb));
>> -}
>> -
>>   static inline u32 ath10k_ce_read32(struct ath10k *ar, u32 offset)
>>   {
>>   	struct ath10k_ce *ce = ath10k_ce_priv(ar);
>> -- 
>> 2.27.0
>>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
