Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB879C87FD3
	for <ath10k@archiver.kernel.org>; Wed,  6 Aug 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RgmEzbOUCFitmfVbTWye7OiTOsLoHfQAtF4tNmxwn1w=; b=kmB9B0wKUHtc+rUR8bT8zmhfVT
	JCCH0YaKO0Ielgc+Fv1Nv73pbwHZTz/NLa6iUBpGTFRgf5eSNKuizRbZ3qQW8bCeDstntJHCcSXzA
	EeozJ77tWXiaUwdDa+RxkWqb7O53T+6/oArnvkGanvddASQYsHV/ODp3dFEekcM8BIJd26MkYv/90
	FWzYtvfdEpwTnmamWGvajKEMJezrCHXp7d+VXBpaC6udJI9r9SSQtqaLfz8k817942Ym+oHs5nhCS
	Bg/Zz9+5FHGp5tyhDbk5J2rsasuulwrfcFlCQQeB35uVykuHkm3Iv9nAonRb2nxCXYVoovKBrK8Sl
	JgbxagVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnLU-0000000Gnj1-0rkd;
	Wed, 06 Aug 2025 23:14:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkvs-0000000GQzd-3Qee
	for ath10k@lists.infradead.org;
	Wed, 06 Aug 2025 20:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E62F2A4E05B;
	Wed,  6 Aug 2025 20:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7049CC4CEE7;
	Wed,  6 Aug 2025 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754512819;
	bh=NH36ylIEOImfIJAsosvJwcFt5Tcu/AapmVr89U8sXR0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PnTxjp7Iw/07Jny/3lPuCICzqt5VPU6IoIFN6GV5MwPFT6Ky1X32qG9fm91TRXLmv
	 +Vgo3UFNwPrGCe9yboehAakqp193rtjf/zC5e3WJue0bO9j5qvPIgoeFt4DDV1D6i3
	 OrslkhvB9WVcTUhfxsrMJ7/HeG8CZmqIBepOX9cGzGvl7CkOpBm2D6ClWDUS2Sp6RS
	 7mZ86hBtlNxJ0CoAx4/lx1PsP1tuwhejzpoEyLTaNCF/r6a1KNDrj/37mAQ++rP9U6
	 oUxda2OIMcwdQx2vQWAHWIGQyGlR2G0ZkAEbEueoy7GiQVUgtk2aOOhqlJz6v+Egii
	 otSB76mH7nFyQ==
Date: Wed, 6 Aug 2025 15:40:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
	ath10k@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: Packet loss with QCA9377 (ath10k) on ASUS VivoBook E410KA
Message-ID: <20250806204018.GA14933@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b41300c-2034-4cad-8549-2622c224330f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_134020_923570_92219ECF 
X-CRM114-Status: GOOD (  13.31  )
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

[+cc Jeff, ath10k maintainer, Mani]

On Fri, Aug 01, 2025 at 12:09:01AM +0530, Bandhan Pramanik wrote:
> Hello,
> 
> I'm helping someone who was having trouble with their Wi-Fi on Asus VivoBook
> E410KA. The device uses the QCA9377 Wireless Chip.
> 
> The device suffered from a single packet loss within 33 seconds while
> running a continuous ping. There might be some PCIe-level communication
> problems too.
> 
> All the relevant logs can be found here in a redacted form:
> 
> First part (ping, hostnamectl, ip addr, lspci): https://gist.github.com/BandhanPramanik/7eefd192c3a728d2473687a786fbbc01/raw/e77f0fa1cf35c748730df220b0057399ac78f539/miscellaneous
> 
> Second part (cat /proc/interrupts, modinfo ath10k_pci): https://gist.github.com/BandhanPramanik/7eefd192c3a728d2473687a786fbbc01/raw/e77f0fa1cf35c748730df220b0057399ac78f539/miscellaneous%25202
> 
> dmesg: https://gist.github.com/BandhanPramanik/7eefd192c3a728d2473687a786fbbc01/raw/e77f0fa1cf35c748730df220b0057399ac78f539/dmesg
> 
> We’re not sure if this is a driver issue, a firmware problem, or maybe
> something hardware-specific.
> 
> Has anyone seen something similar with this chip? Any tips on how to
> troubleshoot or fix the packet loss?

ath10k mucks directly with ASPM, which it definitely shouldn't do
because ASPM configuration is extremely sensitive, it involves both
ends of the link, and the PCI core needs to know about it.  So I'm a
little suspicious of some issue there.

Mani recently posted a patch series to clean that up a bit, but it's
not fully cooked yet, and I don't know whether it will help this
situation:
https://lore.kernel.org/r/20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com

Bjorn

