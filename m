Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB41DC83F1A
	for <ath10k@archiver.kernel.org>; Fri, 11 Jul 2025 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eWwUzpVYQUI62mb+6hVlZCrd2jqUZ65TL/WySYS0eLg=; b=J1xfSNQ8T92u7E4FLdAeUnXu9s
	3tCMIpJdKAjgm0zvFAAV5sZCYnpzsl0urdN6y0OvDjTuhZzG8E+6hcDOBcxVI4x83nUjVgP3kAA9Y
	y8DP6AkuGzutGgjYTHJ7JFnZnZ/0GkeWY0e3aD+QF5VvdllRDAkRSYCVeevT8xTVvnH6G76FtG/2C
	11ZzC8Trcd0gW9SFNWXjpnMqdqqJfzb6LTcHZpoNECLc1Ma/rEOc2Kv7f7Ww3zNC4wZwZ7I2RAMCX
	83+YfCZIx36w6Zj9Ci3sJM+nP4W2PdKlejbgiyB+KzhJT1FVvSGgN7ul/VPFCUYeXbrBmARovnmig
	3RDbGShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCh7-0000000Einv-2Cc0;
	Fri, 11 Jul 2025 12:17:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCfD-0000000EiWH-3Kjq
	for ath10k@lists.infradead.org;
	Fri, 11 Jul 2025 12:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D80E96115D;
	Fri, 11 Jul 2025 12:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC62C4CEED;
	Fri, 11 Jul 2025 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752236138;
	bh=n82RM4cgT4El7yNKeOkJ1+B9gFq+IBgDJwiJGDyoQKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ilwu63lFCyYgGCXpzoljE+Ssp/LjbyGVktjqkhe+S5vf8WIYt7R/1iHH6nC9IYpeA
	 EdfwpsLFcWOrzMG5Juf5bLwjvC/feIl6gtjDVaA2TLTFL+wtS7riYM33x722uYj6Vx
	 F9yOIimLMfCqg27rzoHqdggfrY/JFn3HUFWQCcN4GUIYYkfeQUqosBqEyMRVpKEBAi
	 smbmkHQXo+rpfwcXwSUHjQ9ZCODE7C2pE0XJdB3EYNh0II9jPPSxwguXeUgDHSnBVP
	 dlBsXWSjJg11MpoMcum2NRMu9SWjdJqHk/8htJFweRk0lp3dYqXTNIyaokJyzPjeCb
	 kj5Gb/1ABU+xw==
Date: Fri, 11 Jul 2025 07:15:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
Message-ID: <20250711121537.GA2289649@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEmM+Qj=TA=WtQAXQZx6wCUpdsOQ4j66Kpyze3KNZHC79KfyRA@mail.gmail.com>
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

On Fri, Jul 11, 2025 at 12:36:12AM +0530, Bandhan Pramanik wrote:
> Ok, we did it. Could reproduce the errors properly.
> 
> Here are the journalctl logs:
> 
> Kernel level: https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180/raw/a9e93c4ba41fb0b3d7602e6bfddce9aa5f3a19b2/KERNEL%2520journalctl%2520v6.16-rc4
> User level: https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180/raw/a9e93c4ba41fb0b3d7602e6bfddce9aa5f3a19b2/NON-KERNEL%2520journalctl%2520v6.16-rc4

Thanks.  These logs look like the kernel doesn't include the patch I
sent at https://lore.kernel.org/r/20250705195846.GA2011829@bhelgaas

Can you please try with that patch?

> Just so you know, I have used v6.16-rc4.
> 
> Bandhan.
> 
> On Wed, Jul 9, 2025 at 11:00 PM Bandhan Pramanik
> <bandhanpramanik06.foss@gmail.com> wrote:
> >
> > Hello,
> >
> > I was actually a bit distracted by the things caused by the Automatic Partitioning of Fedora. I'll inform that in Fedora Bugzilla... anyway.
> >
> > I realised that making the modules will take 8-9 hours, I didn't even have much of a success (because all the modules didn't properly load, particularly the firmware-N.bin files couldn't be found).
> >
> > But I'll try to recompile the kernel, I'll just have to give it overnight time.
> >
> > Bandhan

