Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7B4C4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTtlsCFWDKnwMZqpHuScxag2sRjsNC4CcU7JsWRzNu8=; b=HouRirLm+tMU95sJpSu9mMCbLi
	iBrouEa2yTog1EhbFXP45ccen1trgYqRtusZRBkN/nze6+xPz7B3P6n5i8vit/y2k4MuF5/GmwmjW
	w7CclAv33jm3Dhi5TcZLmg3zitNarCG7fozdSuNm1xsffa0Pcw+mghd3SgS7OG6AEgQ8sWXGV6TAj
	h2XhN2A7jLHRW44t/grO99AXqHfHRI22YaegjR9k7Jx2ONdPCsj6sUb6jyaPAhX+c6YA+EXYeZ/+p
	+WDVI5S7cwnhERy4QigXZkj4qBKvLDPEsDaHXU1aFOmAoqpQQpberAG4SYbLRtoGFEWcLBXOQNt8y
	nGfVbATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFoW-00D5h2-05;
	Thu, 07 Dec 2023 14:57:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFoS-00D5fl-29
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 14:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0FCF62162;
	Thu,  7 Dec 2023 14:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BC2C433C8;
	Thu,  7 Dec 2023 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701961035;
	bh=rTtlsCFWDKnwMZqpHuScxag2sRjsNC4CcU7JsWRzNu8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oOFdanfmCzaeLly9lYQnKgl7XbmVJgHTKA39+tTEAFzBoFJ81xOdLYBV3uqtSPJVE
	 Dl0GHeEuvhADJmnCHwz0cdMjdfjPcXFtEFOZPSb1XcRwqxFV1GjSlyynYMJtB5bQzm
	 4QZ4+67A75BaLfU1dqIrXTzKz4CHf9ZjSCmtup3XwjXYClFFYtEELJuVG2Q6J8fVLX
	 IVw9u5kR83ODJeVSelyytqyVlfJqrFnYYO8xSRw2ygfmaXKfXY4irFELAkKtWyB0sO
	 ifm0v6XG3IFgR0yZVueqLXf861kLj8OSgiJsx+90zzQHiVdPBxrPiukTofaccRSqnK
	 JYlxFvYL5qSlA==
From: Kalle Valo <kvalo@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Cc: ath10k@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  ~postmarketos/upstreaming@lists.sr.ht,  phone-devel@vger.kernel.org
Subject: Re: ath10k-firmware: WCN3990: Add board file for Xiaomi POCOPHONE F1
References: <b4989ba4-5d14-0683-d3a9-cf0e983fa921@dylanvanassche.be>
Date: Thu, 07 Dec 2023 16:57:12 +0200
In-Reply-To: <b4989ba4-5d14-0683-d3a9-cf0e983fa921@dylanvanassche.be> (Dylan
	Van Assche's message of "Fri, 25 Aug 2023 17:16:17 +0200")
Message-ID: <877clqnjqv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_065716_747444_AFAE131B 
X-CRM114-Status: GOOD (  17.56  )
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

> I would like to include the board file for the Xiaomi POCOPHONE F1
> smartphone.
> This smartphone is manufactured by Xiaomi and uses the Snapdragon
> SDM845 SoC.
> At postmarketOS, we run the mainline kernel on this phone so shipping
> this board file
> from upstream would be a great addition. A variant property was needed
> to avoid colliding
> with other SDM8845-based smartphones since they all share the same
> qmi-board-id and qmi-chip-id values.
>
> Below, the questions from the wiki:
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
> =C2=A0 + bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Dxiaom=
i_beryllium
> =C2=A0=C2=A0=C2=A0 sha256sum:
> 470a670fa15fd1f5625246556c83cb3aa811b0e954813da518e241e3a48bf4a2
> =C2=A0=C2=A0=C2=A0 md5sum: 0655a0b7865c13172c43422c035d02a2
>
> * attach the actual board file (board.bin)
>
> The name of the files are equal to the id string in the board-2.bin
> (minus the ".bin")

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Dxiaomi_beryllium

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 26 in total

https://github.com/kvalo/ath10k-firmware/commit/a041131869db6eadcf0d4533e5b=
340a81d055a3b

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

