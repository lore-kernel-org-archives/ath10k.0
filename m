Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi2KD-0004TA-Hh
 for ath10k@lists.infradead.org; Wed, 07 May 2014 13:55:58 +0000
Received: by mail-wi0-f172.google.com with SMTP id hi2so4993696wib.11
 for <ath10k@lists.infradead.org>; Wed, 07 May 2014 06:55:34 -0700 (PDT)
Received: from marks-mbp-2.lan (markaswift.plus.com. [80.229.19.182])
 by mx.google.com with ESMTPSA id xm20sm31774039wib.19.2014.05.07.06.55.33
 for <ath10k@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Wed, 07 May 2014 06:55:34 -0700 (PDT)
From: "Mark A. Swift" <markaswift@gmail.com>
Subject: Macbook Pro Retina unable to connect - connection timeout
Message-Id: <DFFE9B39-5E70-40C7-929E-5D70F15C771B@gmail.com>
Date: Wed, 7 May 2014 14:55:32 +0100
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello,

I seem to have identified a problem. Running the latest version of ath10k o=
n openwrt I=92m unable to connect on my mid 2012 Macbook Pro Retina. The lo=
g indicates:

Wed May  7 11:46:30 2014 daemon.info hostapd: wlan1: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: disassociated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:30 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:31 2014 daemon.info hostapd: wlan1: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: deauthenticated due to inactivity (timer DEAUTH/REMOVE)
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:33 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:33 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:33 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:38 2014 daemon.info hostapd: wlan1: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: authenticated
Wed May  7 11:46:38 2014 daemon.info hostapd: wlan1: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: associated (aid 2)
Wed May  7 11:46:38 2014 daemon.info hostapd: wlan1: STA 20:c9:d0:43:f5:e7 =
WPA: pairwise key handshake completed (RSN)
Wed May  7 11:46:39 2014 daemon.info dnsmasq-dhcp[3757]: DHCPREQUEST(br-lan=
) 192.168.1.117 20:c9:d0:43:f5:e7 =

Wed May  7 11:46:40 2014 daemon.info dnsmasq-dhcp[3757]: DHCPACK(br-lan) 19=
2.168.1.117 20:c9:d0:43:f5:e7 Marks-MBP-2
Wed May  7 11:51:31 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: disassociated due to inactivity
Wed May  7 11:51:32 2014 daemon.info hostapd: wlan0: STA 20:c9:d0:43:f5:e7 =
IEEE 802.11: deauthenticated due to inactivity (timer DEAUTH/REMOVE)

This was caused by disconnecting from the 2.4Ghz and then trying to connect=
 to the 5Ghz, I then connected back to the 2.4Ghz so that might also be inc=
luded in the log.

The network is running using the 11na and VHT80 variables. All other device=
s connect without issues including, an Edimax 5ghz USB stick, iPad Mini Ret=
ina and 2 Samsung Galaxys.

Any help would be greatly appreciated.
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
