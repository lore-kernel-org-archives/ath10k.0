Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F9FC4345F
	for <ath10k@archiver.kernel.org>; Tue, 16 Apr 2024 12:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WqKKGz/njguKbCKjpmwFj1fH/+/+JzOG+0xPE0aUZQE=; b=mamwAFr0XTPC3M7wXD07j/kRJo
	IybQJPwSxND7M7AVAbf0PJrdXqtAm3cLbhZcqvpz93rr6WXA3cy9+zujVLJtmFgqisepVWYE7pugf
	nqu2ZdUDnUKmwSqM4MnmuI07tuwwUgRWLe7sdlt/c96V+oGob++/w3LIkXQWS6vNg1vgQAd58cfVe
	Xb201ECLmL3bAMl1JA3Ymho/m7OMlk0lXeT/yEHVt8EWia01aYLcrrrqS2DCVwkDEZSBqclXuc04g
	ZBZ2alEParq7kVGTnhEqhVBCMgbv7DETdYjWKpE81jHXbGGSbFKi3zNRJH+Tyz8KsEVOu3cyDWxYf
	O2hHZJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwhw2-0000000C8JK-0Bil;
	Tue, 16 Apr 2024 12:29:14 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwhvy-0000000C8Gm-0FA7
	for ath10k@lists.infradead.org;
	Tue, 16 Apr 2024 12:29:13 +0000
