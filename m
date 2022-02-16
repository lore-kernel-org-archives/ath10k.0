Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ABAC433F5
	for <ath10k@archiver.kernel.org>; Wed, 16 Feb 2022 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjFKytqWM9b6cmELyMQfH1NSaXc4y1835Agyqx2Fa1I=; b=ezr7aXcQd4Iu7I
	TTkwIJqnF3YsgbQ1nPWzli+funGmcn7JJVY7R+KHZOUtKzm0AxoJ5ODbCcpHkeCOeC9jmrCan3ThC
	EXIGDj2z5qCt9YcD1YtLGnl1w/TsrsX/mLu1yz/L65fjoNXMYrNJLxhac9wZ69Lvx7Ke6xI2SU1Q7
	eapcF3l9pBc4OEr1AyGzSUEVB18xLo8YN3AuLaTydGS38mq11iQuAu8TXpF6BV29MMP2dMrROnPxm
	+1FMR/F54BZkSKs7DQ8Cq97ZzF187QZPAPA7CJ/al2Wnu/GKRyOD14h2GddrVCHZGQY6eRfTeMjPI
	cTC7LEcwE4sDHJeuHp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIiG-006mS2-S9; Wed, 16 Feb 2022 11:43:12 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKIiE-006mQZ-FU
 for ath10k@lists.infradead.org; Wed, 16 Feb 2022 11:43:11 +0000
Received: by mail-qt1-x82c.google.com with SMTP id b5so1740998qtq.11
 for <ath10k@lists.infradead.org>; Wed, 16 Feb 2022 03:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lgVw/BZZKZ6iKTM0kGdWG1JvqmeOkZaoZVaCvFSRNRM=;
 b=UrKodOocd9niJKqLM+b94FlT/Z0PQ5qZOBaOEFhlphIn/ivHkr94i/ukLrWr7vnEZp
 AX1KAX/ohn1oNTJ1qDoCxvjkgV9bJ2ckb1vVuFH8BRCGjo1KsTFPytSo51nGtIHXu2o2
 oR/efyENJmRMhxRjVjefqKEXmeGbBfmmL0ya91H0PeIApjaWFUdD71QpROTYGxoLyqWV
 8T8QSxZpYF5l6yldU6nsi5FYibU5hu2z0Sfn3HQetFCWp4KiguYoZzI2z1nb9M9E097n
 v5BKa4diHrzPGyGp0843sxjQpMApUeTRknLwYZs7hXVG+P43Tm0032gnruUqCmSBB/bA
 6CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgVw/BZZKZ6iKTM0kGdWG1JvqmeOkZaoZVaCvFSRNRM=;
 b=vTYpPwBLkR8gLahheMRZR1dEmWqe7ksoMp9ljZ230Qy9/rjTcuftZ9ORldoY0EEA+i
 L9b135mplztrlerXZNwd+Bh+6MQsqMJrNUQePvLuimIMHyILzyzGjR84Mzxl0bux7Mes
 PDezAPUhx4h0PW23386oUecdeeiLEQBFFlbMTqrbFtESccMcITsygwKfzoDrE6OITPpO
 yC15TfvdIoXX05P6XdX3moNitbhrIDouxHaLsK7GzcCLG8QlUkBpoGwz57fW6+bVTlZk
 aQbPPHYNo/7Ce/oCdup47dCaztQJdaWN1V+39oKgE9famVd8OccuV6eZp+G/5ujvYdVL
 rrfg==
X-Gm-Message-State: AOAM5324/7FbJ64nxdSS+CRWbYqcoCxQsRZHEPb9bUGiEe/q48GDL/K6
 xOkqSb/GqI2wI4sK//uq0ae9uzduf9NBqSQSWGJ/285MbFA=
X-Google-Smtp-Source: ABdhPJxjfEUg+TnIHtRuvhFzj+H9tTUM6CL5m4CcIm7lD/Uzb8XWY+LeHqmxKWiUktQMhUhkDtiIaznjK3Mt2/G70Q4=
X-Received: by 2002:ac8:5f0c:0:b0:2cd:4ca2:2f73 with SMTP id
 x12-20020ac85f0c000000b002cd4ca22f73mr1611995qta.600.1645011785947; Wed, 16
 Feb 2022 03:43:05 -0800 (PST)
MIME-Version: 1.0
References: <CAKBt_AeMSV8Z98bZh3saK8G61e9m8JNXZrLmNT2oJsvAHJNTZg@mail.gmail.com>
 <e2adadf1ff5d26eddd657c3b5e6f5d547bd0270a.camel@freebox.fr>
 <CAKBt_AdkDqj+wocWM3CSNA7Fh1DRYEHz-vJCGQpR6woY2WAH7w@mail.gmail.com>
 <5b1bc5867346e67a746d87c099b0826c0169a84f.camel@freebox.fr>
 <CAKBt_Acz8=UG_4AeoPCQ4ed5fc4JjHfou9RF8MsgSSf1qW0wQA@mail.gmail.com>
 <0e7682cfd9c1a590e8b2e1bd45c39cf7c6527eb7.camel@freebox.fr>
In-Reply-To: <0e7682cfd9c1a590e8b2e1bd45c39cf7c6527eb7.camel@freebox.fr>
From: Guilherme Weidle <guileweidle@gmail.com>
Date: Wed, 16 Feb 2022 08:42:55 -0300
Message-ID: <CAKBt_Ae_fy4c6shLB5Ft-dHAtOAJ+9kqQ4iUsf+XravC+kjMdw@mail.gmail.com>
Subject: Re: push-pull stalls (QCA 9888)
To: mbizon@freebox.fr
Cc: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_034310_541954_14F3F67E 
X-CRM114-Status: UNSURE (   9.88  )
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

> On Fri, 2022-02-11 at 14:00 -0300, Guilherme Weidle wrote:
>
> > BTW: Did you fix your problem by removing that patch?
>
> Yes
>
> I exchanged a bit with Toke and maybe the ath10k push-pull code is
> somewhat incompatible with the new scheduler, he gave me some ideas to
> try but I did not have time to try them yet.
>
> Could you share your exact reproducer ?

Nice to hear that you have some ideas.

Here is what I've done to reproduce the issue:

#### Station Script - ath9k device ####
# Create virtual stations
SSID="ath10k_test"
i=1
while [ $i -le 5 ]; do
    iw dev wlan0 interface add viface$i type station
    ip link set viface$i address 70:00:00:00:00:0$i
    ifconfig viface$i 10.0.0.$i netmask 255.255.255.0 up
    iw dev viface$i connect $SSID
    i=$((i+1))
done

# Sometimes just couple of interfaces connect, so we need to repeat
i=1
while [ $i -le 5 ]; do
    iw dev viface$i connect $SSID
    i=$((i+1))
done

# Start iperf server
iperf -s
###############################


#### AP Script - ath10k device ####
IPS="1 2 3 4 5"
for ip in $IPS; do iperf -c 10.0.0.$ip & done
###################################

--
Guilherme Weidle

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
