Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjkL3-0006bP-5r
 for ath10k@lists.infradead.org; Mon, 12 May 2014 07:07:54 +0000
Received: by mail-vc0-f175.google.com with SMTP id hu19so5187509vcb.6
 for <ath10k@lists.infradead.org>; Mon, 12 May 2014 00:07:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <537056B1.6060902@candelatech.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 12 May 2014 03:07:10 -0400
Message-ID: <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
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

On Mon, May 12, 2014 at 1:05 AM, Ben Greear <greearb@candelatech.com> wrote:
> If it's getting on the air, then I think the only way to figure out
> what is wrong is to decode the packets and see if they are encrypted
> properly or not.  I think there is a way to get wireshark to decode
> pkts by feeding it the proper keys, but I have not ever actually tried
> doing that.

Okay, here is a fairly reduced capture of my wireshark trace:
http://apenwarr.ca/tmp/ath10k-utorrent-dropout-v2-reduced.pcapng.gz

To decode the wifi packets in wireshark, you need to follow these steps:
- open the pcap
- Edit | Preferences
- Protocols | IEEE 802.11
- Enable Decryption: checked
- Decryption Keys: Edit
- New
- Key type: wpa-pwd
- Key: my-password:my-ssid  (I'll email these to Ben privately; anyone
else interested, let me know)
- Ok
- Ok

The capture contains a lot of simultaneous TCP and UDP sessions, since
I can only trigger the problem when there is quite a bit of stuff
going on.  Luckily the air itself was relatively quiet so there isn't
too much noise other than my AP and laptop.

I believe I can narrow down the dropout to somewhere between rows
20035 and 20391.  20035 is a packet from a remote server that is ACKed
by my macbook.  20391 is a packet from the same remote server that is
*not* ACKed by my macbook, and then there are a bunch of retransmits
on that session after that.

I'm still looking at the capture to find any clues, but if anybody
else wants to take a peek, please do :)

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
