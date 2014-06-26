Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x236.google.com ([2607:f8b0:400d:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X04IR-00014q-DQ
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 07:40:39 +0000
Received: by mail-qc0-f182.google.com with SMTP id m20so2805558qcx.27
 for <ath10k@lists.infradead.org>; Thu, 26 Jun 2014 00:40:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
References: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
Date: Thu, 26 Jun 2014 00:40:17 -0700
Message-ID: <CAJ-Vmo=Wstip25TkAF34UJ6Ma5wZSfS6y2+aQUAAjThn59wQkg@mail.gmail.com>
Subject: Re: No reorder buffer?
From: Adrian Chadd <adrian@freebsd.org>
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
To: Denton Gentry <denton.gentry@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

.. and to confirm, the initial design of this is that yes, the
firmware is _supposed_ to be doing all of the RX reordering and the TX
aggregation/retransmission/BAR handling and powersave. As far as the
host stack is concerned, the design was supposed to offload as much of
the data pipeline processing as possible, handling only 802.11
negotiation, encryption setup/rekeying, etc.

But ath10k did change that because, and I'm fuzzy on the details,
there's various functionality that gets hidden from you when you're
running in the full offload mode.

So yes, if the MAC isn't configured in ethernet offload mode - if it's
in one of the monitor-ish wifi modes - then the NIC and firmware
aren't doing reordering and you'll have to do it on the host.

hth,

-a

On 24 June 2014 07:47, Denton Gentry <denton.gentry@gmail.com> wrote:
> I'm bridging ath10k to Ethernet, gathering pcaps on another ath10k
> system in monitor mode and on the Ethernet system which is receiving
> the packets. I see packets being delivered out of order to the
> Ethernet system. So far as I can tell, any packet which has to be
> re-sent on the Wifi link will be delivered out of order to Ethernet.
>
> I believe this happens because there is no reorder buffer.
> ieee80211_rx_reorder_ampdu returns because tid_agg_rx[tid] is NULL.
>
> I believe there is no reorder buffer because
> ieee80211_process_addba_request is not being called.
> ieee80211_process_addba_request would allocate tid_agg_rx[tid].
>
> I believe ieee80211_process_addba_request is not being called because
> the firmware processes the AddBA and does not pass it up. This is the
> part I am least sure about.
>
>
> Can anyone confirm or deny that this is correct: does the firmware
> process the AddBA, but not have a reorder buffer in the firmware?
>
>
> This is noticeable mostly because of Windows. The Windows TCP stack
> seems to react more strongly to packet reordering (inferred via SACKs,
> I guess), and slows down.
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
