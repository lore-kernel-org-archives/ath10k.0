Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyjye-0006NY-RK
 for ath10k@lists.infradead.org; Mon, 15 Jul 2013 14:42:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: ath10k: qca98xx hw1.0 will become unsupported
Date: Mon, 15 Jul 2013 17:41:39 +0300
Message-ID: <87hafvopgc.fsf@kamboji.qca.qualcomm.com>
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

Soon I will change qca98xx hw1.0 support to ath10k as unsupported and
later on I will remove hw1.0 support entirely. I have been told that
there won't be that many hw1.0 devices available and most of the devices
will be newer hw2.0. I know this is very unfortunate for many but the
amount of work compared to the benefits is just too much for us. It's
better that we focus on improving ath10k rather than wasting time on
keeping hw1.0 properly supported.

And actually it will be easier to try get hw2.0 devices to people than
trying to support hw1.0. So anyone testing qca98xx hw1.0 on ath10k
should email to ath10k-devel@qca.qualcomm.com and request qca98xx hw2.0
Mini PCIe boards with this information:

Name:
Email:
Shipping address:
Justification/use cases:

As it's quite a lot of work to ship boards I'm not making any promises
here! This is still under investigation, but I'm still hopeful we can
send some after everything is sorted out. Also we'll try to prioritise
people who are active on the Linux wireless community.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
