Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from torres.puc.rediris.es ([2001:720:418:ca00::9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAy2c-00051j-Om
 for ath10k@lists.infradead.org; Fri, 03 Jul 2015 10:17:55 +0000
Received: from [84.88.62.208] (helo=leo)
 by torres.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <jose.nunez@cttc.cat>) id 1ZAy2E-00037X-4k
 for ath10k@lists.infradead.org; Fri, 03 Jul 2015 12:17:30 +0200
Received: from [10.1.16.14] (pcjnunez.cttc.es [10.1.16.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id D5CFC1FDBD
 for <ath10k@lists.infradead.org>; Fri,  3 Jul 2015 12:17:25 +0200 (CEST)
Message-ID: <55966139.3090603@cttc.cat>
Date: Fri, 03 Jul 2015 12:17:29 +0200
From: =?UTF-8?B?Ikpvc2UgTsO6w7Flei1NYXJ0w61uZXogKENUVEMpIg==?=
 <jose.nunez@cttc.cat>
MIME-Version: 1.0
Subject: Question on bssid mask with ath10k
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

I'm trying to set BSSID mask in ath10k so that data packets with spoofed 
mac destination address can be received (and not dropped) by the card.

Apparently the way bssid mask is managed has changed from ath5k and 
ath9k since there are not  "ath5k_hw_set_bssid_mask" or 
"ath9k_htc_set_mac_bssid_mask"  kind of functions.

Anyone tried this?

Jose



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
