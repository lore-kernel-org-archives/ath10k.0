Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je0os-0006gq-O6
 for ath10k@lists.infradead.org; Wed, 27 May 2020 18:30:29 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Un-recoverable ath10k 4019 NIC lockup.
Message-ID: <75f092e3-b667-341a-e810-61edd8f089ac@candelatech.com>
Date: Wed, 27 May 2020 11:30:23 -0700
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

While doing a torture test on OpenWrt using ath10k-ct drivers/firmware, the 5Ghz AP fell off the
air.  After debugging, I found this in the console logs.

I am guessing that the only way to recover in this case would be to reboot, but in case someone else
has ideas on additional ways to kick the 4019 chip to have it start responding again, please let me know.


Thu May 14 19:28:22 2020 daemon.info hostapd: wlan0: STA 04:f0:21:9a:16:25 IEEE 802.11: authenticated
Thu May 14 19:28:22 2020 daemon.info hostapd: wlan0: STA 04:f0:21:9a:16:25 IEEE 802.11: associated (aid 6)
Thu May 14 19:28:22 2020 daemon.notice hostapd: wlan0: AP-STA-CONNECTED 04:f0:21:9a:16:25
[ 2539.120581] ath10k_ahb a800000.wifi: bss channel survey timed out
Thu May 14 19:29:08 2020 kern.warn kernel: [ 2539.120581] ath10k_ahb a800000.wifi: bss channel survey timed out
[ 2542.160640] ath10k_ahb a800000.wifi: wmi command 36892 timeout, restarting hardware
[ 2542.160700] ath10k_ahb a800000.wifi: failed to set dtim period for vdev 0: -11
Thu May 14 19:29:11 2020 kern.warn kernel: [ 2542.160640] ath10k_ahb a800000.wifi: wmi command 36892 timeout, restarting hardware
Thu May 14 19:29:11 2020 kern.warn kernel: [ 2542.160700] ath10k_ahb a800000.wifi: failed to set dtim period for vdev 0: -11
[ 2545.200593] ath10k_ahb a800000.wifi: wmi command 40859 timeout, restarting hardware
[ 2545.200638] ath10k_ahb a800000.wifi: failed to send wmi nop: -11
[ 2545.209636] ath10k_ahb a800000.wifi: failed to recalculate rts/cts prot for vdev 0: -108
[ 2545.213377] ath10k_ahb a800000.wifi: failed to set cts protection for vdev 0: -108
[ 2545.221549] ath10k_ahb a800000.wifi: failed to set preamble for vdev 0: -108
[ 2545.228789] ath10k_ahb a800000.wifi: failed to set mgmt tx rate -108
[ 2545.236060] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c99bfe00 vdev: 0 addr: 04:f0:21:01:0f:a2
[ 2545.242361] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c99bea00 vdev: 0 addr: 04:f0:21:c9:8b:a2
[ 2545.253217] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c99be800 vdev: 0 addr: 04:ed:33:dc:1e:30
[ 2545.264153] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c99bf000 vdev: 0 addr: 04:f0:21:8d:4a:a2
[ 2545.275072] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c8002800 vdev: 0 addr: 5c:80:b6:83:13:03
[ 2545.286016] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer ce738000 vdev: 0 addr: 04:f0:21:7d:fb:a2
[ 2545.296960] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer ce1ec600 vdev: 0 addr: 24:f5:a2:08:21:6d
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.200593] ath10k_ahb a800000.wifi: wmi command 40859 timeout, restarting hardware
hu May 14 19:29:14 2020 kern.warn kernel: [ 2545.200638] ath10k_ahb a800000.wifi: failed to send wmi nop: -11
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.209636] ath10k_ahb a800000.wifi: failed to recalculate rts/cts prot for vdev 0:[ 2545.3204
25] ath10k_ahb a800000.wifi: failed to read hi_board_data address: -16

Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.213377] ath10k_ahb a800000.wifi: failed to set cts protection for vdev 0: -108
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.221549] ath10k_ahb a800000.wifi: failed to set preamble for vdev 0: -108
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.228789] ath10k_ahb a800000.wifi: failed to set mgmt tx rate -108
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.236060] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c99bfe00 vdev:
  0 addr: 04:f0:21:01:0f:a2
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.242361] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c99bea00 vdev:
  0 addr: 04:f0:21:c9:8b:a2
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.253217] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c99be800 vdev:
  0 addr: 04:ed:33:dc:1e:30
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.264153] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c99bf000 vdev:
  0 addr: 04:f0:21:8d:4a:a2
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.275072] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer c8002800 vdev:
  0 addr: 5c:80:b6:83:13:03
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.286016] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer ce738000 vdev:
  0 addr: 04:f0:21:7d:fb:a2
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.296960] ath10k_ahb a800000.wifi: removing peer, cleanup-all, deleting: peer ce1ec600 vdev:
  0 addr: 24:f5:a2:08:21:6d
Thu May 14 19:29:14 2020 kern.warn kernel: [ 2545.320425] ath10k_ahb a800000.wifi: failed to read hi_board_data address: -16
Thu May 14 19:29:14 2020 kern.info kernel: [ 2545.359831] ieee80211 phy2: Hardware restart was requested[ 2545.370652] ath10k_ahb a800000.wi
fi: failed to halt axi bus: 0

Thu May 14 19:29:14 2020 kern.err kernel: [ 2545.370652] ath10k_ahb a800000.wifi: failed to halt axi bus: 0
[ 2548.661207] ath10k_ahb a800000.wifi: failed to receive initialized event from target: 80000000
[ 2548.671340] ath10k_ahb a800000.wifi: failed to halt axi bus: 0
Thu May 14 19:29:17 2020 kern.err kernel: [ 2548.661207] ath10k_ahb a800000.wifi: failed to receive initialized event from target: 80000000
Thu May 14 19:29:17 2020 kern.err kernel: [ 2548.671340] ath10k_ahb a800000.wifi: failed to halt axi bus: 0
[ 2548.840677] ath10k_ahb a800000.wifi: failed to reset chip: -110
[ 2548.840716] ath10k_ahb a800000.wifi: Could not init hif: -110
[ 2548.845695] ------------[ cut here ]------------
[ 2548.851832] WARNING: CPU: 3 PID: 98 at backports-4.19.98-1/net/mac80211/util.c:2040 ieee80211_reconfig+0x98/0xb64 [mac80211]
[ 2548.856020] Hardware became unavailable during restart.


....

And endless -108 errors and other funk after this.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
