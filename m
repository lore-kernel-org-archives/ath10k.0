Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzeRn-0005CS-NQ
 for ath10k@lists.infradead.org; Tue, 11 Sep 2018 08:55:04 +0000
Received: by mail-pf1-x443.google.com with SMTP id h79-v6so11879947pfk.8
 for <ath10k@lists.infradead.org>; Tue, 11 Sep 2018 01:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAKc-1SD6VF8-2O=Od+iDjc2wbB3-rSuXy9J63S8xx2w4GHfi3Q@mail.gmail.com>
 <bc1f526c-91a9-4d1e-50fc-00f5b60774d8@candelatech.com>
In-Reply-To: <bc1f526c-91a9-4d1e-50fc-00f5b60774d8@candelatech.com>
From: Fraser Cadger <frasercadger@gmail.com>
Date: Tue, 11 Sep 2018 09:54:36 +0100
Message-ID: <CAKc-1SCwXKNYuV1DAQ9ar7wOQMHnM08WbLKJc8z_qrK9xFj5PA@mail.gmail.com>
Subject: Re: Multiple simultaneous channels on QCA9882
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
To: greearb@candelatech.com, ath10k@lists.infradead.org, adrian@freebsd.org

Ben - thank you for your reply, your clarification is exactly what I
was looking for.

Adrian - thank your for your reply as well. You raise some interesting
points regarding workarounds, which I'll look into further to decide
whether they are feasible or if we are better off using 1 channel for
both interfaces.
If I'm able to get anything working, I'll report back.

For some reason your response doesn't seem to show up in the infradead
archive, so I'll post it below for anyone who ends up reading this
thread.

Regards,

Fraser

>Hi!
>
>So, there's a resource manager in the firmware that's supposed to let you do these kinds of things. Ie, if you created two station vdevs to the firmware the firmware will handle alternating channels for you and doing all of the power save and other >management stuff on your behalf.
>
>However, it's not as easy/standards compliant when one vdev is an AP. There's no way to tell AP clients that you're going to sleep - so you can only be away BETWEEN beacon intervals. And, whilst you're away, clients will see transmit failures >to the AP.
>
>P2P fixes this somewhat - P2P master (APs) can go into powersave mode and notify clients that they are going away for a while. However! I don't know if the QCA988x firmware supports that particular operation. In fact, I've never tested it on the >open source drivers with any chip that wasn't QCA6174 and /that/ was a while ago. :-P
>
>Good luck!
>
>
>
>-adrian

On Mon, Sep 10, 2018 at 5:06 PM Ben Greear <greearb@candelatech.com> wrote:
>
> On 09/10/2018 07:37 AM, Fraser Cadger wrote:
> > Hi,
> >
> > I am using a device based on the Atheros QCA9882 chipset.
> >
> > I would like to make use of the simultaneous dual-band functionality
> > that the device provides. The goal is to have to interfaces with one
> > acting as
> > an Access Point (wlan0) and the other acting as a client of another AP
> > (wlan1). Ideally, both of these interfaces should be operating on
> > different channels.
>
> These radios can support both bands, but at any given time, they can be on
> only a single channel.  You need multiple radios to run on multiple channels.
>
> Thanks,
> Ben
>
> >
> > As I have understood it, Atheros/Qualcomm market the QCA9882 as being
> > capable of both dual-band and concurrent operation:
> > https://www.qualcomm.com/news/releases/2012/02/23/qualcomm-atheros-launches-80211ac-product-ecosystem-provide-end-end-gigabit
> >
> > I am using v4.1 of the Linux kernel.
> >
> > Having experienced some difficulties using hostapd and wpa_supplicant,
> > I checked the device capabilities using iw. If I am interpreting the
> > output below correctly, it is only possible to use 1 channel on both
> > interfaces:
> >
> > valid interface combinations:
> >                  * #{ managed, P2P-client } <= 36, #{ P2P-GO } <= 3,
> > #{ AP } <= 7, #{ IBSS } <= 1,
> >                    total <= 36, #channels <= 1, STA/AP BI must match
> >
> >
> > As I understand it, #channels <=1 indicates that only 1 channel may be
> > used at a particular time by all interfaces.
> >
> > I am wondering if this is a limitation of the driver, or if there has
> > been a misunderstanding in the capabilities of the hardware.
> >
> > Does anyone have experience with this?
> >
> > Regards,
> >
> > Fraser
> >
> > _______________________________________________
> > ath10k mailing list
> > ath10k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath10k
> >
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
