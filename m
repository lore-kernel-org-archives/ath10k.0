Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57196C6FD1D
	for <ath10k@archiver.kernel.org>; Thu, 16 Mar 2023 03:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Z+n6bUA37WH0uGwtaxkXpAuY1ewB3dlKR/ayq50/Gs=; b=HCTLb/As+/HX72
	cAu8yomxjJciZrOzXVcVSlNM2SBvTM336WtkzkDGMGnE40hSXP2U5BGfRtfOp1l6/jYtdN8Q04kZP
	5T9HqxcjdYxea7KUX58FFBfDW3sw6hf7PFkuuLU+gkgjrrZ1AyG0/62ZIeDcWH6jmgyzVedLlMCQC
	y6mV7OPpKrwgeEClZS6vHgKGFjI4RAi8a0Fm8xR2iak4ar15n+l5fJhHVQmp5BPAi9EdgN6CHm+Su
	U7DpgC3l/voJPyQb5Ocvo25dk6Lo2VAb5TnejN1Aa4AivABf9fUiqg5zwbPF4biBfRXotHUD4Bj1e
	s26uJNN7ljOVIp+qlFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pce7z-00F4nS-1u;
	Thu, 16 Mar 2023 03:18:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pce7w-00F4mJ-2c;
	Thu, 16 Mar 2023 03:18:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 85B49B81FB3;
	Thu, 16 Mar 2023 03:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE274C433AE;
	Thu, 16 Mar 2023 03:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678936682;
	bh=y0sZoUeFff+6cDV3HaVMqB5f4yIzmgYZdM8d6h5o3pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jawiJkp4F2oYL3A1ptkMbLijjPnwxZp3UEKvAHclV5SnuNbnvSKtEvzsA5/2zLFX1
	 wNhl3Zja0S9RiC6c6bD5aJ5EDGoejYe2Q/W4Vqyf2ipXCkD7RERM0xTkL5tBHBmYt0
	 uNmGObR85LSgDkI6ZAhx09n+b+bA1g734mcxcies2Dd4UAa2enhH1EHydVBWDzFQyH
	 qYLuQ3LGLLxZ7bQl/kv9TiHXU5iRi4PENdtAc6jrSCWOOPZB4XNptSZ4Tau1K/qHAz
	 4hgcG/tmkkee1FWYq1YSJ4cL3D3TRPVAyalv3ZCpfpl8WMXTtiBop9i10FzPY+51Ia
	 0L8sJJUIiXpHg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kalle Valo <kvalo@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Alex Elder <elder@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	ath10k@lists.infradead.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-remoteproc@vger.kernel.org,
	Carl van Schaik <quic_cvanscha@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	netdev@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Murali Nalajala <quic_mnalajal@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-doc@vger.kernel.org,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH v9 17/27] firmware: qcom_scm: Use fixed width src vm bitmap
Date: Wed, 15 Mar 2023 20:21:02 -0700
Message-Id: <167893686406.303819.2573416221076147237.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230120224627.4053418-18-quic_eberman@quicinc.com>
References: <20230120224627.4053418-1-quic_eberman@quicinc.com> <20230120224627.4053418-18-quic_eberman@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_201804_997855_9B59A107 
X-CRM114-Status: UNSURE (   9.29  )
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

On Fri, 20 Jan 2023 14:46:16 -0800, Elliot Berman wrote:
> The maximum VMID for assign_mem is 63. Use a u64 to represent this
> bitmap instead of architecture-dependent "unsigned int" which varies in
> size on 32-bit and 64-bit platforms.
> 
> 

Applied, thanks!

[17/27] firmware: qcom_scm: Use fixed width src vm bitmap
        commit: 968a26a07f75377afbd4f7bb18ef587a1443c244

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
