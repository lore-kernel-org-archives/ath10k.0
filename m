Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F50DC3DA59
	for <ath10k@archiver.kernel.org>; Mon, 15 Jul 2024 12:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sOGd8ILXqtgCUTYOD0O2ztRCepVHNWTEZZrqp4/PJY=; b=oCCjwB7Sgz7IZDjXX50cA1gwmd
	oZwpdjC18HppxGGHD8f6w7WLnamXDNuYONjqPgvmBVpOE1BaJ3PPG9mdoD+wkwlGA6JxNQlTjzhww
	m8tw5e5EZCOwxAGY/k7a8BDAs1AGst3g786ibMcArjXVd1VPHwYO8W5S1qQJ6pa6iONBeAUuOSSHx
	bFAo5iZWRMcG925AujWrcJZ/yNwLRAQb21jxyxewmS013y3RZ8VV5g7EBDMj8JLsUg0FcVp0MxRnn
	pmq+75/aPx+v4WAOiPW8rkfKDmrbQi4iPBjXDl9+QLkNGJXm6aHR+5UK0MTCtVzzM6IHQKco1hboz
	xm5unBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTKyY-000000073Hu-3gfM;
	Mon, 15 Jul 2024 12:38:42 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTKyW-000000073HN-1fMb
	for ath10k@lists.infradead.org;
	Mon, 15 Jul 2024 12:38:41 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e0354459844so4280936276.3
        for <ath10k@lists.infradead.org>; Mon, 15 Jul 2024 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721047119; x=1721651919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4sOGd8ILXqtgCUTYOD0O2ztRCepVHNWTEZZrqp4/PJY=;
        b=a4l0bd0AhIYsr9aXeZKJmnME2O/Z9E+x/QEEPbWRrQaL5dos0JsKfl4ba/0LrZPeDW
         P+hLr+wbTyKWCHQdGgWVdN/STyjFdPpW6bDWAexhm2tbzbSn7oSTlciLlQD0beTfMh0h
         IHW8IP7uvXXNjGfOSFBMF3p2mgk+7ApDUxfaAbTDaaxdvrd/OpXBNHQhj4y8B0McYkrh
         Od+1jujQW2Qos8JuOwTPOWeZfkdJBvFi2OK8wW6x3MmL5NABSbdLYNeRnJMSLp+1G6/u
         DAlRehPW3XNfx4Fb3XT8E0rsnuptFLT7sooFpMGtraCRXiiI6NvNRLuDBx27+6WLFqGI
         ZqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721047119; x=1721651919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sOGd8ILXqtgCUTYOD0O2ztRCepVHNWTEZZrqp4/PJY=;
        b=ct7sH0+d8p3x6zZPHk7IhpxGxnmkKuR4hBY8vThSZ8O5gaBVLuXKUjoJEBfdrlpKAj
         8YkRaKcZp+xEAYsJcvpEDTWBw+7mXaj8G56GQTyu9hWIcwW/jTT43Ey/5t3HobrI6i9D
         E7bKktNQZdLxVAL/MyDR6CWxhKpAtKQvkaeEuI7+w40AbqW4FgP9ic9ZkBNeyHKgBdJF
         yi/gEkzRAVarwd+iOj+Mm1q13tCGSbRMl3J8wJuG42BdR5M49vTpyaZMQkLdkQROD3rP
         qKQ7KfSOgUZa00zI8I3MivRr6neeXWZmpN9HWBh91QneuEYwEo0+VSkSlCsVswvURsxc
         VkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP5yA3mb5fevcx3zCiyZMJB80pxbyPjKnxzlAeFFDziT87LFrPIJYcUPj0iMcl/k6H6ZVxitss7LALwa5LgdCXlLwmWRnRB5RDuA==
X-Gm-Message-State: AOJu0YwITL1cDXvxH2lqoPiiklh9C+gjlw5m145rtSiYV1AypHA13rxi
	FDXrk6wlabZTh8y7jnP7GYYbS6ou3QOp21/j+007U/8FyJNDmolXB7Ul0A==
X-Google-Smtp-Source: AGHT+IFCvcgcaQfGPpFJ9QEedbXDxEOwKx34UtaDypeshbYxYIqQjai83t2PaptEzxeXnuk4AyQlXQ==
X-Received: by 2002:a25:84c4:0:b0:e03:2d88:13a4 with SMTP id 3f1490d57ef6-e041b137102mr21793649276.52.1721047118862;
        Mon, 15 Jul 2024 05:38:38 -0700 (PDT)
Received: from [10.102.4.159] ([50.78.19.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7619a54e9sm20936986d6.71.2024.07.15.05.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 05:38:38 -0700 (PDT)
Message-ID: <603104a7-a1ea-43c2-b0d5-fd4e46a27fe6@gmail.com>
Date: Mon, 15 Jul 2024 05:38:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath10k: fix invalid VHT parameters
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240711020344.98040-1-quic_bqiang@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20240711020344.98040-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_053840_472968_D5E7C3E3 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

I've compiled both changes and so far those messages are gone.

Tested-By: James Prestwood <prestwoj@gmail.com> # on QCA6174 hw3.2

On 7/10/24 7:03 PM, Baochen Qiang wrote:
> supported_vht_mcs_rate_nss1 and supported_vht_mcs_rate_nss2 in host do not
> align with firmware's definitions, resulting in some warnings. Fix them.
>
> Baochen Qiang (2):
>    wifi: ath10k: fix invalid VHT parameters in
>      supported_vht_mcs_rate_nss1
>    wifi: ath10k: fix invalid VHT parameters in
>      supported_vht_mcs_rate_nss2
>
>   drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>
> base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45

