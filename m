Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X01xm-0008F5-RX
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 05:11:11 +0000
Received: by mail-oa0-f50.google.com with SMTP id n16so3285706oag.23
 for <ath10k@lists.infradead.org>; Wed, 25 Jun 2014 22:10:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
References: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
Date: Wed, 25 Jun 2014 22:10:48 -0700
Message-ID: <CABnBrYWmyJC_eyH7sWzgt8BNhUKTf5-1_F=X-ZZZh=ZdyiSBkw@mail.gmail.com>
Subject: Re: No reorder buffer?
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
To: ath10k@lists.infradead.org

Following up: to confirm or disprove whether the lack of a reorder
buffer is a factor in abnormally low throughput from Windows STAs, I
hacked sta_info_alloc() to allocate sta->ampdu_mlme.tid_rx[0] directly
instead of allocating it when processing an AddBA from the STA.

Throughput from a Windows system running iperf went up from ~45 Mbps
to 230 Mbps. A pcap collected by the Ethernet system at the other end
of the test no longer shows frames delivered out of order.

I suspect a proper fix would involve having the firmware pass the
AddBA up to the host.


On Tue, Jun 24, 2014 at 7:47 AM, Denton Gentry <denton.gentry@gmail.com> wrote:
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

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
