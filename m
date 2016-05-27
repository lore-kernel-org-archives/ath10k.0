Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from msr9.hinet.net ([168.95.4.109])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6EiU-00015W-9x
 for ath10k@lists.infradead.org; Fri, 27 May 2016 10:10:07 +0000
Received: from [192.168.1.105] (111-242-160-209.dynamic.hinet.net
 [111.242.160.209])
 by msr9.hinet.net (8.14.9/8.14.9) with ESMTP id u4RA9am7003238
 for <ath10k@lists.infradead.org>; Fri, 27 May 2016 18:09:39 +0800 (CST)
From: Horse <horse@gentrice.net>
Subject: Bring VLAN tag over IBSS mode
Message-ID: <93e52ca7-4fc8-8bcc-b0fd-edb8350946d9@gentrice.net>
Date: Fri, 27 May 2016 18:09:33 +0800
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Has any one tried to bring VLAN tag packet over IBSS mode?
i have tried ath10k with 9980.
in the TX side, i can sure it's ok.
However, in RX side, seems the packet will be modify in the firmware if 
vlan type(0x8100) is assigned.
Any one has the same question?

Best regards,

Horse


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
