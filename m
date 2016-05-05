Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x233.google.com ([2607:f8b0:4002:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayQHq-0007Ws-IJ
 for ath10k@lists.infradead.org; Thu, 05 May 2016 20:54:19 +0000
Received: by mail-yw0-x233.google.com with SMTP id o66so163296908ywc.3
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 13:53:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiRWuXoY19XvXDo+KCTYXCAK8o2BufHLKEn408XthvnuCRYyQ@mail.gmail.com>
References: <CAOiRWuXoY19XvXDo+KCTYXCAK8o2BufHLKEn408XthvnuCRYyQ@mail.gmail.com>
Date: Thu, 5 May 2016 16:53:55 -0400
Message-ID: <CAOiRWuUKUU8daVNN_2MrhHuqR3o3qwtx45wR_HHTfUdsdiuLtA@mail.gmail.com>
Subject: Re: 802.11s channel width settings?
From: Zach Sherin <zach@netblazr.com>
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
To: ath10k@lists.infradead.org

Apologies for the spam, but for clarity I'm using an Archer C7 v2
router, with the MiniPCIe QCA9880-BR4A (v2) 3x3 a/n/ac PCIe radio
controlled by ath10k, trying to use 802.11ac with 5GHz. I can use the
5GHz band as an AP and get much higher speeds (in the 100's or more)
so I know the 22 Mbits/s is slower than the maximum, though I
certainly could be wrong on the channel widths point (it could be the
modulation scheme, maybe?).

Thanks again!
Zach

On Thu, May 5, 2016 at 2:51 PM, Zach Sherin <zach@netblazr.com> wrote:
> Hi all,
>
> I'm using 802.11s to do mesh networking with ath10k on an OpenWRT
> router. My throughput across the 802.11s connections is very low,
> around 22 Mbits/s maximum. When I search my device with iw[1], I am
> informed that the driver believes it is operating in 20MHz channels.
> When I run it in AP mode, I get much faster speeds and iw claims the
> interface is acting with an 80 MHz channel.
>
> Is there any way to increase channel widths in 802.11s? If this is an
> OpenWRT question and not ath10k I'll head over to the forums, but this
> seemed more a driver issue as my wireless config requests wide
> channels. Any chance there's a specific version of ath10k I should
> push to?
>
> Any information would be much appreciated, and I'll be happy to answer
> any questions.
>
> Thanks,
> Zach
>
> [1]iw dev mesh info
>
> Inteface mesh
>            ifindex 19
>            wdev 0x2
>            addr ec:08:6b:ae:51:ac
>            type mesh point
>            wiphy 0
>            channel 36 (5180 MHz), width: 20 MHz (no HT), center1: 5180 MHz
>            txpower 27 dBm

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
