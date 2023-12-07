Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3823C4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoJpUtLAMqCICRL4p6ghXCRp3qif/jMS6+ocSROIQlY=; b=wo4Ol8qb6MGN5q4cUe4+E43klp
	IcqAp0i5+gcpKl1wg/NnHmrZq6YPNKhTg30rwf7zzFt++edc1dFiGoqN8+wwFY5g8ahufVtixbCBh
	P6MjJjtJVhj8RV63WpDEfSzffTPDAIfQx3p7Ao0yWP2CjITgjsxS8UacqYGN3eRgALmWqxSHP1iu+
	jUW6NHfogdgROImwgIP54IvVb9n0kaK6k4Ke7nGx1X1m9WFN44/SLS/wGdJ7wmTIaCXaLYlt2d0kc
	gBe/zyeKPDAItwU4AKhMR/FW+lp7yhT411mIQx0DgxEqA++hLbUpXVX3/I6b2Wa9Qp/N3pCa9Qoc4
	azc+zKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFud-00D6hf-0G;
	Thu, 07 Dec 2023 15:03:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFua-00D6gA-0J
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 15:03:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AC77DB828A2;
	Thu,  7 Dec 2023 15:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7969DC433C8;
	Thu,  7 Dec 2023 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701961414;
	bh=EzWjdW72msVuFnIkRNg9tPfCaE+NmNRQlU8lDdFn7WI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lRMJf1XRAM4tIELc09M2HAqfHAhwpNjPOAXCKrfw/AzdGETP0+ORSjaWZAk/nc5rr
	 gEz6HQfZskdSMxWCMyy2Q6WIWBhvLD3UUZrtNyP+IXS9bZqsYW9qHdFhB4foV8XAFM
	 ioCQL/4RLmiyVOYEiMS13LEKRKka4mPGHyZvDOuQN+wF+NViH0DpM2H9loMs8+5KaF
	 Hm6uArceerd3hlMB3ExJBG4NqVp3kA3pxB9hgukGITamOz2MXltzu3XURwTXnwKzGI
	 NSZ2vbKYkKo0mtz7Ocp/BhHwWdZovu3kvje+PDYDKXi84PW2jxis6O8UcfnwAc9T1E
	 IGFrOeXxLETrg==
From: Kalle Valo <kvalo@kernel.org>
To: Erkki hietaranta <erkki.hietaranta@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: Fwd: ath10k-firmware: QCA9888 hw2.0: Add BDF for ASUS MAP-AC2200
References: <CAE0cnwoua1R=8gKFDTo7LjOhdRSL=Efa0Vo=K1WJj1w7PcZf2g@mail.gmail.com>
	<CAE0cnwr6M5cpiitk=Z_h8iz8esZ=0uwtZg8sR2NR84OQiNWPsw@mail.gmail.com>
Date: Thu, 07 Dec 2023 17:03:31 +0200
In-Reply-To: <CAE0cnwr6M5cpiitk=Z_h8iz8esZ=0uwtZg8sR2NR84OQiNWPsw@mail.gmail.com>
	(Erkki hietaranta's message of "Tue, 5 Dec 2023 08:38:31 +0200")
Message-ID: <87plzim4vw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_070336_285685_56D549B4 
X-CRM114-Status: UNSURE (   8.91  )
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

Erkki hietaranta <erkki.hietaranta@gmail.com> writes:

> ASUS MAP-AC2200 is IPQ4019 based device with three radios.
> - one QCA40xx radio is used as 2.4GHz radio
> - one QCA40xx radio is used as 5GHz radio
> -- Both allready supported:
> https://www.mail-archive.com/ath10k@lists.infradead.org/msg09696.html
> - one QCA9888 radio is used as 5GHz radio
> -- BDF attached is for this radio
>
> Files are extracted from latest device firmware provided by manufacturer
>
> ids:
> QCA9888 hw2.0
> bus=pci,bmi-chip-id=0,bmi-board-id=17,variant=ASUS-MAP-AC2200
>
> Attached file:
> bus=pci,bmi-chip-id=0,bmi-board-id=17,variant=ASUS-MAP-AC2200.bin
> md5s: b29e1fbbdfdab5908151e66e10b074dd

Kiitti, added to QCA9888/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=17,variant=ASUS-MAP-AC2200

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 18 in total

https://github.com/kvalo/ath10k-firmware/commit/2b7714434fe984bc4b0a3c629277197eac724d41

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

