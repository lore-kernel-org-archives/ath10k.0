Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36A5C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOotVH9yP5+snds47RgwWLb99os9quCNv6tXBxkUo+s=; b=U7fIM2YFE1shwE
	UAoLEP5ulUXG8qkRYNGJbuZZzFYXv7ocF4kXseV7ps41yfRYzXNupyef8QtJkxdKDmC60AW2xg8D5
	KjgcuDCo9aLT8FIRrv3cxz88qjFw+nyCIxA+t7GFxJ2VsSEroVqlTKqEYm71G2Le3xrHemwUeUAlV
	NwQvXOFa5zUGgKkk/gxCsvHUXztdQJAoo21XOb7+Cv/mQz/x0sJ4qpNakxGT+MNurQZxsSjM/Zifo
	gMtL2zS61yrn+pKlZoi2bhaVHykc2DkIwvWyqN7kbCTz7sUVouOjs8HbXbPfZ6SaJAMcKV34T2BxJ
	+40vgVGx/eweD0+hDJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAu6C-00FCc5-Rj; Fri, 21 Jan 2022 13:37:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAu6A-00FCbg-LK
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:37:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE38BB81FAC;
 Fri, 21 Jan 2022 13:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C94C340E1;
 Fri, 21 Jan 2022 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642772219;
 bh=0g2ONHgm3ZFH44fZTICLC+CzzX45xF4OozEDiymIiTk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=lMDuEAZf06fzR9rZ5zQ15vaQfnrdYPQBtY719vVlE33b1OAns4JS2ISwstrJffMsj
 bVUxsbLrXu4PD3YyUMVdeYEqLX5kZdrS1BDJ932xSsuuYcPehxzkk47IpqBx/p3pXV
 o5XMDR0mJ0riWLOkFUMc+tPVgAh9ZqeBHxb+mdKn/uzza9STo3U059mBmJPM0Xln9M
 89kD/uCgMW2IyYnd96uBXhNTBjwNgVs2omtR4TLHmPKYR9riaHgDbkdCpXurwa/FRu
 dt/sM5wc2kamg0owMVJk1JY5KJBI4Apvc56sb/VrKE555PLJTWtGq4Nt2t526rGXjl
 iRZLufBIr/9jw==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update AVM FritzBox 4040 specific
 BDFs
References: <3073513.glJVTdoqm3@debian64>
Date: Fri, 21 Jan 2022 15:36:56 +0200
In-Reply-To: <3073513.glJVTdoqm3@debian64> (Christian Lamparter's message of
 "Fri, 10 Apr 2020 14:47:51 +0200")
Message-ID: <871r11dxc7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_053702_856146_109DF457 
X-CRM114-Status: GOOD (  13.88  )
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

Christian Lamparter <chunkeey@gmail.com> writes:

> AVM has updated the boardfiles for the FritzBox 4040 to "Increased stability" [0].
>
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>
>    - it is a IPQ4018 based board
>    - one QCA40xx radio is used as 2.4GHz radio
>    - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>    downloaded)
>
>    - All files were extracted from latest official vendor firmware
>      FRITZ.Box_4040-07.14.image [2]
>      (Path /lib/firmware/IPQ4019/hw.1/)
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>    - QCA4019 hw1.0
>      + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=AVM-FRITZBox-4040
>      + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=AVM-FRITZBox-4040
>
> * md5sum of each new board file to update
>
> 382a7e9977aae2760fe1faac5735d10a bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=AVM-FRITZBox-4040.bin
> 8212551ef77695270eef08c1feb61c6a bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=AVM-FRITZBox-4040.bin

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=AVM-FRITZBox-4040
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=AVM-FRITZBox-4040

Deleted:

0 board image(s) added, 2 changed, 0 deleted, 74 in total

https://github.com/kvalo/ath10k-firmware/commit/9f771d2e1ba3a53e178f0caa6e293d6d9db42154

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
