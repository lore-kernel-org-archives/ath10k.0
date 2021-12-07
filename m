Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B78EC433EF
	for <ath10k@archiver.kernel.org>; Tue,  7 Dec 2021 18:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8/dNYR7sU3tSkg425ELPTly93MYE+A0KSDy4KV4DyE=; b=hW5joIppxQg/3F
	cSm02OtQur53+HJuDdeT3X4HJy4i38JNrGvDuJ5WRVBr3cYFMtAYEQSugLAz2ZLJvM4NVfeF6O3cL
	8cWvpVejqKEX3QBmGSJ1PNh2xYwk60xRTMAUnkrQZShEfyR79u/l3+HmSyfH2eyF09UipwU9A7Iw2
	qh1OSAwXZi2A2p1KD6C4P70HXawLQlCA5hikDOtvI4o+NBv8p2/qPuWxgeuGfLiReLw5Jr05t6o9b
	99hDhXOO86Ckbqz9yslCmiGzJChDNuxQ2UYA7149ewSQrtv+z7YO2VeyNYFTXzWG/7GSnVyt12toj
	R6ijimGsq9YrYMAfhqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mueuQ-009fbc-Qk; Tue, 07 Dec 2021 18:09:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mueuK-009fX3-1A
 for ath10k@lists.infradead.org; Tue, 07 Dec 2021 18:09:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A863DB81DF5;
 Tue,  7 Dec 2021 18:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F4DC341C7;
 Tue,  7 Dec 2021 18:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638900577;
 bh=FvI1SkWzzRNUldZETJA2GVPaosCZVieX9Ur7HudZtH4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=qMtJMF2nB2ucgJnFXCOq6g32pHQWR3v2RIMTZg/bzFuw0FrFcArgX/c1GeGrIOmZA
 eMS/MgoYR5N7C+qAsViQRpAtu2AY9YgexyTIQBHxKJYVGCmNMTOvVDZvQGO50z3esy
 66NvCsrx3//z2U4BGGeuZvGRdfikk1AYqZN/gZGycYIgDhwxqf+Q78kYZPbsagxjzx
 gLuEfZOCKT1eRA9pDdJWu10avbjmqn47jHu1oKbkbdNGnpnm6CXh7F0R2IxpveLEW5
 Ck2RjENJRHViz+ygQNHfI6vwEgb5AI3TEFALUY+sDtZnmqILeLqqOlp52YVklRbJkX
 gh+GDZZu4P27A==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
Date: Tue, 07 Dec 2021 20:09:32 +0200
In-Reply-To: <163890036783.24891.8718291787865192280.kvalo@kernel.org> (Kalle
 Valo's message of "Tue, 7 Dec 2021 18:06:09 +0000 (UTC)")
Message-ID: <87lf0wjnhf.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_100940_252934_A8250EA8 
X-CRM114-Status: GOOD (  16.98  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Robert Marko <robimarko@gmail.com> wrote:
>
>> Some ath10k IPQ40xx devices like the MikroTik hAP ac2 and ac3 require the
>> BDF-s to be extracted from the device storage instead of shipping packaged
>> API 2 BDF-s.
>> 
>> This is required as MikroTik has started shipping boards that require BDF-s
>> to be updated, as otherwise their WLAN performance really suffers.
>> This is however impossible as the devices that require this are release
>> under the same revision and its not possible to differentiate them from
>> devices using the older BDF-s.
>> 
>> In OpenWrt we are extracting the calibration data during runtime and we are
>> able to extract the BDF-s in the same manner, however we cannot package the
>> BDF-s to API 2 format on the fly and can only use API 1 to provide BDF-s on
>> the fly.
>> This is an issue as the ath10k driver explicitly looks only for the
>> board.bin file and not for something like board-bus-device.bin like it does
>> for pre-cal data.
>> Due to this we have no way of providing correct BDF-s on the fly, so lets
>> extend the ath10k driver to first look for BDF-s in the
>> board-bus-device.bin format, for example: board-ahb-a800000.wifi.bin
>> If that fails, look for the default board file name as defined previously.
>> 
>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>
> Can someone review this, please? I understand the need for this, but the board
> handling is getting quite complex in ath10k so I'm hesitant.
>
> What about QCA6390 and other devices. Will they still work?

I meant QCA6174, of course. I have been working too much on ath11k.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