Received: from [10.0.98.87] (unknown [212.201.152.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0EC6D61E5FE35;
	Tue, 16 Apr 2024 14:28:45 +0200 (CEST)
Message-ID: <6689d445-af96-47eb-bcb5-eb096a77f084@molgen.mpg.de>
Date: Tue, 16 Apr 2024 14:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: ath10k: Rekeying PTK for STA 10:06:ed:15:ac:6c but driver can't
 safely do that.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_052910_411719_FB4B7198 
X-CRM114-Status: UNSURE (   4.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Dear Linux folks,


In a research institution using *eduroam*, I noticed on Dell XPS 13 9360 
with Debian sid/unstable

     $ lspci -nn -s 3a:00.0 -v
     3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 
802.11ac Wireless Network Adapter [168c:003e] (rev 32)
         Subsystem: Rivet Networks Killer Wireless-n/a/ac 1535 Wireless 
Network Adapter [1a56:1535]
         Flags: bus master, fast devsel, latency 0, IRQ 137
         Memory at dc000000 (64-bit, non-prefetchable) [size=2M]
         Capabilities: <access denied>
         Kernel driver in use: ath10k_pci
         Kernel modules: ath10k_pci

that the Wireless connection dropped for a short time, and then 
reconnected again. Linux 6.9-rc3+ warns:

     [73861.687754] Rekeying PTK for STA 10:06:ed:15:ac:6c but driver 
can't safely do that.

According to the logs since March 2024, this never happened in other 
environments.

With wpa_supplicant logs:

```
[73862.470842] wpa_supplicant[595]: wlp58s0: CTRL-EVENT-EAP-STARTED EAP 
authentication started
[73862.485995] wpa_supplicant[595]: wlp58s0: 
CTRL-EVENT-EAP-PROPOSED-METHOD vendor=0 method=25 -> NAK
[73862.499998] wpa_supplicant[595]: wlp58s0: 
CTRL-EVENT-EAP-PROPOSED-METHOD vendor=0 method=21
[73862.500424] wpa_supplicant[595]: wlp58s0: CTRL-EVENT-EAP-METHOD EAP 
vendor 0 method 21 (TTLS) selected
[…]
[73862.624544] wpa_supplicant[595]: wlp58s0: CTRL-EVENT-EAP-SUCCESS EAP 
authentication completed successfully
[73862.626116] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:17:9b:6c 0
[73862.626436] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:1a:45:8c 0
[73862.626723] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:19:6f:8c 0
[73862.626972] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:19:f1:0c 0
[73862.627211] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:15:ac:63 0
[73862.627435] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:19:82:6c 0
[73862.627699] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:17:9b:63 0
[73862.627911] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:19:f1:03 0
[73862.628245] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:19:6f:83 0
[73862.628451] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:17:de:0c 0
[73862.628645] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-REMOVED 
10:06:ed:15:ac:6c 0
[73862.628863] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:15:ac:6c 0
[73862.668477] wpa_supplicant[595]: wlp58s0: WPA: Key negotiation 
completed with 10:06:ed:15:ac:6c [PTK=CCMP GTK=CCMP]
[73861.687754] kernel: Rekeying PTK for STA 10:06:ed:15:ac:6c but driver 
can't safely do that.
[73864.676479] kernel: wlp58s0: disassociated from 10:06:ed:15:ac:6c 
(Reason: 15=4WAY_HANDSHAKE_TIMEOUT)
[73865.736655] wpa_supplicant[595]: wlp58s0: CTRL-EVENT-DISCONNECTED 
bssid=10:06:ed:15:ac:6c reason=15
[73865.738236] wpa_supplicant[595]: wlp58s0: CTRL-EVENT-REGDOM-CHANGE 
init=CORE type=WORLD
[73865.743914] NetworkManager[37941]: <info>  [1713258751.9001] device 
(wlp58s0): supplicant interface state: completed -> disconnected
[73865.745206] NetworkManager[37941]: <info>  [1713258751.9002] device 
(p2p-dev-wlp58s0): supplicant management interface state: completed -> 
disconnected
[73865.843396] NetworkManager[37941]: <info>  [1713258751.9996] device 
(wlp58s0): supplicant interface state: disconnected -> scanning
[73865.843901] NetworkManager[37941]: <info>  [1713258751.9997] device 
(p2p-dev-wlp58s0): supplicant management interface state: disconnected 
-> scanning
[73866.738215] wpa_supplicant[595]: wlp58s0: CTRL-EVENT-REGDOM-CHANGE 
init=BEACON_HINT type=UNKNOWN
[73870.738803] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:17:9b:6c 0
[73870.757221] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:1a:45:8c 0
[73870.757717] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:15:ac:63 0
[73870.758043] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:17:9b:63 0
[73870.760797] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:19:f1:03 0
[73870.761195] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:19:6f:8c 0
[73870.761530] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:19:6f:83 0
[73870.761817] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:19:f1:0c 0
[73870.762121] wpa_supplicant[595]: wlp58s0: PMKSA-CACHE-ADDED 
10:06:ed:17:de:0c 0
[73870.795881] wpa_supplicant[595]: wlp58s0: SME: Trying to authenticate 
with 10:06:ed:17:9b:6c (SSID='eduroam' freq=5280 MHz)
[73869.865071] kernel: wlp58s0: authenticate with 10:06:ed:17:9b:6c 
(local address=9c:b6:d0:d1:6a:b1)
[73869.865097] kernel: wlp58s0: send auth to 10:06:ed:17:9b:6c (try 1/3)
[73869.866808] kernel: wlp58s0: authenticated
[73870.869552] wpa_supplicant[595]: wlp58s0: Trying to associate with 
10:06:ed:17:9b:6c (SSID='eduroam' freq=5280 MHz)
[73869.916978] kernel: wlp58s0: associate with 10:06:ed:17:9b:6c (try 1/3)
[73869.922533] kernel: wlp58s0: RX AssocResp from 10:06:ed:17:9b:6c 
(capab=0x1111 status=0 aid=4)
[73869.928849] kernel: wlp58s0: associated
[73870.889860] wpa_supplicant[595]: wlp58s0: Associated with 
10:06:ed:17:9b:6c
[73870.890342] wpa_supplicant[595]: wlp58s0: 
CTRL-EVENT-SUBNET-STATUS-UPDATE status=0
```

Could something done about that or is it a hardware limitation?


Kind regards,

Paul

