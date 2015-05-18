Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuHVi-0002zv-HS
 for ath10k@lists.infradead.org; Mon, 18 May 2015 09:38:59 +0000
Received: by wicmc15 with SMTP id mc15so84644456wic.1
 for <ath10k@lists.infradead.org>; Mon, 18 May 2015 02:38:31 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/3] ath10k: improve power efficiency
Date: Mon, 18 May 2015 09:38:15 +0000
Message-Id: <1431941898-13591-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1431076388-24800-1-git-send-email-michal.kazior@tieto.com>
References: <1431076388-24800-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Some measurements for QCA61X4:

            Loaded    Started   Associated
Unpatched    31mA      88mA       43mA
Patched      14mA      15mA       23mA

Loaded = module loaded, driver bound, no interface
         is running

Started = Loaded, but one client interface is
          running, not associated

Associated = Started, but associated to an AP as
             client

Note: Unpatched was consuming more power when
Started than when Associated. This is no mistake.

I didn't have a way to measure QCA988X.


Janusz Dziedzic (2):
  ath10k: enable ASPM
  ath10k: fix idle power consumption

Michal Kazior (1):
  ath10k: enable pci soc powersaving

 drivers/net/wireless/ath/ath10k/debug.h |   1 +
 drivers/net/wireless/ath/ath10k/mac.c   |   9 +-
 drivers/net/wireless/ath/ath10k/pci.c   | 317 +++++++++++++++++++++++---------
 drivers/net/wireless/ath/ath10k/pci.h   |  97 +++++-----
 4 files changed, 284 insertions(+), 140 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
