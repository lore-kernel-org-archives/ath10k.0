Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sender154-mail.zoho.com ([74.201.84.154])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btiRZ-0004nD-7C
 for ath10k@lists.infradead.org; Mon, 10 Oct 2016 21:49:09 +0000
Date: Tue, 11 Oct 2016 03:18:45 +0530
From: Ganesh Prasadh <ganesh.prasadh@benisontech.com>
Message-ID: <157b091c512.125a65bb182085.3943001228768542021@benisontech.com>
In-Reply-To: <157af274632.1170eebe868525.381450764074187293@benisontech.com>
References: <157af274632.1170eebe868525.381450764074187293@benisontech.com>
Subject: QCA988x:ath10K in STA mode: Probe_Req() frame is NOT sent over the
 air, when the device is NOT set to scan_mode
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
To: ath10k <ath10k@lists.infradead.org>

 > Hi,
 > We are using QCA988x:ath10K driver + OpenWRT 14.x platform and have an issue in sending Probe_Req() out in the air.
 > 
 > 
 > In STA mode Probe_Req() frame is NOT sent over the air, when the device is NOT set to scan_mode. Its simply brought up and using the info from another device's scan list.
 > It looks the firmware is NOT sending this frame and its discarded.
 > 
 > I wish to know what is ath10k firmware's behavior in sending Probe_Request() frame when its NOT in scan_mode.
 > 
 > 
 > Note:
 > - But when I change the code to send Authentication() frame, it goes out and my STA connects to AP
 > - when I trigger manually 'iwlist scan' it sends Probe_Req() in all channels, that was confirmed by capturing packets in wireshark, Broadcast frames are sent in the air
 >
 > Thanks!




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
