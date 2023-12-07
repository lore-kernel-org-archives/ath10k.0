Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5CFC10F05
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uhqwn4e8NYkWS0QZNCGhJ/sVj57HJ9Z86Fu38hB/5RM=; b=0QWmbAIywY58uJ9GAJOgjlpfCz
	yeCpKkhbmHvmPf6CqC++ilw6gBnh4zFFZ4NHwisTAyqAzz9xW13X5KGshVcJOs9sQYl9XdZfmGAYg
	YiWRB0HZ0MD6zyWI5gsHodaGC29DBP92iJqLYaGplDtEaFtvRHwzDpPQmZcNUJsi3sYUKonsf4BUb
	4IPqxFzaPRdm+BnxAiL0YiW98BW74StA2ZGIOgv4fKRSDNw4QF7huhjV6FuakEIjudTG1Dz63xBmp
	ohGZf2QWRvGkm3w06eM9ZNzaq846+QjEqRLp1drqq35FBfShHdaXz/P+m9NNLv10sxt0F4fsJDuib
	HBS/sjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFml-00D5Eq-0T;
	Thu, 07 Dec 2023 14:55:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFmi-00D5DK-0o
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 14:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 18628CE21C9;
	Thu,  7 Dec 2023 14:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362E2C433C8;
	Thu,  7 Dec 2023 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960923;
	bh=Uhqwn4e8NYkWS0QZNCGhJ/sVj57HJ9Z86Fu38hB/5RM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TUmhWBrHpl4gV1UNoTpIh1wlYwXheV8g8XsWmzWdgZ+x5/2uIMzA0vtLkw5w2m0kd
	 y9C+SkdlgYy+Gewa4i0kAwCuQPMV/4dZImgV9rWnm+lgg3SY7PCCIyQ1qbeOm9RJ6M
	 kLr98MabDMhrlaZ5rT18K+20uDGx4YeDykTLGPAebhaSfi+v62dHl/Y0axU2uhD7Bs
	 +dLsc5RiOcIF2rdcdAXZVmMrwXML4VcA8tkyZ7bKFhkvlYTYX7zm55oAbXceR6tiR0
	 88LzhWUInMjv5KCgDZCQrC4soOdmmFKb0zqzrSS997hya41VvgW9OBW1PkNIHDHS2E
	 mL/Xx3kHfC30A==
From: Kalle Valo <kvalo@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Cc: ath10k@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  ~postmarketos/upstreaming@lists.sr.ht,  phone-devel@vger.kernel.org
Subject: Re: ath10k-firmware: WCN3990: Add board file for Oneplus 6/6T
References: <b71aa947-4644-e1a3-40e1-99d11d0ab8d7@dylanvanassche.be>
Date: Thu, 07 Dec 2023 16:55:20 +0200
In-Reply-To: <b71aa947-4644-e1a3-40e1-99d11d0ab8d7@dylanvanassche.be> (Dylan
	Van Assche's message of "Fri, 25 Aug 2023 17:16:10 +0200")
Message-ID: <87fs0enjtz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_065528_524447_1ABBAAE5 
X-CRM114-Status: GOOD (  16.53  )
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

Dylan Van Assche <me@dylanvanassche.be> writes:

> I would like to include the board file for the Oneplus 6/6T smartphone.
> This smartphone is manufactured by Oneplus and uses the Snapdragon
> SDM845 SoC.
> At postmarketOS, we run the mainline kernel on this phone so shipping
> this board file
> from upstream would be a great addition. Below, the questions from the wi=
ki:
>
> * description for what hardware this is:
>
> Smartphone with a SDM845 chip and a WCN3990 Bluetooth/WiFi chip.
> The WCN3990 chip is connected to 2 QM488xx radios, one is used
> for 2.4Ghz and the other one for 5Ghz radio.
>
> * origin of the board file (did you create it yourself or where you
> =C2=A0 downloaded)
>
> Extracted from the stock firmware.
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
> - WCN3990 hw1.0
> =C2=A0 + bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Donepl=
us_sdm845
> =C2=A0=C2=A0=C2=A0 sha256sum:
> a46790bc201026e8f38a19f3acd749640b54b73d14e09287659a647b9cc3ee8e
> =C2=A0=C2=A0=C2=A0 md5sum: f744a3402e260d7fd330cbc964972a5c
>
> * attach the actual board file (board.bin)
>
> The name of the files are equal to the id string in the board-2.bin
> (minus the ".bin")

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Doneplus_sdm845

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 24 in total

https://github.com/kvalo/ath10k-firmware/commit/328aea229a35920e3f54fc7b7ff=
0070a95ef421f

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

