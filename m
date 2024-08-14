Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBD8C3DA4A
	for <ath10k@archiver.kernel.org>; Wed, 14 Aug 2024 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRPEnt+UgePlZ3KhAkXimBTF2+g5TXY/scfZYgz7QTs=; b=Q8cKBUOQuopVTho813jrfGF4gx
	yEyB9UelZR+kfGwXNN5KdLCXkFGe3fMGgb15FSDYyCARybIFkn24tQ1bJQ0pVoLjG+FT2imyTBTqO
	88MXPhwdN39hoRtxaZJJuLr1dwn/kQ8UiXBGuFBnCMlEVsqAgX6IWj37XL0TgepbCHJA2dRkJH/hS
	IM5AN2rrdee63CIZSKtCmWn7UzLN54fGk69ovdxofK4jS7o34VAJE3jH4Thmws2/zq2eUvX4y0qot
	as2tlTLB/J1eU+4wPMNKvgIstkTOoRs6IPFd4oqddgBtKDfIXHWeG345kc0wSwboHlxZ3eWFU4qqY
	znPPWOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGF2-00000007XMx-3A7Q;
	Wed, 14 Aug 2024 15:48:52 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGCg-00000007Wgd-1318
	for ath10k@lists.infradead.org;
	Wed, 14 Aug 2024 15:46:27 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so407961fa.1
        for <ath10k@lists.infradead.org>; Wed, 14 Aug 2024 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723650383; x=1724255183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bRPEnt+UgePlZ3KhAkXimBTF2+g5TXY/scfZYgz7QTs=;
        b=G1c9faYW+b4CEBZmqVzhCbGHO53lzjnCD9CWdDjflSGRJoV940P5P6dKTWaFBmOqGW
         +cTysQrK/Fu815c/EB/W0/YcT6DoCTq/XNkGxkoSmDmKteYjeO7sisBu5PNi/zsXX4sS
         VI9OiZlryF5f2Wj/0behjqkhbvnmBhCwC92gqNNlf0G/dZuzNhUlqG2MMT19Z6l9CqjB
         nDVpnUrzjCUm23nGUfHpEVGBRxDt7URGloA9O7xZ9g+KueufBeHdgy4pUPcXmtMztMrF
         //sdhFd5k8959rWNm0iwAUfOW2NROg8yrsmtpeKwVPF5VUEwbN52IeR76fIqM1cKGxwL
         CdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723650383; x=1724255183;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRPEnt+UgePlZ3KhAkXimBTF2+g5TXY/scfZYgz7QTs=;
        b=nECOFw/N+Lh662W6M2gh1VSHdJzR4eRJvuJmf4d7yeemjGKJIbADy1tWqRhZ0bofII
         /MLjapYeaaxtiVojKnx33YQceP39H2WPr+pJFzKMvV/AWDi/Bdc65sG4JSwU2xckpHFP
         aoaJqnUntkGwahNVRf/MD2PyYJVVtQHd7ni6nIoJMGmVSk/G0k8fOE3MkyFvV387K7wz
         8xTQyOtqbN/1tVpcS9iGBFIu9JkQRXF5AdESGXhilUYXAWIbHcUJyAovdnX5WfrZ/d6r
         ShhblnbyeYgnmbbiVUjQTkDF7zvNnnHraBYeNvPF7IFyExISPXoZORKNauM/A5hTi+DX
         EYHA==
X-Forwarded-Encrypted: i=1; AJvYcCUSCnLI8F4zPO+I1BNIij2MHCCjT1O8lS1iE5up8zRjbOMtydXeJHOaYIKjIW8xjIlnunFfcB7WWaAksE5wo+C7E2eqczFtKsV8Fg==
X-Gm-Message-State: AOJu0Yz0aPkzRsp1cookhmcg/AC/X2rI6wghjFtLNdgn13HS9kjhMhkE
	7tdeGcViTUBmvcpXa9sQ/hpXd2LKbZBAWwbDOYG9eyizJtRGtH1U
X-Google-Smtp-Source: AGHT+IHgPS8BeIAAs4QPC7yWpVRDMHPBO0tYIu3AF0VCs4w7+PPohNvYhErNnpmHZ4JWoJ6d20Q5Bg==
X-Received: by 2002:a05:651c:b10:b0:2ef:2e3f:35d9 with SMTP id 38308e7fff4ca-2f3aa2fbd57mr33187681fa.33.1723650382501;
        Wed, 14 Aug 2024 08:46:22 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3f4b801sm186584666b.1.2024.08.14.08.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 08:46:21 -0700 (PDT)
Message-ID: <64c8a9c6-9da7-4e25-9245-490c9e7e21d2@gmail.com>
Date: Wed, 14 Aug 2024 08:46:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath10k: fix invalid VHT parameters
From: James Prestwood <prestwoj@gmail.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240711020344.98040-1-quic_bqiang@quicinc.com>
 <603104a7-a1ea-43c2-b0d5-fd4e46a27fe6@gmail.com>
Content-Language: en-US
In-Reply-To: <603104a7-a1ea-43c2-b0d5-fd4e46a27fe6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_084626_309312_24D779EC 
X-CRM114-Status: GOOD (  10.15  )
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

On 7/15/24 5:38 AM, James Prestwood wrote:
> Hi Baochen,
>
> I've compiled both changes and so far those messages are gone.
>
> Tested-By: James Prestwood <prestwoj@gmail.com> # on QCA6174 hw3.2

I just noticed another one actually:

invalid vht params rate 585 100kbps nss 1 mcs 4

Thanks,

James

>
> On 7/10/24 7:03 PM, Baochen Qiang wrote:
>> supported_vht_mcs_rate_nss1 and supported_vht_mcs_rate_nss2 in host 
>> do not
>> align with firmware's definitions, resulting in some warnings. Fix them.
>>
>> Baochen Qiang (2):
>>    wifi: ath10k: fix invalid VHT parameters in
>>      supported_vht_mcs_rate_nss1
>>    wifi: ath10k: fix invalid VHT parameters in
>>      supported_vht_mcs_rate_nss2
>>
>>   drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>
>> base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45

