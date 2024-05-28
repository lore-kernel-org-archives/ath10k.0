Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B51C25B78
	for <ath10k@archiver.kernel.org>; Tue, 28 May 2024 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnEXNXS7Fuo888+4R+iNANBlrnAQM4YxC3FEnPxAUGg=; b=NdnjktqXbZVIClBoSTc6KWWORo
	Mi1uYo6HTXKFiRp/0+8PLSS4wKi+Lo86c3KPECerJq3z7+goA9Z8DEn8RN9tiblPwnocaJlMMSUrV
	QT+/qXTIzamV7XWCzYlHtwP32EANvBMXoZSwmYvwKnW28D5W7dnBp7JVO5auUjv825SCyuvKt4HCp
	OWqXnGQth4sxAY79jXeHVH9JgTbOeNQCSyiZoNgLOm+F5HPLk9Gj8ewW2Dc8Hdwskdvv/RkwsgOdu
	3hUVSpCpcML70YQA42i7htFQ5nM8eyN77Di/z9cPSQLB01PqsWe3GgryIigFYWaGa+SZPTb2UL4Gu
	6JDK6TQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBvDw-00000000PUS-4C0a;
	Tue, 28 May 2024 11:42:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBvDt-00000000PTy-0yJA
	for ath10k@lists.infradead.org;
	Tue, 28 May 2024 11:42:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f480624d10so5739255ad.1
        for <ath10k@lists.infradead.org>; Tue, 28 May 2024 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716896551; x=1717501351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnEXNXS7Fuo888+4R+iNANBlrnAQM4YxC3FEnPxAUGg=;
        b=nIsO5+UZp0FqbB76C6KPyjW35UDcvKt5VrQxusp/KTVkto2opoLtOg2TkMwVX1OHQv
         kKFTUwF++dwy7c6L8jSDItX+LO4Dc0iWcZBlwvdPAGUsxK3b2t9XhvdezVDl07HEdU+2
         pZJTqwguwUPYAJCkWAxMMRwgnx+HRuIdX6bbIef2r0AdYBEtZ42bAz+uvzYGsJnCoXai
         Lnh4xPYE0PUxQkLc+g4tmGHTpFYRxj780mpWjN4gOvet3/zhJLoj8TZ8mPMDb8SnDbcq
         jOW4K6Z8vLzxq/0ac4korMtpi6IsG5aTYrSKLZqdUGpkLM3gYNA5ikqMkUNen392UGAu
         UUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896551; x=1717501351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnEXNXS7Fuo888+4R+iNANBlrnAQM4YxC3FEnPxAUGg=;
        b=rPE0lX+yxiaJGkpmOR1mTuvSVgeOfj3xJeBIwgnMiZMDKEkfKl16NRDktMp8/Sl6QR
         0ceeYWnbh0GJv/fyWlLBHdOTlVFJBQD42SySGL6czpOKUOXl+c8CEtRgI2a6EoatnO5Y
         /2SmSBG7nqWSIx3myscQa5p3gLcQV39eQuutZ9Ox3VPK24bn7N7/NhB8jC6jQwAiUx3o
         pKwgFsJBuWF+VhTx8SkL2BA4HQObOnzLp8Vbc2q1RRdPWTjy9lvI1EfYDlfDC75PJoxc
         SVY6PteuuitNW7KVl9wRaoCEuW9McgYr24RQZ8Z+vjHJQPfpla16aJoUf/3nOcBQu0bo
         TNjw==
X-Forwarded-Encrypted: i=1; AJvYcCU6f66toKQrJlDWeLrLQ3XYFoZesnMx0X7BFA+MxYiQRJmazrMX3rkB35iL23HO62nVhv+wkVDGzMtBBvW7GShqV5QvnQeDBbkLaw==
X-Gm-Message-State: AOJu0YxdEO3TUIl0Tf1g7+kUXsMGhPkjQI3LyAtDOWFzHIkyMYMKDbZe
	owIlprxU7VXcWEnj8n2rFYjJLX/9hcDRLK+gQjk8NAhSTFbt5X9t
X-Google-Smtp-Source: AGHT+IGO5L3Fa32QU5l+BrSfABCdODP/2O1IBTw/BZxrL/qzg2y4CjJobhzCA/43uv5Ek01jZL0Qzw==
X-Received: by 2002:a17:903:1d0:b0:1f4:962f:633e with SMTP id d9443c01a7336-1f4962f6542mr71297945ad.12.1716896550607;
        Tue, 28 May 2024 04:42:30 -0700 (PDT)
Received: from [192.168.1.164] (h69-130-12-20.bendor.broadband.dynamic.tds.net. [69.130.12.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c75debfsm78387435ad.14.2024.05.28.04.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 04:42:30 -0700 (PDT)
Message-ID: <ffd7a57f-8cb9-4f9a-b830-d4659a4de520@gmail.com>
Date: Tue, 28 May 2024 04:42:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k_pci 0000:3a:00.0: Could not init core: -110
To: Paul Menzel <pmenzel@molgen.mpg.de>, Kalle Valo <kvalo@kernel.org>,
 Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
References: <0c544b16-5c0d-4687-9f96-8ff1f3269f79@molgen.mpg.de>
 <e1bc0bb8-a66e-4e03-bc22-3dc506b6fb59@quicinc.com>
 <87sey38vte.fsf@kernel.org>
 <96828117-2cf8-4a34-a8e6-78ace96b32d3@molgen.mpg.de>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <96828117-2cf8-4a34-a8e6-78ace96b32d3@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_044233_351090_62A0E14B 
X-CRM114-Status: UNSURE (   7.61  )
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

Hi Paul,

> Thank you. I haven’t found out yet, how to reproduce this. I’ll keep 
> an eye on it.
>
This seems like the original bug I reported here:

https://lore.kernel.org/linux-wireless/304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com/

Note its not specific to power save which I originally thought, but you 
can reproduce it somewhat easily (at least I could) by simply 
adding/removing the wlan interface in a loop. IIRC even just ifup/ifdown 
would eventually trigger it.

But so far the patch Baochen submitted completely resolved the problem.

Thanks,

James


