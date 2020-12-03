Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-m963.mail.126.com ([123.126.96.3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkfxO-0002BA-FH
 for ath10k@lists.infradead.org; Thu, 03 Dec 2020 04:11:06 +0000
From: zhouliangya@126.com
Subject: [PATCH 0/1] ath10k_pci_wait_for_target_init() should relax cpu for
 other task instead of calling medelay() so that cpu can run other tasks.
 Signed-off-by: lzhou <lzhou@sonicwall.com> ---
Date: Thu,  3 Dec 2020 11:37:28 +0800
Message-Id: <20201203033729.382088-1-zhouliangya@126.com>
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
Cc: lzhou <zhouliangya@126.com>, linux-wireless@vger.kernel.org

From: lzhou <zhouliangya@126.com>

 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
