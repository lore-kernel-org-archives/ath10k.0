Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wj0-x234.google.com ([2a00:1450:400c:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQzFr-0006k2-5s
 for ath10k@lists.infradead.org; Tue, 10 Jan 2017 16:26:37 +0000
Received: by mail-wj0-x234.google.com with SMTP id kq3so39892866wjc.0
 for <ath10k@lists.infradead.org>; Tue, 10 Jan 2017 08:26:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170110155716.GB7422@atheros-ThinkPad-T61>
References: <CABuVarLXcrn1Lz3GHV1QBQxdoUg9YwJF7B43B_YqFg6Y7swPJQ@mail.gmail.com>
 <CAJ-Vmok5PPcDzzprXe+JWRsw3-A0jBrxS4ORhBR5tGoJ0G_G=g@mail.gmail.com>
 <CABuVarK4gF2pBCEBUEE_5RfmrcHUcYpeHMFUw3-F3KHrHHhkkw@mail.gmail.com>
 <20170110102554.GA7294@atheros-ThinkPad-T61>
 <CAJ-VmokM=MRTx9ZTVP_+W+y4ikH_-ARNoE3do4fAL1=3vCz7mg@mail.gmail.com>
 <CABuVar+MFzBbGToWU0O5ooqmybRyaqGqpNAqXvgjKUzMzwR4jA@mail.gmail.com>
 <20170110155716.GB7422@atheros-ThinkPad-T61>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 10 Jan 2017 08:26:11 -0800
Message-ID: <CAJ-VmomHVuDPSDq-++ed8okq6f4n60MO3baD4Su7Hw6K_QKj7w@mail.gmail.com>
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: Sergey Stepanov <no.such.process@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

heh, it would indeed be good to know!

I have a list of "things I needed to do to make it work on freebsd",
since I've been porting ath10k :)


-adrian


On 10 January 2017 at 07:57, Mohammed Shafi Shajakhan
<mohammed@codeaurora.org> wrote:
> On Tue, Jan 10, 2017 at 08:54:34PM +0500, Sergey Stepanov wrote:
>> Hello, all
>>
>> Thanks for helping, finally I got this thing working.
>
> [shafi] It would be good if you let us know what did you fix to make this
> working ? Is the one suggested by Adrian ?
>
>>
>> 2017-01-10 20:44 GMT+05:00 Adrian Chadd <adrian@freebsd.org>:
>> > hiya,
>> >
>> > Have you pushed the channel list into the firmware? You (a) nede to
>> > push a channel list early on, way before you create vdevs, and (b) it
>> > needs to match the band (2g, 5g, 2g/5g) that the firmware expects.
>> > pushing 2g channels to a 5g band causes the firmware to panic upon
>> > vdev create/up.
>> >
>> >
>> >
>> > -adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
