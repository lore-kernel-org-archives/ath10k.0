Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bTegX-0005GT-DD
 for ath10k@lists.infradead.org; Sun, 31 Jul 2016 00:32:55 +0000
Received: from [209.85.218.70] (helo=mail-oi0-f70.google.com)
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:DES-CBC3-SHA:168)
 id 1bTPcX-0006ud-Vn
 for ath10k@lists.infradead.org; Sat, 30 Jul 2016 16:27:46 +0800
Received: by mail-oi0-f70.google.com with SMTP id u142so173393886oia.2
 for <ath10k@lists.infradead.org>; Sat, 30 Jul 2016 01:27:45 -0700 (PDT)
MIME-Version: 1.0
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Sat, 30 Jul 2016 15:26:44 +0700
Message-ID: <CA+uUJGsgkx8MDr=7DjtBS++YcwCqdAfMjJ9f-RcDAaQ=SOi=ZQ@mail.gmail.com>
Subject: Broadcasting packets using ath10k
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
To: ath10k <ath10k@lists.infradead.org>

Hi all,

For some research experiments, I need to broadcast packets (at
different fixed rates using the bitrates mask). Think of it as a
standalone rudimentary 802.11ac wireless traffic generator.

Simply using iperf for a broadcast address is not allowed (in managed
mode at least) and so I have tried the multicast option. The multicast
option has the following issues:
1) The STA or the AP cannot be standalone: if STA is to be a
multicaster it needs to be associated with an AP and if the AP is to
be a multicaster it needs at least one STA to be associated with it.
2) Traffic direction: When the STA sends a packet to a multicast
address, the packet is first unicasted to the AP at the rate set by
the bitrates mask. The AP then acknowledges it with a blockACK and
further retransmits (multicasts) it with a basic rate (802.11a 6
Mbps). So there is no pure traffic generation. I even tried setting
TTL (number of hops) to zero, but no avail.
3) Cannot fix the rates: On the other hand, when the AP multicasts,
the traffic pattern is as expected - simple outgoing packets with no
blockACKs or other redirection. However, the AP doesn't honor the
bitrates masks and multicast traffic is sent using the basic rate. For
other traffic such as a regular UDP/TCP flow, the AP does honor the
bitrates mask.

Anyone has better ideas on putting together a rudimentary 802.11ac
traffic generator? It would be great to know :)

Thanks,
Raj Joshi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
