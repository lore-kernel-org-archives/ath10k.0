Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzS0r-00009z-7h
 for ath10k@lists.infradead.org; Tue, 24 Jun 2014 14:47:57 +0000
Received: by mail-ob0-f174.google.com with SMTP id va2so438213obc.19
 for <ath10k@lists.infradead.org>; Tue, 24 Jun 2014 07:47:35 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 24 Jun 2014 07:47:35 -0700
Message-ID: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
Subject: No reorder buffer?
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

I'm bridging ath10k to Ethernet, gathering pcaps on another ath10k
system in monitor mode and on the Ethernet system which is receiving
the packets. I see packets being delivered out of order to the
Ethernet system. So far as I can tell, any packet which has to be
re-sent on the Wifi link will be delivered out of order to Ethernet.

I believe this happens because there is no reorder buffer.
ieee80211_rx_reorder_ampdu returns because tid_agg_rx[tid] is NULL.

I believe there is no reorder buffer because
ieee80211_process_addba_request is not being called.
ieee80211_process_addba_request would allocate tid_agg_rx[tid].

I believe ieee80211_process_addba_request is not being called because
the firmware processes the AddBA and does not pass it up. This is the
part I am least sure about.


Can anyone confirm or deny that this is correct: does the firmware
process the AddBA, but not have a reorder buffer in the firmware?


This is noticeable mostly because of Windows. The Windows TCP stack
seems to react more strongly to packet reordering (inferred via SACKs,
I guess), and slows down.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
