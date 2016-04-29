Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailfront3.rz.tu-bs.de ([134.169.12.134] helo=tu-bs.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awAiP-0004dH-8n
 for ath10k@lists.infradead.org; Fri, 29 Apr 2016 15:52:26 +0000
Received: from [134.169.70.109] (account hanharms@tu-braunschweig.de
 [134.169.70.109] verified)
 by tu-braunschweig.de (CommuniGate Pro SMTP 6.1.10f)
 with ESMTPA id 45906046 for ath10k@lists.infradead.org;
 Fri, 29 Apr 2016 17:51:57 +0200
From: "Harms, Hannes" <hannes.harms@tu-bs.de>
Subject: ath10k IBSS and A-MSDU throuput
Message-ID: <5723831A.7010607@tu-bs.de>
Date: Fri, 29 Apr 2016 17:51:54 +0200
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

Hi everyone,

I have set up two Compex WLE900 in ad-hoc mode, 80MHz channel width, channel 100.
I am using kernel 3.17 from Gateworks for imx6 and
my own compat_wirless (4.4.2) with all patches from Candela for ath10k and all patches for mac80211 from the
Candela 4.4 kernel tree.
  
The upload for TCP is about 200 MBit/s and the download is about 250 MBit/s, tested with iperf3.

Now I am trying to enable A-MSDU as described in the firmware release 10.1.467-ct-15 from Candela,
but I can not measure anydifference  in throughput.

Could anyone confirm that A-MSDU is really working with IBSS?

Best Regards
Hannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
