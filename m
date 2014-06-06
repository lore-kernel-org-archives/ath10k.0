Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm29-vm4.bullet.mail.ne1.yahoo.com ([98.138.91.189])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsxF9-0004o6-Od
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 16:43:52 +0000
Message-ID: <5391EFB0.4080604@yahoo.com>
Date: Fri, 06 Jun 2014 12:43:28 -0400
From: Frank Agius <ftagius@yahoo.com>
MIME-Version: 1.0
Subject: ATH10K set bitrates problem
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

I am unable to set the bitrates for devices using the ath10k driver, 
regardless of the arguments I pass:


# iw wlan0 set bitrates legacy-2.4 6 12 24
command failed: Invalid argument (-22)
# iw dev wlan0 set bitrates mcs-2.4 10
command failed: Invalid argument (-22)


The ath10k drivers were built from stable backports v3.15-rc1.   I am 
using firmware file firmware-2.bin_999.999.0.636


Is this a known issue?


frank agius


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
