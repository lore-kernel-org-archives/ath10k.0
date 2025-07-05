Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AFAC8303C
	for <ath10k@archiver.kernel.org>; Sat,  5 Jul 2025 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=UveDKE3PcEuQhR6ZPJcGgVEjxlaQrBOsdcH4yGYvHl4=; b=JKIIlt1jNIFCZY
	QLQftSiCTFdSpxHGo8wQjd9KBEWarNMYASe0BK8JBLQauHIF1f1+ee2rZhjhs3drxwb2pZDbausGX
	ZBQc2ZGqnqxY4EOm+8mRwFmCm0wBs+uRjXpxciisma1OQsmQRwqFhKWtDWMuABa+rZVVQTumPV6nw
	w6HEYWPxnnA0OFhJk1OZ1t926XbKfGmaV5sHE0Uyyer4WEU+N+9l+XA7ueF2AWRMxldGrvd0eslJw
	kPYBktoE6n3wihK4UQZdVvGYpabJbtAKMvC4fmmpgecrF7gp7pzPK+jxTUXPDP4byc7I78nAIjGEj
	JAsnkc+ocwsYMong6BkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY3Hd-0000000GZut-3taI;
	Sat, 05 Jul 2025 13:50:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY3Hb-0000000GZuW-2KpT
	for ath10k@lists.infradead.org;
	Sat, 05 Jul 2025 13:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77E3443A66;
	Sat,  5 Jul 2025 13:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36600C4CEE7;
	Sat,  5 Jul 2025 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751723422;
	bh=N6/21b/LJ56j5W+2EDZp2+lVPs0r785eQOBg8YRoDw0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cQuAMhLIRHiX/6deGMqSs00tsiiCdxtZzHELylpg8/2g0IbHPjVrzIEZa2FXa0hbD
	 PS8IXY0yJNTVu9jOcJjFCpSBqkp2ZVtJa7snOayu7dbOJ3jZjR5DTtQYeQOQLAHiP2
	 m/Qu4wbIOLPB/gjSJzSRqiUwz8HJifzYNM25/Pd53w1Bx1hxk5Ka1UKtk5aBPKjh7i
	 vHXj91QNu3n/WAkLtaniwa3ss7jfIu5ZLgt6ZLmqD+dZGmhQBBu7MA4Sk09JYJCmkI
	 Mia+0ASWp3rkttjtKmLVgOBcCstYmNfI/wpMNKaJC+zsYGKDrCx9s2BrHmXSBLejp/
	 puJ7S6Glp3XvQ==
Date: Sat, 5 Jul 2025 08:50:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
Message-ID: <20250705135020.GA2006390@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B0A6D9B4-086F-4D58-8284-485B9FF4B31A@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_065023_619672_0C4E7BCE 
X-CRM114-Status: GOOD (  17.40  )
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

On Sat, Jul 05, 2025 at 01:00:23AM +0530, Bandhan Pramanik wrote:
> Hi everyone,
> 
> Here after a week. I did my research.
> 
> I talked to some folks on IRC and the glaring issue was basically this: 
> 
> > [ 1146.810055] pcieport 0000:00:1c.0: AER: Uncorrectable (Fatal) error message received from 0000:01:00.0

Where is the complete dmesg log from which this is extracted?

> This basically means that the root port (that 1c thing written with
> colons) of PCIe is the main problem here. 
> 
> One particular note: this issue can be reproduced on the models of
> this same laptop. Therefore, this happens in most if not all of the
> laptops of the same model.
> 
> For starters, the root port basically manages the communication
> between the CPU and the device. Now, this root port itself is
> reporting fatal errors.
> 
> This is not a Wi-Fi error, but something deeper. 

Devices that support AER have extra log registers to capture details
about an error.  A device that detects an error sends a PCIe Error
Message upstream to a Root Port.  The Root Port generates an
interrupt, which is handled by the aer driver.  In this case, the
01:00.0 device detected an error and sent an ERR_FATAL message
upstream, and the 00:1c.0 Root Port received it and generated an
interrupt.  The ERR_FATAL message doesn't contain any details about
the error itself, so the aer driver looks for the AER registers in the
01:00.0 device and logs those details to the dmesg log.  Normally
there would be a few lines after the one you quoted that would include
those details.

Bjorn

