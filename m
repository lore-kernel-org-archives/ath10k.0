Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQ2NO-0000Qf-1h
 for ath10k@lists.infradead.org; Tue, 18 Mar 2014 22:20:50 +0000
Message-ID: <5328C6A8.5000002@candelatech.com>
Date: Tue, 18 Mar 2014 15:20:24 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Stuck packet in ath10k
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

I've been debugging tx flush issues in ath10k.  It seems that
quite often a packet is not flushed within the 3-second timeout,
but sometimes it may be flushed later if one is patient.

I printed out one of the packets in hex, but it does not appear to
have any data, and I'm getting confused trying to decode it by hand.
(Would be lovely if wireshark would let one type in a packet in hex
and then decode it!)

48 01 00 00        # ??
04 f0 21 03 38 99  # Addr of AP
00 f0 21 0e 02 fe  # Addr of sending station
04 f0 21 03 38 99  # Addr of AP
00 11              # Seq number?


Anyone know what this packet is and/or have an idea why it would take
a long time to be dealt with by the firmware?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
