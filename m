Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYvMo-000831-GH
 for ath10k@lists.infradead.org; Tue, 09 Jan 2018 14:59:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: linux-stable-4.9.y: please apply serious ath10k security
Date: Tue, 09 Jan 2018 16:58:51 +0200
Message-ID: <87r2qzyt78.fsf@kamboji.qca.qualcomm.com>
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
To: stable@vger.kernel.org
Cc: ath10k@lists.infradead.org

Hi Linux stable team,

ath10k has a replay detection problem which was fixed in v4.14. I would
like to get the fix also to linux-stable-4.9.y but for that it depends
on a small mac80211 patch. So then cherrypicking the fixes please take
the mac80211 commit first:

cef0acd4d7d4 mac80211: Add RX flag to indicate ICV stripped
7eccb738fce5 ath10k: rebuild crypto header in rx data frames

I tested and in this order commits apply just fine to linux-4.9.y.

The ath10k patch is largish but as this fixes a security issue I hope it
still can be applied to linux-stable. Please let me know if there are
any problems.

This is the commit log describing the problem:

--------------------------------------------------------------------------------
ath10k: rebuild crypto header in rx data frames

Rx data frames notified through HTT_T2H_MSG_TYPE_RX_IND and
HTT_T2H_MSG_TYPE_RX_FRAG_IND expect PN/TSC check to be done
on host (mac80211) rather than firmware. Rebuild cipher header
in every received data frames (that are notified through those
HTT interfaces) from the rx_hdr_status tlv available in the
rx descriptor of the first msdu. Skip setting RX_FLAG_IV_STRIPPED
flag for the packets which requires mac80211 PN/TSC check support
and set appropriate RX_FLAG for stripped crypto tail. Hw QCA988X,
QCA9887, QCA99X0, QCA9984, QCA9888 and QCA4019 currently need the
rebuilding of cipher header to perform PN/TSC check for replay
attack.

Please note that removing crypto tail for CCMP-256, GCMP and GCMP-256 ciphers
in raw mode needs to be fixed. Since Rx with these ciphers in raw
mode does not work in the current form even without this patch and
removing crypto tail for these chipers needs clean up, raw mode related
issues in CCMP-256, GCMP and GCMP-256 can be addressed in follow up
patches.

Tested-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
----------------------------------------------------------------------

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
