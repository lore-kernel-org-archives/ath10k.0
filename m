Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkeX2-0007Bu-Is
 for ath10k@lists.infradead.org; Wed, 14 May 2014 19:08:01 +0000
Received: by mail-vc0-f179.google.com with SMTP id im17so3024653vcb.38
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 12:07:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
 <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 14 May 2014 15:07:15 -0400
Message-ID: <CAHqTa-3gn1N8hTW4rpMos+h+K4nafoEsv94P0=0O3=Dpiaf2oA@mail.gmail.com>
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

On Mon, May 12, 2014 at 4:21 AM, Avery Pennarun <apenwarr@gmail.com> wrote:
> Nevertheless, I can certainly see things being ACKed in my wifi
> traces.  I think maybe some incorrect Add Block Ack Request packets
> may be triggering a bug in the wifi driver on my macbook?
>
> IEEE 802.11 wireless LAN management frame
>     Fixed parameters
>         Category code: Block Ack (3)
>         Action code: Add Block Ack Request (0x00)
>         Dialog token: 0x01
>         Block Ack Parameters: 0x1017, A-MSDUs, Block Ack Policy
>             .... .... .... ...1 = A-MSDUs: Permitted in QoS Data MPDUs
>             .... .... .... ..1. = Block Ack Policy: Immediate Block Ack
>             .... .... ..01 01.. = Traffic Identifier: 0x0005
>             0001 0000 00.. .... = Number of Buffers (1 Buffer = 2304 Bytes): 64
>         Block Ack Timeout: 0x0000
>         Block Ack Starting Sequence Control (SSC): 0x0000
>             .... .... .... 0000 = Fragment: 0
>             0000 0000 0000 .... = Starting Sequence Number: 0

Replicated this a few more times.  Still on a Macbook, but a different
one (latest MacOS version this time) on a different setting.

Once again, the problem kicked in immediately following an ADDBA
request like the above.  The TID was this time equal to 3 (which I
think is the problematic one last time too; I accidentally pasted the
ADDBA for TID=5 but in my earlier email I called out TID=3 as the one
that triggered the problem).

In this new test case, interestingly, unicast continued to work as
long as I was sending packets off-LAN (ie. through a gateway to
somewhere on the Internet); packets could be exchanged in both
directions.  But I couldn't ping the gateway or any other
LAN-connected device.  This is fishy since I might have blamed a lack
of multicast/broadcast and thus a failure of ARP (unicast was
obviously working) but my ARP table definitely contained the IP of the
gateway.

Anyway, one new clue: the ADDBA was triggered by a TCP ACK packet
being sent by the SPDY port on a server somewhere with a particular
packet priority: diffserv field = 0x60 (class selector 3, no ECN).

I don't know why this would scramble my Macbook's wifi, since the
packets themselves looked fine, but it did.  This was definitely the
first SPDY packet on the session and it triggered the ADDBA and died
instantly.

I really should take Dave Taht's advice and get that netperf thing
going and test all the QoS queues... but meanwhile, I think I'm in a
big hurry so I probably want to just rip out all support for mapping
diffserv to QoS on the ath10k transmit side.  Does anyone have any
suggestions on where to look for my hack-and-slash operation?

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
