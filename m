Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x22c.google.com ([2607:f8b0:4003:c0f::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciLFT-0007Ig-2Q
 for ath10k@lists.infradead.org; Mon, 27 Feb 2017 13:21:57 +0000
Received: by mail-ot0-x22c.google.com with SMTP id w44so51359465otw.2
 for <ath10k@lists.infradead.org>; Mon, 27 Feb 2017 05:21:34 -0800 (PST)
MIME-Version: 1.0
From: Chris Price <chris.price@dejero.com>
Date: Mon, 27 Feb 2017 08:21:33 -0500
Message-ID: <CALJ2kaEcr6EL5gHye4U-qABapGZ9C3R70NB0dZiSTEs0kqKaMA@mail.gmail.com>
Subject: 4.9 Kernel panic on ACS and intermittent ability to host AP
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

I'm working with a QCA6174 chipset on a vanilla 4.9 kernel.

I'm using the firmware from
https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git

The card presents as follows:
root@debian:~# lspci -v
02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
Network Adapter (rev 32)
Subsystem: AzureWave QCA6174 802.11ac Wireless Network Adapter
Flags: bus master, fast devsel, latency 0, IRQ 324
Memory at df000000 (64-bit, non-prefetchable) [size=2M]
Capabilities: [40] Power Management version 3
Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
Capabilities: [70] Express Endpoint, MSI 00
Capabilities: [100] Advanced Error Reporting
Capabilities: [148] Virtual Channel
Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
Capabilities: [178] Latency Tolerance Reporting
Capabilities: [180] L1 PM Substates
Kernel driver in use: ath10k_pci
Kernel modules: ath10k_pci

I wish to host a 5GHz AP. My hostapd.conf file is as follows.
root@debian:~# cat /etc/hostapd/hostapd1.conf
interface=ap1
driver=nl80211
hw_mode=a
channel=0
ieee80211d=1
country_code=CA
ieee80211ac=1
ssid=test5
auth_algs=1
wpa=2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=testtest

When I try to start the AP, I either get the following output, or a
kernel panic.
root@debian:~# hostapd /etc/hostapd/hostapd1.conf
Configuration file: /etc/hostapd/hostapd1.conf
ap1: interface state UNINITIALIZED->COUNTRY_UPDATE
ACS: Automatic channel selection started, this may take a bit
ap1: interface state COUNTRY_UPDATE->ACS
ap1: ACS-STARTED
ACS: Unable to collect survey data
ACS: All study options have failed
Interface initialization failed
ap1: interface state ACS->DISABLED
ap1: AP-DISABLED
ACS: Possibly channel configuration is invalid, please report this
along with your config file.
ACS: Failed to start
ap1: AP-DISABLED
hostapd_free_hapd_data: Interface ap1 wasn't started
nl80211: deinit ifname=ap1 disabled_11b_rates=0
ap1: interface state DISABLED->DISABLED
ap1: interface state DISABLED->DISABLED
ap1: AP-DISABLED
hostapd_free_hapd_data: Interface ap1 wasn't started

Here (http://pasteboard.co/DnVQHOycK.jpg) is a picture of the panic I
get otherwise.

I am occasionally able to start an access point if I pin the channel
to 36. Otherwise, I get the following.
root@debian:~# hostapd /etc/hostapd/hostapd1.conf
Configuration file: /etc/hostapd/hostapd1.conf
ap1: interface state UNINITIALIZED->COUNTRY_UPDATE
ap1: IEEE 802.11 Configured channel (36) not found from the channel
list of current mode (2) IEEE 802.11a
ap1: IEEE 802.11 Hardware does not support configured channel
Could not select hw_mode and channel. (-3)
ap1: interface state COUNTRY_UPDATE->DISABLED
ap1: AP-DISABLED
ap1: interface state DISABLED->DISABLED
ap1: AP-DISABLED
hostapd_free_hapd_data: Interface ap1 wasn't started
nl80211: deinit ifname=ap1 disabled_11b_rates=0

This latter problem, I suspect, is somehow related to interface
combinations, because I have never seen the card work when I create
multiple interfaces.

Any help would be appreciated.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
