Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1coAos-0006ZB-9R
 for ath10k@lists.infradead.org; Wed, 15 Mar 2017 15:26:36 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Should ath10k enable RX_FLAG_ALLOW_SAME_PN
Message-ID: <a22597d0-f0b0-9536-5753-c1bed7a5f20d@candelatech.com>
Date: Wed, 15 Mar 2017 08:26:12 -0700
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

We notice a strange problem when receiving ath10k frames in
raw mode (with modified firmware).

The very first data message (UDP discovery response) is dropped
in WPA2 + AES mode, and it appears that if we would set the
RX_FLAG_ALLOW_SAME_PN it would be accepted.  ath9k in software-crypt
mode does not have this issue as far as we can tell.

So, maybe ath10k should set this flag??

Here is commit ID from the logic that introduced this flag, in case
that helps jog some memory.

commit f631a77ba920f7153a1094d09cd8f2ebbffd0328
Author: Sara Sharon <sara.sharon@intel.com>
Date:   Tue May 3 15:59:44 2016 +0300

     mac80211: allow same PN for AMSDU sub-frames

     Some hardware (iwlwifi an example) de-aggregate AMSDUs and copy the IV
     as is to the generated MPDUs, so the same PN appears in multiple
     packets without being a replay attack.  Allow driver to explicitly
     indicate that a frame is allowed to have the same PN as the previous
     frame.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
