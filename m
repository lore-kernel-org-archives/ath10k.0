Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIxFO-00062h-QQ
 for ath10k@lists.infradead.org; Thu, 08 Jun 2017 13:13:13 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 350FB20CC5
 for <ath10k@lists.infradead.org>; Thu,  8 Jun 2017 09:12:45 -0400 (EDT)
Message-Id: <1496927565.1136420.1002909792.554D7C36@webmail.messagingengine.com>
From: am_dxer@fastmail.fm
MIME-Version: 1.0
Date: Thu, 08 Jun 2017 09:12:45 -0400
Subject: QCA6174 hw2.1 firmware crash after deauthenticating from a network
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
There are a few bugs on the linux bug tracker relating to this. Just
thought I would post this to the list as they all look quite alike. I am
hoping someone on this list understands the nature of the issue.
https://bugzilla.kernel.org/show_bug.cgi?id=193141
https://bugzilla.kernel.org/show_bug.cgi?id=195487
https://bugzilla.kernel.org/show_bug.cgi?id=195987

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
