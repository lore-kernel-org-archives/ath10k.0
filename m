Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePeE3-0003nq-0o
 for ath10k@lists.infradead.org; Fri, 15 Dec 2017 00:51:45 +0000
Received: by mail-qk0-x22d.google.com with SMTP id b184so8557370qkc.13
 for <ath10k@lists.infradead.org>; Thu, 14 Dec 2017 16:51:21 -0800 (PST)
MIME-Version: 1.0
From: Adam Porter <porter.adam@gmail.com>
Date: Thu, 14 Dec 2017 16:51:19 -0800
Message-ID: <CAFR5RwQrUyMgSawp0NNfYa+i6SB4_CPf4NqZc08TJaFkdWrnBA@mail.gmail.com>
Subject: QCA6174-SDIO WMI Credit Exhaustion
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

I'm using a fairly recent version of ath10k from kernel-backports,
along with necessary patches from the ath10k-pending-sdio-usb branch.

I have an older firmware for this card, of unknown origins, but it's
been working quite well with ath10k-sdio. ath10k reports the
abi_version of this mystery firmware to be 344. The firmware appears
to have a memory leak, so I got my hands on a newer firmware.

This new firmware is marked WLAN.RMH.4.1.1-00014-QCARMSWPZ-1, ath10k
says abi_version 467

ath10k is able to talk to this firmware, but when I try to bring up my
wlan0 interface, things start timing out due to credit exhaustion:


[   72.041885] ath10k_sdio mmc0:0001:1: htt target version 3.47
[   72.041900] ath10k_sdio mmc0:0001:1: htt h2t aggr cfg msg amsdu 3 ampdu 64
[   72.041949] ath10k_sdio mmc0:0001:1: sdio write addr 0x12f00 buf
0xffffffc01b4a5580 len 256
[   72.041957] ath10k_sdio mmc0:0001:1:
ath10k_htc_notify_tx_completion: ep 1 skb ffffffc01c1aea00
[   72.042242] ath10k_sdio mmc0:0001:1: wmi tlv pktlog disable
[   72.042293] ath10k_sdio mmc0:0001:1: sdio write addr 0x12f00 buf
0xffffffc01b4a53c0 len 256
[   72.042301] ath10k_sdio mmc0:0001:1:
ath10k_htc_notify_tx_completion: ep 1 skb ffffffc01cdee900
[   72.042316] ath10k_sdio mmc0:0001:1: htc ep 2 consumed 1 credits (total 2)
[   72.042329] ath10k_sdio mmc0:0001:1: wmi tlv pdev set param
[   72.042377] ath10k_sdio mmc0:0001:1: sdio write addr 0x1c700 buf
0xffffffc01b4a5200 len 256
[   72.042384] ath10k_sdio mmc0:0001:1:
ath10k_htc_notify_tx_completion: ep 2 skb ffffffc01c1af100
[   72.042400] ath10k_sdio mmc0:0001:1: htc ep 2 consumed 1 credits (total 1)
[   72.042411] ath10k_sdio mmc0:0001:1: wmi tlv pdev set param
[   72.042457] ath10k_sdio mmc0:0001:1: sdio write addr 0x1c700 buf
0xffffffc01b4a5040 len 256
[   72.042464] ath10k_sdio mmc0:0001:1:
ath10k_htc_notify_tx_completion: ep 2 skb ffffffc01b423b00
[   72.042479] ath10k_sdio mmc0:0001:1: htc ep 2 consumed 1 credits (total 0)
[   72.042491] ath10k_sdio mmc0:0001:1: wmi tlv adaptive qcs 1
[   72.042538] ath10k_sdio mmc0:0001:1: sdio write addr 0x1c700 buf
0xffffffc01b4a4e80 len 256
[   72.042545] ath10k_sdio mmc0:0001:1:
ath10k_htc_notify_tx_completion: ep 2 skb ffffffc01c1af100
[   72.042560] ath10k_sdio mmc0:0001:1: htc insufficient credits ep 2
required 1 available 0
[   72.042568] ath10k_sdio mmc0:0001:1: htc insufficient credits ep 2
required 1 available 0
[   75.236012] ath10k_sdio mmc0:0001:1: htc insufficient credits ep 2
required 1 available 0

I'm not sure where to begin troubleshooting this issue. Could anyone
point me in the right direction?

Thank you,
Adam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
