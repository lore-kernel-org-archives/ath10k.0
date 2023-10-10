Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AC5CD68F8
	for <ath10k@archiver.kernel.org>; Tue, 10 Oct 2023 07:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5H4FFnpqmRVgM+VeblrmtUdVh/0Te5qLFzbcORwZXc=; b=K7tpGQ5tr5Iz5KUkXyYWd4tPay
	28ljgSo3FkQVIaXLNG7dVjN4pLvUkTkK9ei0Y39l0nJwVx9zRrMDs25Mue+zFR7v0pKLqPwd+osbK
	R8Y3egGNqlwrGjwJS7W4NA3FZIafEYN3fzjtYvdd5p+WvarET7JIeQd5zPbC/zDGlpx2eETBOWZBh
	+YarIP5UTn/ESE4Dn0x6acVbSxyXU0X5Mup3C8kGQOkPJkIvx704TMLDQxwezUcVfIjWrDccmIxYD
	OGQaShUG9aZeSVuWWXjaDr6BN6igt7fKFOjjoQ5+iXB+UCuL3GyBaRNiSSg1aKdG68mmm196E/cSF
	5t3lf1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7Zi-00ClnM-2k;
	Tue, 10 Oct 2023 07:54:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7Ze-00ClmB-1Z;
	Tue, 10 Oct 2023 07:54:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31f71b25a99so5318802f8f.2;
        Tue, 10 Oct 2023 00:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696924476; x=1697529276; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwwM7auPgZJMU7dH/X5o56/hwua6iH2A1QFl6/0EOd0=;
        b=lzDAyHwJm1+zKAOeePF/mtNePQrdUXmWYRFjnqtSLWFcHgviXuMigHQCIo+zQ5GB5s
         s47Rl/MT9VKSFKiSbnw3U+h7tSARj4lllRI1N2VDZZIz9/7I8bJYo6Cm4VumCSbZdZeH
         FR/91ofgrsrEqmlSHheFSVQNxzzJ59As32ZwD1cDZspg/1B7F5eyR5TzKKCUGvLiAjYW
         2wCyWkDgjsebNYnS8SAEXtLdKXHjGZfAEw3yKlgv12o7ddG0TdsT5QhREFcoll3O2GP8
         XwySKywwdznopWM1k/fjJfn8k9hBsxKczzYi2ri67f6ceG/r87UgTv+HXM8IZICGA3pf
         /ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924476; x=1697529276;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwwM7auPgZJMU7dH/X5o56/hwua6iH2A1QFl6/0EOd0=;
        b=I4mHPk18mC6iNPXehFM97axe6f4QXWVTLE1MxbwcFIDLaQ9QvL9BNqUMG42nzmxJ4C
         UldOiWpBFz4sU1sBIL901b2EO6DdHMdph5Cpq4DFNPL5zIsQCKFh1UHvnqoEufcmRXib
         pAs+X9+1Zeyd5X5FZj29WbW9IPAL2vRXiP++yuUJ9+/KM8UdWKONcAg/xNNCYZacS2AI
         +lpArUZNbAtc9l6vqhoffnEzKIagy+b8rH3Lb7YZmWtb7r5QzFYgHvME600Lut3MGtWV
         P5fe/Bli/JUQukitZNcteeW1i7Fc7bp7PCYHKvUtYXbNNCzrWYv6TvA/sBDa7+JLe7Az
         AalA==
X-Gm-Message-State: AOJu0YxCbZgsDYLgXvyEN28N9AHbup946D8dM76FF0lGpE6LqwAX/YUm
	cUFVHbvvv831SRG2XpxfYM4=
X-Google-Smtp-Source: AGHT+IFoXHF3xhB1R1QbXfa6gtatnLXym3Q5nnEunh6zFeATAVA0tqJjWKSQ447yVOYMirHfwQlOJg==
X-Received: by 2002:a5d:500b:0:b0:319:8a66:f695 with SMTP id e11-20020a5d500b000000b003198a66f695mr13345455wrt.55.1696924475419;
        Tue, 10 Oct 2023 00:54:35 -0700 (PDT)
