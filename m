Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrWpS-0007Uo-76
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 18:19:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: ath-current branch
Date: Mon, 2 Jun 2014 21:19:00 +0300
Message-ID: <87oaybxjhn.fsf@kamboji.qca.qualcomm.com>
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

as I start to send patches also to -rc releases there's a small change
in ath10k git branches:

I have a new branch ath-current which is for fixes going to the
"current" kernel version under development, for example currently that
means 3.16 which development will soon start. The ath-current branch
will contain only very important fixes we want to have in the next -rc
release.

ath-next branch will continue be the main location for new ath10k
patches. All new features and most of the bugfixes go into this branch.

In practise these branches are transparate to ath10k developers and
users. Just continue using the master branch as I merge both ath-current
and ath-next branches into the master branch, just as before. But if you
used ath-next branch for something before, now make sure to check also
ath-current for important fixes. They will not be in ath-next branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
