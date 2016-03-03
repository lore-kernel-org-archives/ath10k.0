Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1abLDL-0007QU-FZ
 for ath10k@lists.infradead.org; Thu, 03 Mar 2016 04:50:15 +0000
Message-ID: <56D7B511.3040406@candelatech.com>
Date: Wed, 02 Mar 2016 19:52:49 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Bug report for ath10k and scanning many ssids.
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

There is a bug in at least 10.1 ath10k firmware where the scan machine
cannot send more than 5 or so probe requests due to running out of firmware
management buffers..  Stock firmware is not smart enough to
wait a bit and send them later.  To reproduce, use a supplicant file like
this (below).  Maybe there is a way to work around it in the driver, but probably
better to just fix the firmware...  A quick glance at 10.4 firmware makes
me think the bug is very likely there as well.

Thanks,
Ben


ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=0
eapol_version=1
ap_scan=1
country=US
autoscan=periodic:10

network={
ssid="nonexist1"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="nonexist2"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="nonexist3"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="nonexist4"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="nonexist5"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="nonexist6"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="nonexist7"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="nonexist8"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="nonexist9"
scan_ssid=1
key_mgmt=NONE
}

network={
ssid="dd-wrt-ath1"
scan_ssid=1
key_mgmt=NONE
}


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
