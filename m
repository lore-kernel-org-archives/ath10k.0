Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCC4E776CB
	for <ath10k@archiver.kernel.org>; Mon,  2 Oct 2023 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=986Whvc/1tzmBCFEKJF5Lxuv2/9Y9hHx8e0iGr/xjzo=; b=KGOfBzw3t/j+rv
	cjcLkfzw+JM4FP06w3V7IzoP14u/2FXl7zGPZwmqMP5aFsYsP2bwypDeU8gKJkMJ3GdYVUwpY0Bfh
	iEHT1W5OlbXX0qEAhMyjo8ojzg/WOPwKA+J9nemrd43exjfQ6lNSBscz5N4S1JM5bQtTnwm9lB7+2
	dv94gwhSr8r8PlHAsLOTW4//zcSOPvSAOFQsGa6c67wsMeQuTEtwmrZdtWjDmgy+/H+qKs4zu4M4b
	bZhGrjJxu2IsHOthadDFlc9+G2TtJQ73m7zgRqTzR0YPd/+pdvu+Dh+g27U3p8WBFlVdxpOgoTeX/
	334UuJhfaN0/F5Cotkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnRIq-00DSBJ-2a;
	Mon, 02 Oct 2023 22:22:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnRId-00DS9r-2Q;
	Mon, 02 Oct 2023 22:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7867BCE12DC;
	Mon,  2 Oct 2023 22:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC12C433C8;
	Mon,  2 Oct 2023 22:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696285314;
	bh=CGV3l4m1Fsxjo5KVleucQ9ACIj7qp3IjWnhkCyY4rZo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YPx5MEwF/HCg5A6rfAedz2iYizSQOXr/9gtMzV+E2dlwiqJvuiHqVp6YRtAwC9ZlS
	 iOAwE9rZIHCPbdG0ZKTqccGsZvdmJOo/00bYzDZF8QdQBQe94QFgEyvtBE9hUE1ZhX
	 FPhADmeOCjSVgRUmxviHjBL7ROHTUtdiWaeb4uQfNFQMva2lL3M61UoF3ATuxEMgMo
	 Uj/iFCrNIKmeNh9SROF1KxJx/VsHoXbgWm43eAwiShXr57QIf5n+H60C5Q59nRGkQM
	 Fnuq18MhzNA8vdaj3zP3dQsTNCYa/h7xuzPe+Ktf6dcjXsvZ3NikpBFsjOaB3zpmQy
	 FO3A4oVVbVVRw==
Date: Mon, 2 Oct 2023 15:21:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde
 <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Chris Snook
 <chris.snook@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Douglas Miller
 <dougmill@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Haren Myneni
 <haren@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>, Dany Madden
 <danymadden@us.ibm.com>, Thomas Falcon <tlfalcon@linux.ibm.com>, Tariq
 Toukan <tariqt@nvidia.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gregory Greenman <gregory.greenman@intel.com>, Chandrashekar Devegowda
 <chandrashekar.devegowda@intel.com>, Intel Corporation
 <linuxwwan@intel.com>, Chiranjeevi Rapolu
 <chiranjeevi.rapolu@linux.intel.com>, Liu Haijun <haijun.liu@mediatek.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Ricardo Martinez
 <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei
 Fang <wei.fang@nxp.com>, Alex Elder <elder@linaro.org>, Simon Horman
 <horms@kernel.org>, Rob Herring <robh@kernel.org>, Bailey Forrest
 <bcf@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Junfeng
 Guo <junfeng.guo@intel.com>, Ziwei Xiao <ziweixiao@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rushil Gupta <rushilg@google.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Yuri
 Karpov <YKarpov@ispras.ru>, Zhengchao Shao <shaozhengchao@huawei.com>,
 Andrew Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Lee Jones
 <lee@kernel.org>, Dawei Li <set_pte_at@outlook.com>, Hans de Goede
 <hdegoede@redhat.com>, Benjamin Berg <benjamin.berg@intel.com>, Anjaneyulu
 <pagadala.yesu.anjaneyulu@intel.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [net-next PATCH 1/4] netdev: replace simple
 napi_schedule_prep/__napi_schedule to napi_schedule
Message-ID: <20231002152142.4e8e2cfb@kernel.org>
In-Reply-To: <20231002151023.4054-1-ansuelsmth@gmail.com>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_152200_147920_E97D3A39 
X-CRM114-Status: UNSURE (   6.98  )
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

On Mon,  2 Oct 2023 17:10:20 +0200 Christian Marangi wrote:
>  			queue_work(priv->xfer_wq, &priv->rx_work);
> -		else if (napi_schedule_prep(&priv->napi))
> -			__napi_schedule(&priv->napi);
> +		else
> +			napi_schedule(&priv->napi)

Missing semi-colon, please make sure each patch builds cleanly 
with allmodconfig.
-- 
pw-bot: cr

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
