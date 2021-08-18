Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FCEC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 17:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E0C6102A
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 17:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56E0C6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/TSARxU+wjS/+28f9jct41iosQpZNoLnUrzskwiWy8=; b=c8grVSTySAAsLY
	ARji9Q24bqtE9PB0Hs7JKs3xHbMuyWRfyEoCuRYzni2ttbahn9Lb1u5gSeqVekcMhcLrv7IByFIZe
	u4Ah/636suRe9r4YC5bpqw1Vjm+8SfQxMMLNqV/zVmbIrPz35TgUQHO/r0grt3MF2MaeUKZpB9AlS
	4AFDk74VN2TxpKEv1olFAVnzsmGVpyTJbeDpEUQ8pc9kMiegxXjbhV82KACg+PP93J+cX8KdtPdop
	lhOKbTtvgsK8GXOuDZRZIYMdb2IupcsNOcWIClOOxhwVnD/TcEBqKYCOh+NGIpX98xOsiY57BOAOu
	thWlrQuopVqal/zUfVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGOxY-006FZ8-6x; Wed, 18 Aug 2021 17:02:36 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGOxT-006FXx-4w
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 17:02:35 +0000
Received: by mail-lf1-x12e.google.com with SMTP id w20so6039870lfu.7
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2vHOG5+qPJN8jmWLiJvDNQKkDjgqpU1H4dy3yeyIjso=;
 b=Au8n84a7JWvuJ14AHkyWo/qNfD59revNzR2qD63XW35WEP23EtB498lh6OxNd16Z9b
 eOOOnNkZJxrwS+fEe9rkwSt23kqnEQiD6xQkPNbbMQACK/9OXDyuJvj7HfdgtxExn/D0
 ZITZmkSJru5ziMeIFuPVBcBt3pomvA4KfGuuTE3UbGOsbekOq1magbc3mgtUhUJSlyQJ
 pltChhGjfm8sgG404j8K4MI2ivd/JD9MgujF5CfifN4wmLw3c86Y+W7BiM1GU2JD+hbu
 EOjt6tEIAZ4M6cNLDk6LZ/oP/Gb79KZOwlt/bmXPivgHrP49JxyifWXizQpnVc/BAMui
 /E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2vHOG5+qPJN8jmWLiJvDNQKkDjgqpU1H4dy3yeyIjso=;
 b=rUAZ0+b9LcbE7y63QPcmrlnPOD1LXNMhQnj5C5pN1NnGegb6k6yDsfha9XUhLnTVGN
 p6z1ykE1kuwTwJGOISO092ZB95JCnC6l7Ps1Ua+ipcl8t9E68FloS/k/2age+gGrBNcN
 ++lvu3bRMjHWKw94QQLj1eqJe6b14MSk1er08B9/6Ek8u57ymJNWqJeoW6wAA/qQA9S5
 WxE02Is+wMz9nmShto0K0Oz0Ur1+SUvwXSZ0nyI5I/7Jzi06oMZbQpjrQdFWviXe+vwx
 cF9oueLXCacrQvjTWjpJmSOJSin+iL6H9fDiuStKEWu5vTw4+N+Bqc5rKHWFcrJ1QYDf
 R1vA==
X-Gm-Message-State: AOAM5327ThB8wo/HgyqlUjT+Hby+4wFtGrhOT4Jx+CebSwNjIPUrO0Ej
 87nE4oa7XarfmZSp4KmOLVijJBb0QLlEQW9a9pw=
X-Google-Smtp-Source: ABdhPJwMMcgiCQIM7qBkrZFh0rLz5MlcL1MzYBiSx/0c6BTFu8uu916TrnDAm+3gTNz24ay/ysQ1Kw4UNFbTkbUt69w=
X-Received: by 2002:a19:701a:: with SMTP id h26mr6917592lfc.443.1629306149104; 
 Wed, 18 Aug 2021 10:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
In-Reply-To: <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 14:02:17 -0300
Message-ID: <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
Subject: Re: NOHZ tick-stop error with ath10k SDIO
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Vasut <marex@denx.de>, qais.yousef@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_100231_257643_AD1C361F 
X-CRM114-Status: GOOD (  13.06  )
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

Hi Paul,

On Wed, Aug 18, 2021 at 1:29 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Paul,
>
> On Wed, Aug 18, 2021 at 12:43 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> > I believe that you need this commit (and possibly some prerequsites):
> >
> > 47c218dcae65 ("tick/sched: Prevent false positive softirq pending warnings on RT")
> >
> > Adding Qais on CC for his thoughts.
>
> Thanks for the suggestion, but I am running 5.13.11, which already
> contains this commit.
>
> Any extra logs I should capture to help us understand the problem?

In case it helps, I followed your suggestion from:
https://lkml.org/lkml/2020/12/10/676

With the debug patch and suggested command line, I get the following log:
https://pastebin.com/raw/X96zKw7i

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
