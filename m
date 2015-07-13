Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZESmq-00075V-Jq
 for ath10k@lists.infradead.org; Mon, 13 Jul 2015 01:44:05 +0000
Received: by igvi1 with SMTP id i1so22172641igv.1
 for <ath10k@lists.infradead.org>; Sun, 12 Jul 2015 18:43:42 -0700 (PDT)
Received: from hash ([2001:470:1d:6db:230:48ff:fe9d:9c89])
 by smtp.gmail.com with ESMTPSA id 15sm376981iop.3.2015.07.12.18.43.40
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 Jul 2015 18:43:40 -0700 (PDT)
Received: from bob by hash with local (Exim 4.84)
 (envelope-from <me@bobcopeland.com>) id 1ZESmL-0003jT-P7
 for ath10k@lists.infradead.org; Sun, 12 Jul 2015 21:43:33 -0400
Date: Sun, 12 Jul 2015 21:43:33 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150713014333.GA14152@localhost>
References: <CAN+ZWYEK5TpXVsQom5RBxZ1=XCGn9Cq47w1rQdonWNx-ec88vA@mail.gmail.com>
 <20150706214921.GF23012@localhost>
 <20150712142532.GA24495@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20150712142532.GA24495@localhost>
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

[trimmed CC to list]

On Sun, Jul 12, 2015 at 10:25:32AM -0400, Bob Copeland wrote:
> It looks like unicast self-protected action frames (peering) works fine, but
> broadcast multihop action frames (PREQs) never go over the air.  Does
> this sound familiar to anyone?

Actually, it's any group addressed frame.  I tried playing with various
values for htt_data_tx_ext_tid as well as just using the tid on the frame
(in mesh group addressed frames still have a qos header with tid=0).

[  662.170000] XXX htt tx completion msdu_id 0 discard 0 no_ack 0 success 1
[  662.470000] XXX tx seq: 264 txmode 0
[  662.470000] XXX htt tx flags0 5 flags1 3136 len 39 id 0 frags_paddr 07337028, msdu_paddr 06513e2e vdev 0 tid 17 freq 0
[  662.480000] XXX htt tx completion msdu_id 0 discard 0 no_ack 0 success 1
[  662.600000] XXX tx seq: 265 txmode 0
[  662.600000] XXX htt tx flags0 5 flags1 2048 len 156 id 0 frags_paddr 07337028, msdu_paddr 06932028 vdev 0 tid 0 freq 0
[  662.620000] XXX tx seq: 266 txmode 0
[  662.620000] XXX htt tx flags0 5 flags1 2048 len 116 id 1 frags_paddr 07337000, msdu_paddr 06921028 vdev 0 tid 0 freq 0
[  662.630000] XXX htt tx completion msdu_id 0 discard 0 no_ack 1 success 0
[  662.640000] XXX htt tx completion msdu_id 1 discard 0 no_ack 1 success 0
[  663.090000] XXX tx seq: 267 txmode 0

The 'success 1' ones are unicast, the success 0 are mcast (in this case
using the frame's tid, otherwise it would be 16.)

Kind of odd that it's not working, since my earlier snapshot worked...
I guess at worst I can bisect compat-wireless versions but that will
take some time.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
