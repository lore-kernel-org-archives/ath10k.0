Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86671E75451
	for <ath10k@archiver.kernel.org>; Thu,  5 Oct 2023 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJg864p/ziiARSwT1xm6cHY+pI9shL+CtP75XdBqrO0=; b=thWVuopcu+2cIB
	Z/IrVPaRGlbmz73ybe1ztXyzfCzZrDHcvB4Zkr2NhtrXs7XQnNtUVA8y2b5CwJUpCx26ipzd1aZvr
	mjT5/D713JzsxSuMZhHJdXh3bemcb1F5tLgfXus3Z4Uq8NojItFXIaTSYhWEwNbv9xGMfq1VGcQpz
	w+dSHo8oImy7UX9k5tAKNZveOihKmP37ZiC3j58FBk7rAo5nD6Ay4BgPHacNFYV+uK+/k853CCmvK
	bTASzB66rm8e4oWJy02n9uKMC2aGJWi6MqOtT84GMOx7D90dqWduTYYw5gmeOa8KpDiF9Gsx4/x34
	qm8QQfC/L4iNTWKeNJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoRHc-00455C-0h;
	Thu, 05 Oct 2023 16:33:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoRHZ-00453z-01;
	Thu, 05 Oct 2023 16:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61D5F61921;
	Thu,  5 Oct 2023 16:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6E2C433C7;
	Thu,  5 Oct 2023 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696523576;
	bh=DwGgZF4pD8dMdjurYEUQSJd03FIsbJFkpL4uiIiTuZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=no9ws3a7X4UxOs3t1ZnClQiQoxdBhGZlGNfhrbp5JYwIpj/luaWE1/qY2mSml/Kfv
	 zKudrb4eO3/FEIzOZYMQJKll4e2+nISBj2e5Rvu5vuQs/ZUa8I1Zn5+VpnT9OcLx2W
	 fvuvLuyWkgJ83aCEIvKvuGL1eIVFeTN24MUbRgt45QNq7GpmY3n38lq0MOtmUlI8QQ
	 iWoap0bfmYLCa2VFhE0e48qsh+nGdajFa+QB6GMzZwbrY6JBAYCgo9AWa3hcqOkaJQ
	 Qt19l3uNvUWIvQuiq1darSKlP0coe5ZIZFZXLNlx2kT97+BBmOlMO823CbI3XoIvg3
	 SR+zm46cxSuGQ==
Date: Thu, 5 Oct 2023 09:32:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Wolfgang Grandegger
 <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S.
 Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Chris Snook
 <chris.snook@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Douglas Miller
 <dougmill@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nick Child <nnac123@linux.ibm.com>, Haren Myneni <haren@linux.ibm.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, Dany Madden
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
 <johannes@sipsolutions.net>, Yuanjun Gong <ruc_gongyuanjun@163.com>, Simon
 Horman <horms@kernel.org>, Rob Herring <robh@kernel.org>, Ziwei Xiao
 <ziweixiao@google.com>, Rushil Gupta <rushilg@google.com>, Coco Li
 <lixiaoyan@google.com>, Thomas Gleixner <tglx@linutronix.de>, Junfeng Guo
 <junfeng.guo@intel.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Wei Fang <wei.fang@nxp.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Yuri Karpov
 <YKarpov@ispras.ru>, Zhengchao Shao <shaozhengchao@huawei.com>, Andrew Lunn
 <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>, Lee Jones
 <lee@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Dawei Li <set_pte_at@outlook.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, Benjamin Berg
 <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with
 napi_schedule
Message-ID: <20231005093253.2e25533a@kernel.org>
In-Reply-To: <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
	<20231003145150.2498-3-ansuelsmth@gmail.com>
	<CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_093301_127592_AA71A37B 
X-CRM114-Status: UNSURE (   6.54  )
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

On Thu, 5 Oct 2023 18:11:56 +0200 Eric Dumazet wrote:
> OK, but I suspect some users of napi_reschedule() might not be race-free...

What's the race you're thinking of?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
