Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQYpX-000728-Tw
 for ath10k@lists.infradead.org; Thu, 20 Mar 2014 09:00:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Documenting firmware branches
Date: Thu, 20 Mar 2014 10:59:36 +0200
Message-ID: <87zjkldz47.fsf@kamboji.qca.qualcomm.com>
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

Hi,

I started a section about firmware branches in the wiki:

----------------------------------------------------------------------
Firmware branches

ath10k firmware has different branches, they are described below.

main branch

Firmware versions 999.999.0.x.

Supports AP mode, STA mode, Ad-Hoc and P2P. But AP mode is not that well
tested, especially problems with DFS.

10.1 branch

Firmware versions 10.1.x.

Branch focusing on AP mode. Supports DFS. STA mode works but not well
tested. No Ad-Hoc or P2P support.
----------------------------------------------------------------------

http://wireless.kernel.org/en/users/Drivers/ath10k/firmware#Firmware_branches

If I missed something, please improve the wiki.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
