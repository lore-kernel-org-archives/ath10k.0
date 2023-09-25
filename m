Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2C9CE7A94
	for <ath10k@archiver.kernel.org>; Mon, 25 Sep 2023 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Fyn/ppHdZJ1iFMh6SiqlP0sQuTAAiTuMu5EzJoQrYY=; b=jYd8IJiwJbraXm
	E1grT6Jxn/bJ6iAuG4oiAeVSPUfHJ6Fdsy45JbhLpB4eCScifbyOIPgpnRUVfKKihdzB+I89rqTO1
	oe8Mfe1SklMYAFbRBAyJKvniyo1+YqVjfdBvVoRhkGnYe0CVKBZSUQa5zmnLytg0Z1XbKGyQ3A+ro
	XFPbhnDCm59LRCArE8LYy8IzDxcqAo6L7gocEC8h8PuMPFiSwjCaKh+kyTcVtyYcAbbbuDvad1SSR
	Pct+4jLfTOPezQKr2jZOfIF3QtJLcsA4befyq/p4HJGIPZCf/h78NEOsFJlrBJWZIE5+byDWjiUyj
	DfpqdSAlQ8KuQdsnmKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiVg-00DwGb-1v;
	Mon, 25 Sep 2023 10:08:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiVd-00DwFy-1F
	for ath10k@lists.infradead.org;
	Mon, 25 Sep 2023 10:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C577DCE0F42;
	Mon, 25 Sep 2023 10:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2577EC433C8;
	Mon, 25 Sep 2023 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695636486;
	bh=pCY/OCplb7olbDLcwJ1TuHlIxZFPuxVxQvXxKvavUFA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=eOlm4WHsIYVoto6Q3sS56HLjawzgpN9Nr+y6IMg+/i17vRqS7dPVKPiYfQzBdFMEO
	 GqPU8LqLBSURRHFUxhNXlPNwdZnII++FbW0Ik3iZCzKcC/2p5B5QldYmzmxW97nDnc
	 QM2L8Grds6ajA3rGJEMKkvdpKYudM0ppQK4I4dRFKR44gB4I78lo55qCOYPgaF88Gr
	 V/ZO2susbO94LUAvj2S83iREK13Jela/T6eLX0LI5vTU2fui+NYSo0d03YmM33q/IH
	 /bQRruc7c0ELlhanz2gbX6NNu4SaVU43xjluoUqEaYxTcmMP/+sFwvmqi6Km6IUCf2
	 Bv2lcf1oBR5TQ==
From: Kalle Valo <kvalo@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Cool Goose <coolgoose54@yahoo.in>,  Linux ath10k
 <ath10k@lists.infradead.org>,  Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: Atheros QCA6174 ath10k_pci fimware crashing
References: <1209906123.2716993.1695416371605.ref@mail.yahoo.com>
	<1209906123.2716993.1695416371605@mail.yahoo.com>
	<ZQ4vQNe3XsArwWQT@debian.me>
Date: Mon, 25 Sep 2023 13:08:02 +0300
In-Reply-To: <ZQ4vQNe3XsArwWQT@debian.me> (Bagas Sanjaya's message of "Sat, 23
	Sep 2023 07:20:16 +0700")
Message-ID: <87a5taa7lp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_030809_672199_54E4FEC2 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

>> Sep 19 09:01:11 hostname kernel: ath10k_warn: 149 callbacks suppressed
>> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake target for read32 at 0x00036044: -110
>> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake target for read32 at 0x00036044: -110
>> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake target for read32 at 0x00036044: -110
>> 
>
> Looks like hardware issue, right?

It could be a hardware issue (for example a problem with the PCI bus
communication) but also simply a firmware crash. These kind of reports
come time to time but root cause is unknown.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
