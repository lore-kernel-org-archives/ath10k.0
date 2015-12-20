Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAjP9-0001cM-7t
 for ath10k@lists.infradead.org; Sun, 20 Dec 2015 19:12:27 +0000
Received: by mail-io0-x241.google.com with SMTP id f127so8643173ioa.0
 for <ath10k@lists.infradead.org>; Sun, 20 Dec 2015 11:12:06 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 20 Dec 2015 14:12:06 -0500
Message-ID: <CALGY4ftVUReiT-USxFWK3TKt5iLtTf7eWovEy=wvs_nYQWe9xQ@mail.gmail.com>
Subject: QCA9377 constantly deauthenticating from 802.11ac access point
From: Nikolay Martynov <mar.kolya@gmail.com>
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
To: ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>

Hi.

  I've got lenovo laptop with QCA9377 (chip_id: 0x003820ff). It
connects to TP-Link Archer C7 v2 AP (QCA9558), running OpenWRT.

On client I run Ubuntu 14.04 with 4.2.0 kernel and latest backports.
It connect just fine, but disconnects after about 1 minute with this message:

Dec 20 01:10:13 wpa_supplicant[7245]: nl80211: Ignored event (cmd=20)
for foreign interface (ifindex 4 wdev 0x0)
Dec 20 01:10:13 wpa_supplicant[7245]: nl80211: Drv Event 20
(NL80211_CMD_DEL_STATION) received for wlan0
Dec 20 01:10:13 wpa_supplicant[7245]: nl80211: Delete station xx:xx:xx:xx:xx:xx
Dec 20 01:10:13 kernel: [ 7107.316037] wlan0: deauthenticating from
xx:xx:xx:xx:xx:xx by local choice (Reason: 3=DEAUTH_LEAVING)

And then it keeps connecting and disconnecting. While it is connected
bandwidth is quite good and no errors seem to be happening, but then
connection drops for no obvious reason.

It looks like it doesn't do this when I switch AP to 802.11n mode.

Is this a known issue?
If not, what would be the best way to debug this? Is there any way to
get more information on why it decided to delete this station?

Thanks.

-- 
Martynov Nikolay.
Email: mar.kolya@gmail.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
