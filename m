Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from thunder.iei.com.tw ([122.147.228.153])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dN8kG-0007yE-7u
 for ath10k@lists.infradead.org; Tue, 20 Jun 2017 02:18:21 +0000
Received: from exchange-2007.ieinet.org ([172.16.2.151])
 by Thunder.iei.com.tw with ESMTP id v5K2I2pB046023
 for <ath10k@lists.infradead.org>; Tue, 20 Jun 2017 10:18:02 +0800 (GMT-8)
 (envelope-from mingmintang@ieiworld.com)
From: Mingmin Tang <mingmintang@ieiworld.com>
Subject: QCA6174A Bluetooth HSP could not work
Date: Tue, 20 Jun 2017 10:18:24 +0800
Message-ID: <000a01d2e96b$7e82a7b0$7b87f710$@com>
MIME-Version: 1.0
Content-Language: zh-tw
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: mingmintang@ieiworld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

OS: lubuntu 17.04
Headphone: SONY SBH60
Bluetooth Module: AW-CB260NF(QCA6174A)

No error message when select A2DP and HSP/HFP profile in pavucontrol.
A2DP: work ok.
HSP/HFP: Input and output devices could be shown in pavucontrol, but they
don't have volume meter bar.
The media player would stop(like waiting bluetooth device) when playing
audio by hsp.

Test other bluetooth module(Intel 7260HMW, Realtek RTL8821ae), A2DP and
HSP/HFP profile all work ok.
It seems like firmware or driver issue of QCA6174A.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
