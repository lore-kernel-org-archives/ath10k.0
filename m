Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x22a.google.com ([2607:f8b0:4003:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1hzE-0002by-2M
 for ath10k@lists.infradead.org; Mon, 30 Jun 2014 20:15:36 +0000
Received: by mail-oa0-f42.google.com with SMTP id eb12so9437806oac.15
 for <ath10k@lists.infradead.org>; Mon, 30 Jun 2014 13:15:14 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 30 Jun 2014 13:15:14 -0700
Message-ID: <CABnBrYU3P5qXd7pE7LJ_K4JeNFLtbZnpsTgvqtpdMs07qz_gGA@mail.gmail.com>
Subject: A-MSDU reception not working?
From: Denton Gentry <denton.gentry@gmail.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

In iperf tests using a MacBook STA bridging through an ath10k AP to an
Ethernet server, I'm noticing very selective packet loss. The second
and subsequent frames in an A-MSDU packet appear to be dropped.

The AP sets the A-MSDU size to 3839 bytes, and the MacBook frequently
sends A-MSDU packets containing two TCP frames. So far as I can tell,
the first TCP frame from an A-MSDU aggregate is delivered and the
second is consistently lost. The MacBook generally retransmits the
lost frame as a singleton with no aggregation, and the retransmitted
frame makes it through.

This became more noticeable after the reordering fixes in
http://lists.infradead.org/pipermail/ath10k/2014-June/002552.html

I see this A-MSDU packet loss behavior both with and without the
reordering fixes, the first packet in an A-MSDU is delivered while the
second is dropped. However, *without* the reordering fixes (and
therefore with packets delivered out of order) the MacBook sends
relatively few A-MSDU frames. *With* the reordering fixes, so all
packets are delivered in order, the MacBook keeps sending A-MSDU and
therefore has to deal with more packet loss. I suspect it is an
interaction with the MacOS TCP congestion window which I'm likely
never going to fully understand, its stuck in a region of the
congestion window where the Wifi driver keeps choosing to using
A-MSDU.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
