Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vj3hf-0007Jw-IK
 for ath10k@lists.infradead.org; Wed, 20 Nov 2013 09:04:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: ath.git rebased
Date: Wed, 20 Nov 2013 11:03:40 +0200
Message-ID: <87siurzbpv.fsf@kamboji.qca.qualcomm.com>
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

due to problems with the ath10k DFS patches I had to rebase both master
and ath-next branches and everyone using these branches need to reset
their local branches. Make sure that the branch the commit below is the
head commit ('git show').

I apologize for the inconvenience but I didn't have any other way to fix
this.

commit dd34375ace70d9bd714c040cf25860454ec5c31b
Merge: 57021ab 650b91f
Author: Kalle Valo <kvalo@qca.qualcomm.com>
Date:   Wed Nov 20 10:39:58 2013 +0200

    Merge branch 'ath-next'

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
