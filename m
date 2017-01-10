Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQylE-0002KE-J2
 for ath10k@lists.infradead.org; Tue, 10 Jan 2017 15:54:58 +0000
Received: by mail-ua0-x229.google.com with SMTP id i68so385743025uad.0
 for <ath10k@lists.infradead.org>; Tue, 10 Jan 2017 07:54:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmokM=MRTx9ZTVP_+W+y4ikH_-ARNoE3do4fAL1=3vCz7mg@mail.gmail.com>
References: <CABuVarLXcrn1Lz3GHV1QBQxdoUg9YwJF7B43B_YqFg6Y7swPJQ@mail.gmail.com>
 <CAJ-Vmok5PPcDzzprXe+JWRsw3-A0jBrxS4ORhBR5tGoJ0G_G=g@mail.gmail.com>
 <CABuVarK4gF2pBCEBUEE_5RfmrcHUcYpeHMFUw3-F3KHrHHhkkw@mail.gmail.com>
 <20170110102554.GA7294@atheros-ThinkPad-T61>
 <CAJ-VmokM=MRTx9ZTVP_+W+y4ikH_-ARNoE3do4fAL1=3vCz7mg@mail.gmail.com>
From: Sergey Stepanov <no.such.process@gmail.com>
Date: Tue, 10 Jan 2017 20:54:34 +0500
Message-ID: <CABuVar+MFzBbGToWU0O5ooqmybRyaqGqpNAqXvgjKUzMzwR4jA@mail.gmail.com>
Subject: Re: QCA9984 firmware crash
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello, all

Thanks for helping, finally I got this thing working.

2017-01-10 20:44 GMT+05:00 Adrian Chadd <adrian@freebsd.org>:
> hiya,
>
> Have you pushed the channel list into the firmware? You (a) nede to
> push a channel list early on, way before you create vdevs, and (b) it
> needs to match the band (2g, 5g, 2g/5g) that the firmware expects.
> pushing 2g channels to a 5g band causes the firmware to panic upon
> vdev create/up.
>
>
>
> -adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
