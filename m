Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22a.google.com ([2607:f8b0:400c:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjiIA-0004nX-19
 for ath10k@lists.infradead.org; Mon, 12 May 2014 04:56:46 +0000
Received: by mail-vc0-f170.google.com with SMTP id lf12so8247256vcb.29
 for <ath10k@lists.infradead.org>; Sun, 11 May 2014 21:56:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53704888.9060602@candelatech.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 12 May 2014 00:56:04 -0400
Message-ID: <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Mon, May 12, 2014 at 12:05 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 05/11/2014 08:54 PM, Avery Pennarun wrote:
>> On Sun, May 11, 2014 at 11:09 PM, Ben Greear <greearb@candelatech.com>
>> wrote:
>>> Also, have you tried sniffing with a third device to see if
>>> the AP actually puts the ICMP responses on the air?
>>
>> I did try that.  As far as I can tell, the ICMP responses are simply
>> not being sent at all.

I was incorrect about this because I was looking at the wrong data.  I
tested again with a more obvious method, running "ping -i0.01
192.168.1.107" where 107 is the address of my macbook.  With 100
packets per second, they overwhelm the rest of the traffic so it's
easy to see whether they're coming through.

The AP definitely *is* transmitting the packets on the air.  Even my
macbook can see them in the radiotap tcpdump mode, but it doesn't see
them at the IP layer.  So they are either being encrypted wrong or my
macbook is decrypting them wrong, I guess.

I think I'll try using wireshark and see what it thinks...

> I haven't dug into many of the stats yet, but it's possible the
> ath10k debugfs file would show some types of transmit errors in this case?

Possibly.  Can you give me a hint of where to look?  I don't really
know what these files do.

> Might be interesting to see how long it takes the AP to generate
> the tx status response for the transmitted ICMP packets.  My firmware
> has some extended tx status, but I'm not sure it has anything overly
> useful for your case...I was mostly concerned with the tx rate reporting
> when writing it.

I can try it with your firmware if you think there is useful data to
gather, although since it turned out my earlier statement wasn't true
maybe this is less important :)

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
