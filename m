Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5zDD-000235-Dm
 for ath10k@lists.infradead.org; Thu, 26 May 2016 17:36:47 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: New master-pending branch in ath.git
Date: Thu, 26 May 2016 17:36:16 +0000
Message-ID: <87iny067sg.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
Content-ID: <5B807061BA6AF143AB274895788E9EBA@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

I added a new branch to ath.git called master-pending:

https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/log/?h=master-pending

This branch is a merge of master branch and pending branch for easier
testing of patches pending for commit. Pending branch uses ath-next as
the baseline so testing on that branch is harder, that's why I created
master-pending.

Everytime I update the pending branch I also update the master-pending
branch so it should be up-to-date. If there are any problems, please let
me know.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
