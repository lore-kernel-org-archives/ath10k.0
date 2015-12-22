Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from exchange.luceor.com ([178.33.245.144])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aBKor-0007WP-5X
 for ath10k@lists.infradead.org; Tue, 22 Dec 2015 11:09:30 +0000
From: Simon Malthieu <simon.malthieu@luceor.com>
Subject: PTK rekeying bug
Message-ID: <56792F52.10406@luceor.com>
Date: Tue, 22 Dec 2015 12:09:06 +0100
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

  Hi,

I have a bug with PTK rekeying, when I set this option in hostapd : 
wpa_ptk_rekey, the first PTK handshake goes well at the start of the 
connection (AP-STA), but after the rekey (The 4-way EAPOL handshake goes 
well), all the packets sent by the STA are truncated of 16 Bytes. For 
example with a ping I can see at the reception that all the ICMP packets 
have 16 Bytes less, but also the ARP packets.

They are well decrypted by the AP though. At the second rekey, the ptk 
handshake doesn't work because the EAPOL packets are truncated, hostapd 
says 'frame too short for this IEEE 802.1X packets' and disconnects the STA.

With a 3rd radio I can tell that the packets are truncated also in the 
air so it must be a STA problem. With the htt_dump (on the STA) debug 
option of ath10k I can tell that the packets are not altered here, the 
frames are ok

The problem still exists with latest compat-wireless (2015-12-03) and 
latest QCA988X firmware  : firmware-5.bin_10.2.4.70.15-2

I am using two compex cards (WLE900VX).

Thanks in advance for the help.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
