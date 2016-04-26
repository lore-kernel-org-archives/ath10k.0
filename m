Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from rudy.puc.rediris.es ([2001:720:418:ca01::132])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av2FM-000576-Cd
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 12:37:45 +0000
Received: from [2001:40b0:7c22:6020:f801:1ea7:5316:eb39] (helo=leo)
 by rudy.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <jose.nunez@cttc.cat>) id 1av2Ev-0007pw-SW
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 14:37:19 +0200
Received: from [10.1.16.14] (pcjnunez.cttc.es [10.1.16.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id 54EA71FE36
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2016 14:36:44 +0200 (CEST)
From: =?UTF-8?B?Sm9zZSBOw7rDsWV6LU1hcnTDrW5leiAoQ1RUQyk=?=
 <jose.nunez@cttc.cat>
Subject: enable 802.11h and 802.11d in IBSS mode
Message-ID: <571F60DE.2010705@cttc.cat>
Date: Tue, 26 Apr 2016 14:36:46 +0200
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi all,
I'm using ath10k in IBSS with 2 wireless cards based on qca988x.
How can I enable DFS (802.11h AND 802.11d) in IBSS mode (I mean there's 
not hostapd.conf file)?

Kernel is 4.2.0+ from CT and firmware is 10.1.467-ct-com-full-014-96d543.

Thanks,
Jose


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
