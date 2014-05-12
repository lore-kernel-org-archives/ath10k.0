Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22a.google.com ([2607:f8b0:400c:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjlVG-0005bf-PW
 for ath10k@lists.infradead.org; Mon, 12 May 2014 08:22:31 +0000
Received: by mail-vc0-f170.google.com with SMTP id lf12so8462204vcb.29
 for <ath10k@lists.infradead.org>; Mon, 12 May 2014 01:22:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 12 May 2014 04:21:49 -0400
Message-ID: <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
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

On Mon, May 12, 2014 at 3:07 AM, Avery Pennarun <apenwarr@gmail.com> wrote:
> On Mon, May 12, 2014 at 1:05 AM, Ben Greear <greearb@candelatech.com> wrote:
>> If it's getting on the air, then I think the only way to figure out
>> what is wrong is to decode the packets and see if they are encrypted
>> properly or not.  I think there is a way to get wireshark to decode
>> pkts by feeding it the proper keys, but I have not ever actually tried
>> doing that.
>
> Okay, here is a fairly reduced capture of my wireshark trace:
> http://apenwarr.ca/tmp/ath10k-utorrent-dropout-v2-reduced.pcapng.gz
> [...]

From what I can see, the most suspicious part of this trace is an
802.11 Action - Add Block Ack Request at time 181.1456.  In a longer
version of this trace, I can see these occurring sporadically.  Each
one has a different TI field:

Time 8.367: TID=0
Time 9.609: TID=6
Time 156.188: TID=1
Time 178.076: TID=2
Time 181.145: TID=3  <-- almost exactly the time of the failure
Time 190.127: TID=5

I don't know how 802.11 QoS works, but I don't think it makes sense to
keep negotiating block ack policies with different TIDs.  Also, the
Block Ack Starting Sequence Number field is always zero; I don't know
what that does, but it seems weird to me.

Nevertheless, I can certainly see things being ACKed in my wifi
traces.  I think maybe some incorrect Add Block Ack Request packets
may be triggering a bug in the wifi driver on my macbook?

IEEE 802.11 wireless LAN management frame
    Fixed parameters
        Category code: Block Ack (3)
        Action code: Add Block Ack Request (0x00)
        Dialog token: 0x01
        Block Ack Parameters: 0x1017, A-MSDUs, Block Ack Policy
            .... .... .... ...1 = A-MSDUs: Permitted in QoS Data MPDUs
            .... .... .... ..1. = Block Ack Policy: Immediate Block Ack
            .... .... ..01 01.. = Traffic Identifier: 0x0005
            0001 0000 00.. .... = Number of Buffers (1 Buffer = 2304 Bytes): 64
        Block Ack Timeout: 0x0000
        Block Ack Starting Sequence Control (SSC): 0x0000
            .... .... .... 0000 = Fragment: 0
            0000 0000 0000 .... = Starting Sequence Number: 0


Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
