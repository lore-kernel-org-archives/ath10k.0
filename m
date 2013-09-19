Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMYuj-000758-JB
 for ath10k@lists.infradead.org; Thu, 19 Sep 2013 07:44:38 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix tracing of ath10k_wmi_cmd
Date: Thu, 19 Sep 2013 09:44:09 +0200
Message-ID: <1379576649-3947-1-git-send-email-michal.kazior@tieto.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

One of my recent patches broke tracing. kbuild
test robot reported this issue.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/trace.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index fd53130..90817dd 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -119,7 +119,7 @@ TRACE_EVENT(ath10k_wmi_cmd,
 		__field(unsigned int, id)
 		__field(size_t, buf_len)
 		__dynamic_array(u8, buf, buf_len)
-		__field(int ret)
+		__field(int, ret)
 	),
 
 	TP_fast_assign(
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
