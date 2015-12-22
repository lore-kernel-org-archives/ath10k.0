Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.argela.com.tr ([95.0.156.7] helo=exch-ist.argela.com.tr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aBOEm-0007kP-4j
 for ath10k@lists.infradead.org; Tue, 22 Dec 2015 14:48:28 +0000
From: Onur Eker <Onur.Eker@argela.com.tr>
Subject: IBSS mode performance degradation
Date: Tue, 22 Dec 2015 14:48:04 +0000
Message-ID: <431D237B1EA07F49A28D2D0F9FA079EF95DC6363@exch-ist.argela.com.tr>
Content-Language: tr-TR
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

During my tests on more than 2 nodes in IBSS mode, I find out that switching off a node degrades other nodes' communications. My setup is as follows:

Phy: more than 2 nodes in IBSS mode at VHT-80, same channel, same BSSI
Nodes: 20151203 compat-wireless backports, '636' firmware, openwrt trunk, QCA9880 v2 (archer c7)
All nodes can communicate each other directly, forwarding/routing is not active.

When any of these nodes are switched off via power off or interface down, communication between other nodes are almost cut off for at least a minute (i.e. unstable very high ping values between nodes).

Thanks,
Onur

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
