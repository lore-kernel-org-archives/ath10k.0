Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED5CDB465
	for <ath10k@archiver.kernel.org>; Thu, 12 Oct 2023 00:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaXgmnfI7hTRQrdDCj3UO0BwLwB/WHcUg1DY0ZK521I=; b=16SnqVmb+z2WVz
	v9Pc6tDKn+nho2P8RwYAiAO9NhMFULtzw2nIFIQNAvtpt0J2KDqFlKWypX7q6HM2MWzhcslMtjbGz
	1ThsYRjYJN61VqDL73KzFpEhaAFrMRyxlquZW6G36XSt2M3w5Kq+RV/so8djqGjYdBovnHvm+STwA
	F6w0fC+qIkExa9ftVC/pwDowHgQf12HR6JypZQDdmwhCEmrFzzbfl1O+9cid8Hox/lHNkFb4UnCRK
	++/2LO7igp6H3hfmvrkFVUdLCsX94z/eqMYkYusysbENoQNb4M/IqcIcaBLjK0lNmlC2YS1pNe9cF
	h56IUp2/i75nyzYrw1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjkg-00H4Ey-02;
	Thu, 12 Oct 2023 00:40:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjkc-00H4Ds-2j;
	Thu, 12 Oct 2023 00:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C88A761B46;
	Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83E1DC43391;
	Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697071229;
	bh=wGHJyiALp3GFYTvWaoHxyso+f2Vuj4QGs+ejJHlDf/k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VE5CUTDPsvYyqkldEDqOEXMVmFtYsTPZSIVSOrPhdqUiu+qC0gTSFu6e4mo37ejhQ
	 /nJHSRLR/5Uq37Vk7V8G+nOXlNvk8vH6E7h/jFJuVqHPRQONGS0TzuyWGyPhojUAH7
	 Y4urAQ4NY7DQHqZIv7DL90hwQTF8/SrBLn8tcK2EKIaO4+tESHK8SoJsiMlOStfslk
	 O/7RUIjozO0FXUzHR0diff2R+Z5LRSigjR9sS4lydG4rj6L1lOXawWzS/iyDrc3/8u
	 ubZ2+bqVueHFdmEqJE9Vi1b+9kyKU6EIaNcULLSEz66GZICCGoNPjSU3dE+Xj/HwlZ
	 8gXY0TDIzUzzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A538E21ED9;
	Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [net-next v3 1/5] netdev: replace simple
 napi_schedule_prep/__napi_schedule to napi_schedule
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169707122936.23011.6924255297609142862.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 00:40:29 +0000
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: jgg@ziepe.ca, leon@kernel.org, wg@grandegger.com, mkl@pengutronix.de,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 chris.snook@gmail.com, rajur@chelsio.com, jeroendb@google.com,
 pkaligineedi@google.com, shailend@google.com, dougmill@linux.ibm.com,
 nnac123@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, haren@linux.ibm.com, ricklind@linux.ibm.com,
 danymadden@us.ibm.com, tlfalcon@linux.ibm.com, tariqt@nvidia.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, khalasa@piap.pl, kvalo@kernel.org,
 quic_jjohnson@quicinc.com, gregory.greenman@intel.com,
 chandrashekar.devegowda@intel.com, linuxwwan@intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 ruc_gongyuanjun@163.com, elder@linaro.org, bhupesh.sharma@linaro.org,
 horms@kernel.org, robh@kernel.org, bcf@google.com, junfeng.guo@intel.com,
 gustavoars@kernel.org, ziweixiao@google.com, rushilg@google.com,
 tglx@linutronix.de, u.kleine-koenig@pengutronix.de,
 krzysztof.kozlowski@linaro.org, YKarpov@ispras.ru, andrew@lunn.ch,
 zhengzengkai@huawei.com, set_pte_at@outlook.com,
 pagadala.yesu.anjaneyulu@intel.com, benjamin.berg@intel.com,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_174030_971680_AE952E47 
X-CRM114-Status: UNSURE (   8.18  )
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  9 Oct 2023 15:37:50 +0200 you wrote:
> Replace drivers that still use napi_schedule_prep/__napi_schedule
> with napi_schedule helper as it does the same exact check and call.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@google.com>
> ---
> Changes v3:
> - Add Reviewed-by tag
> Changes v2:
> - Add missing semicolon
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] netdev: replace simple napi_schedule_prep/__napi_schedule to napi_schedule
    https://git.kernel.org/netdev/net-next/c/ef724517b596
  - [net-next,v3,2/5] netdev: make napi_schedule return bool on NAPI successful schedule
    https://git.kernel.org/netdev/net-next/c/0a779003213b
  - [net-next,v3,3/5] netdev: replace napi_reschedule with napi_schedule
    https://git.kernel.org/netdev/net-next/c/73382e919f3d
  - [net-next,v3,4/5] net: tc35815: rework network interface interrupt logic
    https://git.kernel.org/netdev/net-next/c/be176234d0a8
  - [net-next,v3,5/5] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
    https://git.kernel.org/netdev/net-next/c/d1fea38f01ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
