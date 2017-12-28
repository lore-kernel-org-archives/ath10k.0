Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUdX1-0005mM-2h
 for ath10k@lists.infradead.org; Thu, 28 Dec 2017 19:07:56 +0000
Received: by mail-lf0-x244.google.com with SMTP id a12so9869990lfe.13
 for <ath10k@lists.infradead.org>; Thu, 28 Dec 2017 11:07:44 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 0/3] ath10k: a few minor fixes
Date: Thu, 28 Dec 2017 20:06:42 +0100
Message-Id: <20171228190645.25773-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

I discovered these issues while working with the next round of
patches for High Latency devices.

In order to reduce the size of that patchset, I think it is best
if these patches could be added in advance.

The last patch fixes an actual bug that was introduced in
commit 71e9c29fbd28ec14bb8f920c7afd515a75c00234

The other two are just cleanups.

Erik Stromdahl (3):
  ath10k: fix spelling error
  ath10k: remove unused prototype
  ath10k: bugfix: add USB case in ath10k_core_probe_fw

 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/htt.h  | 1 -
 drivers/net/wireless/ath/ath10k/wmi.h  | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.15.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
