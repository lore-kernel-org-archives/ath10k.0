Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailfront3.rz.tu-bs.de ([134.169.12.134] helo=tu-bs.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRIFn-00032M-IM
 for ath10k@lists.infradead.org; Mon, 17 Aug 2015 11:07:00 +0000
Received: from [134.169.70.86] (account hanharms@tu-braunschweig.de
 [134.169.70.86] verified)
 by tu-braunschweig.de (CommuniGate Pro SMTP 6.1.2)
 with ESMTPA id 39522661 for ath10k@lists.infradead.org;
 Mon, 17 Aug 2015 13:06:27 +0200
Message-ID: <55D1C02F.4010005@tu-bs.de>
Date: Mon, 17 Aug 2015 13:06:23 +0200
From: "Harms, Hannes" <hannes.harms@tu-bs.de>
MIME-Version: 1.0
Subject: Unable to set channel above 100 with latest CT Kernel and Firmware
References: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
 <1439738757-29199-4-git-send-email-me@bobcopeland.com>
In-Reply-To: <1439738757-29199-4-git-send-email-me@bobcopeland.com>
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


Hi,

I am trying to set up the latest Kernel (4.2rc6) and firmware 
(10.1.467-ct-14) form Candela for a 5Ghz network.
Unfortunately I am not able to set channels above 100, although 
regulatory domain is set to DE.
Maybe someone has an advice what is going wrong?

Regards
Hannes

My configuration:

Debian with Kernel 4.2-rc6  form Candela (self compiled)
Firmware: 10.1.467-ct-14

iw reg get
country DE: DFS-ETSI
     (2400 - 2483 @ 40), (N/A, 20), (N/A)
     (5150 - 5250 @ 80), (N/A, 20), (N/A), NO-OUTDOOR
     (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
     (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
     (57000 - 66000 @ 2160), (N/A, 40), (N/A)

iw list
     Frequencies:
             * 5180 MHz [36] (17.0 dBm)
             * 5200 MHz [40] (17.0 dBm)
             * 5220 MHz [44] (17.0 dBm)
             * 5240 MHz [48] (17.0 dBm)
             * 5260 MHz [52] (20.0 dBm) (no IR, radar detection)
               DFS state: usable (for 550 sec)
               DFS CAC time: 60000 ms
             * 5280 MHz [56] (20.0 dBm) (no IR, radar detection)
               DFS state: usable (for 550 sec)
               DFS CAC time: 60000 ms
             * 5300 MHz [60] (20.0 dBm) (no IR, radar detection)
               DFS state: usable (for 550 sec)
               DFS CAC time: 60000 ms
             * 5320 MHz [64] (20.0 dBm) (no IR, radar detection)
               DFS state: usable (for 550 sec)
               DFS CAC time: 60000 ms
             * 5500 MHz [100] (disabled)
             * 5520 MHz [104] (disabled)
             * 5540 MHz [108] (disabled)
             * 5560 MHz [112] (disabled)
             * 5580 MHz [116] (disabled)
             * 5600 MHz [120] (disabled)
             * 5620 MHz [124] (disabled)
             * 5640 MHz [128] (disabled)
             * 5660 MHz [132] (disabled)
             * 5680 MHz [136] (disabled)
             * 5700 MHz [140] (disabled)
             * 5720 MHz [144] (disabled)
             * 5745 MHz [149] (disabled)
             * 5765 MHz [153] (disabled)
             * 5785 MHz [157] (disabled)
             * 5805 MHz [161] (disabled)
             * 5825 MHz [165] (disabled)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
