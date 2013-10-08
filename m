Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTQIR-0002X6-B2
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 05:57:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: ath10k: ath-next-test branch for testing patches
Date: Tue, 8 Oct 2013 08:56:59 +0300
Message-ID: <87hacstidw.fsf@kamboji.qca.qualcomm.com>
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

I have noticed that Fengguan's build tests are really helpful, his build
bot has found quite a few issues. To make more use of the buildbot I
have been experimenting with ath-next-test branch for running various
tests. So I'm planning to change the ath10k patch flow to this:

1. patch gets posted to the mailing lists

2. patch is immediately applied to ath-next-test

3. waiting two business days for patch being under review (unless the patch
   is urgent)

4. if no comments or warnings, the patch is applied to ath-next branch

5. ath-next is merged to master branch

6. ath-next pull requests are sent once a week (or so)

Thoughts?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
