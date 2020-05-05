Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVtDt-0000cf-6Q
 for ath10k@lists.infradead.org; Tue, 05 May 2020 08:46:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id h9so1739563wrt.0
 for <ath10k@lists.infradead.org>; Tue, 05 May 2020 01:46:39 -0700 (PDT)
Received: from neumann (ip-217-105-26-61.ip.prioritytelecom.net.
 [217.105.26.61])
 by smtp.gmail.com with ESMTPSA id s12sm2498870wmc.7.2020.05.05.01.46.36
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 01:46:36 -0700 (PDT)
Message-ID: <0655c3a1466f133a727ab24aec9bb3df81b25d34.camel@gmail.com>
Subject: Killer WiFi card keeps disconnecting due to latest firmware
From: Elia Geretto <elia.f.geretto@gmail.com>
Date: Tue, 05 May 2020 10:46:35 +0200
MIME-Version: 1.0
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

Hi,

I am experiencing the same problem that Nicola Mori reported on 14th
April. The thread I am referring to is the one with the same subject as
this email.

From what I can understand, Kalle Valo and Wen Gong are trying to
reproduce the problem, but they had difficulties retrieving the correct
hardware. Since I can reproduce the issue with a different router,
probably easier to retrieve, I thought I would dump the information
here.

I have the exact same laptop as Nicola Mori, an XPS 15 9570 and I am
running Fedora 31 (kernel 5.6.8).

The wifi card is reported as:

3b:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter (rev 32)
	Subsystem: Bigfoot Networks, Inc. Device 1535
	Kernel driver in use: ath10k_pci
	Kernel modules: ath10k_pci

I have tried switching in and out a couple of firmwares with API 6 and
I can reproduce the problem with all the versions I tested:

WLAN.RM.4.4.1-00128-QCARMSWPZ-1
WLAN.RM.4.4.1-00132-QCARMSWP-1
WLAN.RM.4.4.1-00140-QCARMSWPZ-1 (default one on Fedora 31)
WLAN.RM.4.4.1-00151-QCARMSWPZ-2

Regarding the router, it is a Linksys E2500 v3, with firmware 3.0.05
(latest). I use both 2.4 GHz and 5 GHz wireless, with the same SSID.

As for the information regarding the wifi settings:
- Channel: Auto (DFS)
- Channel width: Auto (20 MHz or 40 MHz)
- Encryption: WPA2-Personal

Regarding reproduction, I would like to add that the issue happens
quite rarely. Using my laptop the whole day at max 4 meters from the
router, it happens only once or twice a day.

In addition, when I am unable to start new connections, and
applications like Zoom are still running perfectly, I can work around
the issue not only by disabling and re-enabling the wifi, but also
pinging my laptop from another device in the network. To clarify, when
I am experiencing the issue, if I ping my laptop from my phone, it
starts working correctly again.

I am not sure if this is related, but it happens often, but not
exclusively, when I am using Zoom for videoconferencing. However, I
cannot confirm that it is the cause.

Feel free to contact me for any additional information you may need.

Kind regards,
Elia Geretto


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
