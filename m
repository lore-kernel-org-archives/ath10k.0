Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQyo0-0006Qi-R0
 for ath10k@lists.infradead.org; Tue, 10 Jan 2017 15:57:50 +0000
Date: Tue, 10 Jan 2017 21:27:16 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: QCA9984 firmware crash
Message-ID: <20170110155716.GB7422@atheros-ThinkPad-T61>
References: <CABuVarLXcrn1Lz3GHV1QBQxdoUg9YwJF7B43B_YqFg6Y7swPJQ@mail.gmail.com>
 <CAJ-Vmok5PPcDzzprXe+JWRsw3-A0jBrxS4ORhBR5tGoJ0G_G=g@mail.gmail.com>
 <CABuVarK4gF2pBCEBUEE_5RfmrcHUcYpeHMFUw3-F3KHrHHhkkw@mail.gmail.com>
 <20170110102554.GA7294@atheros-ThinkPad-T61>
 <CAJ-VmokM=MRTx9ZTVP_+W+y4ikH_-ARNoE3do4fAL1=3vCz7mg@mail.gmail.com>
 <CABuVar+MFzBbGToWU0O5ooqmybRyaqGqpNAqXvgjKUzMzwR4jA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABuVar+MFzBbGToWU0O5ooqmybRyaqGqpNAqXvgjKUzMzwR4jA@mail.gmail.com>
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
To: Sergey Stepanov <no.such.process@gmail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Jan 10, 2017 at 08:54:34PM +0500, Sergey Stepanov wrote:
> Hello, all
> 
> Thanks for helping, finally I got this thing working.

[shafi] It would be good if you let us know what did you fix to make this
working ? Is the one suggested by Adrian ?

> 
> 2017-01-10 20:44 GMT+05:00 Adrian Chadd <adrian@freebsd.org>:
> > hiya,
> >
> > Have you pushed the channel list into the firmware? You (a) nede to
> > push a channel list early on, way before you create vdevs, and (b) it
> > needs to match the band (2g, 5g, 2g/5g) that the firmware expects.
> > pushing 2g channels to a 5g band causes the firmware to panic upon
> > vdev create/up.
> >
> >
> >
> > -adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
