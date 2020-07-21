Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxvqu-0000Ul-2h
 for ath10k@lists.infradead.org; Tue, 21 Jul 2020 17:14:54 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [RFC 0/7] Add support to process rx packets in thread
Date: Tue, 21 Jul 2020 22:44:19 +0530
Message-Id: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

NAPI gets scheduled on the CPU core which got the
interrupt. The linux scheduler cannot move it to a
different core, even if the CPU on which NAPI is running
is heavily loaded. This can lead to degraded wifi
performance when running traffic at peak data rates.

A thread on the other hand can be moved to different
CPU cores, if the one on which its running is heavily
loaded. During high incoming data traffic, this gives
better performance, since the thread can be moved to a
less loaded or sometimes even a more powerful CPU core
to account for the required CPU performance in order
to process the incoming packets.

This patch series adds the support to use a high priority
thread to process the incoming packets, as opposed to
everything being done in NAPI context.

The rx thread can be enabled by using a module parameter
when loading the ath10k_snoc module.

---
This patch series is dependent on the below patch series
https://patchwork.kernel.org/project/ath10k/list/?series=315759

Rakesh Pillai (7):
  mac80211: Add check for napi handle before WARN_ON
  ath10k: Add support to process rx packet in thread
  ath10k: Add module param to enable rx thread
  ath10k: Do not exhaust budget on process tx completion
  ath10k: Handle the rx packet processing in thread
  ath10k: Add deliver to stack from thread context
  ath10k: Handle rx thread suspend and resume

 drivers/net/wireless/ath/ath10k/core.c   |  64 +++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h   |  33 ++++++++++
 drivers/net/wireless/ath/ath10k/htt.h    |   2 +
 drivers/net/wireless/ath/ath10k/htt_rx.c |  66 ++++++++++++++-----
 drivers/net/wireless/ath/ath10k/snoc.c   | 105 ++++++++++++++++++++++++++++++-
 net/mac80211/rx.c                        |   2 +-
 6 files changed, 253 insertions(+), 19 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
