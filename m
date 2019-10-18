Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLPHz-0002wY-BX
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 10:15:22 +0000
Received: by mail-lf1-f72.google.com with SMTP id r3so1177255lfn.13
 for <ath10k@lists.infradead.org>; Fri, 18 Oct 2019 03:15:15 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v2 1/4] mac80211: Rearrange ieee80211_tx_info to make room
 for tx_time_est
In-Reply-To: <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115993866.2500430.13989567853855880476.stgit@toke.dk>
 <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
Date: Fri, 18 Oct 2019 12:15:11 +0200
Message-ID: <87sgnqe4wg.fsf@toke.dk>
MIME-Version: 1.0
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
To: Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Kan Yan <kyan@google.com> writes:

> The "tx_time_est" field, shared by control and status, is not able to
> survive until the skb returns to the mac80211 layer in some
> architectures. The same space is defined as driver_data and some
> wireless drivers use it for other purposes, as the cb in the sk_buff
> is free to be used by any layer.
>
> In the case of ath10k, the tx_time_est get clobbered by
> struct ath10k_skb_cb {
>         dma_addr_t paddr;
>         u8 flags;
>         u8 eid;
>         u16 msdu_id;
>         u16 airtime_est;
>         struct ieee80211_vif *vif;
>         struct ieee80211_txq *txq;
> } __packed;

Ah, bugger, of course the driver that actually needs this is using the
full driver_data space :P

> Do you think shrink driver_data by 2 bytes and use that space for
> tx_time_est to make it persistent across mac80211 and wireless driver
> layer an acceptable solution?

Hmm, the driver_data field is defined as an array of pointers, so we can
only shrink it in increments of sizeof(void *). I think it may be
feasible to shrink it (as in, I don't think any drivers are actually
using the full 40 bytes), but doing this in a way that will gain us a
2-byte space that is also usable in the case driver_data is *not* used
(i.e., it needs be able to align with a field in .control and .status as
well) would require some serious surgery of the whole ieee80211_tx_info...

However, there's a nice juicy 'u16 ack_frame_id' at the start of
ieee80211_tx_info. Could we potentially use that? We could use the top
bit as a disambiguation flag; I think we're fine with 15 bits for the TX
time itself (a single packet won't exceed 8ms or TX time), so if we can
live with 15 bits of ACK frame ID space, that could be a way forward?

Johannes, what do you think?

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