Received: from [192.168.0.101] ([77.126.80.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056000110300b0031c6581d55esm11802488wrw.91.2023.10.10.00.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 00:54:35 -0700 (PDT)
Message-ID: <f288a1cd-0e15-4301-8522-d46840dd2d93@gmail.com>
Date: Tue, 10 Oct 2023 10:54:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v3 3/5] netdev: replace napi_reschedule with
 napi_schedule
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chris Snook <chris.snook@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Douglas Miller
 <dougmill@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Haren Myneni <haren@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>,
 Dany Madden <danymadden@us.ibm.com>, Thomas Falcon <tlfalcon@linux.ibm.com>,
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
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Alex Elder <elder@linaro.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
 Junfeng Guo <junfeng.guo@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ziwei Xiao <ziweixiao@google.com>, Rushil Gupta <rushilg@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yuri Karpov <YKarpov@ispras.ru>, Andrew Lunn <andrew@lunn.ch>,
 Zheng Zengkai <zhengzengkai@huawei.com>, Dawei Li <set_pte_at@outlook.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
 <20231009133754.9834-3-ansuelsmth@gmail.com>
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20231009133754.9834-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_005438_543097_D5F2EFBB 
X-CRM114-Status: GOOD (  14.68  )
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



On 09/10/2023 16:37, Christian Marangi wrote:
> Now that napi_schedule return a bool, we can drop napi_reschedule that
> does the same exact function. The function comes from a very old commit
> bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
> net_device") and the purpose is actually deprecated in favour of
> different logic.
> 
> Convert every user of napi_reschedule to napi_schedule.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com> # ath10k
> Acked-by: Nick Child <nnac123@linux.ibm.com> # ibm
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c
> Reviewed-by: Eric Dumazet <edumazet@google.com>
> ---
> Changes v3:
> - Add Reviewed-by tag
> Changes v2:
> - Add ack tag
> ---
>   drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
>   drivers/net/can/dev/rx-offload.c                       |  2 +-
>   drivers/net/ethernet/chelsio/cxgb4/sge.c               |  2 +-
>   drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
>   drivers/net/ethernet/ezchip/nps_enet.c                 |  2 +-
>   drivers/net/ethernet/google/gve/gve_main.c             |  2 +-
>   drivers/net/ethernet/ibm/ehea/ehea_main.c              |  2 +-
>   drivers/net/ethernet/ibm/emac/mal.c                    |  2 +-
>   drivers/net/ethernet/ibm/ibmveth.c                     |  2 +-
>   drivers/net/ethernet/ibm/ibmvnic.c                     |  2 +-
>   drivers/net/ethernet/mellanox/mlx4/en_rx.c             |  2 +-
>   drivers/net/ethernet/ni/nixge.c                        |  2 +-
>   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
>   drivers/net/ethernet/xscale/ixp4xx_eth.c               |  4 ++--
>   drivers/net/fjes/fjes_main.c                           |  2 +-
>   drivers/net/wan/ixp4xx_hss.c                           |  4 ++--
>   drivers/net/wireless/ath/ath10k/pci.c                  |  2 +-
>   drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c             |  2 +-
>   include/linux/netdevice.h                              | 10 ----------
>   19 files changed, 21 insertions(+), 31 deletions(-)
> 

...

> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> index 332472fe4990..a09b6e05337d 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> @@ -400,7 +400,7 @@ void mlx4_en_recover_from_oom(struct mlx4_en_priv *priv)
>   	for (ring = 0; ring < priv->rx_ring_num; ring++) {
>   		if (mlx4_en_is_ring_empty(priv->rx_ring[ring])) {
>   			local_bh_disable();
> -			napi_reschedule(&priv->rx_cq[ring]->napi);
> +			napi_schedule(&priv->rx_cq[ring]->napi);
>   			local_bh_enable();
>   		}
>   	}

For mlx4 part:
Acked-by: Tariq Toukan <tariqt@nvidia.com>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
