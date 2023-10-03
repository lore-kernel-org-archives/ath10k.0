Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC3CE7544A
	for <ath10k@archiver.kernel.org>; Tue,  3 Oct 2023 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fscYb36dJnCIDm/UPrsCkWl6QGsF3ygSpOB+A0PdpI=; b=TLjB2xK5HmFUH8
	KkLry/gmmSSjckqAAQ3jQ0GuEcUuX/0MwnFxvfJ5OP3Z/xfKxj63CLNmVaAFGZCDp9P3zar5Fqn4N
	3dNSBNUCj7sz/Pn8GXSXjUE84J4lLVbApCw/KKJ+2vPGGPlimS8vKtt481ILDW2N/85SHfY0e82dH
	EuPJoJTX1ZdkzFjzHu5kPhCAN1vonoZ/SnboU9+SN3oKmCCyltPzEN6PzyQL9XJiRwRIpEm4dKw6n
	rdDxp5QurP0YTybfG1JvdR9fpIdq3fSvZlL/ubuFjYu2vFLGerXlyoyH/2S++t+j49YMXjV22ZzDg
	JKmy6PMR6ig7Bz43nR5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qndQL-00EWQO-2E;
	Tue, 03 Oct 2023 11:18:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qndQI-00EWPU-09;
	Tue, 03 Oct 2023 11:18:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405497850dbso7755445e9.0;
        Tue, 03 Oct 2023 04:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696331917; x=1696936717; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dRmt6j5dxjz0MCUrCJcyD2cXKQxyJFJdm8ATGNw+KGc=;
        b=fN6XMd0mKPKMu1Ca2PvzWPVNTLdBM++ng701nbxaoXbVL4Oh1frgOBQMFfy1VOIH4R
         zmxx6xcUafF0497xTdF+AKZa2W5Zcx0AGxoUzgmFExT/K7PQLIqmt1JcTXptZizbNAC8
         sN7uCJ2E4xOX2ErIvZToKHIVJ/kjikiZ8Z1nN9AFjhzoCVcwIB+JKElsmcABIGR2urJG
         UyrbEnck7XQF6HjLUTxPz2Z2PSEkZoExez+pQv2cHnWtp377EnHCuMT7OEBJHxshk5Qb
         PyOMZTvhe1SKJ1NKeJKW5/ouAbifM9zIR/VHkn0ITzfWjIGczJREd5CraXZ1A48P7RMX
         x1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696331917; x=1696936717;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRmt6j5dxjz0MCUrCJcyD2cXKQxyJFJdm8ATGNw+KGc=;
        b=haxexq+smOhbP2v/fzJeXLIqXXIUz120DLKDfcwqtg5Fp9FChsUmG09hPNQUuOUfSc
         ILouUWhLvcOARF3Mpg+EDnbXVXXGlZ1d40iaAfHCSLzRz5FBKeAmQJlW6eDMEc1yuNe4
         mSn3/FJtxhSEBmCsI7vF1Ben195cwmHQzqYx3kyxKJ75Ur6Ns+7q4xUMSDyIp2NAaGbU
         1Erg+0lta7eTSwC0N15Uq3Wl1ZjPt7RCfdrPZGbWTvndJG5cL8WY+VMJjsKkYI6WXS/a
         xm7Jv3kl+wcYhQgJP51CqSJpQXevgvlOHsj6yoP0eiS8Plbb57uph4nI1tRg14Z/4Yi5
         vLfg==
X-Gm-Message-State: AOJu0Yw6IhUPK/a3Fa+3iKsgcFtKmbPyyXhjBRsBd8TU5qeC0l61fYUa
	63Br04lKi6ercswy9f7NuJ0=
X-Google-Smtp-Source: AGHT+IFLbiLzMIjYq17N9d6C9xhiAG+ijgYatVYbYzZACplv9aboPtXUhqao5fQwPpvl9QyVVVJ1HA==
X-Received: by 2002:a7b:ce89:0:b0:402:f07c:4b48 with SMTP id q9-20020a7bce89000000b00402f07c4b48mr11269565wmj.28.1696331917146;
        Tue, 03 Oct 2023 04:18:37 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id y24-20020a05600c365800b0040652e8ca13sm9195716wmq.43.2023.10.03.04.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 04:18:36 -0700 (PDT)
Message-ID: <651bf88c.050a0220.3a982.31fc@mx.google.com>
X-Google-Original-Message-ID: <ZRv4iZmOuLubYSiN@Ansuel-xps.>
Date: Tue, 3 Oct 2023 13:18:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Douglas Miller <dougmill@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Dany Madden <danymadden@us.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Intel Corporation <linuxwwan@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei Fang <wei.fang@nxp.com>,
	Alex Elder <elder@linaro.org>, Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Junfeng Guo <junfeng.guo@intel.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rushil Gupta <rushilg@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lee Jones <lee@kernel.org>, Dawei Li <set_pte_at@outlook.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [net-next PATCH 3/4] netdev: replace napi_reschedule with
 napi_schedule
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-3-ansuelsmth@gmail.com>
 <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_041842_090294_91620349 
X-CRM114-Status: GOOD (  13.71  )
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

On Tue, Oct 03, 2023 at 09:16:33AM +0200, Marc Kleine-Budde wrote:
> On 02.10.2023 17:10:22, Christian Marangi wrote:
> > Now that napi_schedule return a bool, we can drop napi_reschedule that
> > does the same exact function. The function comes from a very old commit
> > bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
> > net_device") and the purpose is actually deprecated in favour of
> > different logic.
> > 
> > Convert every user of napi_reschedule to napi_schedule.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
> >  drivers/net/can/dev/rx-offload.c                       |  2 +-
> 
> Acked-by: Marc Kleine-Budde # for can/dev/rx-offload.c

Just to make sure can I use the correct tag: (you didn't include the
mail)

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c

?

-- 
	Ansuel

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
