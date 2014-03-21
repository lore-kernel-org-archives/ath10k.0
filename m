Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR1pj-00023c-P0
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 15:58:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: master branch rebased due to a mistake
Date: Fri, 21 Mar 2014 17:57:44 +0200
Message-ID: <87r45va6iv.fsf@kamboji.qca.qualcomm.com>
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

I accidentally applied two patches into wrong branch, I was supposed to
apply them to ath-next but instead pushed them to the master branch. For
this reason I had to rebase the master branch.

Luckily I noticed it withing 30 minutes and was able to quickly fix it.
So the chances that somebody cloned the wrong master branch are small,
but please be careful anyway. And the content of master branch remains
the same, commit ids just change.

Sorry for the inconvenience.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
