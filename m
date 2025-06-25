Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E9DC7EE2A
	for <ath10k@archiver.kernel.org>; Wed, 25 Jun 2025 20:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=T4X5x2D9Swut/SyvXmwSc+Oi3r0xsSJDJJDcHwn54UY=; b=qq4O7kat7yWFHu
	cRJqd8JygmJ39sm2tGDFZE8dF6NUgLHd3+Co2b6z2DnVJDxH/LkqoIJ+vcGKHlhlWio36nA1VQTEx
	AlS2z+WuR/6qJS0O5mJMx6jbSJG6fnOwp20i/fxBlh7IfSb0ocYALqL8e42fTg4FifzqlM1LLldTz
	yoqenoYHb81Wcq0zzrNzbZ+y28s5jR+qTSmdekW48mlCDV2uV1O6JokPjBmxztPBKTeRXMozwmuJH
	e6q5ITgbXHfgt6+Mq2a1q60XUSccEGZ72XzXYrqyKMZA/37KemvNW5FpNjQ/WFoh79bGZo41yzBTR
	T3pn/nW+ew5Ba2E+zVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWrv-00000009tJY-2vbu;
	Wed, 25 Jun 2025 20:37:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWbR-00000009pMe-10QF
	for ath10k@lists.infradead.org;
	Wed, 25 Jun 2025 20:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A4FA4462E;
	Wed, 25 Jun 2025 20:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C909AC4CEEA;
	Wed, 25 Jun 2025 20:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882816;
	bh=Y5XeuJC6rpa9lv1GCVSFtD2ahPsD5739O5u959VDBjw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hAJzgcGEIqm5RXo2voZazqw/D5dbut5+GT5ItUc6w1ViuU4OhtRtBojPkTa3y5qej
	 7Bjl2uvopVhLETQbvBqwn1x+ZCyTy4kb307WCDylqAAWDcn/D7bFLqAJzmQUVS+jtk
	 IjeB2PKSglCumfF6AXnZnBJQI2t13soShhHdOCkm1vBAfBovv1+GywcwOC7soD9XMk
	 YQ53rOZAZe+SEgdHSNh3lNmwbxB0KjkxDcJQ2/TGzPvJrxlfcIH9IYnX2iqe2uwgiu
	 jRa2rvzb3I3bNrDH5/pKKt4jI1yBAzQHQ39/4TLfazXkk6pwHboqNaXUOxfOox7RKs
	 oR26qpugCqkwA==
Date: Wed, 25 Jun 2025 15:20:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
Message-ID: <20250625202014.GA1585022@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_132017_333033_BC0A049B 
X-CRM114-Status: GOOD (  25.30  )
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

[+cc Jeff, ath10k maintainer]

On Thu, Jun 26, 2025 at 12:47:49AM +0530, Bandhan Pramanik wrote:
> Hello,
> 
> The following is the original thread, where a bug was reported to the
> linux-wireless and ath10k mailing lists. The specific bug has been
> detailed clearly here.
> 
> https://lore.kernel.org/linux-wireless/690B1DB2-C9DC-4FAD-8063-4CED659B1701@gmail.com/T/#t
> 
> There is also a Bugzilla report by me, which was opened later:
> https://bugzilla.kernel.org/show_bug.cgi?id=220264
> 
> As stated, it is highly encouraged to check out all the logs,
> especially the line of IRQ #16 in /proc/interrupts.
> 
> Here is where all the logs are:
> https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180
> (these logs are taken from an Arch liveboot)
> 
> On my daily driver, I found these on my IRQ #16:
> 
>   16:     173210          0          0          0 IR-IO-APIC
> 16-fasteoi   i2c_designware.0, idma64.0, i801_smbus
> 
> The fixes stated on the Reddit post for this Wi-Fi card didn't quite
> work. (But git-cloning the firmware files did give me some more time
> to have stable internet)
> 
> This time, I had to go for the GRUB kernel parameters.
> 
> Right now, I'm using "irqpoll" to curb the errors caused.
> "intel_iommu=off" did not work, and the Wi-Fi was constantly crashing
> even then. Did not try out "pci=noaer" this time.
> 
> If it's of any concern, there is a very weird error in Chromium-based
> browsers which has only happened after I started using irqpoll. When I
> Google something, the background of the individual result boxes shows
> as pure black, while the surrounding space is the usual
> greyish-blackish, like we see in Dark Mode. Here is a picture of the
> exact thing I'm experiencing: https://files.catbox.moe/mjew6g.png
> 
> If you notice anything in my logs/bug reports, please let me know.
> (Because it seems like Wi-Fi errors are just a red herring, there are
> some ACPI or PCIe-related errors in the computers of this model - just
> a naive speculation, though.)

Your dmesg log is incomplete, and we would need to see the entire
thing.  It should start with something like this:

  Linux version 6.8.0-60-generic (buildd@lcy02-amd64-054) (x86_64-linux-gnu-gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #63-Ubuntu SMP PREEMPT_DYNAMIC Tue Apr 15 19:04:15 UTC 2025 (Ubuntu 6.8.0-60.63-generic 6.8.12)

Your lspci output doesn't include the necessary PCI details; collect
it with "sudo lspci -vv".

We should pick the most serious problem and focus on that instead of
trying to solve everything at once.

It sounds like the ath10k issue might be the biggest problem?  If
"options ath10k_core skip_otp=y" is a workaround for this problem, it
looks like some ath10k firmware thing, probably unrelated to the PCI
core.

Bjorn


