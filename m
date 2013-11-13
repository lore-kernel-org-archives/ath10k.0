Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgYNH-00053w-1c
 for ath10k@lists.infradead.org; Wed, 13 Nov 2013 11:12:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: TCP TSQ regression affecting ath10k throughput
Date: Wed, 13 Nov 2013 13:12:15 +0200
Message-ID: <87ob5o7dyo.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

Hi,

Sujith reported a regression in TCP which caused a major decrease in
ath9k and ath10k throughput:

http://thread.gmane.org/gmane.linux.network/290269

The commit which broke this is c9eeec26e32e ("tcp: TSQ can use a dynamic
limit") and this patch seems to fix it:

http://patchwork.ozlabs.org/patch/290672/

I have cherry picked the fix to ath.git master branch to make it easier
for ath10k developers.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
