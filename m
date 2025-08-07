Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9638FC87FDA
	for <ath10k@archiver.kernel.org>; Thu,  7 Aug 2025 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koULemspuVoWkRD9lYv3sg7EtBEpnOeEsLx2O+F74Yg=; b=P2wQ7DwoZjoGMldwT6nFFXVBSE
	oexS9q1/1hefkQ1YnRUCvbjB2YY5weO3MiO1GBeXUlgXV21roMrDBioUiTC4U0+6LEoAucSu09Yi4
	/wAtbENOv2GSkcf5nr/aE6dTOjq70BXg0xz+pydB/RfHcWdR8Afm1Fd5GM6rnner/jkkpTlIrV3LH
	UH92E7YuW+bKPj9+6Y/HDwBXzL3GsCTqJOk8xMsQeN2AZkRDJAiRWBsZhTRqvr6ZkJBDvOglKc1pZ
	6/iz8Ww45ASv9sH33l7v4c3/w+2TM5cIz+f1nRbOUCu5Hsx7MtIzw3GeK8Sa4dl26KOb4xTsVr9gA
	GlpK6o0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvvq-0000000HaRu-44Oq;
	Thu, 07 Aug 2025 08:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvuq-0000000HaNq-14Sd
	for ath10k@lists.infradead.org;
	Thu, 07 Aug 2025 08:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFEC844CB5;
	Thu,  7 Aug 2025 08:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB81C4CEEB;
	Thu,  7 Aug 2025 08:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754555039;
	bh=0NJziiGdCrPe6ikKhGXkqWzuF7OOp0aWP72QcSrY1sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSJkgmwGR2vsL1LzbGcKaHmFg8JyJ3j/w5LgPkpCCIirdIU0F465cq4NJk3fvWscl
	 OcRP5/byezip2uwstA0ur+eZ7TnZlW3jviU0hHHu2+xF9tLZu+ZjP1A10qkSWcxwCf
	 s/C6OvTb4xBqhf3H4dj2xLgnpV4YpDUT0YRX3kIxMbG8flF6N3xMhZyqCqeB9XHRrO
	 bxRJSHmxvaACBOm2SmxvVFj1T9NryskWtQo9thWeOaPPCPdyxqBgMnIuRvWlm94Fk9
	 NRLxQyj5ADu6YtcCRxvQFsThn2GQnLhj6zGAu89oXTiLBAv11PIE+hcyONe9FLedtr
	 A8pPLeB+S+m0g==
Date: Thu, 7 Aug 2025 13:53:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: Packet loss with QCA9377 (ath10k) on ASUS VivoBook E410KA
Message-ID: <l3iebypcyxpqxod5os3mn6465cwdlbnmlkbjnx3vu5bzyb4vhl@3dxnam2a7c2t>
References: <20250806204018.GA14933@bhelgaas>
 <BBAB0136-BB7C-4D59-B29D-2F35FC29D7AC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BBAB0136-BB7C-4D59-B29D-2F35FC29D7AC@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_012400_311885_120E24CA 
X-CRM114-Status: UNSURE (   6.56  )
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

On Thu, Aug 07, 2025 at 11:33:08AM GMT, Bandhan Pramanik wrote:
> I'll tell the guy to clone the ath-next branch then and will inform you pretty soon.

The patches are not in ath-next. You need to manually pick them up from mailing
list.

But even if it doesn't help, try to disable ASPM using cmdline by passing
'pcie_aspm=off'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

