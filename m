Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA5CC61DA4
	for <ath10k@archiver.kernel.org>; Thu, 23 Feb 2023 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEzxPGzcG92VjVh3TBgDJGV3Tw2zNQ+zP3fHkpW6NfM=; b=Q4cEcLRhZtD2BX
	pnJjRPo8XC7uiuW4kWsLT0TNtuEI8rJf5uLrotDThnWAK7K/3wTY7ueWbxAVyvw1a1XLn5FXNNMbt
	VqX0c5no4Oh5Vu+s7qSxWSKDkfIXpmDFBOVYApX39Xq03hJ4AiIsZ1gMxr3JIKlP1lLdeS8R7eVV0
	A1n02k1HhWXtj8VGI7sAuRIj2k85dpA1PfwAahyEXJ2QECiBXovqyHaz2ptqiTipoYY6Mo/8zdjEr
	t1a1F1+zZy4pyARD9T1P7eJZIzSP3elZYHxxuLvDFB0EiVzGVfAp0PeNQ49Y+R4nW4EqVNCiW9uVd
	JDSXD2MSFiX7YyB9vqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV0aO-00Efse-MY; Thu, 23 Feb 2023 01:39:52 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV0aM-00Efrg-Q4
	for ath10k@lists.infradead.org; Thu, 23 Feb 2023 01:39:52 +0000
Received: by mail-qt1-x82e.google.com with SMTP id w23so9616444qtn.6
        for <ath10k@lists.infradead.org>; Wed, 22 Feb 2023 17:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vtremblay.dev; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SSqlUXGuS/uHM6xrZljYRSKtcdfR9qIkDDj4L5Awp9g=;
        b=oM0TMJ77n/3GBpOZxFRp+NSuZa2Eo+ua649YPnQtbvKFbUDi8I/+BGW3GsBP14onBW
         hHzaIicWlQrfFjjy02XiVTD30ovJtqu3Ff0eC/KBcep1xc074IuzITot+UZhYMSTdrjs
         3MoCrkf40L0orI6eJj+UP4pWlgkSNccuFu+IfbvXCN+lpeSQxBNpUh13TUuzLzHCftrH
         aN1nJzagkT8QhN4c0BlqxHUaNwjwlnu9GbJJ298oVhfUt/GanB5GBZeO/2FwWNWjQw4X
         R2mTUI6rwCjV1o148CWlfGuYER46hEJ8rteyLDIJynPXcGDc8vOv2bQ2WOBzy/i81f+Q
         95Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSqlUXGuS/uHM6xrZljYRSKtcdfR9qIkDDj4L5Awp9g=;
        b=2XVfk39PRzCA86lRKZC4y724/jGNc1USkrGRnccnTs8b+R61B/qpH/HMFBnOU5227s
         q3/KwtzxhloOsWYLHKIUTnQu4k11/zgKVtX5PaUmKz6rNF17OkQxxsZFw7XVS3LrLOnQ
         veLEypJGrupdfzRPJulhr9RdAfqBpuEwhXCiy7lg/tp5pSnyaQFb7uG44I73wq1GSRdd
         bF4r1xq9WW2rSXmBHX4BeOOsdDDDNgvB67sS7yHnmIi+WZyX/sEQPO9qeN+WdE1PFZDw
         q6CiF35yOdcLXv1lsTkZ0CCF1SALUWJ9BotN4B7qvoV8SoJuE4MYBKY/U+D/q5bOIeao
         Gv4g==
X-Gm-Message-State: AO0yUKX8i0qawZ2p0xTND/MnFwM4HuBfHWpSbsiE2+1vzb7K13+B0ZaZ
	D5d0BrnpOyhoMmK6hhZnyCC93iOkA1UNXjoJh90=
X-Google-Smtp-Source: AK7set/3pr3lF0E2pAoxCp4A/L9WdUpSwSrzBd0nkhQMyK05UEbXiPdIGqpLwWbl34D8z2FzQGi2DA==
X-Received: by 2002:ac8:5f86:0:b0:3bf:a461:e6df with SMTP id j6-20020ac85f86000000b003bfa461e6dfmr12401485qta.25.1677116387818;
        Wed, 22 Feb 2023 17:39:47 -0800 (PST)
Received: from vtremblay (modemcable056.16-202-24.mc.videotron.ca. [24.202.16.56])
        by smtp.gmail.com with ESMTPSA id y7-20020ac81287000000b003b84b92052asm4728124qti.57.2023.02.22.17.39.46
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 17:39:47 -0800 (PST)
Date: Wed, 22 Feb 2023 20:39:45 -0500
From: Vincent Tremblay <vincent@vtremblay.dev>
To: ath10k@lists.infradead.org
Subject: Re: [PATCH] ath10k: read qcom,coexist-support as a u32
Message-ID: <Y/bD4Rfv2gE30RM8@vtremblay>
References: <20221231184856.329282-1-vincent@vtremblay.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231184856.329282-1-vincent@vtremblay.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_173950_976473_13329C03 
X-CRM114-Status: UNSURE (   5.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

This is just a small bump to be sure that this patch does not go
unnoticed as it was submitted during the holidays.

Thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
