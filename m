Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5lcu-0003tx-Tc
 for ath10k@lists.infradead.org; Sat, 21 Oct 2017 04:43:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: rebuild crypto header in RX data frames
Date: Sat, 21 Oct 2017 04:42:44 +0000
Message-ID: <877evpdscc.fsf@kamboji.qca.qualcomm.com>
References: <150851690590.5158.11970481736247725763.stgit@potku.adurom.net>
 <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
 <CAGyitvP0wquoo_8_ma3rcj+riJ5Wgfo7+pmbUOx9pQRwFcQHYA@mail.gmail.com>
In-Reply-To: <CAGyitvP0wquoo_8_ma3rcj+riJ5Wgfo7+pmbUOx9pQRwFcQHYA@mail.gmail.com>	(Jasmine
 Strong's message of "Fri, 20 Oct 2017 17:34:09 -0700")
Content-Language: en-US
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
To: Jasmine Strong <jas@eero.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

Jasmine Strong <jas@eero.com> writes:

> When we tried this patch, it completely broke all wpa2-ccmp-aes
> traffic.

Which patch, Vasanth's or Sebastian's? I even tested myself, with both
CCMP and TKIP on both AP and client modes, and didn't see see any
problems. What kind of setup you have?

I tested on a x86 laptop and current ath.git master branch:

ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 1 testmode 1
ath10k_pci 0000:02:00.0: firmware ver 10.2.4.70.66 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 c2dd2ad5
ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08

And my hostapd.conf:

driver=nl80211
hw_mode=a
channel=36
ieee80211n=1
interface=wlan0
ctrl_interface=/var/run/hostapd
ctrl_interface_group=adm
ssid=test-psk
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
wpa_passphrase=12345678


-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
