Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFA5C83F07
	for <ath10k@archiver.kernel.org>; Mon,  7 Jul 2025 06:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGHU5SLcU1sPCKNHY3FzrH8Bnk+IjHiw8W+NG3UkZSk=; b=SSmqmDQRKgbqD5WMAaCXb/K/mA
	tHNHzmEW1f9b9eEIb61uqDKpX/4/zQYjjvOGzU/i3uiqYEKuff3tD9z7DW+3LiS5A/QABLm0HKEGa
	ETc6IgYQLMpuuck4KkDw0MJqSF713e+/6nybg6xL3TkczYS+Q218wV1txyLJTHIiDJDYxXeHqNTXB
	ifVNEUy+N9GY6JLbtDAjwq94jTR0jB/YlkPbdZHe5aCgU2Ie0n3EYVNpkVrbNJprc3i/7y4LdU5uJ
	K1fntzhBTitw41Vj5tJG2Zd0btV2vJrJ7LvPZP92Tc4j9kzLjPRIweAOLUwG68c8pk37njBBseXxd
	z8uStd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfFh-00000001XbY-0JMg;
	Mon, 07 Jul 2025 06:22:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYf51-00000001W3q-480r
	for ath10k@lists.infradead.org;
	Mon, 07 Jul 2025 06:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E62F745EE6;
	Mon,  7 Jul 2025 06:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC473C4CEE3;
	Mon,  7 Jul 2025 06:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751868714;
	bh=BhHwMHN6QVeyMz3R8ZAul9zte/ZMRxjS3q21gK4VnJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSiBxsiM2ebzmUyewq+3lPh5VFnFOFFxsVHZESehxMH/eqaaxlZzw3CmZmLZ5N1pF
	 wOB0znsBtopLgPzxavkiiOkzJbu6ZYorvKUwXAJtGujwSmdMGxSE9i7P3+l3C/reWt
	 dBBmgj1tyYmC9ZbUOxpaPfbx2Jk3UzYRp+tNGzNP3TohytnCoBACpXY6KXL1NJH4NK
	 KMh3Tqj9vJAdCpHjDNp3Z8oEFFYJChJL5ev5zkeGr0HjQFZu2+Ziw7OEg5cjrdRZ9s
	 1u9uSn8QiXTttri6ec3MPiEzgG1jaEpZs6ejl/AJbCfTJXUvfAEl4WOqqi8FVE877g
	 cBeYWWzBKzvKg==
Date: Mon, 7 Jul 2025 11:41:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
Message-ID: <2cq6jeywii5fscozazz2epugh6zflcpfbo4ffhjt2lyk76cq4m@vg2jcsmlhtho>
References: <20250705195846.GA2011829@bhelgaas>
 <9D9D9375-1BD0-46EA-9E85-47A2D8325F98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9D9D9375-1BD0-46EA-9E85-47A2D8325F98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_231156_038773_326ABFED 
X-CRM114-Status: UNSURE (   9.08  )
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

On Mon, Jul 07, 2025 at 04:31:22AM GMT, Bandhan Pramanik wrote:
> Hi Bjorn,
> 
> I have downloaded 6.16-rc4, and I have a bootable pendrive having the arch iso, but I really don't know how to rebuild the kernel on a bootable drive.
> 

You don't need to reinstall Arch for installing a custom kernel. Refer the Arch
linux wiki on how to install a custom kernel from source:

https://wiki.archlinux.org/title/Kernel/Arch_build_system
https://wiki.archlinux.org/title/Kernel/Traditional_compilation

- Mani

-- 
மணிவண்ணன் சதாசிவம்

