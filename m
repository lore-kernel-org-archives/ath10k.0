Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x22f.google.com ([2607:f8b0:400d:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X04GN-0007ZY-Ua
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 07:38:32 +0000
Received: by mail-qc0-f175.google.com with SMTP id i8so2745262qcq.20
 for <ath10k@lists.infradead.org>; Thu, 26 Jun 2014 00:38:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
References: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
Date: Thu, 26 Jun 2014 00:38:09 -0700
Message-ID: <CAJ-Vmokmpi0DGKHvXvjbu9imD1W65fSAzbyXpGrn-9Hu3PTudg@mail.gmail.com>
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

... hm. Well, in normal operation the firmware is supposed to be doing
reordering. But I don't think ath10k runs the MAC in normal ethernet
pipe mode, right? So a lot of the firmware / hardware offload bits
don't work.

Can someone verify for me which mode the MAC is in? I forget what was done.



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
