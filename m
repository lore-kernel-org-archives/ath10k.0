Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9B7C-00081b-IN
 for ath10k@lists.infradead.org; Thu, 08 Jan 2015 11:18:59 +0000
Received: by mail-wg0-f54.google.com with SMTP id z12so1990817wgg.13
 for <ath10k@lists.infradead.org>; Thu, 08 Jan 2015 03:18:34 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: add wmi-tlv debug event handling
Date: Thu,  8 Jan 2015 12:18:15 +0100
Message-Id: <1420715897-18706-1-git-send-email-michal.kazior@tieto.com>
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

New wmi-tlv firmware will deliver debug messages
via new events.

Note: This may yield some (trivial) conflicts
against my beacon/presp template patchset.


Michal Kazior (2):
  ath10k: implement diag data container event
  ath10k: implement diag event

 drivers/net/wireless/ath/ath10k/trace.h   |  68 ++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 102 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  19 ++++++
 3 files changed, 189 insertions(+)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
