Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out04.msg.oleane.net ([62.161.7.2])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6Kuh-00020I-W5
 for ath10k@lists.infradead.org; Tue, 08 Dec 2015 16:14:53 +0000
Received: from smtp02.msg.oleane.net (smtp02.mail.priv [172.17.20.111]) 
 by smtp-out04.msg.oleane.net with ESMTP id tB8FkMt0024121
 for <ath10k@lists.infradead.org>; Tue, 8 Dec 2015 16:46:22 +0100
Content-class: urn:content-classes:message
Subject: ATH10K VLAN firmware issue
Date: Tue, 8 Dec 2015 15:29:24 +0100
MIME-Version: 1.0
Message-ID: <773DB8A82AB6A046AE0195C68612A31901C5B293@sbs2003.acksys.local>
From: "Cedric VONCKEN" <cedric.voncken@acksys.fr>
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
To: ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>

	I'm testing to transmit frame with 802.1q tag (VLAN).

	My client is set in STA + WDS and the netdev is bridged with
eth0.
	I have a computer with vlan configuration set connected to the
STA eth0.

	If I try to transmit frames with 802.1q tag, the frames are not
sent.
	I checked with wireless sniffer, and I don't see the frame with
VLAN tag (the frames without VLAN tag are sent).

	I tested with firmware 10.2.4.70.14-2 from kale github,
10.1.467-ct-com-full-015 from candelatech and 10.2.4.70-2 from openwrt,
and in all cases I have the same issue.

	Thanks for your help.

	

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
