Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f177.google.com ([209.85.223.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZN2Bg-0005UU-Kv
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 17:09:10 +0000
Received: by ioeg141 with SMTP id g141so55786424ioe.3
 for <ath10k@lists.infradead.org>; Wed, 05 Aug 2015 10:08:45 -0700 (PDT)
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com.
 [209.85.223.173])
 by smtp.gmail.com with ESMTPSA id rs4sm4063737igb.13.2015.08.05.10.08.44
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Aug 2015 10:08:44 -0700 (PDT)
Received: by ioea135 with SMTP id a135so55816593ioe.1
 for <ath10k@lists.infradead.org>; Wed, 05 Aug 2015 10:08:44 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 5 Aug 2015 10:08:44 -0700
Message-ID: <CALCDuF=3pR96tAD=ZZ_i1Nh88bMXdvU26sVD8i6OuKcgR3ctBQ@mail.gmail.com>
Subject: Simultaneous hostapd and wpa_supplicant on QCA9880
From: Ann Lo <annlo@ieee.org>
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

Hello,

Has anyone succeeded in running hostapd and wpa_supplicant at the same
time on a single QCA9880? I have not been able to. Does anyone have any
luck with this?

The software/firmware I use:

- Linux kernel 3.16.0-34-generic
- firmware-2 version 10.1.467.2-1
- wpa_supplicant version 2.1
- hostapd version 2.4

Configuration:

- iw dev wlan4 interface add clientwlan type managed
- iw dev wlan4 interface add apwlan type __ap
- ip link set clientwlan address 04:f0:21:16:04:b0
- ip link set apwlan address 04:f0:21:16:04:b1
- ifconfig clientwlan up
- ifconfig apwlan up 10.0.0.1 netmask 255.255.255.0
- wpa_supplicant -iclientwlan -Dnl80211 -c wpa.test.conf
- hostapd -d hostapd-test.conf
- Both wpa_supplicant and hostapd use the same channel.

Problems:

(1) If wpa_supplicant is executed before hostapd, wpa_supplicant comes
     up OK but hostapd fails with the following errors:
     - nl80211: Beacon set failed: -16 (Device or resource busy)
     - Failed to set beacon parameters

(2) If hostapd is executed before wpa_supplicant, hostapd comes up OK
     but wpa_supplicant fails with the following errors:
     - nl80211: send_and_recv->nl_recvmsgs failed: -33
     - clientwlan: SME: Trying to authenticate with 00:03:07:12:34:56
(SSID='dd-wrt-ath1' freq=5220 MHz)
     - clientwlan: SME: Authentication request to the driver failed

Using the same configuration files, wpa_supplicant is able to connect
to the remote AP if hostapd is not executed. Similarly, hostapd is able
to provide service to the remote client if wpa_supplicant is not executed.
I have also tried configurations without any security. Same errors as
above when running hostapd and wpa_supplicant at the same time.

I have exhausted all information I could find from the web. According
to this link (http://www.candelatech.com/vsta.php), there is the
suggestion that HW encryption cannot work with multiple virtual
interfaces. In one of my tests, I have disabled security altogether by
using "key_mgmt=NONE" in the configuration file for wpa_supplicant.
It is not clear why there continues to be an error "Authentication
request to the driver failed".

Would you provide your expert opinions on this matter if you have the
experience?

Thanks,
Ann

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
