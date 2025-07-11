Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721ECC83F20
	for <ath10k@archiver.kernel.org>; Fri, 11 Jul 2025 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DUGetPw7b3cHqv2d47KtXdcIxiJdHC5O9bZO0QwTEkE=; b=DkntEl8fkObKHZ
	FfPdoQTGJ6HQk0qMNBbgfzBa0FQfboDHsfalCfhrB6wllwA9Yd66RTIcNBFifVBFdZLOtdU2hflTM
	x7BukAExBuMv/cUpbiQ+LHX+gKouNaiVcObH0vHG6sya/p8F4lRVNpy/Ly5xP0PWHvvn5GfgjUT+g
	mBt31Q3h4UtF9wA/2Iul8Y5OM1mYIQpEIMCMB5iz/jAviHkpRO4AhUpyUvFfsyCiktvBf6tlmNAqs
	nvqCyYcSMzEC+8u2UKHBXx9fkDSM2zt2xT0wPtdJV4MI0W2BqbEGZE6KyqKWIfF1Mc9hvgQC8jKjj
	+yZ3i/2sSY/kzmY/9tsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHHb-0000000FN0B-1vv9;
	Fri, 11 Jul 2025 17:11:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGjw-0000000FItu-1TQK
	for ath10k@lists.infradead.org;
	Fri, 11 Jul 2025 16:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C0565C7229;
	Fri, 11 Jul 2025 16:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A71C4CEED;
	Fri, 11 Jul 2025 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752251807;
	bh=mGZlL1iSX7Cl9+ZNHxcW3xUugqjm/r6FYg5JEGbG2FI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bOnM90aB4RTarS4ISLl4d6OVG9eJKic6Ex+P0Bgy5IkdpG4vSmsAjxYAnfJK5uKQf
	 Yc3MYK1mgubqFJNI4dRhAa9zYRBeyDZjfRaiekC/XNLc+YVRGKfuWM2vU8BJaR9K9T
	 OM8QUcOcmitGbBhwhsqyzRn2xuMfUt1vsn6qcHBkGBYim028KEcq6YmUHvOHHCrJ+c
	 XdEhRMkb+SKSD3iefcLYdtX+zxFCBiceyVGtMHrprxIYYNaCEdH+EogvnkzQvomaWZ
	 Qfw0tegKCzaRyFI705znaC8d5YzSoDAamKZRIWFfJAQgSVe+dCl91ka7LWHtQkgHZA
	 qSBe+LEZwZicQ==
Date: Fri, 11 Jul 2025 11:36:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
Message-ID: <20250711163645.GA2294895@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FB546B0D-2209-4FA0-9DC9-A75C0BC9FA4F@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_093648_427607_1AD8B8D2 
X-CRM114-Status: UNSURE (   8.21  )
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

On Fri, Jul 11, 2025 at 09:34:43PM +0530, Bandhan Pramanik wrote:
> Hello,
> 
> I really couldn't find on the internet how to compile a single file
> now that I have compiled the whole kernel.
> 
> Any ways to do that?

If you apply the patch (cd to the linux/ directory, then "patch -p1 <
email-file"), then run whatever "make" command you used before, it
should rebuild that file and relink the whole kernel.

Bjorn

