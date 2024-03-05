Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4305C54798
	for <ath10k@archiver.kernel.org>; Tue,  5 Mar 2024 23:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbxg1zgUcqn6fHl1Avd+GVgh0X/6G8sqgXlC8Uu4B00=; b=cu5+OiPM41EtOaL6KVKmjdT5Us
	cZzIQ5/4/AZln099hsCdWmABUXyVaTHMzZcG9XXzK+lcOBCztinH2RDEiuUxvw6onXsPBCSF5foe1
	OHUqtY5JjjphmHG3teM6MnpKMDeFf3djP9LDpcP9XFygeAj4cZ4z+OGKMbBdZxamU3TB311Uqolsn
	Xz9/REX1qDCXmmgyTCxqgQHYFYe+JAIzNufE6/5tmXecrKANmgdjxUGDLxiEx6ihMvnEU6ufRoH1G
	y9E3HuD5WPe6PfcQh5ghaKVkAD3okFbumoxnuWU0ROTXkEyNMm8FNQMrWk3sk15W4ngTfcKGunhVo
	92FSvcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhdlE-0000000FXhq-0flX;
	Tue, 05 Mar 2024 22:59:48 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhdlB-0000000FXgr-2Kyd
	for ath10k@lists.infradead.org;
	Tue, 05 Mar 2024 22:59:47 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-68f9e399c91so52819016d6.2
        for <ath10k@lists.infradead.org>; Tue, 05 Mar 2024 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brown.edu; s=google; t=1709679584; x=1710284384; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbxg1zgUcqn6fHl1Avd+GVgh0X/6G8sqgXlC8Uu4B00=;
        b=BBmExNLA+DPdu60KdterEpWNDwl89a4ov8nKGRenj3GLGPtQsYzJFZPaiCrQ8FMhsQ
         Snv3fsSPFDt9Wox63TxgXe6va78OIL7AObL0e9833WdGPxc/h2JdtCpNfwDmyfGAYYU+
         T0Vbg9GbhW6j/fv9x9OKYyyCGlLl7G3gYL4yh5zLVWw2vt1XfydA0lh0f25g0z6gMGvx
         HpopdwEvWNZXDeX3zm7dhuh2w2GwLDAuXZkNhtB2N853+HxjOXr+Ds8HC2YWhHZ6QiPC
         qs3gMzfjOnjt9Pu3sVW21dvj4wgqR8WNcui/HUJNZd1Nn0uEEqFzobCpCMLh/vJcun+/
         KiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709679584; x=1710284384;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbxg1zgUcqn6fHl1Avd+GVgh0X/6G8sqgXlC8Uu4B00=;
        b=PU1WY1v+iaKo+bmk+fZNZORR9sR6CGjyIaaiUQTjvSGPD8O/Pu9cX1PfcfqD+FJpmb
         j5/MXLtQS+jcDnxij61BuC3dR9CXTmaS98rls9EBUGwRItLHQkNyeaAysM53zi0gAUdG
         OOH2oKZJ6y22QbPtelRm5mS0+aNQxUi01s245z825WxlYFKHuJWz5aaRBARc2t4anCLj
         cq0lbMFUJ/dNp2xQKsQSSb9CER+J8hUTu6Is9kr3BMyctP4JAZppEQIQmGqSWt/PcuJa
         8djHoGdRTVo9/jH/ggHToRn8gcqdxBz+YW11j0q4cZX27gNFNRJqLgLCk2unkSNeJFvf
         VuGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmZzfzTeWoJU9luzQrRvYkSbVD8JkuAIiuTgP0NmZckyS9q+9QsBFkvqABZKM8spL9df303hrWmnjFdp/pWtLjCa7oBJK/vD1DBg==
X-Gm-Message-State: AOJu0YzKw1IfSxP8SrWFT0gMNrRl3GN6dTjJk6ZPeJWBu4WB+vOh5/lA
	n7j/nVDLY5BiycEuZd1zIjND6X27KCs3rsPZ+555H/HGkKCNf5h4C/7DsQa9e8pClEzCshuz/Li
	zzsoQ
X-Google-Smtp-Source: AGHT+IFR0Lw5vXHNkMgYK3syL71xjOnzhUqgCHLMFGfy/w7yt+68C9rFv2IMos3Lt60cvBmcLV+AYg==
X-Received: by 2002:a0c:eda3:0:b0:68f:ab60:785d with SMTP id h3-20020a0ceda3000000b0068fab60785dmr3223396qvr.11.1709679584072;
        Tue, 05 Mar 2024 14:59:44 -0800 (PST)
Received: from [192.168.1.26] ([70.22.131.96])
        by smtp.gmail.com with ESMTPSA id oj12-20020a056214440c00b006900d9ee664sm6731281qvb.33.2024.03.05.14.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 14:59:43 -0800 (PST)
Message-ID: <c9894d89-0665-4253-a8c5-d7f62e3117e7@brown.edu>
Date: Tue, 5 Mar 2024 17:59:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k driver crashing occasionally on dell xps laptop with
 QCA6174 802.11ac adapter
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>, ath10k@lists.infradead.org
References: <74898fb4-9332-416d-9d92-7812416a0116@stimulussoft.com>
 <45b4127c-14de-4fc7-8fbe-9d735f0f6669@gmail.com>
From: =?UTF-8?Q?Andrea_Pierr=C3=A9?= <andrea_pierre@brown.edu>
In-Reply-To: <45b4127c-14de-4fc7-8fbe-9d735f0f6669@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_145945_617566_3385235F 
X-CRM114-Status: GOOD (  11.61  )
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

Hello,

I believe I have a similar issue on openSUSE Tumbleweed on a DELL XPS 13 
7390 with a Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter: 
the Wi-Fi connection stays connected to the router but internet access 
drops randomly, and I have to manually restart NetworkManager to get it 
back on.
I added a few log messages on StackExchange 
(https://unix.stackexchange.com/questions/769001/unstable-wi-fi-connection) 
and on the openSUSE forum 
(https://forums.opensuse.org/t/unstable-wi-fi-connection/172126), and 
I'm happy to provide anything needed to troubleshoot!

Thanks in advance!

--
Best,
Andrea

On 3/1/24 09:44, James Prestwood wrote:
> Purely circumstantial but I've had great luck with firmware:
>
> firmware-6.bin_WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>
> I've tried the latest firmware you are using and noticed no problems 
> but we have many devices running the above FW, kernel 6.2 and things 
> are quite stable on the 6174.
>
> On 2/29/24 6:00 AM, Jamie wrote:
>> Hello
>>
>> The ath10k wifi driver crashes occasionallyon Fedora 39 (latest 
>> version with all updates applied) on a Dell XPS 9570 laptop with 
>> QCA6174 802.11ac Wireless Network Adapter.  The machine needs to be 
>> rebooted to access the network again.
>>
>> See attached debug info & hw info.
>>
>> Thanks in advance
>>
>> Jamie
>

