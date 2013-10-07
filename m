Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VT8DK-0000Es-M1
 for ath10k@lists.infradead.org; Mon, 07 Oct 2013 10:38:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: ath.git master branch rebased
Date: Mon, 7 Oct 2013 13:38:29 +0300
Message-ID: <87bo31v00q.fsf@kamboji.qca.qualcomm.com>
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

the history in ath.git master branch was becoming really messy as always
just merged wireless-testing to it (and wireless-testing is rebased
after a merge window) and to clean up all that I had to rebase the
master branch. Especially be careful when rebasing patches between from
the old master branch to the new one, there might some odd conflicts
happening.

In the future I'm planning to rebase the master branch every time
wireless-testing is rebased, which usually happens after a merge window.
But I'll always send a separate announcement about the rebase.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
