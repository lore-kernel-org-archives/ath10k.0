Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECF6C25B08
	for <ath10k@archiver.kernel.org>; Wed, 17 Aug 2022 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ruGxq/uw3iol/2vHA9vASzQ+iGFHHDp+Vjp3SAvicgE=; b=ARTxdLHHVZQ8ToScu3PGUb8JsL
	30XkAXrNSjVIDKkDM2oNs9eZbJsKJq6Fd+jLtKuZQPzyOlvvZTZDPsiOxr1e7Vgga2NYc9+tpVWC1
	KMOJ8DFidWHA0FzzIrnjHZRoz/lsOfMVWplXgNCOvuAXbLrTUdA3rHa9iqPkUorNbs2pSPNrEjiiD
	WHA9A3q2i/QkBLr/9+ndZ17qPqbR8rMLHcT6qftBFT4WYH/bn0x+NNLV/GwsFfBw7JeijgxHdc2TK
	gmU5WtsuJ1C37SKjiiAUDi4Y7k7foiVq59Sz50L0B4I6sEztHbR9jsbLLIWNRlkAhmvG3V8R2ffV5
	vSUhgsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOFQd-00HREp-Md; Wed, 17 Aug 2022 09:33:35 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOFQb-00HQmu-Cu
	for ath10k@lists.infradead.org; Wed, 17 Aug 2022 09:33:34 +0000
Received: by mail-ed1-x52d.google.com with SMTP id z2so16764883edc.1
        for <ath10k@lists.infradead.org>; Wed, 17 Aug 2022 02:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=XeeQBAM9F1912wLl7pb6gydGuLgpyldc4xHbnWi/qsw=;
        b=LHMSZ20yYv4ViS159MKGjQTsdmbkxhKpQc4e0HdfuS8A46w2OpagtIbYEEMXufPjs/
         QIsXzWbhFbt4k8GkcI4QoIjOLNue0gPvygPlUpqttFynK9ix6u+qwpLw7UAoS5m5O2ng
         UZPw6758Q4u31PqCpiz3dm51Qq7pnoIPnNpw6CBtPoNw12d2hdn/bLAiIQcdOgaCqx+T
         Wr+30w2fbVdIsvvKqMeUV1Qe9nTXL51qPA2eyhv5xqLk5A6G+xlN9pxAGaOk87tiDW5t
         HgIDDD18Ych0W9nq7cT02oJU4UZHU/DMn64XDB1H/NM8aozOyB1AFK2aQJbqoEBDchOH
         27sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=XeeQBAM9F1912wLl7pb6gydGuLgpyldc4xHbnWi/qsw=;
        b=KbFc85LmG6w3eqz0V+JqTeHT/1NobdIepnCkunI7Ogkme1CKPGP8L+Yr9yt3e4uZO4
         HgQwYsOdHlCHc9p0YaShxg6NGszNVGo6OISqM9XmRMw//n1hARdZBXCLx7OlVj2pmzj3
         2kuxuahJTBeB8FEtxMaHDLvx7BinVT71wQgTlRRJp7+N13nKOWqgZ/HH6wJKoaVl86/Z
         KitCNKNL2CrDl0mcj0YEX6X42euiVsVwL7MJzJLYeemCBzOujjvB0uDQh/u+3lKkQSAM
         uHzOOulesdmOFz/HxETrcsd1PO28J9wjM3k/8sRKzdn7rVMtqeisksCGS5Th5lDZ0jOg
         85Sw==
X-Gm-Message-State: ACgBeo3IJUSL/Zh62FYzwFQFEZ0XPppv2CziY79jDrnrkuIP2M+k1nqM
	fsvsSfY+By+kZDtJsdR10pBa+6z8GyKTs+NDcr7TIN5f
X-Google-Smtp-Source: AA6agR6NiAl2azpuw4Qhj7rUvQznwLLP6yR5pZxEp2JQl+tpvH4Z0KYGp1UYo6lAoYbjvZd8T7AtefiMlNG8z32Gn7s=
X-Received: by 2002:a05:6402:3323:b0:43d:65fc:8d29 with SMTP id
 e35-20020a056402332300b0043d65fc8d29mr23366083eda.251.1660728808447; Wed, 17
 Aug 2022 02:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAJE2SDfSzqBix-qUHquN8=H4wAAyEH7spe6xvQfpuDdbqNYhhg@mail.gmail.com>
In-Reply-To: <CAJE2SDfSzqBix-qUHquN8=H4wAAyEH7spe6xvQfpuDdbqNYhhg@mail.gmail.com>
From: Giammarco Marzano <giammarco.marzano@gmail.com>
Date: Wed, 17 Aug 2022 11:33:17 +0200
Message-ID: <CAJE2SDcZe-s7tBOt-kQhaEawggzv91V049marhvOxtLiPzv11g@mail.gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ZTE MF289F (2.4G) specific BDF
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_023333_488680_092274FA 
X-CRM114-Status: GOOD (  13.04  )
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

Please ignore this mail, i've sent new one with corrected board
definition and adding also supporto fo 5.8Ghz on AT2 revision

Thanks!

Il giorno mer 3 ago 2022 alle ore 15:58 Giammarco Marzano
<giammarco.marzano@gmail.com> ha scritto:
>
> Hi,
>
> this file is for add definition for ZTE MF289F
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - one QCA4019 radio is used as 2.4GHz radio
>   - one QCA9984 radio is used as 5GHz radio
>
> * origin of the board file: taken from stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=zte,mf289f
>       md5sum: f0243c9d7b45bb0ffe3e58c27e71fe80
>
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")
>
> Kind regards,
> Giammarco

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
