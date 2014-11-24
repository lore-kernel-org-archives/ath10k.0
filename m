Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XssEU-0004Ri-QT
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 11:55:07 +0000
Received: by mail-vc0-f169.google.com with SMTP id hy10so4085267vcb.28
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 03:54:43 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 24 Nov 2014 17:24:41 +0530
Message-ID: <CAJqpcCTAPcG4F5-oFxGa0mQhaHzDd=8b2BpTtyYvmX2vZHxYNA@mail.gmail.com>
Subject: Tx Status of multicast frames
From: Vivek Natarajan <vivek.natraj@gmail.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi Johannes,
  We are noticing a issue in updating the multicast frame statistics.
Though mac80211 explicitly sets the IEEE80211_TX_CTL_NO_ACK, it checks
IEEE80211_TX_STAT_ACK to increment the frame count. So, for multicast
frames, is the driver expected to set this STAT_ACK if the frame is
successfully transmitted over the air?

The naming convention seems to be a bit confusing from unicast and
multicast frames perspectives:

For multicast, IEEE80211_TX_STAT_ACK can denote if a frame is
successfully transmitted over the air or failed to be transmitted.

In case of normal frames, IEEE80211_TX_STAT_ACK decides if the frame
is acked or not-acked/not-transmitted.

Do you think renaming this to something like STAT_SUCCESS would be a
better thing to do?

Vivek.

mac80211/status.c:
if (info->flags & IEEE80211_TX_STAT_ACK) {
                if (ieee80211_is_first_frag(hdr->seq_ctrl)) {
                        local->dot11TransmittedFrameCount++;
                        if (is_multicast_ether_addr(hdr->addr1))
                                local->dot11MulticastTransmittedFrameCount++;
                        if (retry_count > 0)
                                local->dot11RetryCount++;
                        if (retry_count > 1)
                                local->dot11MultipleRetryCount++;
                }

                /* This counter shall be incremented for an acknowledged MPDU
                 * with an individual address in the address 1 field or an MPDU
                 * with a multicast address in the address 1 field of type Data
                 * or Management. */
                if (!is_multicast_ether_addr(hdr->addr1) ||
                    ieee80211_is_data(fc) ||
                    ieee80211_is_mgmt(fc))
                        local->dot11TransmittedFragmentCount++;
        } else {
                if (ieee80211_is_first_frag(hdr->seq_ctrl))
                        local->dot11FailedCount++;
        }

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
