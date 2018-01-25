Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eemwE-0005Ox-3w
 for ath10k@lists.infradead.org; Thu, 25 Jan 2018 19:11:55 +0000
Received: by mail-lf0-x231.google.com with SMTP id o89so11153163lfg.10
 for <ath10k@lists.infradead.org>; Thu, 25 Jan 2018 11:11:40 -0800 (PST)
MIME-Version: 1.0
From: Adam Porter <porter.adam@gmail.com>
Date: Thu, 25 Jan 2018 11:11:37 -0800
Message-ID: <CAFR5RwTCNV-135E16fXJLECsart-cTjVJq8QcDB3wKH+JrsHnw@mail.gmail.com>
Subject: QCA6174 SDIO crashing after few days
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

Firmware WLAN.RMH.4.1.1-00014-QCARMSWPZ-1

Using branch ath10k-pending-sdio-usb

I'm using this module as an access point. After a while of uptime, it
appears that all communication with the module ceases. Hostapd goes to
disassociate clients due to inactivity, then I see in the log the
resulting failures:

[94216.098042] ath10k_sdio mmc0:0001:1: failed to install key for vdev
0 peer c8:21:58:10:b3:b4: -110
[94219.170075] ath10k_sdio mmc0:0001:1: failed to install key for vdev
0 peer b8:27:eb:f2:52:22: -110
[94219.191719] ath10k_sdio mmc0:0001:1: cipher 0 is not supported
[94219.207948] ath10k_sdio mmc0:0001:1: failed to remove peer wep key 0: -95
[94219.222155] ath10k_sdio mmc0:0001:1: failed to clear all peer wep
keys for vdev 0: -95
[94219.237937] ath10k_sdio mmc0:0001:1: failed to disassociate
station: c8:21:58:10:b3:b4 vdev 0: -95

It seems that I can reproduce this issue faster by connecting more
clients and pushing a lot of throughput. So perhaps this is a resource
leak in the firmware?

I do not see this issue when using qcacld.

I'm not sure how to begin debugging this issue, does anyone have any
advice or suggestions?

Thank you,
Adam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
