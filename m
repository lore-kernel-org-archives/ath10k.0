Return-Path: <SRS0=591D=LR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A398C4743C
	for <ath10k@archiver.kernel.org>; Wed, 23 Jun 2021 19:23:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362F0610A0
	for <ath10k@archiver.kernel.org>; Wed, 23 Jun 2021 19:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362F0610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIUm6I1LGVBvj7nfHYuys4w4CkT4AQe450nDjaG8U9k=; b=jZOUn9haAnPaM3v1Km08lhs07n
	ijNICJNPv9Xvn1RSv2tWpGvhg9xmIzoUrlHCZ37H8i6kWB/3HD6qxAVgjADk18JT3s0GArTrzmSev
	2+cQAPN3mzKJZMaB2mu2mVsl5VxqKVDNaBPSgRefLS1nTlqXwKDtQgEBnEq5Pb2w2RPlqVKWz6vLK
	W5qnR+uX5UyvwxPUA7P9lHIeYswhcS9MP9GRUa+8Ha4K2OTsYwJaloBQHCo5nkfWXCwa8gm8Uth57
	mvDtVH3ETy6nELAtdWsyNVyqUehqdpStNYYyV8Omwh5Iop8Wu4CFnhd9BGEvgsuIhbvEvHhrEnK6A
	reWY/ZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw8TH-00BmNk-Re; Wed, 23 Jun 2021 19:23:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw8TE-00BmNG-U4
 for ath10k@lists.infradead.org; Wed, 23 Jun 2021 19:23:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id b3so3853908wrm.6
 for <ath10k@lists.infradead.org>; Wed, 23 Jun 2021 12:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dq4bNmoezBnbnji3QvGAbb4dAnBkndoiAymK9jeUq04=;
 b=CXI/3Xn46DPHunYRKMemj/2lg5t37dPGcrxC3jgZ8wJ2Xt4NSh5BnW6ztXNkFQqpFG
 1Cr8LrePNp3O7IgldKcRLxV4LsGPfuX7pYwcwtf/+KuHpXQ4FJuVtPHydSQS/hzdJfqX
 61vbLpJ6/1H43UteLHFlJjVztyn2WSzGo0E8XSU6KS8kgxV6I1KuIvnT/HXYjV6u+W6e
 df77zCiRRWOgmmyOQyFsspvB+WaKv6E+jRUurODdeinnfEYibe5E05eF5Rjo11SK2Jlf
 oyFkzNRkbyou005ife0lSyBZYirff5jVaRB0tFxMQKQ6rLLwt0rRo7F/b9px68EwAo6i
 fHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dq4bNmoezBnbnji3QvGAbb4dAnBkndoiAymK9jeUq04=;
 b=ZOrRz9hH8xTvUVvybQENIXVOyJN5Dz2aNNev/S/CapEnk8Y5kKHJ+6s+zZkQUkw7Z3
 eUUB78/DJBSBTNzaBx5Hf1gl02DuyqKyCuak36Av/NzFWmP2sMCmHBTFUwliKJO7xkNS
 SBH3H4D4ESJURuf4Pa6IjQrXS6ir8q5r/iGZ0p3HCcjAM6dhlc2YKLzxLNYFqFbIJhyH
 rkJU98HFOqWYb2xhy/p/zG/1wudJH2JxJJJLJQtbBcJKDuT9sKJSwEmXbNOE71S8htYZ
 +0Z0H4JUrmNscCItdjdWCLLsWX8nPZEehBzftRikmImmWiXWAAzoANCswyrOMD1JQQjD
 LMNg==
X-Gm-Message-State: AOAM530LM6UqwENrzpeVUtEMW9mwJoDmiDkGZbfcexFCQLLy+QCm4omi
 35oYasXckbVDUd2nvxpPcdY=
X-Google-Smtp-Source: ABdhPJxVE30MVKLDbgompMmg6DCsBEGcqwOjveqUOXfXf4Yg4EnJ59pE44Lg0c84bsQbJrVeZGVd1Q==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr1906893wri.261.1624476210812; 
 Wed, 23 Jun 2021 12:23:30 -0700 (PDT)
Received: from debian64.daheim (pd9e29157.dip0.t-ipconnect.de.
 [217.226.145.87])
 by smtp.gmail.com with ESMTPSA id x7sm905871wre.8.2021.06.23.12.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:23:30 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.94.2)
 (envelope-from <chunkeey@gmail.com>)
 id 1lw6ak-000BL4-DD; Wed, 23 Jun 2021 21:23:27 +0200
Subject: Re: [PATCH] net: ath10: add missing ret initialization
To: Pavel Skripkin <paskripkin@gmail.com>, kvalo@codeaurora.org,
 davem@davemloft.net, Yang Yingliang <yangyingliang@huawei.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210623191426.13648-1-paskripkin@gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <a0805010-788a-5ff8-2e6e-34e7ded8c34b@gmail.com>
Date: Wed, 23 Jun 2021 21:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623191426.13648-1-paskripkin@gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_122333_039294_68DB7CAC 
X-CRM114-Status: GOOD (  12.42  )
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

On 23/06/2021 21:14, Pavel Skripkin wrote:
> In case of not supported chip the code jump
> to the error handling path, but _ret_ will be set to 0.
> Returning 0 from probe means, that ->probe() succeeded, but
> it's not true when chip is not supported.
> 
> Fixes: f8914a14623a ("ath10k: restore QCA9880-AR1A (v1) detection")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

I think this is already fixed by:

commit e2783e2f39ba99178dedfc1646d5cc0979d1bab3
Author: Yang Yingliang <yangyingliang@huawei.com>
Date:   Mon May 31 17:41:28 2021 +0300

     ath10k: add missing error return code in ath10k_pci_probe()


Cheers
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
