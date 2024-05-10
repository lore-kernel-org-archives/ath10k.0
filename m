Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CACCC25B10
	for <ath10k@archiver.kernel.org>; Fri, 10 May 2024 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfLTng06w9oV/mnQ9ovMHUsUC34kFS87Pkp8TLPsi10=; b=hqrHUYmCpedQWVBqpk3DqZZ6YX
	ROws8f3SzLnvwRCy7T5Vg4oHjZ+ord5Zzx2bZP9nc3Lzmfbp1tHCX+hKjQO2WR7PtzCTt4FqSTcvp
	LE0EAdtXzJ3hKFse1xAE28ZhCWNj+RZr9El8zDbZbdLLXo9JRm0d6v5wtPzuRTS0Qy/wWLrED+k9Y
	SaFngBuLhMXoggVK/VCIhJWfg3V0FT/MScM+bG5Y3Yx9iGBoM6Uwn4JcP8RL0VbEmxIquCiUdwChE
	AYUAcs5/XlG6JXu2FOyDUwrCcK1Jgxa0S+PRVAbzRSmooRF3GwSdgpfQEspGw3dCI/y/awWtj9QAO
	Hol6tdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QeL-00000005S24-1j50;
	Fri, 10 May 2024 13:51:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QeH-00000005Rzx-3AJc
	for ath10k@lists.infradead.org;
	Fri, 10 May 2024 13:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E8A061F06;
	Fri, 10 May 2024 13:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328D6C113CC;
	Fri, 10 May 2024 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715349056;
	bh=1o5pwPx9wrewqRpso30hR7MfPzjEudJwCui/sX1m3SY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OI2Z35V+XCNTV1UDJaNCiVB+oz/Nl7JOH5NMPltS4N0lFk7kFn/c5zRHQoSC8Z4qh
	 Zu+Yv2b93c6mXPMeMfjo7x32z2RaCH15eSpxMemdO2p7aMrEDR97wk+XMNttsAO0yI
	 WyqixIrBrcZINuOTeoNdr9tF3VCGLbB6YJuaU7L3MdRPtrlvDAoKaEYgRDb/HZSKfZ
	 GQYvhnj+/iFIsHrO3VoRRY3n5rXt+KEb+h+d2FClI+qu/PvYV0Br8eB+zmYKJ3bfm5
	 3dRNQ6E267bfPRfncksQ92R+Wck/iBwS/8eCtGQbVati6pDgYrhyd/bQ7uV6nBQtu5
	 JkgqRABfTlhBQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  linux-kernel@vger.kernel.org,
  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  Sebastian Gottschall <s.gottschall@dd-wrt.com>,
  Steve deRosier <derosier@cal-sierra.com>,  Stefan Lippers-Hollmann
 <s.l-h@gmx.de>
Subject: Re: [PATCH v14] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20230611080505.17393-1-ansuelsmth@gmail.com>
	<878rcjbaqs.fsf@kernel.org>
	<648cdebb.5d0a0220.be7f8.a096@mx.google.com>
	<648ded2a.df0a0220.b78de.4603@mx.google.com>
	<CA+_ehUzzVq_sVTgVCM+r=oLp=GNn-6nJRBG=bndJjrRDhCodaw@mail.gmail.com>
	<87v83nlhb3.fsf@kernel.org>
	<663c9fc7.050a0220.5fb3a.4e87@mx.google.com>
Date: Fri, 10 May 2024 16:50:52 +0300
In-Reply-To: <663c9fc7.050a0220.5fb3a.4e87@mx.google.com> (Christian Marangi's
	message of "Thu, 9 May 2024 12:04:52 +0200")
Message-ID: <87a5kxlqrn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_065057_873148_3D89D072 
X-CRM114-Status: GOOD (  11.42  )
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

Christian Marangi <ansuelsmth@gmail.com> writes:

>> 
>> Sorry for the delay but finally I looked at this again. I decided to
>> just remove the fixme and otherwise it looks good for me. Please check
>> my changes:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=688130a66ed49f20ca0ce02c3987f6a474f7c93a
>>
>
> All ok for me, Just I notice the ATH10K_LEDS is not exposed anymore? Is
> that intended?

Yes. It follows the same idea as other wireless drivers do, for example iwlwifi:

config IWLWIFI_LEDS
	bool
	depends on LEDS_CLASS=y || LEDS_CLASS=MAC80211
	depends on IWLMVM || IWLDVM
	select LEDS_TRIGGERS
	select MAC80211_LEDS
	default y

So what this patch now does:

config ATH10K_LEDS
	bool
	depends on ATH10K
	depends on LEDS_CLASS=y || LEDS_CLASS=MAC80211
	default y

The idea being that if LEDS_CLASS is enabled then ATH10K_LEDS is
automatically enabled. But please let us know if something is wrong
here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

